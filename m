Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CAF43BFB6
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D0B1702;
	Wed, 27 Oct 2021 04:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D0B1702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635301388;
	bh=t2a8BQlgxdNXNLgJ41NuZk6h/NmNCSkp9EPVumYSNs0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYucoPUROLJCJmf5xsRcoGMytD+c2PlwHVxfVPVHVAU6kRwGB5aHbAxPY40o+/rvA
	 UU0yYsc0SWj+ZOstctCi8/xZJ9Kh1Y8W5kWAKUGNGUZ0WwXQVIEJ4CxWJYpc+UeUBJ
	 ZBT8PnM+ND6N+0yk5bJOdkf5R2auw+8zoxmdRJBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A655F8051C;
	Wed, 27 Oct 2021 04:19:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B624F80517; Wed, 27 Oct 2021 04:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F936F80271
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F936F80271
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217229421"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217229421"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="486446322"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 09/10] ASoC: intel: sof_sdw: remove get_next_be_id
Date: Wed, 27 Oct 2021 10:18:23 +0800
Message-Id: <20211027021824.24776-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
References: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DAI link id will not be set from sdw codec init feedback function,
and be_id is changed by create_sdw_dailink() now. So we don't need
get_next_be_id() anymore.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2adadcf554ff..d9321fff4284 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -975,17 +975,6 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	return 0;
 }
 
-/*
- * DAI link ID of SSP & DMIC & HDMI are based on last
- * link ID used by sdw link. Since be_id may be changed
- * in init func of sdw codec, it is not equal to be_id
- */
-static inline int get_next_be_id(struct snd_soc_dai_link *links,
-				 int be_id)
-{
-	return links[be_id - 1].id + 1;
-}
-
 #define IDISP_CODEC_MASK	0x4
 
 static int sof_card_codec_conf_alloc(struct device *dev,
@@ -1154,9 +1143,6 @@ static int sof_card_dai_links_create(struct device *dev,
 		}
 	}
 
-	/* get BE ID for non-sdw DAI */
-	be_id = get_next_be_id(links, link_index);
-
 SSP:
 	/* SSP */
 	if (!ssp_num)
-- 
2.17.1


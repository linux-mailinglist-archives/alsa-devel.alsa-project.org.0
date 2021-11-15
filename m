Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6792450469
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:27:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 505F216AC;
	Mon, 15 Nov 2021 13:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 505F216AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636979253;
	bh=yb9AxKn69H9AcnxRt95CuqOPMBxupDhIhzXIU5/J64I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvg0S1B76bi8IOuceJu4LTQ+VGjqgaj8da2kv+z9y7k1rtequCmyNS3aHGpx/Wwla
	 E3ItpKEJieFEbKtE3QRVzqkjX3a/nlD8EtjiBQx1yxXfcUSa1eNWkfRT+NoQuVP//y
	 mgsL13eG3NZDGpSMvL9h/MgQY9R0lzX075aWb59U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12304F8052E;
	Mon, 15 Nov 2021 13:23:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16458F8051D; Mon, 15 Nov 2021 13:23:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8187F804FB
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:23:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8187F804FB
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220639146"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="220639146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:23:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505899132"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:23:07 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [RESEND PATCH 09/10] ASoC: intel: sof_sdw: remove get_next_be_id
Date: Mon, 15 Nov 2021 20:22:40 +0800
Message-Id: <20211115122241.13242-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
References: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
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
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index aac493aea002..df29f7b478a4 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1044,17 +1044,6 @@ static int create_sdw_dailink(struct snd_soc_card *card,
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
@@ -1223,9 +1212,6 @@ static int sof_card_dai_links_create(struct device *dev,
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


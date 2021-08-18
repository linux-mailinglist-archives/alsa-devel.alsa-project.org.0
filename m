Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C43C33EFE80
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 09:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C2AB1683;
	Wed, 18 Aug 2021 09:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C2AB1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629273586;
	bh=fDNoLYcoi2/PQS35nlNdTIE2PjLVRl8lf2i94rpQ06o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vm54LyUosJ+xLdQEQ7aBIaK4K9aVvViwXI4GcD0B4riOIESX0MRibtY+5NfWG8GHy
	 Pv/LSUDh2nStVqwSoNKVPTjz1848PK4ffbvOmby5+QEDW3+nYScmZd7OifGfWK/kTe
	 RI7DmUFJl4t1IZidqAogK/3u6pGxQDn/sY1che6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE992F8051B;
	Wed, 18 Aug 2021 09:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10699F8052D; Wed, 18 Aug 2021 09:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD19AF8051B
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD19AF8051B
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195855591"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195855591"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676975025"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 00:55:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] ASoC: Intel: Skylake: Select first entry for singular
 pipe config arrays
Date: Wed, 18 Aug 2021 09:57:42 +0200
Message-Id: <20210818075742.1515155-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, jairaj.arava@intel.com,
 upstream@semihalf.com, harshapriya.n@intel.com, cujomalainey@google.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, jenny.tc@intel.com, lma@semihalf.com,
 vamshi.krishna.gopal@intel.com
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

When pipe does not expose multiple configuration options, always select
the first entry without searching for matching one.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 04fbf83f3835..b036852d6889 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -640,8 +640,9 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
 		return 0;
 	}
 
-	if (pipe->conn_type == SKL_PIPE_CONN_TYPE_NONE) {
-		dev_dbg(skl->dev, "No conn_type detected, take 0th config\n");
+	if (pipe->conn_type == SKL_PIPE_CONN_TYPE_NONE || pipe->nr_cfgs == 1) {
+		dev_dbg(skl->dev, "No conn_type or just 1 pathcfg, taking 0th for %d\n",
+			pipe->ppl_id);
 		pipe->cur_config_idx = 0;
 		pipe->memory_pages = pconfig->mem_pages;
 
-- 
2.25.1


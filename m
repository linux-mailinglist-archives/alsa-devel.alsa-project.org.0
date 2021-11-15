Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528FE45045E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:25:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29DE16AB;
	Mon, 15 Nov 2021 13:25:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29DE16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636979150;
	bh=2gsXCqhbdEAs3a4xzEcdMWqnc5dI8ruW11gxmmKJRxc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rT9s+0A8fySizqxI9/2dwPYJMOmmaJ7otOQaCNS6nv8NwZchh7qVEfbdwvKwIJZMo
	 1g24Van3cP/iSC4Pa6rJ+1m8kZ6EsyhNHINuMb/8fE9oa3J9A0gUBGUSM2XuterJxP
	 K6tolyOADSnxYvMOMLXWRL7FHgZUEQBXz47zV8ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44350F80510;
	Mon, 15 Nov 2021 13:23:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAABEF804FF; Mon, 15 Nov 2021 13:23:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C26EBF8028B
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:23:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C26EBF8028B
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220639132"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="220639132"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:22:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505899084"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:22:58 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [RESEND PATCH 04/10] ASoC: intel: sof_sdw: rename be_index/link_id to
 link_index
Date: Mon, 15 Nov 2021 20:22:35 +0800
Message-Id: <20211115122241.13242-5-yung-chuan.liao@linux.intel.com>
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

The link_id variable in sof_card_dai_links_create() and be_index argument
in create_sdw_dailink() is actually links' index. Rename them to link_index
to be consistent.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 48 +++++++++++++++++---------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1c6c22cb7cab..2492cd3556a8 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -899,7 +899,7 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 }
 
 static int create_sdw_dailink(struct snd_soc_card *card,
-			      struct device *dev, int *be_index,
+			      struct device *dev, int *link_index,
 			      struct snd_soc_dai_link *dai_links,
 			      int sdw_be_num, int sdw_cpu_dai_num,
 			      struct snd_soc_dai_link_component *cpus,
@@ -1002,8 +1002,12 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			cpus[cpu_dai_index++].dai_name = cpu_name;
 		}
 
-		if (*be_index >= sdw_be_num) {
-			dev_err(dev, " invalid be dai index %d", *be_index);
+		/*
+		 * We create sdw dai links at first stage, so link index should
+		 * not be larger than sdw_be_num
+		 */
+		if (*link_index >= sdw_be_num) {
+			dev_err(dev, "invalid dai link index %d", *link_index);
 			return -EINVAL;
 		}
 
@@ -1014,18 +1018,19 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
-		init_dai_link(dev, dai_links + *be_index, *be_index, name,
+		init_dai_link(dev, dai_links + *link_index, *link_index, name,
 			      playback, capture,
 			      cpus + *cpu_id, cpu_dai_num,
 			      codecs, codec_num,
 			      NULL, &sdw_ops);
+
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
 		 * based on wait_for_completion(), tag them as 'nonatomic'.
 		 */
-		dai_links[*be_index].nonatomic = true;
+		dai_links[*link_index].nonatomic = true;
 
-		ret = set_codec_init_func(card, link, dai_links + (*be_index)++,
+		ret = set_codec_init_func(card, link, dai_links + (*link_index)++,
 					  playback, group_id);
 		if (ret < 0) {
 			dev_err(dev, "failed to init codec %d", codec_index);
@@ -1106,7 +1111,7 @@ static int sof_card_dai_links_create(struct device *dev,
 	bool group_generated[SDW_MAX_GROUPS];
 	int ssp_codec_index, ssp_mask;
 	struct snd_soc_dai_link *links;
-	int num_links, link_id = 0;
+	int num_links, link_index = 0;
 	char *name, *cpu_name;
 	int total_cpu_dai_num;
 	int sdw_cpu_dai_num;
@@ -1206,23 +1211,20 @@ static int sof_card_dai_links_create(struct device *dev,
 		    group_generated[endpoint->group_id])
 			continue;
 
-		ret = create_sdw_dailink(card, dev, &be_id, links, sdw_be_num,
+		ret = create_sdw_dailink(card, dev, &link_index, links, sdw_be_num,
 					 sdw_cpu_dai_num, cpus, adr_link,
 					 &cpu_id, group_generated,
 					 codec_conf, codec_conf_count,
 					 &codec_conf_index,
 					 &ignore_pch_dmic);
 		if (ret < 0) {
-			dev_err(dev, "failed to create dai link %d", be_id);
+			dev_err(dev, "failed to create dai link %d", link_index);
 			return ret;
 		}
 	}
 
-	/* non-sdw DAI follows sdw DAI */
-	link_id = be_id;
-
 	/* get BE ID for non-sdw DAI */
-	be_id = get_next_be_id(links, be_id);
+	be_id = get_next_be_id(links, link_index);
 
 SSP:
 	/* SSP */
@@ -1263,17 +1265,17 @@ static int sof_card_dai_links_create(struct device *dev,
 
 		playback = info->direction[SNDRV_PCM_STREAM_PLAYBACK];
 		capture = info->direction[SNDRV_PCM_STREAM_CAPTURE];
-		init_dai_link(dev, links + link_id, be_id, name,
+		init_dai_link(dev, links + link_index, be_id, name,
 			      playback, capture,
 			      cpus + cpu_id, 1,
 			      ssp_components, 1,
 			      NULL, info->ops);
 
-		ret = info->init(card, NULL, links + link_id, info, 0);
+		ret = info->init(card, NULL, links + link_index, info, 0);
 		if (ret < 0)
 			return ret;
 
-		INC_ID(be_id, cpu_id, link_id);
+		INC_ID(be_id, cpu_id, link_index);
 	}
 
 DMIC:
@@ -1284,21 +1286,21 @@ static int sof_card_dai_links_create(struct device *dev,
 			goto HDMI;
 		}
 		cpus[cpu_id].dai_name = "DMIC01 Pin";
-		init_dai_link(dev, links + link_id, be_id, "dmic01",
+		init_dai_link(dev, links + link_index, be_id, "dmic01",
 			      0, 1, // DMIC only supports capture
 			      cpus + cpu_id, 1,
 			      dmic_component, 1,
 			      sof_sdw_dmic_init, NULL);
-		INC_ID(be_id, cpu_id, link_id);
+		INC_ID(be_id, cpu_id, link_index);
 
 		cpus[cpu_id].dai_name = "DMIC16k Pin";
-		init_dai_link(dev, links + link_id, be_id, "dmic16k",
+		init_dai_link(dev, links + link_index, be_id, "dmic16k",
 			      0, 1, // DMIC only supports capture
 			      cpus + cpu_id, 1,
 			      dmic_component, 1,
 			      /* don't call sof_sdw_dmic_init() twice */
 			      NULL, NULL);
-		INC_ID(be_id, cpu_id, link_id);
+		INC_ID(be_id, cpu_id, link_index);
 	}
 
 HDMI:
@@ -1336,12 +1338,12 @@ static int sof_card_dai_links_create(struct device *dev,
 			return -ENOMEM;
 
 		cpus[cpu_id].dai_name = cpu_name;
-		init_dai_link(dev, links + link_id, be_id, name,
+		init_dai_link(dev, links + link_index, be_id, name,
 			      1, 0, // HDMI only supports playback
 			      cpus + cpu_id, 1,
 			      idisp_components + i, 1,
 			      sof_sdw_hdmi_init, NULL);
-		INC_ID(be_id, cpu_id, link_id);
+		INC_ID(be_id, cpu_id, link_index);
 	}
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
@@ -1365,7 +1367,7 @@ static int sof_card_dai_links_create(struct device *dev,
 			return -ENOMEM;
 
 		cpus[cpu_id].dai_name = cpu_name;
-		init_dai_link(dev, links + link_id, be_id, name, 1, 1,
+		init_dai_link(dev, links + link_index, be_id, name, 1, 1,
 				cpus + cpu_id, 1, ssp_components, 1, NULL, NULL);
 	}
 
-- 
2.17.1


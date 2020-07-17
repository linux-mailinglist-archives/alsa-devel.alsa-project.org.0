Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E32245C9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 23:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 593091670;
	Fri, 17 Jul 2020 23:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 593091670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595020776;
	bh=PeuyiZo/pfW/1vw7sUbhNn50kJa1cdAnYXzT34nzsXg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UD2sWXgOdv3VYmde2wupuU642ID1YXZ/z8hlwjQ9qiWuLSuUfwNU26ZBVu0eSBRP3
	 z5K2kaq/CAwPmGjinebuAq1eG2G0ipCCF+DkRx1oqbMYTQT/7Y+k/ucte5/37S7gSa
	 f8U2aopipKPnGv1vx1uZi4D5c5YGkJ0HYASZuvE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F42F80217;
	Fri, 17 Jul 2020 23:16:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01816F8014E; Fri, 17 Jul 2020 23:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBEE0F8014E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 23:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBEE0F8014E
IronPort-SDR: RrDuSmfJiq3dxbZSe+ll5U51mt5AFGPp/UIPlY6sn/m5cmjA8DyCibFoYZT6yuac2vgOtnZ9hx
 dkIP1h0OH5pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="129758209"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="129758209"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:50 -0700
IronPort-SDR: 0P0sylx2U2INC2+eNRYwkeZhwHrkA59aY5pvbzcuqbeAiWmz69sPZ45NOrB0aGNZZaISdtq7+H
 ddjvLg0GwxWA==
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="282905786"
Received: from toddjdav-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.240])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: Intel: sof_sdw: add support for systems without
 i915 audio
Date: Fri, 17 Jul 2020 16:13:34 -0500
Message-Id: <20200717211337.31956-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
References: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Extend the generic SOF Soundwire machine driver to support systems where
iDisp HDMI/DP audio codec is disabled for some reason (i915 driver
disabled, HDMI/DP implemented with a discrete GPU, etc). Switch codecs
to SoC dummy in the affected DAI links. This allows to reuse existing
topologies for this case.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 30 ++++++++++++++++---------
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 sound/soc/intel/boards/sof_sdw_hdmi.c   |  3 +++
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9b6059905dbe..2463d432bf4d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -699,11 +699,14 @@ static inline int get_next_be_id(struct snd_soc_dai_link *links,
 	return links[be_id - 1].id + 1;
 }
 
+#define IDISP_CODEC_MASK	0x4
+
 static int sof_card_dai_links_create(struct device *dev,
 				     struct snd_soc_acpi_mach *mach,
 				     struct snd_soc_card *card)
 {
 	int ssp_num, sdw_be_num = 0, hdmi_num = 0, dmic_num;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *ssp_components;
 	struct snd_soc_acpi_mach_params *mach_params;
@@ -747,12 +750,15 @@ static int sof_card_dai_links_create(struct device *dev,
 		return ret;
 	}
 
+	if (mach_params->codec_mask & IDISP_CODEC_MASK)
+		ctx->idisp_codec = true;
+
 	/* enable dmic01 & dmic16k */
 	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC) ? 2 : 0;
 	comp_num += dmic_num;
 
 	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d", sdw_be_num, ssp_num,
-		dmic_num, hdmi_num);
+		dmic_num, ctx->idisp_codec ? hdmi_num : 0);
 
 	/* allocate BE dailinks */
 	num_links = comp_num + sdw_be_num;
@@ -901,13 +907,18 @@ static int sof_card_dai_links_create(struct device *dev,
 		if (!name)
 			return -ENOMEM;
 
-		idisp_components[i].name = "ehdaudio0D2";
-		idisp_components[i].dai_name = devm_kasprintf(dev,
-							      GFP_KERNEL,
-							      "intel-hdmi-hifi%d",
-							      i + 1);
-		if (!idisp_components[i].dai_name)
-			return -ENOMEM;
+		if (ctx->idisp_codec) {
+			idisp_components[i].name = "ehdaudio0D2";
+			idisp_components[i].dai_name = devm_kasprintf(dev,
+								      GFP_KERNEL,
+								      "intel-hdmi-hifi%d",
+								      i + 1);
+			if (!idisp_components[i].dai_name)
+				return -ENOMEM;
+		} else {
+			idisp_components[i].name = "snd-soc-dummy";
+			idisp_components[i].dai_name = "snd-soc-dummy-dai";
+		}
 
 		cpu_name = devm_kasprintf(dev, GFP_KERNEL,
 					  "iDisp%d Pin", i + 1);
@@ -982,6 +993,7 @@ static int mc_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	card->dev = &pdev->dev;
+	snd_soc_card_set_drvdata(card, ctx);
 
 	mach = pdev->dev.platform_data;
 	ret = sof_card_dai_links_create(&pdev->dev, mach,
@@ -991,8 +1003,6 @@ static int mc_probe(struct platform_device *pdev)
 
 	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
 
-	snd_soc_card_set_drvdata(card, ctx);
-
 	/*
 	 * the default amp_num is zero for each codec and
 	 * amp_num will only be increased for active amp
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index c64c5d801d26..12e32439ba46 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -70,6 +70,7 @@ struct sof_sdw_codec_info {
 struct mc_private {
 	struct list_head hdmi_pcm_list;
 	bool common_hdmi_codec_drv;
+	bool idisp_codec;
 	struct snd_soc_jack sdw_headset;
 };
 
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index 0654b38a7e0d..72316d34eed6 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -52,6 +52,9 @@ int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
 	int err, i = 0;
 	char jack_name[NAME_SIZE];
 
+	if (!ctx->idisp_codec)
+		return 0;
+
 	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
 			       head);
 	component = pcm->codec_dai->component;
-- 
2.25.1


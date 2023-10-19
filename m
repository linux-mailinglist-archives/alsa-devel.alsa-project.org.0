Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CC87D00C1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:38:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADA8836;
	Thu, 19 Oct 2023 19:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADA8836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697737081;
	bh=JmyZr48xxaLo0YGzXMrRWp/iCPGdwmbM+DUGgC6M7xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a79JlNmj1W6UUQRGprQQdHKC5QGO4POPT0ZwKTcQWjplUyULv4KTBIGqT4jRy70yH
	 xorOSc85DXquCuzA8zjuk0Cu+62xHIURdCVnBAdzEQc7ORwy2q8ZYN9pvue8Ii2JjY
	 0+ATV+S2STM9OdSA5Q8KgZA6lQVqPzIVcWN2Jt50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C2DBF8024E; Thu, 19 Oct 2023 19:37:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B43A9F8027B;
	Thu, 19 Oct 2023 19:37:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 312FDF8027B; Thu, 19 Oct 2023 19:37:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A479F80552
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A479F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jhG79i8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736875; x=1729272875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JmyZr48xxaLo0YGzXMrRWp/iCPGdwmbM+DUGgC6M7xA=;
  b=jhG79i8DaMZ3ca0ppHvDnCzvC4vnBFwCOLkISud4+wYd1AHufe/ns13S
   CFQarrgEDLaLVLRi+J9WfCo2UHXwfXZDQOONiL6kiXE30jSH9iHzfl0Ak
   lXpjk5xC8jQt/+RO/tJXAD5N8kf4m7EpW4EF+rFJEgPtPsfUinZs1kdKx
   oW5XFSoUSQLEiOSnMmrRxoojMCldhqXyrtpoYB8B3z46oLgfBcTpg/Clq
   ID1ZUmVH1+6G7CPbRS+Cd5PNhIzG5KU0NBUXox8YgCZHEWFCa3cwhAcHt
   mLI256qXuHexJ1OGniE0jZgPz6drGkIiMDlLgiwNx+/wTc4oXC8TMpIFZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884360"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884360"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090691"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090691"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/10] ASoC: Intel: sof_cs42l42: use common module for DMIC
 links
Date: Thu, 19 Oct 2023 12:34:08 -0500
Message-Id: <20231019173411.166759-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QKU6EMBOAECPSNL2SFKYUQOBFKZQDSKA
X-Message-ID-Hash: QKU6EMBOAECPSNL2SFKYUQOBFKZQDSKA
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKU6EMBOAECPSNL2SFKYUQOBFKZQDSKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module for dmic01 and dmic16k DAI link initialization.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 121 +++++++--------------------
 1 file changed, 32 insertions(+), 89 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 6c7d0c85f1a0..1f760fc4cab2 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -160,10 +160,6 @@ static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
-static const struct snd_soc_dapm_widget dmic_widgets[] = {
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-};
-
 static const struct snd_soc_dapm_route sof_map[] = {
 	/* HP jack connectors - unknown if we have jack detection */
 	{"Headphone Jack", NULL, "HP"},
@@ -172,33 +168,6 @@ static const struct snd_soc_dapm_route sof_map[] = {
 	{"HS", NULL, "Headset Mic"},
 };
 
-static const struct snd_soc_dapm_route dmic_map[] = {
-	/* digital mics */
-	{"DMic", NULL, "SoC DMIC"},
-};
-
-static int dmic_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	int ret;
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
-					ARRAY_SIZE(dmic_widgets));
-	if (ret) {
-		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
-		/* Don't need to add routes if widget addition failed */
-		return ret;
-	}
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
-				      ARRAY_SIZE(dmic_map));
-
-	if (ret)
-		dev_err(card->dev, "DMic map addition failed: %d\n", ret);
-
-	return ret;
-}
-
 /* sof audio machine driver for cs42l42 codec */
 static struct snd_soc_card sof_audio_card_cs42l42 = {
 	.name = "cs42l42", /* the sof- prefix is added by the core */
@@ -220,13 +189,6 @@ static struct snd_soc_dai_link_component cs42l42_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dmic_component[] = {
-	{
-		.name = "dmic-codec",
-		.dai_name = "dmic-hifi",
-	}
-};
-
 static int create_spk_amp_dai_links(struct device *dev,
 				    struct snd_soc_dai_link *links,
 				    struct snd_soc_dai_link_component *cpus,
@@ -322,47 +284,6 @@ static int create_hp_codec_dai_links(struct device *dev,
 	return -ENOMEM;
 }
 
-static int create_dmic_dai_links(struct device *dev,
-				 struct snd_soc_dai_link *links,
-				 struct snd_soc_dai_link_component *cpus,
-				 int *id, int dmic_be_num)
-{
-	int i;
-
-	/* dmic */
-	if (dmic_be_num <= 0)
-		return 0;
-
-	/* at least we have dmic01 */
-	links[*id].name = "dmic01";
-	links[*id].cpus = &cpus[*id];
-	links[*id].cpus->dai_name = "DMIC01 Pin";
-	links[*id].init = dmic_init;
-	if (dmic_be_num > 1) {
-		/* set up 2 BE links at most */
-		links[*id + 1].name = "dmic16k";
-		links[*id + 1].cpus = &cpus[*id + 1];
-		links[*id + 1].cpus->dai_name = "DMIC16k Pin";
-		dmic_be_num = 2;
-	}
-
-	for (i = 0; i < dmic_be_num; i++) {
-		links[*id].id = *id;
-		links[*id].num_cpus = 1;
-		links[*id].codecs = dmic_component;
-		links[*id].num_codecs = ARRAY_SIZE(dmic_component);
-		links[*id].platforms = platform_component;
-		links[*id].num_platforms = ARRAY_SIZE(platform_component);
-		links[*id].ignore_suspend = 1;
-		links[*id].dpcm_capture = 1;
-		links[*id].no_pcm = 1;
-
-		(*id)++;
-	}
-
-	return 0;
-}
-
 static int create_bt_offload_dai_links(struct device *dev,
 				       struct snd_soc_dai_link *links,
 				       struct snd_soc_dai_link_component *cpus,
@@ -446,11 +367,34 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			}
 			break;
 		case LINK_DMIC:
-			ret = create_dmic_dai_links(dev, links, cpus, &id, dmic_be_num);
-			if (ret < 0) {
-				dev_err(dev, "fail to create dmic dai links, ret %d\n",
-					ret);
-				goto devm_err;
+			if (dmic_be_num > 0) {
+				/* at least we have dmic01 */
+				ret = sof_intel_board_set_dmic_link(dev,
+								    &links[id],
+								    id,
+								    SOF_DMIC_01);
+				if (ret) {
+					dev_err(dev, "fail to create dmic01 link, ret %d\n",
+						ret);
+					goto devm_err;
+				}
+
+				id++;
+			}
+
+			if (dmic_be_num > 1) {
+				/* set up 2 BE links at most */
+				ret = sof_intel_board_set_dmic_link(dev,
+								    &links[id],
+								    id,
+								    SOF_DMIC_16K);
+				if (ret) {
+					dev_err(dev, "fail to create dmic16k link, ret %d\n",
+						ret);
+					goto devm_err;
+				}
+
+				id++;
 			}
 			break;
 		case LINK_HDMI:
@@ -496,7 +440,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int dmic_be_num;
 	int ret, ssp_bt, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -510,10 +453,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
 
 	if (soc_intel_is_glk()) {
-		dmic_be_num = 1;
+		ctx->dmic_be_num = 1;
 		ctx->hdmi_num = 3;
 	} else {
-		dmic_be_num = 2;
+		ctx->dmic_be_num = 2;
 		ctx->hdmi_num = (sof_cs42l42_quirk & SOF_CS42L42_NUM_HDMIDEV_MASK) >>
 			 SOF_CS42L42_NUM_HDMIDEV_SHIFT;
 		/* default number of HDMI DAI's */
@@ -535,7 +478,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
-	sof_audio_card_cs42l42.num_links = 1 + dmic_be_num + ctx->hdmi_num;
+	sof_audio_card_cs42l42.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_cs42l42.num_links++;
@@ -544,7 +487,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
 					      ssp_codec, ssp_amp, ssp_bt,
-					      dmic_be_num, ctx->hdmi_num,
+					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
-- 
2.39.2


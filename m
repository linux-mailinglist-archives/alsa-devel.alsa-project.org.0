Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B35DE7D00C8
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1476CA4B;
	Thu, 19 Oct 2023 19:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1476CA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697737117;
	bh=zGGP93Orvj8T3+JJztvqW239On7FSYEnBF7CPHLskpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fyZq130hYBncQkGCmfYhLC7PG/Tp7kNFXwS8KyQi96uYcXNbR+ofM6K6ZHPOKMN1W
	 BWj0P7zkWi40XMNEsXGekrY4/z3y1yxHsxWjVqjbjYPB8MSNZh861KS7E428ug1HlR
	 B2J42xPxC2LOpGWT9pZljW8EQSUMLBE0UsrIzCQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1237AF8057A; Thu, 19 Oct 2023 19:37:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98092F8057A;
	Thu, 19 Oct 2023 19:37:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1489F80564; Thu, 19 Oct 2023 19:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 437A3F800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 437A3F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QNMkzVjR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736877; x=1729272877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zGGP93Orvj8T3+JJztvqW239On7FSYEnBF7CPHLskpM=;
  b=QNMkzVjRgUFFNFb05pwVxCUeH1WQyOoQY56M8Go+k4sJAN9+wfftmW7e
   Ijw4qFiOUa1CrjTyBqmDzcMN9qNwyaQMcKGSWwcxI6aIAUB7kHugJ7qvH
   UGjniY5m0GSXHSSk3rocYGWBjnDc4rVyFZfuPX2C/xmV1xTxJevpb4AOD
   BeaDmbYHkjYdMTFkg0gnmgB2ObLiD713wIJ0OpV/P5ixTrthoQw36R1GW
   w9Hsq7+sOFQ+sNIrL3ronk1lFHqk2n/fVFhFmx8iWFWMIPGE/9LymLE/w
   wY8jv0rz6PPIEy91Np2NJz6kZDGNvsNk6pkv3L02C4dbhptHONSB6Vs4w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884377"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884377"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090727"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090727"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/10] ASoC: Intel: sof_rt5682: use common module for DMIC
 links
Date: Thu, 19 Oct 2023 12:34:10 -0500
Message-Id: <20231019173411.166759-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P4SISW54MS7SG2JZL6NOOZQTHB23R4Z4
X-Message-ID-Hash: P4SISW54MS7SG2JZL6NOOZQTHB23R4Z4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4SISW54MS7SG2JZL6NOOZQTHB23R4Z4/>
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
 sound/soc/intel/boards/sof_rt5682.c | 81 ++++++-----------------------
 1 file changed, 17 insertions(+), 64 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 1e90dff61b9b..06ad15af46de 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -503,10 +503,6 @@ static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
-static const struct snd_soc_dapm_widget dmic_widgets[] = {
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-};
-
 static const struct snd_soc_dapm_route sof_map[] = {
 	/* HP jack connectors - unknown if we have jack detection */
 	{ "Headphone Jack", NULL, "HPOL" },
@@ -522,11 +518,6 @@ static const struct snd_soc_dapm_route rt5650_spk_dapm_routes[] = {
 	{ "Right Spk", NULL, "SPOR" },
 };
 
-static const struct snd_soc_dapm_route dmic_map[] = {
-	/* digital mics */
-	{"DMic", NULL, "SoC DMIC"},
-};
-
 static int rt5650_spk_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -540,28 +531,6 @@ static int rt5650_spk_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
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
 /* sof audio machine driver for rt5682 codec */
 static struct snd_soc_card sof_audio_card_rt5682 = {
 	.name = "rt5682", /* the sof- prefix is added by the core */
@@ -601,13 +570,6 @@ static struct snd_soc_dai_link_component rt5650_components[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dmic_component[] = {
-	{
-		.name = "dmic-codec",
-		.dai_name = "dmic-hifi",
-	}
-};
-
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 			  enum sof_ssp_codec amp_type, int ssp_codec,
@@ -692,29 +654,21 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 	/* dmic */
 	if (dmic_be_num > 0) {
 		/* at least we have dmic01 */
-		links[id].name = "dmic01";
-		links[id].cpus = &cpus[id];
-		links[id].cpus->dai_name = "DMIC01 Pin";
-		links[id].init = dmic_init;
-		if (dmic_be_num > 1) {
-			/* set up 2 BE links at most */
-			links[id + 1].name = "dmic16k";
-			links[id + 1].cpus = &cpus[id + 1];
-			links[id + 1].cpus->dai_name = "DMIC16k Pin";
-			dmic_be_num = 2;
-		}
+		ret = sof_intel_board_set_dmic_link(dev, &links[id], id,
+						    SOF_DMIC_01);
+		if (ret)
+			return NULL;
+
+		id++;
 	}
 
-	for (i = 0; i < dmic_be_num; i++) {
-		links[id].id = id;
-		links[id].num_cpus = 1;
-		links[id].codecs = dmic_component;
-		links[id].num_codecs = ARRAY_SIZE(dmic_component);
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
-		links[id].no_pcm = 1;
+	if (dmic_be_num > 1) {
+		/* set up 2 BE links at most */
+		ret = sof_intel_board_set_dmic_link(dev, &links[id], id,
+						    SOF_DMIC_16K);
+		if (ret)
+			return NULL;
+
 		id++;
 	}
 
@@ -865,7 +819,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int dmic_be_num;
 	int ret, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -891,7 +844,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		ctx->rt5682.is_legacy_cpu = true;
-		dmic_be_num = 0;
+		ctx->dmic_be_num = 0;
 		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
 		ctx->hdmi_num = 0;
 		/* default quirk for legacy cpu */
@@ -899,7 +852,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 						SOF_RT5682_MCLK_BYTCHT_EN |
 						SOF_RT5682_SSP_CODEC(2);
 	} else {
-		dmic_be_num = 2;
+		ctx->dmic_be_num = 2;
 		ctx->hdmi_num = (sof_rt5682_quirk & SOF_RT5682_NUM_HDMIDEV_MASK) >>
 			 SOF_RT5682_NUM_HDMIDEV_SHIFT;
 		/* default number of HDMI DAI's */
@@ -938,7 +891,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
-	sof_audio_card_rt5682.num_links = 1 + dmic_be_num + ctx->hdmi_num;
+	sof_audio_card_rt5682.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_rt5682.num_links++;
@@ -953,7 +906,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->codec_type,
 					      ctx->amp_type, ssp_codec, ssp_amp,
-					      dmic_be_num, ctx->hdmi_num,
+					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec,
 					      ctx->rt5682.is_legacy_cpu);
 	if (!dai_links)
-- 
2.39.2


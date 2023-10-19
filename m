Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E307D00C7
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A24E74;
	Thu, 19 Oct 2023 19:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A24E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697737094;
	bh=JMa/CWDDdiHnjwkD6waLsYMN0ihwsKHRqgcNKLNcQ00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+aUyDMLoLAJ2lCN8PBfot9YsCma10Q4R4Pe5S28tAC5OqFFci3kSpMu7eZKfZ1Rl
	 Qe/MCWe+OJdcz0J4aJldp076mfP3NBCnwBf1j5Qn5GJI1EL4Q8NuZR+SLVoYdmg9VK
	 +Boao8fRaS25JZF5Ng9FFpXCparT2gVzNvdSSRrc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0ED4F80578; Thu, 19 Oct 2023 19:37:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C97F800C9;
	Thu, 19 Oct 2023 19:37:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC729F8027B; Thu, 19 Oct 2023 19:37:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A6A1F80553
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A6A1F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d8WtZSBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736875; x=1729272875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JMa/CWDDdiHnjwkD6waLsYMN0ihwsKHRqgcNKLNcQ00=;
  b=d8WtZSBAqQy7pReZBCTzokBGwivTog/7zYOusvmf/q7SqB+W/ArnS29S
   BPuQ8lf63rVuBrkpnDDxqmNBrnxwD3BcLHNIZne+iooT4ZqCt5aMlFFnO
   RStsq8YqLywn49acy+FqeUR8B44NH/BQhQGXE9XCwRyBNZ9FZAxzTE8Mf
   koNlpePmDLW/FyWPmQIQ/x2TE7hsiz0+MFB2d0QJ1AveipvkL2KwsSVJf
   nLTf7dvMIc8CF1FLymfQFkQ6QPUczT8ZKZLKk2rY3RKTAPRTwEHg+Qx1I
   CpcRSQpoqjAa1SAe7mG6vc69+hPG7/CHiOlwVkld1pc31RKdx1d5SfMIB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884369"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090711"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090711"
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
Subject: [PATCH 08/10] ASoC: Intel: sof_nau8825: use common module for DMIC
 links
Date: Thu, 19 Oct 2023 12:34:09 -0500
Message-Id: <20231019173411.166759-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MI5AQLFL4YBIQNH6DHPSOTTK2XEXDZ47
X-Message-ID-Hash: MI5AQLFL4YBIQNH6DHPSOTTK2XEXDZ47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MI5AQLFL4YBIQNH6DHPSOTTK2XEXDZ47/>
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
 sound/soc/intel/boards/sof_nau8825.c | 81 ++++++----------------------
 1 file changed, 17 insertions(+), 64 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 44f5c359ae95..dc2821a012d4 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -177,10 +177,6 @@ static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
-static const struct snd_soc_dapm_widget dmic_widgets[] = {
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-};
-
 static const struct snd_soc_dapm_route sof_map[] = {
 	/* HP jack connectors - unknown if we have jack detection */
 	{ "Headphone Jack", NULL, "HPOL" },
@@ -190,33 +186,6 @@ static const struct snd_soc_dapm_route sof_map[] = {
 	{ "MIC", NULL, "Headset Mic" },
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
 /* sof audio machine driver for nau8825 codec */
 static struct snd_soc_card sof_audio_card_nau8825 = {
 	.name = "nau8825", /* the sof- prefix is added by the core */
@@ -238,13 +207,6 @@ static struct snd_soc_dai_link_component nau8825_component[] = {
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
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int ssp_amp, int dmic_be_num,
@@ -294,29 +256,21 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
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
 
@@ -414,7 +368,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int dmic_be_num;
 	int ret, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -430,7 +383,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "sof_nau8825_quirk = %lx\n", sof_nau8825_quirk);
 
 	/* default number of DMIC DAI's */
-	dmic_be_num = 2;
+	ctx->dmic_be_num = 2;
 	ctx->hdmi_num = (sof_nau8825_quirk & SOF_NAU8825_NUM_HDMIDEV_MASK) >>
 			SOF_NAU8825_NUM_HDMIDEV_SHIFT;
 	/* default number of HDMI DAI's */
@@ -446,7 +399,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
-	sof_audio_card_nau8825.num_links = 1 + dmic_be_num + ctx->hdmi_num;
+	sof_audio_card_nau8825.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_nau8825.num_links++;
@@ -455,8 +408,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_nau8825.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ssp_codec, ssp_amp, dmic_be_num,
-					      ctx->hdmi_num,
+					      ssp_codec, ssp_amp,
+					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
-- 
2.39.2


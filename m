Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E577D00C0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE04DE5;
	Thu, 19 Oct 2023 19:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE04DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697737062;
	bh=UZw8c8lePrR6c5zXowSz3roHTeecjN2ZGJPcxGBPDtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GjRifRlKqPDiK2SOvcupPpGoTbINrRcDJHzJOX/LbNQFE/v2OlmvYpmVlbUFcs/SD
	 jRzWzuuWijRMLt/fgFv9zjRZu3ebmrzueJVwP1eFlAmiFzfuhQny9jn/ZBKAF/rZle
	 6oVHlsxV/FqHR79m3ScAsP1z/U89vffaOZ+SEook=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2321FF805D7; Thu, 19 Oct 2023 19:34:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE400F805C9;
	Thu, 19 Oct 2023 19:34:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4942F805B5; Thu, 19 Oct 2023 19:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38A82F80557
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38A82F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fz7fhsjw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736878; x=1729272878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UZw8c8lePrR6c5zXowSz3roHTeecjN2ZGJPcxGBPDtQ=;
  b=fz7fhsjwfLenohXQcUqj3c4Eab1KJvOpj2vrNfjPcwt2iyouHZEDKjCM
   9tI9LQdvzThc5OZMEHKknIktvDRUvbjvo/O3uKViSPMfzAd/WjyOTWi/b
   /Gl2zQxNFV85Iiuq4Ow5WxJMn0g43uLhQc+bpFCFM9qNWQB6kYygcoCUb
   r4G1mIA/fak7yGn/qntI/UVJIZ7xNnfns+A7ijxUKXVMx/xDZ5hpOWF1I
   IbBIvOgouRH4RzlAdyl5pfoDobi4LeaLYnPGFrr3NBkMshx7O6GWSZYhs
   HykKTiAaqy3HjYe/nIavnzUc5yOdOWJxz8QR7QPzhKlSoiMnU+RvvSSn2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884380"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884380"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090736"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090736"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/10] ASoC: Intel: sof_ssp_amp: use common module for DMIC
 links
Date: Thu, 19 Oct 2023 12:34:11 -0500
Message-Id: <20231019173411.166759-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7SFHWGJ2IVPBZ544JPMTMEWGTHWYIHTF
X-Message-ID-Hash: 7SFHWGJ2IVPBZ544JPMTMEWGTHWYIHTF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7SFHWGJ2IVPBZ544JPMTMEWGTHWYIHTF/>
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
 sound/soc/intel/boards/sof_ssp_amp.c | 65 +++++++++-------------------
 1 file changed, 21 insertions(+), 44 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 23c0d507789c..137ba64254bc 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -70,15 +70,6 @@ static const struct dmi_system_id chromebook_platforms[] = {
 	{},
 };
 
-static const struct snd_soc_dapm_widget sof_ssp_amp_dapm_widgets[] = {
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-};
-
-static const struct snd_soc_dapm_route sof_ssp_amp_dapm_routes[] = {
-	/* digital mics */
-	{"DMic", NULL, "SoC DMIC"},
-};
-
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	return sof_intel_board_card_late_probe(card);
@@ -87,10 +78,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 static struct snd_soc_card sof_ssp_amp_card = {
 	.name         = "ssp_amp",
 	.owner        = THIS_MODULE,
-	.dapm_widgets = sof_ssp_amp_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(sof_ssp_amp_dapm_widgets),
-	.dapm_routes = sof_ssp_amp_dapm_routes,
-	.num_dapm_routes = ARRAY_SIZE(sof_ssp_amp_dapm_routes),
 	.fully_routed = true,
 	.late_probe = sof_card_late_probe,
 };
@@ -102,17 +89,11 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dmic_component[] = {
-	{
-		.name = "dmic-codec",
-		.dai_name = "dmic-hifi",
-	}
-};
-
 /* BE ID defined in sof-tgl-rt1308-hdmi-ssp.m4 */
 #define HDMI_IN_BE_ID		0
 #define SPK_BE_ID		2
 #define DMIC01_BE_ID		3
+#define DMIC16K_BE_ID		4
 #define INTEL_HDMI_BE_ID	5
 
 static struct snd_soc_dai_link *
@@ -207,28 +188,23 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	/* dmic */
 	if (dmic_be_num > 0) {
 		/* at least we have dmic01 */
-		links[id].name = "dmic01";
-		links[id].cpus = &cpus[id];
-		links[id].cpus->dai_name = "DMIC01 Pin";
-		if (dmic_be_num > 1) {
-			/* set up 2 BE links at most */
-			links[id + 1].name = "dmic16k";
-			links[id + 1].cpus = &cpus[id + 1];
-			links[id + 1].cpus->dai_name = "DMIC16k Pin";
-			dmic_be_num = 2;
-		}
+		be_id = fixed_be ? DMIC01_BE_ID : id;
+		ret = sof_intel_board_set_dmic_link(dev, &links[id], be_id,
+						    SOF_DMIC_01);
+		if (ret)
+			return NULL;
+
+		id++;
 	}
 
-	for (i = 0; i < dmic_be_num; i++) {
-		links[id].id = fixed_be ? (DMIC01_BE_ID + i) : id;
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
+		be_id = fixed_be ? DMIC16K_BE_ID : id;
+		ret = sof_intel_board_set_dmic_link(dev, &links[id], be_id,
+						    SOF_DMIC_16K);
+		if (ret)
+			return NULL;
+
 		id++;
 	}
 
@@ -278,7 +254,6 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int dmic_be_num = 0;
 	int ret, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -291,12 +266,14 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
 
 	if (dmi_check_system(chromebook_platforms) || mach->mach_params.dmic_num > 0)
-		dmic_be_num = 2;
+		ctx->dmic_be_num = 2;
+	else
+		ctx->dmic_be_num = 0;
 
 	ssp_codec = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
 
 	/* set number of dai links */
-	sof_ssp_amp_card.num_links = dmic_be_num;
+	sof_ssp_amp_card.num_links = ctx->dmic_be_num;
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_ssp_amp_card.num_links++;
@@ -324,7 +301,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 		sof_ssp_amp_card.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ssp_codec, dmic_be_num,
+					      ssp_codec, ctx->dmic_be_num,
 					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.39.2


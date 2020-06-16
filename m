Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A661FAA3F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 09:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154EA1676;
	Tue, 16 Jun 2020 09:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154EA1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592293467;
	bh=FqYGHP3TC++Pqugt3k/mqGw9+5XMJhNXfpcek2az2+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VofBeiijK97E1R5QGQbbf/zfnrWXAj/sB5aRAYRpW6RoWbos4vf+5rJEzTxoJi3At
	 JarzbN2yfb9aE+ayZdUrXcEvf5sAPCSdDocZpZUp0LiiIzx61elb602C1F3kaviBnB
	 CNSnIQPgTZyvdPkDC5jg6uAq+H7hc5jYJfbHXY10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA59F80255;
	Tue, 16 Jun 2020 09:42:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A78AF80252; Tue, 16 Jun 2020 09:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE9A8F800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 09:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE9A8F800EF
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2B92C1A05F8;
 Tue, 16 Jun 2020 09:41:50 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B7B011A16D6;
 Tue, 16 Jun 2020 09:41:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 043F84030D;
 Tue, 16 Jun 2020 15:41:37 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl-asoc-card: Add MQS support
Date: Tue, 16 Jun 2020 15:30:37 +0800
Message-Id: <1592292637-25734-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592292637-25734-1-git-send-email-shengjiu.wang@nxp.com>
References: <1592292637-25734-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

The MQS codec isn't an i2c device, so add a new platform device for it.

MQS only support playback, so add a new audio map.

Add there maybe "model" property or no "audio-routing" property in
devicetree, so add some enhancement for these two property.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 70 ++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 00be73900888..2ac8cb9ddd10 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -119,6 +119,13 @@ static const struct snd_soc_dapm_route audio_map_ac97[] = {
 	{"ASRC-Capture",  NULL, "AC97 Capture"},
 };
 
+static const struct snd_soc_dapm_route audio_map_tx[] = {
+	/* 1st half -- Normal DAPM routes */
+	{"Playback",  NULL, "CPU-Playback"},
+	/* 2nd half -- ASRC DAPM routes */
+	{"CPU-Playback",  NULL, "ASRC-Playback"},
+};
+
 /* Add all possible widgets into here without being redundant */
 static const struct snd_soc_dapm_widget fsl_asoc_card_dapm_widgets[] = {
 	SND_SOC_DAPM_LINE("Line Out Jack", NULL),
@@ -482,6 +489,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 {
 	struct device_node *cpu_np, *codec_np, *asrc_np;
 	struct device_node *np = pdev->dev.of_node;
+	struct platform_device *codec_pdev = NULL; /* used for non i2c device*/
 	struct platform_device *asrc_pdev = NULL;
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
@@ -512,10 +520,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	}
 
 	codec_np = of_parse_phandle(np, "audio-codec", 0);
-	if (codec_np)
+	if (codec_np) {
 		codec_dev = of_find_i2c_device_by_node(codec_np);
-	else
+		if (!codec_dev)
+			codec_pdev = of_find_device_by_node(codec_np);
+	} else {
 		codec_dev = NULL;
+	}
 
 	asrc_np = of_parse_phandle(np, "audio-asrc", 0);
 	if (asrc_np)
@@ -525,6 +536,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	if (codec_dev) {
 		struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);
 
+		if (!IS_ERR(codec_clk)) {
+			priv->codec_priv.mclk_freq = clk_get_rate(codec_clk);
+			clk_put(codec_clk);
+		}
+	} else if (codec_pdev) {
+		struct clk *codec_clk = clk_get(&codec_pdev->dev, NULL);
+
 		if (!IS_ERR(codec_clk)) {
 			priv->codec_priv.mclk_freq = clk_get_rate(codec_clk);
 			clk_put(codec_clk);
@@ -538,6 +556,11 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	/* Assign a default DAI format, and allow each card to overwrite it */
 	priv->dai_fmt = DAI_FMT_BASE;
 
+	memcpy(priv->dai_link, fsl_asoc_card_dai,
+	       sizeof(struct snd_soc_dai_link) * ARRAY_SIZE(priv->dai_link));
+
+	priv->card.dapm_routes = audio_map;
+	priv->card.num_dapm_routes = ARRAY_SIZE(audio_map);
 	/* Diversify the card configurations */
 	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
 		codec_dai_name = "cs42888";
@@ -573,13 +596,25 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		codec_dai_name = "ac97-hifi";
 		priv->card.set_bias_level = NULL;
 		priv->dai_fmt = SND_SOC_DAIFMT_AC97;
+		priv->card.dapm_routes = audio_map_ac97;
+		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_ac97);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-mqs")) {
+		codec_dai_name = "fsl-mqs-dai";
+		priv->card.set_bias_level = NULL;
+		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
+				SND_SOC_DAIFMT_CBS_CFS |
+				SND_SOC_DAIFMT_NB_NF;
+		priv->dai_link[1].dpcm_playback = 1;
+		priv->dai_link[2].dpcm_playback = 1;
+		priv->card.dapm_routes = audio_map_tx;
+		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret = -EINVAL;
 		goto asrc_fail;
 	}
 
-	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
+	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev && !codec_pdev) {
 		dev_err(&pdev->dev, "failed to find codec device\n");
 		ret = -EPROBE_DEFER;
 		goto asrc_fail;
@@ -601,19 +636,18 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
 	}
 
-	snprintf(priv->name, sizeof(priv->name), "%s-audio",
-		 fsl_asoc_card_is_ac97(priv) ? "ac97" :
-		 codec_dev->name);
-
 	/* Initialize sound card */
 	priv->pdev = pdev;
 	priv->card.dev = &pdev->dev;
-	priv->card.name = priv->name;
+	ret = snd_soc_of_parse_card_name(&priv->card, "model");
+	if (ret) {
+		snprintf(priv->name, sizeof(priv->name), "%s-audio",
+			 fsl_asoc_card_is_ac97(priv) ? "ac97" :
+			 (codec_dev ? codec_dev->name : codec_pdev->name));
+		priv->card.name = priv->name;
+	}
 	priv->card.dai_link = priv->dai_link;
-	priv->card.dapm_routes = fsl_asoc_card_is_ac97(priv) ?
-				 audio_map_ac97 : audio_map;
 	priv->card.late_probe = fsl_asoc_card_late_probe;
-	priv->card.num_dapm_routes = ARRAY_SIZE(audio_map);
 	priv->card.dapm_widgets = fsl_asoc_card_dapm_widgets;
 	priv->card.num_dapm_widgets = ARRAY_SIZE(fsl_asoc_card_dapm_widgets);
 
@@ -621,13 +655,12 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	if (!asrc_pdev)
 		priv->card.num_dapm_routes /= 2;
 
-	memcpy(priv->dai_link, fsl_asoc_card_dai,
-	       sizeof(struct snd_soc_dai_link) * ARRAY_SIZE(priv->dai_link));
-
-	ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
-		goto asrc_fail;
+	if (of_property_read_bool(np, "audio-routing")) {
+		ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
+		if (ret) {
+			dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
+			goto asrc_fail;
+		}
 	}
 
 	/* Normal DAI Link */
@@ -724,6 +757,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
 	{ .compatible = "fsl,imx-audio-wm8962", },
 	{ .compatible = "fsl,imx-audio-wm8960", },
+	{ .compatible = "fsl,imx-audio-mqs", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
-- 
2.21.0


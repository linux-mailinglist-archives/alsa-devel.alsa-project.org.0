Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4881FC583
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 07:02:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80B31684;
	Wed, 17 Jun 2020 07:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80B31684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592370139;
	bh=SWb+GwEwGQOBzwQYDoXOtrL8PPU4xev35MRfjQ/gkv4=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=iz932VcXmfde2spiRAR6RSq8KiKz7CTMc/ly4+IUDXWhbewU3Sx1A4NG4xeKt2XDt
	 hzEUJ5TLpBEwH+IYvqF7/sRoBbkGif1LdjxUGfRUl7Cl/V9SHnkurmDALP5pnJYDHw
	 6PMkvShgRSE59JT75TcZ7l6reNX/3uwM97wS578M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97CDBF802A7;
	Wed, 17 Jun 2020 06:59:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2492F802A1; Wed, 17 Jun 2020 06:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07197F80271
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 06:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07197F80271
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1883C1A09F3;
 Wed, 17 Jun 2020 06:59:39 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9883A1A09DA;
 Wed, 17 Jun 2020 06:59:33 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DCAA6402B3;
 Wed, 17 Jun 2020 12:59:26 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: fsl-asoc-card: Add MQS support
Date: Wed, 17 Jun 2020 12:48:25 +0800
Message-Id: <918505decb7f757f12c38059c590984f28d2f3a4.1592369271.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <2185a3ec866bc59f82d93b73d1a732a896fd8f48.1592369271.git.shengjiu.wang@nxp.com>
References: <2185a3ec866bc59f82d93b73d1a732a896fd8f48.1592369271.git.shengjiu.wang@nxp.com>
In-Reply-To: <2185a3ec866bc59f82d93b73d1a732a896fd8f48.1592369271.git.shengjiu.wang@nxp.com>
References: <2185a3ec866bc59f82d93b73d1a732a896fd8f48.1592369271.git.shengjiu.wang@nxp.com>
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

The MQS codec isn't an i2c device, so use of_find_device_by_node
to get platform device pointer.

Because MQS only support playback, then add a new audio map.

And there maybe "model" property or no "audio-routing" property in
devicetree, so add some enhancement for these two property.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- update according Nicolin's comments.

 sound/soc/fsl/fsl-asoc-card.c | 78 +++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 21 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 00be73900888..d0543a53764e 100644
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
@@ -485,8 +492,9 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	struct platform_device *asrc_pdev = NULL;
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
-	struct i2c_client *codec_dev;
+	struct device *codec_dev = NULL;
 	const char *codec_dai_name;
+	const char *codec_dev_name;
 	u32 width;
 	int ret;
 
@@ -512,10 +520,23 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	}
 
 	codec_np = of_parse_phandle(np, "audio-codec", 0);
-	if (codec_np)
-		codec_dev = of_find_i2c_device_by_node(codec_np);
-	else
-		codec_dev = NULL;
+	if (codec_np) {
+		struct platform_device *codec_pdev;
+		struct i2c_client *codec_i2c;
+
+		codec_i2c = of_find_i2c_device_by_node(codec_np);
+		if (codec_i2c) {
+			codec_dev = &codec_i2c->dev;
+			codec_dev_name = codec_i2c->name;
+		}
+		if (!codec_dev) {
+			codec_pdev = of_find_device_by_node(codec_np);
+			if (codec_pdev) {
+				codec_dev = &codec_pdev->dev;
+				codec_dev_name = codec_pdev->name;
+			}
+		}
+	}
 
 	asrc_np = of_parse_phandle(np, "audio-asrc", 0);
 	if (asrc_np)
@@ -523,7 +544,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	/* Get the MCLK rate only, and leave it controlled by CODEC drivers */
 	if (codec_dev) {
-		struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);
+		struct clk *codec_clk = clk_get(codec_dev, NULL);
 
 		if (!IS_ERR(codec_clk)) {
 			priv->codec_priv.mclk_freq = clk_get_rate(codec_clk);
@@ -538,6 +559,11 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
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
@@ -573,6 +599,18 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
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
+		priv->dai_link[1].dpcm_capture = 0;
+		priv->dai_link[2].dpcm_capture = 0;
+		priv->card.dapm_routes = audio_map_tx;
+		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret = -EINVAL;
@@ -601,19 +639,17 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
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
+			 fsl_asoc_card_is_ac97(priv) ? "ac97" : codec_dev_name);
+		priv->card.name = priv->name;
+	}
 	priv->card.dai_link = priv->dai_link;
-	priv->card.dapm_routes = fsl_asoc_card_is_ac97(priv) ?
-				 audio_map_ac97 : audio_map;
 	priv->card.late_probe = fsl_asoc_card_late_probe;
-	priv->card.num_dapm_routes = ARRAY_SIZE(audio_map);
 	priv->card.dapm_widgets = fsl_asoc_card_dapm_widgets;
 	priv->card.num_dapm_widgets = ARRAY_SIZE(fsl_asoc_card_dapm_widgets);
 
@@ -621,13 +657,12 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
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
@@ -724,6 +759,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
 	{ .compatible = "fsl,imx-audio-wm8962", },
 	{ .compatible = "fsl,imx-audio-wm8960", },
+	{ .compatible = "fsl,imx-audio-mqs", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
-- 
2.21.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C590E2337AA
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 19:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5426B168F;
	Thu, 30 Jul 2020 19:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5426B168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596130112;
	bh=8gjXVY8JMETBAdsGlt/ByIFs3a1aDmqob/8OvyU+c20=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TIufdf+InNYTnKSb+Ei3nckqFNx/LSPLIXy6gbowKYhKSBTF/xiF6CDA7i6u3SiCI
	 xSy+a9DOsT0JXctUyBPy5L5HpN+T/Wk0l0TWU+BFUPhJFlV1NnqZqqmnftsPcb7bEW
	 NIxxoVT5DGHTpYF7WK6yYdtMkaTGgJmfMxdRX4QI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 989BFF800C9;
	Thu, 30 Jul 2020 19:26:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F426F8021E; Thu, 30 Jul 2020 19:26:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4825F800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 19:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4825F800C9
IronPort-SDR: mp7Hv8fki4IzN1UlsbuNk7qMmlFi79zGPOuy2i2TDlRgMLCbB/h0ved4rF6E1Ll8SjqMK7+pqG
 V/gEWQJ5IegQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="151622771"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="151622771"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 10:26:37 -0700
IronPort-SDR: W1R1rHmpb6O8A0HqDhea7gS9urIs9jNpI4wJ1E7vQDF8ZrP2glN3vVgcRpl5yxRGCE8TyDJPo5
 ZiT8Xs4UtE6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="313507221"
Received: from joycetoh-desk.sc.intel.com ([172.25.206.187])
 by fmsmga004.fm.intel.com with ESMTP; 30 Jul 2020 10:26:36 -0700
From: Harsha Priya <harshapriya.n@intel.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Date: Thu, 30 Jul 2020 10:26:28 -0700
Message-Id: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Harsha Priya <harshapriya.n@intel.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
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

This patch adds a dapm route to provide early mclk/sclk for
for DMIC on SSP0(rt5514) and Headset on SSP1(rt5663).

The sclk rate for both codecs is different which is taken care
of in the platform_clock_control().The platform has one mclk and
one sclk. Two variables sclk0 and sclk1 are used for the
two codecs on differnet ssp that use different clock rate.

This change ensures the DMIC PCM port will return valid data

Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
---
v1 -> v2:
- Only one mclk with same rate is used, so changed to using one variable
- dropping ssp_ prefix from sclk variable names to make them sound right.
- removing a return statment that was not required
- fixed commit message accordingly

 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  | 146 ++++++++++++++-------
 1 file changed, 97 insertions(+), 49 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index b34cf6c..155f2b4 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -54,7 +54,8 @@ struct kbl_codec_private {
 	struct list_head hdmi_pcm_list;
 	struct snd_soc_jack kabylake_hdmi[2];
 	struct clk *mclk;
-	struct clk *sclk;
+	struct clk *sclk0;
+	struct clk *sclk1;
 };
 
 enum {
@@ -77,13 +78,29 @@ static const struct snd_kcontrol_new kabylake_controls[] = {
 };
 
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int  event)
+			struct snd_kcontrol *k, int event, int ssp_num)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
 	struct kbl_codec_private *priv = snd_soc_card_get_drvdata(card);
+	struct clk *sclk;
+	unsigned long sclk_rate;
 	int ret = 0;
 
+	switch (ssp_num) {
+	case 0:
+		sclk = priv->sclk0;
+		sclk_rate = 6144000;
+		break;
+	case 1:
+		sclk = priv->sclk1;
+		sclk_rate = 3072000;
+		break;
+	default:
+		dev_err(card->dev, "Invalid ssp_num %d\n", ssp_num);
+		return -EINVAL;
+	}
+
 	/*
 	 * MCLK/SCLK need to be ON early for a successful synchronization of
 	 * codec internal clock. And the clocks are turned off during
@@ -91,38 +108,48 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	 */
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		/* Enable MCLK */
 		ret = clk_set_rate(priv->mclk, 24000000);
 		if (ret < 0) {
-			dev_err(card->dev, "Can't set rate for mclk, err: %d\n",
-				ret);
-			return ret;
+			dev_err(card->dev, "Can't set rate for mclk for ssp%d, err: %d\n",
+				ssp_num, ret);
+				return ret;
 		}
 
-		ret = clk_prepare_enable(priv->mclk);
-		if (ret < 0) {
-			dev_err(card->dev, "Can't enable mclk, err: %d\n", ret);
-			return ret;
+		if (!__clk_is_enabled(priv->mclk)) {
+			/* Enable MCLK */
+			ret = clk_prepare_enable(priv->mclk);
+			if (ret < 0) {
+				dev_err(card->dev, "Can't enable mclk for ssp%d, err: %d\n",
+					ssp_num, ret);
+				return ret;
+			}
 		}
 
-		/* Enable SCLK */
-		ret = clk_set_rate(priv->sclk, 3072000);
+		ret = clk_set_rate(sclk, sclk_rate);
 		if (ret < 0) {
-			dev_err(card->dev, "Can't set rate for sclk, err: %d\n",
-				ret);
+			dev_err(card->dev, "Can't set rate for sclk for ssp%d, err: %d\n",
+				ssp_num, ret);
 			clk_disable_unprepare(priv->mclk);
 			return ret;
 		}
 
-		ret = clk_prepare_enable(priv->sclk);
-		if (ret < 0) {
-			dev_err(card->dev, "Can't enable sclk, err: %d\n", ret);
-			clk_disable_unprepare(priv->mclk);
+		if (!__clk_is_enabled(sclk)) {
+			/* Enable SCLK */
+			ret = clk_prepare_enable(sclk);
+			if (ret < 0) {
+				dev_err(card->dev, "Can't enable sclk for ssp%d, err: %d\n",
+					ssp_num, ret);
+				clk_disable_unprepare(priv->mclk);
+				return ret;
+			}
 		}
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		clk_disable_unprepare(priv->mclk);
-		clk_disable_unprepare(priv->sclk);
+		if (__clk_is_enabled(priv->mclk))
+			clk_disable_unprepare(priv->mclk);
+
+		if (__clk_is_enabled(sclk))
+			clk_disable_unprepare(sclk);
 		break;
 	default:
 		return 0;
@@ -131,6 +158,18 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int platform_clock_control_ssp0(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *k, int event)
+{
+	return platform_clock_control(w, k, event, 0);
+}
+
+static int platform_clock_control_ssp1(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *k, int event)
+{
+	return platform_clock_control(w, k, event, 1);
+}
+
 static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -139,15 +178,17 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 	SND_SOC_DAPM_SPK("HDMI1", NULL),
 	SND_SOC_DAPM_SPK("HDMI2", NULL),
-	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
-			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
+	SND_SOC_DAPM_SUPPLY("Platform Clock SSP0", SND_SOC_NOPM, 0, 0,
+			platform_clock_control_ssp0, SND_SOC_DAPM_PRE_PMU |
+			SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("Platform Clock SSP1", SND_SOC_NOPM, 0, 0,
+			platform_clock_control_ssp1, SND_SOC_DAPM_PRE_PMU |
 			SND_SOC_DAPM_POST_PMD),
-
 };
 
 static const struct snd_soc_dapm_route kabylake_map[] = {
 	/* Headphones */
-	{ "Headphone Jack", NULL, "Platform Clock" },
+	{ "Headphone Jack", NULL, "Platform Clock SSP1" },
 	{ "Headphone Jack", NULL, "HPOL" },
 	{ "Headphone Jack", NULL, "HPOR" },
 
@@ -156,7 +197,7 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	{ "Right Spk", NULL, "Right BE_OUT" },
 
 	/* other jacks */
-	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Headset Mic", NULL, "Platform Clock SSP1" },
 	{ "IN1P", NULL, "Headset Mic" },
 	{ "IN1N", NULL, "Headset Mic" },
 
@@ -180,6 +221,7 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	{ "ssp0 Rx", NULL, "Right HiFi Capture" },
 
 	/* DMIC */
+	{ "DMIC", NULL, "Platform Clock SSP0" },
 	{ "DMIC1L", NULL, "DMIC" },
 	{ "DMIC1R", NULL, "DMIC" },
 	{ "DMIC2L", NULL, "DMIC" },
@@ -666,7 +708,7 @@ static int kabylake_set_bias_level(struct snd_soc_card *card,
 	if (!component || strcmp(component->name, RT5514_DEV_NAME))
 		return 0;
 
-	if (IS_ERR(priv->mclk))
+	if (IS_ERR(priv->mclk0))
 		return 0;
 
 	/*
@@ -757,6 +799,28 @@ static struct snd_soc_card kabylake_audio_card = {
 	.late_probe = kabylake_card_late_probe,
 };
 
+static int kabylake_audio_clk_get(struct device *dev, const char *id,
+	struct clk **clk)
+{
+	int ret = 0;
+
+	if (!clk)
+		return -EINVAL;
+
+	*clk = devm_clk_get(dev, id);
+	if (IS_ERR(*clk)) {
+		ret = PTR_ERR(*clk);
+		if (ret == -ENOENT) {
+			dev_info(dev, "Failed to get %s, defer probe\n", id);
+			return -EPROBE_DEFER;
+		}
+
+		dev_err(dev, "Failed to get %s with err:%d\n", id, ret);
+	}
+
+	return ret;
+}
+
 static int kabylake_audio_probe(struct platform_device *pdev)
 {
 	struct kbl_codec_private *ctx;
@@ -777,33 +841,17 @@ static int kabylake_audio_probe(struct platform_device *pdev)
 		dmic_constraints = mach->mach_params.dmic_num == 2 ?
 			&constraints_dmic_2ch : &constraints_dmic_channels;
 
-	ctx->mclk = devm_clk_get(&pdev->dev, "ssp1_mclk");
-	if (IS_ERR(ctx->mclk)) {
-		ret = PTR_ERR(ctx->mclk);
-		if (ret == -ENOENT) {
-			dev_info(&pdev->dev,
-				"Failed to get ssp1_mclk, defer probe\n");
-			return -EPROBE_DEFER;
-		}
-
-		dev_err(&pdev->dev, "Failed to get ssp1_mclk with err:%d\n",
-								ret);
+	ret = kabylake_audio_clk_get(&pdev->dev, "ssp0_sclk", &ctx->sclk0);
+	if (ret != 0)
 		return ret;
-	}
 
-	ctx->sclk = devm_clk_get(&pdev->dev, "ssp1_sclk");
-	if (IS_ERR(ctx->sclk)) {
-		ret = PTR_ERR(ctx->sclk);
-		if (ret == -ENOENT) {
-			dev_info(&pdev->dev,
-				"Failed to get ssp1_sclk, defer probe\n");
-			return -EPROBE_DEFER;
-		}
+	ret = kabylake_audio_clk_get(&pdev->dev, "ssp1_mclk", &ctx->mclk);
+	if (ret != 0)
+		return ret;
 
-		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
-								ret);
+	ret = kabylake_audio_clk_get(&pdev->dev, "ssp1_sclk", &ctx->sclk1);
+	if (ret != 0)
 		return ret;
-	}
 
 	return devm_snd_soc_register_card(&pdev->dev, &kabylake_audio_card);
 }
-- 
2.7.4


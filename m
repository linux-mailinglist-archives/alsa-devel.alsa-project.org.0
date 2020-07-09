Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9D21B626
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 15:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B801C1654;
	Fri, 10 Jul 2020 15:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B801C1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594387122;
	bh=7imNI+WN0eXBMlTTJCeJeoXozspN01FmfN6Sh0cwIFQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t3Xd3LKauVqeG4si4JWOfyBJv/Tk4eIxCjqS3GCMTT1QWBQLDl+fyVkOA8XN4+dpB
	 IaV80VOUhZVEFMvMAVp4Mv1KWxAV8H7sI+8d5w1DYy02EfE5Aq7Q0dhFZZKIgm3w+/
	 hntSigtpLLEqI3pXDsZWvdHc3edH99pH0mdA2RC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC02AF80150;
	Fri, 10 Jul 2020 15:17:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69542F80216; Thu,  9 Jul 2020 17:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2422EF8011F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 17:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2422EF8011F
IronPort-SDR: pEAsBK1lM5Bj6arq5JOG9bkm0+K7rMOp2QZwFSBf49WVNMioPjHAvRFJkO5WA6UP1AGMCMGvzX
 liIrQWircRpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="232891440"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="232891440"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 08:25:39 -0700
IronPort-SDR: s7Ou2aW+KIup/8I7q3fjQ4nA78aLk7c/dv9orKtjQH+vbzjquHgKMJAcdjYsmt/rR0G6a2S1q0
 LAtt+DuUVupQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="268781780"
Received: from vamshikr-desk.iind.intel.com ([10.223.163.26])
 by fmsmga008.fm.intel.com with ESMTP; 09 Jul 2020 08:25:36 -0700
From: vamshi.krishna.gopal@intel.com
To: vamshi.krishna.gopal@intel.com, pierre-louis.bossart@linux.intel.com,
 lma@semihalf.com, harshapriya.n@intel.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: boards: eve: Fix DMIC records zero
Date: Thu,  9 Jul 2020 20:55:26 +0530
Message-Id: <20200709152526.15764-1-vamshi.krishna.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 10 Jul 2020 15:16:59 +0200
Cc: sathya.prakash.m.r@intel.com, brndt@google.com
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

From: Brent Lu <brent.lu@intel.com>

Add a dapm route to provide ssp mclk/sclk early
for DMIC  on SSP0(rt5514) and Headset on SSP1(rt5663)
since sclk for both codecs are different the
struct now defines SSP0 and SSP1 mclk , sclk separately
This change ensures the DMIC PCM port
will not return all-zero data

Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 150 ++++++++++++------
 1 file changed, 102 insertions(+), 48 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index b34cf6cf1139..584e4f9cedc2 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -53,8 +53,10 @@ struct kbl_codec_private {
 	struct snd_soc_jack kabylake_headset;
 	struct list_head hdmi_pcm_list;
 	struct snd_soc_jack kabylake_hdmi[2];
-	struct clk *mclk;
-	struct clk *sclk;
+	struct clk *ssp0_mclk;
+	struct clk *ssp0_sclk;
+	struct clk *ssp1_mclk;
+	struct clk *ssp1_sclk;
 };
 
 enum {
@@ -77,13 +79,31 @@ static const struct snd_kcontrol_new kabylake_controls[] = {
 };
 
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int  event)
+			struct snd_kcontrol *k, int event, int ssp_num)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
 	struct kbl_codec_private *priv = snd_soc_card_get_drvdata(card);
+	struct clk *mclk, *sclk;
+	unsigned long sclk_rate;
 	int ret = 0;
 
+	switch (ssp_num) {
+	case 0:
+		mclk = priv->ssp0_mclk;
+		sclk = priv->ssp0_sclk;
+		sclk_rate = 6144000;
+		break;
+	case 1:
+		mclk = priv->ssp1_mclk;
+		sclk = priv->ssp1_sclk;
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
@@ -91,38 +111,46 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	 */
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		if (__clk_is_enabled(mclk))
+			return 0;
+
 		/* Enable MCLK */
-		ret = clk_set_rate(priv->mclk, 24000000);
+		ret = clk_set_rate(mclk, 24000000);
 		if (ret < 0) {
-			dev_err(card->dev, "Can't set rate for mclk, err: %d\n",
-				ret);
+			dev_err(card->dev, "Can't set rate for ssp%d_mclk, err: %d\n",
+				ssp_num, ret);
 			return ret;
 		}
 
-		ret = clk_prepare_enable(priv->mclk);
+		ret = clk_prepare_enable(mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "Can't enable mclk, err: %d\n", ret);
+			dev_err(card->dev, "Can't enable ssp%d_mclk, err: %d\n",
+				ssp_num, ret);
 			return ret;
 		}
 
 		/* Enable SCLK */
-		ret = clk_set_rate(priv->sclk, 3072000);
+		ret = clk_set_rate(sclk, sclk_rate);
 		if (ret < 0) {
-			dev_err(card->dev, "Can't set rate for sclk, err: %d\n",
-				ret);
-			clk_disable_unprepare(priv->mclk);
+			dev_err(card->dev, "Can't set rate for ssp%d_sclk, err: %d\n",
+				ssp_num, ret);
+			clk_disable_unprepare(mclk);
 			return ret;
 		}
 
-		ret = clk_prepare_enable(priv->sclk);
+		ret = clk_prepare_enable(sclk);
 		if (ret < 0) {
-			dev_err(card->dev, "Can't enable sclk, err: %d\n", ret);
-			clk_disable_unprepare(priv->mclk);
+			dev_err(card->dev, "Can't enable ssp%d_sclk, err: %d\n",
+				ssp_num, ret);
+			clk_disable_unprepare(mclk);
 		}
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		clk_disable_unprepare(priv->mclk);
-		clk_disable_unprepare(priv->sclk);
+		if (!__clk_is_enabled(mclk))
+			return 0;
+
+		clk_disable_unprepare(mclk);
+		clk_disable_unprepare(sclk);
 		break;
 	default:
 		return 0;
@@ -131,6 +159,18 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
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
@@ -139,15 +179,17 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
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
 
@@ -156,7 +198,7 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	{ "Right Spk", NULL, "Right BE_OUT" },
 
 	/* other jacks */
-	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Headset Mic", NULL, "Platform Clock SSP1" },
 	{ "IN1P", NULL, "Headset Mic" },
 	{ "IN1N", NULL, "Headset Mic" },
 
@@ -180,6 +222,7 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	{ "ssp0 Rx", NULL, "Right HiFi Capture" },
 
 	/* DMIC */
+	{ "DMIC", NULL, "Platform Clock SSP0" },
 	{ "DMIC1L", NULL, "DMIC" },
 	{ "DMIC1R", NULL, "DMIC" },
 	{ "DMIC2L", NULL, "DMIC" },
@@ -666,7 +709,7 @@ static int kabylake_set_bias_level(struct snd_soc_card *card,
 	if (!component || strcmp(component->name, RT5514_DEV_NAME))
 		return 0;
 
-	if (IS_ERR(priv->mclk))
+	if (IS_ERR(priv->ssp0_mclk))
 		return 0;
 
 	/*
@@ -678,17 +721,17 @@ static int kabylake_set_bias_level(struct snd_soc_card *card,
 	case SND_SOC_BIAS_PREPARE:
 		if (dapm->bias_level == SND_SOC_BIAS_ON) {
 			dev_dbg(card->dev, "Disable mclk");
-			clk_disable_unprepare(priv->mclk);
+			clk_disable_unprepare(priv->ssp0_mclk);
 		} else {
 			dev_dbg(card->dev, "Enable mclk");
-			ret = clk_set_rate(priv->mclk, 24000000);
+			ret = clk_set_rate(priv->ssp0_mclk, 24000000);
 			if (ret) {
 				dev_err(card->dev, "Can't set rate for mclk, err: %d\n",
 					ret);
 				return ret;
 			}
 
-			ret = clk_prepare_enable(priv->mclk);
+			ret = clk_prepare_enable(priv->ssp0_mclk);
 			if (ret) {
 				dev_err(card->dev, "Can't enable mclk, err: %d\n",
 					ret);
@@ -757,6 +800,29 @@ static struct snd_soc_card kabylake_audio_card = {
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
+		return ret;
+	}
+
+	return ret;
+}
+
 static int kabylake_audio_probe(struct platform_device *pdev)
 {
 	struct kbl_codec_private *ctx;
@@ -777,33 +843,21 @@ static int kabylake_audio_probe(struct platform_device *pdev)
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
+	ret = kabylake_audio_clk_get(&pdev->dev, "ssp0_mclk", &ctx->ssp0_mclk);
+	if (ret != 0)
+		return ret;
 
-		dev_err(&pdev->dev, "Failed to get ssp1_mclk with err:%d\n",
-								ret);
+	ret = kabylake_audio_clk_get(&pdev->dev, "ssp0_sclk", &ctx->ssp0_sclk);
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
+	ret = kabylake_audio_clk_get(&pdev->dev, "ssp1_mclk", &ctx->ssp1_mclk);
+	if (ret != 0)
+		return ret;
 
-		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
-								ret);
+	ret = kabylake_audio_clk_get(&pdev->dev, "ssp1_sclk", &ctx->ssp1_sclk);
+	if (ret != 0)
 		return ret;
-	}
 
 	return devm_snd_soc_register_card(&pdev->dev, &kabylake_audio_card);
 }
-- 
2.17.1


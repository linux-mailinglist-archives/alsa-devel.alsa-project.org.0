Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34649C2F1F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 10:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D1BA167B;
	Tue,  1 Oct 2019 10:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D1BA167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569919596;
	bh=NZ0dg1C96r4ei8WmHR8XV+6amp7zPYTQ25ZKTaZ3n9Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rrf67pNo02LwJNuOwv3FElKIgc89jzPtIGa7Z8JGro45D2pX3oqAj96Hcc/hVZ//m
	 Vtwrbvh/pt1wYHgAaYvhJSk/mlOwXZBEXHA9SSmSbSEwhg9fPccnElohtcoi76DTIl
	 huKr9+RpHOBRymKSRFEiwtDbP4ltSxc3of3xmLQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA6EF80482;
	Tue,  1 Oct 2019 10:44:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 428BAF80506; Tue,  1 Oct 2019 10:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5220F800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 10:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5220F800DE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 01:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="220930653"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2019 01:44:31 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  1 Oct 2019 16:40:50 +0800
Message-Id: <1569919250-24472-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: cezary.rojewski@intel.com, harshapriya.n@intel.com,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>,
 yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, mac.chiang@intel.com, broonie@kernel.org,
 naveen.m@intel.com, yung-chuan.liao@linux.intel.com,
 Brent Lu <brent.lu@intel.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: eve: Enable mclk and ssp sclk
	early
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Naveen M <naveen.m@intel.com>

rt5663 and rt5514 needs mclk/sclk early to synchronize its internal
clocks.

Signed-off-by: Naveen M <naveen.m@intel.com>
Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
Signed-off-by: Subhransu S. Prusty <subhransu.s.prusty@intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/Kconfig                     |   1 +
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  | 100 +++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 5c27f7a..d5f167e 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -315,6 +315,7 @@ config SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
         depends on SPI
+	select SND_SOC_INTEL_SKYLAKE_SSP_CLK
         select SND_SOC_RT5663
         select SND_SOC_RT5514
         select SND_SOC_RT5514_SPI
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 74dda87..7b6e70b 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -22,6 +22,9 @@
 #include "../../codecs/rt5514.h"
 #include "../../codecs/rt5663.h"
 #include "../../codecs/hdac_hdmi.h"
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
 
 #define KBL_REALTEK_CODEC_DAI "rt5663-aif"
 #define KBL_REALTEK_DMIC_CODEC_DAI "rt5514-aif1"
@@ -50,6 +53,8 @@ struct kbl_codec_private {
 	struct snd_soc_jack kabylake_headset;
 	struct list_head hdmi_pcm_list;
 	struct snd_soc_jack kabylake_hdmi[2];
+	struct clk *mclk;
+	struct clk *sclk;
 };
 
 enum {
@@ -71,6 +76,67 @@ static const struct snd_kcontrol_new kabylake_controls[] = {
 	SOC_DAPM_PIN_SWITCH("DMIC"),
 };
 
+static int platform_clock_control(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *k, int  event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct kbl_codec_private *priv = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+
+	/*
+	 * MCLK/SCLK need to be ON early for a successful synchronization of
+	 * codec internal clock. And the clocks are turned off during
+	 * POST_PMD after the stream is stopped.
+	 */
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (__clk_is_enabled(priv->mclk))
+			return 0;
+
+		/* Enable MCLK */
+		ret = clk_set_rate(priv->mclk, 24000000);
+		if (ret < 0) {
+			dev_err(card->dev, "Can't set rate for mclk, err: %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(priv->mclk);
+		if (ret < 0) {
+			dev_err(card->dev, "Can't enable mclk, err: %d\n", ret);
+			return ret;
+		}
+
+		/* Enable SCLK */
+		ret = clk_set_rate(priv->sclk, 3072000);
+		if (ret < 0) {
+			dev_err(card->dev, "Can't set rate for sclk, err: %d\n",
+				ret);
+			clk_disable_unprepare(priv->mclk);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(priv->sclk);
+		if (ret < 0) {
+			dev_err(card->dev, "Can't enable sclk, err: %d\n", ret);
+			clk_disable_unprepare(priv->mclk);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (!__clk_is_enabled(priv->mclk))
+			return 0;
+
+		clk_disable_unprepare(priv->mclk);
+		clk_disable_unprepare(priv->sclk);
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -79,11 +145,15 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 	SND_SOC_DAPM_SPK("HDMI1", NULL),
 	SND_SOC_DAPM_SPK("HDMI2", NULL),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
+			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
+			SND_SOC_DAPM_POST_PMD),
 
 };
 
 static const struct snd_soc_dapm_route kabylake_map[] = {
 	/* Headphones */
+	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headphone Jack", NULL, "HPOL" },
 	{ "Headphone Jack", NULL, "HPOR" },
 
@@ -92,6 +162,7 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	{ "Right Spk", NULL, "Right BE_OUT" },
 
 	/* other jacks */
+	{ "Headset Mic", NULL, "Platform Clock" },
 	{ "IN1P", NULL, "Headset Mic" },
 	{ "IN1N", NULL, "Headset Mic" },
 
@@ -643,6 +714,7 @@ static int kabylake_audio_probe(struct platform_device *pdev)
 {
 	struct kbl_codec_private *ctx;
 	struct snd_soc_acpi_mach *mach;
+	int ret = 0;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -658,6 +730,34 @@ static int kabylake_audio_probe(struct platform_device *pdev)
 		dmic_constraints = mach->mach_params.dmic_num == 2 ?
 			&constraints_dmic_2ch : &constraints_dmic_channels;
 
+	ctx->mclk = devm_clk_get(&pdev->dev, "ssp1_mclk");
+	if (IS_ERR(ctx->mclk)) {
+		ret = PTR_ERR(ctx->mclk);
+		if (ret == -ENOENT) {
+			dev_info(&pdev->dev,
+				"Failed to get ssp1_mclk, defer probe\n");
+			return -EPROBE_DEFER;
+		}
+
+		dev_err(&pdev->dev, "Failed to get ssp1_mclk with err:%d\n",
+								ret);
+		return ret;
+	}
+
+	ctx->sclk = devm_clk_get(&pdev->dev, "ssp1_sclk");
+	if (IS_ERR(ctx->sclk)) {
+		ret = PTR_ERR(ctx->sclk);
+		if (ret == -ENOENT) {
+			dev_info(&pdev->dev,
+				"Failed to get ssp1_sclk, defer probe\n");
+			return -EPROBE_DEFER;
+		}
+
+		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
+								ret);
+		return ret;
+	}
+
 	return devm_snd_soc_register_card(&pdev->dev, &kabylake_audio_card);
 }
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

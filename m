Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B905D676B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 18:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D48168A;
	Mon, 14 Oct 2019 18:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D48168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571070811;
	bh=jPo8LBqLyznWugLgzNgmODdMHMFZl3LqN48YLevLWm0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z1aNQZlNHn3xdBmF2LO82xXBjxq104qUeiPvR8aowoQ+T4Fxprge+zyxS3nWIMsJt
	 CrlCttKPA8PKl1jwoiPpBhoEuwH1H83ICohPB2kMPeBTIOG8TFKwpfCcYHg4vabp3c
	 PNQQe/hfhSakULILNstzmcRaQKDDkWGShrHeT4V4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E321F8036C;
	Mon, 14 Oct 2019 18:31:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4059F80362; Mon, 14 Oct 2019 18:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B77AF80138
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 18:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B77AF80138
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 09:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="195036476"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2019 09:31:34 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 15 Oct 2019 00:28:00 +0800
Message-Id: <1571070480-25666-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: cezary.rojewski@intel.com, harshapriya.n@intel.com,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>,
 yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, mac.chiang@intel.com, broonie@kernel.org,
 naveen.m@intel.com, yung-chuan.liao@linux.intel.com,
 Brent Lu <brent.lu@intel.com>
Subject: [alsa-devel] [PATCH v2] ASoC: Intel: eve: Enable mclk and ssp sclk
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
 sound/soc/intel/boards/Kconfig                     |  1 +
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  | 94 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 5c27f7a..5e0e7db 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -320,6 +320,7 @@ config SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
         select SND_SOC_RT5514_SPI
         select SND_SOC_MAX98927
         select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_SKYLAKE_SSP_CLK
         help
           This adds support for ASoC Onboard Codec I2S machine driver. This will
           create an alsa sound card for RT5663 + RT5514 + MAX98927.
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 74dda87..dc09a85 100644
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
@@ -71,6 +76,61 @@ static const struct snd_kcontrol_new kabylake_controls[] = {
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
@@ -79,11 +139,15 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
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
 
@@ -92,6 +156,7 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	{ "Right Spk", NULL, "Right BE_OUT" },
 
 	/* other jacks */
+	{ "Headset Mic", NULL, "Platform Clock" },
 	{ "IN1P", NULL, "Headset Mic" },
 	{ "IN1N", NULL, "Headset Mic" },
 
@@ -643,6 +708,7 @@ static int kabylake_audio_probe(struct platform_device *pdev)
 {
 	struct kbl_codec_private *ctx;
 	struct snd_soc_acpi_mach *mach;
+	int ret = 0;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -658,6 +724,34 @@ static int kabylake_audio_probe(struct platform_device *pdev)
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

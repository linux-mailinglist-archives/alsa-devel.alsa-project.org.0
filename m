Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F9D7258
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 11:31:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 595BC1684;
	Tue, 15 Oct 2019 11:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 595BC1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571131877;
	bh=Tn+pVZvA+hLOMOn3Z1tk7J0UrTiawvSGWLfPwoM2Nrw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CVm57RByIFo/Sr9k3QQJ/XePHlxTdtNxtQAU76Su13BQMZWfpFHAVPZnwy4bEbcFH
	 qi/KDd+Xhb7BqaR06uk0TRzt+4cL2g8Ce0rzRmj/rGiT0H2anLofOOqTcLZsb1mN7p
	 3cGj32Qjo2hVTL7xkHWxWn4HDQyyuRpGr7zsQOzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC8C3F80635;
	Tue, 15 Oct 2019 11:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20EF3F805AA; Tue, 15 Oct 2019 11:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 945FDF80529
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 11:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 945FDF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Vl3v66aU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jKWbSMiU0eR07Yda8u6bBgcp5URkhC6t+oIPQOGriHQ=; b=Vl3v66aUqb1W
 OJDGU4pisVT/w5kNHfPrET/hjpzY53sc/BXKlIPFKkqvaMeaABSXz4aEMYbCKhTIVT+rk8aHw4MKX
 Wt7liYgZbwL0HYUe+BKgDksdfmEyAHLcozsdHg7Jf6wSbkrD60WC2kA0JZOqWucLrey5lUsZM56J6
 Ts39E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKJ6T-0001oe-DQ; Tue, 15 Oct 2019 09:26:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 962342742B4A; Tue, 15 Oct 2019 10:26:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Naveen M <naveen.m@intel.com>
In-Reply-To: <1571070480-25666-1-git-send-email-brent.lu@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191015092652.962342742B4A@ypsilon.sirena.org.uk>
Date: Tue, 15 Oct 2019 10:26:52 +0100 (BST)
Cc: cezary.rojewski@intel.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, yang.jie@linux.intel.com,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, mac.chiang@intel.com,
 Mark Brown <broonie@kernel.org>, naveen.m@intel.com,
 "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>,
 Brent Lu <brent.lu@intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: eve: Enable mclk and ssp sclk
	early" to the asoc tree
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

The patch

   ASoC: Intel: eve: Enable mclk and ssp sclk early

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 47cbea21628187c32efad562867aa2b6760d83cc Mon Sep 17 00:00:00 2001
From: Naveen M <naveen.m@intel.com>
Date: Tue, 15 Oct 2019 00:28:00 +0800
Subject: [PATCH] ASoC: Intel: eve: Enable mclk and ssp sclk early

rt5663 and rt5514 needs mclk/sclk early to synchronize its internal
clocks.

Signed-off-by: Naveen M <naveen.m@intel.com>
Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
Signed-off-by: Subhransu S. Prusty <subhransu.s.prusty@intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/1571070480-25666-1-git-send-email-brent.lu@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig                |  1 +
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 5c27f7ab4a5f..5e0e7dbd1300 100644
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
index 74dda8784f1a..dc09a85e4c74 100644
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

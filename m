Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFFB167EAA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 14:32:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FFE716B2;
	Fri, 21 Feb 2020 14:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FFE716B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582291970;
	bh=9mM9oxULcQE7uVrFcdv5rA/+pMw6ekVmvzW2PNtgFAc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UUSS/9JxTqMzqqaNP86e1ShkQg7IquPnU53lmgE2BUppFH50fqo050/8zMzMsntSu
	 eZj8gEywg5/OKZz6cMuQWnUBP9SK1f3dY7qEmeBrND6yjrW1/Ft1FTxqOVStyn00e9
	 XqfC56nR3E7otQa33Dt8mUAmkhaTr7g/RchZn7UY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C21F80276;
	Fri, 21 Feb 2020 14:31:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61BF0F8025F; Fri, 21 Feb 2020 14:31:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E71DAF800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 14:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E71DAF800C5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5213E30E;
 Fri, 21 Feb 2020 05:31:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB24E3F703;
 Fri, 21 Feb 2020 05:31:01 -0800 (PST)
Date: Fri, 21 Feb 2020 13:31:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Applied "ASoC: meson: aiu: add support for the Meson8 and Meson8b SoC
 families" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: meson: aiu: add support for the Meson8 and Meson8b SoC families

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 3e25c44598aa44134207ad7b3c5ad6b586135777 Mon Sep 17 00:00:00 2001
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 20 Feb 2020 21:57:11 +0100
Subject: [PATCH] ASoC: meson: aiu: add support for the Meson8 and Meson8b SoC
 families

The AIU audio controller on the Meson8 and Meson8b SoC families is
compatible with the one found in the later GXBB family. Add compatible
strings for these two older SoC families so the driver can be loaded for
them.

Instead of using the I2S divider from the AIU_CLK_CTRL_MORE register we
need to use the I2S divider from the AIU_CLK_CTRL register. This older
register is less flexible because it only supports four divider settings
(1, 2, 4, 8) compared to the AIU_CLK_CTRL_MORE register (which supports
dividers in the range 0..64).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200220205711.77953-4-martin.blumenstingl@googlemail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/Kconfig           |  2 +-
 sound/soc/meson/aiu-encoder-i2s.c | 92 +++++++++++++++++++++++--------
 sound/soc/meson/aiu.c             |  9 +++
 sound/soc/meson/aiu.h             |  1 +
 4 files changed, 81 insertions(+), 23 deletions(-)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 897a706dcda0..d27e9180b453 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -10,7 +10,7 @@ config SND_MESON_AIU
 	imply SND_SOC_HDMI_CODEC if DRM_MESON_DW_HDMI
 	help
 	  Select Y or M to add support for the Audio output subsystem found
-	  in the Amlogic GX SoC family
+	  in the Amlogic Meson8, Meson8b and GX SoC families
 
 config SND_MESON_AXG_FIFO
 	tristate
diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 4900e38e7e49..cc73b5d5c2b7 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -111,34 +111,40 @@ static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
 	return 0;
 }
 
-static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
+static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
+					  struct snd_pcm_hw_params *params,
+					  unsigned int bs)
 {
-	struct aiu *aiu = snd_soc_component_get_drvdata(component);
-	unsigned int srate = params_rate(params);
-	unsigned int fs, bs;
-
-	/* Get the oversampling factor */
-	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
+	switch (bs) {
+	case 1:
+	case 2:
+	case 4:
+	case 8:
+		/* These are the only valid legacy dividers */
+		break;
 
-	if (fs % 64)
+	default:
+		dev_err(component->dev, "Unsupported i2s divider: %u\n", bs);
 		return -EINVAL;
+	};
 
-	/* Send data MSB first */
-	snd_soc_component_update_bits(component, AIU_I2S_DAC_CFG,
-				      AIU_I2S_DAC_CFG_MSB_FIRST,
-				      AIU_I2S_DAC_CFG_MSB_FIRST);
+	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
+				      AIU_CLK_CTRL_I2S_DIV,
+				      FIELD_PREP(AIU_CLK_CTRL_I2S_DIV,
+						 __ffs(bs)));
 
-	/* Set bclk to lrlck ratio */
-	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
-				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
-				      FIELD_PREP(AIU_CODEC_DAC_LRCLK_CTRL_DIV,
-						 64 - 1));
+	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
+				      AIU_CLK_CTRL_MORE_I2S_DIV,
+				      FIELD_PREP(AIU_CLK_CTRL_MORE_I2S_DIV,
+						 0));
 
-	/* Use CLK_MORE for mclk to bclk divider */
-	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
-				      AIU_CLK_CTRL_I2S_DIV, 0);
+	return 0;
+}
 
+static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
+					struct snd_pcm_hw_params *params,
+					unsigned int bs)
+{
 	/*
 	 * NOTE: this HW is odd.
 	 * In most configuration, the i2s divider is 'mclk / blck'.
@@ -146,7 +152,6 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 	 * increased by 50% to get the correct output rate.
 	 * No idea why !
 	 */
-	bs = fs / 64;
 	if (params_width(params) == 16 && params_channels(params) == 8) {
 		if (bs % 2) {
 			dev_err(component->dev,
@@ -156,11 +161,54 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 		bs += bs / 2;
 	}
 
+	/* Use CLK_MORE for mclk to bclk divider */
+	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
+				      AIU_CLK_CTRL_I2S_DIV,
+				      FIELD_PREP(AIU_CLK_CTRL_I2S_DIV, 0));
+
 	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
 				      AIU_CLK_CTRL_MORE_I2S_DIV,
 				      FIELD_PREP(AIU_CLK_CTRL_MORE_I2S_DIV,
 						 bs - 1));
 
+	return 0;
+}
+
+static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
+				      struct snd_pcm_hw_params *params)
+{
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	unsigned int srate = params_rate(params);
+	unsigned int fs, bs;
+	int ret;
+
+	/* Get the oversampling factor */
+	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
+
+	if (fs % 64)
+		return -EINVAL;
+
+	/* Send data MSB first */
+	snd_soc_component_update_bits(component, AIU_I2S_DAC_CFG,
+				      AIU_I2S_DAC_CFG_MSB_FIRST,
+				      AIU_I2S_DAC_CFG_MSB_FIRST);
+
+	/* Set bclk to lrlck ratio */
+	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
+				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
+				      FIELD_PREP(AIU_CODEC_DAC_LRCLK_CTRL_DIV,
+						 64 - 1));
+
+	bs = fs / 64;
+
+	if (aiu->platform->has_clk_ctrl_more_i2s_div)
+		ret = aiu_encoder_i2s_set_more_div(component, params, bs);
+	else
+		ret = aiu_encoder_i2s_set_legacy_div(component, params, bs);
+
+	if (ret)
+		return ret;
+
 	/* Make sure amclk is used for HDMI i2s as well */
 	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
 				      AIU_CLK_CTRL_MORE_HDMI_AMCLK,
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 38209312a8c3..dc35ca79021c 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -351,15 +351,24 @@ static int aiu_remove(struct platform_device *pdev)
 
 static const struct aiu_platform_data aiu_gxbb_pdata = {
 	.has_acodec = false,
+	.has_clk_ctrl_more_i2s_div = true,
 };
 
 static const struct aiu_platform_data aiu_gxl_pdata = {
 	.has_acodec = true,
+	.has_clk_ctrl_more_i2s_div = true,
+};
+
+static const struct aiu_platform_data aiu_meson8_pdata = {
+	.has_acodec = false,
+	.has_clk_ctrl_more_i2s_div = false,
 };
 
 static const struct of_device_id aiu_of_match[] = {
 	{ .compatible = "amlogic,aiu-gxbb", .data = &aiu_gxbb_pdata },
 	{ .compatible = "amlogic,aiu-gxl", .data = &aiu_gxl_pdata },
+	{ .compatible = "amlogic,aiu-meson8", .data = &aiu_meson8_pdata },
+	{ .compatible = "amlogic,aiu-meson8b", .data = &aiu_meson8_pdata },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aiu_of_match);
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index ab003638d5e5..87aa19ac4af3 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -29,6 +29,7 @@ struct aiu_interface {
 
 struct aiu_platform_data {
 	bool has_acodec;
+	bool has_clk_ctrl_more_i2s_div;
 };
 
 struct aiu {
-- 
2.20.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE93613AEFA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:16:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7268B1825;
	Tue, 14 Jan 2020 17:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7268B1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579018596;
	bh=PaBLKKNIzzG9WdpBQ5QfVnnYqywmIJqRC8b9PH4SLNE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nmZwtgXyToQn7fz4rD852rkDcpjqFAN24ztKotOU7rxtLCM17nKtulIx22XRUBROx
	 dfVlN1Bxnq0fOAlOyDhEOm5lZw+4C0b1qBa+RCtq0QLxg2oPATYw+mqkDL1l/VJKNa
	 3V1bg0uK8MgxJsqAJvkdxghsJWctEYEwBgdHLiuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4F70F80305;
	Tue, 14 Jan 2020 17:09:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484B9F802EA; Tue, 14 Jan 2020 17:09:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F289F8022B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F289F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="PEht3JSx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=25mJDQ+PhdP00wAWxfPtHAWNyBXeVzlaLWh9mnNo3HQ=; b=PEht3JSxXtLH
 gv9R6AlLJUdXOX5xB56Y6GoNkfmvTwdJPWMX9Yt7JByT5oS1qQBXcgT2PSUrvk1YJCakpLXnZqnwK
 yA9/2DxE/SLAzfoniSJVkj4KdGh+xlyZEanlKSYh9Qx+GBlU7/qK8YgLasJ2dLMQFODguc7PR2j1t
 n3BZA=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkd-0001V0-KQ; Tue, 14 Jan 2020 16:09:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 59C5CD02C7B; Tue, 14 Jan 2020 16:09:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
In-Reply-To: <20191224002708.1207884-2-paul@crapouillou.net>
Message-Id: <applied-20191224002708.1207884-2-paul@crapouillou.net>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:07 +0000 (GMT)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, od@zcrc.me, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maarten ter Huurne <maarten@treewalker.org>
Subject: [alsa-devel] Applied "ASoC: codecs: Add jz4770-codec driver" to the
	asoc tree
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

   ASoC: codecs: Add jz4770-codec driver

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 2159a6810e96c38a469c39df8e109edb7232d3c9 Mon Sep 17 00:00:00 2001
From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 24 Dec 2019 01:27:08 +0100
Subject: [PATCH] ASoC: codecs: Add jz4770-codec driver

Add jz4770-codec driver to support the internal CODEC found in the
JZ4770 SoC from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Link: https://lore.kernel.org/r/20191224002708.1207884-2-paul@crapouillou.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig  |  12 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/jz4770.c | 948 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 962 insertions(+)
 create mode 100644 sound/soc/codecs/jz4770.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2f52e4cac96a..de3f13dafc3c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -101,6 +101,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_ISABELLE if I2C
 	select SND_SOC_JZ4740_CODEC
 	select SND_SOC_JZ4725B_CODEC
+	select SND_SOC_JZ4770_CODEC
 	select SND_SOC_LM4857 if I2C
 	select SND_SOC_LM49453 if I2C
 	select SND_SOC_LOCHNAGAR_SC if MFD_LOCHNAGAR
@@ -678,6 +679,17 @@ config SND_SOC_JZ4725B_CODEC
 	  This driver can also be built as a module. If so, the module
 	  will be called snd-soc-jz4725b-codec.
 
+config SND_SOC_JZ4770_CODEC
+	depends on MIPS || COMPILE_TEST
+	select REGMAP
+	tristate "Ingenic JZ4770 internal CODEC"
+	help
+	  Enable support for the internal CODEC found in the JZ4770 SoC
+	  from Ingenic.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called snd-soc-jz4770-codec.
+
 config SND_SOC_L3
        tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 66aa452f5aa2..751f2b4d095b 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -97,6 +97,7 @@ snd-soc-inno-rk3036-objs := inno_rk3036.o
 snd-soc-isabelle-objs := isabelle.o
 snd-soc-jz4740-codec-objs := jz4740.o
 snd-soc-jz4725b-codec-objs := jz4725b.o
+snd-soc-jz4770-codec-objs := jz4770.o
 snd-soc-l3-objs := l3.o
 snd-soc-lm4857-objs := lm4857.o
 snd-soc-lm49453-objs := lm49453.o
@@ -392,6 +393,7 @@ obj-$(CONFIG_SND_SOC_INNO_RK3036)	+= snd-soc-inno-rk3036.o
 obj-$(CONFIG_SND_SOC_ISABELLE)	+= snd-soc-isabelle.o
 obj-$(CONFIG_SND_SOC_JZ4740_CODEC)	+= snd-soc-jz4740-codec.o
 obj-$(CONFIG_SND_SOC_JZ4725B_CODEC)	+= snd-soc-jz4725b-codec.o
+obj-$(CONFIG_SND_SOC_JZ4770_CODEC)	+= snd-soc-jz4770-codec.o
 obj-$(CONFIG_SND_SOC_L3)	+= snd-soc-l3.o
 obj-$(CONFIG_SND_SOC_LM4857)	+= snd-soc-lm4857.o
 obj-$(CONFIG_SND_SOC_LM49453)   += snd-soc-lm49453.o
diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
new file mode 100644
index 000000000000..e7cf2c107607
--- /dev/null
+++ b/sound/soc/codecs/jz4770.c
@@ -0,0 +1,948 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Ingenic JZ4770 CODEC driver
+//
+// Copyright (C) 2012, Maarten ter Huurne <maarten@treewalker.org>
+// Copyright (C) 2019, Paul Cercueil <paul@crapouillou.net>
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/time64.h>
+
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+
+#define ICDC_RGADW_OFFSET		0x00
+#define ICDC_RGDATA_OFFSET		0x04
+
+/* ICDC internal register access control register(RGADW) */
+#define ICDC_RGADW_RGWR			BIT(16)
+
+#define ICDC_RGADW_RGADDR_OFFSET	8
+#define	ICDC_RGADW_RGADDR_MASK		GENMASK(14, ICDC_RGADW_RGADDR_OFFSET)
+
+#define ICDC_RGADW_RGDIN_OFFSET		0
+#define	ICDC_RGADW_RGDIN_MASK		GENMASK(7, ICDC_RGADW_RGDIN_OFFSET)
+
+/* ICDC internal register data output register (RGDATA)*/
+#define ICDC_RGDATA_IRQ			BIT(8)
+
+#define ICDC_RGDATA_RGDOUT_OFFSET	0
+#define ICDC_RGDATA_RGDOUT_MASK		GENMASK(7, ICDC_RGDATA_RGDOUT_OFFSET)
+
+/* Internal register space, accessed through regmap */
+enum {
+	JZ4770_CODEC_REG_SR,
+	JZ4770_CODEC_REG_AICR_DAC,
+	JZ4770_CODEC_REG_AICR_ADC,
+	JZ4770_CODEC_REG_CR_LO,
+	JZ4770_CODEC_REG_CR_HP,
+
+	JZ4770_CODEC_REG_MISSING_REG1,
+
+	JZ4770_CODEC_REG_CR_DAC,
+	JZ4770_CODEC_REG_CR_MIC,
+	JZ4770_CODEC_REG_CR_LI,
+	JZ4770_CODEC_REG_CR_ADC,
+	JZ4770_CODEC_REG_CR_MIX,
+	JZ4770_CODEC_REG_CR_VIC,
+	JZ4770_CODEC_REG_CCR,
+	JZ4770_CODEC_REG_FCR_DAC,
+	JZ4770_CODEC_REG_FCR_ADC,
+	JZ4770_CODEC_REG_ICR,
+	JZ4770_CODEC_REG_IMR,
+	JZ4770_CODEC_REG_IFR,
+	JZ4770_CODEC_REG_GCR_HPL,
+	JZ4770_CODEC_REG_GCR_HPR,
+	JZ4770_CODEC_REG_GCR_LIBYL,
+	JZ4770_CODEC_REG_GCR_LIBYR,
+	JZ4770_CODEC_REG_GCR_DACL,
+	JZ4770_CODEC_REG_GCR_DACR,
+	JZ4770_CODEC_REG_GCR_MIC1,
+	JZ4770_CODEC_REG_GCR_MIC2,
+	JZ4770_CODEC_REG_GCR_ADCL,
+	JZ4770_CODEC_REG_GCR_ADCR,
+
+	JZ4770_CODEC_REG_MISSING_REG2,
+
+	JZ4770_CODEC_REG_GCR_MIXADC,
+	JZ4770_CODEC_REG_GCR_MIXDAC,
+	JZ4770_CODEC_REG_AGC1,
+	JZ4770_CODEC_REG_AGC2,
+	JZ4770_CODEC_REG_AGC3,
+	JZ4770_CODEC_REG_AGC4,
+	JZ4770_CODEC_REG_AGC5,
+};
+
+#define REG_AICR_DAC_ADWL_OFFSET	6
+#define REG_AICR_DAC_ADWL_MASK		(0x3 << REG_AICR_DAC_ADWL_OFFSET)
+#define REG_AICR_DAC_SERIAL		BIT(1)
+#define REG_AICR_DAC_I2S		BIT(0)
+
+#define REG_AICR_ADC_ADWL_OFFSET	6
+#define REG_AICR_ADC_ADWL_MASK		(0x3 << REG_AICR_ADC_ADWL_OFFSET)
+#define REG_AICR_ADC_SERIAL		BIT(1)
+#define REG_AICR_ADC_I2S		BIT(0)
+
+#define REG_CR_LO_MUTE_OFFSET		7
+#define REG_CR_LO_SB_OFFSET		4
+#define REG_CR_LO_SEL_OFFSET		0
+#define REG_CR_LO_SEL_MASK		(0x3 << REG_CR_LO_SEL_OFFSET)
+
+#define REG_CR_HP_MUTE			BIT(7)
+#define REG_CR_HP_LOAD			BIT(6)
+#define REG_CR_HP_SB_OFFSET		4
+#define REG_CR_HP_SB_HPCM		BIT(3)
+#define REG_CR_HP_SEL_OFFSET		0
+#define REG_CR_HP_SEL_MASK		(0x3 << REG_CR_HP_SEL_OFFSET)
+
+#define REG_CR_DAC_MUTE			BIT(7)
+#define REG_CR_DAC_MONO			BIT(6)
+#define REG_CR_DAC_LEFT_ONLY		BIT(5)
+#define REG_CR_DAC_SB_OFFSET		4
+#define REG_CR_DAC_LRSWAP		BIT(3)
+
+#define REG_CR_MIC_STEREO_OFFSET	7
+#define REG_CR_MIC_IDIFF_OFFSET		6
+#define REG_CR_MIC_SB_MIC2_OFFSET	5
+#define REG_CR_MIC_SB_MIC1_OFFSET	4
+#define REG_CR_MIC_BIAS_V0_OFFSET	1
+#define REG_CR_MIC_BIAS_SB_OFFSET	0
+
+#define REG_CR_LI_LIBY_OFFSET		4
+#define REG_CR_LI_SB_OFFSET		0
+
+#define REG_CR_ADC_DMIC_SEL		BIT(7)
+#define REG_CR_ADC_MONO			BIT(6)
+#define REG_CR_ADC_LEFT_ONLY		BIT(5)
+#define REG_CR_ADC_SB_OFFSET		4
+#define REG_CR_ADC_LRSWAP		BIT(3)
+#define REG_CR_ADC_IN_SEL_OFFSET	0
+#define REG_CR_ADC_IN_SEL_MASK		(0x3 << REG_CR_ADC_IN_SEL_OFFSET)
+
+#define REG_CR_VIC_SB_SLEEP		BIT(1)
+#define REG_CR_VIC_SB			BIT(0)
+
+#define REG_CCR_CRYSTAL_OFFSET		0
+#define REG_CCR_CRYSTAL_MASK		(0xf << REG_CCR_CRYSTAL_OFFSET)
+
+#define REG_FCR_DAC_FREQ_OFFSET		0
+#define REG_FCR_DAC_FREQ_MASK		(0xf << REG_FCR_DAC_FREQ_OFFSET)
+
+#define REG_FCR_ADC_FREQ_OFFSET		0
+#define REG_FCR_ADC_FREQ_MASK		(0xf << REG_FCR_ADC_FREQ_OFFSET)
+
+#define REG_ICR_INT_FORM_OFFSET		6
+#define REG_ICR_INT_FORM_MASK		(0x3 << REG_ICR_INT_FORM_OFFSET)
+
+#define REG_IMR_ALL_MASK		(0x7f)
+#define REG_IMR_SCLR_MASK		BIT(6)
+#define REG_IMR_JACK_MASK		BIT(5)
+#define REG_IMR_SCMC_MASK		BIT(4)
+#define REG_IMR_RUP_MASK		BIT(3)
+#define REG_IMR_RDO_MASK		BIT(2)
+#define REG_IMR_GUP_MASK		BIT(1)
+#define REG_IMR_GDO_MASK		BIT(0)
+
+#define REG_IFR_ALL_MASK		(0x7f)
+#define REG_IFR_SCLR			BIT(6)
+#define REG_IFR_JACK			BIT(5)
+#define REG_IFR_SCMC			BIT(4)
+#define REG_IFR_RUP			BIT(3)
+#define REG_IFR_RDO			BIT(2)
+#define REG_IFR_GUP			BIT(1)
+#define REG_IFR_GDO			BIT(0)
+
+#define REG_GCR_HPL_LRGO		BIT(7)
+
+#define REG_GCR_DACL_RLGOD		BIT(7)
+
+#define REG_GCR_GAIN_OFFSET		0
+#define REG_GCR_GAIN_MAX		0x1f
+
+#define REG_GCR_MIC_GAIN_OFFSET		0
+#define REG_GCR_MIC_GAIN_MAX		5
+
+#define REG_GCR_ADC_GAIN_OFFSET		0
+#define REG_GCR_ADC_GAIN_MAX		23
+
+#define REG_AGC1_EN			BIT(7)
+
+/* codec private data */
+struct jz_codec {
+	struct device *dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	struct clk *clk;
+};
+
+static int jz4770_codec_set_bias_level(struct snd_soc_component *codec,
+				       enum snd_soc_bias_level level)
+{
+	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
+	struct regmap *regmap = jz_codec->regmap;
+
+	switch (level) {
+	case SND_SOC_BIAS_PREPARE:
+		regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_VIC,
+				   REG_CR_VIC_SB, 0);
+		msleep(250);
+		regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_VIC,
+				   REG_CR_VIC_SB_SLEEP, 0);
+		msleep(400);
+		break;
+	case SND_SOC_BIAS_STANDBY:
+		regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_VIC,
+				   REG_CR_VIC_SB_SLEEP, REG_CR_VIC_SB_SLEEP);
+		regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_VIC,
+				   REG_CR_VIC_SB, REG_CR_VIC_SB);
+	/* fall-through */
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int jz4770_codec_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+
+	/*
+	 * SYSCLK output from the codec to the AIC is required to keep the
+	 * DMA transfer going during playback when all audible outputs have
+	 * been disabled.
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		snd_soc_dapm_force_enable_pin(dapm, "SYSCLK");
+
+	return 0;
+}
+
+static void jz4770_codec_shutdown(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		snd_soc_dapm_disable_pin(dapm, "SYSCLK");
+}
+
+
+static int jz4770_codec_pcm_trigger(struct snd_pcm_substream *substream,
+				    int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+			snd_soc_component_force_bias_level(codec,
+							   SND_SOC_BIAS_ON);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		/* do nothing */
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int jz4770_codec_digital_mute(struct snd_soc_dai *dai, int mute)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
+	unsigned int gain_bit = mute ? REG_IFR_GDO : REG_IFR_GUP;
+	unsigned int val;
+	int change, err;
+
+	change = snd_soc_component_update_bits(codec, JZ4770_CODEC_REG_CR_DAC,
+					       REG_CR_DAC_MUTE,
+					       mute ? REG_CR_DAC_MUTE : 0);
+	if (change == 1) {
+		regmap_read(jz_codec->regmap, JZ4770_CODEC_REG_CR_DAC, &val);
+
+		if (val & BIT(REG_CR_DAC_SB_OFFSET))
+			return 1;
+
+		err = regmap_read_poll_timeout(jz_codec->regmap,
+					       JZ4770_CODEC_REG_IFR,
+					       val, val & gain_bit,
+					       1000, 100 * USEC_PER_MSEC);
+		if (err) {
+			dev_err(jz_codec->dev,
+				"Timeout while setting digital mute: %d", err);
+			return err;
+		}
+
+		/* clear GUP/GDO flag */
+		regmap_update_bits(jz_codec->regmap, JZ4770_CODEC_REG_IFR,
+				   gain_bit, gain_bit);
+	}
+
+	return 0;
+}
+
+/* unit: 0.01dB */
+static const DECLARE_TLV_DB_MINMAX_MUTE(dac_tlv, -3100, 0);
+static const DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
+static const DECLARE_TLV_DB_MINMAX(out_tlv, -2500, 600);
+static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
+static const DECLARE_TLV_DB_SCALE(linein_tlv, -2500, 100, 0);
+
+/* Unconditional controls. */
+static const struct snd_kcontrol_new jz4770_codec_snd_controls[] = {
+	/* record gain control */
+	SOC_DOUBLE_R_TLV("PCM Capture Volume",
+			 JZ4770_CODEC_REG_GCR_ADCL, JZ4770_CODEC_REG_GCR_ADCR,
+			 REG_GCR_ADC_GAIN_OFFSET, REG_GCR_ADC_GAIN_MAX,
+			 0, adc_tlv),
+
+	SOC_DOUBLE_R_TLV("Line In Bypass Playback Volume",
+			 JZ4770_CODEC_REG_GCR_LIBYL, JZ4770_CODEC_REG_GCR_LIBYR,
+			 REG_GCR_GAIN_OFFSET, REG_GCR_GAIN_MAX, 1, linein_tlv),
+};
+
+static const struct snd_kcontrol_new jz4770_codec_pcm_playback_controls[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Volume",
+		.info = snd_soc_info_volsw,
+		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ
+			| SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.tlv.p = dac_tlv,
+		.get = snd_soc_dapm_get_volsw,
+		.put = snd_soc_dapm_put_volsw,
+		/*
+		 * NOTE: DACR/DACL are inversed; the gain value written to DACR
+		 * seems to affect the left channel, and the gain value written
+		 * to DACL seems to affect the right channel.
+		 */
+		.private_value = SOC_DOUBLE_R_VALUE(JZ4770_CODEC_REG_GCR_DACR,
+						    JZ4770_CODEC_REG_GCR_DACL,
+						    REG_GCR_GAIN_OFFSET,
+						    REG_GCR_GAIN_MAX, 1),
+	},
+};
+
+static const struct snd_kcontrol_new jz4770_codec_hp_playback_controls[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Volume",
+		.info = snd_soc_info_volsw,
+		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ
+			| SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.tlv.p = out_tlv,
+		.get = snd_soc_dapm_get_volsw,
+		.put = snd_soc_dapm_put_volsw,
+		/* HPR/HPL inversed for the same reason as above */
+		.private_value = SOC_DOUBLE_R_VALUE(JZ4770_CODEC_REG_GCR_HPR,
+						    JZ4770_CODEC_REG_GCR_HPL,
+						    REG_GCR_GAIN_OFFSET,
+						    REG_GCR_GAIN_MAX, 1),
+	},
+};
+
+static int hpout_event(struct snd_soc_dapm_widget *w,
+		       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
+	unsigned int val;
+	int err;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* set cap-less, unmute HP */
+		regmap_update_bits(jz_codec->regmap, JZ4770_CODEC_REG_CR_HP,
+				   REG_CR_HP_SB_HPCM | REG_CR_HP_MUTE, 0);
+		break;
+
+	case SND_SOC_DAPM_POST_PMU:
+		/* wait for ramp-up complete (RUP) */
+		err = regmap_read_poll_timeout(jz_codec->regmap,
+					       JZ4770_CODEC_REG_IFR,
+					       val, val & REG_IFR_RUP,
+					       1000, 100 * USEC_PER_MSEC);
+		if (err) {
+			dev_err(jz_codec->dev, "RUP timeout: %d", err);
+			return err;
+		}
+
+		/* clear RUP flag */
+		regmap_update_bits(jz_codec->regmap, JZ4770_CODEC_REG_IFR,
+				   REG_IFR_RUP, REG_IFR_RUP);
+
+		break;
+
+	case SND_SOC_DAPM_POST_PMD:
+		/* set cap-couple, mute HP */
+		regmap_update_bits(jz_codec->regmap, JZ4770_CODEC_REG_CR_HP,
+				   REG_CR_HP_SB_HPCM | REG_CR_HP_MUTE,
+				   REG_CR_HP_SB_HPCM | REG_CR_HP_MUTE);
+
+		err = regmap_read_poll_timeout(jz_codec->regmap,
+					       JZ4770_CODEC_REG_IFR,
+					       val, val & REG_IFR_RDO,
+					       1000, 100 * USEC_PER_MSEC);
+		if (err) {
+			dev_err(jz_codec->dev, "RDO timeout: %d", err);
+			return err;
+		}
+
+		/* clear RDO flag */
+		regmap_update_bits(jz_codec->regmap, JZ4770_CODEC_REG_IFR,
+				   REG_IFR_RDO, REG_IFR_RDO);
+
+		break;
+	}
+
+	return 0;
+}
+
+static int adc_poweron_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	if (event == SND_SOC_DAPM_POST_PMU)
+		msleep(1000);
+
+	return 0;
+}
+
+static const char * const jz4770_codec_hp_texts[] = {
+	"PCM", "Line In", "Mic 1", "Mic 2"
+};
+static const unsigned int jz4770_codec_hp_values[] = { 3, 2, 0, 1 };
+static SOC_VALUE_ENUM_SINGLE_DECL(jz4770_codec_hp_enum,
+				  JZ4770_CODEC_REG_CR_HP,
+				  REG_CR_HP_SEL_OFFSET,
+				  REG_CR_HP_SEL_MASK,
+				  jz4770_codec_hp_texts,
+				  jz4770_codec_hp_values);
+static const struct snd_kcontrol_new jz4770_codec_hp_source =
+			SOC_DAPM_ENUM("Route", jz4770_codec_hp_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(jz4770_codec_lo_enum,
+				  JZ4770_CODEC_REG_CR_LO,
+				  REG_CR_LO_SEL_OFFSET,
+				  REG_CR_LO_SEL_MASK,
+				  jz4770_codec_hp_texts,
+				  jz4770_codec_hp_values);
+static const struct snd_kcontrol_new jz4770_codec_lo_source =
+			SOC_DAPM_ENUM("Route", jz4770_codec_lo_enum);
+
+static const char * const jz4770_codec_cap_texts[] = {
+	"Line In", "Mic 1", "Mic 2"
+};
+static const unsigned int jz4770_codec_cap_values[] = { 2, 0, 1 };
+static SOC_VALUE_ENUM_SINGLE_DECL(jz4770_codec_cap_enum,
+				  JZ4770_CODEC_REG_CR_ADC,
+				  REG_CR_ADC_IN_SEL_OFFSET,
+				  REG_CR_ADC_IN_SEL_MASK,
+				  jz4770_codec_cap_texts,
+				  jz4770_codec_cap_values);
+static const struct snd_kcontrol_new jz4770_codec_cap_source =
+			SOC_DAPM_ENUM("Route", jz4770_codec_cap_enum);
+
+static const struct snd_kcontrol_new jz4770_codec_mic_controls[] = {
+	SOC_DAPM_SINGLE("Stereo Capture Switch", JZ4770_CODEC_REG_CR_MIC,
+			REG_CR_MIC_STEREO_OFFSET, 1, 0),
+};
+
+static const struct snd_soc_dapm_widget jz4770_codec_dapm_widgets[] = {
+	SND_SOC_DAPM_PGA_E("HP Out", JZ4770_CODEC_REG_CR_HP,
+			   REG_CR_HP_SB_OFFSET, 1, NULL, 0, hpout_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_PGA("Line Out", JZ4770_CODEC_REG_CR_LO,
+			 REG_CR_LO_SB_OFFSET, 1, NULL, 0),
+
+	SND_SOC_DAPM_PGA("Line Out Switch 2", JZ4770_CODEC_REG_CR_LO,
+			 REG_CR_LO_MUTE_OFFSET, 1, NULL, 0),
+
+	SND_SOC_DAPM_PGA("Line In", JZ4770_CODEC_REG_CR_LI,
+			 REG_CR_LI_SB_OFFSET, 1, NULL, 0),
+
+	SND_SOC_DAPM_MUX("Headphones Source", SND_SOC_NOPM, 0, 0,
+			 &jz4770_codec_hp_source),
+	SND_SOC_DAPM_MUX("Capture Source", SND_SOC_NOPM, 0, 0,
+			 &jz4770_codec_cap_source),
+	SND_SOC_DAPM_MUX("Line Out Source", SND_SOC_NOPM, 0, 0,
+			 &jz4770_codec_lo_source),
+
+	SND_SOC_DAPM_PGA("Mic 1", JZ4770_CODEC_REG_CR_MIC,
+			 REG_CR_MIC_SB_MIC1_OFFSET, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("Mic 2", JZ4770_CODEC_REG_CR_MIC,
+			 REG_CR_MIC_SB_MIC2_OFFSET, 1, NULL, 0),
+
+	SND_SOC_DAPM_PGA("Mic Diff", JZ4770_CODEC_REG_CR_MIC,
+			 REG_CR_MIC_IDIFF_OFFSET, 0, NULL, 0),
+
+	SND_SOC_DAPM_MIXER("Mic", SND_SOC_NOPM, 0, 0,
+			   jz4770_codec_mic_controls,
+			   ARRAY_SIZE(jz4770_codec_mic_controls)),
+
+	SND_SOC_DAPM_PGA("Line In Bypass", JZ4770_CODEC_REG_CR_LI,
+			 REG_CR_LI_LIBY_OFFSET, 1, NULL, 0),
+
+	SND_SOC_DAPM_ADC_E("ADC", "HiFi Capture", JZ4770_CODEC_REG_CR_ADC,
+			   REG_CR_ADC_SB_OFFSET, 1, adc_poweron_event,
+			   SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_DAC("DAC", "HiFi Playback", JZ4770_CODEC_REG_CR_DAC,
+			 REG_CR_DAC_SB_OFFSET, 1),
+
+	SND_SOC_DAPM_MIXER("PCM Playback", SND_SOC_NOPM, 0, 0,
+			   jz4770_codec_pcm_playback_controls,
+			   ARRAY_SIZE(jz4770_codec_pcm_playback_controls)),
+	SND_SOC_DAPM_MIXER("Headphones Playback", SND_SOC_NOPM, 0, 0,
+			   jz4770_codec_hp_playback_controls,
+			   ARRAY_SIZE(jz4770_codec_hp_playback_controls)),
+
+	SND_SOC_DAPM_SUPPLY("MICBIAS", JZ4770_CODEC_REG_CR_MIC,
+			    REG_CR_MIC_BIAS_SB_OFFSET, 1, NULL, 0),
+
+	SND_SOC_DAPM_INPUT("MIC1P"),
+	SND_SOC_DAPM_INPUT("MIC1N"),
+	SND_SOC_DAPM_INPUT("MIC2P"),
+	SND_SOC_DAPM_INPUT("MIC2N"),
+
+	SND_SOC_DAPM_OUTPUT("LOUT"),
+	SND_SOC_DAPM_OUTPUT("ROUT"),
+
+	SND_SOC_DAPM_OUTPUT("LHPOUT"),
+	SND_SOC_DAPM_OUTPUT("RHPOUT"),
+
+	SND_SOC_DAPM_INPUT("LLINEIN"),
+	SND_SOC_DAPM_INPUT("RLINEIN"),
+
+	SND_SOC_DAPM_OUTPUT("SYSCLK"),
+};
+
+/* Unconditional routes. */
+static const struct snd_soc_dapm_route jz4770_codec_dapm_routes[] = {
+	{ "Mic 1", NULL, "MIC1P" },
+	{ "Mic Diff", NULL, "MIC1N" },
+	{ "Mic 1", NULL, "Mic Diff" },
+	{ "Mic 2", NULL, "MIC2P" },
+	{ "Mic Diff", NULL, "MIC2N" },
+	{ "Mic 2", NULL, "Mic Diff" },
+
+	{ "Line In", NULL, "LLINEIN" },
+	{ "Line In", NULL, "RLINEIN" },
+
+	{ "Mic", "Stereo Capture Switch", "Mic 1" },
+	{ "Mic", "Stereo Capture Switch", "Mic 2" },
+	{ "Headphones Source", "Mic 1", "Mic" },
+	{ "Headphones Source", "Mic 2", "Mic" },
+	{ "Capture Source", "Mic 1", "Mic" },
+	{ "Capture Source", "Mic 2", "Mic" },
+
+	{ "Headphones Source", "Mic 1", "Mic 1" },
+	{ "Headphones Source", "Mic 2", "Mic 2" },
+	{ "Headphones Source", "Line In", "Line In Bypass" },
+	{ "Headphones Source", "PCM", "Headphones Playback" },
+	{ "HP Out", NULL, "Headphones Source" },
+
+	{ "Capture Source", "Line In", "Line In" },
+	{ "Capture Source", "Mic 1", "Mic 1" },
+	{ "Capture Source", "Mic 2", "Mic 2" },
+	{ "ADC", NULL, "Capture Source" },
+
+	{ "Line In Bypass", NULL, "Line In" },
+	{ "Line Out Source", "Line In", "Line In Bypass" },
+	{ "Line Out Source", "PCM", "PCM Playback" },
+
+	{ "LHPOUT", NULL, "HP Out"},
+	{ "RHPOUT", NULL, "HP Out"},
+
+	{ "Line Out", NULL, "Line Out Source" },
+	{ "Line Out Switch 2", NULL, "Line Out" },
+
+	{ "LOUT", NULL, "Line Out Switch 2"},
+	{ "ROUT", NULL, "Line Out Switch 2"},
+
+	{ "PCM Playback", "Volume", "DAC" },
+	{ "Headphones Playback", "Volume", "PCM Playback" },
+
+	{ "SYSCLK", NULL, "DAC" },
+};
+
+static void jz4770_codec_codec_init_regs(struct snd_soc_component *codec)
+{
+	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
+	struct regmap *regmap = jz_codec->regmap;
+
+	/* Collect updates for later sending. */
+	regcache_cache_only(regmap, true);
+
+	/* default HP output to PCM */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_HP,
+			   REG_CR_HP_SEL_MASK, REG_CR_HP_SEL_MASK);
+
+	/* default line output to PCM */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_LO,
+			   REG_CR_LO_SEL_MASK, REG_CR_LO_SEL_MASK);
+
+	/* Disable stereo mic */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_MIC,
+			   BIT(REG_CR_MIC_STEREO_OFFSET), 0);
+
+	/* Set mic 1 as default source for ADC */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_ADC,
+			   REG_CR_ADC_IN_SEL_MASK, 0);
+
+	/* ADC/DAC: serial + i2s */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_AICR_ADC,
+			   REG_AICR_ADC_SERIAL | REG_AICR_ADC_I2S,
+			   REG_AICR_ADC_SERIAL | REG_AICR_ADC_I2S);
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_AICR_DAC,
+			   REG_AICR_DAC_SERIAL | REG_AICR_DAC_I2S,
+			   REG_AICR_DAC_SERIAL | REG_AICR_DAC_I2S);
+
+	/* The generated IRQ is a high level */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_ICR,
+			   REG_ICR_INT_FORM_MASK, 0);
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_IMR, REG_IMR_ALL_MASK,
+			   REG_IMR_JACK_MASK | REG_IMR_RUP_MASK |
+			   REG_IMR_RDO_MASK | REG_IMR_GUP_MASK |
+			   REG_IMR_GDO_MASK);
+
+	/* 12M oscillator */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CCR,
+			   REG_CCR_CRYSTAL_MASK, 0);
+
+	/* 0: 16ohm/220uF, 1: 10kohm/1uF */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_HP,
+			   REG_CR_HP_LOAD, 0);
+
+	/* disable automatic gain */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_AGC1, REG_AGC1_EN, 0);
+
+	/* Disable DAC lrswap */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_DAC,
+			   REG_CR_DAC_LRSWAP, REG_CR_DAC_LRSWAP);
+
+	/* Independent L/R DAC gain control */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_GCR_DACL,
+			   REG_GCR_DACL_RLGOD, 0);
+
+	/* Disable ADC lrswap */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_ADC,
+			   REG_CR_ADC_LRSWAP, REG_CR_ADC_LRSWAP);
+
+	/* default to cap-less mode(0) */
+	regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_HP,
+			   REG_CR_HP_SB_HPCM, 0);
+
+	/* Send collected updates. */
+	regcache_cache_only(regmap, false);
+	regcache_sync(regmap);
+
+	/* Reset all interrupt flags. */
+	regmap_write(regmap, JZ4770_CODEC_REG_IFR, REG_IFR_ALL_MASK);
+}
+
+static int jz4770_codec_codec_probe(struct snd_soc_component *codec)
+{
+	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
+
+	clk_prepare_enable(jz_codec->clk);
+
+	jz4770_codec_codec_init_regs(codec);
+
+	return 0;
+}
+
+static void jz4770_codec_codec_remove(struct snd_soc_component *codec)
+{
+	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
+
+	clk_disable_unprepare(jz_codec->clk);
+}
+
+static const struct snd_soc_component_driver jz4770_codec_soc_codec_dev = {
+	.probe			= jz4770_codec_codec_probe,
+	.remove			= jz4770_codec_codec_remove,
+	.set_bias_level		= jz4770_codec_set_bias_level,
+	.controls		= jz4770_codec_snd_controls,
+	.num_controls		= ARRAY_SIZE(jz4770_codec_snd_controls),
+	.dapm_widgets		= jz4770_codec_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(jz4770_codec_dapm_widgets),
+	.dapm_routes		= jz4770_codec_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(jz4770_codec_dapm_routes),
+	.suspend_bias_off	= 1,
+	.use_pmdown_time	= 1,
+};
+
+static const unsigned int jz4770_codec_sample_rates[] = {
+	96000, 48000, 44100, 32000,
+	24000, 22050, 16000, 12000,
+	11025, 9600, 8000,
+};
+
+static int jz4770_codec_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct jz_codec *codec = snd_soc_component_get_drvdata(dai->component);
+	unsigned int rate, bit_width;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		bit_width = 0;
+		break;
+	case SNDRV_PCM_FORMAT_S18_3LE:
+		bit_width = 1;
+		break;
+	case SNDRV_PCM_FORMAT_S20_3LE:
+		bit_width = 2;
+		break;
+	case SNDRV_PCM_FORMAT_S24_3LE:
+		bit_width = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (rate = 0; rate < ARRAY_SIZE(jz4770_codec_sample_rates); rate++) {
+		if (jz4770_codec_sample_rates[rate] == params_rate(params))
+			break;
+	}
+
+	if (rate == ARRAY_SIZE(jz4770_codec_sample_rates))
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_update_bits(codec->regmap, JZ4770_CODEC_REG_AICR_DAC,
+				   REG_AICR_DAC_ADWL_MASK,
+				   bit_width << REG_AICR_DAC_ADWL_OFFSET);
+		regmap_update_bits(codec->regmap, JZ4770_CODEC_REG_FCR_DAC,
+				   REG_FCR_DAC_FREQ_MASK,
+				   rate << REG_FCR_DAC_FREQ_OFFSET);
+	} else {
+		regmap_update_bits(codec->regmap, JZ4770_CODEC_REG_AICR_ADC,
+				   REG_AICR_ADC_ADWL_MASK,
+				   bit_width << REG_AICR_ADC_ADWL_OFFSET);
+		regmap_update_bits(codec->regmap, JZ4770_CODEC_REG_FCR_ADC,
+				   REG_FCR_ADC_FREQ_MASK,
+				   rate << REG_FCR_ADC_FREQ_OFFSET);
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops jz4770_codec_dai_ops = {
+	.startup	= jz4770_codec_startup,
+	.shutdown	= jz4770_codec_shutdown,
+	.hw_params	= jz4770_codec_hw_params,
+	.trigger	= jz4770_codec_pcm_trigger,
+	.digital_mute	= jz4770_codec_digital_mute,
+};
+
+#define JZ_CODEC_FORMATS (SNDRV_PCM_FMTBIT_S16_LE  | \
+			  SNDRV_PCM_FMTBIT_S18_3LE | \
+			  SNDRV_PCM_FMTBIT_S20_3LE | \
+			  SNDRV_PCM_FMTBIT_S24_3LE)
+
+static struct snd_soc_dai_driver jz4770_codec_dai = {
+	.name = "jz4770-hifi",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = JZ_CODEC_FORMATS,
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = JZ_CODEC_FORMATS,
+	},
+	.ops = &jz4770_codec_dai_ops,
+};
+
+static bool jz4770_codec_volatile(struct device *dev, unsigned int reg)
+{
+	return reg == JZ4770_CODEC_REG_SR || reg == JZ4770_CODEC_REG_IFR;
+}
+
+static bool jz4770_codec_readable(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case JZ4770_CODEC_REG_MISSING_REG1:
+	case JZ4770_CODEC_REG_MISSING_REG2:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static bool jz4770_codec_writeable(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case JZ4770_CODEC_REG_SR:
+	case JZ4770_CODEC_REG_MISSING_REG1:
+	case JZ4770_CODEC_REG_MISSING_REG2:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static int jz4770_codec_io_wait(struct jz_codec *codec)
+{
+	u32 reg;
+
+	return readl_poll_timeout(codec->base + ICDC_RGADW_OFFSET, reg,
+				  !(reg & ICDC_RGADW_RGWR),
+				  1000, 10 * USEC_PER_MSEC);
+}
+
+static int jz4770_codec_reg_read(void *context, unsigned int reg,
+				 unsigned int *val)
+{
+	struct jz_codec *codec = context;
+	unsigned int i;
+	u32 tmp;
+	int ret;
+
+	ret = jz4770_codec_io_wait(codec);
+	if (ret)
+		return ret;
+
+	tmp = readl(codec->base + ICDC_RGADW_OFFSET);
+	tmp = (tmp & ~ICDC_RGADW_RGADDR_MASK)
+	    | (reg << ICDC_RGADW_RGADDR_OFFSET);
+	writel(tmp, codec->base + ICDC_RGADW_OFFSET);
+
+	/* wait 6+ cycles */
+	for (i = 0; i < 6; i++)
+		*val = readl(codec->base + ICDC_RGDATA_OFFSET) &
+			ICDC_RGDATA_RGDOUT_MASK;
+
+	return 0;
+}
+
+static int jz4770_codec_reg_write(void *context, unsigned int reg,
+				  unsigned int val)
+{
+	struct jz_codec *codec = context;
+	int ret;
+
+	ret = jz4770_codec_io_wait(codec);
+	if (ret)
+		return ret;
+
+	writel(ICDC_RGADW_RGWR | (reg << ICDC_RGADW_RGADDR_OFFSET) | val,
+	       codec->base + ICDC_RGADW_OFFSET);
+
+	ret = jz4770_codec_io_wait(codec);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const u8 jz4770_codec_reg_defaults[] = {
+	0x00, 0xC3, 0xC3, 0x90, 0x98, 0xFF, 0x90, 0xB1,
+	0x11, 0x10, 0x00, 0x03, 0x00, 0x00, 0x40, 0x00,
+	0xFF, 0x00, 0x06, 0x06, 0x06, 0x06, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x34,
+	0x07, 0x44, 0x1F, 0x00
+};
+
+static struct regmap_config jz4770_codec_regmap_config = {
+	.reg_bits = 7,
+	.val_bits = 8,
+
+	.max_register = JZ4770_CODEC_REG_AGC5,
+	.volatile_reg = jz4770_codec_volatile,
+	.readable_reg = jz4770_codec_readable,
+	.writeable_reg = jz4770_codec_writeable,
+
+	.reg_read = jz4770_codec_reg_read,
+	.reg_write = jz4770_codec_reg_write,
+
+	.reg_defaults_raw = jz4770_codec_reg_defaults,
+	.num_reg_defaults_raw = ARRAY_SIZE(jz4770_codec_reg_defaults),
+	.cache_type = REGCACHE_FLAT,
+};
+
+static int jz4770_codec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct jz_codec *codec;
+	int ret;
+
+	codec = devm_kzalloc(dev, sizeof(*codec), GFP_KERNEL);
+	if (!codec)
+		return -ENOMEM;
+
+	codec->dev = dev;
+
+	codec->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(codec->base)) {
+		ret = PTR_ERR(codec->base);
+		dev_err(dev, "Failed to ioremap mmio memory: %d\n", ret);
+		return ret;
+	}
+
+	codec->regmap = devm_regmap_init(dev, NULL, codec,
+					&jz4770_codec_regmap_config);
+	if (IS_ERR(codec->regmap))
+		return PTR_ERR(codec->regmap);
+
+	codec->clk = devm_clk_get(dev, "aic");
+	if (IS_ERR(codec->clk))
+		return PTR_ERR(codec->clk);
+
+	platform_set_drvdata(pdev, codec);
+
+	ret = devm_snd_soc_register_component(dev, &jz4770_codec_soc_codec_dev,
+					      &jz4770_codec_dai, 1);
+	if (ret) {
+		dev_err(dev, "Failed to register codec: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id jz4770_codec_of_matches[] = {
+	{ .compatible = "ingenic,jz4770-codec", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jz4770_codec_of_matches);
+
+static struct platform_driver jz4770_codec_driver = {
+	.probe			= jz4770_codec_probe,
+	.driver			= {
+		.name		= "jz4770-codec",
+		.of_match_table = of_match_ptr(jz4770_codec_of_matches),
+	},
+};
+module_platform_driver(jz4770_codec_driver);
+
+MODULE_DESCRIPTION("JZ4770 SoC internal codec driver");
+MODULE_AUTHOR("Maarten ter Huurne <maarten@treewalker.org>");
+MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

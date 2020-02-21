Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903E11684AD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 18:17:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28AE16D9;
	Fri, 21 Feb 2020 18:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28AE16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582305468;
	bh=2aAu4ZYkbbEaYs1vYE3tQLdD/ibKIoJfNZ0dRhJwviM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BIc8y+t73ahSJvEgf0Dmmh5aTvNi7cX/63o6GtZIJrzHzbYq/uJ1CAdgLm/YtH9Q7
	 ny7srwpB4wD2sC31ec58Y4V9pcZnQltdZwsFgQDqYmhIwnsXx80/jgLXB85UeRc3xB
	 /3smfisN/0sm9uNMDfi/WGim1JHjpfhpWRZVJwMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88152F80277;
	Fri, 21 Feb 2020 18:15:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76365F8011D; Fri, 21 Feb 2020 18:15:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CC56BF8011D
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 18:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC56BF8011D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B989730E;
 Fri, 21 Feb 2020 09:15:20 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DCCB3F68F;
 Fri, 21 Feb 2020 09:15:20 -0800 (PST)
Date: Fri, 21 Feb 2020 17:15:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: g12a: add internal DAC glue driver" to the asoc
 tree
In-Reply-To: <20200221153607.1585499-3-jbrunet@baylibre.com>
Message-Id: <applied-20200221153607.1585499-3-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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

   ASoC: meson: g12a: add internal DAC glue driver

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

From af2618a2eee8531e134c42194143c2f4faef94ba Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 21 Feb 2020 16:36:06 +0100
Subject: [PATCH] ASoC: meson: g12a: add internal DAC glue driver

Add support for the internal audio DAC glue found on the Amlogic g12a
and sm1 SoC families. This allows to connect the TDM outputs of the SoC
to the internal t9015 audio DAC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200221153607.1585499-3-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/Kconfig         |   9 ++
 sound/soc/meson/Makefile        |   2 +
 sound/soc/meson/g12a-toacodec.c | 252 ++++++++++++++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 sound/soc/meson/g12a-toacodec.c

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d27e9180b453..8b6295283989 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -109,6 +109,15 @@ config SND_MESON_GX_SOUND_CARD
 	help
 	  Select Y or M to add support for the GXBB/GXL SoC sound card
 
+config SND_MESON_G12A_TOACODEC
+	tristate "Amlogic G12A To Internal DAC Control Support"
+	select SND_MESON_CODEC_GLUE
+	select REGMAP_MMIO
+	imply SND_SOC_MESON_T9015
+	help
+	  Select Y or M to add support for the internal audio DAC on the
+	  g12a SoC family
+
 config SND_MESON_G12A_TOHDMITX
 	tristate "Amlogic G12A To HDMI TX Control Support"
 	select REGMAP_MMIO
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 3c9d48846816..e446bc980481 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -22,6 +22,7 @@ snd-soc-meson-axg-pdm-objs := axg-pdm.o
 snd-soc-meson-card-utils-objs := meson-card-utils.o
 snd-soc-meson-codec-glue-objs := meson-codec-glue.o
 snd-soc-meson-gx-sound-card-objs := gx-card.o
+snd-soc-meson-g12a-toacodec-objs := g12a-toacodec.o
 snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
 snd-soc-meson-t9015-objs := t9015.o
 
@@ -40,5 +41,6 @@ obj-$(CONFIG_SND_MESON_AXG_PDM) += snd-soc-meson-axg-pdm.o
 obj-$(CONFIG_SND_MESON_CARD_UTILS) += snd-soc-meson-card-utils.o
 obj-$(CONFIG_SND_MESON_CODEC_GLUE) += snd-soc-meson-codec-glue.o
 obj-$(CONFIG_SND_MESON_GX_SOUND_CARD) += snd-soc-meson-gx-sound-card.o
+obj-$(CONFIG_SND_MESON_G12A_TOACODEC) += snd-soc-meson-g12a-toacodec.o
 obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
 obj-$(CONFIG_SND_SOC_MESON_T9015) += snd-soc-meson-t9015.o
diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
new file mode 100644
index 000000000000..9339fabccb79
--- /dev/null
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include <dt-bindings/sound/meson-g12a-toacodec.h>
+#include "axg-tdm.h"
+#include "meson-codec-glue.h"
+
+#define G12A_TOACODEC_DRV_NAME "g12a-toacodec"
+
+#define TOACODEC_CTRL0			0x0
+#define  CTRL0_ENABLE_SHIFT		31
+#define  CTRL0_DAT_SEL_SHIFT		14
+#define  CTRL0_DAT_SEL			(0x3 << CTRL0_DAT_SEL_SHIFT)
+#define  CTRL0_LANE_SEL			12
+#define  CTRL0_LRCLK_SEL		GENMASK(9, 8)
+#define  CTRL0_BLK_CAP_INV		BIT(7)
+#define  CTRL0_BCLK_O_INV		BIT(6)
+#define  CTRL0_BCLK_SEL			GENMASK(5, 4)
+#define  CTRL0_MCLK_SEL			GENMASK(2, 0)
+
+#define TOACODEC_OUT_CHMAX		2
+
+static const char * const g12a_toacodec_mux_texts[] = {
+	"I2S A", "I2S B", "I2S C",
+};
+
+static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int mux, changed;
+
+	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
+	changed = snd_soc_component_test_bits(component, e->reg,
+					      CTRL0_DAT_SEL,
+					      FIELD_PREP(CTRL0_DAT_SEL, mux));
+
+	if (!changed)
+		return 0;
+
+	/* Force disconnect of the mux while updating */
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+
+	snd_soc_component_update_bits(component, e->reg,
+				      CTRL0_DAT_SEL |
+				      CTRL0_LRCLK_SEL |
+				      CTRL0_BCLK_SEL,
+				      FIELD_PREP(CTRL0_DAT_SEL, mux) |
+				      FIELD_PREP(CTRL0_LRCLK_SEL, mux) |
+				      FIELD_PREP(CTRL0_BCLK_SEL, mux));
+
+	/*
+	 * FIXME:
+	 * On this soc, the glue gets the MCLK directly from the clock
+	 * controller instead of going the through the TDM interface.
+	 *
+	 * Here we assume interface A uses clock A, etc ... While it is
+	 * true for now, it could be different. Instead the glue should
+	 * find out the clock used by the interface and select the same
+	 * source. For that, we will need regmap backed clock mux which
+	 * is a work in progress
+	 */
+	snd_soc_component_update_bits(component, e->reg,
+				      CTRL0_MCLK_SEL,
+				      FIELD_PREP(CTRL0_MCLK_SEL, mux));
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+
+	return 0;
+}
+
+static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
+			    CTRL0_DAT_SEL_SHIFT,
+			    g12a_toacodec_mux_texts);
+
+static const struct snd_kcontrol_new g12a_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
+static const struct snd_kcontrol_new g12a_toacodec_out_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
+				    CTRL0_ENABLE_SHIFT, 1, 0);
+
+static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
+	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
+			 &g12a_toacodec_mux),
+	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_toacodec_out_enable),
+};
+
+static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
+					 struct snd_pcm_hw_params *params,
+					 struct snd_soc_dai *dai)
+{
+	struct meson_codec_glue_input *data;
+	int ret;
+
+	ret = meson_codec_glue_input_hw_params(substream, params, dai);
+	if (ret)
+		return ret;
+
+	/* The glue will provide 1 lane out of the 4 to the output */
+	data = meson_codec_glue_input_get_data(dai);
+	data->params.channels_min = min_t(unsigned int, TOACODEC_OUT_CHMAX,
+					data->params.channels_min);
+	data->params.channels_max = min_t(unsigned int, TOACODEC_OUT_CHMAX,
+					data->params.channels_max);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops g12a_toacodec_input_ops = {
+	.hw_params	= g12a_toacodec_input_hw_params,
+	.set_fmt	= meson_codec_glue_input_set_fmt,
+};
+
+static const struct snd_soc_dai_ops g12a_toacodec_output_ops = {
+	.startup	= meson_codec_glue_output_startup,
+};
+
+#define TOACODEC_STREAM(xname, xsuffix, xchmax)			\
+{								\
+	.stream_name	= xname " " xsuffix,			\
+	.channels_min	= 1,					\
+	.channels_max	= (xchmax),				\
+	.rate_min       = 5512,					\
+	.rate_max	= 192000,				\
+	.formats	= AXG_TDM_FORMATS,			\
+}
+
+#define TOACODEC_INPUT(xname, xid) {					\
+	.name = xname,							\
+	.id = (xid),							\
+	.playback = TOACODEC_STREAM(xname, "Playback", 8),		\
+	.ops = &g12a_toacodec_input_ops,				\
+	.probe = meson_codec_glue_input_dai_probe,			\
+	.remove = meson_codec_glue_input_dai_remove,			\
+}
+
+#define TOACODEC_OUTPUT(xname, xid) {					\
+	.name = xname,							\
+	.id = (xid),							\
+	.capture = TOACODEC_STREAM(xname, "Capture", TOACODEC_OUT_CHMAX), \
+	.ops = &g12a_toacodec_output_ops,				\
+}
+
+static struct snd_soc_dai_driver g12a_toacodec_dai_drv[] = {
+	TOACODEC_INPUT("IN A", TOACODEC_IN_A),
+	TOACODEC_INPUT("IN B", TOACODEC_IN_B),
+	TOACODEC_INPUT("IN C", TOACODEC_IN_C),
+	TOACODEC_OUTPUT("OUT", TOACODEC_OUT),
+};
+
+static int g12a_toacodec_component_probe(struct snd_soc_component *c)
+{
+	/* Initialize the static clock parameters */
+	return snd_soc_component_write(c, TOACODEC_CTRL0,
+				       CTRL0_BLK_CAP_INV);
+}
+
+static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
+	{ "SRC", "I2S A", "IN A Playback" },
+	{ "SRC", "I2S B", "IN B Playback" },
+	{ "SRC", "I2S C", "IN C Playback" },
+	{ "OUT EN", "Switch", "SRC" },
+	{ "OUT Capture", NULL, "OUT EN" },
+};
+
+static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
+};
+
+static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
+	.probe			= g12a_toacodec_component_probe,
+	.controls		= g12a_toacodec_controls,
+	.num_controls		= ARRAY_SIZE(g12a_toacodec_controls),
+	.dapm_widgets		= g12a_toacodec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(g12a_toacodec_widgets),
+	.dapm_routes		= g12a_toacodec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct regmap_config g12a_toacodec_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+};
+
+static const struct of_device_id g12a_toacodec_of_match[] = {
+	{ .compatible = "amlogic,g12a-toacodec", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
+
+static int g12a_toacodec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *regs;
+	struct regmap *map;
+	int ret;
+
+	ret = device_reset(dev);
+	if (ret)
+		return ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	map = devm_regmap_init_mmio(dev, regs, &g12a_toacodec_regmap_cfg);
+	if (IS_ERR(map)) {
+		dev_err(dev, "failed to init regmap: %ld\n",
+			PTR_ERR(map));
+		return PTR_ERR(map);
+	}
+
+	return devm_snd_soc_register_component(dev,
+			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
+			ARRAY_SIZE(g12a_toacodec_dai_drv));
+}
+
+static struct platform_driver g12a_toacodec_pdrv = {
+	.driver = {
+		.name = G12A_TOACODEC_DRV_NAME,
+		.of_match_table = g12a_toacodec_of_match,
+	},
+	.probe = g12a_toacodec_probe,
+};
+module_platform_driver(g12a_toacodec_pdrv);
+
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_DESCRIPTION("Amlogic G12a To Internal DAC Codec Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D102315CCE8
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 22:04:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 815C616A9;
	Thu, 13 Feb 2020 22:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 815C616A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581627855;
	bh=OD6GPTWgD+K/gQUr/RCowlR/FyEc5HbkwbKLpIed3ps=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oWZK5s4qEuI5/UKxaoKcrAhZqJDmiLXyYoQ4ZeVbbMyEF1PW5jXwswn3B4ERBulk9
	 q7P2GjGqeBUAesT3JfT4OAtID8stccmfVaiqDb0USzWAZ5nlcUSaPVIVnGBFtE8A4C
	 td8epa+tadCvvWxnXVJ4fEY9q/KXG4U5s3PAarjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF8F3F802A7;
	Thu, 13 Feb 2020 21:59:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 930D7F80276; Thu, 13 Feb 2020 21:58:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1519AF80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 21:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1519AF80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A5FD1FB;
 Thu, 13 Feb 2020 12:58:31 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCB373F6CF;
 Thu, 13 Feb 2020 12:58:30 -0800 (PST)
Date: Thu, 13 Feb 2020 20:58:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200213155159.3235792-3-jbrunet@baylibre.com>
Message-Id: <applied-20200213155159.3235792-3-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: g12a: extract codec-to-codec
	utils" to the asoc tree
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

   ASoC: meson: g12a: extract codec-to-codec utils

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

From 9c29fd9bdf92900dc0cc5c2d8f58951a7bdc0f41 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 13 Feb 2020 16:51:52 +0100
Subject: [PATCH] ASoC: meson: g12a: extract codec-to-codec utils

The hdmi routing mechanism used on g12a hdmi is also used:
* other Amlogic SoC types
* for the internal DAC path

Each of these codec glues are slightly different but the idea
behind it remains the same. This change extract some helper functions
from the g12a-tohdmitx driver to make them available for other Amlogic
codecs.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200213155159.3235792-3-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/Kconfig            |   4 +
 sound/soc/meson/Makefile           |   2 +
 sound/soc/meson/g12a-tohdmitx.c    | 219 ++++++-----------------------
 sound/soc/meson/meson-codec-glue.c | 149 ++++++++++++++++++++
 sound/soc/meson/meson-codec-glue.h |  32 +++++
 5 files changed, 230 insertions(+), 176 deletions(-)
 create mode 100644 sound/soc/meson/meson-codec-glue.c
 create mode 100644 sound/soc/meson/meson-codec-glue.h

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 2e3676147cea..ee6d53949d45 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,9 +85,13 @@ config SND_MESON_AXG_PDM
 	  Select Y or M to add support for PDM input embedded
 	  in the Amlogic AXG SoC family
 
+config SND_MESON_CODEC_GLUE
+	tristate
+
 config SND_MESON_G12A_TOHDMITX
 	tristate "Amlogic G12A To HDMI TX Control Support"
 	select REGMAP_MMIO
+	select SND_MESON_CODEC_GLUE
 	imply SND_SOC_HDMI_CODEC
 	help
 	  Select Y or M to add support for HDMI audio on the g12a SoC
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 1a8b1470ed84..529a807b3f37 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -11,6 +11,7 @@ snd-soc-meson-axg-sound-card-objs := axg-card.o
 snd-soc-meson-axg-spdifin-objs := axg-spdifin.o
 snd-soc-meson-axg-spdifout-objs := axg-spdifout.o
 snd-soc-meson-axg-pdm-objs := axg-pdm.o
+snd-soc-meson-codec-glue-objs := meson-codec-glue.o
 snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
 
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
@@ -24,4 +25,5 @@ obj-$(CONFIG_SND_MESON_AXG_SOUND_CARD) += snd-soc-meson-axg-sound-card.o
 obj-$(CONFIG_SND_MESON_AXG_SPDIFIN) += snd-soc-meson-axg-spdifin.o
 obj-$(CONFIG_SND_MESON_AXG_SPDIFOUT) += snd-soc-meson-axg-spdifout.o
 obj-$(CONFIG_SND_MESON_AXG_PDM) += snd-soc-meson-axg-pdm.o
+obj-$(CONFIG_SND_MESON_CODEC_GLUE) += snd-soc-meson-codec-glue.o
 obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 9cfbd343a00c..f8853f2fba08 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -12,112 +12,51 @@
 #include <sound/soc-dai.h>
 
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+#include "meson-codec-glue.h"
 
 #define G12A_TOHDMITX_DRV_NAME "g12a-tohdmitx"
 
 #define TOHDMITX_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
-#define  CTRL0_I2S_DAT_SEL		GENMASK(13, 12)
+#define  CTRL0_I2S_DAT_SEL_SHIFT	12
+#define  CTRL0_I2S_DAT_SEL		(0x3 << CTRL0_I2S_DAT_SEL_SHIFT)
 #define  CTRL0_I2S_LRCLK_SEL		GENMASK(9, 8)
 #define  CTRL0_I2S_BLK_CAP_INV		BIT(7)
 #define  CTRL0_I2S_BCLK_O_INV		BIT(6)
 #define  CTRL0_I2S_BCLK_SEL		GENMASK(5, 4)
 #define  CTRL0_SPDIF_CLK_CAP_INV	BIT(3)
 #define  CTRL0_SPDIF_CLK_O_INV		BIT(2)
-#define  CTRL0_SPDIF_SEL		BIT(1)
+#define  CTRL0_SPDIF_SEL_SHIFT		1
+#define  CTRL0_SPDIF_SEL		(0x1 << CTRL0_SPDIF_SEL_SHIFT)
 #define  CTRL0_SPDIF_CLK_SEL		BIT(0)
 
-struct g12a_tohdmitx_input {
-	struct snd_soc_pcm_stream params;
-	unsigned int fmt;
-};
-
-static struct snd_soc_dapm_widget *
-g12a_tohdmitx_get_input(struct snd_soc_dapm_widget *w)
-{
-	struct snd_soc_dapm_path *p = NULL;
-	struct snd_soc_dapm_widget *in;
-
-	snd_soc_dapm_widget_for_each_source_path(w, p) {
-		if (!p->connect)
-			continue;
-
-		/* Check that we still are in the same component */
-		if (snd_soc_dapm_to_component(w->dapm) !=
-		    snd_soc_dapm_to_component(p->source->dapm))
-			continue;
-
-		if (p->source->id == snd_soc_dapm_dai_in)
-			return p->source;
-
-		in = g12a_tohdmitx_get_input(p->source);
-		if (in)
-			return in;
-	}
-
-	return NULL;
-}
-
-static struct g12a_tohdmitx_input *
-g12a_tohdmitx_get_input_data(struct snd_soc_dapm_widget *w)
-{
-	struct snd_soc_dapm_widget *in =
-		g12a_tohdmitx_get_input(w);
-	struct snd_soc_dai *dai;
-
-	if (WARN_ON(!in))
-		return NULL;
-
-	dai = in->priv;
-
-	return dai->playback_dma_data;
-}
-
 static const char * const g12a_tohdmitx_i2s_mux_texts[] = {
 	"I2S A", "I2S B", "I2S C",
 };
 
-static SOC_ENUM_SINGLE_EXT_DECL(g12a_tohdmitx_i2s_mux_enum,
-				g12a_tohdmitx_i2s_mux_texts);
-
-static int g12a_tohdmitx_get_input_val(struct snd_soc_component *component,
-				       unsigned int mask)
-{
-	unsigned int val;
-
-	snd_soc_component_read(component, TOHDMITX_CTRL0, &val);
-	return (val & mask) >> __ffs(mask);
-}
-
-static int g12a_tohdmitx_i2s_mux_get_enum(struct snd_kcontrol *kcontrol,
-					  struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-
-	ucontrol->value.enumerated.item[0] =
-		g12a_tohdmitx_get_input_val(component, CTRL0_I2S_DAT_SEL);
-
-	return 0;
-}
-
 static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
-					  struct snd_ctl_elem_value *ucontrol)
+				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_kcontrol_component(kcontrol);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int mux = ucontrol->value.enumerated.item[0];
-	unsigned int val = g12a_tohdmitx_get_input_val(component,
-						       CTRL0_I2S_DAT_SEL);
+	unsigned int mux, changed;
+
+	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
+	changed = snd_soc_component_test_bits(component, e->reg,
+					      CTRL0_I2S_DAT_SEL,
+					      FIELD_PREP(CTRL0_I2S_DAT_SEL,
+							 mux));
+
+	if (!changed)
+		return 0;
 
 	/* Force disconnect of the mux while updating */
-	if (val != mux)
-		snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
 
-	snd_soc_component_update_bits(component, TOHDMITX_CTRL0,
+	snd_soc_component_update_bits(component, e->reg,
 				      CTRL0_I2S_DAT_SEL |
 				      CTRL0_I2S_LRCLK_SEL |
 				      CTRL0_I2S_BCLK_SEL,
@@ -130,30 +69,19 @@ static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static SOC_ENUM_SINGLE_DECL(g12a_tohdmitx_i2s_mux_enum, TOHDMITX_CTRL0,
+			    CTRL0_I2S_DAT_SEL_SHIFT,
+			    g12a_tohdmitx_i2s_mux_texts);
+
 static const struct snd_kcontrol_new g12a_tohdmitx_i2s_mux =
 	SOC_DAPM_ENUM_EXT("I2S Source", g12a_tohdmitx_i2s_mux_enum,
-			  g12a_tohdmitx_i2s_mux_get_enum,
+			  snd_soc_dapm_get_enum_double,
 			  g12a_tohdmitx_i2s_mux_put_enum);
 
 static const char * const g12a_tohdmitx_spdif_mux_texts[] = {
 	"SPDIF A", "SPDIF B",
 };
 
-static SOC_ENUM_SINGLE_EXT_DECL(g12a_tohdmitx_spdif_mux_enum,
-				g12a_tohdmitx_spdif_mux_texts);
-
-static int g12a_tohdmitx_spdif_mux_get_enum(struct snd_kcontrol *kcontrol,
-					    struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-
-	ucontrol->value.enumerated.item[0] =
-		g12a_tohdmitx_get_input_val(component, CTRL0_SPDIF_SEL);
-
-	return 0;
-}
-
 static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
@@ -162,13 +90,18 @@ static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int mux = ucontrol->value.enumerated.item[0];
-	unsigned int val = g12a_tohdmitx_get_input_val(component,
-						       CTRL0_SPDIF_SEL);
+	unsigned int mux, changed;
+
+	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
+	changed = snd_soc_component_test_bits(component, TOHDMITX_CTRL0,
+					      CTRL0_SPDIF_SEL,
+					      FIELD_PREP(CTRL0_SPDIF_SEL, mux));
+
+	if (!changed)
+		return 0;
 
 	/* Force disconnect of the mux while updating */
-	if (val != mux)
-		snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
 
 	snd_soc_component_update_bits(component, TOHDMITX_CTRL0,
 				      CTRL0_SPDIF_SEL |
@@ -181,9 +114,13 @@ static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static SOC_ENUM_SINGLE_DECL(g12a_tohdmitx_spdif_mux_enum, TOHDMITX_CTRL0,
+			    CTRL0_SPDIF_SEL_SHIFT,
+			    g12a_tohdmitx_spdif_mux_texts);
+
 static const struct snd_kcontrol_new g12a_tohdmitx_spdif_mux =
 	SOC_DAPM_ENUM_EXT("SPDIF Source", g12a_tohdmitx_spdif_mux_enum,
-			  g12a_tohdmitx_spdif_mux_get_enum,
+			  snd_soc_dapm_get_enum_double,
 			  g12a_tohdmitx_spdif_mux_put_enum);
 
 static const struct snd_kcontrol_new g12a_tohdmitx_out_enable =
@@ -201,83 +138,13 @@ static const struct snd_soc_dapm_widget g12a_tohdmitx_widgets[] = {
 			    &g12a_tohdmitx_out_enable),
 };
 
-static int g12a_tohdmitx_input_probe(struct snd_soc_dai *dai)
-{
-	struct g12a_tohdmitx_input *data;
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	dai->playback_dma_data = data;
-	return 0;
-}
-
-static int g12a_tohdmitx_input_remove(struct snd_soc_dai *dai)
-{
-	kfree(dai->playback_dma_data);
-	return 0;
-}
-
-static int g12a_tohdmitx_input_hw_params(struct snd_pcm_substream *substream,
-					 struct snd_pcm_hw_params *params,
-					 struct snd_soc_dai *dai)
-{
-	struct g12a_tohdmitx_input *data = dai->playback_dma_data;
-
-	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
-	data->params.rate_min = params_rate(params);
-	data->params.rate_max = params_rate(params);
-	data->params.formats = 1 << params_format(params);
-	data->params.channels_min = params_channels(params);
-	data->params.channels_max = params_channels(params);
-	data->params.sig_bits = dai->driver->playback.sig_bits;
-
-	return 0;
-}
-
-
-static int g12a_tohdmitx_input_set_fmt(struct snd_soc_dai *dai,
-				       unsigned int fmt)
-{
-	struct g12a_tohdmitx_input *data = dai->playback_dma_data;
-
-	/* Save the source stream format for the downstream link */
-	data->fmt = fmt;
-	return 0;
-}
-
-static int g12a_tohdmitx_output_startup(struct snd_pcm_substream *substream,
-					struct snd_soc_dai *dai)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct g12a_tohdmitx_input *in_data =
-		g12a_tohdmitx_get_input_data(dai->capture_widget);
-
-	if (!in_data)
-		return -ENODEV;
-
-	if (WARN_ON(!rtd->dai_link->params)) {
-		dev_warn(dai->dev, "codec2codec link expected\n");
-		return -EINVAL;
-	}
-
-	/* Replace link params with the input params */
-	rtd->dai_link->params = &in_data->params;
-
-	if (!in_data->fmt)
-		return 0;
-
-	return snd_soc_runtime_set_dai_fmt(rtd, in_data->fmt);
-}
-
 static const struct snd_soc_dai_ops g12a_tohdmitx_input_ops = {
-	.hw_params	= g12a_tohdmitx_input_hw_params,
-	.set_fmt	= g12a_tohdmitx_input_set_fmt,
+	.hw_params	= meson_codec_glue_input_hw_params,
+	.set_fmt	= meson_codec_glue_input_set_fmt,
 };
 
 static const struct snd_soc_dai_ops g12a_tohdmitx_output_ops = {
-	.startup	= g12a_tohdmitx_output_startup,
+	.startup	= meson_codec_glue_output_startup,
 };
 
 #define TOHDMITX_SPDIF_FORMATS					\
@@ -304,8 +171,8 @@ static const struct snd_soc_dai_ops g12a_tohdmitx_output_ops = {
 	.id = (xid),							\
 	.playback = TOHDMITX_STREAM(xname, "Playback", xfmt, xchmax),	\
 	.ops = &g12a_tohdmitx_input_ops,				\
-	.probe = g12a_tohdmitx_input_probe,				\
-	.remove = g12a_tohdmitx_input_remove,				\
+	.probe = meson_codec_glue_input_dai_probe,			\
+	.remove = meson_codec_glue_input_dai_remove,			\
 }
 
 #define TOHDMITX_OUT(xname, xid, xfmt, xchmax) {			\
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
new file mode 100644
index 000000000000..97bbc967e176
--- /dev/null
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2019 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/module.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "meson-codec-glue.h"
+
+static struct snd_soc_dapm_widget *
+meson_codec_glue_get_input(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p = NULL;
+	struct snd_soc_dapm_widget *in;
+
+	snd_soc_dapm_widget_for_each_source_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		/* Check that we still are in the same component */
+		if (snd_soc_dapm_to_component(w->dapm) !=
+		    snd_soc_dapm_to_component(p->source->dapm))
+			continue;
+
+		if (p->source->id == snd_soc_dapm_dai_in)
+			return p->source;
+
+		in = meson_codec_glue_get_input(p->source);
+		if (in)
+			return in;
+	}
+
+	return NULL;
+}
+
+static void meson_codec_glue_input_set_data(struct snd_soc_dai *dai,
+					    struct meson_codec_glue_input *data)
+{
+	dai->playback_dma_data = data;
+}
+
+struct meson_codec_glue_input *
+meson_codec_glue_input_get_data(struct snd_soc_dai *dai)
+{
+	return dai->playback_dma_data;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_get_data);
+
+static struct meson_codec_glue_input *
+meson_codec_glue_output_get_input_data(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_widget *in =
+		meson_codec_glue_get_input(w);
+	struct snd_soc_dai *dai;
+
+	if (WARN_ON(!in))
+		return NULL;
+
+	dai = in->priv;
+
+	return meson_codec_glue_input_get_data(dai);
+}
+
+int meson_codec_glue_input_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai)
+{
+	struct meson_codec_glue_input *data =
+		meson_codec_glue_input_get_data(dai);
+
+	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
+	data->params.rate_min = params_rate(params);
+	data->params.rate_max = params_rate(params);
+	data->params.formats = 1 << params_format(params);
+	data->params.channels_min = params_channels(params);
+	data->params.channels_max = params_channels(params);
+	data->params.sig_bits = dai->driver->playback.sig_bits;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_hw_params);
+
+int meson_codec_glue_input_set_fmt(struct snd_soc_dai *dai,
+				   unsigned int fmt)
+{
+	struct meson_codec_glue_input *data =
+		meson_codec_glue_input_get_data(dai);
+
+	/* Save the source stream format for the downstream link */
+	data->fmt = fmt;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_set_fmt);
+
+int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct meson_codec_glue_input *in_data =
+		meson_codec_glue_output_get_input_data(dai->capture_widget);
+
+	if (!in_data)
+		return -ENODEV;
+
+	if (WARN_ON(!rtd->dai_link->params)) {
+		dev_warn(dai->dev, "codec2codec link expected\n");
+		return -EINVAL;
+	}
+
+	/* Replace link params with the input params */
+	rtd->dai_link->params = &in_data->params;
+
+	if (!in_data->fmt)
+		return 0;
+
+	return snd_soc_runtime_set_dai_fmt(rtd, in_data->fmt);
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_output_startup);
+
+int meson_codec_glue_input_dai_probe(struct snd_soc_dai *dai)
+{
+	struct meson_codec_glue_input *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	meson_codec_glue_input_set_data(dai, data);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_dai_probe);
+
+int meson_codec_glue_input_dai_remove(struct snd_soc_dai *dai)
+{
+	struct meson_codec_glue_input *data =
+		meson_codec_glue_input_get_data(dai);
+
+	kfree(data);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_dai_remove);
+
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_DESCRIPTION("Amlogic Codec Glue Helpers");
+MODULE_LICENSE("GPL v2");
+
diff --git a/sound/soc/meson/meson-codec-glue.h b/sound/soc/meson/meson-codec-glue.h
new file mode 100644
index 000000000000..07f99446c0c6
--- /dev/null
+++ b/sound/soc/meson/meson-codec-glue.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2018 Baylibre SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef _MESON_CODEC_GLUE_H
+#define _MESON_CODEC_GLUE_H
+
+#include <sound/soc.h>
+
+struct meson_codec_glue_input {
+	struct snd_soc_pcm_stream params;
+	unsigned int fmt;
+};
+
+/* Input helpers */
+struct meson_codec_glue_input *
+meson_codec_glue_input_get_data(struct snd_soc_dai *dai);
+int meson_codec_glue_input_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai);
+int meson_codec_glue_input_set_fmt(struct snd_soc_dai *dai,
+				   unsigned int fmt);
+int meson_codec_glue_input_dai_probe(struct snd_soc_dai *dai);
+int meson_codec_glue_input_dai_remove(struct snd_soc_dai *dai);
+
+/* Output helpers */
+int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai);
+
+#endif /* _MESON_CODEC_GLUE_H */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

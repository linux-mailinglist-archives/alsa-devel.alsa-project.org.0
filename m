Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E052045F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF70E16CD;
	Thu, 16 May 2019 13:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF70E16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558005409;
	bh=bMR1uXndsHR49BKxnA0906WbHCM5Ohg6kI9BiQKsT5k=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HXdlMft+XpB2DlAu42NJ+Pwumi/yBsNjp9QPJf93GOq+pSWoCSUkesDVk7SN7sCzW
	 mOJmsHASv01h1OUfkxFq7WbuiYt/0G7UOmqS3MxUvaLRHiFpC/3F2bDJXA2TZbuz0k
	 I/MUBDsZnotE+m3yMxZ18gAKgsDqsK9c0ycoJcng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21ECBF89735;
	Thu, 16 May 2019 13:14:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02423F89732; Thu, 16 May 2019 13:14:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CB7BF89693
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB7BF89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tqspBZSr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=a0v3h7TxCgvU5IOdB1ct22VkYcGy9wV9ixaGkYTU11o=; b=tqspBZSrz4l1
 ruYObK4gM5wgd2akPCC58wulYpucrNUTZ0oCtUmnwj2NkZUEmg8egFly+i8t9Fa8nY5id7Mg0nofh
 DY7ixMbDO4f3EWoUiXCOucujrtyPxot09hc+zkDMJ1FAuWtP+4EoiljGYEZN76qXw9R9YOqfeLLwi
 BpoKw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hREKj-00066g-Av; Thu, 16 May 2019 11:13:57 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id C8FFF1126D45; Thu, 16 May 2019 12:13:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190515131858.32130-6-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190516111353.C8FFF1126D45@debutante.sirena.org.uk>
Date: Thu, 16 May 2019 12:13:53 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: add g12a tohdmitx control" to
	the asoc tree
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

   ASoC: meson: add g12a tohdmitx control

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From c8609f3870f7078fc7922eb816ed4908a9bd44f3 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 15 May 2019 15:18:58 +0200
Subject: [PATCH] ASoC: meson: add g12a tohdmitx control

Add support for the hdmitx control glue of the Amlogic g12a SoC family.
This glue links the 3 TDM and 2 SPDIF output interfaces of the SoC to
the related inputs of the Synopsys HDMI controller found in these SoCs.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/Kconfig         |   8 +
 sound/soc/meson/Makefile        |   2 +
 sound/soc/meson/g12a-tohdmitx.c | 413 ++++++++++++++++++++++++++++++++
 3 files changed, 423 insertions(+)
 create mode 100644 sound/soc/meson/g12a-tohdmitx.c

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 8779fe23671d..4e5b4d4f3531 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -56,6 +56,7 @@ config SND_MESON_AXG_SOUND_CARD
 	imply SND_MESON_AXG_SPDIFOUT
 	imply SND_MESON_AXG_SPDIFIN
 	imply SND_MESON_AXG_PDM
+	imply SND_MESON_G12A_TOHDMITX if DRM_MESON_DW_HDMI
 	help
 	  Select Y or M to add support for the AXG SoC sound card
 
@@ -82,4 +83,11 @@ config SND_MESON_AXG_PDM
 	help
 	  Select Y or M to add support for PDM input embedded
 	  in the Amlogic AXG SoC family
+
+config SND_MESON_G12A_TOHDMITX
+	tristate "Amlogic G12A To HDMI TX Control Support"
+	imply SND_SOC_HDMI_CODEC
+	help
+	  Select Y or M to add support for HDMI audio on the g12a SoC
+	  family
 endmenu
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index b45dfb9e2f88..1a8b1470ed84 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -11,6 +11,7 @@ snd-soc-meson-axg-sound-card-objs := axg-card.o
 snd-soc-meson-axg-spdifin-objs := axg-spdifin.o
 snd-soc-meson-axg-spdifout-objs := axg-spdifout.o
 snd-soc-meson-axg-pdm-objs := axg-pdm.o
+snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
 
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
@@ -23,3 +24,4 @@ obj-$(CONFIG_SND_MESON_AXG_SOUND_CARD) += snd-soc-meson-axg-sound-card.o
 obj-$(CONFIG_SND_MESON_AXG_SPDIFIN) += snd-soc-meson-axg-spdifin.o
 obj-$(CONFIG_SND_MESON_AXG_SPDIFOUT) += snd-soc-meson-axg-spdifout.o
 obj-$(CONFIG_SND_MESON_AXG_PDM) += snd-soc-meson-axg-pdm.o
+obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
new file mode 100644
index 000000000000..707ccb192e4c
--- /dev/null
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2019 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+#define G12A_TOHDMITX_DRV_NAME "g12a-tohdmitx"
+
+#define TOHDMITX_CTRL0			0x0
+#define  CTRL0_ENABLE_SHIFT		31
+#define  CTRL0_I2S_DAT_SEL		GENMASK(13, 12)
+#define  CTRL0_I2S_LRCLK_SEL		GENMASK(9, 8)
+#define  CTRL0_I2S_BLK_CAP_INV		BIT(7)
+#define  CTRL0_I2S_BCLK_O_INV		BIT(6)
+#define  CTRL0_I2S_BCLK_SEL		GENMASK(5, 4)
+#define  CTRL0_SPDIF_CLK_CAP_INV	BIT(3)
+#define  CTRL0_SPDIF_CLK_O_INV		BIT(2)
+#define  CTRL0_SPDIF_SEL		BIT(1)
+#define  CTRL0_SPDIF_CLK_SEL		BIT(0)
+
+struct g12a_tohdmitx_input {
+	struct snd_pcm_hw_params params;
+	unsigned int fmt;
+};
+
+static struct snd_soc_dapm_widget *
+g12a_tohdmitx_get_input(struct snd_soc_dapm_widget *w)
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
+		in = g12a_tohdmitx_get_input(p->source);
+		if (in)
+			return in;
+	}
+
+	return NULL;
+}
+
+static struct g12a_tohdmitx_input *
+g12a_tohdmitx_get_input_data(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_widget *in =
+		g12a_tohdmitx_get_input(w);
+	struct snd_soc_dai *dai;
+
+	if (WARN_ON(!in))
+		return NULL;
+
+	dai = in->priv;
+
+	return dai->playback_dma_data;
+}
+
+static const char * const g12a_tohdmitx_i2s_mux_texts[] = {
+	"I2S A", "I2S B", "I2S C",
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(g12a_tohdmitx_i2s_mux_enum,
+				g12a_tohdmitx_i2s_mux_texts);
+
+static int g12a_tohdmitx_get_input_val(struct snd_soc_component *component,
+				       unsigned int mask)
+{
+	unsigned int val;
+
+	snd_soc_component_read(component, TOHDMITX_CTRL0, &val);
+	return (val & mask) >> __ffs(mask);
+}
+
+static int g12a_tohdmitx_i2s_mux_get_enum(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+
+	ucontrol->value.enumerated.item[0] =
+		g12a_tohdmitx_get_input_val(component, CTRL0_I2S_DAT_SEL);
+
+	return 0;
+}
+
+static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int mux = ucontrol->value.enumerated.item[0];
+	unsigned int val = g12a_tohdmitx_get_input_val(component,
+						       CTRL0_I2S_DAT_SEL);
+
+	/* Force disconnect of the mux while updating */
+	if (val != mux)
+		snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+
+	snd_soc_component_update_bits(component, TOHDMITX_CTRL0,
+				      CTRL0_I2S_DAT_SEL |
+				      CTRL0_I2S_LRCLK_SEL |
+				      CTRL0_I2S_BCLK_SEL,
+				      FIELD_PREP(CTRL0_I2S_DAT_SEL, mux) |
+				      FIELD_PREP(CTRL0_I2S_LRCLK_SEL, mux) |
+				      FIELD_PREP(CTRL0_I2S_BCLK_SEL, mux));
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new g12a_tohdmitx_i2s_mux =
+	SOC_DAPM_ENUM_EXT("I2S Source", g12a_tohdmitx_i2s_mux_enum,
+			  g12a_tohdmitx_i2s_mux_get_enum,
+			  g12a_tohdmitx_i2s_mux_put_enum);
+
+static const char * const g12a_tohdmitx_spdif_mux_texts[] = {
+	"SPDIF A", "SPDIF B",
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(g12a_tohdmitx_spdif_mux_enum,
+				g12a_tohdmitx_spdif_mux_texts);
+
+static int g12a_tohdmitx_spdif_mux_get_enum(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+
+	ucontrol->value.enumerated.item[0] =
+		g12a_tohdmitx_get_input_val(component, CTRL0_SPDIF_SEL);
+
+	return 0;
+}
+
+static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int mux = ucontrol->value.enumerated.item[0];
+	unsigned int val = g12a_tohdmitx_get_input_val(component,
+						       CTRL0_SPDIF_SEL);
+
+	/* Force disconnect of the mux while updating */
+	if (val != mux)
+		snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+
+	snd_soc_component_update_bits(component, TOHDMITX_CTRL0,
+				      CTRL0_SPDIF_SEL |
+				      CTRL0_SPDIF_CLK_SEL,
+				      FIELD_PREP(CTRL0_SPDIF_SEL, mux) |
+				      FIELD_PREP(CTRL0_SPDIF_CLK_SEL, mux));
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new g12a_tohdmitx_spdif_mux =
+	SOC_DAPM_ENUM_EXT("SPDIF Source", g12a_tohdmitx_spdif_mux_enum,
+			  g12a_tohdmitx_spdif_mux_get_enum,
+			  g12a_tohdmitx_spdif_mux_put_enum);
+
+static const struct snd_kcontrol_new g12a_tohdmitx_out_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOHDMITX_CTRL0,
+				    CTRL0_ENABLE_SHIFT, 1, 0);
+
+static const struct snd_soc_dapm_widget g12a_tohdmitx_widgets[] = {
+	SND_SOC_DAPM_MUX("I2S SRC", SND_SOC_NOPM, 0, 0,
+			 &g12a_tohdmitx_i2s_mux),
+	SND_SOC_DAPM_SWITCH("I2S OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_tohdmitx_out_enable),
+	SND_SOC_DAPM_MUX("SPDIF SRC", SND_SOC_NOPM, 0, 0,
+			 &g12a_tohdmitx_spdif_mux),
+	SND_SOC_DAPM_SWITCH("SPDIF OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_tohdmitx_out_enable),
+};
+
+static int g12a_tohdmitx_input_probe(struct snd_soc_dai *dai)
+{
+	struct g12a_tohdmitx_input *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dai->playback_dma_data = data;
+	return 0;
+}
+
+static int g12a_tohdmitx_input_remove(struct snd_soc_dai *dai)
+{
+	kfree(dai->playback_dma_data);
+	return 0;
+}
+
+static int g12a_tohdmitx_input_hw_params(struct snd_pcm_substream *substream,
+					 struct snd_pcm_hw_params *params,
+					 struct snd_soc_dai *dai)
+{
+	struct g12a_tohdmitx_input *data = dai->playback_dma_data;
+
+	/* Save the stream params for the downstream link */
+	memcpy(&data->params, params, sizeof(*params));
+
+	return 0;
+}
+
+static int g12a_tohdmitx_output_hw_params(struct snd_pcm_substream *substream,
+					  struct snd_pcm_hw_params *params,
+					  struct snd_soc_dai *dai)
+{
+	struct g12a_tohdmitx_input *in_data =
+		g12a_tohdmitx_get_input_data(dai->capture_widget);
+
+	if (!in_data)
+		return -ENODEV;
+
+	memcpy(params, &in_data->params, sizeof(*params));
+
+	return 0;
+}
+
+static int g12a_tohdmitx_input_set_fmt(struct snd_soc_dai *dai,
+				       unsigned int fmt)
+{
+	struct g12a_tohdmitx_input *data = dai->playback_dma_data;
+
+	/* Save the source stream format for the downstream link */
+	data->fmt = fmt;
+	return 0;
+}
+
+static int g12a_tohdmitx_output_startup(struct snd_pcm_substream *substream,
+					struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct g12a_tohdmitx_input *in_data =
+		g12a_tohdmitx_get_input_data(dai->capture_widget);
+
+	if (!in_data)
+		return -ENODEV;
+
+	if (!in_data->fmt)
+		return 0;
+
+	return snd_soc_runtime_set_dai_fmt(rtd, in_data->fmt);
+}
+
+static const struct snd_soc_dai_ops g12a_tohdmitx_input_ops = {
+	.hw_params	= g12a_tohdmitx_input_hw_params,
+	.set_fmt	= g12a_tohdmitx_input_set_fmt,
+};
+
+static const struct snd_soc_dai_ops g12a_tohdmitx_output_ops = {
+	.hw_params	= g12a_tohdmitx_output_hw_params,
+	.startup	= g12a_tohdmitx_output_startup,
+};
+
+#define TOHDMITX_SPDIF_FORMATS					\
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |	\
+	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE)
+
+#define TOHDMITX_I2S_FORMATS					\
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |	\
+	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |	\
+	 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define TOHDMITX_STREAM(xname, xsuffix, xfmt, xchmax)		\
+{								\
+	.stream_name	= xname " " xsuffix,			\
+	.channels_min	= 1,					\
+	.channels_max	= (xchmax),				\
+	.rate_min       = 8000,					\
+	.rate_max	= 192000,				\
+	.formats	= (xfmt),				\
+}
+
+#define TOHDMITX_IN(xname, xid, xfmt, xchmax) {				\
+	.name = xname,							\
+	.id = (xid),							\
+	.playback = TOHDMITX_STREAM(xname, "Playback", xfmt, xchmax),	\
+	.ops = &g12a_tohdmitx_input_ops,				\
+	.probe = g12a_tohdmitx_input_probe,				\
+	.remove = g12a_tohdmitx_input_remove,				\
+}
+
+#define TOHDMITX_OUT(xname, xid, xfmt, xchmax) {			\
+	.name = xname,							\
+	.id = (xid),							\
+	.capture = TOHDMITX_STREAM(xname, "Capture", xfmt, xchmax),	\
+	.ops = &g12a_tohdmitx_output_ops,				\
+}
+
+static struct snd_soc_dai_driver g12a_tohdmitx_dai_drv[] = {
+	TOHDMITX_IN("I2S IN A", TOHDMITX_I2S_IN_A,
+		    TOHDMITX_I2S_FORMATS, 8),
+	TOHDMITX_IN("I2S IN B", TOHDMITX_I2S_IN_B,
+		    TOHDMITX_I2S_FORMATS, 8),
+	TOHDMITX_IN("I2S IN C", TOHDMITX_I2S_IN_C,
+		    TOHDMITX_I2S_FORMATS, 8),
+	TOHDMITX_OUT("I2S OUT", TOHDMITX_I2S_OUT,
+		     TOHDMITX_I2S_FORMATS, 8),
+	TOHDMITX_IN("SPDIF IN A", TOHDMITX_SPDIF_IN_A,
+		    TOHDMITX_SPDIF_FORMATS, 2),
+	TOHDMITX_IN("SPDIF IN B", TOHDMITX_SPDIF_IN_B,
+		    TOHDMITX_SPDIF_FORMATS, 2),
+	TOHDMITX_OUT("SPDIF OUT", TOHDMITX_SPDIF_OUT,
+		     TOHDMITX_SPDIF_FORMATS, 2),
+};
+
+static int g12a_tohdmi_component_probe(struct snd_soc_component *c)
+{
+	/* Initialize the static clock parameters */
+	return snd_soc_component_write(c, TOHDMITX_CTRL0,
+		     CTRL0_I2S_BLK_CAP_INV | CTRL0_SPDIF_CLK_CAP_INV);
+}
+
+static const struct snd_soc_dapm_route g12a_tohdmitx_routes[] = {
+	{ "I2S SRC", "I2S A", "I2S IN A Playback" },
+	{ "I2S SRC", "I2S B", "I2S IN B Playback" },
+	{ "I2S SRC", "I2S C", "I2S IN C Playback" },
+	{ "I2S OUT EN", "Switch", "I2S SRC" },
+	{ "I2S OUT Capture", NULL, "I2S OUT EN" },
+	{ "SPDIF SRC", "SPDIF A", "SPDIF IN A Playback" },
+	{ "SPDIF SRC", "SPDIF B", "SPDIF IN B Playback" },
+	{ "SPDIF OUT EN", "Switch", "SPDIF SRC" },
+	{ "SPDIF OUT Capture", NULL, "SPDIF OUT EN" },
+};
+
+static const struct snd_soc_component_driver g12a_tohdmitx_component_drv = {
+	.probe			= g12a_tohdmi_component_probe,
+	.dapm_widgets		= g12a_tohdmitx_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(g12a_tohdmitx_widgets),
+	.dapm_routes		= g12a_tohdmitx_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_tohdmitx_routes),
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct regmap_config g12a_tohdmitx_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+};
+
+static const struct of_device_id g12a_tohdmitx_of_match[] = {
+	{ .compatible = "amlogic,g12a-tohdmitx", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, g12a_tohdmitx_of_match);
+
+static int g12a_tohdmitx_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *regs;
+	struct regmap *map;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	map = devm_regmap_init_mmio(dev, regs, &g12a_tohdmitx_regmap_cfg);
+	if (IS_ERR(map)) {
+		dev_err(dev, "failed to init regmap: %ld\n",
+			PTR_ERR(map));
+		return PTR_ERR(map);
+	}
+
+	return devm_snd_soc_register_component(dev,
+			&g12a_tohdmitx_component_drv, g12a_tohdmitx_dai_drv,
+			ARRAY_SIZE(g12a_tohdmitx_dai_drv));
+}
+
+static struct platform_driver g12a_tohdmitx_pdrv = {
+	.driver = {
+		.name = G12A_TOHDMITX_DRV_NAME,
+		.of_match_table = g12a_tohdmitx_of_match,
+	},
+	.probe = g12a_tohdmitx_probe,
+};
+module_platform_driver(g12a_tohdmitx_pdrv);
+
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_DESCRIPTION("Amlogic G12a To HDMI Tx Control Codec Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

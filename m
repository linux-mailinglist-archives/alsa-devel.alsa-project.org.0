Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4EF1F588
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 15:24:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD9416C1;
	Wed, 15 May 2019 15:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD9416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557926658;
	bh=I2behTtkAP8a1RD5wgJH6A3Knfhp9SWUJqOuHaPsByc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D/GIf6FKG9PE0i4C/14+FXCAB/SsLz6IZOjnR0ivh4x+YzS54HYbJfcCEtLsFO9JP
	 Q/W0AOx9SNJGqvCqPyzauBadiax5AZ76OZ7uSzMC+Xz6f9TL31RIxAEywiA4f8GvsV
	 hDtjA+YJuqnSABfr1q3tPGokkE5Thw8R/FOQInzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0C2F89742;
	Wed, 15 May 2019 15:19:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CDEDF8973B; Wed, 15 May 2019 15:19:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10FDAF8968A
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 15:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10FDAF8968A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="CGC57N2d"
Received: by mail-wm1-x341.google.com with SMTP id 7so12321wmo.2
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2l6cV/XBERtzMJN9MOTGY475jDhdiqP66F5DuNPZchA=;
 b=CGC57N2dTGbsXRGtWoOCsuPXcWdTNYdtBnNwGPHVxj/xgHCEmAU+fWutrPVXsGWrtX
 ivDqS0xAD9YMFpwOaXT2zSBZxxAPBp1KpSt/mzgPPbWwI37tVaeFluhbumSfyybfzW/b
 5kZ4ZPJePgq5ZkOveKQw+IkgnH+gjijoiihuWZOvmUL8a7ujnsjSdQ2PjDvtZ+qDwRSz
 JyE4d0T94VpJ6Nb5ojSOgEsu6eCOYVI1SG4sXKIcc0YXUVEl1oTm0oYae/nhbXHC+D4W
 dkg22QmikZSOFjdYhAMkbAX3rTcV41NIglH2PrUJB/sYBkaUianICIhSQiXq560vFDe9
 Ys3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2l6cV/XBERtzMJN9MOTGY475jDhdiqP66F5DuNPZchA=;
 b=KIN6lV2jlskQy6gdAlj9QejAXvJznit0CCfglLl7ZYsupWgDRjXFouu+1sMmMGmzPC
 J7q/mlAE4HLEAdZ9HXHVCIo7lYq+7LLxzngm8V+MskN69pRNRpdoPwPd2jzXlb+Qw9fc
 74Pl3M9kwQYTTRtXqGlsZP88QOliF/w6DEkAnrBxVkZDklWul1e+eNqkmLjG0u7ORd+w
 BmOyyGnyFrUsI6Rmo5Y3GoOYugcWRZ4EMyGOwcXpShKknc0qAjErBmwJMkhFoAVBcwiL
 GKtwJvsCpX6Yc2XpF83+KHEz9JiO/D9D+VisSGaCFUMZVVx0w7+ilNvByR126c7vsGBp
 LKhg==
X-Gm-Message-State: APjAAAXK51/qSDuEfUnLj0o3jxCADXZH9XbiBEhSUHcI3ERVdsvOk6Vm
 TYDi++Rm/JNZz1D13UCr1MKMag==
X-Google-Smtp-Source: APXvYqzV9IrpFP9v8rb7MSFaAjwig9e+NH7CRTqfvbqgP9tO28VK202yRIKwpDr1/QkYKbKCB1e97Q==
X-Received: by 2002:a1c:a695:: with SMTP id
 p143mr23747745wme.128.1557926348128; 
 Wed, 15 May 2019 06:19:08 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 15 May 2019 15:18:58 +0200
Message-Id: <20190515131858.32130-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 5/5] ASoC: meson: add g12a tohdmitx control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for the hdmitx control glue of the Amlogic g12a SoC family.
This glue links the 3 TDM and 2 SPDIF output interfaces of the SoC to
the related inputs of the Synopsys HDMI controller found in these SoCs.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
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

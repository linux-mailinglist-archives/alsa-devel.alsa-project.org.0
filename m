Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72315C52D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 16:55:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43DCD16B2;
	Thu, 13 Feb 2020 16:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43DCD16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581609304;
	bh=KBnRdOZ4xOPgq8O4bX8jw+Q0pXn7hvKyjqAfGa3spsE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbjyHrfiSQvqj/UBteH2vO1sgHaaevUsU6wjV3bSk/96AruTYg63gLe3L0beklncb
	 kKWW1NIP7K6teCJFovo52CyaS4vwZszU7LV2oZ7h3uN/k11PwysAaD5V1MeDjI4QzK
	 WUJNtk/Z00v9VZDqVICWxW893UbAHUdgv5ozuYos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B0BF8027C;
	Thu, 13 Feb 2020 16:52:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42329F8021E; Thu, 13 Feb 2020 16:52:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7F85F8013E
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 16:52:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F85F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="PgdbC3nF"
Received: by mail-wm1-x344.google.com with SMTP id c84so7330496wme.4
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kz83rwM7wmIisHs5YaSTbeuhE26BFhOcdChWZLO5MoQ=;
 b=PgdbC3nFGCcsgkml75r2M0c9TqvvI0vbQkKTQB19Lyz+cbGPhn+zVh8kybj7lcOhKT
 QSkTfaLGIizi7H64jGxfs7EfLqp1d8WL5wGDboTMt+u1KeGfINbg0SOPQpqMR66l/NGo
 LMEzqiFJXuI4NAuqedXtrwA63zrHsXRldlprdlvRc7gGScc6VPZ7DD4INkdr4RC6B0eA
 ihbD6tvd0JiHohjkLI2ACoDqsbgn3hBYTDQ0jGTYzFFUiBWsx9b2894yIGkzGm8OPsuS
 4i+lX91aTuE28escSWS6/ckV4TK2yPfmKZ8N6Ip0iMJTfn6PV0mk1TH3W3mJ1eV834Vr
 Hvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kz83rwM7wmIisHs5YaSTbeuhE26BFhOcdChWZLO5MoQ=;
 b=qH26wOflphYWdCKrW5p7OOT/HKxERMUFgAiObsiUDqAbGTiv9xNXIIhaRR+tiAUt2M
 evv6KJlcXsPqiPiOv7jIc805xQe7jrDzteXqF0n2IrVoRpX5swO/Z3zMnIBsuCg2pdKJ
 Z8Wn6OjtNwiu+lyLJLnIMuq3KF7cAeKB5fyMbO5K0hwBSnWyTPHPr0WyMEZAlQKElhzs
 lPLYv3tjohZcfs4FGyXJBZvGzYIpIH6QzTVeY8b+arX3/pXYTizkxgKBa+DPfgSbjYuF
 p4yR/dbK+Q0s7LwsArnEcVVkI4L+PDXLVF/Cyag56zXoKCppI+UZ8/V94vrih4U8PK3j
 CyAg==
X-Gm-Message-State: APjAAAWokVnXt0JN0xauJBsq4Y/XPo0Gvf67DxiW71B6adbxc7B2xBst
 6Wk0pGkCuTx5eNuuCf7bE0NY7w==
X-Google-Smtp-Source: APXvYqzEMEuudLr3azhK1KG9oNVa9/iH6V9Aa+4Hj+KKTng0BZ8d0hnolhAwoL7MOO5TotsCTF9Zcg==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr6324883wmi.14.1581609129642;
 Thu, 13 Feb 2020 07:52:09 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:09 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu, 13 Feb 2020 16:51:52 +0100
Message-Id: <20200213155159.3235792-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/9] ASoC: meson: g12a: extract codec-to-codec
	utils
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

The hdmi routing mechanism used on g12a hdmi is also used:
* other Amlogic SoC types
* for the internal DAC path

Each of these codec glues are slightly different but the idea
behind it remains the same. This change extract some helper functions
from the g12a-tohdmitx driver to make them available for other Amlogic
codecs.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
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
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

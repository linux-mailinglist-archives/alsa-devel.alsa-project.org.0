Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A515C565
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 16:56:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80DA616D7;
	Thu, 13 Feb 2020 16:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80DA616D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581609381;
	bh=1fYfIPZRpaIsq59pLCWG8YSpKOXFMzSRNmjsPf+//Co=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WEacyH3bUHpCxf7vutrAi2XH0auYq+lP0Y/UKf5sL8BFRde4wsi26vQZ6+RF+Y/r7
	 6xsVXJY83eYO2wBe79wfT7d/410kRvr5uDUC0+BDDm5IqEmzRjumr+gBhSHMO67PEG
	 voP84XbG4f/wfO3lPC1RnvXBAmlIMFJK9cdH47iU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B6CF80292;
	Thu, 13 Feb 2020 16:52:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ACD0F8027B; Thu, 13 Feb 2020 16:52:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBC9CF80147
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 16:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC9CF80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="qgh7smu+"
Received: by mail-wr1-x444.google.com with SMTP id t3so7287696wru.7
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ad7UP5GkRuyRzx3mOlQeziETnaIJrw5CaQcjZBxduWE=;
 b=qgh7smu+CPrPyBfPqkNBQ6RRiMp310lxB65DDrR+87rYr+QWAWV4yRiZ6fIzwtnFkK
 k/rDfoouplgFUD4mJ0HcJ5u3qMgPPFoQM9AMGNk7x+txvUytEntW2+R4U4nLZ882wL8l
 qYWosTFaSdasJ1nuxMXy3FGpc7cR9mE7AgP2Fhj2/J5/cc2ixdofzOfdPB362rYTg0yj
 Cgilp9KjSR+/NSPge2Op0Ic4pg2tQTKIUZF9D3XO0yzFwy2kNXvTNh9xn1dUYQ0LY6fd
 297wR/oM2vogCUCxS0Dyf+nM3EPk0V0ti1b3ueXjk+7Mi/SvZcmfRFReEZdezo97im5i
 pWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ad7UP5GkRuyRzx3mOlQeziETnaIJrw5CaQcjZBxduWE=;
 b=c2sfCur7mtslzxqaNaO5SnQIdeg+2DOnWMqgV4rPyBL2oF30LrMnx7orik3KG7xKwI
 SCvWdHiEZwUYSVfaDZ++irikRXnGCbbspMr5mKXZRnatOoxbJsA80SCEd3DfSGYOloES
 BPcHKxWViFkFfuSxX/2pyuaqGAeXJcEBGXN4ybyPyBDuYb1vzQXkfoAx3lAosAAbuzx/
 K7+csj1bDecrwOX8LBTrEy0KXlLXc4a4A37qEFW24I9YK4reG0id4dPC/x+fG6+027g9
 Bo302K4RsUAMImYOSDkK8B12icjJN1Xwt+ZVBjVoBpytXtQm6mChQ8yEfC5UAQF3nQpj
 t0NA==
X-Gm-Message-State: APjAAAUi8MOwlqc/TnYQmr+d7tk2QTSD/cySoA7WX+NQlJpz1P5goW/v
 9Lhh+L78rVkijuBi44ik6C8Grw==
X-Google-Smtp-Source: APXvYqzHx5OuMae50LV2pfP3FZjaSow8+3J6VxETyg+AXMtrDdomw5migEXzukeyNq0B55OWaFY73A==
X-Received: by 2002:a05:6000:124b:: with SMTP id
 j11mr20695090wrx.285.1581609132857; 
 Thu, 13 Feb 2020 07:52:12 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:12 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu, 13 Feb 2020 16:51:55 +0100
Message-Id: <20200213155159.3235792-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 5/9] ASoC: meson: aiu: add hdmi codec control
	support
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

Add the codec to codec component which handles the routing between
the audio producers (PCM and I2S) and the synopsys hdmi controller
on the amlogic GX SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig          |   2 +
 sound/soc/meson/Makefile         |   1 +
 sound/soc/meson/aiu-codec-ctrl.c | 152 +++++++++++++++++++++++++++++++
 sound/soc/meson/aiu.c            |  34 ++++++-
 sound/soc/meson/aiu.h            |   8 ++
 5 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/meson/aiu-codec-ctrl.c

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index ca269dedfc7f..19de97ae4ce9 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -4,7 +4,9 @@ menu "ASoC support for Amlogic platforms"
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
+	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
+	imply SND_SOC_HDMI_CODEC if DRM_MESON_DW_HDMI
 	help
 	  Select Y or M to add support for the Audio output subsystem found
 	  in the Amlogic GX SoC family
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index a7b79d717288..3b21f648e322 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 snd-soc-meson-aiu-objs := aiu.o
+snd-soc-meson-aiu-objs += aiu-codec-ctrl.o
 snd-soc-meson-aiu-objs += aiu-encoder-i2s.o
 snd-soc-meson-aiu-objs += aiu-encoder-spdif.o
 snd-soc-meson-aiu-objs += aiu-fifo.o
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
new file mode 100644
index 000000000000..8646a953e3b3
--- /dev/null
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include <dt-bindings/sound/meson-aiu.h>
+#include "aiu.h"
+#include "meson-codec-glue.h"
+
+#define CTRL_CLK_SEL		GENMASK(1, 0)
+#define CTRL_DATA_SEL_SHIFT	4
+#define CTRL_DATA_SEL		(0x3 << CTRL_DATA_SEL_SHIFT)
+
+static const char * const aiu_codec_ctrl_mux_texts[] = {
+	"DISABLED", "PCM", "I2S",
+};
+
+static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
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
+					      CTRL_DATA_SEL,
+					      FIELD_PREP(CTRL_DATA_SEL, mux));
+
+	if (!changed)
+		return 0;
+
+	/* Force disconnect of the mux while updating */
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+
+	/* Reset the source first */
+	snd_soc_component_update_bits(component, e->reg,
+				      CTRL_CLK_SEL |
+				      CTRL_DATA_SEL,
+				      FIELD_PREP(CTRL_CLK_SEL, 0) |
+				      FIELD_PREP(CTRL_DATA_SEL, 0));
+
+	/* Set the appropriate source */
+	snd_soc_component_update_bits(component, e->reg,
+				      CTRL_CLK_SEL |
+				      CTRL_DATA_SEL,
+				      FIELD_PREP(CTRL_CLK_SEL, mux) |
+				      FIELD_PREP(CTRL_DATA_SEL, mux));
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+
+	return 0;
+}
+
+static SOC_ENUM_SINGLE_DECL(aiu_hdmi_ctrl_mux_enum, AIU_HDMI_CLK_DATA_CTRL,
+			    CTRL_DATA_SEL_SHIFT,
+			    aiu_codec_ctrl_mux_texts);
+
+static const struct snd_kcontrol_new aiu_hdmi_ctrl_mux =
+	SOC_DAPM_ENUM_EXT("HDMI Source", aiu_hdmi_ctrl_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  aiu_codec_ctrl_mux_put_enum);
+
+static const struct snd_soc_dapm_widget aiu_hdmi_ctrl_widgets[] = {
+	SND_SOC_DAPM_MUX("HDMI CTRL SRC", SND_SOC_NOPM, 0, 0,
+			 &aiu_hdmi_ctrl_mux),
+};
+
+static const struct snd_soc_dai_ops aiu_codec_ctrl_input_ops = {
+	.hw_params	= meson_codec_glue_input_hw_params,
+	.set_fmt	= meson_codec_glue_input_set_fmt,
+};
+
+static const struct snd_soc_dai_ops aiu_codec_ctrl_output_ops = {
+	.startup	= meson_codec_glue_output_startup,
+};
+
+#define AIU_CODEC_CTRL_FORMATS					\
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |	\
+	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |	\
+	 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define AIU_CODEC_CTRL_STREAM(xname, xsuffix)			\
+{								\
+	.stream_name	= xname " " xsuffix,			\
+	.channels_min	= 1,					\
+	.channels_max	= 8,					\
+	.rate_min       = 5512,					\
+	.rate_max	= 192000,				\
+	.formats	= AIU_CODEC_CTRL_FORMATS,		\
+}
+
+#define AIU_CODEC_CTRL_INPUT(xname) {				\
+	.name = "CODEC CTRL " xname,				\
+	.playback = AIU_CODEC_CTRL_STREAM(xname, "Playback"),	\
+	.ops = &aiu_codec_ctrl_input_ops,			\
+	.probe = meson_codec_glue_input_dai_probe,		\
+	.remove = meson_codec_glue_input_dai_remove,		\
+}
+
+#define AIU_CODEC_CTRL_OUTPUT(xname) {				\
+	.name = "CODEC CTRL " xname,				\
+	.capture = AIU_CODEC_CTRL_STREAM(xname, "Capture"),	\
+	.ops = &aiu_codec_ctrl_output_ops,			\
+}
+
+static struct snd_soc_dai_driver aiu_hdmi_ctrl_dai_drv[] = {
+	[CTRL_I2S] = AIU_CODEC_CTRL_INPUT("HDMI I2S IN"),
+	[CTRL_PCM] = AIU_CODEC_CTRL_INPUT("HDMI PCM IN"),
+	[CTRL_OUT] = AIU_CODEC_CTRL_OUTPUT("HDMI OUT"),
+};
+
+static const struct snd_soc_dapm_route aiu_hdmi_ctrl_routes[] = {
+	{ "HDMI CTRL SRC", "I2S", "HDMI I2S IN Playback" },
+	{ "HDMI CTRL SRC", "PCM", "HDMI PCM IN Playback" },
+	{ "HDMI OUT Capture", NULL, "HDMI CTRL SRC" },
+};
+
+static int aiu_hdmi_of_xlate_dai_name(struct snd_soc_component *component,
+				      struct of_phandle_args *args,
+				      const char **dai_name)
+{
+	return aiu_of_xlate_dai_name(component, args, dai_name, AIU_HDMI);
+}
+
+static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
+	.name			= "AIU HDMI Codec Control",
+	.dapm_widgets		= aiu_hdmi_ctrl_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(aiu_hdmi_ctrl_widgets),
+	.dapm_routes		= aiu_hdmi_ctrl_routes,
+	.num_dapm_routes	= ARRAY_SIZE(aiu_hdmi_ctrl_routes),
+	.of_xlate_dai_name	= aiu_hdmi_of_xlate_dai_name,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+int aiu_hdmi_ctrl_register_component(struct device *dev)
+{
+	return aiu_add_component(dev, &aiu_hdmi_ctrl_component,
+				 aiu_hdmi_ctrl_dai_drv,
+				 ARRAY_SIZE(aiu_hdmi_ctrl_dai_drv),
+				 "hdmi");
+}
+
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index a62aced9b687..b765dfb70726 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -71,6 +71,26 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 	return 0;
 }
 
+int aiu_add_component(struct device *dev,
+		      const struct snd_soc_component_driver *component_driver,
+		      struct snd_soc_dai_driver *dai_drv,
+		      int num_dai,
+		      const char *debugfs_prefix)
+{
+	struct snd_soc_component *component;
+
+	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return -ENOMEM;
+
+#ifdef CONFIG_DEBUG_FS
+	component->debugfs_prefix = debugfs_prefix;
+#endif
+
+	return snd_soc_add_component(dev, component, component_driver,
+				     dai_drv, num_dai);
+}
+
 static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,
 				     struct of_phandle_args *args,
 				     const char **dai_name)
@@ -313,9 +333,21 @@ static int aiu_probe(struct platform_device *pdev)
 	ret = snd_soc_register_component(dev, &aiu_cpu_component,
 					 aiu_cpu_dai_drv,
 					 ARRAY_SIZE(aiu_cpu_dai_drv));
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Failed to register cpu component\n");
+		return ret;
+	}
 
+	/* Register the hdmi codec control component */
+	ret = aiu_hdmi_ctrl_register_component(dev);
+	if (ret) {
+		dev_err(dev, "Failed to register hdmi control component\n");
+		goto err;
+	}
+
+	return 0;
+err:
+	snd_soc_unregister_component(dev);
 	return ret;
 }
 
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index a3488027b9d5..9242ab1ab64b 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -45,6 +45,14 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 			  const char **dai_name,
 			  unsigned int component_id);
 
+int aiu_add_component(struct device *dev,
+		      const struct snd_soc_component_driver *component_driver,
+		      struct snd_soc_dai_driver *dai_drv,
+		      int num_dai,
+		      const char *debugfs_prefix);
+
+int aiu_hdmi_ctrl_register_component(struct device *dev);
+
 int aiu_fifo_i2s_dai_probe(struct snd_soc_dai *dai);
 int aiu_fifo_spdif_dai_probe(struct snd_soc_dai *dai);
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

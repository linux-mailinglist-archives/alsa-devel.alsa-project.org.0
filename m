Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456515C566
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 16:57:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E64B016C5;
	Thu, 13 Feb 2020 16:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E64B016C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581609423;
	bh=fuD/87jWq7grKRMAe4dsLJ4PrgNnz/o1FYG7he832sU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTMZp+sfxMmSM3XVctY2VP6QR5p337rU3v4/TDUtT03BOTtlh5Ye/m7IRVb1RM+eO
	 rUOce/+pzAlBjD+NgkjticfUOxVc64p8yGA2tdzV38YYN2r642YGyp9TemIDwLT3Ny
	 MSe7EPxtL40VZCsJ6nv8HS/MPfphn+J7zl1sMRro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4D3F8029A;
	Thu, 13 Feb 2020 16:52:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CF63F8028D; Thu, 13 Feb 2020 16:52:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07657F801DA
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 16:52:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07657F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="W2joqd9A"
Received: by mail-wm1-x343.google.com with SMTP id c84so7330710wme.4
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PE6MSof9ikEAHBm0daRLxCQZwkiheW3ZANvlgjgzY4A=;
 b=W2joqd9AKon1Xq5f0Upd6Q7fOnSObgDd7NrBexU5uRn9qpzPt6VZMXwXgZX5vxZmjc
 4jHc9q1srDbda3SNX04xCXQZRzFsO0c8bddtguhgNSLTE6FaqUAa9BT5yRI92nu58Xpe
 o+VZVidv3whdiXRlMKVBm79NlEi+Bd2JDawi5EFef+MiOd6r2JF5cYKGFhN40pTHOUcw
 2NUe4YqYfHzP0IaAEcwttcyXFnswgF7GCOSFIr2MA+cMCuZawBM7z7SZlrbfPAacBcve
 GW+0792a9w/+gxK6Ojm9r8gaU55CMgpN5qAqLnFpmmfDReqmKFdVNXtmK6m/VrFgVG+j
 6ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PE6MSof9ikEAHBm0daRLxCQZwkiheW3ZANvlgjgzY4A=;
 b=VT8lIwwuzERM24MRlLfPbRkVwqr+2Li0JOuZ5NfD2VfZ5Ex4bdjcZ4CyTSQLPU8n9l
 tlaZlMS2Q4/gucIkp3lxYKSGNWHdy8TdBvWAxD+IxR1yQnHp4qNqn7xwD+iSkGuqS5X/
 A1N0tTRevFLTqeWYGoOxBJDmKxmQLF4RsoDv6/E/bWfPAMeqXXsJ8Y6DjvN6PPxp3a9y
 cGRPlFX84JG19F33B8l2fgJb4ZBElTFNs1THz3cGVN3AReYoCjYVMe8MuOwSZNMpiS7N
 q/nXHYRfERVrheppT0A8cnZ4gr1DmbjFlLUF16qzZaa2dHgKZBjbZO6+LtF2N/8u6C0h
 aWAQ==
X-Gm-Message-State: APjAAAVd9qHamyZF0SE5/yeEuya5ydVGJfCatG9jn00DFsEegmZGBQib
 cduXbdzJBrTdgYYDRK0R3+MPGA==
X-Google-Smtp-Source: APXvYqx4wuZLfC7RkbrXtkvYozkKIHXN5pJWTAs/jiDRgx6uE3jhvMkw7UoC1BQRf3SxfBRDSaCoAQ==
X-Received: by 2002:a05:600c:34b:: with SMTP id
 u11mr6405614wmd.69.1581609133827; 
 Thu, 13 Feb 2020 07:52:13 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu, 13 Feb 2020 16:51:56 +0100
Message-Id: <20200213155159.3235792-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 6/9] ASoC: meson: aiu: add internal dac codec
	control support
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
the audio producers and the internal audio DAC found on the amlogic GXL
SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Makefile          |   1 +
 sound/soc/meson/aiu-acodec-ctrl.c | 205 ++++++++++++++++++++++++++++++
 sound/soc/meson/aiu.c             |  10 ++
 sound/soc/meson/aiu.h             |   1 +
 4 files changed, 217 insertions(+)
 create mode 100644 sound/soc/meson/aiu-acodec-ctrl.c

diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 3b21f648e322..80f9113701b3 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 snd-soc-meson-aiu-objs := aiu.o
+snd-soc-meson-aiu-objs += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-objs += aiu-codec-ctrl.o
 snd-soc-meson-aiu-objs += aiu-encoder-i2s.o
 snd-soc-meson-aiu-objs += aiu-encoder-spdif.o
diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
new file mode 100644
index 000000000000..12d8a4d351a1
--- /dev/null
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -0,0 +1,205 @@
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
+#define CTRL_DIN_EN			15
+#define CTRL_CLK_INV			BIT(14)
+#define CTRL_LRCLK_INV			BIT(13)
+#define CTRL_I2S_IN_BCLK_SRC		BIT(11)
+#define CTRL_DIN_LRCLK_SRC_SHIFT	6
+#define CTRL_DIN_LRCLK_SRC		(0x3 << CTRL_DIN_LRCLK_SRC_SHIFT)
+#define CTRL_BCLK_MCLK_SRC		GENMASK(5, 4)
+#define CTRL_DIN_SKEW			GENMASK(3, 2)
+#define CTRL_I2S_OUT_LANE_SRC		0
+
+#define AIU_ACODEC_OUT_CHMAX		2
+
+static const char * const aiu_acodec_ctrl_mux_texts[] = {
+	"DISABLED", "I2S", "PCM",
+};
+
+static int aiu_acodec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
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
+					      CTRL_DIN_LRCLK_SRC,
+					      FIELD_PREP(CTRL_DIN_LRCLK_SRC,
+							 mux));
+
+	if (!changed)
+		return 0;
+
+	/* Force disconnect of the mux while updating */
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+
+	snd_soc_component_update_bits(component, e->reg,
+				      CTRL_DIN_LRCLK_SRC |
+				      CTRL_BCLK_MCLK_SRC,
+				      FIELD_PREP(CTRL_DIN_LRCLK_SRC, mux) |
+				      FIELD_PREP(CTRL_BCLK_MCLK_SRC, mux));
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+
+	return 0;
+}
+
+static SOC_ENUM_SINGLE_DECL(aiu_acodec_ctrl_mux_enum, AIU_ACODEC_CTRL,
+			    CTRL_DIN_LRCLK_SRC_SHIFT,
+			    aiu_acodec_ctrl_mux_texts);
+
+static const struct snd_kcontrol_new aiu_acodec_ctrl_mux =
+	SOC_DAPM_ENUM_EXT("ACodec Source", aiu_acodec_ctrl_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  aiu_acodec_ctrl_mux_put_enum);
+
+static const struct snd_kcontrol_new aiu_acodec_ctrl_out_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", AIU_ACODEC_CTRL,
+				    CTRL_DIN_EN, 1, 0);
+
+static const struct snd_soc_dapm_widget aiu_acodec_ctrl_widgets[] = {
+	SND_SOC_DAPM_MUX("ACODEC SRC", SND_SOC_NOPM, 0, 0,
+			 &aiu_acodec_ctrl_mux),
+	SND_SOC_DAPM_SWITCH("ACODEC OUT EN", SND_SOC_NOPM, 0, 0,
+			    &aiu_acodec_ctrl_out_enable),
+};
+
+static int aiu_acodec_ctrl_input_hw_params(struct snd_pcm_substream *substream,
+					   struct snd_pcm_hw_params *params,
+					   struct snd_soc_dai *dai)
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
+	data->params.channels_min = min_t(unsigned int, AIU_ACODEC_OUT_CHMAX,
+					  data->params.channels_min);
+	data->params.channels_max = min_t(unsigned int, AIU_ACODEC_OUT_CHMAX,
+					  data->params.channels_max);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops aiu_acodec_ctrl_input_ops = {
+	.hw_params	= aiu_acodec_ctrl_input_hw_params,
+	.set_fmt	= meson_codec_glue_input_set_fmt,
+};
+
+static const struct snd_soc_dai_ops aiu_acodec_ctrl_output_ops = {
+	.startup	= meson_codec_glue_output_startup,
+};
+
+#define AIU_ACODEC_CTRL_FORMATS					\
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |	\
+	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |	\
+	 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define AIU_ACODEC_STREAM(xname, xsuffix, xchmax)		\
+{								\
+	.stream_name	= xname " " xsuffix,			\
+	.channels_min	= 1,					\
+	.channels_max	= (xchmax),				\
+	.rate_min       = 5512,					\
+	.rate_max	= 192000,				\
+	.formats	= AIU_ACODEC_CTRL_FORMATS,		\
+}
+
+#define AIU_ACODEC_INPUT(xname) {				\
+	.name = "ACODEC CTRL " xname,				\
+	.name = xname,						\
+	.playback = AIU_ACODEC_STREAM(xname, "Playback", 8),	\
+	.ops = &aiu_acodec_ctrl_input_ops,			\
+	.probe = meson_codec_glue_input_dai_probe,		\
+	.remove = meson_codec_glue_input_dai_remove,		\
+}
+
+#define AIU_ACODEC_OUTPUT(xname) {				\
+	.name = "ACODEC CTRL " xname,				\
+	.capture = AIU_ACODEC_STREAM(xname, "Capture", AIU_ACODEC_OUT_CHMAX), \
+	.ops = &aiu_acodec_ctrl_output_ops,			\
+}
+
+static struct snd_soc_dai_driver aiu_acodec_ctrl_dai_drv[] = {
+	[CTRL_I2S] = AIU_ACODEC_INPUT("ACODEC I2S IN"),
+	[CTRL_PCM] = AIU_ACODEC_INPUT("ACODEC PCM IN"),
+	[CTRL_OUT] = AIU_ACODEC_OUTPUT("ACODEC OUT"),
+};
+
+static const struct snd_soc_dapm_route aiu_acodec_ctrl_routes[] = {
+	{ "ACODEC SRC", "I2S", "ACODEC I2S IN Playback" },
+	{ "ACODEC SRC", "PCM", "ACODEC PCM IN Playback" },
+	{ "ACODEC OUT EN", "Switch", "ACODEC SRC" },
+	{ "ACODEC OUT Capture", NULL, "ACODEC OUT EN" },
+};
+
+static const struct snd_kcontrol_new aiu_acodec_ctrl_controls[] = {
+	SOC_SINGLE("ACODEC I2S Lane Select", AIU_ACODEC_CTRL,
+		   CTRL_I2S_OUT_LANE_SRC, 3, 0),
+};
+
+static int aiu_acodec_of_xlate_dai_name(struct snd_soc_component *component,
+					struct of_phandle_args *args,
+					const char **dai_name)
+{
+	return aiu_of_xlate_dai_name(component, args, dai_name, AIU_ACODEC);
+}
+
+static int aiu_acodec_ctrl_component_probe(struct snd_soc_component *component)
+{
+	/*
+	 * NOTE: Din Skew setting
+	 * According to the documentation, the following update adds one delay
+	 * to the din line. Without this, the output saturates. This happens
+	 * regardless of the link format (i2s or left_j) so it is not clear what
+	 * it actually does but it seems to be required
+	 */
+	snd_soc_component_update_bits(component, AIU_ACODEC_CTRL,
+				      CTRL_DIN_SKEW,
+				      FIELD_PREP(CTRL_DIN_SKEW, 2));
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver aiu_acodec_ctrl_component = {
+	.name			= "AIU Internal DAC Codec Control",
+	.probe			= aiu_acodec_ctrl_component_probe,
+	.controls		= aiu_acodec_ctrl_controls,
+	.num_controls		= ARRAY_SIZE(aiu_acodec_ctrl_controls),
+	.dapm_widgets		= aiu_acodec_ctrl_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(aiu_acodec_ctrl_widgets),
+	.dapm_routes		= aiu_acodec_ctrl_routes,
+	.num_dapm_routes	= ARRAY_SIZE(aiu_acodec_ctrl_routes),
+	.of_xlate_dai_name	= aiu_acodec_of_xlate_dai_name,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+int aiu_acodec_ctrl_register_component(struct device *dev)
+{
+	return aiu_add_component(dev, &aiu_acodec_ctrl_component,
+				 aiu_acodec_ctrl_dai_drv,
+				 ARRAY_SIZE(aiu_acodec_ctrl_dai_drv),
+				 "acodec");
+}
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index b765dfb70726..5c4845a23a34 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -345,6 +345,16 @@ static int aiu_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	/* Register the internal dac control component on gxl */
+	if (of_device_is_compatible(dev->of_node, "amlogic,aiu-gxl")) {
+		ret = aiu_acodec_ctrl_register_component(dev);
+		if (ret) {
+			dev_err(dev,
+			    "Failed to register acodec control component\n");
+			goto err;
+		}
+	}
+
 	return 0;
 err:
 	snd_soc_unregister_component(dev);
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 9242ab1ab64b..a65a576e3400 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -52,6 +52,7 @@ int aiu_add_component(struct device *dev,
 		      const char *debugfs_prefix);
 
 int aiu_hdmi_ctrl_register_component(struct device *dev);
+int aiu_acodec_ctrl_register_component(struct device *dev);
 
 int aiu_fifo_i2s_dai_probe(struct snd_soc_dai *dai);
 int aiu_fifo_spdif_dai_probe(struct snd_soc_dai *dai);
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

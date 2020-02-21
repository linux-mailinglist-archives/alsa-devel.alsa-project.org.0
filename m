Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61982167D72
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 13:25:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE0916C0;
	Fri, 21 Feb 2020 13:24:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE0916C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582287942;
	bh=00v9Y6WcE5pjIzl0QKBJoeQvMWkKCxB9s/pObZBeoCo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HTkH/55RqXTFQjzbwMIEyXx+VIP7Iq6hUtqdroXqKBstgHntSUahPFLgIH+jasYmX
	 HMOmuvQxZoauBsYfuiFPvQHex8JgGl2mEQyn5abtH7fIkR9OUXfFJHItcH78NwNd6p
	 bzW3dIXlaOHJrDha28zkYCNaKlYMnaWUldlZYHSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76862F8028A;
	Fri, 21 Feb 2020 13:22:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8152BF80279; Fri, 21 Feb 2020 13:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C258F80114
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 13:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C258F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lmm0a34R"
Received: by mail-wm1-x343.google.com with SMTP id s10so1562798wmh.3
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LVPhZaNvTs581yysADhM6N3tR7+bs9iMaoXQMk9ncsE=;
 b=Lmm0a34Rb50pN7fYjTQlJUHnEnMa18JZi6C8WJ9h/snDAznMlWfz7lzfSyl0cpla/i
 eXCYFgzPh75a6DWBizEB+T0eE+WnpSCShqRAReogKpFAFv6gu4aZcso4mbHVHXR/Q8Yj
 nUjN61lKyNB90PNbSa6YHz3hNk+wdBDo+svaw39b/xer3W6rwXJ6/Q1IeqZrOYV0YRIu
 kv8wlFzx3kN1Mf/EZOOSt+8QOF2uhUYDbvW7JMvkyTq9eQLUidnJBILdpKpiHDJQleLO
 U9UsOVSAHmYxfAnZVBC/ZGyab3kuYPSAH75embe4+oi0s9LFoWfARHUCFwiKKGdb2AhX
 l0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LVPhZaNvTs581yysADhM6N3tR7+bs9iMaoXQMk9ncsE=;
 b=ROBf5nux8ZCQXccocCsz6e0GVg2zHj2+tOs59eTLMZQp2p2Z1F7IN35ZYL6GvGaGng
 Ytutwr76TYYlBV91z2jB+039VpeuROdtI+eC34Au+W0fDKvLl21TjQZYlDblMvit6ZQK
 tKs8PvKJT7/osUXm/Kq50cSKwwsOOXCMzXrPjl22Y8TjttBPfOBQc9eyTkIJ1i2EKDpk
 qwwtczcYXMfzaoynPQkVXAwjb4O4mvaeHTMbU/MJQZsrEaxRxcD2zxrfzt5E83o8C2vI
 YnnjpaETtMM2/EPEbNXxjtcQGCEk8fuLwQlb72L4wELdPzm0t40bAmGL90SsAzRztxLQ
 5PGg==
X-Gm-Message-State: APjAAAUw/VpAU/Jn8HGPfP8dX7XHeeUVuIUv6PTPM0BVuDBPbjS1aDp1
 +E2r8RXShclgD8oVmfcCeyc6CQ==
X-Google-Smtp-Source: APXvYqxPIfIi/MritWTpiXJt/iZEruDeIBcXrSDmRZEGpH+dqmIMJIfFAKsROSi97MkETAtI5bDMVA==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr3497007wmm.179.1582287770796; 
 Fri, 21 Feb 2020 04:22:50 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p26sm3454653wmc.24.2020.02.21.04.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:22:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/3] ASoC: meson: g12a: add internal DAC glue driver
Date: Fri, 21 Feb 2020 13:22:41 +0100
Message-Id: <20200221122242.1500093-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221122242.1500093-1-jbrunet@baylibre.com>
References: <20200221122242.1500093-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Add support for the internal audio DAC glue found on the Amlogic g12a
and sm1 SoC families. This allows to connect the TDM outputs of the SoC
to the internal t9015 audio DAC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig         |   9 ++
 sound/soc/meson/Makefile        |   2 +
 sound/soc/meson/g12a-toacodec.c | 240 ++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)
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
index 000000000000..719bbe9966b1
--- /dev/null
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -0,0 +1,240 @@
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
+#define  CTRL0_DAT_SEL			GENMASK(15, 14)
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
+static int g12a_toacodec_get_mux(struct snd_soc_component *component)
+{
+	unsigned int val;
+
+	snd_soc_component_read(component, TOACODEC_CTRL0, &val);
+	return FIELD_GET(CTRL0_DAT_SEL, val);
+}
+
+static int g12a_toacodec_put_mux(struct snd_soc_component *component,
+				 unsigned int mux)
+{
+	snd_soc_component_update_bits(component, TOACODEC_CTRL0,
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
+	snd_soc_component_update_bits(component, TOACODEC_CTRL0,
+				      CTRL0_MCLK_SEL,
+				      FIELD_PREP(CTRL0_MCLK_SEL, mux));
+
+	return 0;
+}
+
+static MESON_CODEC_GLUE_ENUM_DECL(g12a_toacodec_mux_glue,
+				  g12a_toacodec_mux_texts,
+				  g12a_toacodec_get_mux,
+				  g12a_toacodec_put_mux);
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
2.24.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114B58E487
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 03:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D505C83A;
	Wed, 10 Aug 2022 03:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D505C83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660095222;
	bh=pcgxFJU3+zs2TUMJGAg5oUFc2tR+4OH+KKqEbbDG5w0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=advukR7LVOYCllZqptEQBHzXZDMpLgFkKir8JGs5bV32URfGxkqBvTsvpqGsIJCq/
	 7X5H0MdZEm+fVkj1KH+Sn06nZ4TvnyDk3rEFWwU4UDkxPBYUZe5MiO5bPHGJIk6Lfs
	 nvg4VYLQ1LOqvpLLYodaXJdlzB+O9x6GsBpxXMEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7136EF801F7;
	Wed, 10 Aug 2022 03:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D79B4F8016C; Wed, 10 Aug 2022 03:32:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dev.flatmax.com (unknown
 [IPv6:2406:3400:213:70c0:9df6:7e57:88ce:1bea])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26B6CF800E8
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 03:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B6CF800E8
Received: by dev.flatmax.com (Postfix, from userid 1000)
 id C88173846DF8; Wed, 10 Aug 2022 11:32:24 +1000 (AEST)
From: Matt Flax <flatmax@flatmax.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] ASoC: codecs: add support for the TI SRC4392 codec
Date: Wed, 10 Aug 2022 11:32:13 +1000
Message-Id: <20220810013213.1544645-1-flatmax@flatmax.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, Matt Flax <flatmax@flatmax.com>
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

The src4xxx keyword is used for	future capability to integrate
other codecs similar to the src4392 to the same	code base.

Signed-off-by: Matt Flax <flatmax@flatmax.com>
---

Notes:
    V3 changes :
    * converted header to C++ comments
    * added break to default switch cases
    * updated SRC vol to SRC volume, scanned for other name	issues
    * now using yaml for the dt binding documentation (separate patch)
    * Fixed	Kconfig	to select the _I2C module in menuconfig
    
    V2 changes :
    * Fixed indents in Kconfig
    * Comment header of source code is now one block
    * Documented the devicetree binding
    * sample rate converter MCLK src is non-user settable
    * hushed spurious dev_info output
    * src4xxx_remove was empty is removed.
    * Using switch in hw_params to select port reg. for clarity
    * Removed interrupt reg. settings - will re-intro. properly later
    * probe function is now EXPORT_SYMBOL_GPL

 sound/soc/codecs/Kconfig       |  13 +
 sound/soc/codecs/Makefile      |   4 +
 sound/soc/codecs/src4xxx-i2c.c |  47 +++
 sound/soc/codecs/src4xxx.c     | 513 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/src4xxx.h     | 113 ++++++++
 5 files changed, 690 insertions(+)
 create mode 100644 sound/soc/codecs/src4xxx-i2c.c
 create mode 100644 sound/soc/codecs/src4xxx.c
 create mode 100644 sound/soc/codecs/src4xxx.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d16b4efb88a7..fe445465f877 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -205,6 +205,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_SIMPLE_AMPLIFIER
 	imply SND_SOC_SIMPLE_MUX
 	imply SND_SOC_SPDIF
+	imply SND_SOC_SRC4XXX_I2C
 	imply SND_SOC_SSM2305
 	imply SND_SOC_SSM2518
 	imply SND_SOC_SSM2602_SPI
@@ -1471,6 +1472,18 @@ config SND_SOC_SIMPLE_MUX
 config SND_SOC_SPDIF
 	tristate "S/PDIF CODEC"
 
+config SND_SOC_SRC4XXX_I2C
+	tristate "Texas Instruments SRC4XXX DIR/DIT and SRC codecs"
+	depends on I2C
+	select SND_SOC_SRC4XXX
+	help
+	  Enable support for the TI SRC4XXX family of codecs. These include the
+	  scr4392 which has digital receivers, transmitters, and
+	  a sample rate converter, including numerous ports.
+
+config SND_SOC_SRC4XXX
+	tristate
+
 config SND_SOC_SSM2305
 	tristate "Analog Devices SSM2305 Class-D Amplifier"
 	help
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 92fd441d426a..a599b727c65b 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -231,6 +231,8 @@ snd-soc-sigmadsp-regmap-objs := sigmadsp-regmap.o
 snd-soc-si476x-objs := si476x.o
 snd-soc-spdif-tx-objs := spdif_transmitter.o
 snd-soc-spdif-rx-objs := spdif_receiver.o
+snd-soc-src4xxx-objs := src4xxx.o
+snd-soc-src4xxx-i2c-objs := src4xxx-i2c.o
 snd-soc-ssm2305-objs := ssm2305.o
 snd-soc-ssm2518-objs := ssm2518.o
 snd-soc-ssm2602-objs := ssm2602.o
@@ -579,6 +581,8 @@ obj-$(CONFIG_SND_SOC_SIGMADSP_I2C)	+= snd-soc-sigmadsp-i2c.o
 obj-$(CONFIG_SND_SOC_SIGMADSP_REGMAP)	+= snd-soc-sigmadsp-regmap.o
 obj-$(CONFIG_SND_SOC_SI476X)	+= snd-soc-si476x.o
 obj-$(CONFIG_SND_SOC_SPDIF)	+= snd-soc-spdif-rx.o snd-soc-spdif-tx.o
+obj-$(CONFIG_SND_SOC_SRC4XXX)	+= snd-soc-src4xxx.o
+obj-$(CONFIG_SND_SOC_SRC4XXX_I2C)	+= snd-soc-src4xxx-i2c.o
 obj-$(CONFIG_SND_SOC_SSM2305)	+= snd-soc-ssm2305.o
 obj-$(CONFIG_SND_SOC_SSM2518)	+= snd-soc-ssm2518.o
 obj-$(CONFIG_SND_SOC_SSM2602)	+= snd-soc-ssm2602.o
diff --git a/sound/soc/codecs/src4xxx-i2c.c b/sound/soc/codecs/src4xxx-i2c.c
new file mode 100644
index 000000000000..43daa9dc8ab5
--- /dev/null
+++ b/sound/soc/codecs/src4xxx-i2c.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Driver for SRC4XXX codecs
+//
+// Copyright 2021-2022 Deqx Pty Ltd
+// Author: Matt Flax <flatmax@flatmax.com>
+
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include "src4xxx.h"
+
+static int src4xxx_i2c_probe(struct i2c_client *i2c,
+			const struct i2c_device_id *id)
+{
+	return src4xxx_probe(&i2c->dev,
+		devm_regmap_init_i2c(i2c, &src4xxx_regmap_config), NULL);
+}
+
+static const struct i2c_device_id src4xxx_i2c_ids[] = {
+	{ "src4392", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, src4xxx_i2c_ids);
+
+static const struct of_device_id src4xxx_of_match[] = {
+	{ .compatible = "ti,src4392", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, src4xxx_of_match);
+
+
+static struct i2c_driver src4xxx_i2c_driver = {
+	.driver = {
+		.name = "src4xxx",
+		.of_match_table = of_match_ptr(src4xxx_of_match),
+	},
+	.probe = src4xxx_i2c_probe,
+	.id_table = src4xxx_i2c_ids,
+};
+module_i2c_driver(src4xxx_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC SRC4392 CODEC I2C driver");
+MODULE_AUTHOR("Matt Flax <flatmax@flatmax.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
new file mode 100644
index 000000000000..a8f143057b41
--- /dev/null
+++ b/sound/soc/codecs/src4xxx.c
@@ -0,0 +1,513 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// TI SRC4xxx Audio Codec driver
+//
+// Copyright 2021-2022 Deqx Pty Ltd
+// Author: Matt Flax <flatmax@flatmax.com>
+
+#include <linux/module.h>
+
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#include "src4xxx.h"
+
+struct src4xxx {
+	struct regmap *regmap;
+	bool master[2];
+	int mclk_hz;
+	struct device *dev;
+};
+
+enum {SRC4XXX_PORTA, SRC4XXX_PORTB};
+
+/* SRC attenuation */
+static const DECLARE_TLV_DB_SCALE(src_tlv, -12750, 50, 0);
+
+static const struct snd_kcontrol_new src4xxx_controls[] = {
+	SOC_DOUBLE_R_TLV("SRC Volume",
+		SRC4XXX_SCR_CTL_30, SRC4XXX_SCR_CTL_31, 0, 255, 1, src_tlv),
+};
+
+/* I2S port control */
+static const char * const port_out_src_text[] = {
+	"loopback", "other_port", "DIR", "SRC"
+};
+static SOC_ENUM_SINGLE_DECL(porta_out_src_enum, SRC4XXX_PORTA_CTL_03, 4,
+	port_out_src_text);
+static SOC_ENUM_SINGLE_DECL(portb_out_src_enum, SRC4XXX_PORTB_CTL_05, 4,
+	port_out_src_text);
+static const struct snd_kcontrol_new porta_out_control =
+	SOC_DAPM_ENUM("Port A source select", porta_out_src_enum);
+static const struct snd_kcontrol_new portb_out_control =
+	SOC_DAPM_ENUM("Port B source select", portb_out_src_enum);
+
+/* Digital audio transmitter control */
+static const char * const dit_mux_text[] = {"Port A", "Port B", "DIR", "SRC"};
+static SOC_ENUM_SINGLE_DECL(dit_mux_enum, SRC4XXX_TX_CTL_07, 3, dit_mux_text);
+static const struct snd_kcontrol_new dit_mux_control =
+	SOC_DAPM_ENUM("DIT source", dit_mux_enum);
+
+/* SRC control */
+static const char * const src_in_text[] = {"Port A", "Port B", "DIR"};
+static SOC_ENUM_SINGLE_DECL(src_in_enum, SRC4XXX_SCR_CTL_2D, 0, src_in_text);
+static const struct snd_kcontrol_new src_in_control =
+	SOC_DAPM_ENUM("SRC source select", src_in_enum);
+
+/* DIR control */
+static const char * const dir_in_text[] = {"Ch 1", "Ch 2", "Ch 3", "Ch 4"};
+static SOC_ENUM_SINGLE_DECL(dir_in_enum, SRC4XXX_RCV_CTL_0D, 0, dir_in_text);
+static const struct snd_kcontrol_new dir_in_control =
+	SOC_DAPM_ENUM("Digital Input", dir_in_enum);
+
+static const struct snd_soc_dapm_widget src4xxx_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("loopback_A"),
+	SND_SOC_DAPM_INPUT("other_port_A"),
+	SND_SOC_DAPM_INPUT("DIR_A"),
+	SND_SOC_DAPM_INPUT("SRC_A"),
+	SND_SOC_DAPM_MUX("Port A source",
+		SND_SOC_NOPM, 0, 0, &porta_out_control),
+
+	SND_SOC_DAPM_INPUT("loopback_B"),
+	SND_SOC_DAPM_INPUT("other_port_B"),
+	SND_SOC_DAPM_INPUT("DIR_B"),
+	SND_SOC_DAPM_INPUT("SRC_B"),
+	SND_SOC_DAPM_MUX("Port B source",
+		SND_SOC_NOPM, 0, 0, &portb_out_control),
+
+	SND_SOC_DAPM_INPUT("Port_A"),
+	SND_SOC_DAPM_INPUT("Port_B"),
+	SND_SOC_DAPM_INPUT("DIR_"),
+
+	/* Digital audio receivers and transmitters */
+	SND_SOC_DAPM_OUTPUT("DIR_OUT"),
+	SND_SOC_DAPM_OUTPUT("SRC_OUT"),
+	SND_SOC_DAPM_MUX("DIT Out Src", SRC4XXX_PWR_RST_01,
+		SRC4XXX_ENABLE_DIT_SHIFT, 1, &dit_mux_control),
+
+	/* Audio Interface */
+	SND_SOC_DAPM_AIF_IN("AIF_A_RX", "Playback A", 0,
+		SRC4XXX_PWR_RST_01, SRC4XXX_ENABLE_PORT_A_SHIFT, 1),
+	SND_SOC_DAPM_AIF_OUT("AIF_A_TX", "Capture A", 0,
+		SRC4XXX_PWR_RST_01, SRC4XXX_ENABLE_PORT_A_SHIFT, 1),
+	SND_SOC_DAPM_AIF_IN("AIF_B_RX", "Playback B", 0,
+		SRC4XXX_PWR_RST_01, SRC4XXX_ENABLE_PORT_B_SHIFT, 1),
+	SND_SOC_DAPM_AIF_OUT("AIF_B_TX", "Capture B", 0,
+		SRC4XXX_PWR_RST_01, SRC4XXX_ENABLE_PORT_B_SHIFT, 1),
+
+	SND_SOC_DAPM_MUX("SRC source", SND_SOC_NOPM, 0, 0, &src_in_control),
+
+	SND_SOC_DAPM_INPUT("MCLK"),
+	SND_SOC_DAPM_INPUT("RXMCLKI"),
+	SND_SOC_DAPM_INPUT("RXMCLKO"),
+
+	SND_SOC_DAPM_INPUT("RX1"),
+	SND_SOC_DAPM_INPUT("RX2"),
+	SND_SOC_DAPM_INPUT("RX3"),
+	SND_SOC_DAPM_INPUT("RX4"),
+	SND_SOC_DAPM_MUX("Digital Input", SRC4XXX_PWR_RST_01,
+		SRC4XXX_ENABLE_DIR_SHIFT, 1, &dir_in_control),
+};
+
+static const struct snd_soc_dapm_route src4xxx_audio_routes[] = {
+	/* I2S Input to Output Routing */
+	{"Port A source", "loopback", "loopback_A"},
+	{"Port A source", "other_port", "other_port_A"},
+	{"Port A source", "DIR", "DIR_A"},
+	{"Port A source", "SRC", "SRC_A"},
+	{"Port B source", "loopback", "loopback_B"},
+	{"Port B source", "other_port", "other_port_B"},
+	{"Port B source", "DIR", "DIR_B"},
+	{"Port B source", "SRC", "SRC_B"},
+	/* DIT muxing */
+	{"DIT Out Src", "Port A", "Capture A"},
+	{"DIT Out Src", "Port B", "Capture B"},
+	{"DIT Out Src", "DIR", "DIR_OUT"},
+	{"DIT Out Src", "SRC", "SRC_OUT"},
+
+	/* SRC input selection */
+	{"SRC source", "Port A", "Port_A"},
+	{"SRC source", "Port B", "Port_B"},
+	{"SRC source", "DIR", "DIR_"},
+	/* SRC mclk selection */
+	{"SRC mclk source", "Master (MCLK)", "MCLK"},
+	{"SRC mclk source", "Master (RXCLKI)", "RXMCLKI"},
+	{"SRC mclk source", "Recovered receiver clk", "RXMCLKO"},
+	/* DIR input selection */
+	{"Digital Input", "Ch 1", "RX1"},
+	{"Digital Input", "Ch 2", "RX2"},
+	{"Digital Input", "Ch 3", "RX3"},
+	{"Digital Input", "Ch 4", "RX4"},
+};
+
+
+static const struct snd_soc_component_driver src4xxx_driver = {
+	.controls = src4xxx_controls,
+	.num_controls = ARRAY_SIZE(src4xxx_controls),
+
+	.dapm_widgets = src4xxx_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(src4xxx_dapm_widgets),
+	.dapm_routes = src4xxx_audio_routes,
+	.num_dapm_routes = ARRAY_SIZE(src4xxx_audio_routes),
+};
+
+static int src4xxx_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct src4xxx *src4xxx = snd_soc_component_get_drvdata(component);
+	unsigned int ctrl;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		ctrl = SRC4XXX_BUS_MASTER;
+		src4xxx->master[dai->id] = true;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		ctrl = 0;
+		src4xxx->master[dai->id] = false;
+		break;
+	default:
+		return -EINVAL;
+		break;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		ctrl |= SRC4XXX_BUS_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		ctrl |= SRC4XXX_BUS_LEFT_J;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		ctrl |= SRC4XXX_BUS_RIGHT_J_24;
+		break;
+	default:
+		return -EINVAL;
+		break;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	default:
+		return -EINVAL;
+		break;
+	}
+
+	regmap_update_bits(src4xxx->regmap, SRC4XXX_BUS_FMT(dai->id),
+		SRC4XXX_BUS_FMT_MS_MASK, ctrl);
+
+	return 0;
+}
+
+static int src4xxx_set_mclk_hz(struct snd_soc_dai *codec_dai,
+		int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct src4xxx *src4xxx = snd_soc_component_get_drvdata(component);
+
+	dev_info(component->dev, "changing mclk rate from %d to %d Hz\n",
+		src4xxx->mclk_hz, freq);
+	src4xxx->mclk_hz = freq;
+
+	return 0;
+}
+
+static int src4xxx_hw_params(struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params,
+			struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct src4xxx *src4xxx = snd_soc_component_get_drvdata(component);
+	unsigned int mclk_div;
+	int val, pj, jd, d;
+	int reg;
+	int ret;
+
+	switch (dai->id) {
+	case SRC4XXX_PORTB:
+		reg = SRC4XXX_PORTB_CTL_06;
+		break;
+	default:
+		reg = SRC4XXX_PORTA_CTL_04;
+		break;
+	}
+
+	if (src4xxx->master[dai->id]) {
+		mclk_div = src4xxx->mclk_hz/params_rate(params);
+		if (src4xxx->mclk_hz != mclk_div*params_rate(params)) {
+			dev_err(component->dev,
+				"mclk %d / rate %d has a remainder.\n",
+				src4xxx->mclk_hz, params_rate(params));
+			return -EINVAL;
+		}
+
+		val = ((int)mclk_div - 128) / 128;
+		if ((val < 0) | (val > 3)) {
+			dev_err(component->dev,
+				"div register setting %d is out of range\n",
+				val);
+			dev_err(component->dev,
+				"unsupported sample rate %d Hz for the master clock of %d Hz\n",
+				params_rate(params), src4xxx->mclk_hz);
+			return -EINVAL;
+		}
+
+		/* set the TX DIV */
+		ret = regmap_update_bits(src4xxx->regmap,
+			SRC4XXX_TX_CTL_07, SRC4XXX_TX_MCLK_DIV_MASK,
+			val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
+		if (ret) {
+			dev_err(component->dev,
+				"Couldn't set the TX's div register to %d << %d = 0x%x\n",
+				val, SRC4XXX_TX_MCLK_DIV_SHIFT,
+				val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
+			return ret;
+		}
+
+		/* set the PLL for the digital receiver */
+		switch (src4xxx->mclk_hz) {
+		case 24576000:
+			pj = 0x22;
+			jd = 0x00;
+			d = 0x00;
+			break;
+		case 22579200:
+			pj = 0x22;
+			jd = 0x1b;
+			d = 0xa3;
+			break;
+		default:
+			/* don't error out here,
+			 * other parts of the chip are still functional
+			 */
+			dev_info(component->dev,
+				"Couldn't set the RCV PLL as this master clock rate is unknown\n");
+			break;
+		}
+		ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
+		if (ret < 0)
+			dev_err(component->dev,
+				"Failed to update PLL register 0x%x\n",
+				SRC4XXX_RCV_PLL_0F);
+		ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
+		if (ret < 0)
+			dev_err(component->dev,
+				"Failed to update PLL register 0x%x\n",
+				SRC4XXX_RCV_PLL_10);
+		ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
+		if (ret < 0)
+			dev_err(component->dev,
+				"Failed to update PLL register 0x%x\n",
+				SRC4XXX_RCV_PLL_11);
+
+		ret = regmap_update_bits(src4xxx->regmap,
+			SRC4XXX_TX_CTL_07, SRC4XXX_TX_MCLK_DIV_MASK,
+			val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"Couldn't set the TX's div register to %d << %d = 0x%x\n",
+				val, SRC4XXX_TX_MCLK_DIV_SHIFT,
+				val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
+			return ret;
+		}
+
+		return regmap_update_bits(src4xxx->regmap, reg,
+					SRC4XXX_MCLK_DIV_MASK, val);
+	} else {
+		dev_info(dai->dev, "not setting up MCLK as not master\n");
+	}
+
+	return 0;
+};
+
+static const struct snd_soc_dai_ops src4xxx_dai_ops = {
+	.hw_params	= src4xxx_hw_params,
+	.set_sysclk	= src4xxx_set_mclk_hz,
+	.set_fmt	= src4xxx_set_dai_fmt,
+};
+
+#define SRC4XXX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	SNDRV_PCM_FMTBIT_S32_LE)
+#define SRC4XXX_RATES (SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000|\
+				SNDRV_PCM_RATE_88200|\
+				SNDRV_PCM_RATE_96000|\
+				SNDRV_PCM_RATE_176400|\
+				SNDRV_PCM_RATE_192000)
+
+static struct snd_soc_dai_driver src4xxx_dai_driver[] = {
+	{
+		.id = SRC4XXX_PORTA,
+		.name = "src4xxx-portA",
+		.playback = {
+			.stream_name = "Playback A",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SRC4XXX_RATES,
+			.formats = SRC4XXX_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture A",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SRC4XXX_RATES,
+			.formats = SRC4XXX_FORMATS,
+		},
+		.ops = &src4xxx_dai_ops,
+	},
+	{
+		.id = SRC4XXX_PORTB,
+		.name = "src4xxx-portB",
+		.playback = {
+			.stream_name = "Playback B",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SRC4XXX_RATES,
+			.formats = SRC4XXX_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture B",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SRC4XXX_RATES,
+			.formats = SRC4XXX_FORMATS,
+		},
+		.ops = &src4xxx_dai_ops,
+	},
+};
+
+static const struct reg_default src4xxx_reg_defaults[] = {
+	{ SRC4XXX_PWR_RST_01,		0x00 }, /* all powered down intially */
+	{ SRC4XXX_PORTA_CTL_03,		0x00 },
+	{ SRC4XXX_PORTA_CTL_04,		0x00 },
+	{ SRC4XXX_PORTB_CTL_05,		0x00 },
+	{ SRC4XXX_PORTB_CTL_06,		0x00 },
+	{ SRC4XXX_TX_CTL_07,		0x00 },
+	{ SRC4XXX_TX_CTL_08,		0x00 },
+	{ SRC4XXX_TX_CTL_09,		0x00 },
+	{ SRC4XXX_SRC_DIT_IRQ_MSK_0B,	0x00 },
+	{ SRC4XXX_SRC_DIT_IRQ_MODE_0C,	0x00 },
+	{ SRC4XXX_RCV_CTL_0D,		0x00 },
+	{ SRC4XXX_RCV_CTL_0E,		0x00 },
+	{ SRC4XXX_RCV_PLL_0F,		0x00 }, /* not spec. in the datasheet */
+	{ SRC4XXX_RCV_PLL_10,		0xff }, /* not spec. in the datasheet */
+	{ SRC4XXX_RCV_PLL_11,		0xff }, /* not spec. in the datasheet */
+	{ SRC4XXX_RVC_IRQ_MSK_16,	0x00 },
+	{ SRC4XXX_RVC_IRQ_MSK_17,	0x00 },
+	{ SRC4XXX_RVC_IRQ_MODE_18,	0x00 },
+	{ SRC4XXX_RVC_IRQ_MODE_19,	0x00 },
+	{ SRC4XXX_RVC_IRQ_MODE_1A,	0x00 },
+	{ SRC4XXX_GPIO_1_1B,		0x00 },
+	{ SRC4XXX_GPIO_2_1C,		0x00 },
+	{ SRC4XXX_GPIO_3_1D,		0x00 },
+	{ SRC4XXX_GPIO_4_1E,		0x00 },
+	{ SRC4XXX_SCR_CTL_2D,		0x00 },
+	{ SRC4XXX_SCR_CTL_2E,		0x00 },
+	{ SRC4XXX_SCR_CTL_2F,		0x00 },
+	{ SRC4XXX_SCR_CTL_30,		0x00 },
+	{ SRC4XXX_SCR_CTL_31,		0x00 },
+};
+
+int src4xxx_probe(struct device *dev, struct regmap *regmap,
+			void (*switch_mode)(struct device *dev))
+{
+	struct src4xxx *src4xxx;
+	int ret;
+
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	src4xxx = devm_kzalloc(dev, sizeof(*src4xxx), GFP_KERNEL);
+	if (!src4xxx)
+		return -ENOMEM;
+
+	src4xxx->regmap = regmap;
+	src4xxx->dev = dev;
+	src4xxx->mclk_hz = 0; /* mclk has not been configured yet */
+	dev_set_drvdata(dev, src4xxx);
+
+	ret = regmap_write(regmap, SRC4XXX_PWR_RST_01, SRC4XXX_RESET);
+	if (ret < 0)
+		dev_err(dev, "Failed to issue reset: %d\n", ret);
+	usleep_range(1, 500); /* sleep for more then 500 ns */
+	ret = regmap_write(regmap, SRC4XXX_PWR_RST_01, SRC4XXX_POWER_DOWN);
+	if (ret < 0)
+		dev_err(dev, "Failed to decommission reset: %d\n", ret);
+	usleep_range(500, 1000); /* sleep for 500 us or more */
+
+	ret = regmap_update_bits(src4xxx->regmap, SRC4XXX_PWR_RST_01,
+		SRC4XXX_POWER_ENABLE, SRC4XXX_POWER_ENABLE);
+	if (ret < 0)
+		dev_err(dev, "Failed to port A and B : %d\n", ret);
+
+	/* set receiver to use master clock (rcv mclk is most likely jittery) */
+	ret = regmap_update_bits(src4xxx->regmap, SRC4XXX_RCV_CTL_0D,
+		SRC4XXX_RXCLK_MCLK,	SRC4XXX_RXCLK_MCLK);
+	if (ret < 0)
+		dev_err(dev,
+			"Failed to enable mclk as the PLL1 DIR reference : %d\n", ret);
+
+	/* default to leaving the PLL2 running on loss of lock, divide by 8 */
+	ret = regmap_update_bits(src4xxx->regmap, SRC4XXX_RCV_CTL_0E,
+		SRC4XXX_PLL2_DIV_8 | SRC4XXX_REC_MCLK_EN | SRC4XXX_PLL2_LOL,
+		SRC4XXX_PLL2_DIV_8 | SRC4XXX_REC_MCLK_EN | SRC4XXX_PLL2_LOL);
+	if (ret < 0)
+		dev_err(dev, "Failed to enable mclk rec and div : %d\n", ret);
+
+	ret = devm_snd_soc_register_component(dev, &src4xxx_driver,
+			src4xxx_dai_driver, ARRAY_SIZE(src4xxx_dai_driver));
+	if (ret == 0)
+		dev_info(dev, "src4392 probe ok %d\n", ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(src4xxx_probe);
+
+static bool src4xxx_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SRC4XXX_RES_00:
+	case SRC4XXX_GLOBAL_ITR_STS_02:
+	case SRC4XXX_SRC_DIT_STS_0A:
+	case SRC4XXX_NON_AUDIO_D_12:
+	case SRC4XXX_RVC_STS_13:
+	case SRC4XXX_RVC_STS_14:
+	case SRC4XXX_RVC_STS_15:
+	case SRC4XXX_SUB_CODE_1F:
+	case SRC4XXX_SUB_CODE_20:
+	case SRC4XXX_SUB_CODE_21:
+	case SRC4XXX_SUB_CODE_22:
+	case SRC4XXX_SUB_CODE_23:
+	case SRC4XXX_SUB_CODE_24:
+	case SRC4XXX_SUB_CODE_25:
+	case SRC4XXX_SUB_CODE_26:
+	case SRC4XXX_SUB_CODE_27:
+	case SRC4XXX_SUB_CODE_28:
+	case SRC4XXX_PC_PREAMBLE_HI_29:
+	case SRC4XXX_PC_PREAMBLE_LO_2A:
+	case SRC4XXX_PD_PREAMBLE_HI_2B:
+	case SRC4XXX_PC_PREAMBLE_LO_2C:
+	case SRC4XXX_IO_RATIO_32:
+	case SRC4XXX_IO_RATIO_33:
+		return true;
+	}
+
+	if (reg > SRC4XXX_IO_RATIO_33 && reg < SRC4XXX_PAGE_SEL_7F)
+		return true;
+
+	return false;
+}
+
+const struct regmap_config src4xxx_regmap_config = {
+	.val_bits = 8,
+	.reg_bits = 8,
+	.max_register = SRC4XXX_IO_RATIO_33,
+
+	.reg_defaults = src4xxx_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(src4xxx_reg_defaults),
+	.volatile_reg = src4xxx_volatile_register,
+	.cache_type = REGCACHE_RBTREE,
+};
+EXPORT_SYMBOL_GPL(src4xxx_regmap_config);
+
+MODULE_DESCRIPTION("ASoC SRC4XXX CODEC driver");
+MODULE_AUTHOR("Matt Flax <flatmax@flatmax.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/src4xxx.h b/sound/soc/codecs/src4xxx.h
new file mode 100644
index 000000000000..5bf778fb9945
--- /dev/null
+++ b/sound/soc/codecs/src4xxx.h
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// src4xxx.h  --  SRC4XXX ALSA SoC audio driver
+//
+// Copyright 2021-2022 Deqx Pty Ltd
+// Author: Matt R Flax <flatmax@flatmax.com>
+
+#ifndef __SRC4XXX_H__
+#define __SRC4XXX_H__
+
+#define SRC4XXX_RES_00 0x00
+#define SRC4XXX_PWR_RST_01 0x01
+#define SRC4XXX_RESET 0x80
+#define SRC4XXX_POWER_DOWN 0x00
+#define SRC4XXX_POWER_ENABLE 0x20
+#define SRC4XXX_ENABLE_SRC 0x1
+#define SRC4XXX_ENABLE_SRC_SHIFT 0
+#define SRC4XXX_ENABLE_DIR 0x2
+#define SRC4XXX_ENABLE_DIR_SHIFT 1
+#define SRC4XXX_ENABLE_DIT 0x4
+#define SRC4XXX_ENABLE_DIT_SHIFT 2
+#define SRC4XXX_ENABLE_PORT_B 0x8
+#define SRC4XXX_ENABLE_PORT_B_SHIFT 3
+#define SRC4XXX_ENABLE_PORT_A 0x10
+#define SRC4XXX_ENABLE_PORT_A_SHIFT 4
+
+#define SRC4XXX_PORTA_CTL_03 0x03
+#define SRC4XXX_BUS_MASTER 0x8
+#define SRC4XXX_BUS_LEFT_J 0x0
+#define SRC4XXX_BUS_I2S 0x1
+#define SRC4XXX_BUS_RIGHT_J_16 0x4
+#define SRC4XXX_BUS_RIGHT_J_18 0x5
+#define SRC4XXX_BUS_RIGHT_J_20 0x6
+#define SRC4XXX_BUS_RIGHT_J_24 0x7
+#define SRC4XXX_BUS_FMT_MS_MASK 0xf
+
+#define SRC4XXX_PORTA_CTL_04 0x04
+#define SRC4XXX_MCLK_DIV_MASK 0x3
+
+#define SRC4XXX_BUS_FMT(id) (SRC4XXX_PORTA_CTL_03+2*id)
+#define SRC4XXX_BUS_CLK(id) (SRC4XXX_PORTA_CTL_04+2*id)
+
+#define SRC4XXX_PORTB_CTL_05 0x05
+#define SRC4XXX_PORTB_CTL_06 0x06
+
+#define SRC4XXX_TX_CTL_07 0x07
+#define SRC4XXX_TX_MCLK_DIV_MASK 0x60
+#define SRC4XXX_TX_MCLK_DIV_SHIFT 5
+
+#define SRC4XXX_TX_CTL_08 0x08
+#define SRC4XXX_TX_CTL_09 0x09
+#define SRC4XXX_SRC_DIT_IRQ_MSK_0B 0x0B
+#define SRC4XXX_SRC_BTI_EN 0x01
+#define SRC4XXX_SRC_TSLIP_EN 0x02
+#define SRC4XXX_SRC_DIT_IRQ_MODE_0C 0x0C
+#define SRC4XXX_RCV_CTL_0D 0x0D
+#define SRC4XXX_RXCLK_RXCKI 0x0
+#define SRC4XXX_RXCLK_MCLK 0x8
+#define SRC4XXX_RCV_CTL_0E 0x0E
+#define SRC4XXX_REC_MCLK_EN 0x1
+#define SRC4XXX_PLL2_DIV_0 (0x0<<1)
+#define SRC4XXX_PLL2_DIV_2 (0x1<<1)
+#define SRC4XXX_PLL2_DIV_4 (0x2<<1)
+#define SRC4XXX_PLL2_DIV_8 (0x3<<1)
+#define SRC4XXX_PLL2_LOL 0x8
+#define SRC4XXX_RCV_PLL_0F 0x0F
+#define SRC4XXX_RCV_PLL_10 0x10
+#define SRC4XXX_RCV_PLL_11 0x11
+#define SRC4XXX_RVC_IRQ_MSK_16 0x16
+#define SRC4XXX_RVC_IRQ_MSK_17 0x17
+#define SRC4XXX_RVC_IRQ_MODE_18 0x18
+#define SRC4XXX_RVC_IRQ_MODE_19 0x19
+#define SRC4XXX_RVC_IRQ_MODE_1A 0x1A
+#define SRC4XXX_GPIO_1_1B 0x1B
+#define SRC4XXX_GPIO_2_1C 0x1C
+#define SRC4XXX_GPIO_3_1D 0x1D
+#define SRC4XXX_GPIO_4_1E 0x1E
+#define SRC4XXX_SCR_CTL_2D 0x2D
+#define SRC4XXX_SCR_CTL_2E 0x2E
+#define SRC4XXX_SCR_CTL_2F 0x2F
+#define SRC4XXX_SCR_CTL_30 0x30
+#define SRC4XXX_SCR_CTL_31 0x31
+#define SRC4XXX_PAGE_SEL_7F 0x7F
+
+// read only registers
+#define SRC4XXX_GLOBAL_ITR_STS_02 0x02
+#define SRC4XXX_SRC_DIT_STS_0A 0x0A
+#define SRC4XXX_NON_AUDIO_D_12 0x12
+#define SRC4XXX_RVC_STS_13 0x13
+#define SRC4XXX_RVC_STS_14 0x14
+#define SRC4XXX_RVC_STS_15 0x15
+#define SRC4XXX_SUB_CODE_1F 0x1F
+#define SRC4XXX_SUB_CODE_20 0x20
+#define SRC4XXX_SUB_CODE_21 0x21
+#define SRC4XXX_SUB_CODE_22 0x22
+#define SRC4XXX_SUB_CODE_23 0x23
+#define SRC4XXX_SUB_CODE_24 0x24
+#define SRC4XXX_SUB_CODE_25 0x25
+#define SRC4XXX_SUB_CODE_26 0x26
+#define SRC4XXX_SUB_CODE_27 0x27
+#define SRC4XXX_SUB_CODE_28 0x28
+#define SRC4XXX_PC_PREAMBLE_HI_29 0x29
+#define SRC4XXX_PC_PREAMBLE_LO_2A 0x2A
+#define SRC4XXX_PD_PREAMBLE_HI_2B 0x2B
+#define SRC4XXX_PC_PREAMBLE_LO_2C 0x2C
+#define SRC4XXX_IO_RATIO_32 0x32
+#define SRC4XXX_IO_RATIO_33 0x33
+
+int src4xxx_probe(struct device *dev, struct regmap *regmap,
+		void (*switch_mode)(struct device *dev));
+extern const struct regmap_config src4xxx_regmap_config;
+
+#endif /* __SRC4XXX_H__ */
-- 
2.34.1


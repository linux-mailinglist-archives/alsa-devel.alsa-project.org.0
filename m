Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA827A7E2
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB0E17D4;
	Tue, 30 Jul 2019 14:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB0E17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564488808;
	bh=+rsDYnXuVyZbIlutATpf4LvoY/ZFgFfih4+dqmGyTVY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ca6Yj+wCgH8jFfgjfmrErG5LiJ2jdR1V74UgZ58LbVn0JGOuv6EXTKIZJGjnnLCYn
	 hG+dQKyhk/YuqWLWOsTAVp55P2aCO1K3upvEr2IKe8vQdLVVlub/GRdFI7ktBDSsOu
	 hhYdyKTrkaHZLE8aa4ghfnuGeQtH8BVgo9e/qVQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57DAFF80534;
	Tue, 30 Jul 2019 14:10:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F11E1F804CF; Tue, 30 Jul 2019 14:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8205F804CA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8205F804CA
Received: from [167.98.27.226] (helo=ct-lt-1124.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsQwq-0003E4-W7; Tue, 30 Jul 2019 13:09:45 +0100
From: Thomas Preston <thomas.preston@codethink.co.uk>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Annaliese McDermond <nh6z@nh6z.net>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 30 Jul 2019 13:09:36 +0100
Message-Id: <20190730120937.16271-3-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Cc: Patrick Glaser <pglaser@tesla.com>, Rob Duncan <rduncan@tesla.com>,
 Nate Case <ncase@tesla.com>
Subject: [alsa-devel] [PATCH v2 2/3] ASoC: Add codec driver for ST TDA7802
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

Add an I2C based codec driver for ST TDA7802 amplifier. The amplifier
supports 4 audio channels but can support up to 16 with multiple
devices.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Rob Duncan <rduncan@tesla.com>
Cc: Nate Case <ncase@tesla.com>
---
Changes since v1:
- Use ALSA kcontrol interface to expose device controls to userland
	- Gain
	- Channel diagnostic mode
	- Impedance efficiency optimiser. I decided against setting this
	  as a DT property since it seems like something that can be
	  changed on the fly.
- Add regmap default values
	- Channel unmute by default is added in a downstream patch.
	- I'm not sure if I should keep this since they're all zero,
	  although there are other drivers will all-zero reg_defaults.
- I believe the "//" style is used for SPDX headers in normal C source files.
  https://lwn.net/Articles/739183/
- Drop the "enable" sysfs device attribute.
- Don't set TDM format using magic numbers.
- Set sample rate using hw_params.
- Remove unecessary defines.
- Use DAPM to handle AMP_ON.
- Cosmetic fixups

 sound/soc/codecs/Kconfig   |   6 +
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/tda7802.c | 509 +++++++++++++++++++++++++++++++++++++
 3 files changed, 517 insertions(+)
 create mode 100644 sound/soc/codecs/tda7802.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 9f89a5346299..7e3117eab735 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -182,6 +182,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_TAS5720 if I2C
 	select SND_SOC_TAS6424 if I2C
 	select SND_SOC_TDA7419 if I2C
+	select SND_SOC_TDA7802 if I2C
 	select SND_SOC_TFA9879 if I2C
 	select SND_SOC_TLV320AIC23_I2C if I2C
 	select SND_SOC_TLV320AIC23_SPI if SPI_MASTER
@@ -1121,6 +1122,11 @@ config SND_SOC_TDA7419
 	depends on I2C
 	select REGMAP_I2C
 
+config SND_SOC_TDA7802
+	tristate "ST TDA7802 audio processor"
+	depends on I2C
+	select REGMAP_I2C
+
 config SND_SOC_TFA9879
 	tristate "NXP Semiconductors TFA9879 amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 5b4bb8cf4325..31dec8930e98 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -194,6 +194,7 @@ snd-soc-tas571x-objs := tas571x.o
 snd-soc-tas5720-objs := tas5720.o
 snd-soc-tas6424-objs := tas6424.o
 snd-soc-tda7419-objs := tda7419.o
+snd-soc-tda7802-objs := tda7802.o
 snd-soc-tfa9879-objs := tfa9879.o
 snd-soc-tlv320aic23-objs := tlv320aic23.o
 snd-soc-tlv320aic23-i2c-objs := tlv320aic23-i2c.o
@@ -474,6 +475,7 @@ obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
 obj-$(CONFIG_SND_SOC_TAS6424)	+= snd-soc-tas6424.o
 obj-$(CONFIG_SND_SOC_TDA7419)	+= snd-soc-tda7419.o
+obj-$(CONFIG_SND_SOC_TDA7802)	+= snd-soc-tda7802.o
 obj-$(CONFIG_SND_SOC_TFA9879)	+= snd-soc-tfa9879.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23)	+= snd-soc-tlv320aic23.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23_I2C)	+= snd-soc-tlv320aic23-i2c.o
diff --git a/sound/soc/codecs/tda7802.c b/sound/soc/codecs/tda7802.c
new file mode 100644
index 000000000000..0f82a88bc1a4
--- /dev/null
+++ b/sound/soc/codecs/tda7802.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * tda7802.c  --  codec driver for ST TDA7802
+ *
+ * Copyright (C) 2016-2019 Tesla Motors, Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/string.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+
+#define ENABLE_DELAY_MS			10
+
+#define TDA7802_IB0			0x00
+#define TDA7802_IB1			0x01
+#define TDA7802_IB2			0x02
+#define TDA7802_IB3			0x03
+#define TDA7802_IB4			0x04
+#define TDA7802_IB5			0x05
+
+#define TDA7802_DB0			0x10
+#define TDA7802_DB5			0x15
+
+#define IB2_DIGITAL_MUTE_DISABLED	(1 << 2)
+
+#define IB3_SAMPLE_RATE_SHIFT		6
+#define IB3_SAMPLE_RATE_MASK		(3 << IB3_SAMPLE_RATE_SHIFT)
+#define IB3_SAMPLE_RATE_44_KHZ		(0 << IB3_SAMPLE_RATE_SHIFT)
+#define IB3_SAMPLE_RATE_48_KHZ		(1 << IB3_SAMPLE_RATE_SHIFT)
+#define IB3_SAMPLE_RATE_96_KHZ		(2 << IB3_SAMPLE_RATE_SHIFT)
+#define IB3_SAMPLE_RATE_192_KHZ		(3 << IB3_SAMPLE_RATE_SHIFT)
+#define IB3_FORMAT_SHIFT		3
+#define IB3_FORMAT_MASK			(7 << IB3_FORMAT_SHIFT)
+#define IB3_FORMAT_I2S			(0 << IB3_FORMAT_SHIFT)
+#define IB3_FORMAT_TDM4			(1 << IB3_FORMAT_SHIFT)
+#define IB3_FORMAT_TDM8_DEV1		(2 << IB3_FORMAT_SHIFT)
+#define IB3_FORMAT_TDM8_DEV2		(3 << IB3_FORMAT_SHIFT)
+#define IB3_FORMAT_TDM16_DEV1		(4 << IB3_FORMAT_SHIFT)
+#define IB3_FORMAT_TDM16_DEV2		(5 << IB3_FORMAT_SHIFT)
+#define IB3_FORMAT_TDM16_DEV3		(6 << IB3_FORMAT_SHIFT)
+#define IB3_FORMAT_TDM16_DEV4		(7 << IB3_FORMAT_SHIFT)
+
+enum tda7802_type {
+	tda7802_base,
+};
+
+struct tda7802_priv {
+	struct i2c_client *i2c;
+	struct regmap *regmap;
+	struct regulator *enable_reg;
+};
+
+static const struct reg_default tda7802_reg[] = {
+	{ TDA7802_IB0, 0x0 },
+	{ TDA7802_IB1, 0x0 },
+	{ TDA7802_IB2, 0x0 },
+	{ TDA7802_IB3, 0x0 },
+	{ TDA7802_IB4, 0x0 },
+	{ TDA7802_IB5, 0x0 },
+};
+
+static bool tda7802_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TDA7802_IB0 ... TDA7802_IB5:
+	case TDA7802_DB0 ... TDA7802_DB5:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tda7802_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TDA7802_DB0 ... TDA7802_DB5:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tda7802_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TDA7802_IB0 ... TDA7802_IB5:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tda7802_regmap_config = {
+	.val_bits = 8,
+	.reg_bits = 8,
+	.max_register = TDA7802_DB5,
+	.use_single_read = 1,
+	.use_single_write = 1,
+
+	.readable_reg = tda7802_readable_reg,
+	.volatile_reg = tda7802_volatile_reg,
+	.writeable_reg = tda7802_writeable_reg,
+
+	.reg_defaults = tda7802_reg,
+	.num_reg_defaults = ARRAY_SIZE(tda7802_reg),
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static int tda7802_digital_mute(struct snd_soc_dai *dai, int mute)
+{
+	const u8 mute_disabled = mute ? 0 : IB2_DIGITAL_MUTE_DISABLED;
+	struct device *dev = dai->dev;
+	int err;
+
+	dev_dbg(dev, "%s mute=%d\n", __func__, mute);
+
+	err = snd_soc_component_update_bits(dai->component, TDA7802_IB2,
+			IB2_DIGITAL_MUTE_DISABLED, mute_disabled);
+	if (err < 0)
+		dev_err(dev, "Cannot mute amp %d\n", err);
+
+	return err;
+}
+
+static int tda7802_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+		unsigned int rx_mask, int slots, int slot_width)
+{
+	struct device *dev = dai->dev;
+	u8 tdm_format;
+	int ret;
+
+	dev_dbg(dai->dev, "%s tx %x, rx %x, slots %d, slot_width %d\n",
+			__func__, tx_mask, rx_mask, slots, slot_width);
+
+	switch (slots) {
+	case 4:
+		tdm_format = IB3_FORMAT_TDM4;
+		break;
+	case 8:
+		switch (tx_mask) {
+		case 0x000f:
+			tdm_format = IB3_FORMAT_TDM8_DEV1;
+			break;
+		case 0x00f0:
+			tdm_format = IB3_FORMAT_TDM8_DEV2;
+			break;
+		default:
+			dev_err(dev,
+				"Failed to set tdm fmt, slots %d, tx_mask %x\n",
+				slots, tx_mask);
+			return -ENOTSUPP;
+		}
+		break;
+	case 16:
+		switch (tx_mask) {
+		case 0x000f:
+			tdm_format = IB3_FORMAT_TDM16_DEV1;
+			break;
+		case 0x00f0:
+			tdm_format = IB3_FORMAT_TDM16_DEV2;
+			break;
+		case 0x0f00:
+			tdm_format = IB3_FORMAT_TDM16_DEV3;
+			break;
+		case 0xf000:
+			tdm_format = IB3_FORMAT_TDM16_DEV4;
+			break;
+		default:
+			dev_err(dev,
+				"Failed to set tdm fmt, slots %d, tx_mask %x\n",
+				slots, tx_mask);
+			return -ENOTSUPP;
+		}
+		break;
+	default:
+		dev_err(dev, "Failed to set %d slots, supported: 4, 8, 16\n",
+				slots);
+		return -ENOTSUPP;
+	}
+
+	ret = snd_soc_component_update_bits(dai->component, TDA7802_IB3,
+			IB3_FORMAT_MASK, tdm_format);
+	if (ret < 0) {
+		dev_err(dev, "Failed to write IB3 config %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tda7802_hw_params(struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *params,
+		struct snd_soc_dai *dai)
+{
+	int err;
+	u8 val;
+
+	dev_dbg(dai->dev, "%s rate %d\n", __func__, params_rate(params));
+
+	switch (params_rate(params)) {
+	case 44100:
+		val = IB3_SAMPLE_RATE_44_KHZ;
+		break;
+	case 48000:
+		val = IB3_SAMPLE_RATE_48_KHZ;
+		break;
+	case 96000:
+		val = IB3_SAMPLE_RATE_96_KHZ;
+		break;
+	case 192000:
+		val = IB3_SAMPLE_RATE_192_KHZ;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	err = snd_soc_component_update_bits(dai->component, TDA7802_IB3,
+			IB3_SAMPLE_RATE_MASK, val);
+	if (err < 0)
+		dev_err(dai->dev, "Could not set hw_params, %d\n", err);
+
+	return err;
+}
+
+static const struct snd_soc_dai_ops tda7802_dai_ops = {
+	.digital_mute = tda7802_digital_mute,
+	.hw_params = tda7802_hw_params,
+	.set_tdm_slot = tda7802_set_tdm_slot,
+};
+
+static struct snd_soc_dai_driver tda7802_dai_driver = {
+	.name = "tda7802",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 4,
+		.channels_max = 4,
+		.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	},
+	.ops = &tda7802_dai_ops,
+};
+
+static int tda7802_set_bias_level(struct snd_soc_component *component,
+		enum snd_soc_bias_level level)
+{
+	const struct tda7802_priv *tda7802 =
+		snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm_context =
+			snd_soc_component_get_dapm(component);
+	const enum snd_soc_bias_level oldlevel =
+		snd_soc_dapm_get_bias_level(dapm_context);
+	int err = 0;
+
+	dev_dbg(component->dev, "%s level %d\n", __func__, level);
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		break;
+	case SND_SOC_BIAS_PREPARE:
+		break;
+	case SND_SOC_BIAS_STANDBY:
+		err = regulator_enable(tda7802->enable_reg);
+		if (err < 0) {
+			dev_err(component->dev, "Could not enable.\n");
+			return err;
+		}
+		dev_dbg(component->dev, "Regulator enabled\n");
+		msleep(ENABLE_DELAY_MS);
+
+		if (oldlevel == SND_SOC_BIAS_OFF) {
+			dev_dbg(component->dev, "Syncing regcache\n");
+			err = regcache_sync(component->regmap);
+			if (err < 0)
+				dev_err(component->dev,
+					"Could not sync regcache, %d\n", err);
+		}
+		break;
+	case SND_SOC_BIAS_OFF:
+		regcache_mark_dirty(component->regmap);
+		err = regulator_disable(tda7802->enable_reg);
+		if (err < 0)
+			dev_err(component->dev, "Could not disable.\n");
+		break;
+	}
+
+	return err;
+}
+
+static const char * const amp_mode_str[] = {
+	"High Efficiency",
+	"Standard Class AB",
+};
+
+static SOC_ENUM_SINGLE_DECL(ch1_amp_mode, TDA7802_IB0, 0, amp_mode_str);
+static SOC_ENUM_SINGLE_DECL(ch2_amp_mode, TDA7802_IB0, 1, amp_mode_str);
+static SOC_ENUM_SINGLE_DECL(ch3_amp_mode, TDA7802_IB0, 2, amp_mode_str);
+static SOC_ENUM_SINGLE_DECL(ch4_amp_mode, TDA7802_IB0, 3, amp_mode_str);
+
+static const char * const zopt_str[] = {
+	"2ohm",
+	"4ohm",
+};
+
+static SOC_ENUM_SINGLE_DECL(zopt_ch24, TDA7802_IB1, 7, zopt_str);
+static SOC_ENUM_SINGLE_DECL(zopt_ch13, TDA7802_IB2, 0, zopt_str);
+
+static const char * const diag_timing_str[] = {
+	"default",
+	"x2",
+	"x4",
+	"x8",
+};
+
+static SOC_ENUM_SINGLE_DECL(diag_timing, TDA7802_IB1, 5, diag_timing_str);
+
+static const char * const mute_time_str[] = {
+	"1.45ms",
+	"5.8ms",
+	"11.6ms",
+	"23.2ms",
+	"46.4ms",
+	"92.8ms",
+	"185.6ms",
+	"371.2ms",
+};
+
+static SOC_ENUM_SINGLE_DECL(mute_time, TDA7802_IB2, 5, mute_time_str);
+
+static const char * const automute_threshold_str[] = {
+	"5.3V",
+	"7.3V",
+};
+
+static SOC_ENUM_SINGLE_DECL(automute_threshold, TDA7802_IB2, 1,
+		automute_threshold_str);
+
+static const char * const ac_diag_threshold_str[] = {
+	"High",
+	"Low",
+};
+
+static SOC_ENUM_SINGLE_DECL(ac_diag_threshold, TDA7802_IB3, 4,
+		ac_diag_threshold_str);
+
+static const char * const ch_diag_mode_str[] = {
+	"Speaker",
+	"Boosted",
+};
+
+static SOC_ENUM_SINGLE_DECL(diag_mode_ch13, TDA7802_IB4, 2, ch_diag_mode_str);
+static SOC_ENUM_SINGLE_DECL(diag_mode_ch24, TDA7802_IB4, 1, ch_diag_mode_str);
+
+static const char * const temp_warn_str[] = {
+	"TW1",
+	"TW2",
+	"TW3",
+	"TW4",
+	"None",
+};
+
+static SOC_ENUM_SINGLE_DECL(temp_warn, TDA7802_IB5, 5, temp_warn_str);
+
+static const char * const clip_detect_str[] = {
+	"2%",
+	"5%",
+	"10%",
+	"None",
+};
+
+static SOC_ENUM_SINGLE_DECL(clip_detect_ch13, TDA7802_IB5, 3, clip_detect_str);
+static SOC_ENUM_SINGLE_DECL(clip_detect_ch24, TDA7802_IB5, 1, clip_detect_str);
+
+static const struct snd_kcontrol_new tda7802_snd_controls[] = {
+	SOC_SINGLE("Channel 4 Tristate", TDA7802_IB0, 7, 1, 0),
+	SOC_SINGLE("Channel 3 Tristate", TDA7802_IB0, 6, 1, 0),
+	SOC_SINGLE("Channel 2 Tristate", TDA7802_IB0, 5, 1, 0),
+	SOC_SINGLE("Channel 1 Tristate", TDA7802_IB0, 4, 1, 0),
+	SOC_ENUM("Channel 4 Amplifier Mode", ch4_amp_mode),
+	SOC_ENUM("Channel 3 Amplifier Mode", ch3_amp_mode),
+	SOC_ENUM("Channel 2 Amplifier Mode", ch2_amp_mode),
+	SOC_ENUM("Channel 1 Amplifier Mode", ch1_amp_mode),
+
+	/* Impedance (Z) efficiency optimiser */
+	SOC_ENUM("Z efficiency opt channels 2 & 4", zopt_ch24),
+	SOC_ENUM("Z efficiency opt channels 1 & 3", zopt_ch13),
+
+	SOC_ENUM("Long diag config timing", diag_timing),
+	SOC_SINGLE_RANGE("Gain channels 1 & 3", TDA7802_IB1, 3, 0, 3, 0),
+	SOC_SINGLE_RANGE("Gain channels 2 & 4", TDA7802_IB1, 1, 0, 3, 0),
+	SOC_SINGLE("Digital gain boost +6db", TDA7802_IB1, 0, 1, 0),
+
+	/* Mute settings */
+	SOC_ENUM("Mute time", mute_time),
+	SOC_SINGLE("Unmute channels 1 & 3", TDA7802_IB2, 4, 1, 0),
+	SOC_SINGLE("Unmute channels 2 & 4", TDA7802_IB2, 3, 1, 0),
+	SOC_ENUM("Automute threshold", automute_threshold),
+
+	SOC_SINGLE("High pass filter enable", TDA7802_IB3, 0, 1, 0),
+
+	/* Interactive diagnostics */
+	SOC_SINGLE("Noise gating func enable", TDA7802_IB4, 7, 1, 1),
+	SOC_SINGLE("CDdiag: short fault", TDA7802_IB4, 6, 1, 1),
+	SOC_SINGLE("CDdiag: offset", TDA7802_IB4, 5, 1, 1),
+	SOC_ENUM("CDdiag: temperature warning", temp_warn),
+	SOC_ENUM("AC diag current threshold", ac_diag_threshold),
+	SOC_SINGLE("AC diag enable", TDA7802_IB4, 3, 1, 0),
+	SOC_ENUM("Diag mode channels 1 & 3", diag_mode_ch13),
+	SOC_ENUM("Diag mode channels 2 & 4", diag_mode_ch24),
+	SOC_SINGLE("Diag mode enable", TDA7802_IB4, 0, 1, 0),
+
+	SOC_ENUM("Clipping detect channels 1 & 3", clip_detect_ch13),
+	SOC_ENUM("Clipping detect channels 2 & 4", clip_detect_ch24),
+};
+
+static const struct snd_soc_dapm_widget tda7802_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("AIFIN", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC("DAC", NULL, TDA7802_IB5, 0, 0),
+	SND_SOC_DAPM_OUTPUT("SPK"),
+};
+
+static const struct snd_soc_dapm_route tda7802_dapm_routes[] = {
+	{ "AIFIN", NULL, "Playback" },
+	{ "DAC", NULL, "AIFIN" },
+	{ "SPK", NULL, "DAC" },
+};
+
+static const struct snd_soc_component_driver tda7802_component_driver = {
+	.set_bias_level = tda7802_set_bias_level,
+	.idle_bias_on = 1,
+	.suspend_bias_off = 1,
+	.controls = tda7802_snd_controls,
+	.num_controls = ARRAY_SIZE(tda7802_snd_controls),
+	.dapm_widgets = tda7802_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tda7802_dapm_widgets),
+	.dapm_routes = tda7802_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(tda7802_dapm_routes),
+};
+
+static int tda7802_i2c_probe(struct i2c_client *i2c,
+			     const struct i2c_device_id *id)
+{
+	struct device *dev = &i2c->dev;
+	struct tda7802_priv *tda7802;
+	int err;
+
+	dev_dbg(dev, "%s addr=0x%02hx, id %p\n", __func__, i2c->addr, id);
+
+	tda7802 = devm_kmalloc(dev, sizeof(*tda7802), GFP_KERNEL);
+	if (!tda7802)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, tda7802);
+	tda7802->i2c = i2c;
+
+	tda7802->enable_reg = devm_regulator_get(dev, "enable");
+	if (IS_ERR(tda7802->enable_reg)) {
+		dev_err(dev, "Failed to get enable regulator\n");
+		return PTR_ERR(tda7802->enable_reg);
+	}
+
+	tda7802->regmap = devm_regmap_init_i2c(tda7802->i2c,
+			&tda7802_regmap_config);
+	if (IS_ERR(tda7802->regmap))
+		return PTR_ERR(tda7802->regmap);
+
+	err = devm_snd_soc_register_component(dev, &tda7802_component_driver,
+			&tda7802_dai_driver, 1);
+	if (err < 0)
+		dev_err(dev, "Failed to register codec: %d\n", err);
+	return err;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id tda7802_of_match[] = {
+	{ .compatible = "st,tda7802" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tda7802_of_match);
+#endif
+
+static const struct i2c_device_id tda7802_i2c_id[] = {
+	{ "tda7802", tda7802_base },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, tda7802_i2c_id);
+
+static struct i2c_driver tda7802_i2c_driver = {
+	.driver = {
+		.name  = "tda7802-codec",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(tda7802_of_match),
+	},
+	.probe = tda7802_i2c_probe,
+	.id_table = tda7802_i2c_id,
+};
+module_i2c_driver(tda7802_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC ST TDA7802 driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Rob Duncan <rduncan@tesla.com>");
+MODULE_AUTHOR("Thomas Preston <thomas.preston@codethink.co.uk>");
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

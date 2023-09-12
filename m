Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521779CE0E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 740F5EAD;
	Tue, 12 Sep 2023 12:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 740F5EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694513964;
	bh=h4Nd2bFTWyjtvrvjPkAsHk7FdKk1iZ9BLMCw/xMgMbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CVhJ8tc+AcIK+PzsX2515wir16V6JrxiVYQuPCOlMdQ0+y+i24x3c5jhj9OrvLHMi
	 F3fM8YSucXh2Fxgqv/rDX5avd2U/INZRgq6rUP10l6rP2eE79a+IRPqRB1M1XXlzgb
	 zQuy9V9u7UPjdxij61jPmk8mJrYjic7ZZeb/gwNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBD7CF805B4; Tue, 12 Sep 2023 12:15:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD3B7F80579;
	Tue, 12 Sep 2023 12:15:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5622FF80579; Tue, 12 Sep 2023 12:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2188EF80612
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 12:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2188EF80612
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YZZ+Q744
Received: by mail.gandi.net (Postfix) with ESMTPA id 8B7ADE0006;
	Tue, 12 Sep 2023 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694513724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wXKQ6LU7JDGISLRmmZufUawd0NnyNS4MGbodLlakGEc=;
	b=YZZ+Q744mxnbfSKhbhbqQsWa3QOUJFY3gbsW8iKH4VPxNU9Hl/jA+eU2B8uf8sXA5Uj3wY
	NiFKwE6V9J/6E5LKZGfNAGuGXbLa+I0wEm3HyaKD12nEhCjUog9kdCtq60j5tRLyC+mYh2
	FT1+DSDEmnTSo+4lTj5HGVdCt4yFdDkXm+22bsV0lDzEjia1RqCDwRKVjKIiuWbMoAxejB
	5MzuhHVmrVfAbkNtCl0/O2ohya9K16rnN3UdHn1dp8JjANHgYMkt0oRbSm5oWLTgbQ17Do
	X4dXjkPHAJx7IDplrjSol0Mrf1Zivz25iaEQWfBqx1vH0yhYnMYL/3TE47ivvA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 30/31] ASoC: codecs: Add support for the framer codec
Date: Tue, 12 Sep 2023 12:15:21 +0200
Message-ID: <20230912101521.225945-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912081527.208499-1-herve.codina@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: UBD6XTFVBSQQES4HC4C3EDQUV36HYTSD
X-Message-ID-Hash: UBD6XTFVBSQQES4HC4C3EDQUV36HYTSD
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBD6XTFVBSQQES4HC4C3EDQUV36HYTSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The framer codec interacts with a framer.
It allows to use some of the framer timeslots as audio channels to
transport audio data over the framer E1/T1/J1 lines.
It also reports line carrier detection events through the ALSA jack
detection feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/soc/codecs/Kconfig        |  15 ++
 sound/soc/codecs/Makefile       |   2 +
 sound/soc/codecs/framer-codec.c | 413 ++++++++++++++++++++++++++++++++
 3 files changed, 430 insertions(+)
 create mode 100644 sound/soc/codecs/framer-codec.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f1e1dbc509f6..abb89796fd45 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -112,6 +112,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ES8328_I2C
 	imply SND_SOC_ES7134
 	imply SND_SOC_ES7241
+	imply SND_SOC_FRAMER
 	imply SND_SOC_GTM601
 	imply SND_SOC_HDAC_HDMI
 	imply SND_SOC_HDAC_HDA
@@ -1071,6 +1072,20 @@ config SND_SOC_ES8328_SPI
 	depends on SPI_MASTER
 	select SND_SOC_ES8328
 
+config SND_SOC_FRAMER
+	tristate "Framer codec"
+	depends on GENERIC_FRAMER
+	help
+	  Enable support for the framer codec.
+	  The framer codec uses the generic framer infrastructure to transport
+	  some audio data over an analog E1/T1/J1 line.
+	  This codec allows to use some of the time slots available on the TDM
+	  bus on which the framer is connected to transport the audio data.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-soc-framer.
+
+
 config SND_SOC_GTM601
 	tristate 'GTM601 UMTS modem audio codec'
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index a87e56938ce5..c6bb88cd687a 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -119,6 +119,7 @@ snd-soc-es8326-objs := es8326.o
 snd-soc-es8328-objs := es8328.o
 snd-soc-es8328-i2c-objs := es8328-i2c.o
 snd-soc-es8328-spi-objs := es8328-spi.o
+snd-soc-framer-objs := framer-codec.o
 snd-soc-gtm601-objs := gtm601.o
 snd-soc-hdac-hdmi-objs := hdac_hdmi.o
 snd-soc-hdac-hda-objs := hdac_hda.o
@@ -505,6 +506,7 @@ obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
 obj-$(CONFIG_SND_SOC_ES8328)	+= snd-soc-es8328.o
 obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
 obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
+obj-$(CONFIG_SND_SOC_FRAMER)	+= snd-soc-framer.o
 obj-$(CONFIG_SND_SOC_GTM601)    += snd-soc-gtm601.o
 obj-$(CONFIG_SND_SOC_HDAC_HDMI) += snd-soc-hdac-hdmi.o
 obj-$(CONFIG_SND_SOC_HDAC_HDA) += snd-soc-hdac-hda.o
diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
new file mode 100644
index 000000000000..e5fcde9ee308
--- /dev/null
+++ b/sound/soc/codecs/framer-codec.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Framer ALSA SoC driver
+//
+// Copyright 2023 CS GROUP France
+//
+// Author: Herve Codina <herve.codina@bootlin.com>
+
+#include <linux/clk.h>
+#include <linux/framer/framer.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#define FRAMER_NB_CHANNEL	32
+#define FRAMER_JACK_MASK (SND_JACK_LINEIN | SND_JACK_LINEOUT)
+
+struct framer_codec {
+	struct framer *framer;
+	struct device *dev;
+	struct snd_soc_jack jack;
+	struct notifier_block nb;
+	struct work_struct carrier_work;
+	int max_chan_playback;
+	int max_chan_capture;
+};
+
+static int framer_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				   unsigned int rx_mask, int slots, int width)
+{
+	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
+
+	switch (width) {
+	case 0:
+		/* Not set -> default 8 */
+	case 8:
+		break;
+	default:
+		dev_err(dai->dev, "tdm slot width %d not supported\n", width);
+		return -EINVAL;
+	}
+
+	framer->max_chan_playback = hweight32(tx_mask);
+	if (framer->max_chan_playback > FRAMER_NB_CHANNEL) {
+		dev_err(dai->dev, "too many tx slots defined (mask = 0x%x) supported max %d\n",
+			tx_mask, FRAMER_NB_CHANNEL);
+		return -EINVAL;
+	}
+
+	framer->max_chan_capture = hweight32(rx_mask);
+	if (framer->max_chan_capture > FRAMER_NB_CHANNEL) {
+		dev_err(dai->dev, "too many rx slots defined (mask = 0x%x) supported max %d\n",
+			rx_mask, FRAMER_NB_CHANNEL);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * The constraints for format/channel is to match with the number of 8bit
+ * time-slots available.
+ */
+static int framer_dai_hw_rule_channels_by_format(struct snd_soc_dai *dai,
+						 struct snd_pcm_hw_params *params,
+						 unsigned int nb_ts)
+{
+	struct snd_interval *c = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	snd_pcm_format_t format = params_format(params);
+	struct snd_interval ch = {0};
+	int width;
+
+	width = snd_pcm_format_physical_width(format);
+	if (width == 8 || width == 16 || width == 32 || width == 64) {
+		ch.max = nb_ts * 8 / width;
+	} else {
+		dev_err(dai->dev, "format physical width %d not supported\n", width);
+		return -EINVAL;
+	}
+
+	ch.min = ch.max ? 1 : 0;
+
+	return snd_interval_refine(c, &ch);
+}
+
+static int framer_dai_hw_rule_playback_channels_by_format(struct snd_pcm_hw_params *params,
+							  struct snd_pcm_hw_rule *rule)
+{
+	struct snd_soc_dai *dai = rule->private;
+	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
+
+	return framer_dai_hw_rule_channels_by_format(dai, params, framer->max_chan_playback);
+}
+
+static int framer_dai_hw_rule_capture_channels_by_format(struct snd_pcm_hw_params *params,
+							 struct snd_pcm_hw_rule *rule)
+{
+	struct snd_soc_dai *dai = rule->private;
+	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
+
+	return framer_dai_hw_rule_channels_by_format(dai, params, framer->max_chan_capture);
+}
+
+static int framer_dai_hw_rule_format_by_channels(struct snd_soc_dai *dai,
+						 struct snd_pcm_hw_params *params,
+						 unsigned int nb_ts)
+{
+	struct snd_mask *f_old = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	unsigned int channels = params_channels(params);
+	unsigned int slot_width;
+	snd_pcm_format_t format;
+	struct snd_mask f_new;
+
+	if (!channels || channels > nb_ts) {
+		dev_err(dai->dev, "channels %u not supported\n", nb_ts);
+		return -EINVAL;
+	}
+
+	slot_width = (nb_ts / channels) * 8;
+
+	snd_mask_none(&f_new);
+	pcm_for_each_format(format) {
+		if (snd_mask_test_format(f_old, format)) {
+			if (snd_pcm_format_physical_width(format) <= slot_width)
+				snd_mask_set_format(&f_new, format);
+		}
+	}
+
+	return snd_mask_refine(f_old, &f_new);
+}
+
+static int framer_dai_hw_rule_playback_format_by_channels(struct snd_pcm_hw_params *params,
+							  struct snd_pcm_hw_rule *rule)
+{
+	struct snd_soc_dai *dai = rule->private;
+	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
+
+	return framer_dai_hw_rule_format_by_channels(dai, params, framer->max_chan_playback);
+}
+
+static int framer_dai_hw_rule_capture_format_by_channels(struct snd_pcm_hw_params *params,
+							 struct snd_pcm_hw_rule *rule)
+{
+	struct snd_soc_dai *dai = rule->private;
+	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
+
+	return framer_dai_hw_rule_format_by_channels(dai, params, framer->max_chan_capture);
+}
+
+static u64 framer_formats(u8 nb_ts)
+{
+	unsigned int format_width;
+	unsigned int chan_width;
+	snd_pcm_format_t format;
+	u64 formats_mask;
+
+	if (!nb_ts)
+		return 0;
+
+	formats_mask = 0;
+	chan_width = nb_ts * 8;
+	pcm_for_each_format(format) {
+		/* Support physical width multiple of 8bit */
+		format_width = snd_pcm_format_physical_width(format);
+		if (format_width == 0 || format_width % 8)
+			continue;
+
+		/*
+		 * And support physical width that can fit N times in the
+		 * channel
+		 */
+		if (format_width > chan_width || chan_width % format_width)
+			continue;
+
+		formats_mask |= pcm_format_to_bits(format);
+	}
+	return formats_mask;
+}
+
+static int framer_dai_startup(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
+	snd_pcm_hw_rule_func_t hw_rule_channels_by_format;
+	snd_pcm_hw_rule_func_t hw_rule_format_by_channels;
+	unsigned int frame_bits;
+	u64 format;
+	int ret;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		format = framer_formats(framer->max_chan_capture);
+		hw_rule_channels_by_format = framer_dai_hw_rule_capture_channels_by_format;
+		hw_rule_format_by_channels = framer_dai_hw_rule_capture_format_by_channels;
+		frame_bits = framer->max_chan_capture * 8;
+	} else {
+		format = framer_formats(framer->max_chan_playback);
+		hw_rule_channels_by_format = framer_dai_hw_rule_playback_channels_by_format;
+		hw_rule_format_by_channels = framer_dai_hw_rule_playback_format_by_channels;
+		frame_bits = framer->max_chan_playback * 8;
+	}
+
+	ret = snd_pcm_hw_constraint_mask64(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_FORMAT, format);
+	if (ret) {
+		dev_err(dai->dev, "Failed to add format constraint (%d)\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_rule_add(substream->runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				  hw_rule_channels_by_format, dai,
+				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+	if (ret) {
+		dev_err(dai->dev, "Failed to add channels rule (%d)\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_rule_add(substream->runtime, 0,  SNDRV_PCM_HW_PARAM_FORMAT,
+				  hw_rule_format_by_channels, dai,
+				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+	if (ret) {
+		dev_err(dai->dev, "Failed to add format rule (%d)\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_single(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_FRAME_BITS,
+					   frame_bits);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to add frame_bits constraint (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static u64 framer_dai_formats[] = {
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
+};
+
+static const struct snd_soc_dai_ops framer_dai_ops = {
+	.startup	= framer_dai_startup,
+	.set_tdm_slot	= framer_dai_set_tdm_slot,
+	.auto_selectable_formats     = framer_dai_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(framer_dai_formats),
+};
+
+static struct snd_soc_dai_driver framer_dai_driver = {
+	.name = "framer",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 1,
+		.channels_max = FRAMER_NB_CHANNEL,
+		.rates = SNDRV_PCM_RATE_8000,
+		.formats = U64_MAX, /* Will be refined on DAI .startup() */
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 1,
+		.channels_max = FRAMER_NB_CHANNEL,
+		.rates = SNDRV_PCM_RATE_8000,
+		.formats = U64_MAX, /* Will be refined on DAI .startup() */
+	},
+	.ops = &framer_dai_ops,
+};
+
+static void framer_carrier_work(struct work_struct *work)
+{
+	struct framer_codec *framer = container_of(work, struct framer_codec, carrier_work);
+	struct framer_status framer_status;
+	int jack_status;
+	int ret;
+
+	ret = framer_get_status(framer->framer, &framer_status);
+	if (ret) {
+		dev_err(framer->dev, "get framer status failed (%d)\n", ret);
+		return;
+	}
+
+	jack_status = framer_status.link_is_on ? FRAMER_JACK_MASK : 0;
+	snd_soc_jack_report(&framer->jack, jack_status, FRAMER_JACK_MASK);
+}
+
+static int framer_carrier_notifier(struct notifier_block *nb, unsigned long action,
+				   void *data)
+{
+	struct framer_codec *framer = container_of(nb, struct framer_codec, nb);
+
+	switch (action) {
+	case FRAMER_EVENT_STATUS:
+		queue_work(system_power_efficient_wq, &framer->carrier_work);
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int framer_component_probe(struct snd_soc_component *component)
+{
+	struct framer_codec *framer = snd_soc_component_get_drvdata(component);
+	struct framer_status status;
+	char *name;
+	int ret;
+
+	INIT_WORK(&framer->carrier_work, framer_carrier_work);
+
+	name = "carrier";
+	if (component->name_prefix) {
+		name = kasprintf(GFP_KERNEL, "%s carrier", component->name_prefix);
+		if (!name)
+			return -ENOMEM;
+	}
+
+	ret = snd_soc_card_jack_new(component->card, name, FRAMER_JACK_MASK, &framer->jack);
+	if (component->name_prefix)
+		kfree(name); /* A copy is done by snd_soc_card_jack_new */
+	if (ret) {
+		dev_err(component->dev, "Cannot create jack\n");
+		return ret;
+	}
+
+	ret = framer_init(framer->framer);
+	if (ret) {
+		dev_err(component->dev, "framer init failed (%d)\n", ret);
+		return ret;
+	}
+
+	ret = framer_power_on(framer->framer);
+	if (ret) {
+		dev_err(component->dev, "framer power-on failed (%d)\n", ret);
+		goto framer_exit;
+	}
+
+	/* Be sure that get_status is supported */
+	ret = framer_get_status(framer->framer, &status);
+	if (ret) {
+		dev_err(component->dev, "get framer status failed (%d)\n", ret);
+		goto framer_power_off;
+	}
+
+	framer->nb.notifier_call = framer_carrier_notifier;
+	ret = framer_notifier_register(framer->framer, &framer->nb);
+	if (ret) {
+		dev_err(component->dev, "Cannot register event notifier\n");
+		goto framer_power_off;
+	}
+
+	/* Queue work to set the initial value */
+	queue_work(system_power_efficient_wq, &framer->carrier_work);
+
+	return 0;
+
+framer_power_off:
+	framer_power_off(framer->framer);
+framer_exit:
+	framer_exit(framer->framer);
+	return ret;
+}
+
+static void framer_component_remove(struct snd_soc_component *component)
+{
+	struct framer_codec *framer = snd_soc_component_get_drvdata(component);
+
+	framer_notifier_unregister(framer->framer, &framer->nb);
+	cancel_work_sync(&framer->carrier_work);
+	framer_power_off(framer->framer);
+	framer_exit(framer->framer);
+}
+
+static const struct snd_soc_component_driver framer_component_driver = {
+	.probe		= framer_component_probe,
+	.remove		= framer_component_remove,
+	.endianness	= 1,
+};
+
+static int framer_codec_probe(struct platform_device *pdev)
+{
+	struct framer_codec *framer;
+
+	framer = devm_kzalloc(&pdev->dev, sizeof(*framer), GFP_KERNEL);
+	if (!framer)
+		return -ENOMEM;
+
+	framer->dev = &pdev->dev;
+
+	/* Get framer from parents node */
+	framer->framer = devm_framer_get(&pdev->dev, NULL);
+	if (IS_ERR(framer->framer))
+		return dev_err_probe(&pdev->dev, PTR_ERR(framer->framer), "get framer failed\n");
+
+	platform_set_drvdata(pdev, framer);
+
+	return devm_snd_soc_register_component(&pdev->dev, &framer_component_driver,
+					       &framer_dai_driver, 1);
+}
+
+static struct platform_driver framer_codec_driver = {
+	.driver = {
+		.name = "framer-codec",
+	},
+	.probe = framer_codec_probe,
+};
+module_platform_driver(framer_codec_driver);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("FRAMER ALSA SoC driver");
+MODULE_LICENSE("GPL");
-- 
2.41.0


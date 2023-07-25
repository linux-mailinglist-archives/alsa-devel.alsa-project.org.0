Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEDB760F37
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C341526;
	Tue, 25 Jul 2023 11:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C341526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690277502;
	bh=VzJr3focE3k5UqDj8Pq00FifQmNd7xPKXi2M1BecEm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nI7bCYdq5DVVvCMNWRMB7fF1vN77d4F/EtB0Egv/bTby2Xhxe+lfr8z7CEvDTYJCa
	 U2/ZlJEtRNdN7aoaaSPLIZz1jTcXtSZ3bNef1KI4kaD1YFk9FG3TnvxKe8HYUBUOT/
	 hpK67kMzGGjB7ROz6Z6pRBkM82u6maxF/LddwA+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B716CF80640; Tue, 25 Jul 2023 11:26:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05698F8063A;
	Tue, 25 Jul 2023 11:26:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DADBEF80673; Tue, 25 Jul 2023 11:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44425F80640
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44425F80640
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fCLiUYSC
Received: by mail.gandi.net (Postfix) with ESMTPA id A030640002;
	Tue, 25 Jul 2023 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690277160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7Bj1UB3LPRPXqk/qZ/IcEb6nTP/00Iq1F26oZlAG3g=;
	b=fCLiUYSCnhteF1VPXm7YqBOGFQWjrJSHZ1efeE0l9zcj523pMnPDFur1MqWZ2PRv9yKMtq
	9kgg4xzbm2viGhFmovDujr4QV4QXt3Cw3zmlYWTRGAAuQJjVSGs7MupXSR8+OjQ2J0ITmE
	wnWWMA9jfXaZLGaGoyOxn1PtDiEcn7OOUYqyVvGtmjRxHptrOVZK1Bmy5N80t/ZTgwXczL
	ByF6O1mp/sd1WnnrT28VoMND6Wasuxic74eIvMcHh8tZbdC9nvy+FtSHVWhHK1VdoMUGhg
	6p/7HPel8lyoxx5WRKa01CPVYQ85iVTAElpZagYQDLKPunSEhg5fhzoN/rlQNw==
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
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 24/26] ASoC: codecs: Add support for the framer codec
Date: Tue, 25 Jul 2023 11:24:00 +0200
Message-ID: <20230725092417.43706-25-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725092417.43706-1-herve.codina@bootlin.com>
References: <20230725092417.43706-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: DGMDABLAJ3CAUHZIGGXSNVT6D2NJ7TON
X-Message-ID-Hash: DGMDABLAJ3CAUHZIGGXSNVT6D2NJ7TON
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGMDABLAJ3CAUHZIGGXSNVT6D2NJ7TON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The framer codec interracts with a framer.
It allows to use some of the framer timeslots as audio channels to
transport audio data over the framer E1/T1/J1 lines.
It also reports line carrier detection events through the ALSA jack
detection feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/Kconfig        |  15 ++
 sound/soc/codecs/Makefile       |   2 +
 sound/soc/codecs/framer-codec.c | 423 ++++++++++++++++++++++++++++++++
 3 files changed, 440 insertions(+)
 create mode 100644 sound/soc/codecs/framer-codec.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f99203ef9b03..8bd534c94893 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -110,6 +110,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ES8328_I2C
 	imply SND_SOC_ES7134
 	imply SND_SOC_ES7241
+	imply SND_SOC_FRAMER
 	imply SND_SOC_GTM601
 	imply SND_SOC_HDAC_HDMI
 	imply SND_SOC_HDAC_HDA
@@ -1043,6 +1044,20 @@ config SND_SOC_ES8328_SPI
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
+	  bus on with the framer is connected to transport the audio data.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-soc-framer.
+
+
 config SND_SOC_GTM601
 	tristate 'GTM601 UMTS modem audio codec'
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 32dcc6de58bd..54667274a0f6 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -116,6 +116,7 @@ snd-soc-es8326-objs := es8326.o
 snd-soc-es8328-objs := es8328.o
 snd-soc-es8328-i2c-objs := es8328-i2c.o
 snd-soc-es8328-spi-objs := es8328-spi.o
+snd-soc-framer-objs := framer-codec.o
 snd-soc-gtm601-objs := gtm601.o
 snd-soc-hdac-hdmi-objs := hdac_hdmi.o
 snd-soc-hdac-hda-objs := hdac_hda.o
@@ -499,6 +500,7 @@ obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
 obj-$(CONFIG_SND_SOC_ES8328)	+= snd-soc-es8328.o
 obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
 obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
+obj-$(CONFIG_SND_SOC_FRAMER)	+= snd-soc-framer.o
 obj-$(CONFIG_SND_SOC_GTM601)    += snd-soc-gtm601.o
 obj-$(CONFIG_SND_SOC_HDAC_HDMI) += snd-soc-hdac-hdmi.o
 obj-$(CONFIG_SND_SOC_HDAC_HDA) += snd-soc-hdac-hda.o
diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
new file mode 100644
index 000000000000..0db82082620b
--- /dev/null
+++ b/sound/soc/codecs/framer-codec.c
@@ -0,0 +1,423 @@
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
+		dev_err(dai->dev, "too much tx slots defined (mask = 0x%x) support max %d\n",
+			tx_mask, FRAMER_NB_CHANNEL);
+		return -EINVAL;
+	}
+
+	framer->max_chan_capture = hweight32(rx_mask);
+	if (framer->max_chan_capture > FRAMER_NB_CHANNEL) {
+		dev_err(dai->dev, "too much rx slots defined (mask = 0x%x) support max %d\n",
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
+
+	switch (snd_pcm_format_physical_width(format)) {
+	case 8:
+		ch.max = nb_ts;
+		break;
+	case 16:
+		ch.max = nb_ts / 2;
+		break;
+	case 32:
+		ch.max = nb_ts / 4;
+		break;
+	case 64:
+		ch.max = nb_ts / 8;
+		break;
+	default:
+		dev_err(dai->dev, "format physical width %u not supported\n",
+			snd_pcm_format_physical_width(format));
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
+	for (format = SNDRV_PCM_FORMAT_FIRST; format <= SNDRV_PCM_FORMAT_LAST; format++) {
+		if (snd_mask_test(f_old, format)) {
+			if (snd_pcm_format_physical_width(format) <= slot_width)
+				snd_mask_set(&f_new, format);
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
+	u64 formats;
+	unsigned int chan_width;
+	unsigned int format_width;
+	int i;
+
+	if (!nb_ts)
+		return 0;
+
+	formats = 0;
+	chan_width = nb_ts * 8;
+	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
+		/* Support physical width multiple of 8bit */
+		format_width = snd_pcm_format_physical_width(i);
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
+		formats |= (1ULL << i);
+	}
+	return formats;
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


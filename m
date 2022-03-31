Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E214ED0B1
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 02:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2C821A16;
	Thu, 31 Mar 2022 02:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2C821A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648685281;
	bh=QACVLgk/k+ZBYUsGzYvAgMRgdqSPU5QGny9lejfo+ms=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvZVBGatWvylT9n9vn65Y1BF9N7PMLyqe6bsacCEPIsvQI+7VHVbV7HUl+Eyh8cuh
	 Zp41am3gEcrjD/Px8HylCW1YdaM9x9gety93MLRpu8pF1LsQ5aCLEQRE3i2PfOTwz8
	 x9vKCip6N4ETR4jPd4MB3ex+25Fy6i9vOCZxRbYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B83F80526;
	Thu, 31 Mar 2022 02:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D71AF8051E; Thu, 31 Mar 2022 02:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C150DF804B4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 02:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C150DF804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="d5r9jICi"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1648685135; bh=5DCUaIsE4Uppw5JzTbkl1FjLIhH+WKKv/Ni/67xWdW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=d5r9jICimWOs8p7Oy+m+XL72g7YZXttPeUcxnRr1XBuSHJ4haxfbForiglmmAQ+t6
 cPx/1kMxQHZ8jHB1ZOF+BKXGZwkYe2PMsDs28telVEtkKs8iKVMxHWIZsF0K8Nc20s
 4hcRrP0376RGe/3Wqr9b0vyq6/qrPP4YijTdVQsQ=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH 5/5] ASoC: Add macaudio machine driver
Date: Thu, 31 Mar 2022 02:04:49 +0200
Message-Id: <20220331000449.41062-6-povik+lin@cutebit.org>
In-Reply-To: <20220331000449.41062-1-povik+lin@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Add ASoC machine driver for Apple Silicon Macs.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/Kconfig    |  10 +
 sound/soc/apple/Makefile   |   3 +
 sound/soc/apple/macaudio.c | 597 +++++++++++++++++++++++++++++++++++++
 3 files changed, 610 insertions(+)
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/macaudio.c

diff --git a/sound/soc/apple/Kconfig b/sound/soc/apple/Kconfig
new file mode 100644
index 000000000000..afc0243b9309
--- /dev/null
+++ b/sound/soc/apple/Kconfig
@@ -0,0 +1,10 @@
+config SND_SOC_APPLE_MACAUDIO
+	tristate "ASoC machine driver for Apple Silicon Macs"
+	depends on ARCH_APPLE || COMPILE_TEST
+	select SND_SOC_APPLE_MCA
+	select SND_SIMPLE_CARD_UTILS
+	select APPLE_ADMAC
+	select COMMON_CLK_APPLE_NCO
+	default ARCH_APPLE
+	help
+	  This option enables an ASoC machine driver for Apple Silicon Macs.
diff --git a/sound/soc/apple/Makefile b/sound/soc/apple/Makefile
new file mode 100644
index 000000000000..d7a2df6311b5
--- /dev/null
+++ b/sound/soc/apple/Makefile
@@ -0,0 +1,3 @@
+snd-soc-macaudio-objs	:= macaudio.o
+
+obj-$(CONFIG_SND_SOC_APPLE_MACAUDIO)	+= snd-soc-macaudio.o
diff --git a/sound/soc/apple/macaudio.c b/sound/soc/apple/macaudio.c
new file mode 100644
index 000000000000..3e80f97a9b75
--- /dev/null
+++ b/sound/soc/apple/macaudio.c
@@ -0,0 +1,597 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ASoC machine driver for Apple Silicon Macs
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ *
+ * Based on sound/soc/qcom/{sc7180.c|common.c}
+ *
+ * Copyright (c) 2018, Linaro Limited.
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/simple_card_utils.h>
+#include <sound/soc.h>
+#include <uapi/linux/input-event-codes.h>
+
+#define DRIVER_NAME "snd-soc-macaudio"
+
+struct macaudio_snd_data {
+	struct snd_soc_card card;
+	struct snd_soc_jack_pin pin;
+	struct snd_soc_jack jack;
+
+	struct macaudio_link_props {
+		unsigned int mclk_fs;
+	} *link_props;
+
+	const struct snd_pcm_chmap_elem *speaker_chmap;
+
+	unsigned int speaker_nchans_array[2];
+	struct snd_pcm_hw_constraint_list speaker_nchans_list;
+
+	struct list_head hidden_kcontrols;
+};
+
+static int macaudio_parse_of(struct macaudio_snd_data *ma, struct snd_soc_card *card)
+{
+	struct device_node *np;
+	struct device_node *codec = NULL;
+	struct device_node *cpu = NULL;
+	struct device *dev = card->dev;
+	struct snd_soc_dai_link *link;
+	struct macaudio_link_props *link_props;
+	int ret, num_links;
+	int i = 0;
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err(dev, "Error parsing card name: %d\n", ret);
+		return ret;
+	}
+
+	ret = asoc_simple_parse_routing(card, NULL);
+	if (ret)
+		return ret;
+
+	/* Populate links */
+	num_links = of_get_available_child_count(dev->of_node);
+
+	/* Allocate the DAI link array */
+	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	ma->link_props = devm_kcalloc(dev, num_links, sizeof(*ma->link_props), GFP_KERNEL);
+	if (!card->dai_link || !ma->link_props)
+		return -ENOMEM;
+
+	card->num_links = num_links;
+	link = card->dai_link;
+	link_props = ma->link_props;
+
+	for_each_available_child_of_node(dev->of_node, np) {
+		link->id = i++;
+
+		/* CPU side is bit and frame clock master, I2S with both clocks inverted */
+		link->dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_CBC_CFC |
+			SND_SOC_DAIFMT_GATED |
+			SND_SOC_DAIFMT_IB_IF;
+
+		ret = of_property_read_string(np, "link-name", &link->name);
+		if (ret) {
+			dev_err(card->dev, "Missing link name\n");
+			goto err_put_np;
+		}
+
+		cpu = of_get_child_by_name(np, "cpu");
+		codec = of_get_child_by_name(np, "codec");
+
+		if (!codec || !cpu) {
+			dev_err(dev, "Missing DAI specifications for '%s'\n", link->name);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+		if (ret < 0) {
+			if (ret != -EPROBE_DEFER)
+				dev_err(card->dev, "%s: codec dai not found: %d\n",
+					link->name, ret);
+			goto err;
+		}
+
+		ret = snd_soc_of_get_dai_link_cpus(dev, cpu, link);
+		if (ret < 0) {
+			if (ret != -EPROBE_DEFER)
+				dev_err(card->dev, "%s: cpu dai not found: %d\n",
+					link->name, ret);
+			goto err;
+		}
+
+		link->num_platforms = 1;
+		link->platforms	= devm_kzalloc(dev, sizeof(*link->platforms),
+						GFP_KERNEL);
+		if (!link->platforms) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		link->platforms->of_node = link->cpus->of_node;
+
+		of_property_read_u32(np, "mclk-fs", &link_props->mclk_fs);
+
+		link->stream_name = link->name;
+		link++;
+		link_props++;
+
+		of_node_put(cpu);
+		of_node_put(codec);
+	}
+
+	/*
+	 * TODO: Not sure I shouldn't do something about the ->of_node component
+	 * references I leave in dai_link (if successful here).
+	 */
+
+	return 0;
+err:
+	of_node_put(cpu);
+	of_node_put(codec);
+err_put_np:
+	for (i = 0; i < num_links; i++) {
+		snd_soc_of_put_dai_link_codecs(&card->dai_link[i]);
+		snd_soc_of_put_dai_link_cpus(&card->dai_link[i]);
+	}
+	of_node_put(np);
+	return ret;
+}
+
+static int macaudio_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->num];
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai;
+	int i, mclk;
+
+	if (props->mclk_fs) {
+		mclk = params_rate(params) * props->mclk_fs;
+
+		for_each_rtd_codec_dais(rtd, i, dai)
+			snd_soc_dai_set_sysclk(dai, 0, mclk, SND_SOC_CLOCK_IN);
+
+		snd_soc_dai_set_sysclk(cpu_dai, 0, mclk, SND_SOC_CLOCK_OUT);
+	}
+
+	return 0;
+}
+
+static void macaudio_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->num];
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai;
+	int i;
+
+	if (props->mclk_fs) {
+		for_each_rtd_codec_dais(rtd, i, dai)
+			snd_soc_dai_set_sysclk(dai, 0, 0, SND_SOC_CLOCK_IN);
+
+		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, SND_SOC_CLOCK_OUT);
+	}
+}
+
+static bool macaudio_is_speakers(struct snd_soc_dai_link *dai_link)
+{
+	return !strcmp(rtd->dai_link->name, "Speaker")
+		|| !strcmp(rtd->dai_link->name, "Speakers");
+}
+
+static int macaudio_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct snd_pcm_hw_constraint_list *nchans_list = &ma->speaker_nchans_list;
+	unsigned int *nchans_array = ma->speaker_nchans_array;
+	int ret;
+
+	if (macaudio_is_speakers(rtd->dai_link)) {
+		if (rtd->num_codecs > 2) {
+			nchans_list->count = 2;
+			nchans_list->list = nchans_array;
+			nchans_array[0] = 2;
+			nchans_array[1] = rtd->num_codecs;
+
+			ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					SNDRV_PCM_HW_PARAM_CHANNELS, nchans_list);
+			if (ret < 0)
+				return ret;
+		} else if (rtd->num_codecs == 2) {
+			ret = snd_pcm_hw_constraint_single(substream->runtime,
+					SNDRV_PCM_HW_PARAM_CHANNELS, 2);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int macaudio_assign_tdm(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *dai, *cpu_dai;
+	int ret, i;
+	int nchans = 0, nslots = 0, slot_width = 32;
+
+	nslots = rtd->num_codecs;
+
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		int codec_nchans = 1;
+		int mask = ((1 << codec_nchans) - 1) << nchans;
+
+		ret = snd_soc_dai_set_tdm_slot(dai, mask,
+					mask, nslots, slot_width);
+		if (ret == -EINVAL)
+			/* Try without the RX mask */
+			ret = snd_soc_dai_set_tdm_slot(dai, mask,
+					0, nslots, slot_width);
+
+		if (ret < 0) {
+			dev_err(card->dev, "DAI %s refuses TDM settings: %d",
+					dai->name, ret);
+			return ret;
+		}
+
+		nchans += codec_nchans;
+	}
+
+	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	ret = snd_soc_dai_set_tdm_slot(cpu_dai, (1 << nslots) - 1,
+			(1 << nslots) - 1, nslots, slot_width);
+	if (ret < 0) {
+		dev_err(card->dev, "CPU DAI %s refuses TDM settings: %d",
+				cpu_dai->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int macaudio_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component;
+	int ret, i;
+
+	if (rtd->num_codecs > 1) {
+		ret = macaudio_assign_tdm(rtd);
+		if (ret < 0)
+			return ret;
+	}
+
+	for_each_rtd_components(rtd, i, component)
+		snd_soc_component_set_jack(component, &ma->jack, NULL);
+
+	return 0;
+}
+
+static void macaudio_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component;
+	int i;
+
+	for_each_rtd_components(rtd, i, component)
+		snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+struct macaudio_kctlfix {
+	char *name;
+	char *value;
+} macaudio_kctlfixes[] = {
+	{"* ASI1 Sel", "Left"},
+	{"* ISENSE Switch", "Off"},
+	{"* VSENSE Switch", "Off"},
+	{ }
+};
+
+static bool macaudio_kctlfix_matches(const char *pattern, const char *name)
+{
+	if (pattern[0] == '*') {
+		int namelen, patternlen;
+
+		pattern++;
+		if (pattern[0] == ' ')
+			pattern++;
+
+		namelen = strlen(name);
+		patternlen = strlen(pattern);
+
+		if (namelen > patternlen)
+			name += (namelen - patternlen);
+	}
+
+	return !strcmp(name, pattern);
+}
+
+static struct macaudio_kctlfix *macaudio_find_kctlfix(const char *name)
+{
+	struct macaudio_kctlfix *fctl;
+
+	for (fctl = macaudio_kctlfixes; fctl->name != NULL; fctl++)
+		if (macaudio_kctlfix_matches(fctl->name, name))
+			return fctl;
+
+	return NULL;
+}
+
+static int macaudio_probe(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	INIT_LIST_HEAD(&ma->hidden_kcontrols);
+
+	ma->pin.pin = "Headphones";
+	ma->pin.mask = SND_JACK_HEADSET | SND_JACK_HEADPHONE;
+	ret = snd_soc_card_jack_new(card, ma->pin.pin,
+			SND_JACK_HEADSET |
+			SND_JACK_HEADPHONE |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3,
+			&ma->jack, &ma->pin, 1);
+
+	if (ret < 0)
+		dev_err(card->dev, "jack creation failed: %d\n", ret);
+
+	return ret;
+}
+
+/*
+ * Maybe this could be a general ASoC function?
+ */
+static void snd_soc_kcontrol_set_strval(struct snd_soc_card *card,
+				struct snd_kcontrol *kcontrol, const char *strvalue)
+{
+	struct snd_ctl_elem_value value;
+	struct snd_ctl_elem_info info;
+	int sel, i, ret;
+
+	ret = kcontrol->info(kcontrol, &info);
+	if (ret < 0) {
+		dev_err(card->dev, "can't obtain info on control '%s': %d",
+			kcontrol->id.name, ret);
+		return;
+	}
+
+	switch (info.type) {
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		for (sel = 0; sel < info.value.enumerated.items; sel++) {
+			info.value.enumerated.item = sel;
+			kcontrol->info(kcontrol, &info);
+
+			if (!strcmp(strvalue, info.value.enumerated.name))
+				break;
+		}
+
+		if (sel == info.value.enumerated.items)
+			goto not_avail;
+
+		for (i = 0; i < info.count; i++)
+			value.value.enumerated.item[i] = sel;
+		break;
+
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+		sel = !strcmp(strvalue, "On");
+
+		if (!sel && strcmp(strvalue, "Off"))
+			goto not_avail;
+
+		for (i = 0; i < info.count; i++)
+			value.value.integer.value[i] = sel;
+		break;
+
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
+		if (kstrtoint(strvalue, 10, &sel))
+			goto not_avail;
+
+		for (i = 0; i < info.count; i++)
+			value.value.integer.value[i] = sel;
+		break;
+
+	default:
+		dev_err(card->dev, "%s: control '%s' has unsupported type %d",
+			__func__, kcontrol->id.name, info.type);
+		return;
+	}
+
+	ret = kcontrol->put(kcontrol, &value);
+	if (ret < 0) {
+		dev_err(card->dev, "can't set control '%s' to '%s': %d",
+			kcontrol->id.name, strvalue, ret);
+		return;
+	}
+
+	dev_dbg(card->dev, "set '%s' to '%s'",
+			kcontrol->id.name, strvalue);
+	return;
+
+not_avail:
+	dev_err(card->dev, "option '%s' on control '%s' not available",
+			strvalue, kcontrol->id.name);
+	return;
+
+}
+
+static int macaudio_filter_controls(struct snd_soc_card *card,
+			 struct snd_kcontrol *kcontrol)
+{
+	struct macaudio_kctlfix *fctl = macaudio_find_kctlfix(kcontrol->id.name);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+
+	dev_dbg(card->dev, "visiting control %s, have match %d\n",
+		kcontrol->id.name, !!fctl);
+
+	if (!fctl)
+		return 0;
+
+	list_add_tail(&kcontrol->list, &ma->hidden_kcontrols);
+	return 1;
+}
+
+static int macaudio_late_probe(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct snd_kcontrol *kcontrol;
+	struct snd_soc_pcm_runtime *rtd;
+	int ret;
+
+	/*
+	 * Here we take it to be okay to fiddle with the kcontrols
+	 * we caught for ourselves.
+	 */
+	list_for_each_entry(kcontrol, &ma->hidden_kcontrols, list) {
+		struct macaudio_kctlfix *fctl = macaudio_find_kctlfix(kcontrol->id.name);
+
+		if (fctl)
+			snd_soc_kcontrol_set_strval(card, kcontrol, fctl->value);
+	}
+
+	for_each_card_rtds(card, rtd) {
+		if (macaudio_is_speakers(rtd->dai_link) && ma->speaker_chmap) {
+			ret = snd_pcm_add_chmap_ctls(rtd->pcm,
+				SNDRV_PCM_STREAM_PLAYBACK, ma->speaker_chmap,
+				rtd->num_codecs, 0, NULL);
+			if (ret < 0)
+				dev_err(card->dev, "failed to add channel map on '%s': %d\n",
+					rtd->dai_link->name, ret);
+		}
+	}
+
+	return 0;
+}
+
+static int macaudio_remove(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct snd_kcontrol *kcontrol;
+
+	list_for_each_entry(kcontrol, &ma->hidden_kcontrols, list)
+		snd_ctl_free_one(kcontrol);
+
+	return 0;
+}
+
+static const struct snd_soc_ops macaudio_ops = {
+	.startup	= macaudio_startup,
+	.shutdown	= macaudio_shutdown,
+	.hw_params	= macaudio_hw_params,
+};
+
+static const struct snd_soc_dapm_widget macaudio_snd_widgets[] = {
+	SND_SOC_DAPM_HP("Headphones", NULL),
+};
+
+static const struct snd_pcm_chmap_elem macaudio_j274_chmaps[] = {
+	{ .channels = 1,
+	  .map = { SNDRV_CHMAP_MONO } },
+	{ }
+};
+
+static const struct snd_pcm_chmap_elem macaudio_j293_chmaps[] = {
+	{ .channels = 2,
+	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
+	{ .channels = 4,
+	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+		   SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
+	{ }
+};
+
+static const struct snd_pcm_chmap_elem macaudio_j314_chmaps[] = {
+	{ .channels = 2,
+	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
+	{ .channels = 6,
+	  .map = { SNDRV_CHMAP_SL, SNDRV_CHMAP_SR,
+		   SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+		   SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
+	{ }
+};
+
+static const struct of_device_id macaudio_snd_device_id[]  = {
+	{ .compatible = "apple,j274-macaudio", .data = macaudio_j274_chmaps },
+	{ .compatible = "apple,j293-macaudio", .data = macaudio_j293_chmaps },
+	{ .compatible = "apple,j314-macaudio", .data = macaudio_j314_chmaps },
+	{ .compatible = "apple,macaudio", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, macaudio_snd_device_id);
+
+static int macaudio_snd_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct macaudio_snd_data *data;
+	struct device *dev = &pdev->dev;
+	struct snd_soc_dai_link *link;
+	const struct of_device_id *of_id;
+	int ret;
+	int i;
+
+	of_id = of_match_device(macaudio_snd_device_id, dev);
+	if (!of_id)
+		return -EINVAL;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->speaker_chmap = of_id->data;
+	card = &data->card;
+	snd_soc_card_set_drvdata(card, data);
+
+	card->owner = THIS_MODULE;
+	card->driver_name = DRIVER_NAME;
+	card->dev = dev;
+	card->dapm_widgets = macaudio_snd_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(macaudio_snd_widgets);
+	card->probe = macaudio_probe;
+	card->late_probe = macaudio_late_probe;
+	card->remove = macaudio_remove;
+	card->filter_controls = macaudio_filter_controls;
+	card->remove = macaudio_remove;
+
+	ret = macaudio_parse_of(data, card);
+	if (ret)
+		return ret;
+
+	for_each_card_prelinks(card, i, link) {
+		link->ops = &macaudio_ops;
+		link->init = macaudio_init;
+		link->exit = macaudio_exit;
+	}
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver macaudio_snd_driver = {
+	.probe = macaudio_snd_platform_probe,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = macaudio_snd_device_id,
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(macaudio_snd_driver);
+
+MODULE_AUTHOR("Martin Povišer <povik+lin@cutebit.org>");
+MODULE_DESCRIPTION("Apple Silicon Macs machine-level sound driver");
+MODULE_LICENSE("GPL");
-- 
2.33.0


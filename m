Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA90053EE7D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 21:22:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C5D1B14;
	Mon,  6 Jun 2022 21:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C5D1B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654543356;
	bh=/ASRrL/T4xN4vUyDaZNA7hhsG0gWjXOiPXSosskwwXA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrLT6URJwE2FTAEFOxhBTbNzXfc2j6By84ADiLYAnu1OHHaDXNsyhITWBWVlDXmB4
	 QRASw8wCEBzlNtBm3KCfM5+tz20UICAyky+A0g8VW1czSlW24wV9RUNEVuuoOQfOmX
	 jjgpAuh/jHW3SIRaIe2HTU/VpzYZUjwek8LQyfrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B694DF80551;
	Mon,  6 Jun 2022 21:20:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC77EF8052F; Mon,  6 Jun 2022 21:20:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5C45F80423
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 21:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5C45F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="pr8efmIH"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654543195; bh=w4igCYE6reEqHPqBrqUDUNsl8S3K+iBgYS3AHy12wHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=pr8efmIHvE7DeWzURvQnSiKi0oOOHkwNYlnTU/5mMaaKBSvGLiedGl2cR9o/DAhdg
 pwWwo2e7LotPciGt+S/AWHTVHw2ylX7Kh47AwG6JSufCNTYMHe4T3dN43BOyfQkpt5
 /v1D6W2uByioBbziH9PDj+p5oSH+x06GRmYUGrYo=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
Date: Mon,  6 Jun 2022 21:19:10 +0200
Message-Id: <20220606191910.16580-6-povik+lin@cutebit.org>
In-Reply-To: <20220606191910.16580-1-povik+lin@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>,
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

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/Kconfig    |   16 +
 sound/soc/apple/Makefile   |    2 +
 sound/soc/apple/macaudio.c | 1004 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1022 insertions(+)
 create mode 100644 sound/soc/apple/macaudio.c

diff --git a/sound/soc/apple/Kconfig b/sound/soc/apple/Kconfig
index 0ba955657e98..8db30569af9c 100644
--- a/sound/soc/apple/Kconfig
+++ b/sound/soc/apple/Kconfig
@@ -1,3 +1,19 @@
+config SND_SOC_APPLE_MACAUDIO
+	tristate "Audio support for Apple Silicon Macs"
+	depends on ARCH_APPLE || COMPILE_TEST
+	select SND_SOC_APPLE_MCA
+	select SND_SIMPLE_CARD_UTILS
+	select APPLE_ADMAC
+	select COMMON_CLK_APPLE_NCO
+	select SND_SOC_TAS2764
+	select SND_SOC_TAS2770
+	select SND_SOC_CS42L42
+	default ARCH_APPLE
+	help
+	  This option enables an ASoC machine-level driver for Apple Silicon Macs
+	  and it also enables the required SoC and codec drivers for overall
+	  sound support on these machines.
+
 config SND_SOC_APPLE_MCA
 	tristate "Apple Silicon MCA driver"
 	depends on ARCH_APPLE || COMPILE_TEST
diff --git a/sound/soc/apple/Makefile b/sound/soc/apple/Makefile
index 7a30bf452817..3ffb19ed1d0a 100644
--- a/sound/soc/apple/Makefile
+++ b/sound/soc/apple/Makefile
@@ -1,3 +1,5 @@
 snd-soc-apple-mca-objs	:= mca.o
+snd-soc-macaudio-objs	:= macaudio.o
 
+obj-$(CONFIG_SND_SOC_APPLE_MACAUDIO)	+= snd-soc-macaudio.o
 obj-$(CONFIG_SND_SOC_APPLE_MCA)	+= snd-soc-apple-mca.o
diff --git a/sound/soc/apple/macaudio.c b/sound/soc/apple/macaudio.c
new file mode 100644
index 000000000000..24a7200e06f6
--- /dev/null
+++ b/sound/soc/apple/macaudio.c
@@ -0,0 +1,1004 @@
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
+ *
+ *
+ * Virtual FE/BE Playback Topology
+ * -------------------------------
+ *
+ * The platform driver has independent frontend and backend DAIs with the
+ * option of routing backends to any of the frontends. The platform
+ * driver configures the routing based on DPCM couplings in ASoC runtime
+ * structures, which in turn is determined from DAPM paths by ASoC. But the
+ * platform driver doesn't supply relevant DAPM paths and leaves that up for
+ * the machine driver to fill in. The filled-in virtual topology can be
+ * anything as long as a particular backend isn't connected to more than one
+ * frontend at any given time. (The limitation is due to the unsupported case
+ * of reparenting of live BEs.)
+ *
+ * The DAPM routing that this machine-level driver makes up has two use-cases
+ * in mind:
+ *
+ * - Using a single PCM for playback such that it conditionally sinks to either
+ *   speakers or headphones based on the plug-in state of the headphones jack.
+ *   All the while making the switch transparent to userspace. This has the
+ *   drawback of requiring a sample stream suited for both speakers and
+ *   headphones, which is hard to come by on machines where tailored DSP for
+ *   speakers in userspace is desirable or required.
+ *
+ * - Driving the headphones and speakers from distinct PCMs, having userspace
+ *   bridge the difference and apply different signal processing to the two.
+ *
+ * In the end the topology supplied by this driver looks like this:
+ *
+ *  PCMs (frontends)                   I2S Port Groups (backends)
+ *  ────────────────                   ──────────────────────────
+ *
+ *  ┌──────────┐       ┌───────────────► ┌─────┐     ┌──────────┐
+ *  │ Primary  ├───────┤                 │ Mux │ ──► │ Speakers │
+ *  └──────────┘       │    ┌──────────► └─────┘     └──────────┘
+ *                ┌─── │ ───┘             ▲
+ *  ┌──────────┐  │    │                  │
+ *  │Secondary ├──┘    │     ┌────────────┴┐
+ *  └──────────┘       ├────►│Plug-in Demux│
+ *                     │     └────────────┬┘
+ *                     │                  │
+ *                     │                  ▼
+ *                     │                 ┌─────┐     ┌──────────┐
+ *                     └───────────────► │ Mux │ ──► │Headphones│
+ *                                       └─────┘     └──────────┘
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
+/*
+ * CPU side is bit and frame clock provider
+ * I2S has both clocks inverted
+ */
+#define MACAUDIO_DAI_FMT	(SND_SOC_DAIFMT_I2S | \
+				 SND_SOC_DAIFMT_CBC_CFC | \
+				 SND_SOC_DAIFMT_GATED | \
+				 SND_SOC_DAIFMT_IB_IF)
+#define MACAUDIO_JACK_MASK	(SND_JACK_HEADSET | SND_JACK_HEADPHONE)
+#define MACAUDIO_SLOTWIDTH	32
+
+struct macaudio_model_data {
+	bool deactive_asi1_sel;
+	int spk_amp_gain_max;
+};
+
+struct macaudio_snd_data {
+	struct snd_soc_card card;
+	struct snd_soc_jack_pin pin;
+	struct snd_soc_jack jack;
+	int jack_plugin_state;
+	struct snd_kcontrol *plugin_demux_kcontrol;
+
+	struct macaudio_link_props {
+		/* frontend props */
+		unsigned int mclk_fs;
+
+		/* backend props */
+		bool is_speakers;
+		bool is_headphones;
+		unsigned int tdm_mask;
+	} *link_props;
+
+	unsigned int speaker_nchans_array[2];
+	struct snd_pcm_hw_constraint_list speaker_nchans_list;
+
+	struct macaudio_model_data *mdata;
+};
+
+static bool void_warranty;
+module_param(void_warranty, bool, 0644);
+MODULE_PARM_DESC(void_warranty, "Keep going even without speaker volume safety caps");
+
+SND_SOC_DAILINK_DEFS(primary,
+	DAILINK_COMP_ARRAY(COMP_CPU("mca-pcm-0")), // CPU
+	DAILINK_COMP_ARRAY(COMP_DUMMY()), // CODEC
+	DAILINK_COMP_ARRAY(COMP_EMPTY())); // platform (filled at runtime)
+
+SND_SOC_DAILINK_DEFS(secondary,
+	DAILINK_COMP_ARRAY(COMP_CPU("mca-pcm-1")), // CPU
+	DAILINK_COMP_ARRAY(COMP_DUMMY()), // CODEC
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link macaudio_fe_links[] = {
+	{
+		.name = "Primary",
+		.stream_name = "Primary",
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_format = 1,
+		.dai_fmt = MACAUDIO_DAI_FMT,
+		SND_SOC_DAILINK_REG(primary),
+	},
+	{
+		.name = "Secondary",
+		.stream_name = "Secondary",
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_format = 1,
+		.dai_fmt = MACAUDIO_DAI_FMT,
+		SND_SOC_DAILINK_REG(secondary),
+	},
+};
+
+static struct macaudio_link_props macaudio_fe_link_props[] = {
+	{
+		/*
+		 * Primary FE
+		 *
+		 * The mclk/fs ratio at 64 for the primary frontend is important
+		 * to ensure that the headphones codec's idea of left and right
+		 * in a stereo stream over I2S fits in nicely with everyone else's.
+		 * (This is until the headphones codec's driver supports
+		 * set_tdm_slot.)
+		 *
+		 * The low mclk/fs ratio precludes transmitting more than two
+		 * channels over I2S, but that's okay since there is the secondary
+		 * FE for speaker arrays anyway.
+		 */
+		.mclk_fs = 64,
+	},
+	{
+		/*
+		 * Secondary FE
+		 *
+		 * Here we want frames plenty long to be able to drive all
+		 * those fancy speaker arrays.
+		 */
+		.mclk_fs = 256,
+	}
+};
+
+static int macaudio_copy_link(struct device *dev, struct snd_soc_dai_link *target,
+			       struct snd_soc_dai_link *source)
+{
+	memcpy(target, source, sizeof(struct snd_soc_dai_link));
+
+	target->cpus = devm_kcalloc(dev, target->num_cpus,
+				sizeof(*target->cpus), GFP_KERNEL);
+	target->codecs = devm_kcalloc(dev, target->num_codecs,
+				sizeof(*target->codecs), GFP_KERNEL);
+	target->platforms = devm_kcalloc(dev, target->num_platforms,
+				sizeof(*target->platforms), GFP_KERNEL);
+
+	if (!target->cpus || !target->codecs || !target->platforms)
+		return -ENOMEM;
+
+	memcpy(target->cpus, source->cpus, sizeof(*target->cpus) * target->num_cpus);
+	memcpy(target->codecs, source->codecs, sizeof(*target->codecs) * target->num_codecs);
+	memcpy(target->platforms, source->platforms, sizeof(*target->platforms) * target->num_platforms);
+
+	return 0;
+}
+
+static int macaudio_parse_of_component(struct device_node *node, int index,
+				struct snd_soc_dai_link_component *comp)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	ret = of_parse_phandle_with_args(node, "sound-dai", "#sound-dai-cells",
+						index, &args);
+	if (ret)
+		return ret;
+	comp->of_node = args.np;
+	return snd_soc_get_dai_name(&args, &comp->dai_name);
+}
+
+/*
+ * Parse one DPCM backend from the devicetree. This means taking one
+ * of the CPU DAIs and combining it with one or more CODEC DAIs.
+ */
+static int macaudio_parse_of_be_dai_link(struct macaudio_snd_data *ma,
+				struct snd_soc_dai_link *link,
+				int be_index, int ncodecs_per_be,
+				struct device_node *cpu,
+				struct device_node *codec)
+{
+	struct snd_soc_dai_link_component *comp;
+	struct device *dev = ma->card.dev;
+	int codec_base = be_index * ncodecs_per_be;
+	int ret, i;
+
+	link->no_pcm = 1;
+	link->dpcm_playback = 1;
+	link->dpcm_capture = 1;
+
+	link->dai_fmt = MACAUDIO_DAI_FMT;
+
+	link->num_codecs = ncodecs_per_be;
+	link->codecs = devm_kcalloc(dev, ncodecs_per_be,
+				    sizeof(*comp), GFP_KERNEL);
+	link->num_cpus = 1;
+	link->cpus = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+
+	if (!link->codecs || !link->cpus)
+		return -ENOMEM;
+
+	link->num_platforms = 0;
+
+	for_each_link_codecs(link, i, comp) {
+		ret = macaudio_parse_of_component(codec, codec_base + i, comp);
+		if (ret)
+			return ret;
+	}
+
+	ret = macaudio_parse_of_component(cpu, be_index, link->cpus);
+	if (ret)
+		return ret;
+
+	link->name = link->cpus[0].dai_name;
+
+	return 0;
+}
+
+static int macaudio_parse_of(struct macaudio_snd_data *ma)
+{
+	struct device_node *codec = NULL;
+	struct device_node *cpu = NULL;
+	struct device_node *np = NULL;
+	struct device_node *platform = NULL;
+	struct snd_soc_dai_link *link = NULL;
+	struct snd_soc_card *card = &ma->card;
+	struct device *dev = card->dev;
+	struct macaudio_link_props *link_props;
+	int ret, num_links, i;
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err(dev, "Error parsing card name: %d\n", ret);
+		return ret;
+	}
+
+	/* Populate links, start with the fixed number of FE links */
+	num_links = ARRAY_SIZE(macaudio_fe_links);
+
+	/* Now add together the (dynamic) number of BE links */
+	for_each_available_child_of_node(dev->of_node, np) {
+		int num_cpus;
+
+		cpu = of_get_child_by_name(np, "cpu");
+		if (!cpu) {
+			dev_err(dev, "missing CPU DAI node at %pOF\n", np);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
+		num_cpus = of_count_phandle_with_args(cpu, "sound-dai",
+						"#sound-dai-cells");
+
+		if (num_cpus <= 0) {
+			dev_err(card->dev, "missing sound-dai property at %pOF\n", cpu);
+			ret = -EINVAL;
+			goto err_free;
+		}
+		of_node_put(cpu);
+		cpu = NULL;
+
+		/* Each CPU specified counts as one BE link */
+		num_links += num_cpus;
+	}
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
+	for (i = 0; i < ARRAY_SIZE(macaudio_fe_links); i++) {
+		ret = macaudio_copy_link(dev, link, &macaudio_fe_links[i]);
+		if (ret)
+			goto err_free;
+
+		memcpy(link_props, &macaudio_fe_link_props[i], sizeof(struct macaudio_link_props));
+		link++; link_props++;
+	}
+
+	for (i = 0; i < num_links; i++)
+		card->dai_link[i].id = i;
+
+	/* Fill in the BEs */
+	for_each_available_child_of_node(dev->of_node, np) {
+		const char *link_name;
+		bool speakers;
+		int be_index, num_codecs, num_bes, ncodecs_per_cpu, nchannels;
+		unsigned int left_mask, right_mask;
+
+		ret = of_property_read_string(np, "link-name", &link_name);
+		if (ret) {
+			dev_err(card->dev, "missing link name\n");
+			goto err_free;
+		}
+
+		speakers = !strcmp(link_name, "Speaker")
+			   || !strcmp(link_name, "Speakers");
+
+		cpu = of_get_child_by_name(np, "cpu");
+		codec = of_get_child_by_name(np, "codec");
+
+		if (!codec || !cpu) {
+			dev_err(dev, "missing DAI specifications for '%s'\n", link_name);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
+		num_bes = of_count_phandle_with_args(cpu, "sound-dai",
+						     "#sound-dai-cells");
+		if (num_bes <= 0) {
+			dev_err(card->dev, "missing sound-dai property at %pOF\n", cpu);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
+		num_codecs = of_count_phandle_with_args(codec, "sound-dai",
+							"#sound-dai-cells");
+		if (num_codecs <= 0) {
+			dev_err(card->dev, "missing sound-dai property at %pOF\n", codec);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
+		if (num_codecs % num_bes != 0) {
+			dev_err(card->dev, "bad combination of CODEC (%d) and CPU (%d) number at %pOF\n",
+				num_codecs, num_bes, np);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
+		/*
+		 * Now parse the cpu/codec lists into a number of DPCM backend links.
+		 * In each link there will be one DAI from the cpu list paired with
+		 * an evenly distributed number of DAIs from the codec list. (As is
+		 * the binding semantics.)
+		 */
+		ncodecs_per_cpu = num_codecs / num_bes;
+		nchannels = num_codecs * (speakers ? 1 : 2);
+
+		/*
+		 * If there is a single speaker, assign two channels to it, because
+		 * it can do downmix.
+		 */
+		if (nchannels < 2)
+			nchannels = 2;
+
+		left_mask = 0;
+		for (i = 0; i < nchannels; i += 2)
+			left_mask = left_mask << 2 | 1;
+		right_mask = left_mask << 1;
+
+		for (be_index = 0; be_index < num_bes; be_index++) {
+			ret = macaudio_parse_of_be_dai_link(ma, link, be_index,
+							    ncodecs_per_cpu, cpu, codec);
+			if (ret)
+				goto err_free;
+
+			link_props->is_speakers = speakers;
+			link_props->is_headphones = !speakers;
+
+			if (num_bes == 2)
+				/* This sound peripheral is split between left and right BE */
+				link_props->tdm_mask = be_index ? right_mask : left_mask;
+			else
+				/* One BE covers all of the peripheral */
+				link_props->tdm_mask = left_mask | right_mask;
+
+			/* Steal platform OF reference for use in FE links later */
+			platform = link->cpus->of_node;
+
+			link++; link_props++;
+		}
+
+		of_node_put(codec);
+		of_node_put(cpu);
+		cpu = codec = NULL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(macaudio_fe_links); i++)
+		card->dai_link[i].platforms->of_node = platform;
+
+	return 0;
+
+err_free:
+	of_node_put(codec);
+	of_node_put(cpu);
+	of_node_put(np);
+
+	if (!card->dai_link)
+		return ret;
+
+	for (i = 0; i < num_links; i++) {
+		/*
+		 * TODO: If we don't go through this path are the references
+		 * freed inside ASoC?
+		 */
+		snd_soc_of_put_dai_link_codecs(&card->dai_link[i]);
+		snd_soc_of_put_dai_link_cpus(&card->dai_link[i]);
+	}
+
+	return ret;
+}
+
+static int macaudio_get_runtime_mclk_fs(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dpcm *dpcm;
+
+	/*
+	 * If this is a FE, look it up in link_props directly.
+	 * If this is a BE, look it up in the respective FE.
+	 */
+	if (!rtd->dai_link->no_pcm)
+		return ma->link_props[rtd->dai_link->id].mclk_fs;
+
+	for_each_dpcm_fe(rtd, substream->stream, dpcm) {
+		int fe_id = dpcm->fe->dai_link->id;
+
+		return ma->link_props[fe_id].mclk_fs;
+	}
+
+	return 0;
+}
+
+static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int mclk_fs = macaudio_get_runtime_mclk_fs(substream);
+	int i;
+
+	if (mclk_fs) {
+		struct snd_soc_dai *dai;
+		int mclk = params_rate(params) * mclk_fs;
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
+static void macaudio_dpcm_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai;
+	int mclk_fs = macaudio_get_runtime_mclk_fs(substream);
+	int i;
+
+	if (mclk_fs) {
+		for_each_rtd_codec_dais(rtd, i, dai)
+			snd_soc_dai_set_sysclk(dai, 0, 0, SND_SOC_CLOCK_IN);
+
+		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, SND_SOC_CLOCK_OUT);
+	}
+}
+
+static const struct snd_soc_ops macaudio_fe_ops = {
+	.shutdown	= macaudio_dpcm_shutdown,
+	.hw_params	= macaudio_dpcm_hw_params,
+};
+
+static const struct snd_soc_ops macaudio_be_ops = {
+	.shutdown	= macaudio_dpcm_shutdown,
+	.hw_params	= macaudio_dpcm_hw_params,
+};
+
+static int macaudio_be_assign_tdm(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	struct snd_soc_dai *dai;
+	unsigned int mask;
+	int nslots, ret, i;
+
+	if (!props->tdm_mask)
+		return 0;
+
+	mask = props->tdm_mask;
+	nslots = __fls(mask) + 1;
+
+	if (rtd->num_codecs == 1) {
+		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), mask,
+					       0, nslots, MACAUDIO_SLOTWIDTH);
+
+		/*
+		 * Headphones get a pass on -EOPNOTSUPP (see the comment
+		 * around mclk_fs value for primary FE).
+		 */
+		if (ret == -EOPNOTSUPP && props->is_headphones)
+			return 0;
+
+		return ret;
+	}
+
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		int slot = __ffs(mask);
+
+		mask &= ~(1 << slot);
+		ret = snd_soc_dai_set_tdm_slot(dai, 1 << slot, 0, nslots,
+					       MACAUDIO_SLOTWIDTH);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int macaudio_be_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	struct snd_soc_dai *dai;
+	int i, ret;
+
+	ret = macaudio_be_assign_tdm(rtd);
+	if (ret < 0)
+		return ret;
+
+	if (props->is_headphones) {
+		for_each_rtd_codec_dais(rtd, i, dai)
+			snd_soc_component_set_jack(dai->component, &ma->jack, NULL);
+	}
+
+	return 0;
+}
+
+static void macaudio_be_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	struct snd_soc_dai *dai;
+	int i;
+
+	if (props->is_headphones) {
+		for_each_rtd_codec_dais(rtd, i, dai)
+			snd_soc_component_set_jack(dai->component, NULL, NULL);
+	}
+}
+
+static int macaudio_fe_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	int nslots = props->mclk_fs / MACAUDIO_SLOTWIDTH;
+
+	return snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), (1 << nslots) - 1,
+					(1 << nslots) - 1, nslots, MACAUDIO_SLOTWIDTH);
+}
+
+
+static int macaudio_jack_event(struct notifier_block *nb, unsigned long event,
+				void *data);
+
+static struct notifier_block macaudio_jack_nb = {
+	.notifier_call = macaudio_jack_event,
+};
+
+static int macaudio_probe(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	int ret;
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
+	if (ret < 0) {
+		dev_err(card->dev, "jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_soc_jack_notifier_register(&ma->jack, &macaudio_jack_nb);
+
+	return ret;
+}
+
+static int macaudio_add_backend_dai_route(struct snd_soc_card *card, struct snd_soc_dai *dai,
+					  bool is_speakers)
+{
+	struct snd_soc_dapm_route routes[2];
+	int nroutes;
+	int ret;
+	memset(routes, 0, sizeof(routes));
+
+	dev_dbg(card->dev, "adding routes for '%s'\n", dai->name);
+
+	if (is_speakers)
+		routes[0].source = "Speakers Playback";
+	else
+		routes[0].source = "Headphones Playback";
+	routes[0].sink = dai->playback_widget->name;
+	nroutes = 1;
+
+	if (!is_speakers) {
+		routes[1].source = dai->capture_widget->name;
+		routes[1].sink = "Headphones Capture";
+		nroutes = 2;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, routes, nroutes);
+	if (ret)
+		dev_err(card->dev, "failed adding dynamic DAPM routes for %s\n",
+			dai->name);
+	return ret;
+}
+
+static bool macaudio_match_kctl_name(const char *pattern, const char *name)
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
+static int macaudio_limit_volume(struct snd_soc_card *card,
+				 const char *pattern, int max)
+{
+	struct snd_kcontrol *kctl;
+	struct soc_mixer_control *mc;
+	int found = 0;
+
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!macaudio_match_kctl_name(pattern, kctl->id.name))
+			continue;
+
+		found++;
+		dev_dbg(card->dev, "limiting volume on '%s'\n", kctl->id.name);
+
+		/*
+		 * TODO: This doesn't decrease the volume if it's already
+		 * above the limit!
+		 */
+		mc = (struct soc_mixer_control *)kctl->private_value;
+		if (max <= mc->max)
+			mc->platform_max = max;
+
+	}
+
+	return found;
+}
+
+static int macaudio_late_probe(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *dai;
+	int ret, i;
+
+	/* Add the dynamic DAPM routes */
+	for_each_card_rtds(card, rtd) {
+		struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+
+		if (!rtd->dai_link->no_pcm)
+			continue;
+
+		for_each_rtd_cpu_dais(rtd, i, dai) {
+			ret = macaudio_add_backend_dai_route(card, dai, props->is_speakers);
+
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (!ma->mdata) {
+		dev_err(card->dev, "driver doesn't know speaker limits for this model\n");
+		return void_warranty ? 0 : -EINVAL;
+	}
+
+	macaudio_limit_volume(card, "* Amp Gain", ma->mdata->spk_amp_gain_max);
+	return 0;
+}
+
+static const char * const macaudio_plugin_demux_texts[] = {
+	"Speakers",
+	"Headphones"
+};
+
+SOC_ENUM_SINGLE_VIRT_DECL(macaudio_plugin_demux_enum, macaudio_plugin_demux_texts);
+
+static int macaudio_plugin_demux_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(dapm->card);
+
+	/*
+	 * TODO: Determine what locking is in order here...
+	 */
+	ucontrol->value.enumerated.item[0] = ma->jack_plugin_state;
+
+	return 0;
+}
+
+static int macaudio_jack_event(struct notifier_block *nb, unsigned long event,
+				void *data)
+{
+	struct snd_soc_jack *jack = data;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(jack->card);
+
+	ma->jack_plugin_state = !!event;
+
+	if (!ma->plugin_demux_kcontrol)
+		return 0;
+
+	snd_soc_dapm_mux_update_power(&ma->card.dapm, ma->plugin_demux_kcontrol,
+				      ma->jack_plugin_state,
+				      (struct soc_enum *) &macaudio_plugin_demux_enum, NULL);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new macaudio_plugin_demux = {
+	.access = (SNDRV_CTL_ELEM_ACCESS_READ |
+		   SNDRV_CTL_ELEM_ACCESS_VOLATILE),
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Plug-in Playback Demux",
+	.info = snd_soc_info_enum_double,
+	.get = macaudio_plugin_demux_get,
+	.private_value = (unsigned long) &macaudio_plugin_demux_enum
+};
+
+static int macaudio_kctl_set_enum(struct snd_kcontrol *kctl,
+				   const char *strvalue)
+{
+	struct snd_ctl_elem_value value;
+	struct snd_ctl_elem_info info;
+	int sel, i, ret;
+
+	ret = kctl->info(kctl, &info);
+	if (ret < 0)
+		return ret;
+
+	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info.value.enumerated.items; sel++) {
+		info.value.enumerated.item = sel;
+		ret = kctl->info(kctl, &info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(strvalue, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		value.value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, &value);
+}
+
+static void macaudio_deactivate_asi1_sel(struct snd_soc_card *card)
+{
+	struct snd_kcontrol *kctl;
+	int ret;
+
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!macaudio_match_kctl_name("* ASI1 Sel", kctl->id.name))
+			continue;
+
+		ret = macaudio_kctl_set_enum(kctl, "Left");
+		if (ret < 0)
+			dev_err(card->dev, "can't pin '%s': %d\n", kctl->id.name, ret);
+
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, 0);
+		if (ret < 0)
+			dev_err(card->dev, "can't deactivate '%s': %d\n", kctl->id.name, ret);
+		else
+			dev_dbg(card->dev, "deactivated '%s'\n", kctl->id.name);
+	}
+}
+
+static void macaudio_fixup_controls(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	const char *name = macaudio_plugin_demux.name;
+
+	ma->plugin_demux_kcontrol = snd_soc_card_get_kcontrol(card, name);
+
+	if (!ma->plugin_demux_kcontrol)
+		dev_err(card->dev, "can't find control '%s'\n", name);
+
+	if (ma->mdata && ma->mdata->deactive_asi1_sel)
+		macaudio_deactivate_asi1_sel(card);
+
+	macaudio_limit_volume(card, "* Amp Gain Volume", ma->mdata->spk_amp_gain_max);
+}
+
+static const char * const macaudio_spk_mux_texts[] = {
+	"Primary (Conditional)",
+	"Primary",
+	"Secondary"
+};
+
+SOC_ENUM_SINGLE_VIRT_DECL(macaudio_spk_mux_enum, macaudio_spk_mux_texts);
+
+static const struct snd_kcontrol_new macaudio_spk_mux =
+	SOC_DAPM_ENUM("Speakers Playback Mux", macaudio_spk_mux_enum);
+
+static const char * const macaudio_hp_mux_texts[] = {
+	"Primary (Conditional)",
+	"Primary",
+};
+
+SOC_ENUM_SINGLE_VIRT_DECL(macaudio_hp_mux_enum, macaudio_hp_mux_texts);
+
+static const struct snd_kcontrol_new macaudio_hp_mux =
+	SOC_DAPM_ENUM("Headphones Playback Mux", macaudio_hp_mux_enum);
+
+static const struct snd_soc_dapm_widget macaudio_snd_widgets[] = {
+	SND_SOC_DAPM_HP("Headphones", NULL),
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+
+	SND_SOC_DAPM_MUX("Speakers Playback Mux", SND_SOC_NOPM, 0, 0, &macaudio_spk_mux),
+	SND_SOC_DAPM_MUX("Headphones Playback Mux", SND_SOC_NOPM, 0, 0, &macaudio_hp_mux),
+	SND_SOC_DAPM_DEMUX("Plug-in Playback Demux", SND_SOC_NOPM, 0, 0, &macaudio_plugin_demux),
+
+	SND_SOC_DAPM_AIF_OUT("Plug-in Headphones Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("Plug-in Speakers Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("Speakers Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("Headphones Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("Headphones Capture", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route macaudio_dapm_routes[] = {
+	/* Playback paths */
+	{ "Plug-in Playback Demux", NULL, "PCM0 TX" },
+	{ "Plug-in Speakers Playback", "Speakers", "Plug-in Playback Demux" },
+	{ "Plug-in Headphones Playback", "Headphones", "Plug-in Playback Demux" },
+
+	{ "Speakers Playback Mux", "Primary (Conditional)", "Plug-in Speakers Playback" },
+	{ "Speakers Playback Mux", "Primary", "PCM0 TX" },
+	{ "Speakers Playback Mux", "Secondary", "PCM1 TX" },
+	{ "Speakers Playback", NULL, "Speakers Playback Mux"},
+
+	{ "Headphones Playback Mux", "Primary (Conditional)", "Plug-in Headphones Playback" },
+	{ "Headphones Playback Mux", "Primary", "PCM0 TX" },
+	{ "Headphones Playback", NULL, "Headphones Playback Mux"},
+	/*
+	 * Additional paths (to specific I2S ports) are added dynamically.
+	 */
+
+	/* Capture paths */
+	{ "PCM0 RX", NULL, "Headphones Capture" },
+};
+
+struct macaudio_model_data macaudio_j274_mdata = {
+	.spk_amp_gain_max = 20,
+};
+
+struct macaudio_model_data macaudio_j314_mdata = {
+	.deactive_asi1_sel = true,
+	.spk_amp_gain_max = 15,
+};
+
+static const struct of_device_id macaudio_snd_device_id[]  = {
+	{ .compatible = "apple,j274-macaudio", .data = &macaudio_j274_mdata },
+	{ .compatible = "apple,j314-macaudio", .data = &macaudio_j314_mdata },
+	{ .compatible = "apple,macaudio"},
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
+	card = &data->card;
+	snd_soc_card_set_drvdata(card, data);
+
+	data->mdata = (struct macaudio_model_data *) of_id->data;
+
+	card->owner = THIS_MODULE;
+	card->driver_name = DRIVER_NAME;
+	card->dev = dev;
+	card->dapm_widgets = macaudio_snd_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(macaudio_snd_widgets);
+	card->dapm_routes = macaudio_dapm_routes;
+	card->num_dapm_routes = ARRAY_SIZE(macaudio_dapm_routes);
+	card->probe = macaudio_probe;
+	card->late_probe = macaudio_late_probe;
+	card->fixup_controls = macaudio_fixup_controls;
+
+	ret = macaudio_parse_of(data);
+	if (ret)
+		return ret;
+
+	for_each_card_prelinks(card, i, link) {
+		if (link->no_pcm) {
+			link->ops = &macaudio_be_ops;
+			link->init = macaudio_be_init;
+			link->exit = macaudio_be_exit;
+		} else {
+			link->ops = &macaudio_fe_ops;
+			link->init = macaudio_fe_init;
+		}
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


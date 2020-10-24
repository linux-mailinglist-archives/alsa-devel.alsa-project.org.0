Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB69D297AD9
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 06:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F1931801;
	Sat, 24 Oct 2020 06:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F1931801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603515202;
	bh=YsfiD5AEpuasgODxoqCEZVMsGHAYJYvvnQdPCit0/kM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dkW51PBn6yl2QlRBJC6jXPS3TJ+t7g7b69nuTaZHQXHNF2gl7BRVQ2x/klGC4g7dP
	 B8uuBUpOM+8fZi37luzedHsdzS2XkmkYFHFk/tmLGph/hRi0Y38Rjkd5LDutDfy+Jv
	 JfCkrOBRIvQzTbTHhYoIbf6spTXjkAYNmRHKDja4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AEBBF804A9;
	Sat, 24 Oct 2020 06:51:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA11F8049C; Sat, 24 Oct 2020 06:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE571F800CC
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 06:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE571F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H4F6RhqK"
Received: by mail-pg1-x542.google.com with SMTP id o3so2818524pgr.11
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 21:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oftBd3rEuUms4LFHcZ1zXa+XWbelil5Yo2PNPupD+gk=;
 b=H4F6RhqKlSAqXMEqVWWJTIuhIEBDs8ZR+tt5HQi6Nh1M6hydFfpbFFEOFhH/5ICusx
 h2Dg1Op/xOIyBTVsKULQtfikXmNNA194qxGk5VBKG8Yait/S03cQW4h4FDOXbPk9rqvA
 /TI86nNeY+6NNFKQuNC2cDNBA4tjdZ1l1JTTUmEH6W2fM3YbjL6MxIWll70f0Y8qtlkJ
 yhUYnvr51R2OVA1mOtuK9b1ikyvZMoMoWCzqv16HrRqXhYVAkhz3u/QkuZ4vm2qSGSmp
 tbUNCaS1GAOazobwgLqHgJp07XrhaMyWPeGILD8A+6+1OkOmyqk6WjK0gDzsArAa7DV/
 j7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oftBd3rEuUms4LFHcZ1zXa+XWbelil5Yo2PNPupD+gk=;
 b=mVDfnpycrSnPGxg7XqQcMGtbSqgThVR3fXiP2Cwv9J4L5MGbVXg88+7l2kk8rNNANu
 jaLWsPEJHDB1ZxC4F+TaD0UHEJfl99vqiTmB0d4jqfPHgPL21gZ9767jOVakfIrFBmmD
 gcW5IQzd2rP4NIi8HbsI3uFhPMyiyuZKKoPpf/tE9NdpefmBTIXEv2vZtgSwBY83aP/4
 aia26JggyLLYkpvgLZXxMMTcilLYV9fPJgUhhfaClroJtu78yQZkJD6NXAtR5mXsfA1G
 ZbdDWpZnYFjXcQMknFuAIqVXSEzDKZQCypf43M0P204begfToBszNCtvKU6i+W1CUSZK
 WO2A==
X-Gm-Message-State: AOAM530M1xLaPDO49sq53JZ6hu7sP5J+PVBBgi/sCKd+WXNzggFnma5n
 DSLO0rLiUgN8wmYWXyXLRXpw2STS/z55fA==
X-Google-Smtp-Source: ABdhPJwu46oUyIUbsrq389LUndb+oDU2USFtingeaA5whEvdvrcGWIg1d6VGmJ847UEB4E7gh+ijWQ==
X-Received: by 2002:a05:6a00:13aa:b029:15d:73e6:2e9f with SMTP id
 t42-20020a056a0013aab029015d73e62e9fmr2521013pfg.0.1603515096701; 
 Fri, 23 Oct 2020 21:51:36 -0700 (PDT)
Received: from localhost.localdomain (36-225-30-31.dynamic-ip.hinet.net.
 [36.225.30.31])
 by smtp.gmail.com with ESMTPSA id q8sm4050749pfg.118.2020.10.23.21.51.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 21:51:35 -0700 (PDT)
From: Keith Tzneg <matsufan@gmail.com>
X-Google-Original-From: Keith Tzneg <keith.tzeng@quantatw.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] ASoC: Intel: boards: Add CML_RT1015 m/c driver
Date: Sat, 24 Oct 2020 12:51:27 +0800
Message-Id: <1603515087-4092-1-git-send-email-keith.tzeng@quantatw.com>
X-Mailer: git-send-email 2.7.4
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Fred Oh <fred.oh@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Keith Tzeng <keith.tzeng@quanta.corp-partner.google.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Naveen Manohar <naveen.m@intel.com>, Brent Lu <brent.lu@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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

From: Keith Tzeng <keith.tzeng@quanta.corp-partner.google.com>

Machine driver to enable RT5682 on SSP0, DMIC, HDMI and RT1015 AMP on
SSP1: Enabled 4 CH TDM playback with 24 bit data.

Signed-off-by: Keith Tzeng <keith.tzeng@quanta.corp-partner.google.com>
---
 sound/soc/intel/boards/Kconfig                    |  15 +
 sound/soc/intel/boards/Makefile                   |   2 +
 sound/soc/intel/boards/cml_rt1015_rt5682.c        | 570 ++++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c |   7 +
 4 files changed, 594 insertions(+)
 create mode 100644 sound/soc/intel/boards/cml_rt1015_rt5682.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index c10c378..f674c56 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -496,6 +496,21 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_SOF_CML_RT1015_RT5682_MACH
+        tristate "CML with RT1015 and RT5682 in I2S Mode"
+        depends on I2C && ACPI && GPIOLIB
+        depends on MFD_INTEL_LPSS || COMPILE_TEST
+        depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
+        select SND_SOC_RT1015
+        select SND_SOC_RT5682_I2C
+        select SND_SOC_DMIC
+        select SND_SOC_HDAC_HDMI
+        help
+          This adds support for ASoC machine driver for SOF platform with
+          RT1015 + RT5682 I2S codec.
+          Say Y if you have such a device.
+          If unsure select "N".
+
 endif ## SND_SOC_SOF_COMETLAKE && SND_SOC_SOF_HDA_LINK
 
 if SND_SOC_SOF_JASPERLAKE
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index a58e4d2..73131cc 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -20,6 +20,7 @@ snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
 snd-soc-sof_rt5682-objs := sof_rt5682.o hda_dsp_common.o sof_maxim_common.o
 snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o hda_dsp_common.o
+snd-soc-cml_rt1015_rt5682-objs := cml_rt1015_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
 snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
@@ -60,6 +61,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH) += snd-soc-cml_rt1011_rt5682.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_CML_RT1015_RT5682_MACH) += cml_rt1015_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH) += snd-soc-kbl_da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH) += snd-soc-kbl_da7219_max98927.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH) += snd-soc-kbl_rt5663_max98927.o
diff --git a/sound/soc/intel/boards/cml_rt1015_rt5682.c b/sound/soc/intel/boards/cml_rt1015_rt5682.c
new file mode 100644
index 0000000..9117f52
--- /dev/null
+++ b/sound/soc/intel/boards/cml_rt1015_rt5682.c
@@ -0,0 +1,570 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright(c) 2019 Intel Corporation.
+
+/*
+ * Intel Cometlake I2S Machine driver for RT1015 + RT5682 codec
+ */
+
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/dmi.h>
+#include <linux/slab.h>
+#include <asm/cpu_device_id.h>
+#include <linux/acpi.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/rt5682.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/rt1015.h"
+#include "../../codecs/rt5682.h"
+#include "../../codecs/hdac_hdmi.h"
+
+/* The platform clock outputs 24Mhz clock to codec as I2S MCLK */
+#define CML_PLAT_CLK	24000000
+#define CML_RT1015_CODEC_DAI "rt1015-aif"
+#define CML_RT5682_CODEC_DAI "rt5682-aif1"
+#define NAME_SIZE 32
+
+#define SOF_RT1015_SPEAKER_WL		BIT(0)
+#define SOF_RT1015_SPEAKER_WR		BIT(1)
+#define SOF_RT1015_SPEAKER_TL		BIT(2)
+#define SOF_RT1015_SPEAKER_TR		BIT(3)
+#define SPK_CH 4
+
+/* Default: Woofer speakers  */
+static unsigned long sof_rt1015_quirk = SOF_RT1015_SPEAKER_WL |
+					SOF_RT1015_SPEAKER_WR;
+
+static int sof_rt1015_quirk_cb(const struct dmi_system_id *id)
+{
+	sof_rt1015_quirk = (unsigned long)id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id sof_rt1015_quirk_table[] = {
+	{
+		.callback = sof_rt1015_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dooly"),
+	},
+		.driver_data = (void *)(SOF_RT1015_SPEAKER_WL | SOF_RT1015_SPEAKER_WR),
+	},
+	{
+	}
+};
+
+static struct snd_soc_jack hdmi_jack[3];
+
+struct hdmi_pcm {
+	struct list_head head;
+	struct snd_soc_dai *codec_dai;
+	int device;
+};
+
+struct card_private {
+	char codec_name[SND_ACPI_I2C_ID_LEN];
+	struct snd_soc_jack headset;
+	struct list_head hdmi_pcm_list;
+};
+
+static const struct snd_kcontrol_new cml_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("WL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("WR Ext Spk"),
+};
+
+static const struct snd_kcontrol_new cml_rt1015_tt_controls[] = {
+	SOC_DAPM_PIN_SWITCH("TL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("TR Ext Spk"),
+};
+
+static const struct snd_soc_dapm_widget cml_rt1015_rt5682_widgets[] = {
+	SND_SOC_DAPM_SPK("WL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("WR Ext Spk", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_widget cml_rt1015_tt_widgets[] = {
+	SND_SOC_DAPM_SPK("TL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("TR Ext Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route cml_rt1015_rt5682_map[] = {
+	/*WL/WR speaker*/
+	{"WL Ext Spk", NULL, "WL SPO"},
+	{"WR Ext Spk", NULL, "WR SPO"},
+
+	/* HP jack connectors - unknown if we have jack detection */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+
+	/* other jacks */
+	{ "IN1P", NULL, "Headset Mic" },
+
+	/* DMIC */
+	{ "DMic", NULL, "SoC DMIC" },
+};
+
+static const struct snd_soc_dapm_route cml_rt1015_tt_map[] = {
+	/*TL/TR speaker*/
+	{"TL Ext Spk", NULL, "TL SPO" },
+	{"TR Ext Spk", NULL, "TR SPO" },
+};
+
+static int cml_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	/* need to enable ASRC function for 24MHz mclk rate */
+	rt5682_sel_asrc_clk_src(component, RT5682_DA_STEREO1_FILTER |
+				RT5682_AD_STEREO1_FILTER,
+				RT5682_CLK_SEL_I2S1_ASRC);
+
+	/*
+	 * Headset buttons map to the google Reference headset.
+	 * These can be configured by userspace.
+	 */
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    &ctx->headset, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	jack = &ctx->headset;
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret)
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+
+	return ret;
+};
+
+static int cml_rt1015_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret = 0;
+	struct snd_soc_card *card = rtd->card;
+
+	if (sof_rt1015_quirk & (SOF_RT1015_SPEAKER_TL |
+				SOF_RT1015_SPEAKER_TR)) {
+
+		ret = snd_soc_add_card_controls(card, cml_rt1015_tt_controls,
+					ARRAY_SIZE(cml_rt1015_tt_controls));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_new_controls(&card->dapm,
+					cml_rt1015_tt_widgets,
+					ARRAY_SIZE(cml_rt1015_tt_widgets));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_add_routes(&card->dapm, cml_rt1015_tt_map,
+					ARRAY_SIZE(cml_rt1015_tt_map));
+
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	int clk_id, clk_freq, pll_out, ret;
+
+	clk_id = RT5682_PLL1_S_MCLK;
+	clk_freq = CML_PLAT_CLK;
+
+	pll_out = params_rate(params) * 512;
+
+	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
+	if (ret < 0)
+		dev_warn(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
+
+	/* Configure sysclk for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+				     pll_out, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_warn(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+
+	/*
+	 * slot_width should be equal or large than data length, set them
+	 * be the same
+	 */
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x0, 0x0, 2,
+				       params_width(params));
+	if (ret < 0)
+		dev_warn(rtd->dev, "set TDM slot err:%d\n", ret);
+	return ret;
+}
+
+static int cml_rt1015_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_card *card = rtd->card;
+	int srate, i, ret = 0;
+
+	srate = params_rate(params);
+
+	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		/* Set tdm/i2s1 master bclk ratio */
+		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set bclk ratio\n");
+			return ret;
+		}
+		/* 64 Fs to drive 24 bit data */
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
+					  64 * srate, 256 * srate);
+		if (ret < 0) {
+			dev_err(card->dev, "codec_dai clock not set\n");
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_sysclk(codec_dai,
+					     RT1015_SCLK_S_PLL,
+					     256 * srate, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "codec_dai clock not set\n");
+			return ret;
+		}
+
+	}
+	return 0;
+}
+
+static struct snd_soc_ops cml_rt5682_ops = {
+	.hw_params = cml_rt5682_hw_params,
+};
+
+static const struct snd_soc_ops cml_rt1015_ops = {
+	.hw_params = cml_rt1015_hw_params,
+};
+
+static int sof_card_late_probe(struct snd_soc_card *card)
+{
+	struct card_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component = NULL;
+	char jack_name[NAME_SIZE];
+	struct hdmi_pcm *pcm;
+	int ret, i = 0;
+
+	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
+		component = pcm->codec_dai->component;
+		snprintf(jack_name, sizeof(jack_name),
+			 "HDMI/DP, pcm=%d Jack", pcm->device);
+		ret = snd_soc_card_jack_new(card, jack_name,
+					    SND_JACK_AVOUT, &hdmi_jack[i],
+					    NULL, 0);
+		if (ret)
+			return ret;
+
+		ret = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
+					  &hdmi_jack[i]);
+		if (ret < 0)
+			return ret;
+
+		i++;
+	}
+	if (!component)
+		return -EINVAL;
+
+	return hdac_hdmi_jack_port_init(component, &card->dapm);
+}
+
+static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct hdmi_pcm *pcm;
+
+	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
+	if (!pcm)
+		return -ENOMEM;
+
+	pcm->device = dai->id;
+	pcm->codec_dai = dai;
+
+	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+
+	return 0;
+}
+
+/* Cometlake digital audio interface glue - connects codec <--> CPU */
+
+SND_SOC_DAILINK_DEF(ssp0_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
+SND_SOC_DAILINK_DEF(ssp0_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00",
+				CML_RT5682_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(ssp1_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
+SND_SOC_DAILINK_DEF(ssp1_codec,
+	DAILINK_COMP_ARRAY(
+	/* WL */ COMP_CODEC("i2c-10EC1015:00", CML_RT1015_CODEC_DAI),
+	/* WR */ COMP_CODEC("i2c-10EC1015:01", CML_RT1015_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(dmic_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
+
+SND_SOC_DAILINK_DEF(dmic16k_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
+
+SND_SOC_DAILINK_DEF(dmic_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
+
+SND_SOC_DAILINK_DEF(idisp1_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
+SND_SOC_DAILINK_DEF(idisp1_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
+
+SND_SOC_DAILINK_DEF(idisp2_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
+SND_SOC_DAILINK_DEF(idisp2_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
+
+SND_SOC_DAILINK_DEF(idisp3_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
+SND_SOC_DAILINK_DEF(idisp3_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
+
+static struct snd_soc_dai_link cml_rt1015_rt5682_dailink[] = {
+	/* Back End DAI links */
+	{
+		/* SSP0 - Codec */
+		.name = "SSP0-Codec",
+		.id = 0,
+		.init = cml_rt5682_codec_init,
+		.ignore_pmdown_time = 1,
+		.ops = &cml_rt5682_ops,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
+	},
+	{
+		.name = "dmic01",
+		.id = 1,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
+	},
+	{
+		.name = "dmic16k",
+		.id = 2,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
+	},
+	{
+		.name = "iDisp1",
+		.id = 3,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
+	},
+	{
+		.name = "iDisp2",
+		.id = 4,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
+	},
+	{
+		.name = "iDisp3",
+		.id = 5,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
+	},
+	{
+		/*
+		 * SSP1 - Codec : added to end of list ensuring
+		 * reuse of common topologies for other end points
+		 * and changing only SSP1's codec
+		 */
+		.name = "SSP1-Codec",
+		.id = 6,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1, /* Capture stream provides Feedback */
+		.no_pcm = 1,
+		.init = cml_rt1015_spk_init,
+		.ops = &cml_rt1015_ops,
+		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
+	},
+};
+
+static struct snd_soc_codec_conf rt1015_conf[] = {
+	{
+		.dev_name = "i2c-10EC1015:00",
+		.name_prefix = "WL",
+	},
+	{
+		.dev_name = "i2c-10EC1015:01",
+		.name_prefix = "WR",
+	},
+};
+
+/* Cometlake audio machine driver for RT1015 and RT5682 */
+static struct snd_soc_card snd_soc_card_cml = {
+	.name = "cml_rt1015_rt5682",
+	.dai_link = cml_rt1015_rt5682_dailink,
+	.num_links = ARRAY_SIZE(cml_rt1015_rt5682_dailink),
+	.codec_conf = rt1015_conf,
+	.num_configs = ARRAY_SIZE(rt1015_conf),
+	.dapm_widgets = cml_rt1015_rt5682_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cml_rt1015_rt5682_widgets),
+	.dapm_routes = cml_rt1015_rt5682_map,
+	.num_dapm_routes = ARRAY_SIZE(cml_rt1015_rt5682_map),
+	.controls = cml_controls,
+	.num_controls = ARRAY_SIZE(cml_controls),
+	.fully_routed = true,
+	.late_probe = sof_card_late_probe,
+};
+
+static int snd_cml_rt1015_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dai_link_component *rt1015_dais_components;
+	struct snd_soc_codec_conf *rt1015_dais_confs;
+	struct card_private *ctx;
+	struct snd_soc_acpi_mach *mach;
+	const char *platform_name;
+	int ret, i;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
+	if (!ctx)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
+	mach = (&pdev->dev)->platform_data;
+	snd_soc_card_cml.dev = &pdev->dev;
+	platform_name = mach->mach_params.platform;
+
+	dmi_check_system(sof_rt1015_quirk_table);
+
+	dev_info(&pdev->dev, "sof_rt1015_quirk = %lx\n", sof_rt1015_quirk);
+
+	if (sof_rt1015_quirk & (SOF_RT1015_SPEAKER_TL |
+				SOF_RT1015_SPEAKER_TR)) {
+		rt1015_dais_confs = devm_kzalloc(&pdev->dev,
+					sizeof(struct snd_soc_codec_conf) *
+					SPK_CH, GFP_KERNEL);
+
+		if (!rt1015_dais_confs)
+			return -ENOMEM;
+
+		rt1015_dais_components = devm_kzalloc(&pdev->dev,
+					sizeof(struct snd_soc_dai_link_component) *
+					SPK_CH, GFP_KERNEL);
+
+		if (!rt1015_dais_components)
+			return -ENOMEM;
+
+		for (i = 0; i < SPK_CH; i++) {
+			rt1015_dais_confs[i].dev_name = devm_kasprintf(&pdev->dev,
+								GFP_KERNEL,
+								"i2c-10EC1015:0%d",
+								i);
+
+			if (!rt1015_dais_confs[i].dev_name)
+				return -ENOMEM;
+
+			switch (i) {
+			case 0:
+				rt1015_dais_confs[i].name_prefix = "WL";
+				break;
+			case 1:
+				rt1015_dais_confs[i].name_prefix = "WR";
+				break;
+			case 2:
+				rt1015_dais_confs[i].name_prefix = "TL";
+				break;
+			case 3:
+				rt1015_dais_confs[i].name_prefix = "TR";
+				break;
+			default:
+				return -EINVAL;
+			}
+			rt1015_dais_components[i].name = devm_kasprintf(&pdev->dev,
+								GFP_KERNEL,
+								"i2c-10EC1015:0%d",
+								i);
+			if (!rt1015_dais_components[i].name)
+				return -ENOMEM;
+
+			rt1015_dais_components[i].dai_name = CML_RT1015_CODEC_DAI;
+		}
+
+		snd_soc_card_cml.codec_conf = rt1015_dais_confs;
+		snd_soc_card_cml.num_configs = SPK_CH;
+
+		for (i = 0; i < ARRAY_SIZE(cml_rt1015_rt5682_dailink); i++) {
+			if (!strcmp(cml_rt1015_rt5682_dailink[i].codecs->dai_name,
+					CML_RT1015_CODEC_DAI)) {
+				cml_rt1015_rt5682_dailink[i].codecs = rt1015_dais_components;
+				cml_rt1015_rt5682_dailink[i].num_codecs = SPK_CH;
+			}
+		}
+	}
+
+	/* set platform name for each dailink */
+	ret = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cml,
+						    platform_name);
+	if (ret)
+		return ret;
+	snd_soc_card_set_drvdata(&snd_soc_card_cml, ctx);
+
+	return devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cml);
+}
+
+static struct platform_driver snd_cml_rt1015_rt5682_driver = {
+	.probe = snd_cml_rt1015_probe,
+	.driver = {
+		.name = "cml_rt1015_rt5682",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(snd_cml_rt1015_rt5682_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("Cometlake Audio Machine driver - RT1015 and RT5682 in I2S mode");
+MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
+MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
+MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:cml_rt1015_rt5682");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index b80f032a..4f99da8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -23,6 +23,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_fw_filename = "sof-cnl.ri",
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
+	{
+		.id = "10EC1015",
+		.drv_name = "cml_rt1015_rt5682",
+		.quirk_data = &cml_codecs,
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-rt1015-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_machines);
-- 
2.7.4


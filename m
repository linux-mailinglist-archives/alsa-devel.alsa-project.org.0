Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7220BEA9
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 06:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EFEF1691;
	Sat, 27 Jun 2020 06:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EFEF1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593233987;
	bh=hMrkIoGmmPn/GyAZUnKoPmb4ibU4C2kg/FgiJFOEAQU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GqxkrpXGak1KnYbx5lZcoRIQu6SxhvvSciHvHjgot+fBBzTpLGVp/lPN60D9pwXHj
	 uZcg2GCFzTmkFj15HN1O0jcoa0W0Ko5nSTGxWRO4EaDnsWIZmk3bHnc4vhxmWbRIx+
	 aGnThph1tNshaLkBM97wgKcARjCynD7iyVmOgxIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21162F802FF;
	Sat, 27 Jun 2020 06:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 476F3F802FD; Sat, 27 Jun 2020 06:54:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B275AF802EB
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B275AF802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="MRfevZ2J"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d0e90000>; Fri, 26 Jun 2020 21:54:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:54:48 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:54:48 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:54:48 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:54:48 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d1130000>; Fri, 26 Jun 2020 21:54:48 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 06/23] ASoC: tegra: Add Tegra186 based DSPK driver
Date: Sat, 27 Jun 2020 10:23:28 +0530
Message-ID: <1593233625-14961-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233641; bh=Z2TKlUFBrxc1uoOCwyl6Tf7pUqj9araJX8OZ8v6RwgM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=MRfevZ2JgpownbGdIA5LCvMwP2+bQFdVxtjh94nzUMdcbhcDHVvMZe707Bq3+QqiC
 ckEZG708XtTP96LpGPYVDJhFOL0nsdTTsv2m58kAB1B5g2OlWCZErj3jyyBZ9pAA1/
 QEnRfeGqgSWhJ+5HKpl4CSQwty/Qo/XbX7v7w7g+jdfNAUyN6ZyzBt1vzMjdlQ7uAw
 QWgZi3QcAWVt4AGzlxDfUKUaHl3p3ro9LXBvrttJShQH45WxyrxeKCceIRWG1/+zN+
 qw0//IUWfRU6P/hbUcakW2SC+P3TdmmBHZ/dW8gYaWeN7WxpqP8RUnDP8g4rmhjHMc
 HkfuAjOoJd4/Q==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

The Digital Speaker Controller (DSPK) converts the multi-bit Pulse Code
Modulation (PCM) audio input to oversampled 1-bit Pulse Density Modulation
(PDM) output. From the signal flow perpsective, the DSPK can be viewed as
a PDM transmitter that up-samples the input to the desired sampling rate
by interpolation then converts the oversampled PCM input to the desired
1-bit output via Delta Sigma Modulation (DSM).

This patch registers DSPK component with ASoC framework. The component
driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
driver exposes DSPK interfaces, which can be used to connect different
components in the ASoC layer. Makefile and Kconfig support is added to
allow to build the driver. The DSPK devices can be enabled in the DT via
"nvidia,tegra186-dspk" compatible binding. This driver can be used
on Tegra194 chip as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig         |  13 ++
 sound/soc/tegra/Makefile        |   2 +
 sound/soc/tegra/tegra186_dspk.c | 427 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra186_dspk.h |  70 +++++++
 4 files changed, 512 insertions(+)
 create mode 100644 sound/soc/tegra/tegra186_dspk.c
 create mode 100644 sound/soc/tegra/tegra186_dspk.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 3166d03..63d5ae9 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -93,6 +93,19 @@ config SND_SOC_TEGRA210_I2S
           compatible devices.
           Say Y or M if you want to add support for Tegra210 I2S module.
 
+config SND_SOC_TEGRA186_DSPK
+	tristate "Tegra186 DSPK module"
+	depends on SND_SOC_TEGRA
+	help
+	  Config to enable the Digital Speaker Controller (DSPK) which
+	  converts the multi-bit Pulse Code Modulation (PCM) audio input to
+	  oversampled 1-bit Pulse Density Modulation (PDM) output. From the
+	  signal flow perspective DSPK can be viewed as a PDM transmitter
+	  that up-samples the input to the desired sampling rate by
+	  interpolation and then converts the oversampled PCM input to
+	  the desired 1-bit output via Delta Sigma Modulation (DSM).
+	  Say Y or M if you want to add support for Tegra186 DSPK module.
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on SND_SOC_TEGRA && I2C && GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index b01d88e..336c4c7 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -11,6 +11,7 @@ snd-soc-tegra30-i2s-objs := tegra30_i2s.o
 snd-soc-tegra210-ahub-objs := tegra210_ahub.o
 snd-soc-tegra210-dmic-objs := tegra210_dmic.o
 snd-soc-tegra210-i2s-objs := tegra210_i2s.o
+snd-soc-tegra186-dspk-objs := tegra186_dspk.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
@@ -23,6 +24,7 @@ obj-$(CONFIG_SND_SOC_TEGRA30_I2S) += snd-soc-tegra30-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA210_DMIC) += snd-soc-tegra210-dmic.o
 obj-$(CONFIG_SND_SOC_TEGRA210_AHUB) += snd-soc-tegra210-ahub.o
 obj-$(CONFIG_SND_SOC_TEGRA210_I2S) += snd-soc-tegra210-i2s.o
+obj-$(CONFIG_SND_SOC_TEGRA186_DSPK) += snd-soc-tegra186-dspk.o
 
 # Tegra machine Support
 snd-soc-tegra-rt5640-objs := tegra_rt5640.o
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
new file mode 100644
index 0000000..d74aec8
--- /dev/null
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra186_dspk.c - Tegra186 DSPK driver
+//
+// Copyright (c) 2020 NVIDIA CORPORATION. All rights reserved.
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "tegra186_dspk.h"
+#include "tegra_cif.h"
+
+static const struct reg_default tegra186_dspk_reg_defaults[] = {
+	{ TEGRA186_DSPK_RX_INT_MASK, 0x00000007 },
+	{ TEGRA186_DSPK_RX_CIF_CTRL, 0x00007700 },
+	{ TEGRA186_DSPK_CG,	     0x00000001 },
+	{ TEGRA186_DSPK_CORE_CTRL,   0x00000310 },
+	{ TEGRA186_DSPK_CODEC_CTRL,  0x03000000 },
+};
+
+static int tegra186_dspk_get_control(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+
+	if (strstr(kcontrol->id.name, "FIFO Threshold"))
+		ucontrol->value.integer.value[0] = dspk->rx_fifo_th;
+	else if (strstr(kcontrol->id.name, "OSR Value"))
+		ucontrol->value.integer.value[0] = dspk->osr_val;
+	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
+		ucontrol->value.integer.value[0] = dspk->lrsel;
+	else if (strstr(kcontrol->id.name, "Channel Select"))
+		ucontrol->value.integer.value[0] = dspk->ch_sel;
+	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
+		ucontrol->value.integer.value[0] = dspk->mono_to_stereo;
+	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
+		ucontrol->value.integer.value[0] = dspk->stereo_to_mono;
+
+	return 0;
+}
+
+static int tegra186_dspk_put_control(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+	int val = ucontrol->value.integer.value[0];
+
+	if (strstr(kcontrol->id.name, "FIFO Threshold"))
+		dspk->rx_fifo_th = val;
+	else if (strstr(kcontrol->id.name, "OSR Value"))
+		dspk->osr_val = val;
+	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
+		dspk->lrsel = val;
+	else if (strstr(kcontrol->id.name, "Channel Select"))
+		dspk->ch_sel = val;
+	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
+		dspk->mono_to_stereo = val;
+	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
+		dspk->stereo_to_mono = val;
+
+	return 0;
+}
+
+static int tegra186_dspk_runtime_suspend(struct device *dev)
+{
+	struct tegra186_dspk *dspk = dev_get_drvdata(dev);
+
+	regcache_cache_only(dspk->regmap, true);
+	regcache_mark_dirty(dspk->regmap);
+
+	clk_disable_unprepare(dspk->clk_dspk);
+
+	return 0;
+}
+
+static int tegra186_dspk_runtime_resume(struct device *dev)
+{
+	struct tegra186_dspk *dspk = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(dspk->clk_dspk);
+	if (err) {
+		dev_err(dev, "failed to enable DSPK clock, err: %d\n", err);
+		return err;
+	}
+
+	regcache_cache_only(dspk->regmap, false);
+	regcache_sync(dspk->regmap);
+
+	return 0;
+}
+
+static int tegra186_dspk_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct tegra186_dspk *dspk = snd_soc_dai_get_drvdata(dai);
+	unsigned int channels, srate, dspk_clk;
+	struct device *dev = dai->dev;
+	struct tegra_cif_conf cif_conf;
+	unsigned int max_th;
+	int err;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	channels = params_channels(params);
+	cif_conf.audio_ch = channels;
+
+	/* Client channel */
+	switch (dspk->ch_sel) {
+	case DSPK_CH_SELECT_LEFT:
+	case DSPK_CH_SELECT_RIGHT:
+		cif_conf.client_ch = 1;
+		break;
+	case DSPK_CH_SELECT_STEREO:
+		cif_conf.client_ch = 2;
+		break;
+	default:
+		dev_err(dev, "Invalid DSPK client channels\n");
+		return -EINVAL;
+	}
+
+	cif_conf.client_bits = TEGRA_ACIF_BITS_24;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
+		break;
+	default:
+		dev_err(dev, "unsupported format!\n");
+		return -EOPNOTSUPP;
+	}
+
+	srate = params_rate(params);
+
+	/* RX FIFO threshold in terms of frames */
+	max_th = (TEGRA186_DSPK_RX_FIFO_DEPTH / cif_conf.audio_ch) - 1;
+
+	if (dspk->rx_fifo_th > max_th)
+		dspk->rx_fifo_th = max_th;
+
+	cif_conf.threshold = dspk->rx_fifo_th;
+	cif_conf.mono_conv = dspk->mono_to_stereo;
+	cif_conf.stereo_conv = dspk->stereo_to_mono;
+
+	tegra_set_cif(dspk->regmap, TEGRA186_DSPK_RX_CIF_CTRL,
+		      &cif_conf);
+
+	/*
+	 * DSPK clock and PDM codec clock should be synchronous with 4:1 ratio,
+	 * this is because it takes 4 clock cycles to send out one sample to
+	 * codec by sigma delta modulator. Finally the clock rate is a multiple
+	 * of 'Over Sampling Ratio', 'Sample Rate' and 'Interface Clock Ratio'.
+	 */
+	dspk_clk = (DSPK_OSR_FACTOR << dspk->osr_val) * srate * DSPK_CLK_RATIO;
+
+	err = clk_set_rate(dspk->clk_dspk, dspk_clk);
+	if (err) {
+		dev_err(dev, "can't set DSPK clock rate %u, err: %d\n",
+			dspk_clk, err);
+
+		return err;
+	}
+
+	regmap_update_bits(dspk->regmap,
+			   /* Reg */
+			   TEGRA186_DSPK_CORE_CTRL,
+			   /* Mask */
+			   TEGRA186_DSPK_OSR_MASK |
+			   TEGRA186_DSPK_CHANNEL_SELECT_MASK |
+			   TEGRA186_DSPK_CTRL_LRSEL_POLARITY_MASK,
+			   /* Value */
+			   (dspk->osr_val << DSPK_OSR_SHIFT) |
+			   ((dspk->ch_sel + 1) << CH_SEL_SHIFT) |
+			   (dspk->lrsel << LRSEL_POL_SHIFT));
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops tegra186_dspk_dai_ops = {
+	.hw_params	= tegra186_dspk_hw_params,
+};
+
+static struct snd_soc_dai_driver tegra186_dspk_dais[] = {
+	{
+	    .name = "DSPK",
+	    .playback = {
+		.stream_name = "Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE |
+			   SNDRV_PCM_FMTBIT_S32_LE,
+	    },
+	    .ops = &tegra186_dspk_dai_ops,
+	    .symmetric_rates = 1,
+	},
+};
+
+static const struct snd_soc_dapm_widget tegra186_dspk_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX", NULL, 0, TEGRA186_DSPK_ENABLE, 0, 0),
+};
+
+static const struct snd_soc_dapm_route tegra186_dspk_routes[] = {
+	{ "RX",		NULL, "XBAR-TX" },
+	{ "Playback",	NULL, "RX" },
+};
+
+static const char * const tegra186_dspk_ch_sel_text[] = {
+	"Left", "Right", "Stereo",
+};
+
+static const struct soc_enum tegra186_dspk_ch_sel_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tegra186_dspk_ch_sel_text),
+			tegra186_dspk_ch_sel_text);
+
+static const char * const tegra186_dspk_osr_text[] = {
+	"OSR_32", "OSR_64", "OSR_128", "OSR_256",
+};
+
+static const struct soc_enum tegra186_dspk_osr_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tegra186_dspk_osr_text),
+			tegra186_dspk_osr_text);
+
+static const char * const tegra186_dspk_lrsel_text[] = {
+	"Left", "Right",
+};
+
+static const char * const tegra186_dspk_mono_conv_text[] = {
+	"Zero", "Copy",
+};
+
+static const struct soc_enum tegra186_dspk_mono_conv_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0,
+			ARRAY_SIZE(tegra186_dspk_mono_conv_text),
+			tegra186_dspk_mono_conv_text);
+
+static const char * const tegra186_dspk_stereo_conv_text[] = {
+	"CH0", "CH1", "AVG",
+};
+
+static const struct soc_enum tegra186_dspk_stereo_conv_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0,
+			ARRAY_SIZE(tegra186_dspk_stereo_conv_text),
+			tegra186_dspk_stereo_conv_text);
+
+static const struct soc_enum tegra186_dspk_lrsel_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tegra186_dspk_lrsel_text),
+			tegra186_dspk_lrsel_text);
+
+static const struct snd_kcontrol_new tegrat186_dspk_controls[] = {
+	SOC_SINGLE_EXT("FIFO Threshold", SND_SOC_NOPM, 0,
+		       TEGRA186_DSPK_RX_FIFO_DEPTH - 1, 0,
+		       tegra186_dspk_get_control, tegra186_dspk_put_control),
+	SOC_ENUM_EXT("OSR Value", tegra186_dspk_osr_enum,
+		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+	SOC_ENUM_EXT("LR Polarity Select", tegra186_dspk_lrsel_enum,
+		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+	SOC_ENUM_EXT("Channel Select", tegra186_dspk_ch_sel_enum,
+		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+	SOC_ENUM_EXT("Mono To Stereo", tegra186_dspk_mono_conv_enum,
+		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+	SOC_ENUM_EXT("Stereo To Mono", tegra186_dspk_stereo_conv_enum,
+		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+};
+
+static const struct snd_soc_component_driver tegra186_dspk_cmpnt = {
+	.dapm_widgets = tegra186_dspk_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tegra186_dspk_widgets),
+	.dapm_routes = tegra186_dspk_routes,
+	.num_dapm_routes = ARRAY_SIZE(tegra186_dspk_routes),
+	.controls = tegrat186_dspk_controls,
+	.num_controls = ARRAY_SIZE(tegrat186_dspk_controls),
+};
+
+static bool tegra186_dspk_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA186_DSPK_RX_INT_MASK ... TEGRA186_DSPK_RX_CIF_CTRL:
+	case TEGRA186_DSPK_ENABLE ... TEGRA186_DSPK_CG:
+	case TEGRA186_DSPK_CORE_CTRL ... TEGRA186_DSPK_CODEC_CTRL:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra186_dspk_rd_reg(struct device *dev, unsigned int reg)
+{
+	if (tegra186_dspk_wr_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case TEGRA186_DSPK_RX_STATUS:
+	case TEGRA186_DSPK_RX_INT_STATUS:
+	case TEGRA186_DSPK_STATUS:
+	case TEGRA186_DSPK_INT_STATUS:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra186_dspk_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA186_DSPK_RX_STATUS:
+	case TEGRA186_DSPK_RX_INT_STATUS:
+	case TEGRA186_DSPK_STATUS:
+	case TEGRA186_DSPK_INT_STATUS:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config tegra186_dspk_regmap = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA186_DSPK_CODEC_CTRL,
+	.writeable_reg		= tegra186_dspk_wr_reg,
+	.readable_reg		= tegra186_dspk_rd_reg,
+	.volatile_reg		= tegra186_dspk_volatile_reg,
+	.reg_defaults		= tegra186_dspk_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra186_dspk_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct of_device_id tegra186_dspk_of_match[] = {
+	{ .compatible = "nvidia,tegra186-dspk" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra186_dspk_of_match);
+
+static int tegra186_dspk_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra186_dspk *dspk;
+	void __iomem *regs;
+	int err;
+
+	dspk = devm_kzalloc(dev, sizeof(*dspk), GFP_KERNEL);
+	if (!dspk)
+		return -ENOMEM;
+
+	dspk->osr_val = DSPK_OSR_64;
+	dspk->lrsel = DSPK_LRSEL_LEFT;
+	dspk->ch_sel = DSPK_CH_SELECT_STEREO;
+	dspk->mono_to_stereo = 0; /* "Zero" */
+
+	dev_set_drvdata(dev, dspk);
+
+	dspk->clk_dspk = devm_clk_get(dev, "dspk");
+	if (IS_ERR(dspk->clk_dspk)) {
+		dev_err(dev, "can't retrieve DSPK clock\n");
+		return PTR_ERR(dspk->clk_dspk);
+	}
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	dspk->regmap = devm_regmap_init_mmio(dev, regs, &tegra186_dspk_regmap);
+	if (IS_ERR(dspk->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(dspk->regmap);
+	}
+
+	regcache_cache_only(dspk->regmap, true);
+
+	err = devm_snd_soc_register_component(dev, &tegra186_dspk_cmpnt,
+					      tegra186_dspk_dais,
+					      ARRAY_SIZE(tegra186_dspk_dais));
+	if (err) {
+		dev_err(dev, "can't register DSPK component, err: %d\n",
+			err);
+		return err;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int tegra186_dspk_platform_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra186_dspk_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra186_dspk_runtime_suspend,
+			   tegra186_dspk_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra186_dspk_driver = {
+	.driver = {
+		.name = "tegra186-dspk",
+		.of_match_table = tegra186_dspk_of_match,
+		.pm = &tegra186_dspk_pm_ops,
+	},
+	.probe = tegra186_dspk_platform_probe,
+	.remove = tegra186_dspk_platform_remove,
+};
+module_platform_driver(tegra186_dspk_driver);
+
+MODULE_AUTHOR("Mohan Kumar <mkumard@nvidia.com>");
+MODULE_AUTHOR("Sameer Pujar <spujar@nvidia.com>");
+MODULE_DESCRIPTION("Tegra186 ASoC DSPK driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra186_dspk.h b/sound/soc/tegra/tegra186_dspk.h
new file mode 100644
index 0000000..b2a87906
--- /dev/null
+++ b/sound/soc/tegra/tegra186_dspk.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra186_dspk.h - Definitions for Tegra186 DSPK driver
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION. All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA186_DSPK_H__
+#define __TEGRA186_DSPK_H__
+
+/* Register offsets from DSPK BASE */
+#define TEGRA186_DSPK_RX_STATUS			0x0c
+#define TEGRA186_DSPK_RX_INT_STATUS		0x10
+#define TEGRA186_DSPK_RX_INT_MASK		0x14
+#define TEGRA186_DSPK_RX_INT_SET		0x18
+#define TEGRA186_DSPK_RX_INT_CLEAR		0x1c
+#define TEGRA186_DSPK_RX_CIF_CTRL		0x20
+#define TEGRA186_DSPK_ENABLE			0x40
+#define TEGRA186_DSPK_SOFT_RESET		0x44
+#define TEGRA186_DSPK_CG			0x48
+#define TEGRA186_DSPK_STATUS			0x4c
+#define TEGRA186_DSPK_INT_STATUS		0x50
+#define TEGRA186_DSPK_CORE_CTRL			0x60
+#define TEGRA186_DSPK_CODEC_CTRL		0x64
+
+/* DSPK CORE CONTROL fields */
+#define CH_SEL_SHIFT				8
+#define TEGRA186_DSPK_CHANNEL_SELECT_MASK	(0x3 << CH_SEL_SHIFT)
+#define DSPK_OSR_SHIFT				4
+#define TEGRA186_DSPK_OSR_MASK			(0x3 << DSPK_OSR_SHIFT)
+#define LRSEL_POL_SHIFT				0
+#define TEGRA186_DSPK_CTRL_LRSEL_POLARITY_MASK	(0x1 << LRSEL_POL_SHIFT)
+#define TEGRA186_DSPK_RX_FIFO_DEPTH		64
+
+#define DSPK_OSR_FACTOR				32
+
+/* DSPK interface clock ratio */
+#define DSPK_CLK_RATIO				4
+
+enum tegra_dspk_osr {
+	DSPK_OSR_32,
+	DSPK_OSR_64,
+	DSPK_OSR_128,
+	DSPK_OSR_256,
+};
+
+enum tegra_dspk_ch_sel {
+	DSPK_CH_SELECT_LEFT,
+	DSPK_CH_SELECT_RIGHT,
+	DSPK_CH_SELECT_STEREO,
+};
+
+enum tegra_dspk_lrsel {
+	DSPK_LRSEL_LEFT,
+	DSPK_LRSEL_RIGHT,
+};
+
+struct tegra186_dspk {
+	unsigned int rx_fifo_th;
+	unsigned int osr_val;
+	unsigned int lrsel;
+	unsigned int ch_sel;
+	unsigned int mono_to_stereo;
+	unsigned int stereo_to_mono;
+	struct clk *clk_dspk;
+	struct regmap *regmap;
+};
+
+#endif
-- 
2.7.4


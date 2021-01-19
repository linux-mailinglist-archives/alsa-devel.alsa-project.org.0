Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B462FB4E6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 10:31:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 467551889;
	Tue, 19 Jan 2021 10:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 467551889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611048717;
	bh=R1tPE5Atsd4uoeWfeIVUYpmhbG1Ul9Uubk+aZomNu8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uXUjYGC6RCQdqOpEFMlpH/DSPUdHLqh1STQAaGbJS3jGxbW4KvVTrHcf0dXlqv4J/
	 yPUkF1LZqNbm6u2yWpVQboPJAd8E96zAN4y7Egh/0Qhh9UQnE4STx/FN9p5mit52ju
	 uNklInPPxosCQqciOLWG8FMybLcpyhE8tT8yM8MY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF331F804C3;
	Tue, 19 Jan 2021 10:29:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE4FBF8027D; Tue, 19 Jan 2021 10:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8315F80255
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 10:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8315F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="m9vW/HRM"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6006a6500001>; Tue, 19 Jan 2021 01:28:48 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 09:28:48 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 09:28:44 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [RESEND PATCH v6 3/6] ASoC: tegra: Add audio graph based card driver
Date: Tue, 19 Jan 2021 14:58:13 +0530
Message-ID: <1611048496-24650-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611048528; bh=myn0avhGV8FRG9HA6zQNhSBQW8UTjpYuBexd3sk0A6w=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=m9vW/HRMemRjp1mhm0Ecz/1Mc58eAxzpOdprgp43gUQ79Tq9gw3dtmA8Jk942JM6l
 SSKXnOTC/AIL43KsOBNRurynZRs86/C1ii9o+xKAEhqPUk5wJap3PfaHq9bibT8kOf
 jeYuQmfF0oalJ93Qy2eTJNT+XGXbBP3GZfWEiAJA+DYZ3qtM7DldMksNMDqgvMVMoz
 0EcFR4LO3BieeVY78GnSCnBMq9doU+WyINnNpjhKoY3rgx/HcBbUC3tPv67h6gO4vu
 exT1fyuzO9laGOq+95xhdFIEOE5SKsibmESQ4mDZUGr2/kScX4CSbExYtv8HRhQn8h
 WTa9XYHKCecwQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org
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

Add Tegra audio machine driver which is based on generic audio graph card
driver. It re-uses most of the common stuff from audio graph driver and
uses the same DT binding. Required Tegra specific customizations are done
in the driver and additional DT bindings are required for clock handling.

Details on the customizations done:

 - Update PLL rates at runtime: Tegra HW supports multiple sample rates
   (multiples of 8x and 11.025x) and both of these groups require different
   PLL rates. Hence there is a requirement to update this at runtime.
   This is achieved by providing a custom 'snd_soc_ops' and in hw_param()
   callback PLL rate is updated as per the sample rate.

 - Internal structure 'tegra_audio_graph_data' is used to maintain clock
   handles of PLL.

 - The 'force_dpcm' flag is set to use DPCM for all DAI links.

 - The 'component_chaining' flag is set to use DPCM with component model.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/tegra/Kconfig                  |   9 ++
 sound/soc/tegra/Makefile                 |   2 +
 sound/soc/tegra/tegra_audio_graph_card.c | 251 +++++++++++++++++++++++++++++++
 3 files changed, 262 insertions(+)
 create mode 100644 sound/soc/tegra/tegra_audio_graph_card.c

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index a62cc87..6dc83ad 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -117,6 +117,15 @@ config SND_SOC_TEGRA210_ADMAIF
 	  channel. Buffer size is configurable for each ADMAIIF channel.
 	  Say Y or M if you want to add support for Tegra210 ADMAIF module.
 
+config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
+	tristate "Audio Graph Card based Tegra driver"
+	depends on SND_AUDIO_GRAPH_CARD
+	help
+	  Config to enable Tegra audio machine driver based on generic
+	  audio graph driver. It is a thin driver written to customize
+	  few things for Tegra audio. Most of the code is re-used from
+	  audio graph driver and the same DT bindings are used.
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on SND_SOC_TEGRA && I2C && GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 60040a0..b17dd6e 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -38,6 +38,7 @@ snd-soc-tegra-trimslice-objs := trimslice.o
 snd-soc-tegra-alc5632-objs := tegra_alc5632.o
 snd-soc-tegra-max98090-objs := tegra_max98090.o
 snd-soc-tegra-sgtl5000-objs := tegra_sgtl5000.o
+snd-soc-tegra-audio-graph-card-objs := tegra_audio_graph_card.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_RT5640) += snd-soc-tegra-rt5640.o
 obj-$(CONFIG_SND_SOC_TEGRA_RT5677) += snd-soc-tegra-rt5677.o
@@ -48,3 +49,4 @@ obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
 obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
 obj-$(CONFIG_SND_SOC_TEGRA_MAX98090) += snd-soc-tegra-max98090.o
 obj-$(CONFIG_SND_SOC_TEGRA_SGTL5000) += snd-soc-tegra-sgtl5000.o
+obj-$(CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD) += snd-soc-tegra-audio-graph-card.o
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
new file mode 100644
index 0000000..9e43f16
--- /dev/null
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra_audio_graph_card.c - Audio Graph based Tegra Machine Driver
+//
+// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/graph_card.h>
+#include <sound/pcm_params.h>
+
+#define MAX_PLLA_OUT0_DIV 128
+
+#define simple_to_tegra_priv(simple) \
+		container_of(simple, struct tegra_audio_priv, simple)
+
+enum srate_type {
+	/*
+	 * Sample rates multiple of 8000 Hz and below are supported:
+	 * ( 8000, 16000, 32000, 48000, 96000, 192000 Hz )
+	 */
+	x8_RATE,
+
+	/*
+	 * Sample rates multiple of 11025 Hz and below are supported:
+	 * ( 11025, 22050, 44100, 88200, 176400 Hz )
+	 */
+	x11_RATE,
+
+	NUM_RATE_TYPE,
+};
+
+struct tegra_audio_priv {
+	struct asoc_simple_priv simple;
+	struct clk *clk_plla_out0;
+	struct clk *clk_plla;
+};
+
+/* Tegra audio chip data */
+struct tegra_audio_cdata {
+	unsigned int plla_rates[NUM_RATE_TYPE];
+	unsigned int plla_out0_rates[NUM_RATE_TYPE];
+};
+
+/* Setup PLL clock as per the given sample rate */
+static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct asoc_simple_priv *simple = snd_soc_card_get_drvdata(rtd->card);
+	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
+	struct device *dev = rtd->card->dev;
+	const struct tegra_audio_cdata *data = of_device_get_match_data(dev);
+	unsigned int plla_rate, plla_out0_rate, bclk;
+	unsigned int srate = params_rate(params);
+	int err;
+
+	switch (srate) {
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+	case 176400:
+		plla_out0_rate = data->plla_out0_rates[x11_RATE];
+		plla_rate = data->plla_rates[x11_RATE];
+		break;
+	case 8000:
+	case 16000:
+	case 32000:
+	case 48000:
+	case 96000:
+	case 192000:
+		plla_out0_rate = data->plla_out0_rates[x8_RATE];
+		plla_rate = data->plla_rates[x8_RATE];
+		break;
+	default:
+		dev_err(rtd->card->dev, "Unsupported sample rate %u\n",
+			srate);
+		return -EINVAL;
+	}
+
+	/*
+	 * Below is the clock relation:
+	 *
+	 *	PLLA
+	 *	  |
+	 *	  |--> PLLA_OUT0
+	 *		  |
+	 *		  |---> I2S modules
+	 *		  |
+	 *		  |---> DMIC modules
+	 *		  |
+	 *		  |---> DSPK modules
+	 *
+	 *
+	 * Default PLLA_OUT0 rate might be too high when I/O is running
+	 * at minimum PCM configurations. This may result in incorrect
+	 * clock rates and glitchy audio. The maximum divider is 128
+	 * and any thing higher than that won't work. Thus reduce PLLA_OUT0
+	 * to work for lower configurations.
+	 *
+	 * This problem is seen for I2S only, as DMIC and DSPK minimum
+	 * clock requirements are under allowed divider limits.
+	 */
+	bclk = srate * params_channels(params) * params_width(params);
+	if (div_u64(plla_out0_rate, bclk) > MAX_PLLA_OUT0_DIV)
+		plla_out0_rate >>= 1;
+
+	dev_dbg(rtd->card->dev,
+		"Update clock rates: PLLA(= %u Hz) and PLLA_OUT0(= %u Hz)\n",
+		plla_rate, plla_out0_rate);
+
+	/* Set PLLA rate */
+	err = clk_set_rate(priv->clk_plla, plla_rate);
+	if (err) {
+		dev_err(rtd->card->dev,
+			"Can't set plla rate for %u, err: %d\n",
+			plla_rate, err);
+		return err;
+	}
+
+	/* Set PLLA_OUT0 rate */
+	err = clk_set_rate(priv->clk_plla_out0, plla_out0_rate);
+	if (err) {
+		dev_err(rtd->card->dev,
+			"Can't set plla_out0 rate %u, err: %d\n",
+			plla_out0_rate, err);
+		return err;
+	}
+
+	return err;
+}
+
+static int tegra_audio_graph_hw_params(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int err;
+
+	/*
+	 * This gets called for each DAI link (FE or BE) when DPCM is used.
+	 * We may not want to update PLLA rate for each call. So PLLA update
+	 * must be restricted to external I/O links (I2S, DMIC or DSPK) since
+	 * they actually depend on it. I/O modules update their clocks in
+	 * hw_param() of their respective component driver and PLLA rate
+	 * update here helps them to derive appropriate rates.
+	 *
+	 * TODO: When more HW accelerators get added (like sample rate
+	 * converter, volume gain controller etc., which don't really
+	 * depend on PLLA) we need a better way to filter here.
+	 */
+	if (cpu_dai->driver->ops && rtd->dai_link->no_pcm) {
+		err = tegra_audio_graph_update_pll(substream, params);
+		if (err)
+			return err;
+	}
+
+	return asoc_simple_hw_params(substream, params);
+}
+
+static const struct snd_soc_ops tegra_audio_graph_ops = {
+	.startup	= asoc_simple_startup,
+	.shutdown	= asoc_simple_shutdown,
+	.hw_params	= tegra_audio_graph_hw_params,
+};
+
+static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
+{
+	struct asoc_simple_priv *simple = snd_soc_card_get_drvdata(card);
+	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
+
+	priv->clk_plla = devm_clk_get(card->dev, "pll_a");
+	if (IS_ERR(priv->clk_plla)) {
+		dev_err(card->dev, "Can't retrieve clk pll_a\n");
+		return PTR_ERR(priv->clk_plla);
+	}
+
+	priv->clk_plla_out0 = devm_clk_get(card->dev, "plla_out0");
+	if (IS_ERR(priv->clk_plla_out0)) {
+		dev_err(card->dev, "Can't retrieve clk plla_out0\n");
+		return PTR_ERR(priv->clk_plla_out0);
+	}
+
+	return graph_card_probe(card);
+}
+
+static int tegra_audio_graph_probe(struct platform_device *pdev)
+{
+	struct tegra_audio_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct snd_soc_card *card;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	card = simple_priv_to_card(&priv->simple);
+
+	card->probe = tegra_audio_graph_card_probe;
+
+	/* graph_parse_of() depends on below */
+	card->component_chaining = 1;
+	priv->simple.ops = &tegra_audio_graph_ops;
+	priv->simple.force_dpcm = 1;
+
+	return graph_parse_of(&priv->simple, dev);
+}
+
+static const struct tegra_audio_cdata tegra210_data = {
+	/* PLLA */
+	.plla_rates[x8_RATE] = 368640000,
+	.plla_rates[x11_RATE] = 338688000,
+	/* PLLA_OUT0 */
+	.plla_out0_rates[x8_RATE] = 49152000,
+	.plla_out0_rates[x11_RATE] = 45158400,
+};
+
+static const struct tegra_audio_cdata tegra186_data = {
+	/* PLLA */
+	.plla_rates[x8_RATE] = 245760000,
+	.plla_rates[x11_RATE] = 270950400,
+	/* PLLA_OUT0 */
+	.plla_out0_rates[x8_RATE] = 49152000,
+	.plla_out0_rates[x11_RATE] = 45158400,
+};
+
+static const struct of_device_id graph_of_tegra_match[] = {
+	{ .compatible = "nvidia,tegra210-audio-graph-card",
+	  .data = &tegra210_data },
+	{ .compatible = "nvidia,tegra186-audio-graph-card",
+	  .data = &tegra186_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, graph_of_tegra_match);
+
+static struct platform_driver tegra_audio_graph_card = {
+	.driver = {
+		.name = "tegra-audio-graph-card",
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = graph_of_tegra_match,
+	},
+	.probe = tegra_audio_graph_probe,
+};
+module_platform_driver(tegra_audio_graph_card);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("ASoC Tegra Audio Graph Sound Card");
+MODULE_AUTHOR("Sameer Pujar <spujar@nvidia.com>");
-- 
2.7.4


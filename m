Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 594A614D925
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 11:38:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1CFA166C;
	Thu, 30 Jan 2020 11:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1CFA166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580380704;
	bh=BXJ4djHI54HIZlmLDzlOjqRHy6ZboU43VBjyAujlJaQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XOc5Ou3QRtlca+3poKY+rzjZ084gTlqOm7hqVXJ4GeDFsluQYDAdxKxoqbcCzkP3d
	 aFaS/YJ9vXiZss6nvYiovfX/Z14ArpgmfjAPeneB9Kciay8a972q3nHfvR88Ul22yg
	 eQKOKdzc6B8mihAXj1K78kQZHlvaTdqhOweYZJSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A10F3F802A0;
	Thu, 30 Jan 2020 11:34:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EAA7F80291; Thu, 30 Jan 2020 11:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA8E7F8028D
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 11:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA8E7F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="LhbMR6W4"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e32b11d0000>; Thu, 30 Jan 2020 02:34:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Jan 2020 02:34:25 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 02:34:25 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 10:34:25 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 Jan 2020 10:34:25 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e32b12c0003>; Thu, 30 Jan 2020 02:34:24 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
Date: Thu, 30 Jan 2020 16:03:37 +0530
Message-ID: <1580380422-3431-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580380445; bh=agf6vfLRgf4f/8+lOFe4hibnoE8//UC6tTN7IAOSwzM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=LhbMR6W4fLgdto8Xa7pIPLTvLHQSk5vmPiAh9B3RGnVt6IbrCiBZ0WrAsx7WJ9hAN
 nuOsFw/9U2UkkdBT8EiLia65Py6ZPX3dMW0EZSI4UxCnq9a1AzqGEKrwh3p46Tn7oD
 KO7xax2bAcAWtTAQuvD70hF203P8vam8KrDp9jvjz7imIEdW7hvxo/KLM0R1nfOiu6
 o14z/7yyWJEefguB5HAsQNiRCu4Ilb4sRVpQdjFb6oqShsChIIOsd0Dc6ZkwTMINGD
 UyzL1/CLLqQXV2w88YphqG7R2V2+jXxIeJ4ricZLdF/ilBC2Zv0LyNziWCjpXUJDhy
 at5lVQZpWYjmw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: [alsa-devel] [PATCH v2 4/9] ASoC: tegra: add Tegra210 based I2S
	driver
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

The Inter-IC Sound (I2S) controller implements full-duplex, bi-directional
and single direction point to point serial interface. It can interface
with I2S compatible devices. Tegra I2S controller can operate as both
master and slave.

This patch registers I2S controller with ASoC framework. The component
driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
driver exposes I2S interfaces, which can be used to connect different
components in the ASoC layer. Makefile and Kconfig support is added to
allow to build the driver. The I2S devices can be enabled in the DT via
"nvidia,tegra210-i2s" compatible binding.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig        |  10 +
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra210_i2s.c | 939 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_i2s.h | 132 ++++++
 4 files changed, 1083 insertions(+)
 create mode 100644 sound/soc/tegra/tegra210_i2s.c
 create mode 100644 sound/soc/tegra/tegra210_i2s.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 2bde1e6..157fa7a 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -73,6 +73,16 @@ config SND_SOC_TEGRA210_DMIC
           PDM receiver.
           Say Y or M if you want to add support for Tegra210 DMIC module.
 
+config SND_SOC_TEGRA210_I2S
+        tristate "Tegra210 I2S module"
+        depends on SND_SOC_TEGRA
+        help
+          Config to enable the Inter-IC Sound (I2S) Controller which
+          implements full-duplex and bidirectional and single direction
+          point-to-point serial interfaces. It can interface with I2S
+          compatible devices.
+          Say Y or M if you want to add support for Tegra210 I2S module.
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on SND_SOC_TEGRA && I2C && GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 9e78fe4..1c4457d 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -10,6 +10,7 @@ snd-soc-tegra30-ahub-objs := tegra30_ahub.o
 snd-soc-tegra30-i2s-objs := tegra30_i2s.o
 snd-soc-tegra-cif-objs := tegra_cif.o
 snd-soc-tegra210-dmic-objs := tegra210_dmic.o
+snd-soc-tegra210-i2s-objs := tegra210_i2s.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
@@ -21,6 +22,7 @@ obj-$(CONFIG_SND_SOC_TEGRA20_SPDIF) += snd-soc-tegra20-spdif.o
 obj-$(CONFIG_SND_SOC_TEGRA30_AHUB) += snd-soc-tegra30-ahub.o
 obj-$(CONFIG_SND_SOC_TEGRA30_I2S) += snd-soc-tegra30-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA210_DMIC) += snd-soc-tegra210-dmic.o
+obj-$(CONFIG_SND_SOC_TEGRA210_I2S) += snd-soc-tegra210-i2s.o
 
 # Tegra machine Support
 snd-soc-tegra-rt5640-objs := tegra_rt5640.o
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
new file mode 100644
index 0000000..3622b08
--- /dev/null
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -0,0 +1,939 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra210_i2s.c - Tegra210 I2S driver
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "tegra210_i2s.h"
+#include "tegra_cif.h"
+
+static const struct reg_default tegra210_i2s_reg_defaults[] = {
+	{ TEGRA210_I2S_RX_INT_MASK, 0x00000003},
+	{ TEGRA210_I2S_RX_CIF_CTRL, 0x00007700},
+	{ TEGRA210_I2S_TX_INT_MASK, 0x00000003},
+	{ TEGRA210_I2S_TX_CIF_CTRL, 0x00007700},
+	{ TEGRA210_I2S_CG, 0x1},
+	{ TEGRA210_I2S_TIMING, 0x0000001f},
+	{ TEGRA210_I2S_ENABLE, 0x1},
+	/*
+	 * Below update does not have any effect on Tegra186 and Tegra194.
+	 * On Tegra210, I2S4 has "i2s4a" and "i2s4b" pins and below update
+	 * is required to select i2s4b for it to be functional for I2S
+	 * operation.
+	 */
+	{ TEGRA210_I2S_CYA, 0x1},
+};
+
+static void tegra210_i2s_set_slot_ctrl(struct regmap *regmap,
+				       unsigned int total_slots,
+				       unsigned int tx_slot_mask,
+				       unsigned int rx_slot_mask)
+{
+	regmap_write(regmap, TEGRA210_I2S_SLOT_CTRL, total_slots - 1);
+	regmap_write(regmap, TEGRA210_I2S_TX_SLOT_CTRL, tx_slot_mask);
+	regmap_write(regmap, TEGRA210_I2S_RX_SLOT_CTRL, rx_slot_mask);
+}
+
+static int tegra210_i2s_set_clock_rate(struct device *dev,
+				       unsigned int clock_rate)
+{
+	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL, &val);
+
+	/* No need to set rates if I2S is being operated in slave */
+	if (!(val & I2S_CTRL_MASTER_EN))
+		return 0;
+
+	ret = clk_set_rate(i2s->clk_i2s, clock_rate);
+	if (ret) {
+		dev_err(dev, "failed to set I2S bit clock rate %u, err: %d\n",
+			clock_rate, ret);
+		return ret;
+	}
+
+	if (!IS_ERR(i2s->clk_sync_input)) {
+		/*
+		 * Other I/O modules in AHUB can use i2s bclk as reference
+		 * clock. Below sets sync input clock rate as per bclk,
+		 * which can be used as input to other I/O modules.
+		 */
+		ret = clk_set_rate(i2s->clk_sync_input, clock_rate);
+		if (ret) {
+			dev_err(dev,
+				"failed to set sync input rate %u, err = %d\n",
+				clock_rate, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int tegra210_i2s_sw_reset(struct snd_soc_component *compnt,
+				 bool is_playback)
+{
+	struct device *dev = compnt->dev;
+	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
+	unsigned int reset_mask = I2S_SOFT_RESET_MASK;
+	unsigned int reset_en = I2S_SOFT_RESET_EN;
+	unsigned int reset_reg, cif_reg, stream_reg;
+	unsigned int cif_ctrl, stream_ctrl, i2s_ctrl, val;
+	int ret;
+
+	if (is_playback) {
+		reset_reg = TEGRA210_I2S_RX_SOFT_RESET;
+		cif_reg = TEGRA210_I2S_RX_CIF_CTRL;
+		stream_reg = TEGRA210_I2S_RX_CTRL;
+	} else {
+		reset_reg = TEGRA210_I2S_TX_SOFT_RESET;
+		cif_reg = TEGRA210_I2S_TX_CIF_CTRL;
+		stream_reg = TEGRA210_I2S_TX_CTRL;
+	}
+
+	/* Store CIF and I2S control values */
+	regmap_read(i2s->regmap, cif_reg, &cif_ctrl);
+	regmap_read(i2s->regmap, stream_reg, &stream_ctrl);
+	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL, &i2s_ctrl);
+
+	/* Reset to make sure the previous transactions are clean */
+	regmap_update_bits(i2s->regmap, reset_reg, reset_mask, reset_en);
+
+	ret = regmap_read_poll_timeout(i2s->regmap, reset_reg, val,
+				       !(val & reset_mask & reset_en),
+				       10, 10000);
+	if (ret < 0) {
+		dev_err(dev, "timeout: failed to reset I2S for %s\n",
+			is_playback ? "playback" : "capture");
+		return ret;
+	}
+
+	/* Restore CIF and I2S control values */
+	regmap_write(i2s->regmap, cif_reg, cif_ctrl);
+	regmap_write(i2s->regmap, stream_reg, stream_ctrl);
+	regmap_write(i2s->regmap, TEGRA210_I2S_CTRL, i2s_ctrl);
+
+	return 0;
+}
+
+static int tegra210_i2s_init(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *compnt = snd_soc_dapm_to_component(w->dapm);
+	struct device *dev = compnt->dev;
+	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
+	unsigned int val, status_reg;
+	bool is_playback;
+	int ret;
+
+	switch (w->reg) {
+	case TEGRA210_I2S_RX_ENABLE:
+		is_playback = true;
+		status_reg = TEGRA210_I2S_RX_STATUS;
+		break;
+	case TEGRA210_I2S_TX_ENABLE:
+		is_playback = false;
+		status_reg = TEGRA210_I2S_TX_STATUS;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Ensure I2S is in disabled state before new session */
+	ret = regmap_read_poll_timeout(i2s->regmap, status_reg, val,
+				       !(val & I2S_EN_MASK & I2S_EN),
+				       10, 10000);
+	if (ret < 0) {
+		dev_err(dev, "timeout: previous I2S %s is still active\n",
+			is_playback ? "playback" : "capture");
+		return ret;
+	}
+
+	return tegra210_i2s_sw_reset(compnt, is_playback);
+}
+
+static int tegra210_i2s_runtime_suspend(struct device *dev)
+{
+	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
+
+	regcache_cache_only(i2s->regmap, true);
+	regcache_mark_dirty(i2s->regmap);
+
+	clk_disable_unprepare(i2s->clk_i2s);
+
+	return 0;
+}
+
+static int tegra210_i2s_runtime_resume(struct device *dev)
+{
+	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(i2s->clk_i2s);
+	if (ret) {
+		dev_err(dev, "failed to enable I2S bit clock, err: %d\n", ret);
+		return ret;
+	}
+
+	regcache_cache_only(i2s->regmap, false);
+	regcache_sync(i2s->regmap);
+
+	return 0;
+}
+
+static void tegra210_i2s_set_data_offset(struct tegra210_i2s *i2s,
+					 unsigned int data_offset)
+{
+	unsigned int mask = I2S_CTRL_DATA_OFFSET_MASK;
+	unsigned int shift = I2S_DATA_SHIFT;
+	unsigned int reg;
+
+	reg = TEGRA210_I2S_TX_CTRL;
+	regmap_update_bits(i2s->regmap, reg, mask, data_offset << shift);
+
+	reg = TEGRA210_I2S_RX_CTRL;
+	regmap_update_bits(i2s->regmap, reg, mask, data_offset << shift);
+}
+
+static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
+				unsigned int fmt)
+{
+	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask, val;
+
+	mask = I2S_CTRL_MASTER_EN_MASK;
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		val = 0;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFM:
+		val = I2S_CTRL_MASTER_EN;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mask |= I2S_CTRL_FRAME_FMT_MASK | I2S_CTRL_LRCK_POL_MASK;
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+		val |= I2S_CTRL_FRAME_FMT_FSYNC_MODE;
+		val |= I2S_CTRL_LRCK_POL_HIGH;
+		tegra210_i2s_set_data_offset(i2s, 1);
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		val |= I2S_CTRL_FRAME_FMT_FSYNC_MODE;
+		val |= I2S_CTRL_LRCK_POL_HIGH;
+		tegra210_i2s_set_data_offset(i2s, 0);
+		break;
+	/* I2S mode has data offset of 1 */
+	case SND_SOC_DAIFMT_I2S:
+		val |= I2S_CTRL_FRAME_FMT_LRCK_MODE;
+		val |= I2S_CTRL_LRCK_POL_LOW;
+		tegra210_i2s_set_data_offset(i2s, 1);
+		break;
+	/*
+	 * For RJ mode data offset is dependent on the sample size
+	 * and the bclk ratio, and so is set when hw_params is called.
+	 */
+	case SND_SOC_DAIFMT_RIGHT_J:
+		val |= I2S_CTRL_FRAME_FMT_LRCK_MODE;
+		val |= I2S_CTRL_LRCK_POL_HIGH;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		val |= I2S_CTRL_FRAME_FMT_LRCK_MODE;
+		val |= I2S_CTRL_LRCK_POL_HIGH;
+		tegra210_i2s_set_data_offset(i2s, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mask |= I2S_CTRL_EDGE_CTRL_MASK;
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		val |= I2S_CTRL_EDGE_CTRL_POS_EDGE;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		val |= I2S_CTRL_EDGE_CTRL_POS_EDGE;
+		val ^= I2S_CTRL_LRCK_POL_MASK;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		val |= I2S_CTRL_EDGE_CTRL_NEG_EDGE;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		val |= I2S_CTRL_EDGE_CTRL_NEG_EDGE;
+		val ^= I2S_CTRL_LRCK_POL_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL, mask, val);
+
+	i2s->dai_fmt = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
+
+	return 0;
+}
+
+static int tegra210_i2s_set_tdm_slot(struct snd_soc_dai *dai,
+				     unsigned int tx_mask, unsigned int rx_mask,
+				     int slots, int slot_width)
+{
+	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	/* Copy the required tx and rx mask */
+	i2s->tx_mask = (tx_mask > DEFAULT_I2S_SLOT_MASK) ?
+		       DEFAULT_I2S_SLOT_MASK : tx_mask;
+	i2s->rx_mask = (rx_mask > DEFAULT_I2S_SLOT_MASK) ?
+		       DEFAULT_I2S_SLOT_MASK : rx_mask;
+
+	return 0;
+}
+
+static int tegra210_i2s_set_dai_bclk_ratio(struct snd_soc_dai *dai,
+					   unsigned int ratio)
+{
+	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	i2s->bclk_ratio = ratio;
+
+	return 0;
+}
+
+static int tegra210_i2s_get_control(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	long *uctl_val = &ucontrol->value.integer.value[0];
+
+	if (strstr(kcontrol->id.name, "Loopback"))
+		*uctl_val = i2s->loopback;
+	else if (strstr(kcontrol->id.name, "Sample Rate"))
+		*uctl_val = i2s->srate_override;
+	else if (strstr(kcontrol->id.name, "FSYNC Width"))
+		*uctl_val = i2s->fsync_width;
+	else if (strstr(kcontrol->id.name, "Playback Audio Bit Format"))
+		*uctl_val = i2s->audio_fmt_override[I2S_RX_PATH];
+	else if (strstr(kcontrol->id.name, "Capture Audio Bit Format"))
+		*uctl_val = i2s->audio_fmt_override[I2S_TX_PATH];
+	else if (strstr(kcontrol->id.name, "Client Bit Format"))
+		*uctl_val = i2s->client_fmt_override;
+	else if (strstr(kcontrol->id.name, "Playback Audio Channels"))
+		*uctl_val = i2s->audio_ch_override[I2S_RX_PATH];
+	else if (strstr(kcontrol->id.name, "Capture Audio Channels"))
+		*uctl_val = i2s->audio_ch_override[I2S_TX_PATH];
+	else if (strstr(kcontrol->id.name, "Client Channels"))
+		*uctl_val = i2s->client_ch_override;
+	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
+		*uctl_val = i2s->stereo_to_mono[I2S_TX_PATH];
+	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
+		*uctl_val = i2s->mono_to_stereo[I2S_TX_PATH];
+	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
+		*uctl_val = i2s->stereo_to_mono[I2S_RX_PATH];
+	else if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
+		*uctl_val = i2s->mono_to_stereo[I2S_RX_PATH];
+	else if (strstr(kcontrol->id.name, "Playback FIFO Threshold"))
+		*uctl_val = i2s->rx_fifo_th;
+	else if (strstr(kcontrol->id.name, "BCLK Ratio"))
+		*uctl_val = i2s->bclk_ratio;
+
+	return 0;
+}
+
+static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	int value = ucontrol->value.integer.value[0];
+
+	if (strstr(kcontrol->id.name, "Loopback")) {
+		i2s->loopback = value;
+
+		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
+				   I2S_CTRL_LPBK_MASK,
+				   i2s->loopback << I2S_CTRL_LPBK_SHIFT);
+
+	} else if (strstr(kcontrol->id.name, "Sample Rate")) {
+		i2s->srate_override = value;
+	} else if (strstr(kcontrol->id.name, "FSYNC Width")) {
+		/*
+		 * Frame sync width is used only for FSYNC modes and not
+		 * applicable for LRCK modes. Reset value for this field is "0",
+		 * which means the width is one bit clock wide.
+		 * The width requirement may depend on the codec and in such
+		 * cases mixer control is used to update custom values. A value
+		 * of "N" here means, width is "N + 1" bit clock wide.
+		 */
+		i2s->fsync_width = value;
+
+		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
+				   I2S_CTRL_FSYNC_WIDTH_MASK,
+				   i2s->fsync_width << I2S_FSYNC_WIDTH_SHIFT);
+
+	} else if (strstr(kcontrol->id.name, "Playback Audio Bit Format")) {
+		i2s->audio_fmt_override[I2S_RX_PATH] = value;
+	} else if (strstr(kcontrol->id.name, "Capture Audio Bit Format")) {
+		i2s->audio_fmt_override[I2S_TX_PATH] = value;
+	} else if (strstr(kcontrol->id.name, "Client Bit Format")) {
+		i2s->client_fmt_override = value;
+	} else if (strstr(kcontrol->id.name, "Playback Audio Channels")) {
+		i2s->audio_ch_override[I2S_RX_PATH] = value;
+	} else if (strstr(kcontrol->id.name, "Capture Audio Channels")) {
+		i2s->audio_ch_override[I2S_TX_PATH] = value;
+	} else if (strstr(kcontrol->id.name, "Client Channels")) {
+		i2s->client_ch_override = value;
+	} else if (strstr(kcontrol->id.name, "Capture Stereo To Mono")) {
+		i2s->stereo_to_mono[I2S_TX_PATH] = value;
+	} else if (strstr(kcontrol->id.name, "Capture Mono To Stereo")) {
+		i2s->mono_to_stereo[I2S_TX_PATH] = value;
+	} else if (strstr(kcontrol->id.name, "Playback Stereo To Mono")) {
+		i2s->stereo_to_mono[I2S_RX_PATH] = value;
+	} else if (strstr(kcontrol->id.name, "Playback Mono To Stereo")) {
+		i2s->mono_to_stereo[I2S_RX_PATH] = value;
+	} else if (strstr(kcontrol->id.name, "Playback FIFO Threshold")) {
+		i2s->rx_fifo_th = value;
+	} else if (strstr(kcontrol->id.name, "BCLK Ratio")) {
+		i2s->bclk_ratio = value;
+	}
+
+	return 0;
+}
+
+static const char * const tegra210_i2s_format_text[] = {
+	"None",
+	"16",
+	"32",
+};
+
+static const int tegra210_cif_fmt[] = {
+	0,
+	TEGRA_ACIF_BITS_16,
+	TEGRA_ACIF_BITS_32,
+};
+
+static const int tegra210_i2s_bit_fmt[] = {
+	0,
+	I2S_BITS_16,
+	I2S_BITS_32,
+};
+
+static const int tegra210_i2s_sample_size[] = {
+	0,
+	16,
+	32,
+};
+
+static const struct soc_enum tegra210_i2s_format_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_i2s_format_text),
+			tegra210_i2s_format_text);
+
+static int tegra210_i2s_set_timing_params(struct device *dev,
+					  unsigned int sample_size,
+					  unsigned int srate,
+					  unsigned int channels)
+{
+	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
+	unsigned int val, bit_count, bclk_rate, num_bclk = sample_size;
+	int ret;
+
+	if (i2s->bclk_ratio)
+		num_bclk *= i2s->bclk_ratio;
+
+	if (i2s->dai_fmt == SND_SOC_DAIFMT_RIGHT_J)
+		tegra210_i2s_set_data_offset(i2s, num_bclk - sample_size);
+
+	/* I2S bit clock rate */
+	bclk_rate = srate * channels * num_bclk;
+
+	ret = tegra210_i2s_set_clock_rate(dev, bclk_rate);
+	if (ret) {
+		dev_err(dev, "can't set I2S bit clock rate %u, err: %d\n",
+			bclk_rate, ret);
+		return ret;
+	}
+
+	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL, &val);
+
+	/*
+	 * For LRCK mode, channel bit count depends on number of bit clocks
+	 * on the left channel, where as for FSYNC mode bit count depends on
+	 * the number of bit clocks in both left and right channels for DSP
+	 * mode or the number of bit clocks in one TDM frame.
+	 *
+	 */
+	switch (val & I2S_CTRL_FRAME_FMT_MASK) {
+	case I2S_CTRL_FRAME_FMT_LRCK_MODE:
+		bit_count = (bclk_rate / (srate * 2)) - 1;
+		break;
+	case I2S_CTRL_FRAME_FMT_FSYNC_MODE:
+		bit_count = (bclk_rate / srate) - 1;
+
+		tegra210_i2s_set_slot_ctrl(i2s->regmap, channels,
+					   i2s->tx_mask, i2s->rx_mask);
+		break;
+	default:
+		dev_err(dev, "invalid I2S mode\n");
+		return -EINVAL;
+	}
+
+	if (bit_count > I2S_TIMING_CH_BIT_CNT_MASK) {
+		dev_err(dev, "invalid channel bit count %u\n", bit_count);
+		return -EINVAL;
+	}
+
+	regmap_write(i2s->regmap, TEGRA210_I2S_TIMING,
+		     bit_count << I2S_TIMING_CH_BIT_CNT_SHIFT);
+
+	return 0;
+}
+
+static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->dev;
+	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int sample_size, channels, srate, val, reg, path;
+	struct tegra_cif_conf cif_conf;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	channels = params_channels(params);
+	if (channels < 1) {
+		dev_err(dev, "invalid %d channel configuration\n", channels);
+		return -EINVAL;
+	}
+
+	cif_conf.audio_ch = channels;
+	cif_conf.client_ch = channels;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		val = I2S_BITS_8;
+		sample_size = 8;
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_8;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		val = I2S_BITS_16;
+		sample_size = 16;
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_16;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		val = I2S_BITS_32;
+		sample_size = 32;
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_32;
+		break;
+	default:
+		dev_err(dev, "unsupported format!\n");
+		return -ENOTSUPP;
+	}
+
+	if (i2s->client_fmt_override) {
+		val = tegra210_i2s_bit_fmt[i2s->client_fmt_override];
+		sample_size =
+			tegra210_i2s_sample_size[i2s->client_fmt_override];
+		cif_conf.client_bits =
+			tegra210_cif_fmt[i2s->client_fmt_override];
+	}
+
+	/* Program sample size */
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
+			   I2S_CTRL_BIT_SIZE_MASK, val);
+
+	srate = params_rate(params);
+
+	/* Override rate, channel and audio bit params as applicable */
+	if (i2s->srate_override)
+		srate = i2s->srate_override;
+
+	/*
+	 * For playback I2S RX-CIF and for capture TX-CIF is used.
+	 * With reference to AHUB, for I2S, SNDRV_PCM_STREAM_CAPTURE stream is
+	 * actually for playback.
+	 */
+	path = (substream->stream == SNDRV_PCM_STREAM_CAPTURE) ?
+	       I2S_RX_PATH : I2S_TX_PATH;
+
+	if (i2s->audio_ch_override[path])
+		cif_conf.audio_ch = i2s->audio_ch_override[path];
+
+	if (i2s->client_ch_override)
+		cif_conf.client_ch = i2s->client_ch_override;
+
+	if (i2s->audio_fmt_override[path])
+		cif_conf.audio_bits =
+			tegra210_cif_fmt[i2s->audio_fmt_override[path]];
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		unsigned int max_th;
+
+		/* FIFO threshold in terms of frames */
+		max_th = (I2S_RX_FIFO_DEPTH / cif_conf.audio_ch) - 1;
+
+		if (i2s->rx_fifo_th > max_th)
+			i2s->rx_fifo_th = max_th;
+
+		cif_conf.threshold = i2s->rx_fifo_th;
+
+		reg = TEGRA210_I2S_RX_CIF_CTRL;
+	} else {
+		reg = TEGRA210_I2S_TX_CIF_CTRL;
+	}
+
+	cif_conf.mono_conv = i2s->mono_to_stereo[path];
+	cif_conf.stereo_conv = i2s->stereo_to_mono[path];
+
+	tegra_set_cif(i2s->regmap, reg, &cif_conf);
+
+	return tegra210_i2s_set_timing_params(dev, sample_size, srate,
+					      cif_conf.client_ch);
+}
+
+static const struct snd_soc_dai_ops tegra210_i2s_dai_ops = {
+	.set_fmt	= tegra210_i2s_set_fmt,
+	.hw_params	= tegra210_i2s_hw_params,
+	.set_bclk_ratio	= tegra210_i2s_set_dai_bclk_ratio,
+	.set_tdm_slot	= tegra210_i2s_set_tdm_slot,
+};
+
+/*
+ * Three DAIs are exposed
+ * 1. "CIF" DAI for connecting with XBAR
+ * 2. "DAP" DAI for connecting with CODEC
+ * 3. "DUMMY" can be used when no external codec connection is
+ *    available. In such case "DAP" is connected with "DUMMY".
+ * Order of these DAIs should not be changed, since DAI links in DT refer
+ * to these DAIs depending on the index.
+ */
+static struct snd_soc_dai_driver tegra210_i2s_dais[] = {
+	{
+		.name = "CIF",
+		.playback = {
+			.stream_name = "CIF Receive",
+			.channels_min = 1,
+			.channels_max = 16,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "CIF Transmit",
+			.channels_min = 1,
+			.channels_max = 16,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+	},
+	{
+		.name = "DAP",
+		.playback = {
+			.stream_name = "DAP Receive",
+			.channels_min = 1,
+			.channels_max = 16,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "DAP Transmit",
+			.channels_min = 1,
+			.channels_max = 16,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &tegra210_i2s_dai_ops,
+		.symmetric_rates = 1,
+	},
+	{
+		.name = "DUMMY",
+		.playback = {
+			.stream_name = "Dummy Playback",
+			.channels_min = 1,
+			.channels_max = 16,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "Dummy Capture",
+			.channels_min = 1,
+			.channels_max = 16,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+	},
+};
+
+static const char * const tegra210_i2s_stereo_conv_text[] = {
+	"CH0", "CH1", "AVG",
+};
+
+static const char * const tegra210_i2s_mono_conv_text[] = {
+	"ZERO", "COPY",
+};
+
+static const struct soc_enum tegra210_i2s_mono_conv_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_i2s_mono_conv_text),
+			tegra210_i2s_mono_conv_text);
+
+static const struct soc_enum tegra210_i2s_stereo_conv_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_i2s_stereo_conv_text),
+			tegra210_i2s_stereo_conv_text);
+
+static const struct snd_kcontrol_new tegra210_i2s_controls[] = {
+	SOC_SINGLE_EXT("Loopback", 0, 0, 1, 0, tegra210_i2s_get_control,
+		       tegra210_i2s_put_control),
+	SOC_SINGLE_EXT("FSYNC Width", 0, 0, 255, 0, tegra210_i2s_get_control,
+		       tegra210_i2s_put_control),
+	SOC_SINGLE_EXT("Sample Rate", 0, 0, 192000, 0, tegra210_i2s_get_control,
+		       tegra210_i2s_put_control),
+	SOC_ENUM_EXT("Playback Audio Bit Format", tegra210_i2s_format_enum,
+		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_ENUM_EXT("Capture Audio Bit Format", tegra210_i2s_format_enum,
+		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_ENUM_EXT("Client Bit Format", tegra210_i2s_format_enum,
+		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_SINGLE_EXT("Playback Audio Channels", 0, 0, 16, 0,
+		       tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_SINGLE_EXT("Capture Audio Channels", 0, 0, 16, 0,
+		       tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_SINGLE_EXT("Client Channels", 0, 0, 16, 0,
+		       tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_ENUM_EXT("Capture Stereo To Mono", tegra210_i2s_stereo_conv_enum,
+		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_ENUM_EXT("Capture Mono To Stereo", tegra210_i2s_mono_conv_enum,
+		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_ENUM_EXT("Playback Stereo To Mono", tegra210_i2s_stereo_conv_enum,
+		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_ENUM_EXT("Playback Mono To Stereo", tegra210_i2s_mono_conv_enum,
+		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_SINGLE_EXT("Playback FIFO Threshold", 0, 0, I2S_RX_FIFO_DEPTH - 1,
+		       0, tegra210_i2s_get_control, tegra210_i2s_put_control),
+	SOC_SINGLE_EXT("BCLK Ratio", 0, 0, INT_MAX, 0, tegra210_i2s_get_control,
+		       tegra210_i2s_put_control),
+};
+
+static const struct snd_soc_dapm_widget tegra210_i2s_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("CIF RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("CIF TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN_E("DAP RX", NULL, 0, TEGRA210_I2S_TX_ENABLE,
+			      0, 0, tegra210_i2s_init, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_AIF_OUT_E("DAP TX", NULL, 0, TEGRA210_I2S_RX_ENABLE,
+			       0, 0, tegra210_i2s_init, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_MIC("Dummy Input", NULL),
+	SND_SOC_DAPM_SPK("Dummy Output", NULL),
+};
+
+static const struct snd_soc_dapm_route tegra210_i2s_routes[] = {
+	{ "CIF RX",	  NULL, "CIF Receive" },
+	{ "DAP TX",	  NULL, "CIF RX" },
+	{ "DAP Transmit", NULL, "DAP TX" },
+
+	{ "DAP RX",	  NULL, "DAP Receive" },
+	{ "CIF TX",	  NULL, "DAP RX" },
+	{ "CIF Transmit", NULL, "CIF TX" },
+
+	{ "Dummy Capture", NULL, "Dummy Input" },
+	{ "Dummy Output", NULL, "Dummy Playback" },
+};
+
+static const struct snd_soc_component_driver tegra210_i2s_cmpnt = {
+	.dapm_widgets = tegra210_i2s_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tegra210_i2s_widgets),
+	.dapm_routes = tegra210_i2s_routes,
+	.num_dapm_routes = ARRAY_SIZE(tegra210_i2s_routes),
+	.controls = tegra210_i2s_controls,
+	.num_controls = ARRAY_SIZE(tegra210_i2s_controls),
+	.non_legacy_dai_naming = 1,
+};
+
+static bool tegra210_i2s_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_I2S_RX_ENABLE ... TEGRA210_I2S_RX_SOFT_RESET:
+	case TEGRA210_I2S_RX_INT_MASK ... TEGRA210_I2S_RX_CLK_TRIM:
+	case TEGRA210_I2S_TX_ENABLE ... TEGRA210_I2S_TX_SOFT_RESET:
+	case TEGRA210_I2S_TX_INT_MASK ... TEGRA210_I2S_TX_CLK_TRIM:
+	case TEGRA210_I2S_ENABLE ... TEGRA210_I2S_CG:
+	case TEGRA210_I2S_CTRL ... TEGRA210_I2S_CYA:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra210_i2s_rd_reg(struct device *dev, unsigned int reg)
+{
+	if (tegra210_i2s_wr_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case TEGRA210_I2S_RX_STATUS:
+	case TEGRA210_I2S_RX_INT_STATUS:
+	case TEGRA210_I2S_RX_CIF_FIFO_STATUS:
+	case TEGRA210_I2S_TX_STATUS:
+	case TEGRA210_I2S_TX_INT_STATUS:
+	case TEGRA210_I2S_TX_CIF_FIFO_STATUS:
+	case TEGRA210_I2S_STATUS:
+	case TEGRA210_I2S_INT_STATUS:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra210_i2s_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_I2S_RX_STATUS:
+	case TEGRA210_I2S_RX_INT_STATUS:
+	case TEGRA210_I2S_RX_CIF_FIFO_STATUS:
+	case TEGRA210_I2S_TX_STATUS:
+	case TEGRA210_I2S_TX_INT_STATUS:
+	case TEGRA210_I2S_TX_CIF_FIFO_STATUS:
+	case TEGRA210_I2S_STATUS:
+	case TEGRA210_I2S_INT_STATUS:
+	case TEGRA210_I2S_RX_SOFT_RESET:
+	case TEGRA210_I2S_TX_SOFT_RESET:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config tegra210_i2s_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_I2S_CYA,
+	.writeable_reg		= tegra210_i2s_wr_reg,
+	.readable_reg		= tegra210_i2s_rd_reg,
+	.volatile_reg		= tegra210_i2s_volatile_reg,
+	.reg_defaults		= tegra210_i2s_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_i2s_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct of_device_id tegra210_i2s_of_match[] = {
+	{ .compatible = "nvidia,tegra210-i2s" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra210_i2s_of_match);
+
+static int tegra210_i2s_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_i2s *i2s;
+	void __iomem *regs;
+	int ret;
+
+	i2s = devm_kcalloc(dev, 1, sizeof(*i2s), GFP_KERNEL);
+	if (!i2s)
+		return -ENOMEM;
+
+	i2s->rx_fifo_th = DEFAULT_I2S_RX_FIFO_THRESHOLD;
+	i2s->tx_mask = DEFAULT_I2S_SLOT_MASK;
+	i2s->rx_mask = DEFAULT_I2S_SLOT_MASK;
+	i2s->loopback = false;
+
+	dev_set_drvdata(dev, i2s);
+
+	i2s->clk_i2s = devm_clk_get(dev, "i2s");
+	if (IS_ERR(i2s->clk_i2s)) {
+		dev_err(dev, "can't retrieve I2S bit clock\n");
+		return PTR_ERR(i2s->clk_i2s);
+	}
+
+	/*
+	 * Not an error, as this clock is needed only when some other I/O
+	 * requires input clock from current I2S instance, which is
+	 * configurable from DT.
+	 */
+	i2s->clk_sync_input = devm_clk_get(dev, "sync_input");
+	if (IS_ERR(i2s->clk_sync_input))
+		dev_dbg(dev, "can't retrieve I2S sync input clock\n");
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	i2s->regmap = devm_regmap_init_mmio(dev, regs,
+					    &tegra210_i2s_regmap_config);
+	if (IS_ERR(i2s->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(i2s->regmap);
+	}
+
+	regcache_cache_only(i2s->regmap, true);
+
+	ret = devm_snd_soc_register_component(dev, &tegra210_i2s_cmpnt,
+					      tegra210_i2s_dais,
+					      ARRAY_SIZE(tegra210_i2s_dais));
+	if (ret != 0) {
+		dev_err(dev, "can't register I2S component, err: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int tegra210_i2s_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra210_i2s_runtime_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra210_i2s_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra210_i2s_runtime_suspend,
+			   tegra210_i2s_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra210_i2s_driver = {
+	.driver = {
+		.name = "tegra210-i2s",
+		.of_match_table = tegra210_i2s_of_match,
+		.pm = &tegra210_i2s_pm_ops,
+	},
+	.probe = tegra210_i2s_probe,
+	.remove = tegra210_i2s_remove,
+};
+module_platform_driver(tegra210_i2s_driver)
+
+MODULE_AUTHOR("Songhee Baek <sbaek@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 ASoC I2S driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra210_i2s.h b/sound/soc/tegra/tegra210_i2s.h
new file mode 100644
index 0000000..67454a2
--- /dev/null
+++ b/sound/soc/tegra/tegra210_i2s.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_i2s.h - Definitions for Tegra210 I2S driver
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION. All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_I2S_H__
+#define __TEGRA210_I2S_H__
+
+/* Register offsets from I2S*_BASE */
+#define TEGRA210_I2S_RX_ENABLE			0x0
+#define TEGRA210_I2S_RX_SOFT_RESET		0x4
+#define TEGRA210_I2S_RX_STATUS			0x0c
+#define TEGRA210_I2S_RX_INT_STATUS		0x10
+#define TEGRA210_I2S_RX_INT_MASK		0x14
+#define TEGRA210_I2S_RX_INT_SET			0x18
+#define TEGRA210_I2S_RX_INT_CLEAR		0x1c
+#define TEGRA210_I2S_RX_CIF_CTRL		0x20
+#define TEGRA210_I2S_RX_CTRL			0x24
+#define TEGRA210_I2S_RX_SLOT_CTRL		0x28
+#define TEGRA210_I2S_RX_CLK_TRIM		0x2c
+#define TEGRA210_I2S_RX_CYA			0x30
+#define TEGRA210_I2S_RX_CIF_FIFO_STATUS		0x34
+#define TEGRA210_I2S_TX_ENABLE			0x40
+#define TEGRA210_I2S_TX_SOFT_RESET		0x44
+#define TEGRA210_I2S_TX_STATUS			0x4c
+#define TEGRA210_I2S_TX_INT_STATUS		0x50
+#define TEGRA210_I2S_TX_INT_MASK		0x54
+#define TEGRA210_I2S_TX_INT_SET			0x58
+#define TEGRA210_I2S_TX_INT_CLEAR		0x5c
+#define TEGRA210_I2S_TX_CIF_CTRL		0x60
+#define TEGRA210_I2S_TX_CTRL			0x64
+#define TEGRA210_I2S_TX_SLOT_CTRL		0x68
+#define TEGRA210_I2S_TX_CLK_TRIM		0x6c
+#define TEGRA210_I2S_TX_CYA			0x70
+#define TEGRA210_I2S_TX_CIF_FIFO_STATUS		0x74
+#define TEGRA210_I2S_ENABLE			0x80
+#define TEGRA210_I2S_SOFT_RESET			0x84
+#define TEGRA210_I2S_CG				0x88
+#define TEGRA210_I2S_STATUS			0x8c
+#define TEGRA210_I2S_INT_STATUS			0x90
+#define TEGRA210_I2S_CTRL			0xa0
+#define TEGRA210_I2S_TIMING			0xa4
+#define TEGRA210_I2S_SLOT_CTRL			0xa8
+#define TEGRA210_I2S_CLK_TRIM			0xac
+#define TEGRA210_I2S_CYA			0xb0
+
+/* Bit fields, shifts and masks */
+#define I2S_DATA_SHIFT				8
+#define I2S_CTRL_DATA_OFFSET_MASK		(0x7ff << I2S_DATA_SHIFT)
+
+#define I2S_EN_SHIFT				0
+#define I2S_EN_MASK				BIT(I2S_EN_SHIFT)
+#define I2S_EN					BIT(I2S_EN_SHIFT)
+
+#define I2S_FSYNC_WIDTH_SHIFT			24
+#define I2S_CTRL_FSYNC_WIDTH_MASK		(0xff << I2S_FSYNC_WIDTH_SHIFT)
+
+#define I2S_POS_EDGE				0
+#define I2S_NEG_EDGE				1
+#define I2S_EDGE_SHIFT				20
+#define I2S_CTRL_EDGE_CTRL_MASK			BIT(I2S_EDGE_SHIFT)
+#define I2S_CTRL_EDGE_CTRL_POS_EDGE		(I2S_POS_EDGE << I2S_EDGE_SHIFT)
+#define I2S_CTRL_EDGE_CTRL_NEG_EDGE		(I2S_NEG_EDGE << I2S_EDGE_SHIFT)
+
+#define I2S_FMT_LRCK				0
+#define I2S_FMT_FSYNC				1
+#define I2S_FMT_SHIFT				12
+#define I2S_CTRL_FRAME_FMT_MASK			(7 << I2S_FMT_SHIFT)
+#define I2S_CTRL_FRAME_FMT_LRCK_MODE		(I2S_FMT_LRCK << I2S_FMT_SHIFT)
+#define I2S_CTRL_FRAME_FMT_FSYNC_MODE		(I2S_FMT_FSYNC << I2S_FMT_SHIFT)
+
+#define I2S_CTRL_MASTER_EN_SHIFT		10
+#define I2S_CTRL_MASTER_EN_MASK			BIT(I2S_CTRL_MASTER_EN_SHIFT)
+#define I2S_CTRL_MASTER_EN			BIT(I2S_CTRL_MASTER_EN_SHIFT)
+
+#define I2S_CTRL_LRCK_POL_SHIFT			9
+#define I2S_CTRL_LRCK_POL_MASK			BIT(I2S_CTRL_LRCK_POL_SHIFT)
+#define I2S_CTRL_LRCK_POL_LOW			(0 << I2S_CTRL_LRCK_POL_SHIFT)
+#define I2S_CTRL_LRCK_POL_HIGH			BIT(I2S_CTRL_LRCK_POL_SHIFT)
+
+#define I2S_CTRL_LPBK_SHIFT			8
+#define I2S_CTRL_LPBK_MASK			BIT(I2S_CTRL_LPBK_SHIFT)
+#define I2S_CTRL_LPBK_EN			BIT(I2S_CTRL_LPBK_SHIFT)
+
+#define I2S_BITS_8				1
+#define I2S_BITS_16				3
+#define I2S_BITS_32				7
+#define I2S_CTRL_BIT_SIZE_MASK			0x7
+
+#define I2S_TIMING_CH_BIT_CNT_MASK		0x7ff
+#define I2S_TIMING_CH_BIT_CNT_SHIFT		0
+
+#define I2S_SOFT_RESET_SHIFT			0
+#define I2S_SOFT_RESET_MASK			BIT(I2S_SOFT_RESET_SHIFT)
+#define I2S_SOFT_RESET_EN			BIT(I2S_SOFT_RESET_SHIFT)
+
+#define I2S_RX_FIFO_DEPTH			64
+#define DEFAULT_I2S_RX_FIFO_THRESHOLD		3
+
+#define DEFAULT_I2S_SLOT_MASK			0xffff
+
+enum tegra210_i2s_path {
+	I2S_RX_PATH,
+	I2S_TX_PATH,
+	I2S_PATHS,
+};
+
+struct tegra210_i2s {
+	struct clk *clk_i2s;
+	struct clk *clk_sync_input;
+	struct regmap *regmap;
+	unsigned int stereo_to_mono[I2S_PATHS];
+	unsigned int mono_to_stereo[I2S_PATHS];
+	unsigned int audio_ch_override[I2S_PATHS];
+	unsigned int audio_fmt_override[I2S_PATHS];
+	/* Client overrides are common for TX and RX paths */
+	unsigned int client_ch_override;
+	unsigned int client_fmt_override;
+	unsigned int srate_override;
+	unsigned int dai_fmt;
+	unsigned int fsync_width;
+	unsigned int bclk_ratio;
+	unsigned int tx_mask;
+	unsigned int rx_mask;
+	unsigned int rx_fifo_th;
+	bool loopback;
+};
+
+#endif
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

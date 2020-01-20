Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB7B142D92
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 15:30:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBB81680;
	Mon, 20 Jan 2020 15:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBB81680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579530645;
	bh=QTQRCGu1knT+xJ2FgdoQM18bhSTtnrIs6ymznYkdYuY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RPUm9JkLpT8Cu68tb9A00J7nsEegymti2ZS3bDghci4OrCwWkef66SPsHdpxbrFd9
	 HRSg9ck3+iOp7mzD85Ip4mpx6wsDG4QOrP36tZv3s0bxUWLgkCUS/oi9qKZMXBVN12
	 YJ7mCmHmkfYeCyXQ4xb9F2I6yvO/dIjDJYYBduwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFAF5F802FB;
	Mon, 20 Jan 2020 15:24:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 956F8F802F9; Mon, 20 Jan 2020 15:24:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2039F802EA
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 15:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2039F802EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="RSXwgkch"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e25b8010000>; Mon, 20 Jan 2020 06:24:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 20 Jan 2020 06:24:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 20 Jan 2020 06:24:15 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jan
 2020 14:24:13 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jan
 2020 14:24:12 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 20 Jan 2020 14:24:12 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e25b8080000>; Mon, 20 Jan 2020 06:24:12 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
Date: Mon, 20 Jan 2020 19:53:16 +0530
Message-ID: <1579530198-13431-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579530241; bh=1Sg93Voyk7Wv+AWpCmNPigrNUsJC5/YD4Ic2yG1auLM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=RSXwgkch9TTSvF7ZEkEuE3b0pLw8sKrfnhuKURdwQYEqqXywt7dKwbXISij1QMw+0
 ngSZ4UqJc91wm8ioiUT6+9IB0ZsDYUR6Pe6fo7DPjIMiqnfih5VSIg1WEWpwxnUQxo
 6Mt5ugaZb9az02xXHwjJvZw3ihQoAu3KCauWAjpJ6vYKNiOQwn9iLW/X1D2xnG7Gjy
 wIO7yAYvL+qv7u/2K0UvAisX1XKoeRSky9v5ahFJ5fUjVP04eDSU9gYx/PPUDK9pUp
 n+s3xgUNjjmyQtDiCshOiXBcYTAWP63ZB8cqS5667LnEsf4ngPsXBz4ICeizpYHufI
 sbDXHnI1MUVxg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
Subject: [alsa-devel] [PATCH 7/9] ASoC: tegra: add Tegra210 based ADMAIF
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

ADMAIF is the interface between ADMA and AHUB. Each ADMA channel that
sends/receives data to/from AHUB must intreface through an ADMAIF channel.
ADMA channel sending data to AHUB pairs with an ADMAIF Tx channel and
similarly ADMA channel receiving data from AHUB pairs with an ADMAIF Rx
channel. Buffer size is configuranle for each ADMAIF channel, but currently
SW uses default values.

This patch registers ADMAIF driver with ASoC framework. The component
driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
driver exposes ADMAIF interfaces, which can be used to connect different
components in the ASoC layer. Makefile and Kconfig support is added to
allow to build the driver. The ADMAIF device can be enabled in the DT via
"nvidia,tegra210-admaif" compatible binding.

Tegra PCM driver is updated to expose required PCM interfaces and
snd_pcm_ops callbacks.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig           |  12 +
 sound/soc/tegra/Makefile          |   2 +
 sound/soc/tegra/tegra210_admaif.c | 896 ++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h | 164 +++++++
 sound/soc/tegra/tegra_pcm.c       | 224 +++++++++-
 sound/soc/tegra/tegra_pcm.h       |  23 +-
 6 files changed, 1319 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/tegra/tegra210_admaif.c
 create mode 100644 sound/soc/tegra/tegra210_admaif.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index fb77df3..c0a5f0b 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -106,6 +106,18 @@ config SND_SOC_TEGRA186_DSPK
           the desired 1-bit output via Delta Sigma Modulation (DSM).
           Say Y or M if you want to add support for Tegra186 DSPK module.
 
+config SND_SOC_TEGRA210_ADMAIF
+        tristate "Tegra210 ADMAIF module"
+        depends on SND_SOC_TEGRA
+        help
+          Config to enable ADMAIF which is the interface between ADMA and
+          Audio Hub (AHUB). Each ADMA channel that sends/receives data to/
+          from AHUB must interface through an ADMAIF channel. ADMA channel
+          sending data to AHUB pairs with an ADMAIF Tx channel, where as
+          ADMA channel receiving data from AHUB pairs with an ADMAIF Rx
+          channel. Buffer size is confiigurable for each ADMAIIF channel.
+          Say Y or M if you want to add support for Tegra210 ADMAIF module.
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on SND_SOC_TEGRA && I2C && GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 7ad8169..1033464 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -13,6 +13,7 @@ snd-soc-tegra210-ahub-objs := tegra210_ahub.o
 snd-soc-tegra210-dmic-objs := tegra210_dmic.o
 snd-soc-tegra210-i2s-objs := tegra210_i2s.o
 snd-soc-tegra186-dspk-objs := tegra186_dspk.o
+snd-soc-tegra210-admaif-objs := tegra210_admaif.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
@@ -27,6 +28,7 @@ obj-$(CONFIG_SND_SOC_TEGRA210_DMIC) += snd-soc-tegra210-dmic.o
 obj-$(CONFIG_SND_SOC_TEGRA210_AHUB) += snd-soc-tegra210-ahub.o
 obj-$(CONFIG_SND_SOC_TEGRA210_I2S) += snd-soc-tegra210-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA186_DSPK) += snd-soc-tegra186-dspk.o
+obj-$(CONFIG_SND_SOC_TEGRA210_ADMAIF) += snd-soc-tegra210-admaif.o
 
 # Tegra machine Support
 snd-soc-tegra-rt5640-objs := tegra_rt5640.o
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
new file mode 100644
index 0000000..278700f
--- /dev/null
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -0,0 +1,896 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra210_admaif.c - Tegra ADMAIF driver
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/of_platform.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/clk.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "tegra210_admaif.h"
+#include "tegra_pcm.h"
+#include "tegra_cif.h"
+
+#define DRV_NAME "tegra210-admaif"
+
+#define CH_REG(offset, reg, id)						       \
+	((offset) + (reg) + (TEGRA_ADMAIF_CHANNEL_REG_STRIDE * (id)))
+
+#define CH_TX_REG(reg, id) CH_REG(admaif->soc_data->tx_base, reg, id)
+
+#define CH_RX_REG(reg, id) CH_REG(admaif->soc_data->rx_base, reg, id)
+
+#define REG_DEFAULTS(id, rx_ctrl, tx_ctrl, tx_base, rx_base)		       \
+	{ CH_REG(rx_base, TEGRA_ADMAIF_RX_INT_MASK, id), 0x00000001},	       \
+	{ CH_REG(rx_base, TEGRA_ADMAIF_CH_ACIF_RX_CTRL, id), 0x00007700},      \
+	{ CH_REG(rx_base, TEGRA_ADMAIF_RX_FIFO_CTRL, id), rx_ctrl},	       \
+	{ CH_REG(tx_base, TEGRA_ADMAIF_TX_INT_MASK, id), 0x00000001},	       \
+	{ CH_REG(tx_base, TEGRA_ADMAIF_CH_ACIF_TX_CTRL, id), 0x00007700},      \
+	{ CH_REG(tx_base, TEGRA_ADMAIF_TX_FIFO_CTRL, id), tx_ctrl}
+
+#define ADMAIF_REG_DEFAULTS(id, chip)					       \
+	REG_DEFAULTS((id - 1),						       \
+		chip ## _ADMAIF_RX ## id ## _FIFO_CTRL_REG_DEFAULT,	       \
+		chip ## _ADMAIF_TX ## id ## _FIFO_CTRL_REG_DEFAULT,	       \
+		chip ## _ADMAIF_TX_BASE,				       \
+		chip ## _ADMAIF_RX_BASE)
+
+static const struct reg_default tegra186_admaif_reg_defaults[] = {
+	{(TEGRA_ADMAIF_GLOBAL_CG_0 + TEGRA186_ADMAIF_GLOBAL_BASE), 0x00000003},
+	ADMAIF_REG_DEFAULTS(1, TEGRA186),
+	ADMAIF_REG_DEFAULTS(2, TEGRA186),
+	ADMAIF_REG_DEFAULTS(3, TEGRA186),
+	ADMAIF_REG_DEFAULTS(4, TEGRA186),
+	ADMAIF_REG_DEFAULTS(5, TEGRA186),
+	ADMAIF_REG_DEFAULTS(6, TEGRA186),
+	ADMAIF_REG_DEFAULTS(7, TEGRA186),
+	ADMAIF_REG_DEFAULTS(8, TEGRA186),
+	ADMAIF_REG_DEFAULTS(9, TEGRA186),
+	ADMAIF_REG_DEFAULTS(10, TEGRA186),
+	ADMAIF_REG_DEFAULTS(11, TEGRA186),
+	ADMAIF_REG_DEFAULTS(12, TEGRA186),
+	ADMAIF_REG_DEFAULTS(13, TEGRA186),
+	ADMAIF_REG_DEFAULTS(14, TEGRA186),
+	ADMAIF_REG_DEFAULTS(15, TEGRA186),
+	ADMAIF_REG_DEFAULTS(16, TEGRA186),
+	ADMAIF_REG_DEFAULTS(17, TEGRA186),
+	ADMAIF_REG_DEFAULTS(18, TEGRA186),
+	ADMAIF_REG_DEFAULTS(19, TEGRA186),
+	ADMAIF_REG_DEFAULTS(20, TEGRA186)
+};
+
+static const struct reg_default tegra210_admaif_reg_defaults[] = {
+	{(TEGRA_ADMAIF_GLOBAL_CG_0+TEGRA210_ADMAIF_GLOBAL_BASE), 0x00000003},
+	ADMAIF_REG_DEFAULTS(1, TEGRA210),
+	ADMAIF_REG_DEFAULTS(2, TEGRA210),
+	ADMAIF_REG_DEFAULTS(3, TEGRA210),
+	ADMAIF_REG_DEFAULTS(4, TEGRA210),
+	ADMAIF_REG_DEFAULTS(5, TEGRA210),
+	ADMAIF_REG_DEFAULTS(6, TEGRA210),
+	ADMAIF_REG_DEFAULTS(7, TEGRA210),
+	ADMAIF_REG_DEFAULTS(8, TEGRA210),
+	ADMAIF_REG_DEFAULTS(9, TEGRA210),
+	ADMAIF_REG_DEFAULTS(10, TEGRA210)
+};
+
+static bool tegra_admaif_wr_reg(struct device *dev, unsigned int reg)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+	unsigned int ch_stride = TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
+	unsigned int num_ch = admaif->soc_data->num_ch;
+	unsigned int rx_base = admaif->soc_data->rx_base;
+	unsigned int tx_base = admaif->soc_data->tx_base;
+	unsigned int global_base = admaif->soc_data->global_base;
+	unsigned int reg_max = admaif->soc_data->regmap_conf->max_register;
+	unsigned int rx_max = rx_base + (num_ch * ch_stride);
+	unsigned int tx_max = tx_base + (num_ch * ch_stride);
+
+	if ((reg >= rx_base) && (reg < rx_max)) {
+		reg = (reg - rx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_RX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_RX_FIFO_CTRL) ||
+		    (reg == TEGRA_ADMAIF_RX_SOFT_RESET) ||
+		    (reg == TEGRA_ADMAIF_CH_ACIF_RX_CTRL))
+			return true;
+	} else if ((reg >= tx_base) && (reg < tx_max)) {
+		reg = (reg - tx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_TX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_TX_FIFO_CTRL) ||
+		    (reg == TEGRA_ADMAIF_TX_SOFT_RESET) ||
+		    (reg == TEGRA_ADMAIF_CH_ACIF_TX_CTRL))
+			return true;
+	} else if ((reg >= global_base) && (reg < reg_max)) {
+		if (reg == (global_base + TEGRA_ADMAIF_GLOBAL_ENABLE))
+			return true;
+	}
+
+	return false;
+}
+
+static bool tegra_admaif_rd_reg(struct device *dev, unsigned int reg)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+	unsigned int ch_stride = TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
+	unsigned int num_ch = admaif->soc_data->num_ch;
+	unsigned int rx_base = admaif->soc_data->rx_base;
+	unsigned int tx_base = admaif->soc_data->tx_base;
+	unsigned int global_base = admaif->soc_data->global_base;
+	unsigned int reg_max = admaif->soc_data->regmap_conf->max_register;
+	unsigned int rx_max = rx_base + (num_ch * ch_stride);
+	unsigned int tx_max = tx_base + (num_ch * ch_stride);
+
+	if ((reg >= rx_base) && (reg < rx_max)) {
+		reg = (reg - rx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_RX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_RX_STATUS) ||
+		    (reg == TEGRA_ADMAIF_RX_INT_STATUS) ||
+		    (reg == TEGRA_ADMAIF_RX_FIFO_CTRL) ||
+		    (reg == TEGRA_ADMAIF_RX_SOFT_RESET) ||
+		    (reg == TEGRA_ADMAIF_CH_ACIF_RX_CTRL))
+			return true;
+	} else if ((reg >= tx_base) && (reg < tx_max)) {
+		reg = (reg - tx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_TX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_TX_STATUS) ||
+		    (reg == TEGRA_ADMAIF_TX_INT_STATUS) ||
+		    (reg == TEGRA_ADMAIF_TX_FIFO_CTRL) ||
+		    (reg == TEGRA_ADMAIF_TX_SOFT_RESET) ||
+		    (reg == TEGRA_ADMAIF_CH_ACIF_TX_CTRL))
+			return true;
+	} else if ((reg >= global_base) && (reg < reg_max)) {
+		if ((reg == (global_base + TEGRA_ADMAIF_GLOBAL_ENABLE)) ||
+		    (reg == (global_base + TEGRA_ADMAIF_GLOBAL_CG_0)) ||
+		    (reg == (global_base + TEGRA_ADMAIF_GLOBAL_STATUS)) ||
+		    (reg == (global_base +
+				TEGRA_ADMAIF_GLOBAL_RX_ENABLE_STATUS)) ||
+		    (reg == (global_base +
+				TEGRA_ADMAIF_GLOBAL_TX_ENABLE_STATUS)))
+			return true;
+	}
+
+	return false;
+}
+
+static bool tegra_admaif_volatile_reg(struct device *dev, unsigned int reg)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+	unsigned int ch_stride = TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
+	unsigned int num_ch = admaif->soc_data->num_ch;
+	unsigned int rx_base = admaif->soc_data->rx_base;
+	unsigned int tx_base = admaif->soc_data->tx_base;
+	unsigned int global_base = admaif->soc_data->global_base;
+	unsigned int reg_max = admaif->soc_data->regmap_conf->max_register;
+	unsigned int rx_max = rx_base + (num_ch * ch_stride);
+	unsigned int tx_max = tx_base + (num_ch * ch_stride);
+
+	if ((reg >= rx_base) && (reg < rx_max)) {
+		reg = (reg - rx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_RX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_RX_STATUS) ||
+		    (reg == TEGRA_ADMAIF_RX_INT_STATUS) ||
+		    (reg == TEGRA_ADMAIF_RX_SOFT_RESET))
+			return true;
+	} else if ((reg >= tx_base) && (reg < tx_max)) {
+		reg = (reg - tx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_TX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_TX_STATUS) ||
+		    (reg == TEGRA_ADMAIF_TX_INT_STATUS) ||
+		    (reg == TEGRA_ADMAIF_TX_SOFT_RESET))
+			return true;
+	} else if ((reg >= global_base) && (reg < reg_max)) {
+		if ((reg == (global_base + TEGRA_ADMAIF_GLOBAL_STATUS)) ||
+		    (reg == (global_base +
+				TEGRA_ADMAIF_GLOBAL_RX_ENABLE_STATUS)) ||
+		    (reg == (global_base +
+				TEGRA_ADMAIF_GLOBAL_TX_ENABLE_STATUS)))
+			return true;
+	}
+
+	return false;
+}
+
+static const struct regmap_config tegra210_admaif_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_ADMAIF_LAST_REG,
+	.writeable_reg		= tegra_admaif_wr_reg,
+	.readable_reg		= tegra_admaif_rd_reg,
+	.volatile_reg		= tegra_admaif_volatile_reg,
+	.reg_defaults		= tegra210_admaif_reg_defaults,
+	.num_reg_defaults	= TEGRA210_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct regmap_config tegra186_admaif_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA186_ADMAIF_LAST_REG,
+	.writeable_reg		= tegra_admaif_wr_reg,
+	.readable_reg		= tegra_admaif_rd_reg,
+	.volatile_reg		= tegra_admaif_volatile_reg,
+	.reg_defaults		= tegra186_admaif_reg_defaults,
+	.num_reg_defaults	= TEGRA186_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static int tegra_admaif_runtime_suspend(struct device *dev)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+
+	regcache_cache_only(admaif->regmap, true);
+	regcache_mark_dirty(admaif->regmap);
+
+	return 0;
+}
+
+static int tegra_admaif_runtime_resume(struct device *dev)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+
+	regcache_cache_only(admaif->regmap, false);
+	regcache_sync(admaif->regmap);
+
+	return 0;
+}
+
+static int tegra_admaif_set_pack_mode(struct regmap *map, unsigned int reg,
+				      int valid_bit)
+{
+	switch (valid_bit) {
+	case DATA_8BIT:
+		regmap_update_bits(map, reg, PACK8_EN_MASK, PACK8_EN);
+		regmap_update_bits(map, reg, PACK16_EN_MASK, 0);
+		break;
+	case DATA_16BIT:
+		regmap_update_bits(map, reg, PACK16_EN_MASK, PACK16_EN);
+		regmap_update_bits(map, reg, PACK8_EN_MASK, 0);
+		break;
+	case DATA_32BIT:
+		regmap_update_bits(map, reg, PACK16_EN_MASK, 0);
+		regmap_update_bits(map, reg, PACK8_EN_MASK, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int tegra_admaif_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->dev;
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+	struct tegra_cif_conf cif_conf;
+	unsigned int reg, path;
+	int valid_bit, channels;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_8;
+		valid_bit = DATA_8BIT;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_16;
+		valid_bit = DATA_16BIT;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_32;
+		valid_bit  = DATA_32BIT;
+		break;
+	default:
+		dev_err(dev, "unsupported format!\n");
+		return -ENOTSUPP;
+	}
+
+	channels = params_channels(params);
+	cif_conf.client_ch = channels;
+	cif_conf.audio_ch = channels;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		path = ADMAIF_TX_PATH;
+		reg = CH_TX_REG(TEGRA_ADMAIF_CH_ACIF_TX_CTRL, dai->id);
+	} else {
+		path = ADMAIF_RX_PATH;
+		reg = CH_RX_REG(TEGRA_ADMAIF_CH_ACIF_RX_CTRL, dai->id);
+	}
+
+	if (admaif->audio_ch_override[path][dai->id])
+		cif_conf.audio_ch = admaif->audio_ch_override[path][dai->id];
+
+	if (admaif->client_ch_override[path][dai->id])
+		cif_conf.client_ch = admaif->client_ch_override[path][dai->id];
+
+	cif_conf.mono_conv = admaif->mono_to_stereo[path][dai->id];
+	cif_conf.stereo_conv = admaif->stereo_to_mono[path][dai->id];
+
+	tegra_admaif_set_pack_mode(admaif->regmap, reg, valid_bit);
+
+	tegra_set_cif(admaif->regmap, reg, &cif_conf);
+
+	return 0;
+}
+
+static int tegra_admaif_start(struct snd_soc_dai *dai, int direction)
+{
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+	unsigned int reg, mask, val;
+
+	switch (direction) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		mask = TX_ENABLE_MASK;
+		val = TX_ENABLE;
+		reg = CH_TX_REG(TEGRA_ADMAIF_TX_ENABLE, dai->id);
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		mask = RX_ENABLE_MASK;
+		val = RX_ENABLE;
+		reg = CH_RX_REG(TEGRA_ADMAIF_RX_ENABLE, dai->id);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(admaif->regmap, reg, mask, val);
+
+	return 0;
+}
+
+static int tegra_admaif_stop(struct snd_soc_dai *dai, int direction)
+{
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+	unsigned int enable_reg, status_reg, reset_reg, mask, val;
+	char *dir_name;
+	int ret, enable;
+
+	switch (direction) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		mask = TX_ENABLE_MASK;
+		enable = TX_ENABLE;
+		dir_name = "TX";
+		enable_reg = CH_TX_REG(TEGRA_ADMAIF_TX_ENABLE, dai->id);
+		status_reg = CH_TX_REG(TEGRA_ADMAIF_TX_STATUS, dai->id);
+		reset_reg = CH_TX_REG(TEGRA_ADMAIF_TX_SOFT_RESET, dai->id);
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		mask = RX_ENABLE_MASK;
+		enable = RX_ENABLE;
+		dir_name = "RX";
+		enable_reg = CH_RX_REG(TEGRA_ADMAIF_RX_ENABLE, dai->id);
+		status_reg = CH_RX_REG(TEGRA_ADMAIF_RX_STATUS, dai->id);
+		reset_reg = CH_RX_REG(TEGRA_ADMAIF_RX_SOFT_RESET, dai->id);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Disable TX/RX channel */
+	regmap_update_bits(admaif->regmap, enable_reg, mask, ~enable);
+
+	/* Wait until ADMAIF TX/RX status is disabled */
+	ret = regmap_read_poll_timeout_atomic(admaif->regmap, status_reg, val,
+					      !(val & enable), 10, 10000);
+	if (ret < 0)
+		dev_warn(dai->dev, "timeout: failed to disable ADMAIF%d_%s\n",
+			dai->id + 1, dir_name);
+
+	/* SW reset */
+	regmap_update_bits(admaif->regmap, reset_reg, SW_RESET_MASK, SW_RESET);
+
+	/* Wait till SW reset is complete */
+	ret = regmap_read_poll_timeout_atomic(admaif->regmap, reset_reg, val,
+					      !(val & SW_RESET_MASK & SW_RESET),
+					      10, 10000);
+	if (ret < 0) {
+		dev_err(dai->dev, "timeout: SW reset failed for ADMAIF%d_%s\n",
+			dai->id + 1, dir_name);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tegra_admaif_trigger(struct snd_pcm_substream *substream, int cmd,
+				struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = snd_dmaengine_pcm_trigger(substream, cmd);
+	if (ret < 0)
+		return ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		return tegra_admaif_start(dai, substream->stream);
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		return tegra_admaif_stop(dai, substream->stream);
+	default:
+		return -EINVAL;
+	}
+}
+
+static struct snd_soc_dai_ops tegra_admaif_dai_ops = {
+	.hw_params	= tegra_admaif_hw_params,
+	.trigger	= tegra_admaif_trigger,
+};
+
+static int tegra_admaif_get_control(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	long *uctl_val = &ucontrol->value.integer.value[0];
+
+	if (strstr(kcontrol->id.name, "Playback Audio Channels"))
+		*uctl_val = admaif->audio_ch_override[ADMAIF_TX_PATH][mc->reg];
+	else if (strstr(kcontrol->id.name, "Capture Audio Channels"))
+		*uctl_val = admaif->audio_ch_override[ADMAIF_RX_PATH][mc->reg];
+	else if (strstr(kcontrol->id.name, "Playback Client Channels"))
+		*uctl_val = admaif->client_ch_override[ADMAIF_TX_PATH][mc->reg];
+	else if (strstr(kcontrol->id.name, "Capture Client Channels"))
+		*uctl_val = admaif->client_ch_override[ADMAIF_RX_PATH][mc->reg];
+	else if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
+		*uctl_val = admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg];
+	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
+		*uctl_val = admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg];
+	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
+		*uctl_val = admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg];
+	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
+		*uctl_val = admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg];
+
+	return 0;
+}
+
+static int tegra_admaif_put_control(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	int value = ucontrol->value.integer.value[0];
+
+	if (strstr(kcontrol->id.name, "Playback Audio Channels"))
+		admaif->audio_ch_override[ADMAIF_TX_PATH][mc->reg] = value;
+	else if (strstr(kcontrol->id.name, "Capture Audio Channels"))
+		admaif->audio_ch_override[ADMAIF_RX_PATH][mc->reg] = value;
+	else if (strstr(kcontrol->id.name, "Playback Client Channels"))
+		admaif->client_ch_override[ADMAIF_TX_PATH][mc->reg] = value;
+	else if (strstr(kcontrol->id.name, "Capture Client Channels"))
+		admaif->client_ch_override[ADMAIF_RX_PATH][mc->reg] = value;
+	else if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
+		admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;
+	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
+		admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] = value;
+	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
+		admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] = value;
+	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
+		admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] = value;
+
+	return 0;
+}
+
+static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
+{
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+
+	dai->capture_dma_data = &admaif->capture_dma_data[dai->id];
+	dai->playback_dma_data = &admaif->playback_dma_data[dai->id];
+
+	return 0;
+}
+
+#define ADMAIF_DAI(id)						\
+	{							\
+		.name = "ADMAIF" #id,				\
+		.probe = tegra_admaif_dai_probe,		\
+		.playback = {					\
+			.stream_name = "Playback " #id,		\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.capture = {					\
+			.stream_name = "Capture " #id,		\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.ops = &tegra_admaif_dai_ops,			\
+	}
+
+static struct snd_soc_dai_driver tegra210_admaif_cmpnt_dais[] = {
+	ADMAIF_DAI(1),
+	ADMAIF_DAI(2),
+	ADMAIF_DAI(3),
+	ADMAIF_DAI(4),
+	ADMAIF_DAI(5),
+	ADMAIF_DAI(6),
+	ADMAIF_DAI(7),
+	ADMAIF_DAI(8),
+	ADMAIF_DAI(9),
+	ADMAIF_DAI(10),
+};
+
+static struct snd_soc_dai_driver tegra186_admaif_cmpnt_dais[] = {
+	ADMAIF_DAI(1),
+	ADMAIF_DAI(2),
+	ADMAIF_DAI(3),
+	ADMAIF_DAI(4),
+	ADMAIF_DAI(5),
+	ADMAIF_DAI(6),
+	ADMAIF_DAI(7),
+	ADMAIF_DAI(8),
+	ADMAIF_DAI(9),
+	ADMAIF_DAI(10),
+	ADMAIF_DAI(11),
+	ADMAIF_DAI(12),
+	ADMAIF_DAI(13),
+	ADMAIF_DAI(14),
+	ADMAIF_DAI(15),
+	ADMAIF_DAI(16),
+	ADMAIF_DAI(17),
+	ADMAIF_DAI(18),
+	ADMAIF_DAI(19),
+	ADMAIF_DAI(20),
+};
+
+static const char * const tegra_admaif_stereo_conv_text[] = {
+	"CH0", "CH1", "AVG",
+};
+
+static const char * const tegra_admaif_mono_conv_text[] = {
+	"ZERO", "COPY",
+};
+
+#define TEGRA_ADMAIF_CHANNEL_CTRL(reg)					  \
+	SOC_SINGLE_EXT("ADMAIF" #reg " Playback Audio Channels", reg - 1, \
+		       0, 16, 0, tegra_admaif_get_control,		  \
+		       tegra_admaif_put_control),			  \
+	SOC_SINGLE_EXT("ADMAIF" #reg " Capture Audio Channels", reg - 1,  \
+		       0, 16, 0, tegra_admaif_get_control,		  \
+		       tegra_admaif_put_control),			  \
+	SOC_SINGLE_EXT("ADMAIF" #reg " Playback Client Channels", reg - 1,\
+		       0, 16, 0, tegra_admaif_get_control,		  \
+		       tegra_admaif_put_control),			  \
+	SOC_SINGLE_EXT("ADMAIF" #reg " Capture Client Channels", reg - 1, \
+		       0, 16, 0, tegra_admaif_get_control,		  \
+		       tegra_admaif_put_control)
+
+/*
+ * Below macro is added to avoid looping over all ADMAIFx controls related
+ * to mono/stereo conversions in get()/put() callbacks.
+ */
+#define NV_SOC_ENUM_EXT(xname, xreg, xhandler_get, xhandler_put, xenum_text)   \
+{									       \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,				       \
+	.info = snd_soc_info_enum_double,				       \
+	.name = xname,							       \
+	.get = xhandler_get,						       \
+	.put = xhandler_put,						       \
+	.private_value = (unsigned long)&(struct soc_enum)		       \
+		SOC_ENUM_SINGLE(xreg, 0, ARRAY_SIZE(xenum_text), xenum_text)   \
+}
+
+#define TEGRA_ADMAIF_CIF_CTRL(reg)					       \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Playback Mono To Stereo", reg - 1,\
+			tegra_admaif_get_control, tegra_admaif_put_control,    \
+			tegra_admaif_mono_conv_text),			       \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Playback Stereo To Mono", reg - 1,\
+			tegra_admaif_get_control, tegra_admaif_put_control,    \
+			tegra_admaif_stereo_conv_text),			       \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Capture Mono To Stereo", reg - 1, \
+			tegra_admaif_get_control, tegra_admaif_put_control,    \
+			tegra_admaif_mono_conv_text),			       \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Capture Stereo To Mono", reg - 1, \
+			tegra_admaif_get_control, tegra_admaif_put_control,    \
+			tegra_admaif_stereo_conv_text)
+
+static struct snd_kcontrol_new tegra210_admaif_controls[] = {
+	TEGRA_ADMAIF_CHANNEL_CTRL(1),
+	TEGRA_ADMAIF_CHANNEL_CTRL(2),
+	TEGRA_ADMAIF_CHANNEL_CTRL(3),
+	TEGRA_ADMAIF_CHANNEL_CTRL(4),
+	TEGRA_ADMAIF_CHANNEL_CTRL(5),
+	TEGRA_ADMAIF_CHANNEL_CTRL(6),
+	TEGRA_ADMAIF_CHANNEL_CTRL(7),
+	TEGRA_ADMAIF_CHANNEL_CTRL(8),
+	TEGRA_ADMAIF_CHANNEL_CTRL(9),
+	TEGRA_ADMAIF_CHANNEL_CTRL(10),
+	TEGRA_ADMAIF_CIF_CTRL(1),
+	TEGRA_ADMAIF_CIF_CTRL(2),
+	TEGRA_ADMAIF_CIF_CTRL(3),
+	TEGRA_ADMAIF_CIF_CTRL(4),
+	TEGRA_ADMAIF_CIF_CTRL(5),
+	TEGRA_ADMAIF_CIF_CTRL(6),
+	TEGRA_ADMAIF_CIF_CTRL(7),
+	TEGRA_ADMAIF_CIF_CTRL(8),
+	TEGRA_ADMAIF_CIF_CTRL(9),
+	TEGRA_ADMAIF_CIF_CTRL(10),
+};
+
+static struct snd_kcontrol_new tegra186_admaif_controls[] = {
+	TEGRA_ADMAIF_CHANNEL_CTRL(1),
+	TEGRA_ADMAIF_CHANNEL_CTRL(2),
+	TEGRA_ADMAIF_CHANNEL_CTRL(3),
+	TEGRA_ADMAIF_CHANNEL_CTRL(4),
+	TEGRA_ADMAIF_CHANNEL_CTRL(5),
+	TEGRA_ADMAIF_CHANNEL_CTRL(6),
+	TEGRA_ADMAIF_CHANNEL_CTRL(7),
+	TEGRA_ADMAIF_CHANNEL_CTRL(8),
+	TEGRA_ADMAIF_CHANNEL_CTRL(9),
+	TEGRA_ADMAIF_CHANNEL_CTRL(10),
+	TEGRA_ADMAIF_CHANNEL_CTRL(11),
+	TEGRA_ADMAIF_CHANNEL_CTRL(12),
+	TEGRA_ADMAIF_CHANNEL_CTRL(13),
+	TEGRA_ADMAIF_CHANNEL_CTRL(14),
+	TEGRA_ADMAIF_CHANNEL_CTRL(15),
+	TEGRA_ADMAIF_CHANNEL_CTRL(16),
+	TEGRA_ADMAIF_CHANNEL_CTRL(17),
+	TEGRA_ADMAIF_CHANNEL_CTRL(18),
+	TEGRA_ADMAIF_CHANNEL_CTRL(19),
+	TEGRA_ADMAIF_CHANNEL_CTRL(20),
+	TEGRA_ADMAIF_CIF_CTRL(1),
+	TEGRA_ADMAIF_CIF_CTRL(2),
+	TEGRA_ADMAIF_CIF_CTRL(3),
+	TEGRA_ADMAIF_CIF_CTRL(4),
+	TEGRA_ADMAIF_CIF_CTRL(5),
+	TEGRA_ADMAIF_CIF_CTRL(6),
+	TEGRA_ADMAIF_CIF_CTRL(7),
+	TEGRA_ADMAIF_CIF_CTRL(8),
+	TEGRA_ADMAIF_CIF_CTRL(9),
+	TEGRA_ADMAIF_CIF_CTRL(10),
+	TEGRA_ADMAIF_CIF_CTRL(11),
+	TEGRA_ADMAIF_CIF_CTRL(12),
+	TEGRA_ADMAIF_CIF_CTRL(13),
+	TEGRA_ADMAIF_CIF_CTRL(14),
+	TEGRA_ADMAIF_CIF_CTRL(15),
+	TEGRA_ADMAIF_CIF_CTRL(16),
+	TEGRA_ADMAIF_CIF_CTRL(17),
+	TEGRA_ADMAIF_CIF_CTRL(18),
+	TEGRA_ADMAIF_CIF_CTRL(19),
+	TEGRA_ADMAIF_CIF_CTRL(20),
+};
+
+static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
+	.name			= DRV_NAME,
+	.controls		= tegra210_admaif_controls,
+	.num_controls		= ARRAY_SIZE(tegra210_admaif_controls),
+	.pcm_construct		= tegra_pcm_construct,
+	.pcm_destruct		= tegra_pcm_destruct,
+	.open			= tegra_pcm_open,
+	.close			= tegra_pcm_close,
+	.hw_params		= tegra_pcm_hw_params,
+	.hw_free		= tegra_pcm_hw_free,
+	.mmap			= tegra_pcm_mmap,
+	.pointer		= tegra_pcm_pointer,
+};
+
+static const struct snd_soc_component_driver tegra186_admaif_cmpnt = {
+	.name			= DRV_NAME,
+	.controls		= tegra186_admaif_controls,
+	.num_controls		= ARRAY_SIZE(tegra186_admaif_controls),
+	.pcm_construct		= tegra_pcm_construct,
+	.pcm_destruct		= tegra_pcm_destruct,
+	.open			= tegra_pcm_open,
+	.close			= tegra_pcm_close,
+	.hw_params		= tegra_pcm_hw_params,
+	.hw_free		= tegra_pcm_hw_free,
+	.mmap			= tegra_pcm_mmap,
+	.pointer		= tegra_pcm_pointer,
+};
+
+static const struct tegra_admaif_soc_data soc_data_tegra210 = {
+	.num_ch		= TEGRA210_ADMAIF_CHANNEL_COUNT,
+	.cmpnt		= &tegra210_admaif_cmpnt,
+	.dais		= tegra210_admaif_cmpnt_dais,
+	.regmap_conf	= &tegra210_admaif_regmap_config,
+	.global_base	= TEGRA210_ADMAIF_GLOBAL_BASE,
+	.tx_base	= TEGRA210_ADMAIF_TX_BASE,
+	.rx_base	= TEGRA210_ADMAIF_RX_BASE,
+};
+
+static struct tegra_admaif_soc_data soc_data_tegra186 = {
+	.num_ch		= TEGRA186_ADMAIF_CHANNEL_COUNT,
+	.cmpnt		= &tegra186_admaif_cmpnt,
+	.dais		= tegra186_admaif_cmpnt_dais,
+	.regmap_conf	= &tegra186_admaif_regmap_config,
+	.global_base	= TEGRA186_ADMAIF_GLOBAL_BASE,
+	.tx_base	= TEGRA186_ADMAIF_TX_BASE,
+	.rx_base	= TEGRA186_ADMAIF_RX_BASE,
+};
+
+
+static const struct of_device_id tegra_admaif_of_match[] = {
+	{ .compatible = "nvidia,tegra210-admaif", .data = &soc_data_tegra210 },
+	{ .compatible = "nvidia,tegra186-admaif", .data = &soc_data_tegra186 },
+	{},
+};
+
+static int tegra_admaif_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct tegra_admaif *admaif;
+	void __iomem *regs;
+	struct resource *res;
+	int ret, i;
+
+	match = of_match_device(tegra_admaif_of_match, &pdev->dev);
+	if (!match) {
+		dev_err(&pdev->dev, "error: No device match found\n");
+		return -ENODEV;
+	}
+
+	admaif = devm_kcalloc(&pdev->dev, 1, sizeof(*admaif), GFP_KERNEL);
+	if (!admaif)
+		return -ENOMEM;
+
+	admaif->soc_data = (struct tegra_admaif_soc_data *)match->data;
+	dev_set_drvdata(&pdev->dev, admaif);
+
+	admaif->capture_dma_data =
+		devm_kcalloc(&pdev->dev,
+			     admaif->soc_data->num_ch,
+			     sizeof(struct snd_dmaengine_dai_dma_data),
+			     GFP_KERNEL);
+	if (!admaif->capture_dma_data)
+		return -ENOMEM;
+
+	admaif->playback_dma_data =
+		devm_kcalloc(&pdev->dev,
+			     admaif->soc_data->num_ch,
+			     sizeof(struct snd_dmaengine_dai_dma_data),
+			     GFP_KERNEL);
+	if (!admaif->playback_dma_data)
+		return -ENOMEM;
+
+	for (i = 0; i < ADMAIF_PATHS; i++) {
+		admaif->audio_ch_override[i] =
+			devm_kcalloc(&pdev->dev, admaif->soc_data->num_ch,
+				     sizeof(unsigned int), GFP_KERNEL);
+		if (!admaif->audio_ch_override[i])
+			return -ENOMEM;
+
+		admaif->client_ch_override[i] =
+			devm_kcalloc(&pdev->dev, admaif->soc_data->num_ch,
+				     sizeof(unsigned int), GFP_KERNEL);
+		if (!admaif->client_ch_override[i])
+			return -ENOMEM;
+
+		admaif->mono_to_stereo[i] =
+			devm_kcalloc(&pdev->dev, admaif->soc_data->num_ch,
+				     sizeof(unsigned int), GFP_KERNEL);
+		if (!admaif->mono_to_stereo[i])
+			return -ENOMEM;
+
+		admaif->stereo_to_mono[i] =
+			devm_kcalloc(&pdev->dev, admaif->soc_data->num_ch,
+				     sizeof(unsigned int), GFP_KERNEL);
+		if (!admaif->stereo_to_mono[i])
+			return -ENOMEM;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	admaif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+					       admaif->soc_data->regmap_conf);
+	if (IS_ERR(admaif->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		return PTR_ERR(admaif->regmap);
+	}
+
+	regcache_cache_only(admaif->regmap, true);
+
+	regmap_update_bits(admaif->regmap, admaif->soc_data->global_base +
+			   TEGRA_ADMAIF_GLOBAL_ENABLE, 1, 1);
+
+	for (i = 0; i < admaif->soc_data->num_ch; i++) {
+		admaif->playback_dma_data[i].addr = res->start +
+			CH_TX_REG(TEGRA_ADMAIF_TX_FIFO_WRITE, i);
+
+		admaif->capture_dma_data[i].addr = res->start +
+			CH_RX_REG(TEGRA_ADMAIF_RX_FIFO_READ, i);
+
+		admaif->playback_dma_data[i].addr_width = 32;
+
+		if (of_property_read_string_index(pdev->dev.of_node,
+				"dma-names",
+				(i * 2) + 1,
+				&admaif->playback_dma_data[i].chan_name) < 0) {
+			dev_err(&pdev->dev,
+				"missing property nvidia,dma-names\n");
+			return -ENODEV;
+		}
+
+		admaif->capture_dma_data[i].addr_width = 32;
+
+		if (of_property_read_string_index(pdev->dev.of_node,
+				"dma-names",
+				(i * 2),
+				&admaif->capture_dma_data[i].chan_name) < 0) {
+			dev_err(&pdev->dev,
+				"missing property nvidia,dma-names\n");
+			return -ENODEV;
+		}
+	}
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      admaif->soc_data->cmpnt,
+					      admaif->soc_data->dais,
+					      admaif->soc_data->num_ch);
+	if (ret != 0) {
+		dev_err(&pdev->dev, "could not register component, err: %d\n",
+			ret);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int tegra_admaif_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra_admaif_runtime_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_admaif_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra_admaif_runtime_suspend,
+			   tegra_admaif_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra_admaif_driver = {
+	.probe = tegra_admaif_probe,
+	.remove = tegra_admaif_remove,
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = tegra_admaif_of_match,
+		.pm = &tegra_admaif_pm_ops,
+	},
+};
+module_platform_driver(tegra_admaif_driver);
+
+MODULE_AUTHOR("Songhee Baek <sbaek@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 ASoC ADMAIF driver");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, tegra_admaif_of_match);
diff --git a/sound/soc/tegra/tegra210_admaif.h b/sound/soc/tegra/tegra210_admaif.h
new file mode 100644
index 0000000..1743c0a
--- /dev/null
+++ b/sound/soc/tegra/tegra210_admaif.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_admaif.h - Tegra ADMAIF registers
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA_ADMAIF_H__
+#define __TEGRA_ADMAIF_H__
+
+#define TEGRA_ADMAIF_CHANNEL_REG_STRIDE			0x40
+/* Tegra210 specific */
+#define TEGRA210_ADMAIF_LAST_REG			0x75f
+#define TEGRA210_ADMAIF_CHANNEL_COUNT			10
+#define TEGRA210_ADMAIF_RX_BASE				0x0
+#define TEGRA210_ADMAIF_TX_BASE				0x300
+#define TEGRA210_ADMAIF_GLOBAL_BASE			0x700
+/* Tegra186 specific */
+#define TEGRA186_ADMAIF_LAST_REG			0xd5f
+#define TEGRA186_ADMAIF_CHANNEL_COUNT			20
+#define TEGRA186_ADMAIF_RX_BASE				0x0
+#define TEGRA186_ADMAIF_TX_BASE				0x500
+#define TEGRA186_ADMAIF_GLOBAL_BASE			0xd00
+/* Global registers */
+#define TEGRA_ADMAIF_GLOBAL_ENABLE			0x0
+#define TEGRA_ADMAIF_GLOBAL_CG_0			0x8
+#define TEGRA_ADMAIF_GLOBAL_STATUS			0x10
+#define TEGRA_ADMAIF_GLOBAL_RX_ENABLE_STATUS		0x20
+#define TEGRA_ADMAIF_GLOBAL_TX_ENABLE_STATUS		0x24
+/* RX channel registers */
+#define TEGRA_ADMAIF_RX_ENABLE				0x0
+#define TEGRA_ADMAIF_RX_SOFT_RESET			0x4
+#define TEGRA_ADMAIF_RX_STATUS				0xc
+#define TEGRA_ADMAIF_RX_INT_STATUS			0x10
+#define TEGRA_ADMAIF_RX_INT_MASK			0x14
+#define TEGRA_ADMAIF_RX_INT_SET				0x18
+#define TEGRA_ADMAIF_RX_INT_CLEAR			0x1c
+#define TEGRA_ADMAIF_CH_ACIF_RX_CTRL			0x20
+#define TEGRA_ADMAIF_RX_FIFO_CTRL			0x28
+#define TEGRA_ADMAIF_RX_FIFO_READ			0x2c
+/* TX channel registers */
+#define TEGRA_ADMAIF_TX_ENABLE				0x0
+#define TEGRA_ADMAIF_TX_SOFT_RESET			0x4
+#define TEGRA_ADMAIF_TX_STATUS				0xc
+#define TEGRA_ADMAIF_TX_INT_STATUS			0x10
+#define TEGRA_ADMAIF_TX_INT_MASK			0x14
+#define TEGRA_ADMAIF_TX_INT_SET				0x18
+#define TEGRA_ADMAIF_TX_INT_CLEAR			0x1c
+#define TEGRA_ADMAIF_CH_ACIF_TX_CTRL			0x20
+#define TEGRA_ADMAIF_TX_FIFO_CTRL			0x28
+#define TEGRA_ADMAIF_TX_FIFO_WRITE			0x2c
+/* Bit fields */
+#define PACK8_EN_SHIFT					31
+#define PACK8_EN_MASK					(1 << PACK8_EN_SHIFT)
+#define PACK8_EN					(1 << PACK8_EN_SHIFT)
+#define PACK16_EN_SHIFT					30
+#define PACK16_EN_MASK					(1 << PACK16_EN_SHIFT)
+#define PACK16_EN					(1 << PACK16_EN_SHIFT)
+#define TX_ENABLE_SHIFT					0
+#define TX_ENABLE_MASK					(1 << TX_ENABLE_SHIFT)
+#define TX_ENABLE					(1 << TX_ENABLE_SHIFT)
+#define RX_ENABLE_SHIFT					0
+#define RX_ENABLE_MASK					(1 << RX_ENABLE_SHIFT)
+#define RX_ENABLE					(1 << RX_ENABLE_SHIFT)
+#define SW_RESET_MASK					1
+#define SW_RESET					1
+/* Default values - Tegra210 */
+#define TEGRA210_ADMAIF_RX1_FIFO_CTRL_REG_DEFAULT	0x00000300
+#define TEGRA210_ADMAIF_RX2_FIFO_CTRL_REG_DEFAULT	0x00000304
+#define TEGRA210_ADMAIF_RX3_FIFO_CTRL_REG_DEFAULT	0x00000208
+#define TEGRA210_ADMAIF_RX4_FIFO_CTRL_REG_DEFAULT	0x0000020b
+#define TEGRA210_ADMAIF_RX5_FIFO_CTRL_REG_DEFAULT	0x0000020e
+#define TEGRA210_ADMAIF_RX6_FIFO_CTRL_REG_DEFAULT	0x00000211
+#define TEGRA210_ADMAIF_RX7_FIFO_CTRL_REG_DEFAULT	0x00000214
+#define TEGRA210_ADMAIF_RX8_FIFO_CTRL_REG_DEFAULT	0x00000217
+#define TEGRA210_ADMAIF_RX9_FIFO_CTRL_REG_DEFAULT	0x0000021a
+#define TEGRA210_ADMAIF_RX10_FIFO_CTRL_REG_DEFAULT	0x0000021d
+#define TEGRA210_ADMAIF_TX1_FIFO_CTRL_REG_DEFAULT	0x02000300
+#define TEGRA210_ADMAIF_TX2_FIFO_CTRL_REG_DEFAULT	0x02000304
+#define TEGRA210_ADMAIF_TX3_FIFO_CTRL_REG_DEFAULT	0x01800208
+#define TEGRA210_ADMAIF_TX4_FIFO_CTRL_REG_DEFAULT	0x0180020b
+#define TEGRA210_ADMAIF_TX5_FIFO_CTRL_REG_DEFAULT	0x0180020e
+#define TEGRA210_ADMAIF_TX6_FIFO_CTRL_REG_DEFAULT	0x01800211
+#define TEGRA210_ADMAIF_TX7_FIFO_CTRL_REG_DEFAULT	0x01800214
+#define TEGRA210_ADMAIF_TX8_FIFO_CTRL_REG_DEFAULT	0x01800217
+#define TEGRA210_ADMAIF_TX9_FIFO_CTRL_REG_DEFAULT	0x0180021a
+#define TEGRA210_ADMAIF_TX10_FIFO_CTRL_REG_DEFAULT	0x0180021d
+/* Default values - Tegra186 */
+#define TEGRA186_ADMAIF_RX1_FIFO_CTRL_REG_DEFAULT	0x00000300
+#define TEGRA186_ADMAIF_RX2_FIFO_CTRL_REG_DEFAULT	0x00000304
+#define TEGRA186_ADMAIF_RX3_FIFO_CTRL_REG_DEFAULT	0x00000308
+#define TEGRA186_ADMAIF_RX4_FIFO_CTRL_REG_DEFAULT	0x0000030c
+#define TEGRA186_ADMAIF_RX5_FIFO_CTRL_REG_DEFAULT	0x00000210
+#define TEGRA186_ADMAIF_RX6_FIFO_CTRL_REG_DEFAULT	0x00000213
+#define TEGRA186_ADMAIF_RX7_FIFO_CTRL_REG_DEFAULT	0x00000216
+#define TEGRA186_ADMAIF_RX8_FIFO_CTRL_REG_DEFAULT	0x00000219
+#define TEGRA186_ADMAIF_RX9_FIFO_CTRL_REG_DEFAULT	0x0000021c
+#define TEGRA186_ADMAIF_RX10_FIFO_CTRL_REG_DEFAULT	0x0000021f
+#define TEGRA186_ADMAIF_RX11_FIFO_CTRL_REG_DEFAULT	0x00000222
+#define TEGRA186_ADMAIF_RX12_FIFO_CTRL_REG_DEFAULT	0x00000225
+#define TEGRA186_ADMAIF_RX13_FIFO_CTRL_REG_DEFAULT	0x00000228
+#define TEGRA186_ADMAIF_RX14_FIFO_CTRL_REG_DEFAULT	0x0000022b
+#define TEGRA186_ADMAIF_RX15_FIFO_CTRL_REG_DEFAULT	0x0000022e
+#define TEGRA186_ADMAIF_RX16_FIFO_CTRL_REG_DEFAULT	0x00000231
+#define TEGRA186_ADMAIF_RX17_FIFO_CTRL_REG_DEFAULT	0x00000234
+#define TEGRA186_ADMAIF_RX18_FIFO_CTRL_REG_DEFAULT	0x00000237
+#define TEGRA186_ADMAIF_RX19_FIFO_CTRL_REG_DEFAULT	0x0000023a
+#define TEGRA186_ADMAIF_RX20_FIFO_CTRL_REG_DEFAULT	0x0000023d
+#define TEGRA186_ADMAIF_TX1_FIFO_CTRL_REG_DEFAULT	0x02000300
+#define TEGRA186_ADMAIF_TX2_FIFO_CTRL_REG_DEFAULT	0x02000304
+#define TEGRA186_ADMAIF_TX3_FIFO_CTRL_REG_DEFAULT	0x02000308
+#define TEGRA186_ADMAIF_TX4_FIFO_CTRL_REG_DEFAULT	0x0200030c
+#define TEGRA186_ADMAIF_TX5_FIFO_CTRL_REG_DEFAULT	0x01800210
+#define TEGRA186_ADMAIF_TX6_FIFO_CTRL_REG_DEFAULT	0x01800213
+#define TEGRA186_ADMAIF_TX7_FIFO_CTRL_REG_DEFAULT	0x01800216
+#define TEGRA186_ADMAIF_TX8_FIFO_CTRL_REG_DEFAULT	0x01800219
+#define TEGRA186_ADMAIF_TX9_FIFO_CTRL_REG_DEFAULT	0x0180021c
+#define TEGRA186_ADMAIF_TX10_FIFO_CTRL_REG_DEFAULT	0x0180021f
+#define TEGRA186_ADMAIF_TX11_FIFO_CTRL_REG_DEFAULT	0x01800222
+#define TEGRA186_ADMAIF_TX12_FIFO_CTRL_REG_DEFAULT	0x01800225
+#define TEGRA186_ADMAIF_TX13_FIFO_CTRL_REG_DEFAULT	0x01800228
+#define TEGRA186_ADMAIF_TX14_FIFO_CTRL_REG_DEFAULT	0x0180022b
+#define TEGRA186_ADMAIF_TX15_FIFO_CTRL_REG_DEFAULT	0x0180022e
+#define TEGRA186_ADMAIF_TX16_FIFO_CTRL_REG_DEFAULT	0x01800231
+#define TEGRA186_ADMAIF_TX17_FIFO_CTRL_REG_DEFAULT	0x01800234
+#define TEGRA186_ADMAIF_TX18_FIFO_CTRL_REG_DEFAULT	0x01800237
+#define TEGRA186_ADMAIF_TX19_FIFO_CTRL_REG_DEFAULT	0x0180023a
+#define TEGRA186_ADMAIF_TX20_FIFO_CTRL_REG_DEFAULT	0x0180023d
+
+enum {
+	DATA_8BIT,
+	DATA_16BIT,
+	DATA_32BIT
+};
+
+enum {
+	ADMAIF_RX_PATH,
+	ADMAIF_TX_PATH,
+	ADMAIF_PATHS,
+};
+
+struct tegra_admaif_soc_data {
+	const struct snd_soc_component_driver *cmpnt;
+	const struct regmap_config *regmap_conf;
+	struct snd_soc_dai_driver *dais;
+	unsigned int global_base;
+	unsigned int tx_base;
+	unsigned int rx_base;
+	unsigned int num_ch;
+};
+
+struct tegra_admaif {
+	struct snd_dmaengine_dai_dma_data *capture_dma_data;
+	struct snd_dmaengine_dai_dma_data *playback_dma_data;
+	const struct tegra_admaif_soc_data *soc_data;
+	unsigned int *audio_ch_override[ADMAIF_PATHS];
+	unsigned int *client_ch_override[ADMAIF_PATHS];
+	unsigned int *mono_to_stereo[ADMAIF_PATHS];
+	unsigned int *stereo_to_mono[ADMAIF_PATHS];
+	struct regmap *regmap;
+};
+
+#endif
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index f246df8..497a54d 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -16,12 +16,12 @@
  */
 
 #include <linux/module.h>
+#include <linux/dma-mapping.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/dmaengine_pcm.h>
-
 #include "tegra_pcm.h"
 
 static const struct snd_pcm_hardware tegra_pcm_hardware = {
@@ -67,6 +67,228 @@ void tegra_pcm_platform_unregister(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_platform_unregister);
 
+int tegra_pcm_open(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_dmaengine_dai_dma_data *dmap;
+	struct dma_chan *chan;
+	int ret;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	dmap = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+
+	/* Set HW params now that initialization is complete */
+	snd_soc_set_runtime_hwparams(substream, &tegra_pcm_hardware);
+
+	/* Ensure period size is multiple of 8 */
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 0x8);
+	if (ret) {
+		dev_err(rtd->dev, "failed to set constraint %d\n", ret);
+		return ret;
+	}
+
+	chan = dma_request_slave_channel(rtd->cpu_dai->dev, dmap->chan_name);
+	if (!chan) {
+		dev_err(rtd->cpu_dai->dev,
+			"dmaengine request slave channel failed! (%s)\n",
+			dmap->chan_name);
+		return -ENODEV;
+	}
+
+	ret = snd_dmaengine_pcm_open(substream, chan);
+	if (ret) {
+		dev_err(rtd->dev,
+			"dmaengine pcm open failed with err %d (%s)\n", ret,
+			dmap->chan_name);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_open);
+
+int tegra_pcm_close(struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	snd_dmaengine_pcm_close_release_chan(substream);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_close);
+
+int tegra_pcm_hw_params(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_dmaengine_dai_dma_data *dmap;
+	struct dma_slave_config slave_config;
+	struct dma_chan *chan;
+	int ret;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	dmap = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	if (!dmap)
+		return 0;
+
+	chan = snd_dmaengine_pcm_get_chan(substream);
+
+	ret = snd_hwparams_to_dma_slave_config(substream, params,
+					       &slave_config);
+	if (ret) {
+		dev_err(rtd->dev, "hw params config failed with err %d\n", ret);
+		return ret;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		slave_config.dst_addr = dmap->addr;
+		slave_config.dst_maxburst = 8;
+	} else {
+		slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		slave_config.src_addr = dmap->addr;
+		slave_config.src_maxburst = 8;
+	}
+
+	ret = dmaengine_slave_config(chan, &slave_config);
+	if (ret < 0) {
+		dev_err(rtd->dev, "dma slave config failed with err %d\n", ret);
+		return ret;
+	}
+
+	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_hw_params);
+
+int tegra_pcm_hw_free(struct snd_soc_component *component,
+		      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	snd_pcm_set_runtime_buffer(substream, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_hw_free);
+
+int tegra_pcm_mmap(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream,
+		   struct vm_area_struct *vma)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	return dma_mmap_wc(substream->pcm->card->dev, vma, runtime->dma_area,
+			   runtime->dma_addr, runtime->dma_bytes);
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_mmap);
+
+snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream)
+{
+	return snd_dmaengine_pcm_pointer(substream);
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_pointer);
+
+static int tegra_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream,
+					    size_t size)
+{
+	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
+	struct snd_dma_buffer *buf = &substream->dma_buffer;
+
+	buf->area = dma_alloc_wc(pcm->card->dev, size, &buf->addr, GFP_KERNEL);
+	if (!buf->area)
+		return -ENOMEM;
+
+	buf->private_data = NULL;
+	buf->dev.type = SNDRV_DMA_TYPE_DEV;
+	buf->dev.dev = pcm->card->dev;
+	buf->bytes = size;
+
+	return 0;
+}
+
+static void tegra_pcm_deallocate_dma_buffer(struct snd_pcm *pcm, int stream)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *buf;
+
+	substream = pcm->streams[stream].substream;
+	if (!substream)
+		return;
+
+	buf = &substream->dma_buffer;
+	if (!buf->area)
+		return;
+
+	dma_free_wc(pcm->card->dev, buf->bytes, buf->area, buf->addr);
+	buf->area = NULL;
+}
+
+static int tegra_pcm_dma_allocate(struct snd_soc_pcm_runtime *rtd,
+	size_t size)
+{
+	struct snd_pcm *pcm = rtd->pcm;
+	int ret = 0;
+
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+		ret = tegra_pcm_preallocate_dma_buffer(pcm,
+						SNDRV_PCM_STREAM_PLAYBACK,
+						size);
+		if (ret)
+			goto err;
+	}
+
+	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
+		ret = tegra_pcm_preallocate_dma_buffer(pcm,
+						SNDRV_PCM_STREAM_CAPTURE,
+						size);
+		if (ret)
+			goto err_free_play;
+	}
+
+	return 0;
+
+err_free_play:
+	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK);
+err:
+	return ret;
+}
+
+int tegra_pcm_construct(struct snd_soc_component *component,
+			struct snd_soc_pcm_runtime *rtd)
+{
+	return tegra_pcm_dma_allocate(rtd, tegra_pcm_hardware.buffer_bytes_max);
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_construct);
+
+void tegra_pcm_destruct(struct snd_soc_component *component,
+			struct snd_pcm *pcm)
+{
+	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_CAPTURE);
+	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK);
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_destruct);
+
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra PCM ASoC driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_pcm.h b/sound/soc/tegra/tegra_pcm.h
index 0433372..fe138a4 100644
--- a/sound/soc/tegra/tegra_pcm.h
+++ b/sound/soc/tegra/tegra_pcm.h
@@ -17,8 +17,29 @@
 #ifndef __TEGRA_PCM_H__
 #define __TEGRA_PCM_H__
 
-struct snd_dmaengine_pcm_config;
+#include <sound/dmaengine_pcm.h>
+#include <sound/asound.h>
 
+int tegra_pcm_construct(struct snd_soc_component *component,
+			struct snd_soc_pcm_runtime *rtd);
+void tegra_pcm_destruct(struct snd_soc_component *component,
+			struct snd_pcm *pcm);
+int tegra_pcm_open(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream);
+int tegra_pcm_close(struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream);
+int tegra_pcm_hw_params(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params);
+int tegra_pcm_hw_free(struct snd_soc_component *component,
+		      struct snd_pcm_substream *substream);
+int tegra_pcm_mmap(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream,
+		   struct vm_area_struct *vma);
+int tegra_pcm_trigger(struct snd_soc_component *component,
+		      struct snd_pcm_substream *substream, int cmd);
+snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream);
 int tegra_pcm_platform_register(struct device *dev);
 int tegra_pcm_platform_register_with_chan_names(struct device *dev,
 				struct snd_dmaengine_pcm_config *config,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

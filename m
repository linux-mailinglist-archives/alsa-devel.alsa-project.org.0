Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E014D926
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 11:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71B071672;
	Thu, 30 Jan 2020 11:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71B071672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580380752;
	bh=rHS156ZhtrNGveirSH5lOynotC00L7/yL3fuIN9Lreo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dBXEbIZOt1ha47tGesfbwrnNUzc7gPZ65YYdSwwQo8caSDPfqGqwULUpSWoD7xkUV
	 D+p93xc+/bPo7Ve5yZy9lrIBTq3nJ/mzTxaeLlQvSC4XRj24taaoWL17VTK9oSffaz
	 LGvW04ZF1FsvWbr/Z3J/Zho/q8lNWVVsENIylMyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FFDCF802C2;
	Thu, 30 Jan 2020 11:34:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2D6AF802A2; Thu, 30 Jan 2020 11:34:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F1E3F8028F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 11:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F1E3F8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="r8WGUW7M"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e32b1220000>; Thu, 30 Jan 2020 02:34:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 30 Jan 2020 02:34:30 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 30 Jan 2020 02:34:30 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 10:34:30 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 Jan 2020 10:34:30 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e32b1310003>; Thu, 30 Jan 2020 02:34:29 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
Date: Thu, 30 Jan 2020 16:03:38 +0530
Message-ID: <1580380422-3431-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580380450; bh=mT1bUCJpT2HoSow3av85i3uTqvl4QNLjbAxatIg4Rpc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=r8WGUW7M5pIafzKUZIEhkVTYgewJktBCbDJFXru3aVddGMKuAEBZRlpCdsQnroLuh
 bXFfXyuCjjzJge+2odnSkP1wgwmyPPlByY4wfn+77LuLwIAe+gjYFznoswDpGB/K0l
 k3+25aLoQR6rX+jSCwoAg8+wI+zteB7AZOWxjc/S7RZ8zR8RcE+KBoHb5/ctpvadTI
 nEas6kKxSNniyr6J1ZK6VocVsPCP95slciHA1kaB8f5IyIbY3tXXJBfUFJA/kgnwJI
 NJIlbfq2PhEwUyJDI1dYyud21kX+jgf/ulLCeD6on8fVNS6TfpemlmF3y5KllwnITJ
 OATaPX1lrAJRQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: [alsa-devel] [PATCH v2 5/9] ASoC: tegra: add Tegra210 based AHUB
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

The Audio Hub (AHUB) comprises a collection of hardware accelerators for
audio pre/post-processing and a programmable full crossbar (XBAR) for
routing audio data across these accelerators in time and in parallel.
AHUB supports multiple interfaces to I2S, DSPK, DMIC etc., XBAR is a
switch used to configure or modify audio routing between HW accelerators
present inside AHUB.

This patch registers AHUB component with ASoC framework. The component
driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
driver exposes AHUB interfaces, which can be used to connect different
components in the ASoC layer. Currently the driver takes care of XBAR
programming to allow audio data flow through various clients of the AHUB.
Makefile and Kconfig support is added to allow to build the driver. The
AHUB component can be enabled in the DT via below compatible bindings.
  - "nvidia,tegra210-ahub" for Tegra210
  - "nvidia,tegra186-ahub" for Tegra186 and Tegra194

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig         |  10 +
 sound/soc/tegra/Makefile        |   2 +
 sound/soc/tegra/tegra210_ahub.c | 653 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_ahub.h | 125 ++++++++
 4 files changed, 790 insertions(+)
 create mode 100644 sound/soc/tegra/tegra210_ahub.c
 create mode 100644 sound/soc/tegra/tegra210_ahub.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 157fa7a..0c07f63 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -62,6 +62,16 @@ config SND_SOC_TEGRA30_I2S
 	  Tegra30 I2S interface. You will also need to select the individual
 	  machine drivers to support below.
 
+config SND_SOC_TEGRA210_AHUB
+        tristate "Tegra210 AHUB module"
+        depends on SND_SOC_TEGRA
+        help
+	  Config to enable Audio Hub (AHUB) module, which comprises of a
+	  switch called Audio Crossbar (AXBAR) used to configure or modify
+	  the audio routing path between various HW accelerators present in
+	  AHUB.
+          Say Y or M if you want to add support for Tegra210 AHUB module.
+
 config SND_SOC_TEGRA210_DMIC
         tristate "Tegra210 DMIC module"
         depends on SND_SOC_TEGRA
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 1c4457d..5283d47 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -9,6 +9,7 @@ snd-soc-tegra20-spdif-objs := tegra20_spdif.o
 snd-soc-tegra30-ahub-objs := tegra30_ahub.o
 snd-soc-tegra30-i2s-objs := tegra30_i2s.o
 snd-soc-tegra-cif-objs := tegra_cif.o
+snd-soc-tegra210-ahub-objs := tegra210_ahub.o
 snd-soc-tegra210-dmic-objs := tegra210_dmic.o
 snd-soc-tegra210-i2s-objs := tegra210_i2s.o
 
@@ -22,6 +23,7 @@ obj-$(CONFIG_SND_SOC_TEGRA20_SPDIF) += snd-soc-tegra20-spdif.o
 obj-$(CONFIG_SND_SOC_TEGRA30_AHUB) += snd-soc-tegra30-ahub.o
 obj-$(CONFIG_SND_SOC_TEGRA30_I2S) += snd-soc-tegra30-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA210_DMIC) += snd-soc-tegra210-dmic.o
+obj-$(CONFIG_SND_SOC_TEGRA210_AHUB) += snd-soc-tegra210-ahub.o
 obj-$(CONFIG_SND_SOC_TEGRA210_I2S) += snd-soc-tegra210-i2s.o
 
 # Tegra machine Support
diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
new file mode 100644
index 0000000..bbfcd6c
--- /dev/null
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -0,0 +1,653 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra210_ahub.c - Tegra210 AHUB driver
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include "tegra210_ahub.h"
+
+static int tegra_ahub_get_value_enum(struct snd_kcontrol *kctl,
+				     struct snd_ctl_elem_value *uctl)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_kcontrol_component(kctl);
+	struct tegra_ahub *ahub = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *e = (struct soc_enum *)kctl->private_value;
+	unsigned int reg, i, bit_pos = 0;
+
+	/*
+	 * Find the bit position of current MUX input.
+	 * If nothing is set, position would be 0 and it corresponds to 'None'.
+	 */
+	for (i = 0; i < ahub->soc_data->reg_count; i++) {
+		unsigned int reg_val;
+
+		reg = e->reg + (TEGRA210_XBAR_PART1_RX * i);
+		snd_soc_component_read(cmpnt, reg, &reg_val);
+		reg_val &= ahub->soc_data->mask[i];
+
+		if (reg_val) {
+			bit_pos = ffs(reg_val) +
+				  (8 * cmpnt->val_bytes * i);
+			break;
+		}
+	}
+
+	/* Find index related to the item in array *_ahub_mux_texts[] */
+	for (i = 0; i < e->items; i++) {
+		if (bit_pos == e->values[i]) {
+			uctl->value.enumerated.item[0] = i;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
+				     struct snd_ctl_elem_value *uctl)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_kcontrol_component(kctl);
+	struct tegra_ahub *ahub = snd_soc_component_get_drvdata(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctl);
+	struct soc_enum *e = (struct soc_enum *)kctl->private_value;
+	struct snd_soc_dapm_update update[TEGRA_XBAR_UPDATE_MAX_REG] = { };
+	unsigned int *item = uctl->value.enumerated.item;
+	unsigned int value = e->values[item[0]];
+	unsigned int i, bit_pos, reg_idx = 0, reg_val = 0;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	if (value) {
+		/* Get the register index and value to set */
+		reg_idx = (value - 1) / (8 * cmpnt->val_bytes);
+		bit_pos = (value - 1) % (8 * cmpnt->val_bytes);
+		reg_val = BIT(bit_pos);
+	}
+
+	/*
+	 * Run through all parts of a MUX register to find the state changes.
+	 * There will be an additional update if new MUX input value is from
+	 * different part of the MUX register.
+	 */
+	for (i = 0; i < ahub->soc_data->reg_count; i++) {
+		update[i].reg = e->reg + (TEGRA210_XBAR_PART1_RX * i);
+		update[i].val = (i == reg_idx) ? reg_val : 0;
+		update[i].mask = ahub->soc_data->mask[i];
+		update[i].kcontrol = kctl;
+
+		/* Update widget power if state has changed */
+		if (snd_soc_component_test_bits(cmpnt, update[i].reg,
+						update[i].mask, update[i].val))
+			snd_soc_dapm_mux_update_power(dapm, kctl, item[0], e,
+						      &update[i]);
+	}
+
+	return 0;
+}
+
+static struct snd_soc_dai_driver tegra210_ahub_dais[] = {
+	DAI(ADMAIF1),
+	DAI(ADMAIF2),
+	DAI(ADMAIF3),
+	DAI(ADMAIF4),
+	DAI(ADMAIF5),
+	DAI(ADMAIF6),
+	DAI(ADMAIF7),
+	DAI(ADMAIF8),
+	DAI(ADMAIF9),
+	DAI(ADMAIF10),
+	DAI(I2S1),
+	DAI(I2S2),
+	DAI(I2S3),
+	DAI(I2S4),
+	DAI(I2S5),
+	DAI(DMIC1),
+	DAI(DMIC2),
+	DAI(DMIC3),
+};
+
+static struct snd_soc_dai_driver tegra186_ahub_dais[] = {
+	DAI(ADMAIF1),
+	DAI(ADMAIF2),
+	DAI(ADMAIF3),
+	DAI(ADMAIF4),
+	DAI(ADMAIF5),
+	DAI(ADMAIF6),
+	DAI(ADMAIF7),
+	DAI(ADMAIF8),
+	DAI(ADMAIF9),
+	DAI(ADMAIF10),
+	DAI(ADMAIF11),
+	DAI(ADMAIF12),
+	DAI(ADMAIF13),
+	DAI(ADMAIF14),
+	DAI(ADMAIF15),
+	DAI(ADMAIF16),
+	DAI(ADMAIF17),
+	DAI(ADMAIF18),
+	DAI(ADMAIF19),
+	DAI(ADMAIF20),
+	DAI(I2S1),
+	DAI(I2S2),
+	DAI(I2S3),
+	DAI(I2S4),
+	DAI(I2S5),
+	DAI(I2S6),
+	DAI(DMIC1),
+	DAI(DMIC2),
+	DAI(DMIC3),
+	DAI(DMIC4),
+	DAI(DSPK1),
+	DAI(DSPK2),
+};
+
+static const char * const tegra210_ahub_mux_texts[] = {
+	"None",
+	"ADMAIF1",
+	"ADMAIF2",
+	"ADMAIF3",
+	"ADMAIF4",
+	"ADMAIF5",
+	"ADMAIF6",
+	"ADMAIF7",
+	"ADMAIF8",
+	"ADMAIF9",
+	"ADMAIF10",
+	"I2S1",
+	"I2S2",
+	"I2S3",
+	"I2S4",
+	"I2S5",
+	"DMIC1",
+	"DMIC2",
+	"DMIC3",
+};
+
+static const char * const tegra186_ahub_mux_texts[] = {
+	"None",
+	"ADMAIF1",
+	"ADMAIF2",
+	"ADMAIF3",
+	"ADMAIF4",
+	"ADMAIF5",
+	"ADMAIF6",
+	"ADMAIF7",
+	"ADMAIF8",
+	"ADMAIF9",
+	"ADMAIF10",
+	"ADMAIF11",
+	"ADMAIF12",
+	"ADMAIF13",
+	"ADMAIF14",
+	"ADMAIF15",
+	"ADMAIF16",
+	"I2S1",
+	"I2S2",
+	"I2S3",
+	"I2S4",
+	"I2S5",
+	"I2S6",
+	"ADMAIF17",
+	"ADMAIF18",
+	"ADMAIF19",
+	"ADMAIF20",
+	"DMIC1",
+	"DMIC2",
+	"DMIC3",
+	"DMIC4",
+};
+
+static const int tegra210_ahub_mux_values[] = {
+	0,
+	MUX_VALUE(0, 0),
+	MUX_VALUE(0, 1),
+	MUX_VALUE(0, 2),
+	MUX_VALUE(0, 3),
+	MUX_VALUE(0, 4),
+	MUX_VALUE(0, 5),
+	MUX_VALUE(0, 6),
+	MUX_VALUE(0, 7),
+	MUX_VALUE(0, 8),
+	MUX_VALUE(0, 9),
+	MUX_VALUE(0, 16),
+	MUX_VALUE(0, 17),
+	MUX_VALUE(0, 18),
+	MUX_VALUE(0, 19),
+	MUX_VALUE(0, 20),
+};
+
+static const int tegra186_ahub_mux_values[] = {
+	0,
+	MUX_VALUE(0, 0),
+	MUX_VALUE(0, 1),
+	MUX_VALUE(0, 2),
+	MUX_VALUE(0, 3),
+	MUX_VALUE(0, 4),
+	MUX_VALUE(0, 5),
+	MUX_VALUE(0, 6),
+	MUX_VALUE(0, 7),
+	MUX_VALUE(0, 8),
+	MUX_VALUE(0, 9),
+	MUX_VALUE(0, 10),
+	MUX_VALUE(0, 11),
+	MUX_VALUE(0, 12),
+	MUX_VALUE(0, 13),
+	MUX_VALUE(0, 14),
+	MUX_VALUE(0, 15),
+	MUX_VALUE(0, 16),
+	MUX_VALUE(0, 17),
+	MUX_VALUE(0, 18),
+	MUX_VALUE(0, 19),
+	MUX_VALUE(0, 20),
+	MUX_VALUE(0, 21),
+	MUX_VALUE(3, 16),
+	MUX_VALUE(3, 17),
+	MUX_VALUE(3, 18),
+	MUX_VALUE(3, 19),
+	MUX_VALUE(2, 18),
+	MUX_VALUE(2, 19),
+	MUX_VALUE(2, 20),
+	MUX_VALUE(2, 21),
+};
+
+/* Controls for t210 */
+MUX_ENUM_CTRL_DECL(t210_admaif1_tx, 0x00);
+MUX_ENUM_CTRL_DECL(t210_admaif2_tx, 0x01);
+MUX_ENUM_CTRL_DECL(t210_admaif3_tx, 0x02);
+MUX_ENUM_CTRL_DECL(t210_admaif4_tx, 0x03);
+MUX_ENUM_CTRL_DECL(t210_admaif5_tx, 0x04);
+MUX_ENUM_CTRL_DECL(t210_admaif6_tx, 0x05);
+MUX_ENUM_CTRL_DECL(t210_admaif7_tx, 0x06);
+MUX_ENUM_CTRL_DECL(t210_admaif8_tx, 0x07);
+MUX_ENUM_CTRL_DECL(t210_admaif9_tx, 0x08);
+MUX_ENUM_CTRL_DECL(t210_admaif10_tx, 0x09);
+MUX_ENUM_CTRL_DECL(t210_i2s1_tx, 0x10);
+MUX_ENUM_CTRL_DECL(t210_i2s2_tx, 0x11);
+MUX_ENUM_CTRL_DECL(t210_i2s3_tx, 0x12);
+MUX_ENUM_CTRL_DECL(t210_i2s4_tx, 0x13);
+MUX_ENUM_CTRL_DECL(t210_i2s5_tx, 0x14);
+
+/* Controls for t186 */
+MUX_ENUM_CTRL_DECL_186(t186_admaif1_tx, 0x00);
+MUX_ENUM_CTRL_DECL_186(t186_admaif2_tx, 0x01);
+MUX_ENUM_CTRL_DECL_186(t186_admaif3_tx, 0x02);
+MUX_ENUM_CTRL_DECL_186(t186_admaif4_tx, 0x03);
+MUX_ENUM_CTRL_DECL_186(t186_admaif5_tx, 0x04);
+MUX_ENUM_CTRL_DECL_186(t186_admaif6_tx, 0x05);
+MUX_ENUM_CTRL_DECL_186(t186_admaif7_tx, 0x06);
+MUX_ENUM_CTRL_DECL_186(t186_admaif8_tx, 0x07);
+MUX_ENUM_CTRL_DECL_186(t186_admaif9_tx, 0x08);
+MUX_ENUM_CTRL_DECL_186(t186_admaif10_tx, 0x09);
+MUX_ENUM_CTRL_DECL_186(t186_i2s1_tx, 0x10);
+MUX_ENUM_CTRL_DECL_186(t186_i2s2_tx, 0x11);
+MUX_ENUM_CTRL_DECL_186(t186_i2s3_tx, 0x12);
+MUX_ENUM_CTRL_DECL_186(t186_i2s4_tx, 0x13);
+MUX_ENUM_CTRL_DECL_186(t186_i2s5_tx, 0x14);
+MUX_ENUM_CTRL_DECL_186(t186_admaif11_tx, 0x0a);
+MUX_ENUM_CTRL_DECL_186(t186_admaif12_tx, 0x0b);
+MUX_ENUM_CTRL_DECL_186(t186_admaif13_tx, 0x0c);
+MUX_ENUM_CTRL_DECL_186(t186_admaif14_tx, 0x0d);
+MUX_ENUM_CTRL_DECL_186(t186_admaif15_tx, 0x0e);
+MUX_ENUM_CTRL_DECL_186(t186_admaif16_tx, 0x0f);
+MUX_ENUM_CTRL_DECL_186(t186_i2s6_tx, 0x15);
+MUX_ENUM_CTRL_DECL_186(t186_dspk1_tx, 0x30);
+MUX_ENUM_CTRL_DECL_186(t186_dspk2_tx, 0x31);
+MUX_ENUM_CTRL_DECL_186(t186_admaif17_tx, 0x68);
+MUX_ENUM_CTRL_DECL_186(t186_admaif18_tx, 0x69);
+MUX_ENUM_CTRL_DECL_186(t186_admaif19_tx, 0x6a);
+MUX_ENUM_CTRL_DECL_186(t186_admaif20_tx, 0x6b);
+
+/*
+ * The number of entries in, and order of, this array is closely tied to the
+ * calculation of tegra210_ahub_codec.num_dapm_widgets near the end of
+ * tegra210_ahub_probe()
+ */
+static const struct snd_soc_dapm_widget tegra210_ahub_widgets[] = {
+	WIDGETS("ADMAIF1", t210_admaif1_tx),
+	WIDGETS("ADMAIF2", t210_admaif2_tx),
+	WIDGETS("ADMAIF3", t210_admaif3_tx),
+	WIDGETS("ADMAIF4", t210_admaif4_tx),
+	WIDGETS("ADMAIF5", t210_admaif5_tx),
+	WIDGETS("ADMAIF6", t210_admaif6_tx),
+	WIDGETS("ADMAIF7", t210_admaif7_tx),
+	WIDGETS("ADMAIF8", t210_admaif8_tx),
+	WIDGETS("ADMAIF9", t210_admaif9_tx),
+	WIDGETS("ADMAIF10", t210_admaif10_tx),
+	WIDGETS("I2S1", t210_i2s1_tx),
+	WIDGETS("I2S2", t210_i2s2_tx),
+	WIDGETS("I2S3", t210_i2s3_tx),
+	WIDGETS("I2S4", t210_i2s4_tx),
+	WIDGETS("I2S5", t210_i2s5_tx),
+	TX_WIDGETS("DMIC1"),
+	TX_WIDGETS("DMIC2"),
+	TX_WIDGETS("DMIC3"),
+};
+
+static const struct snd_soc_dapm_widget tegra186_ahub_widgets[] = {
+	WIDGETS("ADMAIF1", t186_admaif1_tx),
+	WIDGETS("ADMAIF2", t186_admaif2_tx),
+	WIDGETS("ADMAIF3", t186_admaif3_tx),
+	WIDGETS("ADMAIF4", t186_admaif4_tx),
+	WIDGETS("ADMAIF5", t186_admaif5_tx),
+	WIDGETS("ADMAIF6", t186_admaif6_tx),
+	WIDGETS("ADMAIF7", t186_admaif7_tx),
+	WIDGETS("ADMAIF8", t186_admaif8_tx),
+	WIDGETS("ADMAIF9", t186_admaif9_tx),
+	WIDGETS("ADMAIF10", t186_admaif10_tx),
+	WIDGETS("ADMAIF11", t186_admaif11_tx),
+	WIDGETS("ADMAIF12", t186_admaif12_tx),
+	WIDGETS("ADMAIF13", t186_admaif13_tx),
+	WIDGETS("ADMAIF14", t186_admaif14_tx),
+	WIDGETS("ADMAIF15", t186_admaif15_tx),
+	WIDGETS("ADMAIF16", t186_admaif16_tx),
+	WIDGETS("ADMAIF17", t186_admaif17_tx),
+	WIDGETS("ADMAIF18", t186_admaif18_tx),
+	WIDGETS("ADMAIF19", t186_admaif19_tx),
+	WIDGETS("ADMAIF20", t186_admaif20_tx),
+	WIDGETS("I2S1", t186_i2s1_tx),
+	WIDGETS("I2S2", t186_i2s2_tx),
+	WIDGETS("I2S3", t186_i2s3_tx),
+	WIDGETS("I2S4", t186_i2s4_tx),
+	WIDGETS("I2S5", t186_i2s5_tx),
+	WIDGETS("I2S6", t186_i2s6_tx),
+	TX_WIDGETS("DMIC1"),
+	TX_WIDGETS("DMIC2"),
+	TX_WIDGETS("DMIC3"),
+	TX_WIDGETS("DMIC4"),
+	WIDGETS("DSPK1", t186_dspk1_tx),
+	WIDGETS("DSPK2", t186_dspk2_tx),
+};
+
+#define TEGRA_COMMON_ROUTES(name)					\
+	{ name " RX",		NULL,		name " Receive" },	\
+	{ name " Transmit",	NULL,		name " TX" },		\
+	{ name " TX",		NULL,		name " Mux" },		\
+	{ name " Mux",		"ADMAIF1",	"ADMAIF1 RX" },		\
+	{ name " Mux",		"ADMAIF2",	"ADMAIF2 RX" },		\
+	{ name " Mux",		"ADMAIF3",	"ADMAIF3 RX" },		\
+	{ name " Mux",		"ADMAIF4",	"ADMAIF4 RX" },		\
+	{ name " Mux",		"ADMAIF5",	"ADMAIF5 RX" },		\
+	{ name " Mux",		"ADMAIF6",	"ADMAIF6 RX" },		\
+	{ name " Mux",		"ADMAIF7",	"ADMAIF7 RX" },		\
+	{ name " Mux",		"ADMAIF8",	"ADMAIF8 RX" },		\
+	{ name " Mux",		"ADMAIF9",	"ADMAIF9 RX" },		\
+	{ name " Mux",		"ADMAIF10",	"ADMAIF10 RX" },	\
+	{ name " Mux",		"I2S1",		"I2S1 RX" },		\
+	{ name " Mux",		"I2S2",		"I2S2 RX" },		\
+	{ name " Mux",		"I2S3",		"I2S3 RX" },		\
+	{ name " Mux",		"I2S4",		"I2S4 RX" },		\
+	{ name " Mux",		"I2S5",		"I2S5 RX" },		\
+	{ name " Mux",		"DMIC1",	"DMIC1 RX" },		\
+	{ name " Mux",		"DMIC2",	"DMIC2 RX" },		\
+	{ name " Mux",		"DMIC3",	"DMIC3 RX" },
+
+#define TEGRA186_ONLY_ROUTES(name)					\
+	{ name " Mux",		"ADMAIF11",	"ADMAIF11 RX" },	\
+	{ name " Mux",		"ADMAIF12",	"ADMAIF12 RX" },	\
+	{ name " Mux",		"ADMAIF13",	"ADMAIF13 RX" },	\
+	{ name " Mux",		"ADMAIF14",	"ADMAIF14 RX" },	\
+	{ name " Mux",		"ADMAIF15",	"ADMAIF15 RX" },	\
+	{ name " Mux",		"ADMAIF16",	"ADMAIF16 RX" },	\
+	{ name " Mux",		"ADMAIF17",	"ADMAIF17 RX" },	\
+	{ name " Mux",		"ADMAIF18",	"ADMAIF18 RX" },	\
+	{ name " Mux",		"ADMAIF19",	"ADMAIF19 RX" },	\
+	{ name " Mux",		"ADMAIF20",	"ADMAIF20 RX" },	\
+	{ name " Mux",		"I2S6",		"I2S6 RX" },		\
+	{ name " Mux",		"DMIC4",	"DMIC4 RX" },
+
+#define TEGRA210_ROUTES(name)						\
+	TEGRA_COMMON_ROUTES(name)
+
+#define TEGRA186_ROUTES(name)						\
+	TEGRA_COMMON_ROUTES(name)					\
+	TEGRA186_ONLY_ROUTES(name)
+
+#define IN_OUT_ROUTES(name)						\
+	{ name " RX",		NULL,	name " Receive" },		\
+	{ name " Transmit",	NULL,	name " TX" },
+
+/*
+ * The number of entries in, and order of, this array is closely tied to the
+ * calculation of tegra210_ahub_codec.num_dapm_routes near the end of
+ * tegra210_ahub_probe()
+ */
+static const struct snd_soc_dapm_route tegra210_ahub_routes[] = {
+	TEGRA210_ROUTES("ADMAIF1")
+	TEGRA210_ROUTES("ADMAIF2")
+	TEGRA210_ROUTES("ADMAIF3")
+	TEGRA210_ROUTES("ADMAIF4")
+	TEGRA210_ROUTES("ADMAIF5")
+	TEGRA210_ROUTES("ADMAIF6")
+	TEGRA210_ROUTES("ADMAIF7")
+	TEGRA210_ROUTES("ADMAIF8")
+	TEGRA210_ROUTES("ADMAIF9")
+	TEGRA210_ROUTES("ADMAIF10")
+	TEGRA210_ROUTES("I2S1")
+	TEGRA210_ROUTES("I2S2")
+	TEGRA210_ROUTES("I2S3")
+	TEGRA210_ROUTES("I2S4")
+	TEGRA210_ROUTES("I2S5")
+	IN_OUT_ROUTES("DMIC1")
+	IN_OUT_ROUTES("DMIC2")
+	IN_OUT_ROUTES("DMIC3")
+};
+
+static const struct snd_soc_dapm_route tegra186_ahub_routes[] = {
+	TEGRA186_ROUTES("ADMAIF1")
+	TEGRA186_ROUTES("ADMAIF2")
+	TEGRA186_ROUTES("ADMAIF3")
+	TEGRA186_ROUTES("ADMAIF4")
+	TEGRA186_ROUTES("ADMAIF5")
+	TEGRA186_ROUTES("ADMAIF6")
+	TEGRA186_ROUTES("ADMAIF7")
+	TEGRA186_ROUTES("ADMAIF8")
+	TEGRA186_ROUTES("ADMAIF9")
+	TEGRA186_ROUTES("ADMAIF10")
+	TEGRA186_ROUTES("ADMAIF11")
+	TEGRA186_ROUTES("ADMAIF12")
+	TEGRA186_ROUTES("ADMAIF13")
+	TEGRA186_ROUTES("ADMAIF14")
+	TEGRA186_ROUTES("ADMAIF15")
+	TEGRA186_ROUTES("ADMAIF16")
+	TEGRA186_ROUTES("ADMAIF17")
+	TEGRA186_ROUTES("ADMAIF18")
+	TEGRA186_ROUTES("ADMAIF19")
+	TEGRA186_ROUTES("ADMAIF20")
+	TEGRA186_ROUTES("I2S1")
+	TEGRA186_ROUTES("I2S2")
+	TEGRA186_ROUTES("I2S3")
+	TEGRA186_ROUTES("I2S4")
+	TEGRA186_ROUTES("I2S5")
+	TEGRA186_ROUTES("I2S6")
+	TEGRA186_ROUTES("DSPK1")
+	TEGRA186_ROUTES("DSPK2")
+	IN_OUT_ROUTES("DMIC1")
+	IN_OUT_ROUTES("DMIC2")
+	IN_OUT_ROUTES("DMIC3")
+	IN_OUT_ROUTES("DMIC4")
+};
+
+static const struct snd_soc_component_driver tegra210_ahub_component = {
+	.dapm_widgets		= tegra210_ahub_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra210_ahub_widgets),
+	.dapm_routes		= tegra210_ahub_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra210_ahub_routes),
+};
+
+static const struct snd_soc_component_driver tegra186_ahub_component = {
+	.dapm_widgets = tegra186_ahub_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tegra186_ahub_widgets),
+	.dapm_routes = tegra186_ahub_routes,
+	.num_dapm_routes = ARRAY_SIZE(tegra186_ahub_routes),
+};
+
+static const struct regmap_config tegra210_ahub_regmap_config = {
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.reg_stride		= 4,
+	.max_register		= TEGRA210_MAX_REGISTER_ADDR,
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct regmap_config tegra186_ahub_regmap_config = {
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.reg_stride		= 4,
+	.max_register		= TEGRA186_MAX_REGISTER_ADDR,
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct tegra_ahub_soc_data soc_data_tegra210 = {
+	.cmpnt_drv	= &tegra210_ahub_component,
+	.dai_drv	= tegra210_ahub_dais,
+	.num_dais	= ARRAY_SIZE(tegra210_ahub_dais),
+	.regmap_config	= &tegra210_ahub_regmap_config,
+	.mask[0]	= TEGRA210_XBAR_REG_MASK_0,
+	.mask[1]	= TEGRA210_XBAR_REG_MASK_1,
+	.mask[2]	= TEGRA210_XBAR_REG_MASK_2,
+	.mask[3]	= TEGRA210_XBAR_REG_MASK_3,
+	.reg_count	= TEGRA210_XBAR_UPDATE_MAX_REG,
+};
+
+static const struct tegra_ahub_soc_data soc_data_tegra186 = {
+	.cmpnt_drv	= &tegra186_ahub_component,
+	.dai_drv	= tegra186_ahub_dais,
+	.num_dais	= ARRAY_SIZE(tegra186_ahub_dais),
+	.regmap_config	= &tegra186_ahub_regmap_config,
+	.mask[0]	= TEGRA186_XBAR_REG_MASK_0,
+	.mask[1]	= TEGRA186_XBAR_REG_MASK_1,
+	.mask[2]	= TEGRA186_XBAR_REG_MASK_2,
+	.mask[3]	= TEGRA186_XBAR_REG_MASK_3,
+	.reg_count	= TEGRA186_XBAR_UPDATE_MAX_REG,
+};
+
+static const struct of_device_id tegra_ahub_of_match[] = {
+	{ .compatible = "nvidia,tegra210-ahub", .data = &soc_data_tegra210 },
+	{ .compatible = "nvidia,tegra186-ahub", .data = &soc_data_tegra186 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra_ahub_of_match);
+
+static int tegra_ahub_runtime_suspend(struct device *dev)
+{
+	struct tegra_ahub *ahub = dev_get_drvdata(dev);
+
+	regcache_cache_only(ahub->regmap, true);
+	regcache_mark_dirty(ahub->regmap);
+
+	clk_disable_unprepare(ahub->clk);
+
+	return 0;
+}
+
+static int tegra_ahub_runtime_resume(struct device *dev)
+{
+	struct tegra_ahub *ahub = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(ahub->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable AHUB clock, err: %d\n", ret);
+		return ret;
+	}
+
+	regcache_cache_only(ahub->regmap, false);
+	regcache_sync(ahub->regmap);
+
+	return 0;
+}
+
+static int tegra_ahub_probe(struct platform_device *pdev)
+{
+	struct tegra_ahub *ahub;
+	void __iomem *regs;
+	int ret;
+
+	ahub = devm_kcalloc(&pdev->dev, 1, sizeof(*ahub), GFP_KERNEL);
+	if (!ahub)
+		return -ENOMEM;
+
+	ahub->soc_data = of_device_get_match_data(&pdev->dev);
+
+	platform_set_drvdata(pdev, ahub);
+
+	ahub->clk = devm_clk_get(&pdev->dev, "ahub");
+	if (IS_ERR(ahub->clk)) {
+		dev_err(&pdev->dev, "can't retrieve AHUB clock\n");
+		return PTR_ERR(ahub->clk);
+	}
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	ahub->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+					     ahub->soc_data->regmap_config);
+	if (IS_ERR(ahub->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		return PTR_ERR(ahub->regmap);
+	}
+
+	regcache_cache_only(ahub->regmap, true);
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      ahub->soc_data->cmpnt_drv,
+					      ahub->soc_data->dai_drv,
+					      ahub->soc_data->num_dais);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to register component, err: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int tegra_ahub_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra_ahub_runtime_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_ahub_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra_ahub_runtime_suspend,
+			   tegra_ahub_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra_ahub_driver = {
+	.probe = tegra_ahub_probe,
+	.remove = tegra_ahub_remove,
+	.driver = {
+		.name = "tegra210-ahub",
+		.of_match_table = tegra_ahub_of_match,
+		.pm = &tegra_ahub_pm_ops,
+	},
+};
+module_platform_driver(tegra_ahub_driver);
+
+MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
+MODULE_AUTHOR("Mohan Kumar <mkumard@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 ASoC AHUB driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra210_ahub.h b/sound/soc/tegra/tegra210_ahub.h
new file mode 100644
index 0000000..d0fb35c
--- /dev/null
+++ b/sound/soc/tegra/tegra210_ahub.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_ahub.h - TEGRA210 AHUB
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_AHUB__H__
+#define __TEGRA210_AHUB__H__
+
+/* Tegra210 specific */
+#define TEGRA210_XBAR_PART1_RX				0x200
+#define TEGRA210_XBAR_PART2_RX				0x400
+#define TEGRA210_XBAR_RX_STRIDE				0x4
+#define TEGRA210_XBAR_AUDIO_RX_COUNT			90
+#define TEGRA210_XBAR_REG_MASK_0			0xf1f03ff
+#define TEGRA210_XBAR_REG_MASK_1			0x3f30031f
+#define TEGRA210_XBAR_REG_MASK_2			0xff1cf313
+#define TEGRA210_XBAR_REG_MASK_3			0x0
+#define TEGRA210_XBAR_UPDATE_MAX_REG			3
+/* Tegra186 specific */
+#define TEGRA186_XBAR_PART3_RX				0x600
+#define TEGRA186_XBAR_AUDIO_RX_COUNT			115
+#define TEGRA186_XBAR_REG_MASK_0			0xf3fffff
+#define TEGRA186_XBAR_REG_MASK_1			0x3f310f1f
+#define TEGRA186_XBAR_REG_MASK_2			0xff3cf311
+#define TEGRA186_XBAR_REG_MASK_3			0x3f0f00ff
+#define TEGRA186_XBAR_UPDATE_MAX_REG			4
+
+#define TEGRA_XBAR_UPDATE_MAX_REG (TEGRA186_XBAR_UPDATE_MAX_REG)
+
+#define TEGRA186_MAX_REGISTER_ADDR (TEGRA186_XBAR_PART3_RX +		\
+	(TEGRA210_XBAR_RX_STRIDE * (TEGRA186_XBAR_AUDIO_RX_COUNT - 1)))
+
+#define TEGRA210_MAX_REGISTER_ADDR (TEGRA210_XBAR_PART2_RX +		\
+	(TEGRA210_XBAR_RX_STRIDE * (TEGRA210_XBAR_AUDIO_RX_COUNT - 1)))
+
+#define MUX_REG(id) (TEGRA210_XBAR_RX_STRIDE * (id))
+
+#define MUX_VALUE(npart, nbit) (1 + (nbit) + (npart) * 32)
+
+#define DAI(sname)							\
+	{								\
+		.name = #sname,						\
+		.playback = {						\
+			.stream_name = #sname " Receive",		\
+			.channels_min = 1,				\
+			.channels_max = 16,				\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
+			.formats = SNDRV_PCM_FMTBIT_S8 |		\
+				SNDRV_PCM_FMTBIT_S16_LE |		\
+				SNDRV_PCM_FMTBIT_S32_LE,		\
+		},							\
+		.capture = {						\
+			.stream_name = #sname " Transmit",		\
+			.channels_min = 1,				\
+			.channels_max = 16,				\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
+			.formats = SNDRV_PCM_FMTBIT_S8 |		\
+				SNDRV_PCM_FMTBIT_S16_LE |		\
+				SNDRV_PCM_FMTBIT_S32_LE,		\
+		},							\
+	}
+
+#define SOC_VALUE_ENUM_WIDE(xreg, shift, xmax, xtexts, xvalues)		\
+	{								\
+		.reg = xreg,						\
+		.shift_l = shift,					\
+		.shift_r = shift,					\
+		.items = xmax,						\
+		.texts = xtexts,					\
+		.values = xvalues,					\
+		.mask = xmax ? roundup_pow_of_two(xmax) - 1 : 0		\
+	}
+
+#define SOC_VALUE_ENUM_WIDE_DECL(name, xreg, shift, xtexts, xvalues)	\
+	static struct soc_enum name =					\
+		SOC_VALUE_ENUM_WIDE(xreg, shift, ARRAY_SIZE(xtexts),	\
+				    xtexts, xvalues)
+
+#define MUX_ENUM_CTRL_DECL(ename, id)					\
+	SOC_VALUE_ENUM_WIDE_DECL(ename##_enum, MUX_REG(id), 0,		\
+				 tegra210_ahub_mux_texts,		\
+				 tegra210_ahub_mux_values);		\
+	static const struct snd_kcontrol_new ename##_control =		\
+		SOC_DAPM_ENUM_EXT("Route", ename##_enum,		\
+				  tegra_ahub_get_value_enum,		\
+				  tegra_ahub_put_value_enum)
+
+#define MUX_ENUM_CTRL_DECL_186(ename, id)				\
+	SOC_VALUE_ENUM_WIDE_DECL(ename##_enum, MUX_REG(id), 0,		\
+				 tegra186_ahub_mux_texts,		\
+				 tegra186_ahub_mux_values);		\
+	static const struct snd_kcontrol_new ename##_control =		\
+		SOC_DAPM_ENUM_EXT("Route", ename##_enum,		\
+				  tegra_ahub_get_value_enum,		\
+				  tegra_ahub_put_value_enum)
+
+#define WIDGETS(sname, ename)						\
+	SND_SOC_DAPM_AIF_IN(sname " RX", NULL, 0, SND_SOC_NOPM, 0, 0),	\
+	SND_SOC_DAPM_AIF_OUT(sname " TX", NULL, 0, SND_SOC_NOPM, 0, 0),	\
+	SND_SOC_DAPM_MUX(sname " Mux", SND_SOC_NOPM, 0, 0,		\
+			 &ename##_control)
+
+#define TX_WIDGETS(sname)						\
+	SND_SOC_DAPM_AIF_IN(sname " RX", NULL, 0, SND_SOC_NOPM, 0, 0),	\
+	SND_SOC_DAPM_AIF_OUT(sname " TX", NULL, 0, SND_SOC_NOPM, 0, 0)
+
+struct tegra_ahub_soc_data {
+	const struct regmap_config *regmap_config;
+	const struct snd_soc_component_driver *cmpnt_drv;
+	struct snd_soc_dai_driver *dai_drv;
+	unsigned int mask[4];
+	unsigned int reg_count;
+	unsigned int num_dais;
+};
+
+struct tegra_ahub {
+	const struct tegra_ahub_soc_data *soc_data;
+	struct regmap *regmap;
+	struct clk *clk;
+};
+
+#endif
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

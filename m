Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D094099DC
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:46:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B468217C1;
	Mon, 13 Sep 2021 18:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B468217C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631551612;
	bh=Md0cttoVeiKbh6DZPmQvaHgObRBkWDzJvwE5M+7TUoM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e4qww8fvN4QSyjvuYzVsWiAxPIfKiKQkt2UK7MXr23MJI2xFFauonO3+sqEzRq8Lh
	 kjxV9A2d3G7t2bQ5MWOlmrdbbpJe95T+vcefGdCpqx5P5kqhOig7L53UlFsaDm7C4J
	 6UPSQMMF3K8YSK+SpYWZJBfC+9t2XM5QKBtBAD6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F4EF8051B;
	Mon, 13 Sep 2021 18:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A3AEF80528; Mon, 13 Sep 2021 18:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F7CFF8051B
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F7CFF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="liFL1fid"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+Ys4cvZeMz1JK6NMFtehFCxbL1on8LodMs1TZJdVqS6AuS3RprvxsvKdaD9Juc3EAIgtJjz9ZaVWrqoOk1x0P5wDrXLpmkrninbzhvCFFD0o16XBu0Y7VyOZUvwR/MBLApM87kw3PMj6NhynqzMsMbjzXVco61WGy76YxnEmT/mT6Pk7rXyY89GySc+gBCj8Vnuzqs4wcJC7QegW0h/NspF6+DvgN34ZqXeQ/besq0CNXzer95cchSuuSTHjleWCez9nYQu2yYCjf3tLSky9sRfjRl0Csnhf6M1gIio+PYsYDv1Pc4PH5Kby1Uueg0/azB/5VJrOfFK0kjSwczQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yhEqG73f+1dYR4JzE0K2HNAJdaapnq69sTDRVGd2vnQ=;
 b=nxUCFoPh6Lg/GMeyFThFA5xLGxepCb2lNSJhy5AemRLPhC8n/HEjtZYa0JaeJ1L9TLEerqbIrepYF5PAehwu0oq1S4dJUWmHssu+aEr6Gnfy670oKAEOe9OK5+BRvr5jrSMCmtCtQjMbjkceSitXedfoSp3Nc2Z6NU2+6v5v6vVmFuA/SswIBzJ0bD/w9XNSe1AYA6fIxXWCkZSpfhcPLXpIaT2XYSN5qyM4O7fsbzEd5hkNAoIzBLF0wFlSygICBLFqjMJMrkosuFWnXkFcDCNSssh8cGelEkRGEZelnJKdJAglglvUj6L+VPG6K1HO4AE2bWDCZ22zdAT9jHJzlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhEqG73f+1dYR4JzE0K2HNAJdaapnq69sTDRVGd2vnQ=;
 b=liFL1fidoOHPi5qzZyDmwgc46mnlj+VLN12zlIfME0Ho64cXv1tCe5tR4rVu6GV14jZCVG0rio8Ni1gnCa2iOOyO8DlV/mQWiK+srOb+eQAJkLGdW9UIALd+/VsD+f6/bor2s/h6soUBF1c73gczU350ZlthC5mQgSeWLWK7Dc32u7pbGMWBuS7sMviws8ot69rBBEodLq+6mojMGAXtTU7OaB8Hd2v7dw26ftGiDFyFIRSi7sn7PSryUXBorSUFeR3ywngmc/zg5m4xMQJ0GOylz2ihEmejOz//rpoVGUMZiSMUo5EPmsrEti2Av/Z1fJnaGKsK/deRj9x6qnlvDw==
Received: from DM5PR22CA0020.namprd22.prod.outlook.com (2603:10b6:3:101::30)
 by BN8PR12MB4978.namprd12.prod.outlook.com (2603:10b6:408:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:43:20 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::c1) by DM5PR22CA0020.outlook.office365.com
 (2603:10b6:3:101::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:43:18 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 16:43:18 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:14 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/13] ASoC: tegra: Add Tegra210 based AMX driver
Date: Mon, 13 Sep 2021 22:12:16 +0530
Message-ID: <1631551342-25469-9-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb1de20-df0a-4f15-784e-08d976d5976a
X-MS-TrafficTypeDiagnostic: BN8PR12MB4978:
X-Microsoft-Antispam-PRVS: <BN8PR12MB49787140E521255D75BB7999A7D99@BN8PR12MB4978.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arafPnlR8qLGzSyi4PTU2hU0xQKs8LZBX1Vm2j2fvvtGXzTQqzdz+cHQ55Wgynfy2HkzjUFlreHGcBeaXze2AYSv4lxMtLU57snmlD9Qwkd2y6JW64JuIwN9rG/5XQEApj8A4ADl7l2UGc9iUiU7SycbnJuBz2HXzBqbnLJBdiCYWqPt1PDpq8nzr6TlkEiQLhCsOqF0D45Mu5/+xBqY7mRLSBu6/B7VH8lbkPZuj4OVDHlaT6gPzR5sKzi3mS0Mz44cOzOuVb/NWKzhZdX0wIjYAxk4eSbnb58UP5hAjkpOopFUuD00G27mgMc7PNq5dweheEW+IFSRy1SrQhBDZAGgHECav87ogcziu64G2aoyGnqjlRJ6NSELH/rP4j+fjQikug1YM11V41zbGalB9W5FRJX5kvrkaUYIYBfJA8NNuXwWFWB/wbYKtGlZBp5UdNjin98pTVk62NjkQ8mjPnVpOnzXDgyuKISNXqDDkcsXFu0sv1RHBMjrJ07fIkAY97RzWFZ3tE4ka0vJTLaIKyQHlWi4+z1/sciitUSeTXSXVOQX01UkvI4Cp3cd4z/LzioKF75OyfyeI9vFZax8n4+r1u/JFpmdAApoAJ+P1kKfnkHJTSceXnVwQY3J88aVnun0SBi+ssGjFkNIe3/qgNsiY6Ew5dT90e+g4lqbV3KmHjGi83/PoZhvcV+YHR+SfUzqicSqoCazALV78eit+5zdP4sj0rYPAS9PazOoCr8=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(36840700001)(46966006)(478600001)(82310400003)(5660300002)(8936002)(70586007)(47076005)(356005)(110136005)(30864003)(36860700001)(186003)(2616005)(921005)(70206006)(2906002)(54906003)(426003)(336012)(4326008)(8676002)(7696005)(107886003)(36906005)(83380400001)(82740400003)(26005)(36756003)(86362001)(316002)(7636003)(7416002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:43:18.8555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb1de20-df0a-4f15-784e-08d976d5976a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4978
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sharadg@nvidia.com,
 linux-arm-kernel@lists.infradead.org
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

The Audio Multiplexer (AMX) block can multiplex up to four input streams
each of which can have maximum 16 channels and generate an output stream
with maximum 16 channels. A byte RAM helps to form an output frame by
any combination of bytes from the input frames.

This patch registers AMX driver with ASoC framework. The component driver
exposes DAPM widgets, routes and kcontrols for the device. The DAI driver
exposes AMX interfaces, which can be used to connect different components
in the ASoC layer. Makefile and Kconfig support is added to allow build
the driver. It can be enabled in the DT via "nvidia,tegra210-amx" for
Tegra210 and Tegra186. For Tegra194 and later, "nvidia,tegra194-amx" can
be used.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig        |   9 +
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra210_amx.c | 600 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_amx.h |  93 +++++++
 4 files changed, 704 insertions(+)
 create mode 100644 sound/soc/tegra/tegra210_amx.c
 create mode 100644 sound/soc/tegra/tegra210_amx.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 102564e..54d8342 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -126,6 +126,15 @@ config SND_SOC_TEGRA210_SFC
 	  upto 2 channels (stereo).
 	  Say Y or M if you want to add support for Tegra210 SFC module.
 
+config SND_SOC_TEGRA210_AMX
+	tristate "Tegra210 AMX module"
+	help
+	  Config to enable the Audio Multiplexer (AMX) which can multiplex
+	  four input streams (each of up to 16 channels) and generate
+	  output stream (of up to 16 channels). A byte RAM helps to form an
+	  output frame by any combination of bytes from the input frames.
+	  Say Y or M if you want to add support for Tegra210 AMX module.
+
 config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 	tristate "Audio Graph Card based Tegra driver"
 	depends on SND_AUDIO_GRAPH_CARD
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index bb0cf3a..549162b 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -15,6 +15,7 @@ snd-soc-tegra186-dspk-objs := tegra186_dspk.o
 snd-soc-tegra210-admaif-objs := tegra210_admaif.o
 snd-soc-tegra210-mvc-objs := tegra210_mvc.o
 snd-soc-tegra210-sfc-objs := tegra210_sfc.o
+snd-soc-tegra210-amx-objs := tegra210_amx.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
@@ -30,6 +31,7 @@ obj-$(CONFIG_SND_SOC_TEGRA186_DSPK) += snd-soc-tegra186-dspk.o
 obj-$(CONFIG_SND_SOC_TEGRA210_ADMAIF) += snd-soc-tegra210-admaif.o
 obj-$(CONFIG_SND_SOC_TEGRA210_MVC) += snd-soc-tegra210-mvc.o
 obj-$(CONFIG_SND_SOC_TEGRA210_SFC) += snd-soc-tegra210-sfc.o
+obj-$(CONFIG_SND_SOC_TEGRA210_AMX) += snd-soc-tegra210-amx.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
new file mode 100644
index 00000000..83176e1
--- /dev/null
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -0,0 +1,600 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra210_amx.c - Tegra210 AMX driver
+//
+// Copyright (c) 2021 NVIDIA CORPORATION.  All rights reserved.
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "tegra210_amx.h"
+#include "tegra_cif.h"
+
+/*
+ * The counter is in terms of AHUB clock cycles. If a frame is not
+ * received within these clock cycles, the AMX input channel gets
+ * automatically disabled. For now the counter is calculated as a
+ * function of sample rate (8 kHz) and AHUB clock (49.152 MHz).
+ * If later an accurate number is needed, the counter needs to be
+ * calculated at runtime.
+ *
+ *     count = ahub_clk / sample_rate
+ */
+#define TEGRA194_MAX_FRAME_IDLE_COUNT	0x1800
+
+#define AMX_CH_REG(id, reg) ((reg) + ((id) * TEGRA210_AMX_AUDIOCIF_CH_STRIDE))
+
+static const struct reg_default tegra210_amx_reg_defaults[] = {
+	{ TEGRA210_AMX_RX_INT_MASK, 0x0000000f},
+	{ TEGRA210_AMX_RX1_CIF_CTRL, 0x00007000},
+	{ TEGRA210_AMX_RX2_CIF_CTRL, 0x00007000},
+	{ TEGRA210_AMX_RX3_CIF_CTRL, 0x00007000},
+	{ TEGRA210_AMX_RX4_CIF_CTRL, 0x00007000},
+	{ TEGRA210_AMX_TX_INT_MASK, 0x00000001},
+	{ TEGRA210_AMX_TX_CIF_CTRL, 0x00007000},
+	{ TEGRA210_AMX_CG, 0x1},
+	{ TEGRA210_AMX_CFG_RAM_CTRL, 0x00004000},
+};
+
+static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
+{
+	int i;
+
+	regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_CTRL,
+		     TEGRA210_AMX_CFG_RAM_CTRL_SEQ_ACCESS_EN |
+		     TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN |
+		     TEGRA210_AMX_CFG_RAM_CTRL_RW_WRITE);
+
+	for (i = 0; i < TEGRA210_AMX_RAM_DEPTH; i++)
+		regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_DATA,
+			     amx->map[i]);
+
+	regmap_write(amx->regmap, TEGRA210_AMX_OUT_BYTE_EN0, amx->byte_mask[0]);
+	regmap_write(amx->regmap, TEGRA210_AMX_OUT_BYTE_EN1, amx->byte_mask[1]);
+}
+
+static int tegra210_amx_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct tegra210_amx *amx = snd_soc_dai_get_drvdata(dai);
+	unsigned int val;
+	int err;
+
+	/* Ensure if AMX is disabled */
+	err = regmap_read_poll_timeout(amx->regmap, TEGRA210_AMX_STATUS, val,
+				       !(val & 0x1), 10, 10000);
+	if (err < 0) {
+		dev_err(dai->dev, "failed to stop AMX, err = %d\n", err);
+		return err;
+	}
+
+	/*
+	 * Soft Reset: Below performs module soft reset which clears
+	 * all FSM logic, flushes flow control of FIFO and resets the
+	 * state register. It also brings module back to disabled
+	 * state (without flushing the data in the pipe).
+	 */
+	regmap_update_bits(amx->regmap, TEGRA210_AMX_SOFT_RESET,
+			   TEGRA210_AMX_SOFT_RESET_SOFT_RESET_MASK,
+			   TEGRA210_AMX_SOFT_RESET_SOFT_EN);
+
+	err = regmap_read_poll_timeout(amx->regmap, TEGRA210_AMX_SOFT_RESET,
+				       val, !(val & 0x1), 10, 10000);
+	if (err < 0) {
+		dev_err(dai->dev, "failed to reset AMX, err = %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra210_amx_runtime_suspend(struct device *dev)
+{
+	struct tegra210_amx *amx = dev_get_drvdata(dev);
+
+	regcache_cache_only(amx->regmap, true);
+	regcache_mark_dirty(amx->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused tegra210_amx_runtime_resume(struct device *dev)
+{
+	struct tegra210_amx *amx = dev_get_drvdata(dev);
+
+	regcache_cache_only(amx->regmap, false);
+	regcache_sync(amx->regmap);
+
+	regmap_update_bits(amx->regmap,
+		TEGRA210_AMX_CTRL,
+		TEGRA210_AMX_CTRL_RX_DEP_MASK,
+		TEGRA210_AMX_WAIT_ON_ANY << TEGRA210_AMX_CTRL_RX_DEP_SHIFT);
+
+	tegra210_amx_write_map_ram(amx);
+
+	return 0;
+}
+
+static int tegra210_amx_set_audio_cif(struct snd_soc_dai *dai,
+				      struct snd_pcm_hw_params *params,
+				      unsigned int reg)
+{
+	struct tegra210_amx *amx = snd_soc_dai_get_drvdata(dai);
+	int channels, audio_bits;
+	struct tegra_cif_conf cif_conf;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	channels = params_channels(params);
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		audio_bits = TEGRA_ACIF_BITS_8;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		audio_bits = TEGRA_ACIF_BITS_16;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		audio_bits = TEGRA_ACIF_BITS_32;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	cif_conf.audio_ch = channels;
+	cif_conf.client_ch = channels;
+	cif_conf.audio_bits = audio_bits;
+	cif_conf.client_bits = audio_bits;
+
+	tegra_set_cif(amx->regmap, reg, &cif_conf);
+
+	return 0;
+}
+
+static int tegra210_amx_in_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai)
+{
+	struct tegra210_amx *amx = snd_soc_dai_get_drvdata(dai);
+
+	if (amx->soc_data->auto_disable) {
+		regmap_write(amx->regmap,
+			     AMX_CH_REG(dai->id, TEGRA194_AMX_RX1_FRAME_PERIOD),
+			     TEGRA194_MAX_FRAME_IDLE_COUNT);
+		regmap_write(amx->regmap, TEGRA210_AMX_CYA, 1);
+	}
+
+	return tegra210_amx_set_audio_cif(dai, params,
+			AMX_CH_REG(dai->id, TEGRA210_AMX_RX1_CIF_CTRL));
+}
+
+static int tegra210_amx_out_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	return tegra210_amx_set_audio_cif(dai, params,
+					  TEGRA210_AMX_TX_CIF_CTRL);
+}
+
+static int tegra210_amx_get_byte_map(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
+	unsigned char *bytes_map = (unsigned char *)&amx->map;
+	int reg = mc->reg;
+	int enabled;
+
+	if (reg > 31)
+		enabled = amx->byte_mask[1] & (1 << (reg - 32));
+	else
+		enabled = amx->byte_mask[0] & (1 << reg);
+
+	if (enabled)
+		ucontrol->value.integer.value[0] = bytes_map[reg];
+	else
+		ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
+	unsigned char *bytes_map = (unsigned char *)&amx->map;
+	int reg = mc->reg;
+	int value = ucontrol->value.integer.value[0];
+
+	if (value >= 0 && value <= 255) {
+		/* Update byte map and enable slot */
+		bytes_map[reg] = value;
+		if (reg > 31)
+			amx->byte_mask[1] |= (1 << (reg - 32));
+		else
+			amx->byte_mask[0] |= (1 << reg);
+	} else {
+		/* Reset byte map and disable slot */
+		bytes_map[reg] = 0;
+		if (reg > 31)
+			amx->byte_mask[1] &= ~(1 << (reg - 32));
+		else
+			amx->byte_mask[0] &= ~(1 << reg);
+	}
+
+	return 1;
+}
+
+static struct snd_soc_dai_ops tegra210_amx_out_dai_ops = {
+	.hw_params	= tegra210_amx_out_hw_params,
+	.startup	= tegra210_amx_startup,
+};
+
+static struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
+	.hw_params	= tegra210_amx_in_hw_params,
+};
+
+#define IN_DAI(id)						\
+	{							\
+		.name = "AMX-RX-CIF" #id,			\
+		.playback = {					\
+			.stream_name = "RX" #id "-CIF-Playback",\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.capture = {					\
+			.stream_name = "RX" #id "-CIF-Capture",	\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.ops = &tegra210_amx_in_dai_ops,		\
+	}
+
+#define OUT_DAI							\
+	{							\
+		.name = "AMX-TX-CIF",				\
+		.playback = {					\
+			.stream_name = "TX-CIF-Playback",	\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.capture = {					\
+			.stream_name = "TX-CIF-Capture",	\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.ops = &tegra210_amx_out_dai_ops,		\
+	}
+
+static struct snd_soc_dai_driver tegra210_amx_dais[] = {
+	IN_DAI(1),
+	IN_DAI(2),
+	IN_DAI(3),
+	IN_DAI(4),
+	OUT_DAI,
+};
+
+static const struct snd_soc_dapm_widget tegra210_amx_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX1", NULL, 0, TEGRA210_AMX_CTRL, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX2", NULL, 0, TEGRA210_AMX_CTRL, 1, 0),
+	SND_SOC_DAPM_AIF_IN("RX3", NULL, 0, TEGRA210_AMX_CTRL, 2, 0),
+	SND_SOC_DAPM_AIF_IN("RX4", NULL, 0, TEGRA210_AMX_CTRL, 3, 0),
+	SND_SOC_DAPM_AIF_OUT("TX", NULL, 0, TEGRA210_AMX_ENABLE,
+			     TEGRA210_AMX_ENABLE_SHIFT, 0),
+};
+
+#define STREAM_ROUTES(id, sname)					  \
+	{ "RX" #id " XBAR-" sname,	NULL,	"RX" #id " XBAR-TX" },	  \
+	{ "RX" #id "-CIF-" sname,	NULL,	"RX" #id " XBAR-" sname },\
+	{ "RX" #id,			NULL,	"RX" #id "-CIF-" sname }, \
+	{ "TX",				NULL,	"RX" #id },		  \
+	{ "TX-CIF-" sname,		NULL,	"TX" },			  \
+	{ "XBAR-" sname,		NULL,	"TX-CIF-" sname },	  \
+	{ "XBAR-RX",			NULL,	"XBAR-" sname }
+
+#define AMX_ROUTES(id)			\
+	STREAM_ROUTES(id, "Playback"),	\
+	STREAM_ROUTES(id, "Capture")
+
+static const struct snd_soc_dapm_route tegra210_amx_routes[] = {
+	AMX_ROUTES(1),
+	AMX_ROUTES(2),
+	AMX_ROUTES(3),
+	AMX_ROUTES(4),
+};
+
+#define TEGRA210_AMX_BYTE_MAP_CTRL(reg)					\
+	SOC_SINGLE_EXT("Byte Map " #reg, reg, 0, 256, 0,		\
+		       tegra210_amx_get_byte_map,			\
+		       tegra210_amx_put_byte_map)
+
+static struct snd_kcontrol_new tegra210_amx_controls[] = {
+	TEGRA210_AMX_BYTE_MAP_CTRL(0),
+	TEGRA210_AMX_BYTE_MAP_CTRL(1),
+	TEGRA210_AMX_BYTE_MAP_CTRL(2),
+	TEGRA210_AMX_BYTE_MAP_CTRL(3),
+	TEGRA210_AMX_BYTE_MAP_CTRL(4),
+	TEGRA210_AMX_BYTE_MAP_CTRL(5),
+	TEGRA210_AMX_BYTE_MAP_CTRL(6),
+	TEGRA210_AMX_BYTE_MAP_CTRL(7),
+	TEGRA210_AMX_BYTE_MAP_CTRL(8),
+	TEGRA210_AMX_BYTE_MAP_CTRL(9),
+	TEGRA210_AMX_BYTE_MAP_CTRL(10),
+	TEGRA210_AMX_BYTE_MAP_CTRL(11),
+	TEGRA210_AMX_BYTE_MAP_CTRL(12),
+	TEGRA210_AMX_BYTE_MAP_CTRL(13),
+	TEGRA210_AMX_BYTE_MAP_CTRL(14),
+	TEGRA210_AMX_BYTE_MAP_CTRL(15),
+	TEGRA210_AMX_BYTE_MAP_CTRL(16),
+	TEGRA210_AMX_BYTE_MAP_CTRL(17),
+	TEGRA210_AMX_BYTE_MAP_CTRL(18),
+	TEGRA210_AMX_BYTE_MAP_CTRL(19),
+	TEGRA210_AMX_BYTE_MAP_CTRL(20),
+	TEGRA210_AMX_BYTE_MAP_CTRL(21),
+	TEGRA210_AMX_BYTE_MAP_CTRL(22),
+	TEGRA210_AMX_BYTE_MAP_CTRL(23),
+	TEGRA210_AMX_BYTE_MAP_CTRL(24),
+	TEGRA210_AMX_BYTE_MAP_CTRL(25),
+	TEGRA210_AMX_BYTE_MAP_CTRL(26),
+	TEGRA210_AMX_BYTE_MAP_CTRL(27),
+	TEGRA210_AMX_BYTE_MAP_CTRL(28),
+	TEGRA210_AMX_BYTE_MAP_CTRL(29),
+	TEGRA210_AMX_BYTE_MAP_CTRL(30),
+	TEGRA210_AMX_BYTE_MAP_CTRL(31),
+	TEGRA210_AMX_BYTE_MAP_CTRL(32),
+	TEGRA210_AMX_BYTE_MAP_CTRL(33),
+	TEGRA210_AMX_BYTE_MAP_CTRL(34),
+	TEGRA210_AMX_BYTE_MAP_CTRL(35),
+	TEGRA210_AMX_BYTE_MAP_CTRL(36),
+	TEGRA210_AMX_BYTE_MAP_CTRL(37),
+	TEGRA210_AMX_BYTE_MAP_CTRL(38),
+	TEGRA210_AMX_BYTE_MAP_CTRL(39),
+	TEGRA210_AMX_BYTE_MAP_CTRL(40),
+	TEGRA210_AMX_BYTE_MAP_CTRL(41),
+	TEGRA210_AMX_BYTE_MAP_CTRL(42),
+	TEGRA210_AMX_BYTE_MAP_CTRL(43),
+	TEGRA210_AMX_BYTE_MAP_CTRL(44),
+	TEGRA210_AMX_BYTE_MAP_CTRL(45),
+	TEGRA210_AMX_BYTE_MAP_CTRL(46),
+	TEGRA210_AMX_BYTE_MAP_CTRL(47),
+	TEGRA210_AMX_BYTE_MAP_CTRL(48),
+	TEGRA210_AMX_BYTE_MAP_CTRL(49),
+	TEGRA210_AMX_BYTE_MAP_CTRL(50),
+	TEGRA210_AMX_BYTE_MAP_CTRL(51),
+	TEGRA210_AMX_BYTE_MAP_CTRL(52),
+	TEGRA210_AMX_BYTE_MAP_CTRL(53),
+	TEGRA210_AMX_BYTE_MAP_CTRL(54),
+	TEGRA210_AMX_BYTE_MAP_CTRL(55),
+	TEGRA210_AMX_BYTE_MAP_CTRL(56),
+	TEGRA210_AMX_BYTE_MAP_CTRL(57),
+	TEGRA210_AMX_BYTE_MAP_CTRL(58),
+	TEGRA210_AMX_BYTE_MAP_CTRL(59),
+	TEGRA210_AMX_BYTE_MAP_CTRL(60),
+	TEGRA210_AMX_BYTE_MAP_CTRL(61),
+	TEGRA210_AMX_BYTE_MAP_CTRL(62),
+	TEGRA210_AMX_BYTE_MAP_CTRL(63),
+};
+
+static const struct snd_soc_component_driver tegra210_amx_cmpnt = {
+	.dapm_widgets		= tegra210_amx_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra210_amx_widgets),
+	.dapm_routes		= tegra210_amx_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra210_amx_routes),
+	.controls		= tegra210_amx_controls,
+	.num_controls		= ARRAY_SIZE(tegra210_amx_controls),
+};
+
+static bool tegra210_amx_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_AMX_RX_INT_MASK ... TEGRA210_AMX_RX4_CIF_CTRL:
+	case TEGRA210_AMX_TX_INT_MASK ... TEGRA210_AMX_CG:
+	case TEGRA210_AMX_CTRL ... TEGRA210_AMX_CYA:
+	case TEGRA210_AMX_CFG_RAM_CTRL ... TEGRA210_AMX_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra194_amx_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA194_AMX_RX1_FRAME_PERIOD ... TEGRA194_AMX_RX4_FRAME_PERIOD:
+		return true;
+	default:
+		return tegra210_amx_wr_reg(dev, reg);
+	}
+}
+
+static bool tegra210_amx_rd_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_AMX_RX_STATUS ... TEGRA210_AMX_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra194_amx_rd_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA194_AMX_RX1_FRAME_PERIOD ... TEGRA194_AMX_RX4_FRAME_PERIOD:
+		return true;
+	default:
+		return tegra210_amx_rd_reg(dev, reg);
+	}
+}
+
+static bool tegra210_amx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_AMX_RX_STATUS:
+	case TEGRA210_AMX_RX_INT_STATUS:
+	case TEGRA210_AMX_RX_INT_SET:
+	case TEGRA210_AMX_TX_STATUS:
+	case TEGRA210_AMX_TX_INT_STATUS:
+	case TEGRA210_AMX_TX_INT_SET:
+	case TEGRA210_AMX_SOFT_RESET:
+	case TEGRA210_AMX_STATUS:
+	case TEGRA210_AMX_INT_STATUS:
+	case TEGRA210_AMX_CFG_RAM_CTRL:
+	case TEGRA210_AMX_CFG_RAM_DATA:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+static const struct regmap_config tegra210_amx_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_AMX_CFG_RAM_DATA,
+	.writeable_reg		= tegra210_amx_wr_reg,
+	.readable_reg		= tegra210_amx_rd_reg,
+	.volatile_reg		= tegra210_amx_volatile_reg,
+	.reg_defaults		= tegra210_amx_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_amx_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct regmap_config tegra194_amx_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA194_AMX_RX4_LAST_FRAME_PERIOD,
+	.writeable_reg		= tegra194_amx_wr_reg,
+	.readable_reg		= tegra194_amx_rd_reg,
+	.volatile_reg		= tegra210_amx_volatile_reg,
+	.reg_defaults		= tegra210_amx_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_amx_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct tegra210_amx_soc_data soc_data_tegra210 = {
+	.regmap_conf	= &tegra210_amx_regmap_config,
+};
+
+static const struct tegra210_amx_soc_data soc_data_tegra194 = {
+	.regmap_conf	= &tegra194_amx_regmap_config,
+	.auto_disable	= true,
+};
+
+static const struct of_device_id tegra210_amx_of_match[] = {
+	{ .compatible = "nvidia,tegra210-amx", .data = &soc_data_tegra210 },
+	{ .compatible = "nvidia,tegra194-amx", .data = &soc_data_tegra194 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra210_amx_of_match);
+
+static int tegra210_amx_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_amx *amx;
+	void __iomem *regs;
+	int err;
+	const struct of_device_id *match;
+	struct tegra210_amx_soc_data *soc_data;
+
+	match = of_match_device(tegra210_amx_of_match, dev);
+
+	soc_data = (struct tegra210_amx_soc_data *)match->data;
+
+	amx = devm_kzalloc(dev, sizeof(*amx), GFP_KERNEL);
+	if (!amx)
+		return -ENOMEM;
+
+	amx->soc_data = soc_data;
+
+	dev_set_drvdata(dev, amx);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	amx->regmap = devm_regmap_init_mmio(dev, regs,
+					    soc_data->regmap_conf);
+	if (IS_ERR(amx->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(amx->regmap);
+	}
+
+	regcache_cache_only(amx->regmap, true);
+
+	err = devm_snd_soc_register_component(dev, &tegra210_amx_cmpnt,
+					      tegra210_amx_dais,
+					      ARRAY_SIZE(tegra210_amx_dais));
+	if (err) {
+		dev_err(dev, "can't register AMX component, err: %d\n", err);
+		return err;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int tegra210_amx_platform_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra210_amx_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra210_amx_runtime_suspend,
+			   tegra210_amx_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra210_amx_driver = {
+	.driver = {
+		.name = "tegra210-amx",
+		.of_match_table = tegra210_amx_of_match,
+		.pm = &tegra210_amx_pm_ops,
+	},
+	.probe = tegra210_amx_platform_probe,
+	.remove = tegra210_amx_platform_remove,
+};
+module_platform_driver(tegra210_amx_driver);
+
+MODULE_AUTHOR("Songhee Baek <sbaek@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 AMX ASoC driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra210_amx.h b/sound/soc/tegra/tegra210_amx.h
new file mode 100644
index 00000000..e277741
--- /dev/null
+++ b/sound/soc/tegra/tegra210_amx.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_amx.h - Definitions for Tegra210 AMX driver
+ *
+ * Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_AMX_H__
+#define __TEGRA210_AMX_H__
+
+/* Register offsets from TEGRA210_AMX*_BASE */
+#define TEGRA210_AMX_RX_STATUS			0x0c
+#define TEGRA210_AMX_RX_INT_STATUS		0x10
+#define TEGRA210_AMX_RX_INT_MASK		0x14
+#define TEGRA210_AMX_RX_INT_SET			0x18
+#define TEGRA210_AMX_RX_INT_CLEAR		0x1c
+#define TEGRA210_AMX_RX1_CIF_CTRL		0x20
+#define TEGRA210_AMX_RX2_CIF_CTRL		0x24
+#define TEGRA210_AMX_RX3_CIF_CTRL		0x28
+#define TEGRA210_AMX_RX4_CIF_CTRL		0x2c
+#define TEGRA210_AMX_TX_STATUS			0x4c
+#define TEGRA210_AMX_TX_INT_STATUS		0x50
+#define TEGRA210_AMX_TX_INT_MASK		0x54
+#define TEGRA210_AMX_TX_INT_SET			0x58
+#define TEGRA210_AMX_TX_INT_CLEAR		0x5c
+#define TEGRA210_AMX_TX_CIF_CTRL		0x60
+#define TEGRA210_AMX_ENABLE			0x80
+#define TEGRA210_AMX_SOFT_RESET			0x84
+#define TEGRA210_AMX_CG				0x88
+#define TEGRA210_AMX_STATUS			0x8c
+#define TEGRA210_AMX_INT_STATUS			0x90
+#define TEGRA210_AMX_CTRL			0xa4
+#define TEGRA210_AMX_OUT_BYTE_EN0		0xa8
+#define TEGRA210_AMX_OUT_BYTE_EN1		0xac
+#define TEGRA210_AMX_CYA			0xb0
+#define TEGRA210_AMX_CFG_RAM_CTRL		0xb8
+#define TEGRA210_AMX_CFG_RAM_DATA		0xbc
+
+#define TEGRA194_AMX_RX1_FRAME_PERIOD		0xc0
+#define TEGRA194_AMX_RX4_FRAME_PERIOD		0xcc
+#define TEGRA194_AMX_RX4_LAST_FRAME_PERIOD	0xdc
+
+/* Fields in TEGRA210_AMX_ENABLE */
+#define TEGRA210_AMX_ENABLE_SHIFT			0
+
+/* Fields in TEGRA210_AMX_CTRL */
+#define TEGRA210_AMX_CTRL_MSTR_RX_NUM_SHIFT		14
+#define TEGRA210_AMX_CTRL_MSTR_RX_NUM_MASK		(3 << TEGRA210_AMX_CTRL_MSTR_RX_NUM_SHIFT)
+
+#define TEGRA210_AMX_CTRL_RX_DEP_SHIFT			12
+#define TEGRA210_AMX_CTRL_RX_DEP_MASK			(3 << TEGRA210_AMX_CTRL_RX_DEP_SHIFT)
+
+/* Fields in TEGRA210_AMX_CFG_RAM_CTRL */
+#define TEGRA210_AMX_CFG_RAM_CTRL_RW_SHIFT		14
+#define TEGRA210_AMX_CFG_RAM_CTRL_RW_WRITE		(1 << TEGRA210_AMX_CFG_RAM_CTRL_RW_SHIFT)
+
+#define TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN_SHIFT	13
+#define TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN		(1 << TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN_SHIFT)
+
+#define TEGRA210_AMX_CFG_RAM_CTRL_SEQ_ACCESS_EN_SHIFT	12
+#define TEGRA210_AMX_CFG_RAM_CTRL_SEQ_ACCESS_EN		(1 << TEGRA210_AMX_CFG_RAM_CTRL_SEQ_ACCESS_EN_SHIFT)
+
+#define TEGRA210_AMX_CFG_CTRL_RAM_ADDR_SHIFT		0
+
+/* Fields in TEGRA210_AMX_SOFT_RESET */
+#define TEGRA210_AMX_SOFT_RESET_SOFT_EN			1
+#define TEGRA210_AMX_SOFT_RESET_SOFT_RESET_MASK		TEGRA210_AMX_SOFT_RESET_SOFT_EN
+
+#define TEGRA210_AMX_AUDIOCIF_CH_STRIDE		4
+#define TEGRA210_AMX_RAM_DEPTH			16
+#define TEGRA210_AMX_MAP_STREAM_NUM_SHIFT	6
+#define TEGRA210_AMX_MAP_WORD_NUM_SHIFT		2
+#define TEGRA210_AMX_MAP_BYTE_NUM_SHIFT		0
+
+enum {
+	TEGRA210_AMX_WAIT_ON_ALL,
+	TEGRA210_AMX_WAIT_ON_ANY,
+};
+
+struct tegra210_amx_soc_data {
+	const struct regmap_config *regmap_conf;
+	bool auto_disable;
+};
+
+struct tegra210_amx {
+	const struct tegra210_amx_soc_data *soc_data;
+	unsigned int map[TEGRA210_AMX_RAM_DEPTH];
+	struct regmap *regmap;
+	unsigned int byte_mask[2];
+};
+
+#endif
-- 
2.7.4


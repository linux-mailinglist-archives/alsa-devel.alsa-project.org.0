Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC613F9763
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47FEE16D8;
	Fri, 27 Aug 2021 11:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47FEE16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057407;
	bh=QhiuyBnRpayb64TynVHtfbwnLrqHsMKc/2gP1onZy10=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VysHanEVDW+9QCsigNb1mugiDo9mKiplyJjBY8mUnV/eR9n53vL3aLwZbiNq+GQ8o
	 OYPVsis5tbaSHRtUU2yB+pg4+OS2cal1xg3BuKPuOnNHksSpuqICGpLM9PmChh9PYs
	 qGmGbZNVWsVMbLfu8w6c5FvTD5p3AmHkQeSqi1xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C07FF801D8;
	Fri, 27 Aug 2021 11:39:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91E21F8053C; Fri, 27 Aug 2021 11:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7B8DF8051F
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7B8DF8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="cvxR7DAv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx7ge9tK2iHL9+GAmmD2xmYIiU4eZwu6h6sU8Fes1XDTMchuSmRkvPJjcEyQCi3RNvtNZrtcHRY/Y2MWBk3I8X/B5Dv4DNFSyLSwTweYt1XUJIDWu+zFUrZsCn1sC+ecdaTGlPIuM6GnYB9nzzcgLlgDzbtn0aBnLikw0vlM2sypNsRgQO1mYYRXwRsmStYJ1w9gNNmG4XIAdC96sbGKzgDcr1y7RF3vTdHrUwYhv5IxrBco1LYDcXHquC576mSeMZLtmQ+/Cq35kxelQ6sQh1UQU1JYtzRfzH/SMFjQCrSK7HDpjZ2O8il76SIOm9EtNN2SNKo8grr2yzcXjmiy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vKsCpHmDvYXn01dt9f51vsVxpzEoxAOr4NFasdjzEo=;
 b=EUgfwb7/yXTEODdqRepLqLzfYJODY6mxjRglz9o/4uvBnehhtR+eAWPDcx27IhbSXOXW1htXzeZoMC/xUpmRTu3Y38GaW30QKGIWt5Q+wcUIqNQ/R0O1bat8h22VUyqphTRgM4zh+uk/OR/qFqC20j++vuum7wf6EItssJCKhYOtFI2oh0YKNzVBML/ZuvnObkcY63JbIrjrYvtAVv67LQ1sQY9QM/QhcKJwFl9lNPxY4mYTkkYrbQ0LWQky8S2ThPbwMjsnH91ae729BT0lrzSrvKko68bcefwR00JRkeiT8w3uk490igE8K6j+BJFamr+B6wfrRU7j8kFgeGsdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vKsCpHmDvYXn01dt9f51vsVxpzEoxAOr4NFasdjzEo=;
 b=cvxR7DAvVjC9yn49DfoTZXTshtPwuW2dMNAhnL+HGAoxf/TPf9f5lvFJGYaUZ8+G9QjlVYYfoM8f3Q2p9dpHmNxR4muiB0OAs3cZIT1mcyiS9Cpw8SUCUyuHtg3MyFQeKgmUFkej/f6cAOibuhuJvEQYTiquEdDkV+lnMxi70jlH3sC1DHoHDAtm3pCPDE2fugZoFqc7tOOu23RKOwjV2ZFC+wRrsTDqiFoeTuxKrGlbRtXB7+w6PHBzAlL48JB2Lo/ca6avL/wnK6QxEC9D/3FlEbnJx5IQw6d/UMMbS+v9G5gcPm8Z/nSY+Im8/K5QlYirTGOmKIF/ppu9JMt1lg==
Received: from DM6PR10CA0033.namprd10.prod.outlook.com (2603:10b6:5:60::46) by
 BL1PR12MB5377.namprd12.prod.outlook.com (2603:10b6:208:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 09:38:49 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::72) by DM6PR10CA0033.outlook.office365.com
 (2603:10b6:5:60::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:48 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:47 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:43 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/13] ASoC: tegra: Add Tegra210 based Mixer driver
Date: Fri, 27 Aug 2021 15:03:56 +0530
Message-ID: <1630056839-6562-11-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd4df349-425a-46ae-5f62-08d9693e78de
X-MS-TrafficTypeDiagnostic: BL1PR12MB5377:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53776EF2AECC590EE96866FCA7C89@BL1PR12MB5377.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRcijO58tvgRldhF2LIXys9WbpbEmJck0QpqIDBf0eCaRVYFCNigcTwIKbGtFvSo/9VHTg+zDZJb/eEvD67h7ngPdzVxSZoxA0NAOt/nNXrZl3chz0BUui1r+82sc1O1Lc5gC0fvzoficlclB7tOkG3kAJJsvnQoWkc+nF+tTRptq72spyudGlBH34bAT7vO4G/PYnlhzSkhgxlLNSWUDSygJcXNOiVekc5zpjqiaUvT8AaXoNcqkhJF8TJfkP6vUBhDxvOxWcciZdRIdoTrQQPGG0Ss1nCuedFeOVAgK9sW/MwEdpd0ouXfnsCduFQcc3mWUvNggVD1P+a3cimPDphtQQFZsCVGzEODORbgjOkpq3yokGxGrg5DAPVN9b/ZdnGUFZch4FxVyEUcXdP/ZnIqTl7zXF9t9t5D753Q0xQ24WLh7Fere+0oYRa86NdSJueHBuY0HoQsVjbgZ9KonM7OiafJRyy/QOdgAr6cZKMJ9wWPjvC/Ijg7gm3tUVbvXVv4OuTzWkxoirw+DW1NHWBWxo4w3Wa4HfOSxlYzzeB1erlolkbqny0nMQmDR5zx4Vh2oUpgxt2c/TuGpc534ZJTAwboa83FoPoB4LOT6sNWeUru5G9z28j11n5s5P7YhuqOJdAnTieRbVb/b4wA+RiYaOrIvIh8DbZhmb7GWULKlCpUXgcm6/BeNqfw4/DWi8K+x1kCevJEduV66dHd9j3+Sis+EdKuUV4bHDyVFxQ=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(54906003)(70586007)(8936002)(2616005)(7696005)(36756003)(36906005)(316002)(70206006)(110136005)(83380400001)(36860700001)(107886003)(7636003)(8676002)(6666004)(921005)(186003)(4326008)(30864003)(2906002)(356005)(86362001)(26005)(82310400003)(47076005)(7416002)(336012)(5660300002)(478600001)(82740400003)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:48.4734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4df349-425a-46ae-5f62-08d9693e78de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5377
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

The Mixer supports mixing of up to ten 7.1 audio input streams and
generate five outputs (each of which can be any combination of the
ten input streams)

This patch registers Mixer driver with ASoC framework. The component
driver exposes DAPM widgets, routes and kcontrols for the device.
The DAI driver exposes Mixer interfaces, which can be used to connect
different components in the ASoC layer. Makefile and Kconfig support
is added to allow build the driver. It can be enabled in the DT via
"nvidia,tegra210-amixer" compatible binding.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig          |  10 +
 sound/soc/tegra/Makefile         |   2 +
 sound/soc/tegra/tegra210_mixer.c | 667 +++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_mixer.h | 100 ++++++
 4 files changed, 779 insertions(+)
 create mode 100644 sound/soc/tegra/tegra210_mixer.c
 create mode 100644 sound/soc/tegra/tegra210_mixer.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index fd4a8d6..cd45487 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -146,6 +146,16 @@ config SND_SOC_TEGRA210_ADX
 	  except that the data flow direction is reversed.
 	  Say Y or M if you want to add support for Tegra210 ADX module.
 
+config SND_SOC_TEGRA210_MIXER
+	tristate "Tegra210 Mixer module"
+	help
+	  Config to enable the Mixer module which can help to mix multiple
+	  audio streams. It supports mixing of upto 10 input streams,
+	  where each stream can contain maximum of 8 channels. It supports
+	  5 output each of which can be a mix of any combination of 10
+	  input streams.
+	  Say Y or M if you want to add support for Tegra210 Mixer module.
+
 config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 	tristate "Audio Graph Card based Tegra driver"
 	depends on SND_AUDIO_GRAPH_CARD
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 8eb17ad..f19d566 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -17,6 +17,7 @@ snd-soc-tegra210-mvc-objs := tegra210_mvc.o
 snd-soc-tegra210-sfc-objs := tegra210_sfc.o
 snd-soc-tegra210-amx-objs := tegra210_amx.o
 snd-soc-tegra210-adx-objs := tegra210_adx.o
+snd-soc-tegra210-mixer-objs := tegra210_mixer.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
@@ -34,6 +35,7 @@ obj-$(CONFIG_SND_SOC_TEGRA210_MVC) += snd-soc-tegra210-mvc.o
 obj-$(CONFIG_SND_SOC_TEGRA210_SFC) += snd-soc-tegra210-sfc.o
 obj-$(CONFIG_SND_SOC_TEGRA210_AMX) += snd-soc-tegra210-amx.o
 obj-$(CONFIG_SND_SOC_TEGRA210_ADX) += snd-soc-tegra210-adx.o
+obj-$(CONFIG_SND_SOC_TEGRA210_MIXER) += snd-soc-tegra210-mixer.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
new file mode 100644
index 0000000..54a0d38
--- /dev/null
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -0,0 +1,667 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra210_mixer.c - Tegra210 MIXER driver
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
+#include "tegra210_mixer.h"
+#include "tegra_cif.h"
+
+#define MIXER_REG(reg, id)	((reg) + ((id) * TEGRA210_MIXER_REG_STRIDE))
+#define MIXER_REG_BASE(reg)	((reg) % TEGRA210_MIXER_REG_STRIDE)
+
+#define MIXER_GAIN_CFG_RAM_ADDR(id)					\
+	(TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_0 +				\
+	 ((id) * TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_STRIDE))
+
+#define MIXER_RX_REG_DEFAULTS(id)					\
+	{ MIXER_REG(TEGRA210_MIXER_RX1_CIF_CTRL, id), 0x00007700},	\
+	{ MIXER_REG(TEGRA210_MIXER_RX1_CTRL, id), 0x00010823},	\
+	{ MIXER_REG(TEGRA210_MIXER_RX1_PEAK_CTRL, id), 0x000012c0}
+
+#define MIXER_TX_REG_DEFAULTS(id)					\
+	{ MIXER_REG(TEGRA210_MIXER_TX1_INT_MASK, (id)), 0x00000001},	\
+	{ MIXER_REG(TEGRA210_MIXER_TX1_CIF_CTRL, (id)), 0x00007700}
+
+#define REG_DURATION_PARAM(reg, i) ((reg) + NUM_GAIN_POLY_COEFFS + 1 + (i))
+
+static const struct reg_default tegra210_mixer_reg_defaults[] = {
+	/* Inputs */
+	MIXER_RX_REG_DEFAULTS(0),
+	MIXER_RX_REG_DEFAULTS(1),
+	MIXER_RX_REG_DEFAULTS(2),
+	MIXER_RX_REG_DEFAULTS(3),
+	MIXER_RX_REG_DEFAULTS(4),
+	MIXER_RX_REG_DEFAULTS(5),
+	MIXER_RX_REG_DEFAULTS(6),
+	MIXER_RX_REG_DEFAULTS(7),
+	MIXER_RX_REG_DEFAULTS(8),
+	MIXER_RX_REG_DEFAULTS(9),
+	/* Outputs */
+	MIXER_TX_REG_DEFAULTS(0),
+	MIXER_TX_REG_DEFAULTS(1),
+	MIXER_TX_REG_DEFAULTS(2),
+	MIXER_TX_REG_DEFAULTS(3),
+	MIXER_TX_REG_DEFAULTS(4),
+
+	{ TEGRA210_MIXER_CG, 0x00000001},
+	{ TEGRA210_MIXER_GAIN_CFG_RAM_CTRL, 0x00004000},
+	{ TEGRA210_MIXER_PEAKM_RAM_CTRL, 0x00004000},
+	{ TEGRA210_MIXER_ENABLE, 0x1 },
+};
+
+/* Default gain parameters */
+static const struct tegra210_mixer_gain_params gain_params = {
+	/* Polynomial coefficients */
+	{ 0, 0, 0, 0, 0, 0, 0, 0x1000000, 0 },
+	/* Gain value */
+	0x10000,
+	/* Duration Parameters */
+	{ 0, 0, 0x400, 0x8000000 },
+};
+
+static int __maybe_unused tegra210_mixer_runtime_suspend(struct device *dev)
+{
+	struct tegra210_mixer *mixer = dev_get_drvdata(dev);
+
+	regcache_cache_only(mixer->regmap, true);
+	regcache_mark_dirty(mixer->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused tegra210_mixer_runtime_resume(struct device *dev)
+{
+	struct tegra210_mixer *mixer = dev_get_drvdata(dev);
+
+	regcache_cache_only(mixer->regmap, false);
+	regcache_sync(mixer->regmap);
+
+	return 0;
+}
+
+static int tegra210_mixer_write_ram(struct tegra210_mixer *mixer,
+				    unsigned int addr,
+				    unsigned int coef)
+{
+	unsigned int reg, val;
+	int err;
+
+	/* Check if busy */
+	err = regmap_read_poll_timeout(mixer->regmap,
+				       TEGRA210_MIXER_GAIN_CFG_RAM_CTRL,
+				       val, !(val & 0x80000000), 10, 10000);
+	if (err < 0)
+		return err;
+
+	reg = (addr << TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_SHIFT) &
+	      TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_MASK;
+	reg |= TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_INIT_EN;
+	reg |= TEGRA210_MIXER_GAIN_CFG_RAM_RW_WRITE;
+	reg |= TEGRA210_MIXER_GAIN_CFG_RAM_SEQ_ACCESS_EN;
+
+	regmap_write(mixer->regmap,
+		     TEGRA210_MIXER_GAIN_CFG_RAM_CTRL,
+		     reg);
+	regmap_write(mixer->regmap,
+		     TEGRA210_MIXER_GAIN_CFG_RAM_DATA,
+		     coef);
+
+	return 0;
+}
+
+static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
+					 unsigned int id, bool instant_gain)
+{
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int reg = MIXER_GAIN_CFG_RAM_ADDR(id);
+	int err, i;
+
+	pm_runtime_get_sync(cmpnt->dev);
+
+	/* Write default gain poly coefficients */
+	for (i = 0; i < NUM_GAIN_POLY_COEFFS; i++) {
+		err = tegra210_mixer_write_ram(mixer, reg + i,
+					       gain_params.poly_coeff[i]);
+
+		if (err < 0)
+			goto rpm_put;
+	}
+
+	/* Write stored gain value */
+	err = tegra210_mixer_write_ram(mixer, reg + NUM_GAIN_POLY_COEFFS,
+				       mixer->gain_value[id]);
+	if (err < 0)
+		goto rpm_put;
+
+	/* Write duration parameters */
+	for (i = 0; i < NUM_DURATION_PARMS; i++) {
+		int val;
+
+		if (instant_gain)
+			val = 1;
+		else
+			val = gain_params.duration[i];
+
+		err = tegra210_mixer_write_ram(mixer,
+					       REG_DURATION_PARAM(reg, i),
+					       val);
+		if (err < 0)
+			goto rpm_put;
+	}
+
+	/* Trigger to apply gain configurations */
+	err = tegra210_mixer_write_ram(mixer, reg + REG_CFG_DONE_TRIGGER,
+				       VAL_CFG_DONE_TRIGGER);
+
+rpm_put:
+	pm_runtime_put(cmpnt->dev);
+
+	return err;
+}
+
+static int tegra210_mixer_get_gain(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int reg = mc->reg;
+	unsigned int i;
+
+	i = (reg - TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_0) /
+	    TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_STRIDE;
+
+	ucontrol->value.integer.value[0] = mixer->gain_value[i];
+
+	return 0;
+}
+
+static int tegra210_mixer_put_gain(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int reg = mc->reg, id;
+	bool instant_gain = false;
+
+	if (strstr(kcontrol->id.name, "Instant Gain Volume"))
+		instant_gain = true;
+
+	/* Save gain value for specific MIXER input */
+	id = (reg - TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_0) /
+	     TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_STRIDE;
+
+	mixer->gain_value[id] = ucontrol->value.integer.value[0];
+
+	return tegra210_mixer_configure_gain(cmpnt, id, instant_gain);
+}
+
+static int tegra210_mixer_set_audio_cif(struct tegra210_mixer *mixer,
+					struct snd_pcm_hw_params *params,
+					unsigned int reg,
+					unsigned int id)
+{
+	unsigned int channels, audio_bits;
+	struct tegra_cif_conf cif_conf;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	channels = params_channels(params);
+
+	switch (params_format(params)) {
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
+	tegra_set_cif(mixer->regmap,
+		      reg + (id * TEGRA210_MIXER_REG_STRIDE),
+		      &cif_conf);
+
+	return 0;
+}
+
+static int tegra210_mixer_in_hw_params(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params,
+				       struct snd_soc_dai *dai)
+{
+	struct tegra210_mixer *mixer = snd_soc_dai_get_drvdata(dai);
+	int err;
+
+	err = tegra210_mixer_set_audio_cif(mixer, params,
+					   TEGRA210_MIXER_RX1_CIF_CTRL,
+					   dai->id);
+	if (err < 0)
+		return err;
+
+	return tegra210_mixer_configure_gain(dai->component, dai->id, false);
+}
+
+static int tegra210_mixer_out_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params,
+					struct snd_soc_dai *dai)
+{
+	struct tegra210_mixer *mixer = snd_soc_dai_get_drvdata(dai);
+
+	return tegra210_mixer_set_audio_cif(mixer, params,
+					    TEGRA210_MIXER_TX1_CIF_CTRL,
+					    dai->id - TEGRA210_MIXER_RX_MAX);
+}
+
+static struct snd_soc_dai_ops tegra210_mixer_out_dai_ops = {
+	.hw_params	= tegra210_mixer_out_hw_params,
+};
+
+static struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
+	.hw_params	= tegra210_mixer_in_hw_params,
+};
+
+#define IN_DAI(id)						\
+	{							\
+		.name = "MIXER-RX-CIF"#id,			\
+		.playback = {					\
+			.stream_name = "RX" #id "-CIF-Playback",\
+			.channels_min = 1,			\
+			.channels_max = 8,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.capture = {					\
+			.stream_name = "RX" #id "-CIF-Capture",	\
+			.channels_min = 1,			\
+			.channels_max = 8,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.ops = &tegra210_mixer_in_dai_ops,		\
+	}
+
+#define OUT_DAI(id)						\
+	{							\
+		.name = "MIXER-TX-CIF" #id,			\
+		.playback = {					\
+			.stream_name = "TX" #id "-CIF-Playback",\
+			.channels_min = 1,			\
+			.channels_max = 8,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.capture = {					\
+			.stream_name = "TX" #id "-CIF-Capture",	\
+			.channels_min = 1,			\
+			.channels_max = 8,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.ops = &tegra210_mixer_out_dai_ops,		\
+	}
+
+static struct snd_soc_dai_driver tegra210_mixer_dais[] = {
+	/* Mixer Input */
+	IN_DAI(1),
+	IN_DAI(2),
+	IN_DAI(3),
+	IN_DAI(4),
+	IN_DAI(5),
+	IN_DAI(6),
+	IN_DAI(7),
+	IN_DAI(8),
+	IN_DAI(9),
+	IN_DAI(10),
+
+	/* Mixer Output */
+	OUT_DAI(1),
+	OUT_DAI(2),
+	OUT_DAI(3),
+	OUT_DAI(4),
+	OUT_DAI(5),
+};
+
+#define ADDER_CTRL_DECL(name, reg)			\
+	static const struct snd_kcontrol_new name[] = {	\
+		SOC_DAPM_SINGLE("RX1", reg, 0, 1, 0),	\
+		SOC_DAPM_SINGLE("RX2", reg, 1, 1, 0),	\
+		SOC_DAPM_SINGLE("RX3", reg, 2, 1, 0),	\
+		SOC_DAPM_SINGLE("RX4", reg, 3, 1, 0),	\
+		SOC_DAPM_SINGLE("RX5", reg, 4, 1, 0),	\
+		SOC_DAPM_SINGLE("RX6", reg, 5, 1, 0),	\
+		SOC_DAPM_SINGLE("RX7", reg, 6, 1, 0),	\
+		SOC_DAPM_SINGLE("RX8", reg, 7, 1, 0),	\
+		SOC_DAPM_SINGLE("RX9", reg, 8, 1, 0),	\
+		SOC_DAPM_SINGLE("RX10", reg, 9, 1, 0),	\
+	}
+
+ADDER_CTRL_DECL(adder1, TEGRA210_MIXER_TX1_ADDER_CONFIG);
+ADDER_CTRL_DECL(adder2, TEGRA210_MIXER_TX2_ADDER_CONFIG);
+ADDER_CTRL_DECL(adder3, TEGRA210_MIXER_TX3_ADDER_CONFIG);
+ADDER_CTRL_DECL(adder4, TEGRA210_MIXER_TX4_ADDER_CONFIG);
+ADDER_CTRL_DECL(adder5, TEGRA210_MIXER_TX5_ADDER_CONFIG);
+
+#define GAIN_CTRL(id)	\
+	SOC_SINGLE_EXT("RX" #id " Gain Volume",			\
+		       MIXER_GAIN_CFG_RAM_ADDR((id) - 1), 0,	\
+		       0x20000, 0, tegra210_mixer_get_gain,	\
+		       tegra210_mixer_put_gain),		\
+	SOC_SINGLE_EXT("RX" #id " Instant Gain Volume",		\
+		       MIXER_GAIN_CFG_RAM_ADDR((id) - 1), 0,	\
+		       0x20000, 0, tegra210_mixer_get_gain,	\
+		       tegra210_mixer_put_gain),
+
+/* Volume controls for all MIXER inputs */
+static const struct snd_kcontrol_new tegra210_mixer_gain_ctls[] = {
+	GAIN_CTRL(1)
+	GAIN_CTRL(2)
+	GAIN_CTRL(3)
+	GAIN_CTRL(4)
+	GAIN_CTRL(5)
+	GAIN_CTRL(6)
+	GAIN_CTRL(7)
+	GAIN_CTRL(8)
+	GAIN_CTRL(9)
+	GAIN_CTRL(10)
+};
+
+static const struct snd_soc_dapm_widget tegra210_mixer_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX7", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX8", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX9", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX10", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX1", NULL, 0, TEGRA210_MIXER_TX1_ENABLE, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX2", NULL, 0, TEGRA210_MIXER_TX2_ENABLE, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX3", NULL, 0, TEGRA210_MIXER_TX3_ENABLE, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX4", NULL, 0, TEGRA210_MIXER_TX4_ENABLE, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX5", NULL, 0, TEGRA210_MIXER_TX5_ENABLE, 0, 0),
+	SND_SOC_DAPM_MIXER("Adder1", SND_SOC_NOPM, 1, 0, adder1,
+			   ARRAY_SIZE(adder1)),
+	SND_SOC_DAPM_MIXER("Adder2", SND_SOC_NOPM, 1, 0, adder2,
+			   ARRAY_SIZE(adder2)),
+	SND_SOC_DAPM_MIXER("Adder3", SND_SOC_NOPM, 1, 0, adder3,
+			   ARRAY_SIZE(adder3)),
+	SND_SOC_DAPM_MIXER("Adder4", SND_SOC_NOPM, 1, 0, adder4,
+			   ARRAY_SIZE(adder4)),
+	SND_SOC_DAPM_MIXER("Adder5", SND_SOC_NOPM, 1, 0, adder5,
+			   ARRAY_SIZE(adder5)),
+};
+
+#define RX_ROUTES(id, sname)						   \
+	{ "RX" #id " XBAR-" sname,	NULL,	"RX" #id " XBAR-TX" },	   \
+	{ "RX" #id "-CIF-" sname,	NULL,	"RX" #id " XBAR-" sname }, \
+	{ "RX" #id,			NULL,	"RX" #id "-CIF-" sname }
+
+#define MIXER_RX_ROUTES(id)		\
+	RX_ROUTES(id, "Playback"),	\
+	RX_ROUTES(id, "Capture")
+
+#define ADDER_ROUTES(id, sname)						  \
+	{ "Adder" #id,			"RX1",	"RX1" },		  \
+	{ "Adder" #id,			"RX2",	"RX2" },		  \
+	{ "Adder" #id,			"RX3",	"RX3" },		  \
+	{ "Adder" #id,			"RX4",	"RX4" },		  \
+	{ "Adder" #id,			"RX5",	"RX5" },		  \
+	{ "Adder" #id,			"RX6",	"RX6" },		  \
+	{ "Adder" #id,			"RX7",	"RX7" },		  \
+	{ "Adder" #id,			"RX8",	"RX8" },		  \
+	{ "Adder" #id,			"RX9",	"RX9" },		  \
+	{ "Adder" #id,			"RX10",	"RX10" },		  \
+	{ "TX" #id,			NULL,	"Adder" #id },		  \
+	{ "TX" #id "-CIF-" sname,	NULL,	"TX" #id },		  \
+	{ "TX" #id " XBAR-" sname,	NULL,	"TX" #id "-CIF-" sname }, \
+	{ "TX" #id " XBAR-RX",		NULL,	"TX" #id " XBAR-" sname } \
+
+#define TX_ROUTES(id, sname)		\
+	ADDER_ROUTES(1, sname),		\
+	ADDER_ROUTES(2, sname),		\
+	ADDER_ROUTES(3, sname),		\
+	ADDER_ROUTES(4, sname),		\
+	ADDER_ROUTES(5, sname)
+
+#define MIXER_TX_ROUTES(id)		\
+	TX_ROUTES(id, "Playback"),	\
+	TX_ROUTES(id, "Capture")
+
+static const struct snd_soc_dapm_route tegra210_mixer_routes[] = {
+	/* Input */
+	MIXER_RX_ROUTES(1),
+	MIXER_RX_ROUTES(2),
+	MIXER_RX_ROUTES(3),
+	MIXER_RX_ROUTES(4),
+	MIXER_RX_ROUTES(5),
+	MIXER_RX_ROUTES(6),
+	MIXER_RX_ROUTES(7),
+	MIXER_RX_ROUTES(8),
+	MIXER_RX_ROUTES(9),
+	MIXER_RX_ROUTES(10),
+	/* Output */
+	MIXER_TX_ROUTES(1),
+	MIXER_TX_ROUTES(2),
+	MIXER_TX_ROUTES(3),
+	MIXER_TX_ROUTES(4),
+	MIXER_TX_ROUTES(5),
+};
+
+static const struct snd_soc_component_driver tegra210_mixer_cmpnt = {
+	.dapm_widgets		= tegra210_mixer_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra210_mixer_widgets),
+	.dapm_routes		= tegra210_mixer_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra210_mixer_routes),
+	.controls		= tegra210_mixer_gain_ctls,
+	.num_controls		= ARRAY_SIZE(tegra210_mixer_gain_ctls),
+};
+
+static bool tegra210_mixer_wr_reg(struct device *dev,
+				unsigned int reg)
+{
+	if (reg < TEGRA210_MIXER_RX_LIMIT)
+		reg = MIXER_REG_BASE(reg);
+	else if (reg < TEGRA210_MIXER_TX_LIMIT)
+		reg = MIXER_REG_BASE(reg) + TEGRA210_MIXER_TX1_ENABLE;
+
+	switch (reg) {
+	case TEGRA210_MIXER_RX1_SOFT_RESET:
+	case TEGRA210_MIXER_RX1_CIF_CTRL ... TEGRA210_MIXER_RX1_PEAK_CTRL:
+
+	case TEGRA210_MIXER_TX1_ENABLE:
+	case TEGRA210_MIXER_TX1_SOFT_RESET:
+	case TEGRA210_MIXER_TX1_INT_MASK ... TEGRA210_MIXER_TX1_ADDER_CONFIG:
+
+	case TEGRA210_MIXER_ENABLE ... TEGRA210_MIXER_CG:
+	case TEGRA210_MIXER_GAIN_CFG_RAM_CTRL ... TEGRA210_MIXER_CTRL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_mixer_rd_reg(struct device *dev,
+				unsigned int reg)
+{
+	if (reg < TEGRA210_MIXER_RX_LIMIT)
+		reg = MIXER_REG_BASE(reg);
+	else if (reg < TEGRA210_MIXER_TX_LIMIT)
+		reg = MIXER_REG_BASE(reg) + TEGRA210_MIXER_TX1_ENABLE;
+
+	switch (reg) {
+	case TEGRA210_MIXER_RX1_SOFT_RESET ... TEGRA210_MIXER_RX1_SAMPLE_COUNT:
+	case TEGRA210_MIXER_TX1_ENABLE ... TEGRA210_MIXER_TX1_ADDER_CONFIG:
+	case TEGRA210_MIXER_ENABLE ... TEGRA210_MIXER_CTRL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_mixer_volatile_reg(struct device *dev,
+				unsigned int reg)
+{
+	if (reg < TEGRA210_MIXER_RX_LIMIT)
+		reg = MIXER_REG_BASE(reg);
+	else if (reg < TEGRA210_MIXER_TX_LIMIT)
+		reg = MIXER_REG_BASE(reg) + TEGRA210_MIXER_TX1_ENABLE;
+
+	switch (reg) {
+	case TEGRA210_MIXER_RX1_SOFT_RESET:
+	case TEGRA210_MIXER_RX1_STATUS:
+
+	case TEGRA210_MIXER_TX1_SOFT_RESET:
+	case TEGRA210_MIXER_TX1_STATUS:
+	case TEGRA210_MIXER_TX1_INT_STATUS:
+	case TEGRA210_MIXER_TX1_INT_SET:
+
+	case TEGRA210_MIXER_SOFT_RESET:
+	case TEGRA210_MIXER_STATUS:
+	case TEGRA210_MIXER_INT_STATUS:
+	case TEGRA210_MIXER_GAIN_CFG_RAM_CTRL:
+	case TEGRA210_MIXER_GAIN_CFG_RAM_DATA:
+	case TEGRA210_MIXER_PEAKM_RAM_CTRL:
+	case TEGRA210_MIXER_PEAKM_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_mixer_precious_reg(struct device *dev,
+				unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_MIXER_GAIN_CFG_RAM_DATA:
+	case TEGRA210_MIXER_PEAKM_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tegra210_mixer_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_MIXER_CTRL,
+	.writeable_reg		= tegra210_mixer_wr_reg,
+	.readable_reg		= tegra210_mixer_rd_reg,
+	.volatile_reg		= tegra210_mixer_volatile_reg,
+	.precious_reg		= tegra210_mixer_precious_reg,
+	.reg_defaults		= tegra210_mixer_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_mixer_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct of_device_id tegra210_mixer_of_match[] = {
+	{ .compatible = "nvidia,tegra210-amixer" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra210_mixer_of_match);
+
+static int tegra210_mixer_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_mixer *mixer;
+	void __iomem *regs;
+	int err, i;
+
+	mixer = devm_kzalloc(dev, sizeof(*mixer), GFP_KERNEL);
+	if (!mixer)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, mixer);
+
+	/* Use default gain value for all MIXER inputs */
+	for (i = 0; i < TEGRA210_MIXER_RX_MAX; i++)
+		mixer->gain_value[i] = gain_params.gain_value;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	mixer->regmap = devm_regmap_init_mmio(dev, regs,
+					      &tegra210_mixer_regmap_config);
+	if (IS_ERR(mixer->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(mixer->regmap);
+	}
+
+	regcache_cache_only(mixer->regmap, true);
+
+	err = devm_snd_soc_register_component(dev, &tegra210_mixer_cmpnt,
+					      tegra210_mixer_dais,
+					      ARRAY_SIZE(tegra210_mixer_dais));
+	if (err) {
+		dev_err(dev, "can't register MIXER component, err: %d\n", err);
+		return err;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int tegra210_mixer_platform_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra210_mixer_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra210_mixer_runtime_suspend,
+			   tegra210_mixer_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra210_mixer_driver = {
+	.driver = {
+		.name = "tegra210_mixer",
+		.of_match_table = tegra210_mixer_of_match,
+		.pm = &tegra210_mixer_pm_ops,
+	},
+	.probe = tegra210_mixer_platform_probe,
+	.remove = tegra210_mixer_platform_remove,
+};
+module_platform_driver(tegra210_mixer_driver);
+
+MODULE_AUTHOR("Arun Shamanna Lakshmi <aruns@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 MIXER ASoC driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra210_mixer.h b/sound/soc/tegra/tegra210_mixer.h
new file mode 100644
index 0000000..a330530
--- /dev/null
+++ b/sound/soc/tegra/tegra210_mixer.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_mixer.h - Definitions for Tegra210 MIXER driver
+ *
+ * Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_MIXER_H__
+#define __TEGRA210_MIXER_H__
+
+/* XBAR_RX related MIXER offsets */
+#define TEGRA210_MIXER_RX1_SOFT_RESET	0x04
+#define TEGRA210_MIXER_RX1_STATUS	0x10
+#define TEGRA210_MIXER_RX1_CIF_CTRL	0x24
+#define TEGRA210_MIXER_RX1_CTRL		0x28
+#define TEGRA210_MIXER_RX1_PEAK_CTRL	0x2c
+#define TEGRA210_MIXER_RX1_SAMPLE_COUNT	0x30
+
+/* XBAR_TX related MIXER offsets */
+#define TEGRA210_MIXER_TX1_ENABLE	0x280
+#define TEGRA210_MIXER_TX1_SOFT_RESET	0x284
+#define TEGRA210_MIXER_TX1_STATUS	0x290
+#define TEGRA210_MIXER_TX1_INT_STATUS	0x294
+#define TEGRA210_MIXER_TX1_INT_MASK	0x298
+#define TEGRA210_MIXER_TX1_INT_SET	0x29c
+#define TEGRA210_MIXER_TX1_INT_CLEAR	0x2a0
+#define TEGRA210_MIXER_TX1_CIF_CTRL	0x2a4
+#define TEGRA210_MIXER_TX1_ADDER_CONFIG	0x2a8
+
+/* MIXER related offsets */
+#define TEGRA210_MIXER_ENABLE			0x400
+#define TEGRA210_MIXER_SOFT_RESET		0x404
+#define TEGRA210_MIXER_CG			0x408
+#define TEGRA210_MIXER_STATUS			0x410
+#define TEGRA210_MIXER_INT_STATUS		0x414
+#define TEGRA210_MIXER_GAIN_CFG_RAM_CTRL	0x42c
+#define TEGRA210_MIXER_GAIN_CFG_RAM_DATA	0x430
+#define TEGRA210_MIXER_PEAKM_RAM_CTRL		0x434
+#define TEGRA210_MIXER_PEAKM_RAM_DATA		0x438
+#define TEGRA210_MIXER_CTRL			0x43c
+
+#define TEGRA210_MIXER_TX2_ADDER_CONFIG	(TEGRA210_MIXER_TX1_ADDER_CONFIG + TEGRA210_MIXER_REG_STRIDE)
+#define TEGRA210_MIXER_TX3_ADDER_CONFIG	(TEGRA210_MIXER_TX2_ADDER_CONFIG + TEGRA210_MIXER_REG_STRIDE)
+#define TEGRA210_MIXER_TX4_ADDER_CONFIG	(TEGRA210_MIXER_TX3_ADDER_CONFIG + TEGRA210_MIXER_REG_STRIDE)
+#define TEGRA210_MIXER_TX5_ADDER_CONFIG	(TEGRA210_MIXER_TX4_ADDER_CONFIG + TEGRA210_MIXER_REG_STRIDE)
+
+#define TEGRA210_MIXER_TX2_ENABLE	(TEGRA210_MIXER_TX1_ENABLE + TEGRA210_MIXER_REG_STRIDE)
+#define TEGRA210_MIXER_TX3_ENABLE	(TEGRA210_MIXER_TX2_ENABLE + TEGRA210_MIXER_REG_STRIDE)
+#define TEGRA210_MIXER_TX4_ENABLE	(TEGRA210_MIXER_TX3_ENABLE + TEGRA210_MIXER_REG_STRIDE)
+#define TEGRA210_MIXER_TX5_ENABLE	(TEGRA210_MIXER_TX4_ENABLE + TEGRA210_MIXER_REG_STRIDE)
+
+/* Fields in TEGRA210_MIXER_ENABLE */
+#define TEGRA210_MIXER_ENABLE_SHIFT	0
+#define TEGRA210_MIXER_ENABLE_MASK	(1 << TEGRA210_MIXER_ENABLE_SHIFT)
+#define TEGRA210_MIXER_EN		(1 << TEGRA210_MIXER_ENABLE_SHIFT)
+
+/* Fields in TEGRA210_MIXER_GAIN_CFG_RAM_CTRL */
+#define TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_0		0x0
+#define TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_STRIDE		0x10
+
+#define TEGRA210_MIXER_GAIN_CFG_RAM_RW_SHIFT		14
+#define TEGRA210_MIXER_GAIN_CFG_RAM_RW_MASK		(1 << TEGRA210_MIXER_GAIN_CFG_RAM_RW_SHIFT)
+#define TEGRA210_MIXER_GAIN_CFG_RAM_RW_WRITE		(1 << TEGRA210_MIXER_GAIN_CFG_RAM_RW_SHIFT)
+
+#define TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_INIT_EN_SHIFT	13
+#define TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_INIT_EN_MASK	(1 << TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_INIT_EN_SHIFT)
+#define TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_INIT_EN	(1 << TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_INIT_EN_SHIFT)
+
+#define TEGRA210_MIXER_GAIN_CFG_RAM_SEQ_ACCESS_EN_SHIFT	12
+#define TEGRA210_MIXER_GAIN_CFG_RAM_SEQ_ACCESS_EN_MASK	(1 << TEGRA210_MIXER_GAIN_CFG_RAM_SEQ_ACCESS_EN_SHIFT)
+#define TEGRA210_MIXER_GAIN_CFG_RAM_SEQ_ACCESS_EN	(1 << TEGRA210_MIXER_GAIN_CFG_RAM_SEQ_ACCESS_EN_SHIFT)
+
+#define TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_SHIFT		0
+#define TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_MASK		(0x1ff << TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_SHIFT)
+
+#define TEGRA210_MIXER_REG_STRIDE	0x40
+#define TEGRA210_MIXER_RX_MAX		10
+#define TEGRA210_MIXER_RX_LIMIT		(TEGRA210_MIXER_RX_MAX * TEGRA210_MIXER_REG_STRIDE)
+#define TEGRA210_MIXER_TX_MAX		5
+#define TEGRA210_MIXER_TX_LIMIT		(TEGRA210_MIXER_RX_LIMIT + (TEGRA210_MIXER_TX_MAX * TEGRA210_MIXER_REG_STRIDE))
+
+#define REG_CFG_DONE_TRIGGER	0xf
+#define VAL_CFG_DONE_TRIGGER	0x1
+
+#define NUM_GAIN_POLY_COEFFS 9
+#define NUM_DURATION_PARMS 4
+
+struct tegra210_mixer_gain_params {
+	int poly_coeff[NUM_GAIN_POLY_COEFFS];
+	int gain_value;
+	int duration[NUM_DURATION_PARMS];
+};
+
+struct tegra210_mixer {
+	int gain_value[TEGRA210_MIXER_RX_MAX];
+	struct regmap *regmap;
+};
+
+#endif
-- 
2.7.4


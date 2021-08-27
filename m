Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 274103F975C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:43:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B8616F7;
	Fri, 27 Aug 2021 11:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B8616F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057379;
	bh=4CE0uZQMV1TBDlIdbk783R8GprKneOx9gR4HJ1/idK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PbO7uHjnDcXgmXZbjwnLAUam8e8jYaRDtOwdEJ52k9SMk6nmizQAAZAWkzoYFblC1
	 5aUfvGy9NWQSIeH3vGXfMncSP+Bo1gB4gQktiTmS9Px0/MNHiI5CLWk4BkZ5hP5s5S
	 d9/9MAHRaH4JTJrVyuSbcVxhvxLttbJh2kT+yCNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB97F80520;
	Fri, 27 Aug 2021 11:39:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69E9EF80538; Fri, 27 Aug 2021 11:39:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::610])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EAA0F80520
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EAA0F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="g2qJGF59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU2EPZqd5TD1DUyy0zssVwhVFbXNw4epTb0fP+C2ZJ511Y+zH0d4nOsyhW1wulRFBYAlz4rmD80iTAlqZdLuiv06EH3PvIvba5DTu6txX2JPOb+36YmVt+EdweBDn1nSrhIcBIRumtLAxsBVzHLIRiDQtvT56fXmOe7bNzmOoRZPR1V3lQSTpPQxrEJIIkmjoSXiAFwY+0DFSnxGhW3Vhzp9uP0a8l2mcjp742vUz325CL7R9wGKbQs/GVltiVX5qKP024xyfQC1X/ol6xn1hwSIV+PmtESAA04+5BRTtZJxP9581Z52KyB1NjRP5AVMRlToBq3fkDEU2UyLfhsdkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdmynzB2IGfZQAqV/K1Rp9znlOzuZwNF5ispSfwAeWw=;
 b=fK8sbe9hxLnsLDYFulia70Ej94iyxhK1w22mIRgrTcHX4ugJNlOY+FA0Q1T3snmiAIq38hIt7sA063+9l47exGjGZPsMN1OuAiJ1xTufxGP04H9i7LSfbgKXI521KZ0gPRO8SmFCLtDSNebAKPKabJgh4U5YwfEvTIWT3XKkqDPB6xO2iRqPl4J5BxD4VmOm2DL5ITPRmGSby3EQkZ5M9B6sJlxGZZXPZRTqsK6HsM+EWu9uKG2090nLBdEndOTk17VYaHsjAtQuFHEbKQaaDNEEu+RbZfZqfeRq+5jE5ToOXvD3Ew+mhjhPHyy7N/IslyKrzsDNu0TWHq/oj9fBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdmynzB2IGfZQAqV/K1Rp9znlOzuZwNF5ispSfwAeWw=;
 b=g2qJGF59R9fjdYpU4cEuGNR1XsJRuQXL2CrTZ0XR+ZzzZvHd9rxkR8F+JYlJCTI0p3zF/SEL2yu2N5ASRlb4zkiGCXidJSHSHJIUNWV+0wKCeNfr6uL+pDc4iEmptIogc4wC/Is4uafk5FSPc/OY3dgmvyz7bQiG8IaoTZPFuSqxhLFAA7RyaepyOKFWNX8aZtdNeCMNf1HeRbWzQBdj/RfQ6E3iL118AN3Le+nAx9G7Lxtclrv4k4Pz0+TqrjJ4c/BLBrNjLV0OwFenq7nvWXfXtJyPnWYlQvm2aY26epeJrJwp+7yEbZ2UDxH2/s/08nIIehMHTxu0L7U8qsxI2g==
Received: from DM5PR16CA0025.namprd16.prod.outlook.com (2603:10b6:4:15::11) by
 DM6PR12MB2651.namprd12.prod.outlook.com (2603:10b6:5:42::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Fri, 27 Aug 2021 09:38:45 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::5d) by DM5PR16CA0025.outlook.office365.com
 (2603:10b6:4:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:43 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:43 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:39 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/13] ASoC: tegra: Add Tegra210 based ADX driver
Date: Fri, 27 Aug 2021 15:03:55 +0530
Message-ID: <1630056839-6562-10-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67eec3c4-2d2d-4f70-29d0-08d9693e7623
X-MS-TrafficTypeDiagnostic: DM6PR12MB2651:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26512EE1900DCD908751A7A5A7C89@DM6PR12MB2651.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7RPIA9v7HsvnTJVLKvX4W4+/Y+JqdqVsIAyJ1v60UXvjqadu7tfceFWDuMrTm+twYvxJFOjg5aCcC18YSMNzuw7RUr6Sbmf6kQ9qlUogrIsajiawXT/ht6/CiQchQS7qgWtn3XKzFDITJawEFAV8BtOwWIJh25DHU+muXhdPJ2gwmC8z9HTgn16hbiA3uwUrMIDyK5Y0vfUK5H+SSE+9GkU5LyUYs8fSbVx2p+xT97AfadqL0jCAeJaB2fofn/BBxTAY7kz2DJidga5tJp/cIZpl3XWPRDjNcn/beHowbnfrVaLaKE+unygmyNsQVZUjGtp18zWwRAqrFAk9AYLMk2ZI8HH8c16w4JzzoDrb25vlXzQxirdOD7ynXZ1ie14ThK5pJmLg+ZNj8vGTcR7RZQ9c4wPWe+FYX6JvCxpOdspTPAbcuowEOxSdXG87jxVzaK9ZAZA+TTFBnQDzs3dY68LEhMEMRQUWo30tBtqhAxMvJCsKAZZV2xidq/CbQG6AHAO20mo03oXmyseQ5Q0dpfEC7P+lucEJGtk8Pr61EWch+QCBZ98WbcoEQrU1v2kUcRDybl8D4x1qysrUEKMdokdt7zSFew+kQU5DmTxNFrGq/Xve8qbfnzuxeX6+oaJ/BEEfLO/BWzSVBC3UjAil9fHgIKjB1MyRS6U5otqp24GEs1Btc88LvOar+0LPWp2c56DDOsn9tWKeklElIAKvSw0RkyKHAbRSwjNWWiXgc0=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(46966006)(30864003)(7416002)(5660300002)(336012)(921005)(4326008)(36860700001)(110136005)(186003)(47076005)(2616005)(356005)(36756003)(107886003)(8936002)(478600001)(426003)(6666004)(54906003)(7636003)(82740400003)(70206006)(36906005)(8676002)(86362001)(316002)(82310400003)(26005)(2906002)(83380400001)(7696005)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:43.9441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67eec3c4-2d2d-4f70-29d0-08d9693e7623
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2651
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

The Audio Demultiplexer (ADX) block takes an input stream with up to
16 channels and demultiplexes it into four output streams of up to 16
channels each. A byte RAM helps to form output frames by any combination
of bytes from the input frame. Its design is identical to that of byte
RAM in the AMX except that the data flow direction is reversed.

This patch registers ADX driver with ASoC framework. The component driver
exposes DAPM widgets, routes and kcontrols for the device. The DAI driver
exposes ADX interfaces, which can be used to connect different components
in the ASoC layer. Makefile and Kconfig support is added to allow build
the driver. It can be enabled in the DT via "nvidia,tegra210-adx"
compatible binding.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig        |  11 +
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra210_adx.c | 527 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_adx.h |  72 ++++++
 4 files changed, 612 insertions(+)
 create mode 100644 sound/soc/tegra/tegra210_adx.c
 create mode 100644 sound/soc/tegra/tegra210_adx.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 54d8342..fd4a8d6 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -135,6 +135,17 @@ config SND_SOC_TEGRA210_AMX
 	  output frame by any combination of bytes from the input frames.
 	  Say Y or M if you want to add support for Tegra210 AMX module.
 
+config SND_SOC_TEGRA210_ADX
+	tristate "Tegra210 ADX module"
+	help
+	  Config to enable the Audio Demultiplexer (ADX) which takes an
+	  input stream (up to 16 channels) and demultiplexes it into four
+	  output streams (each of up to 16 channels). A byte RAM helps to
+	  form output frames by any combination of bytes from the input
+	  frame. Its design is identical to that of byte RAM in the AMX
+	  except that the data flow direction is reversed.
+	  Say Y or M if you want to add support for Tegra210 ADX module.
+
 config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 	tristate "Audio Graph Card based Tegra driver"
 	depends on SND_AUDIO_GRAPH_CARD
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 549162b..8eb17ad 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -16,6 +16,7 @@ snd-soc-tegra210-admaif-objs := tegra210_admaif.o
 snd-soc-tegra210-mvc-objs := tegra210_mvc.o
 snd-soc-tegra210-sfc-objs := tegra210_sfc.o
 snd-soc-tegra210-amx-objs := tegra210_amx.o
+snd-soc-tegra210-adx-objs := tegra210_adx.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
@@ -32,6 +33,7 @@ obj-$(CONFIG_SND_SOC_TEGRA210_ADMAIF) += snd-soc-tegra210-admaif.o
 obj-$(CONFIG_SND_SOC_TEGRA210_MVC) += snd-soc-tegra210-mvc.o
 obj-$(CONFIG_SND_SOC_TEGRA210_SFC) += snd-soc-tegra210-sfc.o
 obj-$(CONFIG_SND_SOC_TEGRA210_AMX) += snd-soc-tegra210-amx.o
+obj-$(CONFIG_SND_SOC_TEGRA210_ADX) += snd-soc-tegra210-adx.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
new file mode 100644
index 0000000..5effafc
--- /dev/null
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -0,0 +1,527 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra210_adx.c - Tegra210 ADX driver
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
+#include "tegra210_adx.h"
+#include "tegra_cif.h"
+
+static const struct reg_default tegra210_adx_reg_defaults[] = {
+	{ TEGRA210_ADX_RX_INT_MASK, 0x00000001},
+	{ TEGRA210_ADX_RX_CIF_CTRL, 0x00007000},
+	{ TEGRA210_ADX_TX_INT_MASK, 0x0000000f },
+	{ TEGRA210_ADX_TX1_CIF_CTRL, 0x00007000},
+	{ TEGRA210_ADX_TX2_CIF_CTRL, 0x00007000},
+	{ TEGRA210_ADX_TX3_CIF_CTRL, 0x00007000},
+	{ TEGRA210_ADX_TX4_CIF_CTRL, 0x00007000},
+	{ TEGRA210_ADX_CG, 0x1},
+	{ TEGRA210_ADX_CFG_RAM_CTRL, 0x00004000},
+};
+
+static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
+{
+	int i;
+
+	regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_CTRL,
+		     TEGRA210_ADX_CFG_RAM_CTRL_SEQ_ACCESS_EN |
+		     TEGRA210_ADX_CFG_RAM_CTRL_ADDR_INIT_EN |
+		     TEGRA210_ADX_CFG_RAM_CTRL_RW_WRITE);
+
+	for (i = 0; i < TEGRA210_ADX_RAM_DEPTH; i++)
+		regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_DATA,
+			     adx->map[i]);
+
+	regmap_write(adx->regmap, TEGRA210_ADX_IN_BYTE_EN0, adx->byte_mask[0]);
+	regmap_write(adx->regmap, TEGRA210_ADX_IN_BYTE_EN1, adx->byte_mask[1]);
+}
+
+static int tegra210_adx_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct tegra210_adx *adx = snd_soc_dai_get_drvdata(dai);
+	unsigned int val;
+	int err;
+
+	/* Ensure if ADX status is disabled */
+	err = regmap_read_poll_timeout_atomic(adx->regmap, TEGRA210_ADX_STATUS,
+					      val, !(val & 0x1), 10, 10000);
+	if (err < 0) {
+		dev_err(dai->dev, "failed to stop ADX, err = %d\n", err);
+		return err;
+	}
+
+	/* SW reset */
+	regmap_update_bits(adx->regmap, TEGRA210_ADX_SOFT_RESET,
+			   TEGRA210_ADX_SOFT_RESET_SOFT_RESET_MASK,
+			   TEGRA210_ADX_SOFT_RESET_SOFT_EN);
+
+	err = regmap_read_poll_timeout(adx->regmap, TEGRA210_ADX_SOFT_RESET,
+				       val, !(val & 0x1), 10, 10000);
+	if (err < 0) {
+		dev_err(dai->dev, "failed to reset ADX, err = %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra210_adx_runtime_suspend(struct device *dev)
+{
+	struct tegra210_adx *adx = dev_get_drvdata(dev);
+
+	regcache_cache_only(adx->regmap, true);
+	regcache_mark_dirty(adx->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused tegra210_adx_runtime_resume(struct device *dev)
+{
+	struct tegra210_adx *adx = dev_get_drvdata(dev);
+
+	regcache_cache_only(adx->regmap, false);
+	regcache_sync(adx->regmap);
+
+	tegra210_adx_write_map_ram(adx);
+
+	return 0;
+}
+
+static int tegra210_adx_set_audio_cif(struct snd_soc_dai *dai,
+				      unsigned int channels,
+				      unsigned int format,
+				      unsigned int reg)
+{
+	struct tegra210_adx *adx = snd_soc_dai_get_drvdata(dai);
+	struct tegra_cif_conf cif_conf;
+	int audio_bits;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	if (channels < 1 || channels > 16)
+		return -EINVAL;
+
+	switch (format) {
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
+	tegra_set_cif(adx->regmap, reg, &cif_conf);
+
+	return 0;
+}
+
+static int tegra210_adx_out_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	return tegra210_adx_set_audio_cif(dai, params_channels(params),
+			params_format(params),
+			TEGRA210_ADX_TX1_CIF_CTRL + ((dai->id - 1) * TEGRA210_ADX_AUDIOCIF_CH_STRIDE));
+}
+
+static int tegra210_adx_in_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai)
+{
+	return tegra210_adx_set_audio_cif(dai, params_channels(params),
+					  params_format(params),
+					  TEGRA210_ADX_RX_CIF_CTRL);
+}
+
+static int tegra210_adx_get_byte_map(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_mixer_control *mc;
+	unsigned char *bytes_map = (unsigned char *)&adx->map;
+	int enabled;
+
+	mc = (struct soc_mixer_control *)kcontrol->private_value;
+	enabled = adx->byte_mask[mc->reg / 32] & (1 << (mc->reg % 32));
+
+	if (enabled)
+		ucontrol->value.integer.value[0] = bytes_map[mc->reg];
+	else
+		ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_mixer_control *mc;
+	unsigned char *bytes_map = (unsigned char *)&adx->map;
+	int value = ucontrol->value.integer.value[0];
+
+	mc = (struct soc_mixer_control *)kcontrol->private_value;
+
+	if (value >= 0 && value <= 255) {
+		/* update byte map and enable slot */
+		bytes_map[mc->reg] = value;
+		adx->byte_mask[mc->reg / 32] |= (1 << (mc->reg % 32));
+	} else {
+		/* reset byte map and disable slot */
+		bytes_map[mc->reg] = 0;
+		adx->byte_mask[mc->reg / 32] &= ~(1 << (mc->reg % 32));
+	}
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops tegra210_adx_in_dai_ops = {
+	.hw_params	= tegra210_adx_in_hw_params,
+	.startup	= tegra210_adx_startup,
+};
+
+static struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
+	.hw_params	= tegra210_adx_out_hw_params,
+};
+
+#define IN_DAI							\
+	{							\
+		.name = "ADX-RX-CIF",				\
+		.playback = {					\
+			.stream_name = "RX-CIF-Playback",	\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.capture = {					\
+			.stream_name = "RX-CIF-Capture",	\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.ops = &tegra210_adx_in_dai_ops,		\
+	}
+
+#define OUT_DAI(id)						\
+	{							\
+		.name = "ADX-TX" #id "-CIF",			\
+		.playback = {					\
+			.stream_name = "TX" #id "-CIF-Playback",\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.capture = {					\
+			.stream_name = "TX" #id "-CIF-Capture",	\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.ops = &tegra210_adx_out_dai_ops,		\
+	}
+
+static struct snd_soc_dai_driver tegra210_adx_dais[] = {
+	IN_DAI,
+	OUT_DAI(1),
+	OUT_DAI(2),
+	OUT_DAI(3),
+	OUT_DAI(4),
+};
+
+static const struct snd_soc_dapm_widget tegra210_adx_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX", NULL, 0, TEGRA210_ADX_ENABLE,
+			    TEGRA210_ADX_ENABLE_SHIFT, 0),
+	SND_SOC_DAPM_AIF_OUT("TX1", NULL, 0, TEGRA210_ADX_CTRL, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX2", NULL, 0, TEGRA210_ADX_CTRL, 1, 0),
+	SND_SOC_DAPM_AIF_OUT("TX3", NULL, 0, TEGRA210_ADX_CTRL, 2, 0),
+	SND_SOC_DAPM_AIF_OUT("TX4", NULL, 0, TEGRA210_ADX_CTRL, 3, 0),
+};
+
+#define STREAM_ROUTES(id, sname)					  \
+	{ "XBAR-" sname,		NULL,	"XBAR-TX" },		  \
+	{ "RX-CIF-" sname,		NULL,	"XBAR-" sname },	  \
+	{ "RX",				NULL,	"RX-CIF-" sname },	  \
+	{ "TX" #id,			NULL,	"RX" },			  \
+	{ "TX" #id "-CIF-" sname,	NULL,	"TX" #id },		  \
+	{ "TX" #id " XBAR-" sname,	NULL,	"TX" #id "-CIF-" sname }, \
+	{ "TX" #id " XBAR-RX",		NULL,	"TX" #id " XBAR-" sname }
+
+#define ADX_ROUTES(id)			\
+	STREAM_ROUTES(id, "Playback"),	\
+	STREAM_ROUTES(id, "Capture")
+
+#define STREAM_ROUTES(id, sname)					  \
+	{ "XBAR-" sname,		NULL,	"XBAR-TX" },		  \
+	{ "RX-CIF-" sname,		NULL,	"XBAR-" sname },	  \
+	{ "RX",				NULL,	"RX-CIF-" sname },	  \
+	{ "TX" #id,			NULL,	"RX" },			  \
+	{ "TX" #id "-CIF-" sname,	NULL,	"TX" #id },		  \
+	{ "TX" #id " XBAR-" sname,	NULL,	"TX" #id "-CIF-" sname }, \
+	{ "TX" #id " XBAR-RX",		NULL,	"TX" #id " XBAR-" sname }
+
+#define ADX_ROUTES(id)			\
+	STREAM_ROUTES(id, "Playback"),	\
+	STREAM_ROUTES(id, "Capture")
+
+static const struct snd_soc_dapm_route tegra210_adx_routes[] = {
+	ADX_ROUTES(1),
+	ADX_ROUTES(2),
+	ADX_ROUTES(3),
+	ADX_ROUTES(4),
+};
+
+#define TEGRA210_ADX_BYTE_MAP_CTRL(reg)			 \
+	SOC_SINGLE_EXT("Byte Map " #reg, reg, 0, 256, 0, \
+		       tegra210_adx_get_byte_map,	 \
+		       tegra210_adx_put_byte_map)
+
+static struct snd_kcontrol_new tegra210_adx_controls[] = {
+	TEGRA210_ADX_BYTE_MAP_CTRL(0),
+	TEGRA210_ADX_BYTE_MAP_CTRL(1),
+	TEGRA210_ADX_BYTE_MAP_CTRL(2),
+	TEGRA210_ADX_BYTE_MAP_CTRL(3),
+	TEGRA210_ADX_BYTE_MAP_CTRL(4),
+	TEGRA210_ADX_BYTE_MAP_CTRL(5),
+	TEGRA210_ADX_BYTE_MAP_CTRL(6),
+	TEGRA210_ADX_BYTE_MAP_CTRL(7),
+	TEGRA210_ADX_BYTE_MAP_CTRL(8),
+	TEGRA210_ADX_BYTE_MAP_CTRL(9),
+	TEGRA210_ADX_BYTE_MAP_CTRL(10),
+	TEGRA210_ADX_BYTE_MAP_CTRL(11),
+	TEGRA210_ADX_BYTE_MAP_CTRL(12),
+	TEGRA210_ADX_BYTE_MAP_CTRL(13),
+	TEGRA210_ADX_BYTE_MAP_CTRL(14),
+	TEGRA210_ADX_BYTE_MAP_CTRL(15),
+	TEGRA210_ADX_BYTE_MAP_CTRL(16),
+	TEGRA210_ADX_BYTE_MAP_CTRL(17),
+	TEGRA210_ADX_BYTE_MAP_CTRL(18),
+	TEGRA210_ADX_BYTE_MAP_CTRL(19),
+	TEGRA210_ADX_BYTE_MAP_CTRL(20),
+	TEGRA210_ADX_BYTE_MAP_CTRL(21),
+	TEGRA210_ADX_BYTE_MAP_CTRL(22),
+	TEGRA210_ADX_BYTE_MAP_CTRL(23),
+	TEGRA210_ADX_BYTE_MAP_CTRL(24),
+	TEGRA210_ADX_BYTE_MAP_CTRL(25),
+	TEGRA210_ADX_BYTE_MAP_CTRL(26),
+	TEGRA210_ADX_BYTE_MAP_CTRL(27),
+	TEGRA210_ADX_BYTE_MAP_CTRL(28),
+	TEGRA210_ADX_BYTE_MAP_CTRL(29),
+	TEGRA210_ADX_BYTE_MAP_CTRL(30),
+	TEGRA210_ADX_BYTE_MAP_CTRL(31),
+	TEGRA210_ADX_BYTE_MAP_CTRL(32),
+	TEGRA210_ADX_BYTE_MAP_CTRL(33),
+	TEGRA210_ADX_BYTE_MAP_CTRL(34),
+	TEGRA210_ADX_BYTE_MAP_CTRL(35),
+	TEGRA210_ADX_BYTE_MAP_CTRL(36),
+	TEGRA210_ADX_BYTE_MAP_CTRL(37),
+	TEGRA210_ADX_BYTE_MAP_CTRL(38),
+	TEGRA210_ADX_BYTE_MAP_CTRL(39),
+	TEGRA210_ADX_BYTE_MAP_CTRL(40),
+	TEGRA210_ADX_BYTE_MAP_CTRL(41),
+	TEGRA210_ADX_BYTE_MAP_CTRL(42),
+	TEGRA210_ADX_BYTE_MAP_CTRL(43),
+	TEGRA210_ADX_BYTE_MAP_CTRL(44),
+	TEGRA210_ADX_BYTE_MAP_CTRL(45),
+	TEGRA210_ADX_BYTE_MAP_CTRL(46),
+	TEGRA210_ADX_BYTE_MAP_CTRL(47),
+	TEGRA210_ADX_BYTE_MAP_CTRL(48),
+	TEGRA210_ADX_BYTE_MAP_CTRL(49),
+	TEGRA210_ADX_BYTE_MAP_CTRL(50),
+	TEGRA210_ADX_BYTE_MAP_CTRL(51),
+	TEGRA210_ADX_BYTE_MAP_CTRL(52),
+	TEGRA210_ADX_BYTE_MAP_CTRL(53),
+	TEGRA210_ADX_BYTE_MAP_CTRL(54),
+	TEGRA210_ADX_BYTE_MAP_CTRL(55),
+	TEGRA210_ADX_BYTE_MAP_CTRL(56),
+	TEGRA210_ADX_BYTE_MAP_CTRL(57),
+	TEGRA210_ADX_BYTE_MAP_CTRL(58),
+	TEGRA210_ADX_BYTE_MAP_CTRL(59),
+	TEGRA210_ADX_BYTE_MAP_CTRL(60),
+	TEGRA210_ADX_BYTE_MAP_CTRL(61),
+	TEGRA210_ADX_BYTE_MAP_CTRL(62),
+	TEGRA210_ADX_BYTE_MAP_CTRL(63),
+};
+
+static const struct snd_soc_component_driver tegra210_adx_cmpnt = {
+	.dapm_widgets		= tegra210_adx_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra210_adx_widgets),
+	.dapm_routes		= tegra210_adx_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra210_adx_routes),
+	.controls		= tegra210_adx_controls,
+	.num_controls		= ARRAY_SIZE(tegra210_adx_controls),
+};
+
+static bool tegra210_adx_wr_reg(struct device *dev,
+				unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_ADX_TX_INT_MASK ... TEGRA210_ADX_TX4_CIF_CTRL:
+	case TEGRA210_ADX_RX_INT_MASK ... TEGRA210_ADX_RX_CIF_CTRL:
+	case TEGRA210_ADX_ENABLE ... TEGRA210_ADX_CG:
+	case TEGRA210_ADX_CTRL ... TEGRA210_ADX_IN_BYTE_EN1:
+	case TEGRA210_ADX_CFG_RAM_CTRL ... TEGRA210_ADX_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_adx_rd_reg(struct device *dev,
+				unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_ADX_RX_STATUS ... TEGRA210_ADX_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_adx_volatile_reg(struct device *dev,
+				unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_ADX_RX_STATUS:
+	case TEGRA210_ADX_RX_INT_STATUS:
+	case TEGRA210_ADX_RX_INT_SET:
+	case TEGRA210_ADX_TX_STATUS:
+	case TEGRA210_ADX_TX_INT_STATUS:
+	case TEGRA210_ADX_TX_INT_SET:
+	case TEGRA210_ADX_SOFT_RESET:
+	case TEGRA210_ADX_STATUS:
+	case TEGRA210_ADX_INT_STATUS:
+	case TEGRA210_ADX_CFG_RAM_CTRL:
+	case TEGRA210_ADX_CFG_RAM_DATA:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+static const struct regmap_config tegra210_adx_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_ADX_CFG_RAM_DATA,
+	.writeable_reg		= tegra210_adx_wr_reg,
+	.readable_reg		= tegra210_adx_rd_reg,
+	.volatile_reg		= tegra210_adx_volatile_reg,
+	.reg_defaults		= tegra210_adx_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_adx_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct of_device_id tegra210_adx_of_match[] = {
+	{ .compatible = "nvidia,tegra210-adx" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra210_adx_of_match);
+
+static int tegra210_adx_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_adx *adx;
+	void __iomem *regs;
+	int err;
+
+	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
+	if (!adx)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, adx);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	adx->regmap = devm_regmap_init_mmio(dev, regs,
+					    &tegra210_adx_regmap_config);
+	if (IS_ERR(adx->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(adx->regmap);
+	}
+
+	regcache_cache_only(adx->regmap, true);
+
+	err = devm_snd_soc_register_component(dev, &tegra210_adx_cmpnt,
+					      tegra210_adx_dais,
+					      ARRAY_SIZE(tegra210_adx_dais));
+	if (err) {
+		dev_err(dev, "can't register ADX component, err: %d\n", err);
+		return err;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int tegra210_adx_platform_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra210_adx_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra210_adx_runtime_suspend,
+			   tegra210_adx_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra210_adx_driver = {
+	.driver = {
+		.name = "tegra210-adx",
+		.of_match_table = tegra210_adx_of_match,
+		.pm = &tegra210_adx_pm_ops,
+	},
+	.probe = tegra210_adx_platform_probe,
+	.remove = tegra210_adx_platform_remove,
+};
+module_platform_driver(tegra210_adx_driver);
+
+MODULE_AUTHOR("Arun Shamanna Lakshmi <aruns@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 ADX ASoC driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra210_adx.h b/sound/soc/tegra/tegra210_adx.h
new file mode 100644
index 0000000..d7dcb64
--- /dev/null
+++ b/sound/soc/tegra/tegra210_adx.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_adx.h - Definitions for Tegra210 ADX driver
+ *
+ * Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_ADX_H__
+#define __TEGRA210_ADX_H__
+
+/* Register offsets from TEGRA210_ADX*_BASE */
+#define TEGRA210_ADX_RX_STATUS		0x0c
+#define TEGRA210_ADX_RX_INT_STATUS	0x10
+#define TEGRA210_ADX_RX_INT_MASK	0x14
+#define TEGRA210_ADX_RX_INT_SET		0x18
+#define TEGRA210_ADX_RX_INT_CLEAR	0x1c
+#define TEGRA210_ADX_RX_CIF_CTRL	0x20
+#define TEGRA210_ADX_TX_STATUS		0x4c
+#define TEGRA210_ADX_TX_INT_STATUS	0x50
+#define TEGRA210_ADX_TX_INT_MASK	0x54
+#define TEGRA210_ADX_TX_INT_SET		0x58
+#define TEGRA210_ADX_TX_INT_CLEAR	0x5c
+#define TEGRA210_ADX_TX1_CIF_CTRL	0x60
+#define TEGRA210_ADX_TX2_CIF_CTRL	0x64
+#define TEGRA210_ADX_TX3_CIF_CTRL	0x68
+#define TEGRA210_ADX_TX4_CIF_CTRL	0x6c
+#define TEGRA210_ADX_ENABLE		0x80
+#define TEGRA210_ADX_SOFT_RESET		0x84
+#define TEGRA210_ADX_CG			0x88
+#define TEGRA210_ADX_STATUS		0x8c
+#define TEGRA210_ADX_INT_STATUS		0x90
+#define TEGRA210_ADX_CTRL		0xa4
+#define TEGRA210_ADX_IN_BYTE_EN0	0xa8
+#define TEGRA210_ADX_IN_BYTE_EN1	0xac
+#define TEGRA210_ADX_CFG_RAM_CTRL	0xb8
+#define TEGRA210_ADX_CFG_RAM_DATA	0xbc
+
+/* Fields in TEGRA210_ADX_ENABLE */
+#define TEGRA210_ADX_ENABLE_SHIFT			0
+
+/* Fields in TEGRA210_ADX_CFG_RAM_CTRL */
+#define TEGRA210_ADX_CFG_RAM_CTRL_RAM_ADDR_SHIFT	0
+
+#define TEGRA210_ADX_CFG_RAM_CTRL_RW_SHIFT		14
+#define TEGRA210_ADX_CFG_RAM_CTRL_RW_WRITE		(1 << TEGRA210_ADX_CFG_RAM_CTRL_RW_SHIFT)
+
+#define TEGRA210_ADX_CFG_RAM_CTRL_ADDR_INIT_EN_SHIFT	13
+#define TEGRA210_ADX_CFG_RAM_CTRL_ADDR_INIT_EN		(1 << TEGRA210_ADX_CFG_RAM_CTRL_ADDR_INIT_EN_SHIFT)
+
+#define TEGRA210_ADX_CFG_RAM_CTRL_SEQ_ACCESS_EN_SHIFT	12
+#define TEGRA210_ADX_CFG_RAM_CTRL_SEQ_ACCESS_EN		(1 << TEGRA210_ADX_CFG_RAM_CTRL_SEQ_ACCESS_EN_SHIFT)
+
+/* Fields in TEGRA210_ADX_SOFT_RESET */
+#define TEGRA210_ADX_SOFT_RESET_SOFT_RESET_SHIFT	0
+#define TEGRA210_ADX_SOFT_RESET_SOFT_RESET_MASK		(1 << TEGRA210_ADX_SOFT_RESET_SOFT_RESET_SHIFT)
+#define TEGRA210_ADX_SOFT_RESET_SOFT_EN			(1 << TEGRA210_ADX_SOFT_RESET_SOFT_RESET_SHIFT)
+#define TEGRA210_ADX_SOFT_RESET_SOFT_DEFAULT		(0 << TEGRA210_ADX_SOFT_RESET_SOFT_RESET_SHIFT)
+
+#define TEGRA210_ADX_AUDIOCIF_CH_STRIDE		4
+#define TEGRA210_ADX_RAM_DEPTH			16
+#define TEGRA210_ADX_MAP_STREAM_NUMBER_SHIFT	6
+#define TEGRA210_ADX_MAP_WORD_NUMBER_SHIFT	2
+#define TEGRA210_ADX_MAP_BYTE_NUMBER_SHIFT	0
+
+struct tegra210_adx {
+	struct regmap *regmap;
+	unsigned int map[TEGRA210_ADX_RAM_DEPTH];
+	unsigned int byte_mask[2];
+};
+
+#endif
-- 
2.7.4


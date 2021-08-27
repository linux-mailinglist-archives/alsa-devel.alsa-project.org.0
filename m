Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C841B3F9759
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B59D16E7;
	Fri, 27 Aug 2021 11:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B59D16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057308;
	bh=vLUwUmpCB+tjWmW1oCrsoJLv5a5h7XQy2Sw1nGfJZtw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H9JmcUt9J14o9zXXSJ5s+zWFbaQiXDGpRYIiCljE5w7LCZm2GnIErXAE2rMHqhePS
	 4RNHffk1bCF/zPVSjXJg1YJLXoe3sgpe8qw4znWtvsgidKBr/VzXT6VwApO1XyppAt
	 AjR29gT1CDbUZfoi6/aykwDbHRbzWAGOrgCLn7Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A234EF80518;
	Fri, 27 Aug 2021 11:38:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3599AF80517; Fri, 27 Aug 2021 11:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2E44F80506
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E44F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="mGIdAPmV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fybm4HksOuI+JxGOB9AhJydTaPHk1lveibpacRgbhyLJntAQ+EC0PF4lfT6QHWPCZEJI7btshmH5MtDs+XoYJOy89Y+6dT5YIxJSVGxEg1mk19qnEtl9/YlBlheHP9qZofya8Aufr7VFv3auaOr/XoKmSO/iIosZAyN2xlu3qLdV1SVNcbk7kDu0orJUUKutCcVBKdOUS7olETDKDKI3PnKUZ9JUr/Ux1y3aVd5paTmd+o+JSQqhO7OS5bFTt7dvhm31gt6rPkFBvBEI8NOyy7k/fwYBrOUe58iWUwPQfgZGbXELdN5vWNMCwa+GgRHTPoiloaegHg/CKjrvdWHKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBe06DEfTYxQAEt6DA3mYjKX+TIsJ0Yw6gMrboPyWSo=;
 b=AmssmyF6/rhpgWaKz14ZdHBExcVZCOzKNk50S+pE8wAj4XYihL3F/3xnLNhm5Yngo0kfA+t1uETNl72rqtqcmtSUeTL5CILR4Ny5aTqMxS/Hp2fh3xeixc9sbzUKMiHdelE14XDjWuWjkVsg2TWdejyy7zgYeqJqIOh2hL7UQk/poFmZmNd2yXcuckaCZS5wskFtngtvaIJ1TZoVnAOki/d2X8GZEh8B41WMMOR5MD3ulNRd3pVUs01JBxHPD7HFXFlrW3U/1JrkZeEUHLxj0y+HfTwTTnl1D0u9UeUbOtflS9Er8vZ/OyCPrG0VGMmH6H4lT3IxNuh7yVKVnddIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBe06DEfTYxQAEt6DA3mYjKX+TIsJ0Yw6gMrboPyWSo=;
 b=mGIdAPmV0laqErfg2TgTiMs/qDMCNBFWq3oR4P5RpvoXkAwBC0hDeGFqTLu7sg6iVYJKGilAIY2ij5EuwZgzzjFjgrmxCU7S2o0YdqWwAdyhA+YfnmbTmeEWuY7yRHRwPxu/15Db2Lo84+5FWswXz9JBLsMVyCj1BBSLkeLB/P47dJ70XArGautUiHIVLSYD+90cQislyTQVvl0UjBJ+pv4hDoWsK5yWTh+prNG+dFVkotk82v0l2CaLwWXxzt1CwuiDMQ8DK6E6+wqlDbYRne5xGZM6gHiWdfKEuvbeKqjbQa4uaZ8cJ9NARnlUi3pWkA8lMsPxbGhQ5gJfHvyqSw==
Received: from DM5PR2001CA0011.namprd20.prod.outlook.com (2603:10b6:4:16::21)
 by SJ0PR12MB5440.namprd12.prod.outlook.com (2603:10b6:a03:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 09:38:31 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::78) by DM5PR2001CA0011.outlook.office365.com
 (2603:10b6:4:16::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:30 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 02:38:29 -0700
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:25 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/13] ASoC: tegra: Add Tegra210 based MVC driver
Date: Fri, 27 Aug 2021 15:03:52 +0530
Message-ID: <1630056839-6562-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b867ed91-f42e-420e-521f-08d9693e6e40
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5440:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5440244FFE57F77F0F7D4B7BA7C89@SJ0PR12MB5440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1IoIvMpq3rbdYwaZpVnbnYzyfpzKsDXEaNvLgVFc8eWbFqB8Gf02f1AUy/MVqMwWPgfXi6GMVcg4L/b082ftw+DjCG1FanPLwCvyX/rKBQYQ49Yjw8Bmvkojrvx0sdXO/A8THx20WSzJNRBEMRoddGmQr07k3h38Fh3Dmi8PFqkZGyTgB/TSbQ33+xLWRqTrvcyVbFjjB/dXvjAN3flbmFdAtRRFcCq0VpDXQyFpKt4YdbkL7R4wHFylk2DiOioJaiZVl8YZLBe7wn13jqG9653r7BVwJAfiDW6+Z1mNa2YAh7fkzaXEIdeZc0JWdqb1SQ843GiFu5TZqoWf2gcc4J6xRaREOzWggd1NQ7t3UrqbFjPCR1s8FZNqED+wuB7d4kHA0IgOl694vAY4cKEFlZD1/vktDOin7B3gxP4u99/toeVxQE99EnkKR4LTeyfaSuAGRrK0xx6Q/1zcdKFilEvazxdB0HvhZqJOhUAOzjK/AflDDpBjXheydtLXf1Zt2Rh8tZOgytfQRiyHMP42yYweIPPaHQzllP1in/qi6zYHTDONXxJyUTrD6uYPQSM55G4kgEDCjEcx5d14TnNoLJCG81JZaRnmRQykwN+9Om/yn9i7YwinhULmXEIo3tD1YUnLUjuV3r4W4xEmmhaRZkEFjhqGwyfz4WPNKeAMhq7PhevEvLfL+x5SMld4gNDenvI74L+JCpwc107Bdrk3kSFIla3X6cAgJgD/tj2+JOQ=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(6666004)(70586007)(186003)(356005)(26005)(8936002)(83380400001)(7636003)(336012)(70206006)(82310400003)(426003)(7696005)(36860700001)(921005)(8676002)(86362001)(107886003)(2906002)(110136005)(7416002)(4326008)(508600001)(2616005)(5660300002)(316002)(54906003)(36756003)(30864003)(47076005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:30.6744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b867ed91-f42e-420e-521f-08d9693e6e40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5440
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

The Master Volume Control (MVC) provides gain or attenuation to a digital
signal path. It can be used in input or output signal path for per-stream
volume control or it can be used as master volume control. The MVC block
has one input and one output. The input digital stream can be mono or
multi-channel (up to 7.1 channels) stream. An independent mute control is
also included in the MVC block.

This patch registers MVC driver with ASoC framework. The component driver
exposes DAPM widgets, routes and kcontrols for the device. The DAI driver
exposes MVC interfaces, which can be used to connect different components
in the ASoC layer. Makefile and Kconfig support is added to allow build
the driver. It can be enabled in the DT via "nvidia,tegra210-mvc"
compatible binding.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig        |   9 +
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra210_mvc.c | 629 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_mvc.h | 117 ++++++++
 4 files changed, 757 insertions(+)
 create mode 100644 sound/soc/tegra/tegra210_mvc.c
 create mode 100644 sound/soc/tegra/tegra210_mvc.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 83c87f3..b8825e9 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -108,6 +108,15 @@ config SND_SOC_TEGRA210_ADMAIF
 	  channel. Buffer size is configurable for each ADMAIIF channel.
 	  Say Y or M if you want to add support for Tegra210 ADMAIF module.
 
+config SND_SOC_TEGRA210_MVC
+	tristate "Tegra210 MVC module"
+	help
+	  Config to enable the digital Master Volume Controller (MVC) which
+	  provides gain or attenuation to a digital signal path. It can be
+	  used in input or output signal path. It can be used either for
+	  per-stream volume control or for master volume control.
+	  Say Y or M if you want to add support for Tegra210 MVC module.
+
 config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 	tristate "Audio Graph Card based Tegra driver"
 	depends on SND_AUDIO_GRAPH_CARD
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index e2cec9a..b58d041 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -13,6 +13,7 @@ snd-soc-tegra210-dmic-objs := tegra210_dmic.o
 snd-soc-tegra210-i2s-objs := tegra210_i2s.o
 snd-soc-tegra186-dspk-objs := tegra186_dspk.o
 snd-soc-tegra210-admaif-objs := tegra210_admaif.o
+snd-soc-tegra210-mvc-objs := tegra210_mvc.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
@@ -26,6 +27,7 @@ obj-$(CONFIG_SND_SOC_TEGRA210_AHUB) += snd-soc-tegra210-ahub.o
 obj-$(CONFIG_SND_SOC_TEGRA210_I2S) += snd-soc-tegra210-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA186_DSPK) += snd-soc-tegra186-dspk.o
 obj-$(CONFIG_SND_SOC_TEGRA210_ADMAIF) += snd-soc-tegra210-admaif.o
+obj-$(CONFIG_SND_SOC_TEGRA210_MVC) += snd-soc-tegra210-mvc.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
new file mode 100644
index 0000000..4942813
--- /dev/null
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -0,0 +1,629 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra210_mvc.c - Tegra210 MVC driver
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
+#include "tegra210_mvc.h"
+#include "tegra_cif.h"
+
+static const struct reg_default tegra210_mvc_reg_defaults[] = {
+	{ TEGRA210_MVC_RX_INT_MASK, 0x00000001},
+	{ TEGRA210_MVC_RX_CIF_CTRL, 0x00007700},
+	{ TEGRA210_MVC_TX_INT_MASK, 0x00000001},
+	{ TEGRA210_MVC_TX_CIF_CTRL, 0x00007700},
+	{ TEGRA210_MVC_CG, 0x1},
+	{ TEGRA210_MVC_CTRL, TEGRA210_MVC_CTRL_DEFAULT},
+	{ TEGRA210_MVC_INIT_VOL, 0x00800000},
+	{ TEGRA210_MVC_TARGET_VOL, 0x00800000},
+	{ TEGRA210_MVC_DURATION, 0x000012c0},
+	{ TEGRA210_MVC_DURATION_INV, 0x0006d3a0},
+	{ TEGRA210_MVC_POLY_N1, 0x0000007d},
+	{ TEGRA210_MVC_POLY_N2, 0x00000271},
+	{ TEGRA210_MVC_PEAK_CTRL, 0x000012c0},
+	{ TEGRA210_MVC_CFG_RAM_CTRL, 0x00004000},
+};
+
+static const struct tegra210_mvc_gain_params gain_params = {
+	.poly_coeff = { 23738319, 659403, -3680,
+			15546680, 2530732, -120985,
+			12048422, 5527252, -785042 },
+	.poly_n1 = 16,
+	.poly_n2 = 63,
+	.duration = 150,
+	.duration_inv = 14316558,
+};
+
+static int __maybe_unused tegra210_mvc_runtime_suspend(struct device *dev)
+{
+	struct tegra210_mvc *mvc = dev_get_drvdata(dev);
+
+	regmap_read(mvc->regmap, TEGRA210_MVC_CTRL, &(mvc->ctrl_value));
+
+	regcache_cache_only(mvc->regmap, true);
+	regcache_mark_dirty(mvc->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused tegra210_mvc_runtime_resume(struct device *dev)
+{
+	struct tegra210_mvc *mvc = dev_get_drvdata(dev);
+
+	regcache_cache_only(mvc->regmap, false);
+	regcache_sync(mvc->regmap);
+
+	regmap_write(mvc->regmap, TEGRA210_MVC_CTRL, mvc->ctrl_value);
+	regmap_update_bits(mvc->regmap,
+			   TEGRA210_MVC_SWITCH,
+			   TEGRA210_MVC_VOLUME_SWITCH_MASK,
+			   TEGRA210_MVC_VOLUME_SWITCH_TRIGGER);
+
+	return 0;
+}
+
+static int tegra210_mvc_write_ram(struct tegra210_mvc *mvc,
+				  unsigned int addr, unsigned int coef)
+{
+	unsigned int reg, val;
+	int err;
+
+	err = regmap_read_poll_timeout(mvc->regmap,
+				       TEGRA210_MVC_CFG_RAM_CTRL,
+				       val, !(val & 0x80000000), 10, 10000);
+	if (err < 0)
+		return err;
+
+	reg = (addr << TEGRA210_MVC_CFG_RAM_CTRL_ADDR_SHIFT) &
+	      TEGRA210_MVC_CFG_RAM_CTRL_ADDR_MASK;
+	reg |= TEGRA210_MVC_CFG_RAM_CTRL_ADDR_INIT_EN;
+	reg |= TEGRA210_MVC_CFG_RAM_CTRL_RW_WRITE;
+	reg |= TEGRA210_MVC_CFG_RAM_CTRL_SEQ_ACCESS_EN;
+
+	regmap_write(mvc->regmap, TEGRA210_MVC_CFG_RAM_CTRL, reg);
+	regmap_write(mvc->regmap, TEGRA210_MVC_CFG_RAM_DATA,
+		     coef);
+
+	return 0;
+}
+
+static int tegra210_mvc_get_vol(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int reg = mc->reg;
+
+	if (reg == TEGRA210_MVC_CTRL) {
+		u32 val;
+		u8 mute_mask;
+
+		pm_runtime_get_sync(cmpnt->dev);
+		regmap_read(mvc->regmap, TEGRA210_MVC_CTRL, &val);
+		pm_runtime_put(cmpnt->dev);
+
+		mute_mask = (val >>  TEGRA210_MVC_MUTE_SHIFT) &
+			TEGRA210_MUTE_MASK_EN;
+
+		ucontrol->value.integer.value[0] = mute_mask;
+	} else {
+		u8 chan = (reg - TEGRA210_MVC_TARGET_VOL) / REG_SIZE;
+		s32 val = mvc->volume[chan];
+
+		if (mvc->curve_type == CURVE_POLY)
+			val = ((val >> 16) * 100) >> 8;
+		else {
+			val = (val * 100) >> 8;
+			val += 12000;
+		}
+
+		ucontrol->value.integer.value[0] = val;
+	}
+
+	return 0;
+}
+
+static void tegra210_mvc_conv_vol(struct tegra210_mvc *mvc, u8 chan, s32 val)
+{
+	/*
+	 * Volume control read from mixer control is with
+	 * 100x scaling; for CURVE_POLY the reg range
+	 * is 0-100 (linear, Q24) and for CURVE_LINEAR
+	 * it is -120dB to +40dB (Q8)
+	 */
+	if (mvc->curve_type == CURVE_POLY) {
+		if (val > 10000)
+			val = 10000;
+		mvc->volume[chan] = ((val * (1<<8)) / 100) << 16;
+	} else {
+		val -= 12000;
+		mvc->volume[chan] = (val * (1<<8)) / 100;
+	}
+}
+
+static int tegra210_mvc_put_vol(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int reg = mc->reg;
+	unsigned int value;
+	int err;
+
+	pm_runtime_get_sync(cmpnt->dev);
+
+	/* Check if VOLUME_SWITCH is triggered */
+	err = regmap_read_poll_timeout(mvc->regmap, TEGRA210_MVC_SWITCH,
+			value, !(value & TEGRA210_MVC_VOLUME_SWITCH_MASK),
+			10, 10000);
+	if (err < 0)
+		goto end;
+
+	if (reg == TEGRA210_MVC_CTRL) {
+		u8 mute_mask;
+
+		mute_mask = ucontrol->value.integer.value[0];
+
+		err = regmap_update_bits(mvc->regmap, reg,
+					 TEGRA210_MVC_MUTE_MASK,
+					 mute_mask << TEGRA210_MVC_MUTE_SHIFT);
+	} else {
+		u8 chan;
+
+		chan = (reg - TEGRA210_MVC_TARGET_VOL) / REG_SIZE;
+
+		tegra210_mvc_conv_vol(mvc, chan,
+				      ucontrol->value.integer.value[0]);
+
+		/* Configure init volume same as target volume */
+		regmap_write(mvc->regmap,
+			TEGRA210_MVC_REG_OFFSET(TEGRA210_MVC_INIT_VOL, chan),
+			mvc->volume[chan]);
+
+		err = regmap_write(mvc->regmap, reg, mvc->volume[chan]);
+	}
+
+	err |= regmap_update_bits(mvc->regmap, TEGRA210_MVC_SWITCH,
+			TEGRA210_MVC_VOLUME_SWITCH_MASK,
+			TEGRA210_MVC_VOLUME_SWITCH_TRIGGER);
+
+end:
+	pm_runtime_put(cmpnt->dev);
+	return err;
+}
+
+static void tegra210_mvc_reset_vol_settings(struct tegra210_mvc *mvc,
+					    struct device *dev)
+{
+	int i;
+
+	/* Change volume to default init for new curve type */
+	if (mvc->curve_type == CURVE_POLY) {
+		for (i = 0; i < TEGRA210_MVC_MAX_CHAN_COUNT; i++)
+			mvc->volume[i] = TEGRA210_MVC_INIT_VOL_DEFAULT_POLY;
+	} else {
+		for (i = 0; i < TEGRA210_MVC_MAX_CHAN_COUNT; i++)
+			mvc->volume[i] = TEGRA210_MVC_INIT_VOL_DEFAULT_LINEAR;
+	}
+
+	pm_runtime_get_sync(dev);
+
+	/* Program curve type */
+	regmap_update_bits(mvc->regmap, TEGRA210_MVC_CTRL,
+			   TEGRA210_MVC_CURVE_TYPE_MASK,
+			   mvc->curve_type <<
+			   TEGRA210_MVC_CURVE_TYPE_SHIFT);
+
+	/* Init volume for all channels */
+	for (i = 0; i < TEGRA210_MVC_MAX_CHAN_COUNT; i++) {
+		regmap_write(mvc->regmap,
+			TEGRA210_MVC_REG_OFFSET(TEGRA210_MVC_INIT_VOL, i),
+			mvc->volume[i]);
+		regmap_write(mvc->regmap,
+			TEGRA210_MVC_REG_OFFSET(TEGRA210_MVC_TARGET_VOL, i),
+			mvc->volume[i]);
+	}
+
+	/* Trigger volume switch */
+	regmap_update_bits(mvc->regmap, TEGRA210_MVC_SWITCH,
+			   TEGRA210_MVC_VOLUME_SWITCH_MASK,
+			   TEGRA210_MVC_VOLUME_SWITCH_TRIGGER);
+
+	pm_runtime_put(dev);
+}
+
+static int tegra210_mvc_get_curve_type(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.integer.value[0] = mvc->curve_type;
+
+	return 0;
+}
+
+static int tegra210_mvc_put_curve_type(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
+	int value;
+
+	regmap_read(mvc->regmap, TEGRA210_MVC_ENABLE, &value);
+	if (value & TEGRA210_MVC_EN) {
+		dev_err(cmpnt->dev,
+			"Curve type can't be set when MVC is running\n");
+		return -EINVAL;
+	}
+
+	if (mvc->curve_type == ucontrol->value.integer.value[0])
+		return 0;
+
+	mvc->curve_type = ucontrol->value.integer.value[0];
+
+	tegra210_mvc_reset_vol_settings(mvc, cmpnt->dev);
+
+	return 0;
+}
+
+static int tegra210_mvc_set_audio_cif(struct tegra210_mvc *mvc,
+				      struct snd_pcm_hw_params *params,
+				      unsigned int reg)
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
+	tegra_set_cif(mvc->regmap, reg, &cif_conf);
+
+	return 0;
+}
+
+static int tegra210_mvc_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->dev;
+	struct tegra210_mvc *mvc = snd_soc_dai_get_drvdata(dai);
+	int i, err, val;
+
+	/* SW reset */
+	regmap_write(mvc->regmap, TEGRA210_MVC_SOFT_RESET, 1);
+
+	err = regmap_read_poll_timeout(mvc->regmap, TEGRA210_MVC_SOFT_RESET,
+				       val, !val, 10, 10000);
+	if (err < 0) {
+		dev_err(dev, "SW reset failed, err = %d\n", err);
+		return err;
+	}
+
+	/* Set RX CIF */
+	err = tegra210_mvc_set_audio_cif(mvc, params, TEGRA210_MVC_RX_CIF_CTRL);
+	if (err) {
+		dev_err(dev, "Can't set MVC RX CIF: %d\n", err);
+		return err;
+	}
+
+	/* Set TX CIF */
+	err = tegra210_mvc_set_audio_cif(mvc, params, TEGRA210_MVC_TX_CIF_CTRL);
+	if (err) {
+		dev_err(dev, "Can't set MVC TX CIF: %d\n", err);
+		return err;
+	}
+
+	/* Program the poly coefficients */
+	for (i = 0; i < NUM_GAIN_POLY_COEFFS; i++) {
+		err = tegra210_mvc_write_ram(mvc, i, gain_params.poly_coeff[i]);
+		if (err < 0) {
+			dev_err(dai->dev, "failed to write coefs, err = %d\n",
+				err);
+			return err;
+		}
+	}
+
+	/* Program poly_n1, poly_n2, duration */
+	regmap_write(mvc->regmap, TEGRA210_MVC_POLY_N1, gain_params.poly_n1);
+	regmap_write(mvc->regmap, TEGRA210_MVC_POLY_N2, gain_params.poly_n2);
+	regmap_write(mvc->regmap, TEGRA210_MVC_DURATION, gain_params.duration);
+
+	/* Program duration_inv */
+	regmap_write(mvc->regmap, TEGRA210_MVC_DURATION_INV,
+		     gain_params.duration_inv);
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops tegra210_mvc_dai_ops = {
+	.hw_params	= tegra210_mvc_hw_params,
+};
+
+static const char * const tegra210_mvc_curve_type_text[] = {
+	"Poly",
+	"Linear",
+};
+
+static const struct soc_enum tegra210_mvc_curve_type_ctrl =
+	SOC_ENUM_SINGLE_EXT(2, tegra210_mvc_curve_type_text);
+
+#define TEGRA210_MVC_VOL_CTRL(chan)					\
+	SOC_SINGLE_EXT("Channel" #chan " Volume",			\
+		       TEGRA210_MVC_REG_OFFSET(TEGRA210_MVC_TARGET_VOL, \
+					       (chan - 1)),		\
+		       0, 16000, 0, tegra210_mvc_get_vol,		\
+		       tegra210_mvc_put_vol)
+
+static const struct snd_kcontrol_new tegra210_mvc_vol_ctrl[] = {
+	/* Per channel volume control */
+	TEGRA210_MVC_VOL_CTRL(1),
+	TEGRA210_MVC_VOL_CTRL(2),
+	TEGRA210_MVC_VOL_CTRL(3),
+	TEGRA210_MVC_VOL_CTRL(4),
+	TEGRA210_MVC_VOL_CTRL(5),
+	TEGRA210_MVC_VOL_CTRL(6),
+	TEGRA210_MVC_VOL_CTRL(7),
+	TEGRA210_MVC_VOL_CTRL(8),
+
+	/* Per channel mute */
+	SOC_SINGLE_EXT("Per Chan Mute Mask",
+		       TEGRA210_MVC_CTRL, 0, TEGRA210_MUTE_MASK_EN, 0,
+		       tegra210_mvc_get_vol, tegra210_mvc_put_vol),
+
+	SOC_ENUM_EXT("Curve Type", tegra210_mvc_curve_type_ctrl,
+		     tegra210_mvc_get_curve_type, tegra210_mvc_put_curve_type),
+};
+
+static struct snd_soc_dai_driver tegra210_mvc_dais[] = {
+	/* Input */
+	{
+		.name = "MVC-RX-CIF",
+		.playback = {
+			.stream_name = "RX-CIF-Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "RX-CIF-Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+	},
+
+	/* Output */
+	{
+		.name = "MVC-TX-CIF",
+		.playback = {
+			.stream_name = "TX-CIF-Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "TX-CIF-Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &tegra210_mvc_dai_ops,
+	}
+};
+
+static const struct snd_soc_dapm_widget tegra210_mvc_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX", NULL, 0, TEGRA210_MVC_ENABLE,
+			     TEGRA210_MVC_EN_SHIFT, 0),
+};
+
+#define MVC_ROUTES(sname)					\
+	{ "RX XBAR-" sname,	NULL,	"XBAR-TX" },		\
+	{ "RX-CIF-" sname,	NULL,	"RX XBAR-" sname },	\
+	{ "RX",			NULL,	"RX-CIF-" sname },	\
+	{ "TX-CIF-" sname,	NULL,	"TX" },			\
+	{ "TX XBAR-" sname,	NULL,	"TX-CIF-" sname },	\
+	{ "XBAR-RX",            NULL,   "TX XBAR-" sname }
+
+static const struct snd_soc_dapm_route tegra210_mvc_routes[] = {
+	{ "TX", NULL, "RX" },
+	MVC_ROUTES("Playback"),
+	MVC_ROUTES("Capture"),
+};
+
+static const struct snd_soc_component_driver tegra210_mvc_cmpnt = {
+	.dapm_widgets		= tegra210_mvc_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra210_mvc_widgets),
+	.dapm_routes		= tegra210_mvc_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra210_mvc_routes),
+	.controls		= tegra210_mvc_vol_ctrl,
+	.num_controls		= ARRAY_SIZE(tegra210_mvc_vol_ctrl),
+};
+
+static bool tegra210_mvc_rd_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_MVC_RX_STATUS ... TEGRA210_MVC_CONFIG_ERR_TYPE:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra210_mvc_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_MVC_RX_INT_MASK ... TEGRA210_MVC_RX_CIF_CTRL:
+	case TEGRA210_MVC_TX_INT_MASK ... TEGRA210_MVC_TX_CIF_CTRL:
+	case TEGRA210_MVC_ENABLE ... TEGRA210_MVC_CG:
+	case TEGRA210_MVC_CTRL ... TEGRA210_MVC_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_mvc_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_MVC_RX_STATUS:
+	case TEGRA210_MVC_RX_INT_STATUS:
+	case TEGRA210_MVC_RX_INT_SET:
+
+	case TEGRA210_MVC_TX_STATUS:
+	case TEGRA210_MVC_TX_INT_STATUS:
+	case TEGRA210_MVC_TX_INT_SET:
+
+	case TEGRA210_MVC_SOFT_RESET:
+	case TEGRA210_MVC_STATUS:
+	case TEGRA210_MVC_INT_STATUS:
+	case TEGRA210_MVC_SWITCH:
+	case TEGRA210_MVC_CFG_RAM_CTRL:
+	case TEGRA210_MVC_CFG_RAM_DATA:
+	case TEGRA210_MVC_PEAK_VALUE:
+	case TEGRA210_MVC_CTRL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tegra210_mvc_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_MVC_CONFIG_ERR_TYPE,
+	.writeable_reg		= tegra210_mvc_wr_reg,
+	.readable_reg		= tegra210_mvc_rd_reg,
+	.volatile_reg		= tegra210_mvc_volatile_reg,
+	.reg_defaults		= tegra210_mvc_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_mvc_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct of_device_id tegra210_mvc_of_match[] = {
+	{ .compatible = "nvidia,tegra210-mvc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra210_mvc_of_match);
+
+static int tegra210_mvc_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_mvc *mvc;
+	void __iomem *regs;
+	int err;
+
+	mvc = devm_kzalloc(dev, sizeof(*mvc), GFP_KERNEL);
+	if (!mvc)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, mvc);
+
+	mvc->curve_type = CURVE_LINEAR;
+	mvc->ctrl_value = TEGRA210_MVC_CTRL_DEFAULT;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	mvc->regmap = devm_regmap_init_mmio(dev, regs,
+					    &tegra210_mvc_regmap_config);
+	if (IS_ERR(mvc->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(mvc->regmap);
+	}
+
+	regcache_cache_only(mvc->regmap, true);
+
+	err = devm_snd_soc_register_component(dev, &tegra210_mvc_cmpnt,
+					      tegra210_mvc_dais,
+					      ARRAY_SIZE(tegra210_mvc_dais));
+	if (err) {
+		dev_err(dev, "can't register MVC component, err: %d\n", err);
+		return err;
+	}
+
+	pm_runtime_enable(dev);
+
+	tegra210_mvc_reset_vol_settings(mvc, &pdev->dev);
+
+	return 0;
+}
+
+static int tegra210_mvc_platform_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra210_mvc_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra210_mvc_runtime_suspend,
+			   tegra210_mvc_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra210_mvc_driver = {
+	.driver = {
+		.name = "tegra210-mvc",
+		.of_match_table = tegra210_mvc_of_match,
+		.pm = &tegra210_mvc_pm_ops,
+	},
+	.probe = tegra210_mvc_platform_probe,
+	.remove = tegra210_mvc_platform_remove,
+};
+module_platform_driver(tegra210_mvc_driver)
+
+MODULE_AUTHOR("Arun Shamanna Lakshmi <aruns@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 MVC ASoC driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra210_mvc.h b/sound/soc/tegra/tegra210_mvc.h
new file mode 100644
index 0000000..def29c4
--- /dev/null
+++ b/sound/soc/tegra/tegra210_mvc.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_mvc.h - Definitions for Tegra210 MVC driver
+ *
+ * Copyright (c) 2021 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_MVC_H__
+#define __TEGRA210_MVC_H__
+
+/*
+ * MVC_RX registers are with respect to XBAR.
+ * The data comes from XBAR to MVC.
+ */
+#define TEGRA210_MVC_RX_STATUS			0x0c
+#define TEGRA210_MVC_RX_INT_STATUS		0x10
+#define TEGRA210_MVC_RX_INT_MASK		0x14
+#define TEGRA210_MVC_RX_INT_SET			0x18
+#define TEGRA210_MVC_RX_INT_CLEAR		0x1c
+#define TEGRA210_MVC_RX_CIF_CTRL		0x20
+
+/*
+ * MVC_TX registers are with respect to XBAR.
+ * The data goes out of MVC.
+ */
+#define TEGRA210_MVC_TX_STATUS			0x4c
+#define TEGRA210_MVC_TX_INT_STATUS		0x50
+#define TEGRA210_MVC_TX_INT_MASK		0x54
+#define TEGRA210_MVC_TX_INT_SET			0x58
+#define TEGRA210_MVC_TX_INT_CLEAR		0x5c
+#define TEGRA210_MVC_TX_CIF_CTRL		0x60
+
+/* Register offsets from TEGRA210_MVC*_BASE */
+#define TEGRA210_MVC_ENABLE			0x80
+#define TEGRA210_MVC_SOFT_RESET			0x84
+#define TEGRA210_MVC_CG				0x88
+#define TEGRA210_MVC_STATUS			0x90
+#define TEGRA210_MVC_INT_STATUS			0x94
+#define TEGRA210_MVC_CTRL			0xa8
+#define TEGRA210_MVC_SWITCH			0xac
+#define TEGRA210_MVC_INIT_VOL			0xb0
+#define TEGRA210_MVC_TARGET_VOL			0xd0
+#define TEGRA210_MVC_DURATION			0xf0
+#define TEGRA210_MVC_DURATION_INV		0xf4
+#define TEGRA210_MVC_POLY_N1			0xf8
+#define TEGRA210_MVC_POLY_N2			0xfc
+#define TEGRA210_MVC_PEAK_CTRL			0x100
+#define TEGRA210_MVC_CFG_RAM_CTRL		0x104
+#define TEGRA210_MVC_CFG_RAM_DATA		0x108
+#define TEGRA210_MVC_PEAK_VALUE			0x10c
+#define TEGRA210_MVC_CONFIG_ERR_TYPE		0x12c
+
+/* Fields in TEGRA210_MVC_ENABLE */
+#define TEGRA210_MVC_EN_SHIFT			0
+#define TEGRA210_MVC_EN				(1 << TEGRA210_MVC_EN_SHIFT)
+
+#define TEGRA210_MVC_MUTE_SHIFT			8
+#define TEGRA210_MUTE_MASK_EN			0xff
+#define TEGRA210_MVC_MUTE_MASK			(TEGRA210_MUTE_MASK_EN << TEGRA210_MVC_MUTE_SHIFT)
+#define TEGRA210_MVC_MUTE_EN			(TEGRA210_MUTE_MASK_EN << TEGRA210_MVC_MUTE_SHIFT)
+
+#define TEGRA210_MVC_PER_CHAN_CTRL_EN_SHIFT	30
+#define TEGRA210_MVC_PER_CHAN_CTRL_EN_MASK	(1 << TEGRA210_MVC_PER_CHAN_CTRL_EN_SHIFT)
+#define TEGRA210_MVC_PER_CHAN_CTRL_EN		(1 << TEGRA210_MVC_PER_CHAN_CTRL_EN_SHIFT)
+
+#define TEGRA210_MVC_CURVE_TYPE_SHIFT		1
+#define TEGRA210_MVC_CURVE_TYPE_MASK		(1 << TEGRA210_MVC_CURVE_TYPE_SHIFT)
+
+#define TEGRA210_MVC_VOLUME_SWITCH_SHIFT	2
+#define TEGRA210_MVC_VOLUME_SWITCH_MASK		(1 << TEGRA210_MVC_VOLUME_SWITCH_SHIFT)
+#define TEGRA210_MVC_VOLUME_SWITCH_TRIGGER	(1 << TEGRA210_MVC_VOLUME_SWITCH_SHIFT)
+#define TEGRA210_MVC_CTRL_DEFAULT	0x40000003
+
+#define TEGRA210_MVC_INIT_VOL_DEFAULT_POLY	0x01000000
+#define TEGRA210_MVC_INIT_VOL_DEFAULT_LINEAR	0x00000000
+
+/* Fields in TEGRA210_MVC ram ctrl */
+#define TEGRA210_MVC_CFG_RAM_CTRL_RW_SHIFT		14
+#define TEGRA210_MVC_CFG_RAM_CTRL_RW_WRITE		(1 << TEGRA210_MVC_CFG_RAM_CTRL_RW_SHIFT)
+
+#define TEGRA210_MVC_CFG_RAM_CTRL_ADDR_INIT_EN_SHIFT	13
+#define TEGRA210_MVC_CFG_RAM_CTRL_ADDR_INIT_EN		(1 << TEGRA210_MVC_CFG_RAM_CTRL_ADDR_INIT_EN_SHIFT)
+
+#define TEGRA210_MVC_CFG_RAM_CTRL_SEQ_ACCESS_EN_SHIFT	12
+#define TEGRA210_MVC_CFG_RAM_CTRL_SEQ_ACCESS_EN		(1 << TEGRA210_MVC_CFG_RAM_CTRL_SEQ_ACCESS_EN_SHIFT)
+
+#define TEGRA210_MVC_CFG_RAM_CTRL_ADDR_SHIFT		0
+#define TEGRA210_MVC_CFG_RAM_CTRL_ADDR_MASK		(0x1ff << TEGRA210_MVC_CFG_RAM_CTRL_ADDR_SHIFT)
+
+#define REG_SIZE 4
+#define TEGRA210_MVC_MAX_CHAN_COUNT 8
+#define TEGRA210_MVC_REG_OFFSET(reg, i) (reg + (REG_SIZE * i))
+
+#define NUM_GAIN_POLY_COEFFS 9
+
+enum {
+	CURVE_POLY,
+	CURVE_LINEAR,
+};
+
+struct tegra210_mvc_gain_params {
+	int poly_coeff[NUM_GAIN_POLY_COEFFS];
+	int poly_n1;
+	int poly_n2;
+	int duration;
+	int duration_inv;
+};
+
+struct tegra210_mvc {
+	int volume[TEGRA210_MVC_MAX_CHAN_COUNT];
+	unsigned int curve_type;
+	unsigned int ctrl_value;
+	struct regmap *regmap;
+};
+
+#endif
-- 
2.7.4


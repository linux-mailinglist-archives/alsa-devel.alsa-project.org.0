Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EAF429E83
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 09:22:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618F21692;
	Tue, 12 Oct 2021 09:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618F21692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634023379;
	bh=0Th6TUtB5xcG6ZbfuqSx7Kwzpbl/h67lQjYr/t6UZrI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHwtF+jwUD+pNdC5yRedZrcOo6T60KvBDKvXBDhx1rjt9PnHLak8PbbyxKyeVsEn2
	 /wFDbk9WPPedKcGwzeXV6VE3HtLLnItUS1Nap0corqFh2T1qY5lNHSn9NIpAgowxdq
	 GZ0r4ALRn35hrKFx2OQpI4b40zTXNTnLi/NKWEEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58445F80212;
	Tue, 12 Oct 2021 09:21:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D23A4F80245; Tue, 12 Oct 2021 09:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB853F804AD
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 09:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB853F804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="N9E1q0LG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7Rlfuasstm3I5vhdEsAozP6sxo00jSx0IZTAJxV+/TT31FIarAQUeWeDdTH3x0UTBza+uO670+6+7Kqo/lIn99zKkjPL9J9rJ2jGM/OSZIIEVjhgZ8ZN12nT1gOTzv2jPpcovdWI0a2LBD/DGntp4xStDwEVGnddK+IZ0nC2fy4QenkLpg76ZN0vtY+L0/dg43X1l+HcZYw0Gh9EFJOBzIgPaBo26rm/8+ebLYKakv4emGMdnWTu1pKC1YzKqrqKaPRW0V3bZvEtmyoocBPIxA5Pf2yG86ZYcqb+SZMhvQGp8oGUrjTXouP6MNIPPt5Xhl4ALIwRUTU+pJIR774uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFU8aavBakBUntI5YQMP6Lz8EwrSf7WqzwbPBpCDsw0=;
 b=MxwOoGccS07KQgqPYqeLAUGYdjhfpOt241cOVJzKMcY98p1zQD5QpSMgbx88JA77bUdCQNu7M5NQaDO9HFkH4k2ZZE+7qcpEV4a+SJQKXbI6ur7dPnHR9z64nKIX0HINzwTRL7CsuHjdwbd/dbwmkjSsRFSiHDqnBYBGnAEOmGSPIn7XCjFrms11Nv6Cqh6zuWYCP6L45qa30ENYQojZofi3xoIg+ElwEhdOpKs1DmBwksPjtvz6iyotPIp2GdiuY9fg9xA+lYdud/MqccHV4oSWIUdPi860ax2KSJvh7K6M1W4lb6iADGyEifrQI7a1FrTSRQQJhXzTG9oKt8TuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFU8aavBakBUntI5YQMP6Lz8EwrSf7WqzwbPBpCDsw0=;
 b=N9E1q0LGxkqvK6dYC4rXJa+jquzBBVxkichYKBH4SIru9Vl2Z6rIa2t+iMV70o+2x/VSw1pBF0VGyXg9QeuaQWPukTlwD4VR5IJQvLIAy8LkGYNemROpcIDoTMQmsZtK5Bv+Cz+0aAueaASa7FmZ5AX+HfjtLAFzXDPAYVNdp5M=
Received: from DM6PR05CA0059.namprd05.prod.outlook.com (2603:10b6:5:335::28)
 by MN2PR12MB3743.namprd12.prod.outlook.com (2603:10b6:208:168::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 07:21:26 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::2a) by DM6PR05CA0059.outlook.office365.com
 (2603:10b6:5:335::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Tue, 12 Oct 2021 07:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 07:21:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 02:21:24 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 12 Oct 2021 02:21:20 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 2/8] ASoC: amd: acp: Add I2S support on Renoir platform
Date: Tue, 12 Oct 2021 12:49:33 +0530
Message-ID: <20211012071939.97002-3-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
References: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4367e92-55cf-4a00-95af-08d98d50e6ba
X-MS-TrafficTypeDiagnostic: MN2PR12MB3743:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3743759CD9A6F216BBE0266B82B69@MN2PR12MB3743.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fvXf2E6sUgfo3Ta5af/Okv53j0SXMXvP5XGCTGbMMejkR2x5zjHFn+M/l9g/SmaY7lVsHvMbaAf2MgtbWZi/ZfI8z442LQ56O+7p8f0BwtLaOik1Nf8s6usnlf6QY4NBMrSCIehGJSlt3JxaM6YeQmLYaraQ4wErDrOazTaDw0FBx9NjbyB5mfiqR+oWZ63edxqWb4orQuOfX8KEUpCzh05GJ19Yr1YeNWzbXt2Kv9xDTsadUWGd4H5z1+IpW6kEGdEcWJUBEh+ILh4aL8bk7JRTICymN3OoZUQn1eW8UbhucNgsJUILOgZhIE/Lh8YF/ibyQBYmQIUKxxtbcS1r3uJUo2AYnS865QdRpe1QavXqTy4ohkEuipZe+F+4XmBh+SuRcCSaHy3l2qHsktSuhLZZ2+QvL9MZhBui94xbjPyj10lstQzWW8iK2qfWz+l9LMIRhvZHfZL4ohzdxE96Nmws7++1f9yzl2LVy145tqG4KtIKiSwlg27Sb4Huhzbedf4xSdnbTkp77M+09jY1lc/WcZg/EbUOuvwyy2tt294/Pwm+9dm6LqB88+MOp36FIqBeRRUyhMmK2KVnocFmEvL6fNvawVR2wGPTWW2HclHKOid2AKtqlGEqfx6T4yUdzxXocZbwHA752QOzt/UCkXJ7jEFL9ylhmLfciunFHjFiQ7k/PpvDSwI+UGoac+2ueG24vldaq4BhWx/0HuEnoX1vUyleeskLQ4Jir6OMyg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(81166007)(8676002)(36860700001)(26005)(2906002)(54906003)(36756003)(82310400003)(70586007)(70206006)(508600001)(356005)(110136005)(47076005)(4326008)(336012)(86362001)(8936002)(83380400001)(1076003)(5660300002)(316002)(6666004)(7696005)(426003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:21:25.6794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4367e92-55cf-4a00-95af-08d98d50e6ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3743
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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

Add I2S dai driver for Renoir platform and register with common
acp framework to support non dsp I2S use case on Renoir.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig      |   8 ++
 sound/soc/amd/acp/Makefile     |   5 ++
 sound/soc/amd/acp/acp-renoir.c | 141 +++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 sound/soc/amd/acp/acp-renoir.c

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 5d782d1fc654..e01822ff0694 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -17,3 +17,11 @@ config SND_SOC_AMD_ACP_I2S
 
 config SND_SOC_AMD_ACP_PCM
 	tristate
+
+config SND_AMD_ASOC_RENOIR
+	tristate "AMD ACP ASOC Renoir Support"
+	select SND_SOC_AMD_ACP_PCM
+	select SND_SOC_AMD_ACP_I2S
+	depends on X86 && PCI
+	help
+	  This option enables Renoir I2S support on AMD platform.
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index b2e12659d97b..42bff3515f24 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -8,5 +8,10 @@
 snd-acp-pcm-objs     := acp-platform.o
 snd-acp-i2s-objs     := acp-i2s.o
 
+#platform specific driver
+snd-acp-renoir-objs     := acp-renoir.o
+
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
+
+obj-$(CONFIG_SND_AMD_ASOC_RENOIR) += snd-acp-renoir.o
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
new file mode 100644
index 000000000000..c7fbf71e4669
--- /dev/null
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+//
+
+/*
+ * Hardware interface for Renoir ACP block
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <linux/dma-mapping.h>
+
+#include "amd.h"
+
+#define DRV_NAME "acp_asoc_renoir"
+
+static struct snd_soc_dai_driver acp_renoir_dai[] = {
+{
+	.name = "acp-i2s-sp",
+	.id = I2S_SP_INSTANCE,
+	.playback = {
+		.stream_name = "I2S SP Playback",
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 8,
+		.rate_min = 8000,
+		.rate_max = 96000,
+	},
+	.capture = {
+		.stream_name = "I2S SP Capture",
+		.rates = SNDRV_PCM_RATE_8000_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 8000,
+		.rate_max = 48000,
+	},
+	.ops = &asoc_acp_cpu_dai_ops,
+	.probe = &asoc_acp_i2s_probe,
+},
+{
+	.name = "acp-i2s-bt",
+	.id = I2S_BT_INSTANCE,
+	.playback = {
+		.stream_name = "I2S BT Playback",
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 8,
+		.rate_min = 8000,
+		.rate_max = 96000,
+	},
+	.capture = {
+		.stream_name = "I2S BT Capture",
+		.rates = SNDRV_PCM_RATE_8000_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 8000,
+		.rate_max = 48000,
+	},
+	.ops = &asoc_acp_cpu_dai_ops,
+	.probe = &asoc_acp_i2s_probe,
+},
+};
+
+static int renoir_audio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct acp_dev_data *adata;
+	struct resource *res;
+
+	adata = devm_kzalloc(dev, sizeof(struct acp_dev_data), GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "acp_mem");
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENODEV;
+	}
+
+	adata->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!adata->acp_base)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "acp_dai_irq");
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+		return -ENODEV;
+	}
+
+	adata->i2s_irq = res->start;
+	adata->dev = dev;
+	adata->dai_driver = acp_renoir_dai;
+	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
+
+	dev_set_drvdata(dev, adata);
+	acp_platform_register(dev);
+
+	return 0;
+}
+
+static int renoir_audio_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	acp_platform_unregister(dev);
+	return 0;
+}
+
+static struct platform_driver renoir_driver = {
+	.probe = renoir_audio_probe,
+	.remove = renoir_audio_remove,
+	.driver = {
+		.name = "acp_asoc_renoir",
+	},
+};
+
+module_platform_driver(renoir_driver);
+
+MODULE_DESCRIPTION("AMD ACP Renoir Driver");
+MODULE_IMPORT_NS(SND_SOC_ACP_COMMON);
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.25.1


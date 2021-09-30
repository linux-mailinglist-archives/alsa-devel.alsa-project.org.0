Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D841DD19
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D12E16E6;
	Thu, 30 Sep 2021 17:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D12E16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014937;
	bh=oLhKjFU5pvRv56gVRqt9U0/nxM5RCoUYm7GtoIv7WIA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LiESAJFe166kgO6VgGVgk/K/iHt12KVhcowDAsTri2LINDm4b6CoRDs1OpuNPMZh3
	 o1cMfwohXW66xJuDX9CuerdXn+a2vRqRvRgwJ4wws0Z6pFEqAidfv/wRUV37UzsBIx
	 ZadEJidt7JJovEAIf1xmXEtchsL5spOjwlvm5VpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4B6F8051B;
	Thu, 30 Sep 2021 17:11:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C821F804AD; Thu, 30 Sep 2021 15:25:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28571F80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 15:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28571F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="39LsFk69"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjF8X31sJqdB8wy9obwAEfYP1Np39vPbUc+/lVWE0pCL7JBXAEif1AN1Tbn1prmvLHihum7gE2d255ozR3IV0+Z3dJjHZ8J2Wz0f2wrXESLNjds7/R+e7PGeCtNZoGtCT4FZvsFVm9Qgqa/V5zdhZq9uc9Wt7kdevIZmAkHocyK6TY+egAgVPYSTnVNJTKvmwoBynddUSkqV5ifCFHlodn0HVrZ/a/lqD/pzznOZ7UCSK2DQVHS7QPvnLfmQQAmOik+SOFCPI44IF/JDFrSRc5pjPv/CP/8DUCddEFfZG5Y86XgvkyC9r0ogOSzsMrxzg2atiLflRQLY8LHU3p+Bew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2n2dqUWu5HZ5rrTIVfmt0WbVouSIBeVO/X9Q0QCj5Wg=;
 b=NWuAncslVydguunmPMA0aM7316BX9KBe1wkFh/fWOkqHgWQypW7EyMxsq1wn+rBqlt3NDU5OG6MX6xjuzp+3qeudIm0LjgxLPTZ+Bza2qjNx7rm/EW8KCtAFCQ+vvd9HWy71X4A2lTfnzC2BnphCi45vOt5ZKlDmG5r0Vvux2EbCwYkDrKwAj7yTwd/ZeSWvnQeh7MB5cDaepeJ39OLSWuTt/ZA6/tjtfFtwe7X/vYSDhZA62J9WPpLBv2Z4Dg+lJAi3jnOGC731XfVmbMcC19u99o2L4Z0vJuY36C9kLK9bgAIc+ndP8jGqXCAnEyeJ4KFxPhSNedTdhOeQI4xzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2n2dqUWu5HZ5rrTIVfmt0WbVouSIBeVO/X9Q0QCj5Wg=;
 b=39LsFk69Y+CpHUwS+MyNM/2hw0RRAOITyhDNz1Fea0LbT1tgVuqeUeMDvimLpzM7AsUuNomfTmdh43QYlOXYOFkoVSP9iS9Q+nHZQa6QQRoqWPktAkRvA3oE8ZWL90ZejDDO2KDeESolRVDJcKdFvjbTt7yRPHaFY+h3qOHh5oQ=
Received: from DM6PR06CA0012.namprd06.prod.outlook.com (2603:10b6:5:120::25)
 by BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 13:25:26 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::f9) by DM6PR06CA0012.outlook.office365.com
 (2603:10b6:5:120::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 13:25:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 13:25:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 08:25:24 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 30 Sep 2021 08:25:20 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/8] ASoC: amd: acp: Add I2S support on Renoir platform
Date: Thu, 30 Sep 2021 18:54:12 +0530
Message-ID: <20210930132418.14077-3-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbc87dcf-3c4b-45b5-bb99-08d98415c339
X-MS-TrafficTypeDiagnostic: BL0PR12MB4913:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4913A4EF8450E5EDF068E11182AA9@BL0PR12MB4913.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3YDPlC/INLbkcbQOmE9knFJFZuuM8Ci6Cw/bqa+Fl4FikNHRIGQbLLtrJpXjdHp8aMifqX4jVDZmDXwz43+WJ9tnxu5bmTuL66ujJhsAQzFwYRbCwUKYAxQsZgwvFJtJ3c1DkCDnS9pKYJpF7bStLVEypyo2bd7kPFTBC3EaDidUIfooLdO3E+BoXhLXkHa2E5h3O4b3bbjFqQ4coMCc71zW4ggeKJp7oK+YX9EF5QFuvtXic3/ILokUDulmiolqg33SWrsovRtq0J9GY2h7tXVuJkK3RBcWmc+bcb1n866SwYW10kZ7B0m8P/gPxUNHYcqbUuAAgT5hxyaBSSBx++yMqQqc3OlYi4iwX8CHnbP0b/PjL8x4oeY8rv+vV3NRn9qAkobQYklz9LIWqoCsyCbGbtdxohlCffJNA8k0kbRkVJvH+uP2pAHObjn/I+NMtGpfiIv4X5OviEDtRP8oRq3n+oSiLXZ7fUVrIrD8ESF3nreWyhCaQxiyQrTE3j69zTOxpxGW6XHIOgFAAY+9sYVFchup2eL1D0REGQNWRtk5yaBEHuCVMOT4fIjJ0gheuDMaf04yO+axW9AByfONnQMzB1XxVSsWBMDafu6xeUY29LcrTN1pFWNsQmnXgQdwbTUAS4ARFtfzYGEpbBAd5y2gFbzxDGJT0+T0OQI867+1Fprq4bpC9qWO2ZjlXJjlOoQ/DEecAuZitt2TQUK/v0/DR5ow892US7aV7ypLeU8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(316002)(70586007)(2906002)(426003)(83380400001)(4326008)(86362001)(508600001)(6666004)(47076005)(8676002)(36860700001)(8936002)(1076003)(82310400003)(36756003)(2616005)(5660300002)(26005)(7696005)(356005)(70206006)(186003)(336012)(54906003)(81166007)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 13:25:25.3352 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc87dcf-3c4b-45b5-bb99-08d98415c339
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
X-Mailman-Approved-At: Thu, 30 Sep 2021 17:11:01 +0200
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
index 1ca815df6f23..a11182861f49 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -16,3 +16,11 @@ config SND_SOC_AMD_ACP_I2S
 
 config SND_SOC_AMD_ACP_PCM
 	tristate
+
+config SND_AMD_ASOC_RENOIR
+	tristate "AMD ACP ASOC Renoir Support"
+	select SND_SOC_AMD_ACP_PCM
+	select SND_SOC_AMD_ACP_I2S
+	depends on X86 && PCI
+	help
+	 This option enables Renoir I2S support on AMD platform
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


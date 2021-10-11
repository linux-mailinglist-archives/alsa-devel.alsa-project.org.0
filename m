Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EE4293C1
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 17:47:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCB9C16AC;
	Mon, 11 Oct 2021 17:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCB9C16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633967264;
	bh=y3jIUBram0+Xe2egWrkaAmMYZAV/rTzxx0hCjCwT7Ew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAkOtr02mJB5OmUj9KRWoyE7QHbXaeIFQ09u/15H5HK7Skj1auLaLot3DtlkWeWwz
	 Sqxq5yS9RfTz0nkOMDif7i9krlZJU5B4k1SJ5spb88DZ2BT4pZtIXLG6bbIIihK9J1
	 Y2PorpIQQmFCT9N4QPnnz3S/SSmX9BqSQ5QfpTj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 917C4F804E3;
	Mon, 11 Oct 2021 17:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D89DF804C2; Mon, 11 Oct 2021 17:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2052.outbound.protection.outlook.com [40.107.95.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 949D6F80423
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 17:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 949D6F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="RAvgwQ0d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlEqy2XmkjaC9+2h8prYJwYO4ZUHyi9nyqC6n64zrtEpX/L6RAuLuymo5Ch/t2rHsZ/Jx8Ca68unoAZG/T+OMXKuskMAfyymRTrgoH62MtsN01SDXhWA+2YxVmfDig4qQZX+YyU6Rm+JceIkh6+lP7bVazaq888OoQMoUbh+TiOF10bjxtx33XCLJP6OCyDxRwFIqSFaxK6Qp0P2wid3LRaETBy7HaMx4wTsQGhLAFHCRuBtUko2jcelGkx6px95+pMnyYwqAU2EaD1eVkVHBSkOK6xIUcPXGZ+3eR4ZIbVCEETSmAY47yI9n4qxcmQujtr5pfH4y++/48ylRS8qSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJKPtLm7F49qu9JOVwHJGN+rhSDFae0zpk/JmyoNO34=;
 b=AC6lAWFjnVlTyTImqZGMxx8INm5PDPL933Vx7aKdro+LbPkiOUJaiMK+pXGuot+gu2pR27MZLL4fW9XQPa8XLKDNSTe2GGqpKAtRTskUfVl+mQskB4DVsV5UeAtMhGxG1t2S8FJMPuoJpgpIBCThapw3nybFpt7+TbaHJhACrjrgNU6S1t1q42FQNaxn9UetweVUB0RqoqJWHa9jUt++eDW6B29VMjdV600cwliCtzVmBCrz/qIGBFDfERRZsZr21ViTv+S+7Nx1QQuY6EJY6YmPjbIXmhL5PQijLOI7HAvYpr0Bt32b0ODktzN++DETa1JtnqrC+6voA8vDwfaJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJKPtLm7F49qu9JOVwHJGN+rhSDFae0zpk/JmyoNO34=;
 b=RAvgwQ0dZ+PV15ndZAw0Kku4IpT/K9uZSw74Sw5yZB5DwjT3Y+F4wI3La5vSkKIS63VGIMW+spcts5hRnv2yc8GW+uEYV190tQ3/4m2OkwyJQpJFLAjOfCiWb+b7g1DPLz/1SBXR0hYZLQje029LX8BOQTXeZOeAg4r0R+RL0r8=
Received: from BN9PR03CA0505.namprd03.prod.outlook.com (2603:10b6:408:130::30)
 by DM6PR12MB2665.namprd12.prod.outlook.com (2603:10b6:5:41::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 15:45:52 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::1c) by BN9PR03CA0505.outlook.office365.com
 (2603:10b6:408:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 15:45:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.23 via Frontend Transport; Mon, 11 Oct 2021 15:45:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:45:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:45:48 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 10:45:44 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 2/8] ASoC: amd: acp: Add I2S support on Renoir platform
Date: Mon, 11 Oct 2021 21:14:46 +0530
Message-ID: <20211011154452.76849-3-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
References: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecbc9267-da5a-44fb-be10-08d98cce3456
X-MS-TrafficTypeDiagnostic: DM6PR12MB2665:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26658190095444A232F1C24F82B59@DM6PR12MB2665.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wy/hRQQDU8vX9SVilBUhcv+SO9i/Atwf+RmXg+ELj2CfOlmOUFy7FIYak0Vci/+tOi+D+Fv0db8YpEEsLaagkqqoo1CZ/LF3el2F9Q/NwXo+Lic/C14PzdJxtUXiU0/BDg/H+EYPmBd22Vbk1/G6eVDEHNGHj8sdsFmbnXNC6FRAEWuj6TZS9zSEATnlQfmVNInucknV72AC13qhnj4v7f+glAo8V9nwvC2iQNFPeSPW6Y7q1vFsuqndC5lP3onR+S+JNeHqM+xPD1eRGauSwyUYaLVB3aGBu4PEzALSalSVuVapxhGeucaEWvkz+0gB5OoBF3ic86AYBgPw0m12MfujsIFNHf7EsQe1XXM/BFP2tCUAh58uSQ91SeaNVgdi2qU/5anqJ+kzAHkmdjniY+ZlgO+SEH5syTVWIfsfVcJt8M3s7AQb8ASEHEFlC6wjiaHmlJGUgPiRZqZyy0CYoKEaHVMtAbGvUkN1GBAp2cD7ZjYXknOjEsxEbtt1NpdNclyFNNrpRM30wdCddDpK1jfdsu+8Gi8VEKM3Q+M5T10VKsLU38954Ppypf9NFOQtThiAYDqFn5ATu5n9SJ1JSvTXUrqqKMcPvNz1BmETXFNnHOXse1HkFiX24B+0h2cm1Nn/BiXCNHxJQIeyxgRhaw7sTJfY1Z5p+/LLXDoGinf29eevk7Euka4AL3jSxFSzjzuc2jS8j7lzRToDYe1ccQ4ys811sSSoPA4oVRceG2M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(86362001)(1076003)(5660300002)(110136005)(54906003)(316002)(2906002)(47076005)(82310400003)(356005)(36756003)(7696005)(8676002)(81166007)(36860700001)(70586007)(70206006)(4326008)(8936002)(83380400001)(2616005)(26005)(336012)(508600001)(426003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:45:51.8097 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbc9267-da5a-44fb-be10-08d98cce3456
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2665
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
index 6b993074e2c4..5ad468b06914 100644
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


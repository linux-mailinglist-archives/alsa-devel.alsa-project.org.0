Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2289F7442
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:52:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAC8260215;
	Thu, 19 Dec 2024 06:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAC8260215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587538;
	bh=jUD49omW6eoK0qc+XdxjUI6U0qQ70D08F/wODbko9d0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Li1cpqVwn/0Y5YMg1L3XlYQm0go8LA5qIIRBG6Md54RSZs8gSGGJaBhnuQU0hO+Nw
	 ZqmJ+iBONuFL3t9BODJepWcB2WAii0cNO4EU57iWK9ejZOkuCHg0bMVNQNTsuW8dnl
	 7+/T0rMW9axjD29Gl+vJJ94bXPj8wHL7nCSAO58Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD5BDF805E5; Thu, 19 Dec 2024 06:51:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 848D6F805E3;
	Thu, 19 Dec 2024 06:51:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08D18F805C7; Thu, 19 Dec 2024 06:51:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE45BF805BD
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE45BF805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=s9+JVC1l
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0mXtFLJ6cLQ4/IftUt6IydiGbt4x56DCFxYdZDPzPb4LH7jTfzHV341qaU4/rpqlLFHE6za4Dv9UDuhb3irLXXrximrpO5h5JS1HrF0pg4VnkDPnl5Ce6tVK3baexdaBBIkLzH7HWN3WsnEhBAdfmYz6BINtVv6N8rKslZ4PqvxJBuAffY/SLPKRfUaWeyIH/k/cmODlq608cRWUeOuhhAh8/Qraur/KCBbpGHPL7WdKlDMifV+f6f0fpcP/CVKYqgnutAnC+Fg6gHRt8DBAYH3wVwP5dpdVpPQNsWrSwl4CnVcYRFgnv6OX+hlGkiCYNISAh0yxltAGzPoCDREyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14JSuMIGx0dkAqxU3CKi2t75n/nXxh+ywxQUex3Pl2E=;
 b=hqLMSg3udbnszurRyK5SCK0udQ+G4stYul2mCC0zznFYBhA16OnViZtb1PUrEmatsbKPXryG3k0LUe7IgUq1+ZU7pbUEAkAXyu5Us/ISS6qKr9TIFTZWAQV5eMBIDYagQ1Kd1JWkU3yrQzVb2RILWfxNf6A9zIQyBQihioN7rMKGfi37vWl8YVYCSxNJIZ0J90FwbZzPsN7BfiTORPWGfjWnref8WDqBb/Ks97XkDslHjGOTz3RkKP4UTh7hsGA1lVfeYioM7MVDYl9Y6DLrP8E3jU50eha9/iFHDCqweJ4kOCheWORxIWliLUuzVZcQqLE0xeXUGfCBNu/SNEmwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14JSuMIGx0dkAqxU3CKi2t75n/nXxh+ywxQUex3Pl2E=;
 b=s9+JVC1lfl/Dod0Mk7lHvOpG360jgoYDOuNSUhWciW7k9PEhCIEhfJOSCNBajwuzUbn7cjdPvYQn6g9qZA9y331ocRJ4OAUpx0xgax/BF2myPsIFpi4dPtBb1MoE5cqzjl0YxflGjmRF5ogs7D18G4TIvsc30ydQzY3BqePwEpI=
Received: from CH2PR18CA0056.namprd18.prod.outlook.com (2603:10b6:610:55::36)
 by BL3PR12MB6593.namprd12.prod.outlook.com (2603:10b6:208:38c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 05:51:14 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::79) by CH2PR18CA0056.outlook.office365.com
 (2603:10b6:610:55::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Thu,
 19 Dec 2024 05:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:13 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:50:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 07/21] ASoC: amd: acp70: add acp pdm platform driver
Date: Thu, 19 Dec 2024 11:18:43 +0530
Message-ID: <20241219054857.2070420-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|BL3PR12MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b290d27-79c2-4f6b-5d55-08dd1ff125d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WtQ4jjIRgkB98dSjGvWgFhlkA+XkRQTpPreQD2hKtkyq0HTRvDRDKLh/JIIN?=
 =?us-ascii?Q?AMJAsmlxRNh5vGlMcuGFA/RWxrlZ38qzM8MrWvvLEp68zxSLvIH6nES6f9H4?=
 =?us-ascii?Q?tVMiZH4pk+Tu50G7YnGF0G7Y9TjIeeVQtWpCdVdKsa45LtdYonY/ABZv4Zzc?=
 =?us-ascii?Q?f9ZqwtYFK/73mVQwUrVFcaraIe8G5vAZ/GS0EhyTWt3wMfMPgsl1Zf36MDA9?=
 =?us-ascii?Q?7gQqhyQ9nPMyPotQixCBKn2x9WYlv1C/7jrMfn3Kthiy49mvmf4bNmARtoaJ?=
 =?us-ascii?Q?iTDAzndqcJ51cdRvz4DEH157/YqeA6P/iZ0MRyDTDGl6n0iZ5VYQTAgaw0RO?=
 =?us-ascii?Q?Wb5SIvOX+u7w7qxFg8wntF6DWei54nC1rWylYXPk1QfQvlybWtlKY2QvkgNB?=
 =?us-ascii?Q?jIUKPYefUGxrnqcJoaZnEFqlhvKvYsAS5OBsC2gsOSd5xb9yfmxl1Pejkg8B?=
 =?us-ascii?Q?RXGU6q2LIlW28h2XyXFGBJy8zRrzdqxSX7WAbcupgZ13QBmN+Mr4Ypgt+Yld?=
 =?us-ascii?Q?nIXMpE8jT53mseQ7/SwUYjTv7pqm+0YFE52D/yAppPRMd9vLiRfVHOjiTkvZ?=
 =?us-ascii?Q?RGGmX9i/dP2CRbqIwmcdP+31pBh49IOsuIZyfa1HwY/fMxG4cE5flaRQRv4a?=
 =?us-ascii?Q?xmegGFWqwBsrrFqX39uq0U5xhcyaN/AQVZyW1Yp1zDCWApaSTIxB7V6WIM08?=
 =?us-ascii?Q?n7pKVPVaR5C/DFtrXwCz46/dZCZ0S5kv0K9+qmuDByzqguInvqF4oaCW7WaV?=
 =?us-ascii?Q?1gNYUuRBcqun7XVZ/POvZThahvEcjNlwes6rbEPZKpMe9uBjBYWtUdNLeir9?=
 =?us-ascii?Q?fYAHRIGx1ugSPzvyLAL3YL/FrIYiXVSDNNluhT/1Kuctq6fKeQUhqBASwwWX?=
 =?us-ascii?Q?Nvq4xf0vEKCp0Q9hpcOej1FfBFQl6A+EagEr38MpwSItbs4lYIk3XvX6dBF4?=
 =?us-ascii?Q?iMz64H9kkS+TQAShRl5uGu5xStZRmuChm4GB4WnXnj5kjfitZitbZM9d08GW?=
 =?us-ascii?Q?3gJaYTxfcZ0/rUEM9J/rux2mx8Bzw2q98thBQp+s7NEic4bjPA1YsSS+fjeO?=
 =?us-ascii?Q?HhiTNwhxvmmAmHra1tkiulp9Dnn07odxolyu2XrOXe8K7QbYqje/hdDzHQR4?=
 =?us-ascii?Q?PVU45ncFXt1b4KfXaczrJQ7F/f1PRWScS76HZSQvsXGPsnEsJ/HgY3TKG2oZ?=
 =?us-ascii?Q?ZQRzhuuZ9poK3RcyqIhRpAQCQk9WjIINAex4wG2QSYOPBuTHk1QKZ4SS2Nkx?=
 =?us-ascii?Q?oVDXc93A3ml7VWELO/sgv1Ot0hsZhsY5H5wgHTY8zdYmdHMgmJj2OuU69yVg?=
 =?us-ascii?Q?S9XJpd5Zfv/pGpArQlexvCYud1c6xWSv0P3f5Fi9rmtTu7onyUSH2zvXJOyd?=
 =?us-ascii?Q?90AiECrnknVYw3QSy0/6VIj9KtlL83MPjV2OIJt2krYddeb5uaKf6RH9Flss?=
 =?us-ascii?Q?Bc/7ffh/+EFpQPUjUUYQ/1JIF+tWEvDxhfN3P4Ral5+UOThmUVl1aA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:13.8041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b290d27-79c2-4f6b-5d55-08dd1ff125d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6593
Message-ID-Hash: BUWXCYY3INB7BKHANA5MWEECTVUWH4H6
X-Message-ID-Hash: BUWXCYY3INB7BKHANA5MWEECTVUWH4H6
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUWXCYY3INB7BKHANA5MWEECTVUWH4H6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PDM platform driver binds to the platform device created by
ACP7.0 PCI device. PDM driver registers ALSA DMA and CPU DAI
components with ASoC framework.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/Makefile        |  2 +
 sound/soc/amd/acp70/acp70-pdm-dma.c | 87 +++++++++++++++++++++++++++++
 sound/soc/amd/acp70/acp70.h         |  7 +++
 3 files changed, 96 insertions(+)
 create mode 100644 sound/soc/amd/acp70/acp70-pdm-dma.c

diff --git a/sound/soc/amd/acp70/Makefile b/sound/soc/amd/acp70/Makefile
index 5e553de6c772..778bdf268731 100644
--- a/sound/soc/amd/acp70/Makefile
+++ b/sound/soc/amd/acp70/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # ACP 7.0 platform Support
 snd-pci-acp70-y := pci-acp70.o
+snd-acp70-pdm-dma-y := acp70-pdm-dma.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-pci-acp70.o
+obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-acp70-pdm-dma.o
diff --git a/sound/soc/amd/acp70/acp70-pdm-dma.c b/sound/soc/amd/acp70/acp70-pdm-dma.c
new file mode 100644
index 000000000000..fd31e31a02a6
--- /dev/null
+++ b/sound/soc/amd/acp70/acp70-pdm-dma.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD ALSA SoC ACP 7.0 PDM Driver
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "acp70.h"
+
+#define DRV_NAME "acp70_pdm_dma"
+
+static struct snd_soc_dai_driver acp70_pdm_dai_driver = {
+	.name = "acp_acp70_pdm_dma.0",
+	.capture = {
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 48000,
+		.rate_max = 48000,
+	},
+};
+
+static const struct snd_soc_component_driver acp70_pdm_component = {
+	.name		= DRV_NAME,
+};
+
+static int acp70_pdm_audio_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct pdm_dev_data *adata;
+	struct acp70_dev_data *acp_data;
+	struct device *parent;
+	int status;
+
+	parent = pdev->dev.parent;
+	acp_data = dev_get_drvdata(parent);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENODEV;
+	}
+
+	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	adata->acp70_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!adata->acp70_base)
+		return -ENOMEM;
+
+	adata->capture_stream = NULL;
+	adata->acp_lock = &acp_data->acp_lock;
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp70_pdm_component,
+						 &acp70_pdm_dai_driver, 1);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp pdm dai\n");
+
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static struct platform_driver acp70_pdm_dma_driver = {
+	.probe = acp70_pdm_audio_probe,
+	.driver = {
+		.name = "acp70_pdm_dma",
+	},
+};
+
+module_platform_driver(acp70_pdm_dma_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP 7.0 PDM Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index 68035fbf23d1..c7cabb98cc1a 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -58,6 +58,13 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct pdm_dev_data {
+	u32 pdm_irq;
+	void __iomem *acp70_base;
+	struct mutex *acp_lock; /* mutex to protect acp common register access */
+	struct snd_pcm_substream *capture_stream;
+};
+
 /**
  * struct acp70_dev_data - acp pci driver context
  * @acp70_base: acp mmio base
-- 
2.34.1


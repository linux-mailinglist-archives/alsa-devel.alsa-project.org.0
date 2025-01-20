Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3D8A16A47
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:04:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9998A60236;
	Mon, 20 Jan 2025 11:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9998A60236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367490;
	bh=jUD49omW6eoK0qc+XdxjUI6U0qQ70D08F/wODbko9d0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F8D5grLNx+C0rL2MTmX/qZxQQ87Zq91VGDXrI5Cqqjht4FZIRtHALpIPifyg8+Bfg
	 zwxbkivG0VwBjtY0F0XPDezzJSoglVVvhjXGwPht+UfINRGFUXb2HStfX8VfokvPqA
	 cOcd9aThtzaVpbD+V8KU/XPmd4P02duSF8d8i5UQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68115F8060B; Mon, 20 Jan 2025 11:04:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F016BF8060F;
	Mon, 20 Jan 2025 11:04:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C656EF80612; Mon, 20 Jan 2025 11:02:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54715F805E9
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54715F805E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1ne37qAw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRaJ+tbNmjJKNGzrQzH1+aauJ8MMagvxDSRJcWx4tSWUaqxiUtqhjgIM6K5T9H/JOsvhzcqlhZymaM8AIDdTRQLIjQ+OeqKdH3sSNkjSym3kPz644mLyJagA8fA9IyOMOUsGHes8p5V0SSIUWGaHiSTtVOkpVsUQ63ZAzaHInOtwka70kXdYOOjBZP35sRAHDTEvwCVSRJA/AuFbX+jLJZCX6YaHvDYjDVP5Uw7O0oVBBzyy/FiDwwpVawGEjYq4VaFYKkRzW9R1W7Y0+R/1NQBxQF4PXYAK5irRVvVRY370iUwCCSEqvJnvMBQ2m5n0B0BW+4V4l08t1DYQFBi5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14JSuMIGx0dkAqxU3CKi2t75n/nXxh+ywxQUex3Pl2E=;
 b=vupNnw1GI70E465QluT6FUf83kKlU5VzI+zGVWhENKwLJ3GimSZ82ltaqAIffLbsnSIeEBE/INJ6iig3itGKOdWwRqX45NlxV9U2IG+Jjg/dLZOeY2MIlZbnIGHS6n8kiacNbX0//80eY0jrkP6O+4anPesT3PYvO5LL0T8LNOPNdkizMSQbrZRlRS7/xM8tAuCFWpvRspE+oXniZ/7FBh3FGlUPHxTYLhlYUkPZSOLI7Kf/OWsPG7DxejIpOtrTuKMfC3mXQQ9GH0dYPHXoWwL7SwMkW745kPDulphjXhROosfGtGImtMoTmtTMF37nVcCmi48LxD8Uviljnj39wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14JSuMIGx0dkAqxU3CKi2t75n/nXxh+ywxQUex3Pl2E=;
 b=1ne37qAwxdS+VaP4Zv+GQLKDCCxdPM0KTZafNzeHE67iDAMKKFG+JwHgh5NSWmwXQXy0f0NKSVAdaA80uV35sPHeYNcdSlMs0y4VmAKg0FZkbzVNfnQPlwh7Cr5V4VvOMyOWOeKQ09AbbY1XPntmZ6LEjJLX2edikqLN2OcMios=
Received: from CH2PR08CA0027.namprd08.prod.outlook.com (2603:10b6:610:5a::37)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:02:10 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::9d) by CH2PR08CA0027.outlook.office365.com
 (2603:10b6:610:5a::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:10 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:06 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 07/23] ASoC: amd: acp70: add acp pdm platform driver
Date: Mon, 20 Jan 2025 15:31:14 +0530
Message-ID: <20250120100130.3710412-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a305ed-40e9-4feb-3d2b-08dd3939814a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YHfx4YvMo2YEk0sNgiQqIL54ef1bqvBScV90RpkAUs87u4hKFjMzx8OSyH0C?=
 =?us-ascii?Q?zw4nCVNZ0seTmZM6KdBeZ5ZCCkW/eYSEd6FWI15Dn1uuq5Ty82B6Y4ELYPpC?=
 =?us-ascii?Q?NDdo/oPbO9R3r0bPlBBnp4mMg/nXxBYGv1tOk++SxlTJuKJ2eqzuPXrhV6tn?=
 =?us-ascii?Q?bHPvb9KI7s1qkSQGCArrwkQC9JfvCzPQ0wateKxVnGXd7mbhgU5qtXE5UkeL?=
 =?us-ascii?Q?XKrdtY0w78Zr6BdowNR0Dt1zrAnAhQvjQMUgnsb6HilCZ5LvI134N04AVjXY?=
 =?us-ascii?Q?IRT/KHucQQ8gCFV0codmfshgXmTihkpJHvx8ZY83rSKeFQuKsoROLRfwy0Ga?=
 =?us-ascii?Q?mjcFGNXgI2tB2/T/2VJP6nJGSYe0cj4/UKZew4wgyxv8zcQ2B/eQh6uZJaPU?=
 =?us-ascii?Q?laB5MoE0sYCIixiHDsIjWJ0G9JPWWY61lICR/au+QUo6Cbkbc+gnZIOYppQE?=
 =?us-ascii?Q?m+0+6EYGhdzP965H1u9WPoHlnyRX0Jq3hLBezOCLLhFkP0Zs/xIs75iOfiI3?=
 =?us-ascii?Q?yRZtQynwM5d/DG80mV7ZP++5WWSrfO/Cl/jIuLBFsIoQQL2H//kpctWf8JGl?=
 =?us-ascii?Q?Ox4Pa0vvR5dlr2joQ3KYmGXBvb8itCwVCrLYPBcIszBkq9gImlfJeV+4ctMN?=
 =?us-ascii?Q?+pIhwfab/nysTGGp81lkK0HJLEN/WMu3OYvP8gs0FMnXsQpQKJr/0szYzWC8?=
 =?us-ascii?Q?1vZgfdY8wJnwlissrlgudgZm5XVjaJfifBreaC9OKOnDo42aW6Fn/q/UFgKL?=
 =?us-ascii?Q?3nmTRgNCIZCVRm0YRhd8wfe7Ux0M0vXQogpf2Hw2eN+neX64w3dEX5sLZ+Rl?=
 =?us-ascii?Q?yZD1IcUBmDymB7c0OmC4Y29MHNX2ORCqziZA1JojvElBEOEkDAAMo/Z94cuG?=
 =?us-ascii?Q?h1vah3kQoTXjCrVMWSJqAsf1ljsJD1QBYDOFcl4sf0JTy2Y2tMXcKQLryVo4?=
 =?us-ascii?Q?KiSD3PYaXyrkS6qxPG4y9AR/SVOLPn5M28T1QAB+fjqZyE6CLaePfFDM6VlC?=
 =?us-ascii?Q?kvq1TXzDtLH6KHiUMgtQq2aa3jbr+K//llml2wNXLQTTkm738W4OZI6mTDek?=
 =?us-ascii?Q?jqPCoF6OANGzcdqDO/Ms61tgqWJeIKUO2ThPJjvRWrXfF7yeFRcrstn3e9xH?=
 =?us-ascii?Q?IOauxxXc0baisS8oTcS2Z+wuTZfeZK4FGOLLn2xxWEKCpW1ZnhqoLWXc+Z5S?=
 =?us-ascii?Q?AKXUJWyzLynQ6y6gajhsGdtbhmoB6Qfr9a0zrvSJZajzdJdohqZUdQg1NNgi?=
 =?us-ascii?Q?BgE3V5laTp+7bxDsIk5HkxadZjxSt/7l6yNlExPNqOZkkf3loUhpsNYFFOAx?=
 =?us-ascii?Q?fgOFzhNKjuhT5cIf0aVAE5KZfx+J0keposYBtrXSm2fX8IwaDGNSI7xvXQpa?=
 =?us-ascii?Q?1vJOgjla+yliqe+sTbY4EQujyE/nRZ8RvpvyOKwZ9bd6p7tQfdiqBwHhEO66?=
 =?us-ascii?Q?ZS8VVILS/7+D1fK0+u/9t8sh6ChCV6tWxeUyYvlRpoKiJdBJNQ559g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:10.0742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68a305ed-40e9-4feb-3d2b-08dd3939814a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596
Message-ID-Hash: DAHMMEY36LRMASI5KXY4OX5I54ZN5U7N
X-Message-ID-Hash: DAHMMEY36LRMASI5KXY4OX5I54ZN5U7N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAHMMEY36LRMASI5KXY4OX5I54ZN5U7N/>
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


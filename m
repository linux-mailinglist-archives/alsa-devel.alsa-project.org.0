Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F048D458
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 10:31:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754C61F0E;
	Thu, 13 Jan 2022 10:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754C61F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642066310;
	bh=BjOYv+Rqt9eMa/dcoR7yP5kbBpH4EGxeTeVQu+a4yxE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LbtdcPL/Ip5GZYV3/ayaRGsYFgv+OpOT1AjWv0105PgfsNh9ZCJkzy0LqQK3kedUr
	 q/ukHr/1x8hY8KDE48M2gDnxPV7ArF2lBbErPhlpyoz43LUgIELcww4Y9zIuq4DY6k
	 PKlXTAJrKBHb6AyygC4m6iFa2mKaaR+9Gln5FWx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18D66F8013F;
	Thu, 13 Jan 2022 10:30:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37290F80088; Thu, 13 Jan 2022 10:30:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67942F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 10:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67942F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="qldJN/uG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR/NAMOV4vo+4It292vdj5vJ5IOMIycQ+8+uwkwoZvK63JWIGzSumK2O4axYtvGpB33JUgat9yIauTpvGs5Ni+lHG0IU8MLECwwMHWUF0zWJ1P0iNN+b1shygyM7pelgMSI0s846qdxE4LYksm8hUyfMKRbWMzPl4SLZcXPPlhcHoqwNWMD29VLYVK+GeJgc0MG1LTmClrx9LVQdeYCw2fP8b+tt6oo/97dxLlrGAbQX9jjbEumvakDdn03GKMatd/vdDmBEbT4WPdW5BDK/T20eIREVBjITqaFvN/q7rmE+8BQsXJviOp1/MjwH2s/FQQDgj1UJDiOHhgKCQPY36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/JjFExpQyHhFm0Ews9rfQE5ACBs6QpJrhSdGxh1FE4=;
 b=BFtY736FKZSDq35vE7uPEYoRmvnsPKaKG1BBESeUwvJvun+M5su9TZUZFj6YETImax9W404gUUBEzH8kTgnSmV+Q7XbDfeIJ+/s+sudghbR9cI6LlKfAgzS/pZP36jNjfTJxw2rfA8CKP5MPUBI/R0pTun6T1hAuLRR2vJl2ml1psb0+BPIKrJuel6Co+ioOkcxyJKhcZqGtGZ9XyL6bXS3Ez74rIPJhrI7uqu0FBMxkShPu7Y0IVidE6Or/XnywExOYCe7k2aUwdH/bPCc/QX9IiTidAcYbHWi1ej2jRHkQVeyur0h20yVVXOKpqLX41S4x52Aufl6HUj4OAR+2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/JjFExpQyHhFm0Ews9rfQE5ACBs6QpJrhSdGxh1FE4=;
 b=qldJN/uGu7qvMhqr3sVW/wsWVn5l7LujdKZ0rSWkXRhherWRdZy9n/ANoeEYiT3m1GpR/F9au4K0NoXvjRWqz3X0+jJsuyPZMop/U5eqyNTl42UOEaouYzlVPczURsQzrH8yK4dlREh9R133Gy5LWO6Bk8npWvR3r6VXuJZ5bi4=
Received: from MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::16)
 by BN9PR12MB5290.namprd12.prod.outlook.com (2603:10b6:408:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 09:30:24 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::77) by MW4P221CA0011.outlook.office365.com
 (2603:10b6:303:8b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 09:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 09:30:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 03:30:20 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 03:30:20 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 13 Jan 2022 03:30:16 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 3/6] ASoC: amd: acp: Add generic PCI driver module for ACP
 device
Date: Thu, 13 Jan 2022 14:58:39 +0530
Message-ID: <20220113092842.432101-4-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113092842.432101-1-AjitKumar.Pandey@amd.com>
References: <20220113092842.432101-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acbc0377-4323-4e82-8763-08d9d67753b0
X-MS-TrafficTypeDiagnostic: BN9PR12MB5290:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5290EDAF13AF4CE51317527182539@BN9PR12MB5290.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmHyfMuu7/Zz2unnREekez9bw7JdvXiDEidmcyyTjiqzh0hv8gXDE6AVjUYBdlxvem6Nm9B1vDAqmz0CIUE191iiVUiyxSqv8ThID4Sel/qLTMrAqiHmZXkllpX+mt1EDIdBQMrw4+8m9Fi/+0GLy+nwyp3WbQ/174B9RL8EIshBHiqMe2Djh82ECrSSjYz2crzAAzT1b31XjPOymCkVIT9U+jPO4p0EIkIcyUIPWz+obkl0qEHjTHR9i082Ysje+nCyzXdyjh1Y7pDs1/JDTWDfTG4Q8BYFQ0IWhpwis/1OHPmxcgzZXb2K0HMQzQfG2JrVA1oJ9OEXMWbLOJMFSB/zfeXv8rfMCJKKWDkNPq4vRP/M9TOLuy1s7i9rECApkAXWOIf3uDUNf4n9qZPnZWlz7aFbzrapIiLxsMAaSWT5p1cMg0ekhhIf57+0wA6jBqiyABvpRRkZgNE4RSYcbT4z1KSTEEc3xI7A5PdzX0lKRstViKCGNSInsoWtCTtBW7t9fE0Dw95DYOr9i5XCqohhqHYqniIVo6XnR2ud4LbRjxbl3QJBu4Bn8AIGr0dmdsAqgt33FZGKbsp5KIqsN9qnEWjJhqIiG0OkBWfQhz+vm0eSciAi2FTFjvIWp9qv/piD7cx05bmp576Mzt7RLPIrf9i5E+0DFu6DU/pinj5TnvPtv5vSNKVrMZRslqnJT1mPpfd9iXQuvr5+OXUhlhL7CPNse9IgK2cQoE2tLIyg6V+dkVpjtKBkexjbzWJ+oei0fWs5nNaRMg5nXnrWMwsV1D+3ZgLEj6GO4lbWb55iwzRtAhLl2nT4YT039mB8uSs3ftfJ8pDKK5ritUMlWQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(316002)(356005)(83380400001)(2906002)(508600001)(6666004)(2616005)(81166007)(40460700001)(86362001)(7696005)(336012)(5660300002)(26005)(82310400004)(110136005)(8676002)(70206006)(1076003)(426003)(8936002)(4326008)(70586007)(47076005)(54906003)(7416002)(36756003)(186003)(36860700001)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 09:30:24.1603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acbc0377-4323-4e82-8763-08d9d67753b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5290
Cc: Sunil-kumar.Dommati@amd.com, Geert
 Uytterhoeven <geert+renesas@glider.be>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open
 list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, V
 sujith kumar Reddy <vsujithkumar.reddy@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Bard Liao <bard.liao@intel.com>
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

Audio Co-processor or ACP IP block on AMD's SOC is connected via
PCI bus interface, hence needs to be register as a PCI device. We
have same PCI device ID across multiple SOC's but with different
revision id for PCI hw. Add a generic PCI driver module for ACP
that registers ACP as a PCI device and also register a platform
device based on pci revision id. Any SOC's specific configuration
for ACP block will be done in platform driver probe. We have added
an initial support for ACP revision id 3 or ACP3X device.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig   |   6 ++
 sound/soc/amd/acp/Makefile  |   2 +
 sound/soc/amd/acp/acp-pci.c | 158 ++++++++++++++++++++++++++++++++++++
 sound/soc/amd/acp/amd.h     |  14 ++++
 sound/soc/amd/mach-config.h |   1 +
 5 files changed, 181 insertions(+)
 create mode 100644 sound/soc/amd/acp/acp-pci.c

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index f4ca7843391b..626e4a5cb06a 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -25,6 +25,12 @@ config SND_SOC_AMD_ACP_PCM
 	tristate
 	select SND_SOC_ACPI if ACPI
 
+config SND_SOC_AMD_ACP_PCI
+	tristate "AMD ACP PCI Driver Support"
+	depends on X86 && PCI
+	help
+	  This options enables generic PCI driver for ACP device.
+
 config SND_AMD_ASOC_RENOIR
 	tristate "AMD ACP ASOC Renoir Support"
 	select SND_SOC_AMD_ACP_PCM
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index 66cac95432f6..657ddfadf0bb 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -8,6 +8,7 @@
 snd-acp-pcm-objs     := acp-platform.o
 snd-acp-i2s-objs     := acp-i2s.o
 snd-acp-pdm-objs     := acp-pdm.o
+snd-acp-pci-objs     := acp-pci.o
 
 #platform specific driver
 snd-acp-renoir-objs     := acp-renoir.o
@@ -20,6 +21,7 @@ snd-acp-sof-mach-objs     := acp-sof-mach.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_PDM) += snd-acp-pdm.o
+obj-$(CONFIG_SND_SOC_AMD_ACP_PCI) += snd-acp-pci.o
 
 obj-$(CONFIG_SND_AMD_ASOC_RENOIR) += snd-acp-renoir.o
 
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
new file mode 100644
index 000000000000..7802c4ed5155
--- /dev/null
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+
+/*
+ * Generic PCI interface for ACP device
+ */
+
+#include <linux/pci.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+
+#include "amd.h"
+#include "../mach-config.h"
+
+#define DRV_NAME "acp_pci"
+
+#define ACP3x_REG_START	0x1240000
+#define ACP3x_REG_END	0x125C000
+
+static struct platform_device *dmic_dev;
+static struct platform_device *pdev;
+
+static const struct resource acp3x_res[] = {
+	{
+		.start = 0,
+		.end = ACP3x_REG_END - ACP3x_REG_START,
+		.name = "acp_mem",
+		.flags = IORESOURCE_MEM,
+	},
+	{
+		.start = 0,
+		.end = 0,
+		.name = "acp_dai_irq",
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+{
+	struct platform_device_info pdevinfo;
+	struct device *dev = &pci->dev;
+	const struct resource *res_acp;
+	struct acp_chip_info *chip;
+	struct resource *res;
+	unsigned int flag, addr, num_res, i;
+	int ret;
+
+	flag = snd_amd_acp_find_config(pci);
+	if (flag != FLAG_AMD_LEGACY)
+		return -ENODEV;
+
+	chip = devm_kzalloc(&pci->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	if (pci_enable_device(pci)) {
+		dev_err(&pci->dev, "pci_enable_device failed\n");
+		return -ENODEV;
+	}
+
+	ret = pci_request_regions(pci, "AMD ACP3x audio");
+	if (ret < 0) {
+		dev_err(&pci->dev, "pci_request_regions failed\n");
+		return -ENOMEM;
+	}
+
+	pci_set_master(pci);
+
+	switch (pci->revision) {
+	case 0x01:
+		res_acp = acp3x_res;
+		num_res = ARRAY_SIZE(acp3x_res);
+		chip->name = "acp_asoc_renoir";
+		chip->acp_rev = ACP3X_DEV;
+		break;
+	default:
+		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
+		return -EINVAL;
+	}
+
+	dmic_dev = platform_device_register_data(dev, "dmic-codec", PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(dmic_dev)) {
+		dev_err(dev, "failed to create DMIC device\n");
+		return PTR_ERR(dmic_dev);
+	}
+
+	addr = pci_resource_start(pci, 0);
+	chip->base = devm_ioremap(&pci->dev, addr, pci_resource_len(pci, 0));
+
+	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * num_res, GFP_KERNEL);
+	if (!res)
+		return -ENOMEM;
+
+	for (i = 0; i < num_res; i++, res_acp++) {
+		res[i].name = res_acp->name;
+		res[i].flags = res_acp->flags;
+		res[i].start = addr + res_acp->start;
+		res[i].end = addr + res_acp->end;
+		if (res_acp->flags == IORESOURCE_IRQ) {
+			res[i].start = pci->irq;
+			res[i].end = res[i].start;
+		}
+	}
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+
+	pdevinfo.name = chip->name;
+	pdevinfo.id = 0;
+	pdevinfo.parent = &pci->dev;
+	pdevinfo.num_res = num_res;
+	pdevinfo.res = &res[0];
+	pdevinfo.data = chip;
+	pdevinfo.size_data = sizeof(*chip);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		dev_err(&pci->dev, "cannot register %s device\n", pdevinfo.name);
+		platform_device_unregister(dmic_dev);
+		ret = PTR_ERR(pdev);
+	}
+
+	return ret;
+};
+
+static void acp_pci_remove(struct pci_dev *pci)
+{
+	if (dmic_dev)
+		platform_device_unregister(dmic_dev);
+	if (pdev)
+		platform_device_unregister(pdev);
+}
+
+/* PCI IDs */
+static const struct pci_device_id acp_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_PCI_DEV_ID)},
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, acp_pci_ids);
+
+/* pci_driver definition */
+static struct pci_driver snd_amd_acp_pci_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = acp_pci_ids,
+	.probe = acp_pci_probe,
+	.remove = acp_pci_remove,
+};
+module_pci_driver(snd_amd_acp_pci_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS(DRV_NAME);
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 567355209a5c..8fd38bf4d3bd 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -12,9 +12,14 @@
 #define __AMD_ACP_H
 
 #include <sound/pcm.h>
+#include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include <sound/soc-dai.h>
+
 #include "chip_offset_byte.h"
 
+#define ACP3X_DEV			3
+
 #define I2S_SP_INSTANCE			0x00
 #define I2S_BT_INSTANCE			0x01
 #define DMIC_INSTANCE			0x02
@@ -70,6 +75,12 @@
 
 #define ACP_MAX_STREAM			6
 
+struct acp_chip_info {
+	char *name;		/* Platform name */
+	unsigned int acp_rev;	/* ACP Revision id */
+	void __iomem *base;	/* ACP memory PCI base */
+};
+
 struct acp_stream {
 	struct snd_pcm_substream *substream;
 	int irq_bit;
@@ -106,6 +117,9 @@ int acp_platform_unregister(struct device *dev);
 
 int acp_machine_select(struct acp_dev_data *adata);
 
+/* Machine configuration */
+int snd_amd_acp_find_config(struct pci_dev *pci);
+
 static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int direction)
 {
 	u64 byte_count, low = 0, high = 0;
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index feb3756d9ac4..0a54567a2841 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -14,6 +14,7 @@
 
 #define FLAG_AMD_SOF			BIT(1)
 #define FLAG_AMD_SOF_ONLY_DMIC		BIT(2)
+#define FLAG_AMD_LEGACY			BIT(3)
 
 #define ACP_PCI_DEV_ID			0x15E2
 
-- 
2.25.1


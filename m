Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE31428656
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 591B11698;
	Mon, 11 Oct 2021 07:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 591B11698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633930791;
	bh=J5Vxg8Oy4yOgm5j/Its1QubO6Ovc+XgCi6nIkjmPdng=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jA4yZyOMDSTWKwJs5b+JA9dDjkoU8N4wHiDdDSZP6snlv8kBSPakueAcFFm7nicWR
	 XXAbtZDFeVPvr5SYuYKq0+MtPwOnkF4zXtSZTiuSRNutcAjhkpQHdDgAj5IpzYsJQV
	 CtmuYI4wbPfkm7K/7DR/zZySlH/CPZI0F4I81USM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DEC3F804EC;
	Mon, 11 Oct 2021 07:38:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A8AF804EB; Mon, 11 Oct 2021 07:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2066.outbound.protection.outlook.com [40.107.212.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D6B9F804E2
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D6B9F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="JX7FcNKP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQOqLorWhXWL+2Mamj7GJI6vnteSD+wI8GnJ+piziwAl9p9tX9yizGfLsXsuce8uqtfKo9Lu3Az5GPxRYHxpP53AT1dB7/2ov8Chs+84KtspYtar1oAPyq5Kx9QmFALZOHcdvP0SAKP7NND2u8bxW3sY1/hQO9Hls4V9Ol/anhL1MCbMRUsR+B27XGzKQ7wEgXNkJgAF2v77JUwvYlRpnN/AxBoEhrYpZ0AiPpdmvtWT0ynkeNQFnEyfLIrpmmCVhccVJseid347tdCAQwCzMfHULWGnSwEHCUiet72KFDb90iF6x1utO8hEyifd8xAhyn1p7PD00DQyDvCpmrygRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFbGgQS1/ss/XQmt9sL/r27LZ98Dt9dc7heR7fYQ0Tk=;
 b=RR20It+j7WG/GXA9irQ0+1Tw/9Tmn3TGCovcP29jdco6bh0WeEe2WXddVS6WKASuuo5mvnX1jd1uuHgt6aL+wfMY2lE9I/a5V6DTxh6/+eaYwq0Q9heRvnGq/NDb17f1O/bMhzTSkCJpolGk6xdWTUQVIEWzz21QJr4EjVrZsae7zVdraWem9sUWlfpytQN1RMTANh7wdglTCpUXADuwHLBQBWDM+9afjsNOld+Yde9eryE4C18rd/HwYJExipv4EnbI+wEx+Okjk0b3/q7uz3l7OzZgJeu5oKooSVIl5QTZzb/+Zalo0sfPIvJeb+tyBbLzapLp+ieaWb3x0zCTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFbGgQS1/ss/XQmt9sL/r27LZ98Dt9dc7heR7fYQ0Tk=;
 b=JX7FcNKP+Rz4r6tpLj0LPUwwI93X6ITXo0SpaD2N0xN0g7pMk6n2cZUrQcfPWZmbf9wjAUL0Af3fJt34B1OZtCYzxAC+he5UvMR5x1Cyumi93H79lzXPDrFjQofEzb0YHRfFygVW4UYaV6oBAMBOaFgR9AAVw1OifwEHKkiK0NM=
Received: from DM5PR07CA0141.namprd07.prod.outlook.com (2603:10b6:3:13e::31)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 05:38:31 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13e:cafe::23) by DM5PR07CA0141.outlook.office365.com
 (2603:10b6:3:13e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Mon, 11 Oct 2021 05:38:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:38:30 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:38:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 10 Oct
 2021 22:38:29 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:38:26 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 02/13] ASoC: amd: add Yellow Carp ACP PCI driver
Date: Mon, 11 Oct 2021 11:26:10 +0530
Message-ID: <20211011055621.13240-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c69e125-5133-4fc2-97fa-08d98c795ba0
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5273810CFA1EBA11E6D03C9897B59@BN9PR12MB5273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bszjQiXenGzpOxhUtUNwH2fho/EP4fBYa4WHpqIT9pba+WQeDHyflh5Wpu9QKQtifBbuQYmtD1urASEDUf8uJqGGr1bpCSIP1J6BSf9p9MXZtnYEjpMrIqinewysBAebbrN7igthQu6i6NTaZWJVhKJyJSuz1XZDkEwcuTEsE8C4XzCcU8fS7HRT64ohQxm9DCeRHCPaWqAJDvkmFTRPoX8uA+QGSc5boGk4AWkxsy+vsH5Z+2XJih1pTHxYTRj7VVS94Rp5VBmAbZZD+xbPz4IhhjTTiFiupw/bXcSLQVaFULeXFCh6T798nELGuIqmcnQRAKrLpbzn75N7PNsnwI+kBmJLa8ZZFUsvzUMhOW+bmQsxqIRJq/ztQU68Zpve/9WiQeZ8OdBl7qMDOXNkOx8+Pnh39HPYOzx7Sb/wyXOXBxM5qOcAeN4TrogvaZ+a+fT4llgmcgItgkcabrgQd6/xce6lfIgpp94aNjsXteFP63R9DQ3vkZ787EGsl3UK2OrAcUPdWeE5M34DOCpHuE7tHYT1cMObPPUMqTSeYM0oonTWiJfCQR7e3+A4xJH9GRk342f0yIIxL9fXCDySp+BGovOHieS5dbn+sTdJJRq3XpOSghGKzA/uJrGJFSDGWd5ixuglUBJ/xE2WP9Qkb8gxlGj3qQ14o6k+k/IiNUlcC06Bjh+n1qGhblFtjzvlmNPVb8TnSq5ESiNW/x9XCR/44kZUuny5aNFsUZBRBIs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(356005)(2616005)(1076003)(36860700001)(110136005)(8676002)(86362001)(426003)(336012)(316002)(47076005)(81166007)(2906002)(7696005)(5660300002)(54906003)(8936002)(508600001)(186003)(4326008)(36756003)(70586007)(70206006)(6666004)(82310400003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:38:30.5009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c69e125-5133-4fc2-97fa-08d98c795ba0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5273
Cc: Sunil-kumar.Dommati@amd.com, Richard.Gong@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 open list <linux-kernel@vger.kernel.org>
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

ACP is a PCI audio device.
This patch adds PCI driver to bind to this device and get
PCI resources.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x.h     | 21 +++++++++
 sound/soc/amd/yc/pci-acp6x.c | 89 ++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 sound/soc/amd/yc/acp6x.h
 create mode 100644 sound/soc/amd/yc/pci-acp6x.c

diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
new file mode 100644
index 000000000000..62a05db5e34c
--- /dev/null
+++ b/sound/soc/amd/yc/acp6x.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ALSA SoC PDM Driver
+ *
+ * Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include "acp6x_chip_offset_byte.h"
+
+#define ACP_DEVICE_ID 0x15E2
+#define ACP6x_PHY_BASE_ADDRESS 0x1240000
+
+static inline u32 acp6x_readl(void __iomem *base_addr)
+{
+	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
+}
+
+static inline void acp6x_writel(u32 val, void __iomem *base_addr)
+{
+	writel(val, base_addr - ACP6x_PHY_BASE_ADDRESS);
+}
diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
new file mode 100644
index 000000000000..2965e8b00314
--- /dev/null
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD Renoir ACP PCI Driver
+//
+//Copyright 2021 Advanced Micro Devices, Inc.
+
+#include <linux/pci.h>
+#include <linux/module.h>
+#include <linux/io.h>
+
+#include "acp6x.h"
+
+struct acp6x_dev_data {
+	void __iomem *acp6x_base;
+};
+
+static int snd_acp6x_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
+{
+	struct acp6x_dev_data *adata;
+	int ret;
+	u32 addr;
+
+	/* Yellow Carp device check */
+	if (pci->revision != 0x60)
+		return -ENODEV;
+
+	if (pci_enable_device(pci)) {
+		dev_err(&pci->dev, "pci_enable_device failed\n");
+		return -ENODEV;
+	}
+
+	ret = pci_request_regions(pci, "AMD ACP3x audio");
+	if (ret < 0) {
+		dev_err(&pci->dev, "pci_request_regions failed\n");
+		goto disable_pci;
+	}
+
+	adata = devm_kzalloc(&pci->dev, sizeof(struct acp6x_dev_data),
+			     GFP_KERNEL);
+	if (!adata) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+
+	addr = pci_resource_start(pci, 0);
+	adata->acp6x_base = devm_ioremap(&pci->dev, addr,
+					 pci_resource_len(pci, 0));
+	if (!adata->acp6x_base) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+	pci_set_master(pci);
+	pci_set_drvdata(pci, adata);
+	return 0;
+release_regions:
+	pci_release_regions(pci);
+disable_pci:
+	pci_disable_device(pci);
+
+	return ret;
+}
+
+static void snd_acp6x_remove(struct pci_dev *pci)
+{
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+}
+
+static const struct pci_device_id snd_acp6x_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
+	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
+	.class_mask = 0xffffff },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, snd_acp6x_ids);
+
+static struct pci_driver yc_acp6x_driver  = {
+	.name = KBUILD_MODNAME,
+	.id_table = snd_acp6x_ids,
+	.probe = snd_acp6x_probe,
+	.remove = snd_acp6x_remove,
+};
+
+module_pci_driver(yc_acp6x_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP Yellow Carp PCI driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1


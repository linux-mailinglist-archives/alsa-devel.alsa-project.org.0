Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9B431725
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 801081911;
	Mon, 18 Oct 2021 13:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 801081911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556229;
	bh=v+SEyzwsUerQcvQp0TyVJhq7vm+VF7muuybVv6SBzNM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sI3lIdd5HAARDmEEmMBn7q6E6QTYZnDgOtZ8HQTeK2959g8sWcoSDIBISRLAG/rDE
	 3vfkKDXlFvn/3UWkCONUChu5QA7FkfHDd1X6e/36Nrxq/WC0bT0ixFRQUov558bwel
	 0FsuuYSALOcHZsro1J6dgZaTPzFvDJJoOpuOulkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C01DF804EC;
	Mon, 18 Oct 2021 13:21:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F616F80507; Mon, 18 Oct 2021 13:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ADD5F804EC
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ADD5F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="gMIjGeSw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/Y64Y0OhZX6nrXNCAPRftHiDtaKrdTtPvivXMnJybt0oNGvAY4492n1WGG1cB3RLN/taDZnBIQChwf3B5l/9NNDozytJW5w0tyiFr3mNsqeXC5xVd8VRTMGkBM4XchT57aOg1ADMtsRKTr/8TpVxcA3gN6JMAdEquanfTrve5+AiXnUUXvlqeKHxCFEjHi5xDB0DOKg+JQB45y8fXfhvyRKPIjEMF4X1QXLS97625IsQAzqxs+0XakxHyPUAP0fW3JZBig0gEL7udTUIsZfs6GOjT5G0ovFIsasWqgw9ebMqK5zmX7trFGzrMgscQxyyP9AyJqlkC+bhaINcdEsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GPO1HonHgvWB4PtjPfhVKHiBtGS8nqeLLmS0KTwUmA=;
 b=SS6gGbolqXvpxLdZo/y9589cBul+E0IEycqdhlym1iBSNKTrbMcqBFwxQ1pTxYY6pfzoTcE5UTndg4ve7CjfSND9z6tYS9UEA5vlbEAuKBgqum58jFuZfoeh8ERc2UszcmkX9RPJZmhckMQHowq58iiPP6Tbdo4gWvHRDJglegz5EwDc6rSeow3yFBiURzfLnJtHsrmFS9wsCuk72oeNMA0Ft+9XZ3CQIx1uCjsIJr/FM/2EIKCwKuREPRAUma5F6eSK42eoxfZqspVs83BBfTyGHJ4+bbiFnDrhDQBvlQGUHXowszUIzLbvuZlFoC/PNWtEBVdX3NY+EjAV4EUNAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GPO1HonHgvWB4PtjPfhVKHiBtGS8nqeLLmS0KTwUmA=;
 b=gMIjGeSwM8GlrhutEMMqifFzu5nDr2DIE6ldnGpeBcmcFx4TX3mvW4Bphf7G8ZUaPRkQ5QSNHGrBvPRKCrgZDtyoq1qYzO80dWhIxb34DHHR19xCxoXuLdVkeSYFYoezK4EWl1G+mp1jxY6w28CmfHSF1xLAbs+KeAqIJVKkfgQ=
Received: from DM6PR07CA0079.namprd07.prod.outlook.com (2603:10b6:5:337::12)
 by DM6PR12MB4944.namprd12.prod.outlook.com (2603:10b6:5:1ba::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 11:21:44 +0000
Received: from DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::ba) by DM6PR07CA0079.outlook.office365.com
 (2603:10b6:5:337::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 11:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT008.mail.protection.outlook.com (10.13.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:21:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:21:44 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:21:40 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 02/13] ASoC: amd: add Yellow Carp ACP PCI driver
Date: Mon, 18 Oct 2021 16:50:33 +0530
Message-ID: <20211018112044.1705805-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d58e1e3c-3c43-4e3f-c49c-08d992297789
X-MS-TrafficTypeDiagnostic: DM6PR12MB4944:
X-Microsoft-Antispam-PRVS: <DM6PR12MB494400FED620A2C26914F68097BC9@DM6PR12MB4944.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2YpFP8U2J1rTympKA1CEUycH7J/PBuHu8isk0WjbBbZn1h7xQkE1T9rNlQw8I1shK0lcxnVYyPj0A4JYg5+FHFRVOx/OK/fiJs4/LHnDkTeKrRsMF7G9fkUTsHBUDBEn1i0a0ts66Rq611B4loFa4iHgariUA3wUIF48r14vzO2Qpv9ywH7x/U67Hy2H1wmfpW++1IZH51O5ybyTKz04nhf7Dgzei9S34OK9frPsfRRuR/E+ne8ebOQPZUGMQaSZYt/B44Wz8TQNObTVYnX0yywT9/QOQ6VhjMw8VBzjlZK3q0p5hZOVeQX50KsJPK2eTra461clnLOpIoPtqk77lMdm8f5APJnRqScZbBUZVm552XwIfFcMsEo0wfvjhNG2DR3+R5rSIKpuDW1hDm5vBE4IvITFGYar0u7qKcAUDacGadNisjW0WHc485bJE5QRrdiJwpxkNI92tSPWH1U/v4N22V5Cq16gKHn0Wp5EvSeFQwoiD4ap9unA0Ay7PvG7IOH/KmEZdCmwP7VyApuIIr4Bl53iFcRfkdiBF71C9FVTdfZZHAJ1PlR+cX8en6Hf0q76KzUXji6y28dIbiPM2QRdt1vMOLDVEhIRYGHE1Mp+ymyeuALQJeKNu44H04W8hsgp6+OSj1M/1e2zgK/OagKSvqNc2Nx1DLJAGOJUQfsIlFDMI/E1+uaHQaj6ro1fifyDPiGutsbctjQwYItg8ypDjNyH+eCd4TsUX0DA3KU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(47076005)(82310400003)(26005)(7696005)(186003)(6666004)(508600001)(110136005)(316002)(4326008)(356005)(86362001)(36860700001)(83380400001)(54906003)(336012)(2616005)(426003)(36756003)(2906002)(81166007)(8676002)(70586007)(1076003)(8936002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:21:44.5668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d58e1e3c-3c43-4e3f-c49c-08d992297789
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4944
Cc: Sunil-kumar.Dommati@amd.com, mlimonci@amd.com, richgong@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>
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
 sound/soc/amd/yc/pci-acp6x.c | 90 ++++++++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)
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
index 000000000000..5c118328ea21
--- /dev/null
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD Yellow Carp ACP PCI Driver
+ *
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ */
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


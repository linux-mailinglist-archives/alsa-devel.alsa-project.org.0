Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BA71D7FEF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320DE173E;
	Mon, 18 May 2020 19:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320DE173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822430;
	bh=D5fITKFJPeZ1X/nUvZ4QzICCBZRH2xmksfOJc4e/8Ps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KaTPQwppwYfBxGIhPyjCJ8GyTNo11F4zG+tOQuYA6SxebaD5GXfBh0Lrb7aC4KetB
	 S71yu3OHBZK3ZJCDrow2FecxRUzvuOioJ+Lgf6aVh7DpiEjV4tM9LSjXKv06NzfYSk
	 Twoo2jCRXq5CaKUdVtLQA5245ZYzCxVUAqL1GHqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54240F802A2;
	Mon, 18 May 2020 19:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2CF4F8028F; Mon, 18 May 2020 19:17:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1929CF80213
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1929CF80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="NF+VelGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as/h1RoK0/2YvHdsslsnNtgNCb1EQ4WU8ZTzRgcYzoEaFdTziwpfc4C+Qoa/OUG3QvoF/QQea7reuS27za1BYAWDKDIba7N/pbAAyIQkNvlPkGQPX9CH7jdyiPDljgNVxKAwFU5/XmBj0O3jBaFvZP/uD8EsHsDuWGob8kaXgrxOrV7jVaszDVmDuWDh6I+wRug7YneAthkNLk2Cn0j6Y4v/lJR8HmV3dfXvJUIVSFic+T6oU23noZ5ike4ZdqYm9X5fZKrQz2kdqtKd2bBixduUMqGe5rov2SEXkE7puB2ycfrfalskoNXABWV5ZhckkSbfRlUDvfpG1+I8+G+F+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ILbrMGK1uh6ddCrNvqjFtPFGhrkOgB4RQTK53ejcAA=;
 b=nN5gOO0DAo6YCrVZ0FR6bSl07B9qpoz3pbew0iIKAdpxkmY/iYYD6gnQbrRwzrrzZcuoXpx3dxAJ7dacrCB8TBioGJ9SwVrI4whDqdafBeUtS4OVud5xQDbiwdy+jjPjwbapM9vFt8uTTRwpo7zq00a2xN+YVdgDJZsApuwPdzXFa9RS76Ef49BEIeSLLsZynz05xQDgAlyqoXX6fP7eSEHohXiaUtscffUJlXqItb5tmobzRX8k5osWGX/O8AcZGhnoebMO5PPx1K4WncGUZT0B7Tp1yYiwItx68aaYnylt9UgBeTjNWcdwyHD9m+7UGre114f2//AhaWMk3TmdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ILbrMGK1uh6ddCrNvqjFtPFGhrkOgB4RQTK53ejcAA=;
 b=NF+VelGQQB3G0mqFw9xzLbOnog9sEDBY6JE8jlKF595ap0KIA0sP8nHS3odWUQzaiPzGCFULDPSVw3X8RdZtPQ5OusmFLHgfQXxq+zAwchRq45j3L49M/YwP/fw0I35dit/Je9SxBBOMP41qAGGBwzgYFAVWE1L/WHTkSeuCz0c=
Received: from DM5PR06CA0067.namprd06.prod.outlook.com (2603:10b6:3:37::29) by
 CH2PR12MB4183.namprd12.prod.outlook.com (2603:10b6:610:7a::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Mon, 18 May 2020 17:17:12 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::dd) by DM5PR06CA0067.outlook.office365.com
 (2603:10b6:3:37::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Mon, 18 May 2020 17:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:11 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:10 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:09 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 02/14] ASoC: amd: add Renoir ACP PCI driver
Date: Tue, 19 May 2020 01:16:52 +0800
Message-ID: <20200518171704.24999-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966005)(82740400003)(426003)(26005)(8936002)(7696005)(336012)(81166007)(2616005)(82310400002)(186003)(356005)(70586007)(8676002)(36756003)(70206006)(1076003)(2906002)(86362001)(4326008)(54906003)(110136005)(47076004)(316002)(478600001)(5660300002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05765971-a7a6-448f-7fbe-08d7fb4f4d77
X-MS-TrafficTypeDiagnostic: CH2PR12MB4183:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41833AB76267838C08D421D997B80@CH2PR12MB4183.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHL3naCt5yUdrWxpXQqYzf1mukAqcxNUHXMTWWdV316MKzl13z7KtITw/ThHkfeLHkspDlfvd+ECOGatxhRFR47iEuPqQfnWU988TC45h2r7k+51rpExKvJM4s1n88mviMfObPjJxbM7N4iqM3olcoDiddhX2K+I39o39fMWkkx74hKEAEys9LydxfmanahG7ZCLxkbLDn0uUkGMV3EDHnY5cR4k5D1IM115F1a3BmGhbZCferBZTieyPqAqVhmtOCeM5/Ev+ZWqH0ewiaL2W9nB41VUMVS//5FsEwMi21MvGNxhezbCEw0fndSnLbr9QAZ0qCi9COUVnTP6pEnzzvqh8VDfH3RMOLZUP3H/fBS6gyoPgzvY2zcsFjh5+IMs9BeaX2ffYgXyg0rPBlLH+xDR9OyIGcJGLULDnP82kSuklO6ZUxz9982oDKuEM0IKqmHrCs1q6QT1h8AB6nWw80FMcmYCyyGM267T1lDnaCpcV7oMJ5TWtlHjqDAi518YwiXzq3JKaqtgeYJbFoIZXA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:11.5900 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05765971-a7a6-448f-7fbe-08d7fb4f4d77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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
 sound/soc/amd/renoir/rn-pci-acp3x.c | 87 +++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h     | 21 +++++++
 2 files changed, 108 insertions(+)
 create mode 100644 sound/soc/amd/renoir/rn-pci-acp3x.c
 create mode 100644 sound/soc/amd/renoir/rn_acp3x.h

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
new file mode 100644
index 000000000000..56b76e355cd4
--- /dev/null
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD Renoir ACP PCI Driver
+//
+//Copyright 2020 Advanced Micro Devices, Inc.
+
+#include <linux/pci.h>
+#include <linux/module.h>
+#include <linux/io.h>
+
+#include "rn_acp3x.h"
+
+struct acp_dev_data {
+	void __iomem *acp_base;
+};
+
+static int snd_rn_acp_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
+{
+	struct acp_dev_data *adata;
+	int ret;
+	u32 addr;
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
+	adata = devm_kzalloc(&pci->dev, sizeof(struct acp_dev_data),
+			     GFP_KERNEL);
+	if (!adata) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+
+	addr = pci_resource_start(pci, 0);
+	adata->acp_base = devm_ioremap(&pci->dev, addr,
+				       pci_resource_len(pci, 0));
+	if (!adata->acp_base) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+	pci_set_master(pci);
+	pci_set_drvdata(pci, adata);
+	return 0;
+
+release_regions:
+	pci_release_regions(pci);
+disable_pci:
+	pci_disable_device(pci);
+
+	return ret;
+}
+
+static void snd_rn_acp_remove(struct pci_dev *pci)
+{
+	pci_disable_msi(pci);
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+}
+
+static const struct pci_device_id snd_rn_acp_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
+	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
+	.class_mask = 0xffffff },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, snd_rn_acp_ids);
+
+static struct pci_driver rn_acp_driver  = {
+	.name = KBUILD_MODNAME,
+	.id_table = snd_rn_acp_ids,
+	.probe = snd_rn_acp_probe,
+	.remove = snd_rn_acp_remove,
+};
+
+module_pci_driver(rn_acp_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP Renoir PCI driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
new file mode 100644
index 000000000000..da5715759646
--- /dev/null
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ALSA SoC PDM Driver
+ *
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ */
+
+#include "rn_chip_offset_byte.h"
+
+#define ACP_PHY_BASE_ADDRESS 0x1240000
+#define ACP_DEVICE_ID 0x15E2
+
+static inline u32 rn_readl(void __iomem *base_addr)
+{
+	return readl(base_addr - ACP_PHY_BASE_ADDRESS);
+}
+
+static inline void rn_writel(u32 val, void __iomem *base_addr)
+{
+	writel(val, base_addr - ACP_PHY_BASE_ADDRESS);
+}
-- 
2.26.2


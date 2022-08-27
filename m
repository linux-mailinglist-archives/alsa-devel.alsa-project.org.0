Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9D85A3902
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 19:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1861633;
	Sat, 27 Aug 2022 19:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1861633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661619670;
	bh=2RXDr0ZunB5nCKBEUDYtu79SXo+rBLl3X1ypa7NfPaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rAgPDKFwO4JeTBKkThvs7bQTTH8XRmPthE3dAAs2RMhDPs4yqbq3hzZBJlcNxysz6
	 3/3aeI4oGMSee+F4M33l07gSMUOVOtX7dQA9Thpk9Ejez2sHfH6pg3MfKh44eZYTvd
	 We3gMoZqwpDOAA6ND6eIFEAjyAKED3NOw3yp1JbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01BDBF8052F;
	Sat, 27 Aug 2022 18:59:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3073F8052F; Sat, 27 Aug 2022 18:59:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77C3BF80526
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 18:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C3BF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="YWjUOCt5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khFco4a3TdLTy8m/6bcNfsOlqu3M9iIPp8Z0oB0VFqGJmg7zRwKPHGZoAMCx2adfHEIRbCc7QdCmULyDsUxX0eD9lH3KsSECElwUoJluOR/vPGOfpIsdk3/r487EH1KINFoeiFlH9vcm6am2uRBifg52FalGmyb9rsrR8nLY21MlNoFm7X1uRsTELQ+/6VB3jhwIJJMh+8sntS8PR5wjmvqVJ1Dl3iobaNYtuq5qMm32XQr0PGSrbs+hVMJsV5V58kCT1Ya4IK3fIqL75a1WlDdD+r0PwmcdlS6H+5c0c5hbdqw4IcGNQvoZoVu2b2M4fBrcfeTWYsCQ0UI1ZIRMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIQsHVe3Bj4pPChcGCypFb8fZQB6b26eNL/2K5BLdjE=;
 b=HfrBhClEgpYdcI84neyHuJvmOc9GnhLh70inb2LojC6MZXSvIF6m5XAvKuYFi+JY7zQWReUXbd6IR8BylKbQKUjx/8ejwLxP5GBIKRRnUTBLf6SXuMAs+7+yo5CNJewpBk9OnvaK48KjkMhUwc5PDhMLoKmnNey48dXt1Y+DK9ozOL/DkM5mzjIWOmf6mQvjnG7gYq/YtRe5CBvuvPHskOPNyQnEDrqkZImx7/ohpmqVJkxncCK7/GnvRpJGQYoLHDM0mKLEX+sIeJjC+p7AZDy+i9aSbv11S4crW9creI/ROHDQ2Y2GDtzEm1tJYVNpMWUVtK4ZV/DsfxQlPwok2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIQsHVe3Bj4pPChcGCypFb8fZQB6b26eNL/2K5BLdjE=;
 b=YWjUOCt51cjbgx5+5I802+TsBN0U8///6V1glkqsDKakX+9PaoaDhXD3wYXbFnNB56PbMHhueK+pzF9EjDFy3D35GeWk/4oen9zd5I0N+8ZPf6TOFtsqBe8WCZtRA2F0yOJmwa2xPlXkmieVsO0JEoa4gFGTtMSjq8vDZOYCTk0=
Received: from DM5PR08CA0055.namprd08.prod.outlook.com (2603:10b6:4:60::44) by
 CH0PR12MB5140.namprd12.prod.outlook.com (2603:10b6:610:bf::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Sat, 27 Aug 2022 16:59:31 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::9f) by DM5PR08CA0055.outlook.office365.com
 (2603:10b6:4:60::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Sat, 27 Aug 2022 16:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Sat, 27 Aug 2022 16:59:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 11:59:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 11:59:30 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 27 Aug 2022 11:59:26 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 02/13] ASoC: amd: add Pink Sardine ACP PCI driver
Date: Sat, 27 Aug 2022 22:26:46 +0530
Message-ID: <20220827165657.2343818-3-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
References: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58409804-eda3-4af8-52b1-08da884d827b
X-MS-TrafficTypeDiagnostic: CH0PR12MB5140:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ee4hU6DXvDQii0xBKQ2au8gYS3sMecK0jQrQ9jNPBiLSB7AEvk59aOASKomMNmHOzuJ+HM38cFRuNYYB6BPJYo/XgzupyjdhNfvs6z2Oq6Ez6RQHCd73YKG9Z1kpX1JlTdePx5PFV+9SavEn5I3F2WB9GqoN/E1xAjmCEUhLWg2RC6jiKnvIsxGIT/LSTVJNGKLrlTbK3w3oFCJMBG8ekcdbbA4m5rQeWUYkgiUy0Qp1bI/9yMrvEKYIEMz3XbhRqeIWC6AoJHzjcy4ZVxwHYrXU5ymk3wykAopGkWpxA7g8QaBpa5D5aKhzvU2OBWlpwRTVN9KHyasj9Ysh/CvOPF/kxzSglTAS0regnjtvI6CZVA76VxaU/wcYeXM/b6Oe3GTvD4C84n8TZbpXNX84qbeadCc6uhO8gh5ZVv+v+mn7o8mkA8qWa5G+jq8m/Jpg4SWyN+V6YnLodtxDlZF+LBXaBqDRUkWVJ30JPVVMEbgg1V2pC5NbcTWW4UTRkjKeBdlxszQeBwpof50ogQ1xyTrI39Ldf59BGHk9+zwoRui03C4iuNdJfn0xBEsl07+YcsQdPeEosryPvLT25jtJq+NcV0VoEZBBlew+0UDrVG5g0XMOVeZ1m6cGgiWsII/oOVoqi+2Dsz0BxLgZGp1lUMTfR54KzTFt/eCr2reOaGFVGJlhpyA310Aroxl84QcRfCvMGRu90NWPquv4igVzRrvYTNjCZ3Q7cIpoKBye9lhnC7DTRSpQHhZ284SkikLZV+oKDRSFALZ9EH448xkap9vBzS5ibLctpYdv6jtwCQo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(7696005)(356005)(26005)(82310400005)(426003)(47076005)(2906002)(81166007)(83380400001)(54906003)(110136005)(82740400003)(36756003)(316002)(8676002)(4326008)(70586007)(70206006)(5660300002)(41300700001)(6666004)(8936002)(36860700001)(2616005)(186003)(1076003)(336012)(86362001)(478600001)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 16:59:30.8232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58409804-eda3-4af8-52b1-08da884d827b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5140
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, alexander.deucher@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
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
PCI resources for Pink Sardine Platform.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp62.h  | 20 +++++++++
 sound/soc/amd/ps/pci-ps.c | 94 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 sound/soc/amd/ps/acp62.h
 create mode 100644 sound/soc/amd/ps/pci-ps.c

diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
new file mode 100644
index 000000000000..5291585f45f9
--- /dev/null
+++ b/sound/soc/amd/ps/acp62.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ALSA SoC PDM Driver
+ *
+ * Copyright (C) 2022 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <sound/acp62_chip_offset_byte.h>
+
+#define ACP_DEVICE_ID 0x15E2
+
+static inline u32 acp62_readl(void __iomem *base_addr)
+{
+	return readl(base_addr);
+}
+
+static inline void acp62_writel(u32 val, void __iomem *base_addr)
+{
+	writel(val, base_addr);
+}
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
new file mode 100644
index 000000000000..8bb33845622a
--- /dev/null
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD Pink Sardine ACP PCI Driver
+ *
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/pci.h>
+#include <linux/module.h>
+#include <linux/io.h>
+
+#include "acp62.h"
+
+struct acp62_dev_data {
+	void __iomem *acp62_base;
+};
+
+static int snd_acp62_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
+{
+	struct acp62_dev_data *adata;
+	u32 addr;
+	int ret;
+
+	/* Pink Sardine device check */
+	switch (pci->revision) {
+	case 0x63:
+		break;
+	default:
+		dev_dbg(&pci->dev, "acp62 pci device not found\n");
+		return -ENODEV;
+	}
+	if (pci_enable_device(pci)) {
+		dev_err(&pci->dev, "pci_enable_device failed\n");
+		return -ENODEV;
+	}
+
+	ret = pci_request_regions(pci, "AMD ACP6.2 audio");
+	if (ret < 0) {
+		dev_err(&pci->dev, "pci_request_regions failed\n");
+		goto disable_pci;
+	}
+	adata = devm_kzalloc(&pci->dev, sizeof(struct acp62_dev_data),
+			     GFP_KERNEL);
+	if (!adata) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+
+	addr = pci_resource_start(pci, 0);
+	adata->acp62_base = devm_ioremap(&pci->dev, addr,
+					 pci_resource_len(pci, 0));
+	if (!adata->acp62_base) {
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
+static void snd_acp62_remove(struct pci_dev *pci)
+{
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+}
+
+static const struct pci_device_id snd_acp62_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
+	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
+	.class_mask = 0xffffff },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, snd_acp62_ids);
+
+static struct pci_driver ps_acp62_driver  = {
+	.name = KBUILD_MODNAME,
+	.id_table = snd_acp62_ids,
+	.probe = snd_acp62_probe,
+	.remove = snd_acp62_remove,
+};
+
+module_pci_driver(ps_acp62_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_AUTHOR("Syed.SabaKareem@amd.com");
+MODULE_DESCRIPTION("AMD ACP Pink Sardine PCI driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1


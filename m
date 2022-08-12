Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E1E59108B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 14:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA081851;
	Fri, 12 Aug 2022 14:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA081851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660306273;
	bh=R02pLmXIQS8Fdur6KcvssvNNJ25L7nVh4xNTfQTImuM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gEgtsIaqSp8fkUisdHxrZecVzlo8XE3V47OM5UqMxqPbb3Eag0Kit8AKidbU6+9e2
	 qOtSnhqs+ZwnSJ7u4S+CV+u20yHMVlBAwLnATVtDf8WoKYQzNrCOV0JkznETjpxMAA
	 Qlg8o1v9SZH4VlcnyB+qXCY8/Z7OFizs9tyymxMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3AAF8054A;
	Fri, 12 Aug 2022 14:09:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B2F4F8014B; Fri, 12 Aug 2022 14:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72FE3F80517
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 14:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72FE3F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="p0ZJlSMd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtaiFBJ+IbZhOfRp2/ffUEhFdMshFFAftlWvAItpwhI3Gw/6MV2c7ymaOnmuyieb1XmHBmSl8DRh7akaLxV/3NglpJkHHo3ZFbJQ7nBp8Ufc6aOTfeOfbJfVwt105WuQRtuLXXFtla6Ff/R7OJm3K2QzK6BHi3m134SHG1lLdnheRA/r8DIS4io8xLRj8rRmdpdCU7WSr2OfV5hBKPaevt9zHonn3uexeUOCS3HfMMX8FUNhJWkqNlorBAs2DBBWZIl6B3U83qXAtU44wzAa7BqzjxE8FAUPji839Z6MHbv/7rPB2n1looSHQ9pcb4FtQtAUQZTChAEhDXkqYnc4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRClgGxhbtF/EU45Nmf+hQ+dQdRLVUT4Qt9RBbkptBs=;
 b=fvAueMmrtCeIlbVRFMEG5KZX0oPbzLrcN/VUx/Ek03slH5A1drCxHbWE8QEzX2ufcGG8kSSSQE3iYcYMj6hHUM4dqWUy78eofZyhNylKxFL5TH8LdlRqCGWP/UXykPp4GigSjBzu/vAR3zEeSdZDfxoBGrRj579EyIzMrjW2TcXsKq2HCj8yDIxils4/v/iozzBKonIDsGpdLdoER6eq3gPaUVVxc6sfOAcC0einH8hP89AuMLl8wfQa8Vl64muJ6kwWZ3840Pm7OBo7prekGmDNCLSCMsVIC8zenhszQyu80DtDTdRjDj6eMfAv2LhQl/ZpRFXJ2xE1hf6V2Rrm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRClgGxhbtF/EU45Nmf+hQ+dQdRLVUT4Qt9RBbkptBs=;
 b=p0ZJlSMdNIseGJds8jcZVU55oLSvQ3heF+oc7T301/tVkrxJ2P3tnW7P/gqQZaZo9/Mu392iNeBAROlZWfF8Jg3MnxUBH4x7z23h6erCJvXuiQQHfqf0Y/D21ZMIAni58NTMwvI4VylyT5+3XqUwUEr+SK6JloNYMkQFkV/I0HU=
Received: from DS7PR03CA0236.namprd03.prod.outlook.com (2603:10b6:5:3ba::31)
 by SN6PR12MB2624.namprd12.prod.outlook.com (2603:10b6:805:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 12 Aug
 2022 12:09:46 +0000
Received: from DM6NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::1d) by DS7PR03CA0236.outlook.office365.com
 (2603:10b6:5:3ba::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10 via Frontend
 Transport; Fri, 12 Aug 2022 12:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT112.mail.protection.outlook.com (10.13.173.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 12 Aug 2022 12:09:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 07:09:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 07:09:32 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 12 Aug 2022 07:09:29 -0500
From: Syed Saba kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 02/13] ASoC: amd: add Pink Sardine ACP PCI driver
Date: Fri, 12 Aug 2022 17:37:20 +0530
Message-ID: <20220812120731.788052-3-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21855f23-df66-4b59-ae15-08da7c5b8c39
X-MS-TrafficTypeDiagnostic: SN6PR12MB2624:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOPx95FJDIYcx1re3iciPCAfs8oWNispzrrkCtm4wqFXd20LviY1dAp+6RoaFg2Y6oJPGwK6guV2Eon/8/cWXfPYPhXChExdgRdt8Y15UhMQpcyq7LXZccv441lhDu8UTkuJz9FXi9IozqVuVE8a7JISGaBIuwYEKPlXisAte+lD3eWOYmywOeX5K1DA6YWZ8JFdYUeqdAFgmQhCaxjHffUvhCETmELg5UhTHOp0nZsruGn274rHTwkZiKPTtZe1jInLXATZweIN61zRJBAZxtYxhqiOFDNvCtaBYSFhFEsJgJ3HIk5HNvcyhCSnOeLCGzT1O13AVZ5tLqYbrc5CwaAKI+cieIrLhISnpPhPiCFHThpHeIiptXMlrpYMjxX4mYI932Z8gCAGZY7WiKIjtfMtYA8XR4qstYvhQqhj489dAyxo927HKtgkGOMP0lKC08uAOSwth+scg5SAZW+zDtHB0hhtprzsAaTniG94HF9PFVyw5AlO7WY/Qlte6X+kLttNCCCe4pCD+IPTVl8Rgu1aDPCxrOceSxK2jeB8KH40RX6O4BYQOLzmPFTqWEOBVV/daNwLY0T5dl1tkT1pe/ncmPNWvoTtNiireECRLIjrKaZc+28WavYpWc0OmdXHPS9Z6+izEZXi3qbc0ifOdoOA0PH0vxCKKqyQy/f5JUE4sL17Y9yLPiZ0sEUok14/n+cc7Jx0bmQQIT/Kkcn2kDOqqeQK5dk2UOscV5oaS0vI1cWST/bFFLOdO0F98f/xj0bWBsAzgMgselItpfH4IDFLkXb5SLTSraH4HeS2S0BYZvPlA+uAJZiKhH+48o/cEcUlXM5awprdTQM+/Pi4pg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966006)(40470700004)(36840700001)(83380400001)(36860700001)(356005)(40460700003)(81166007)(86362001)(82740400003)(70586007)(8676002)(4326008)(70206006)(110136005)(2906002)(54906003)(8936002)(5660300002)(316002)(26005)(82310400005)(7696005)(426003)(47076005)(336012)(1076003)(186003)(2616005)(41300700001)(6666004)(478600001)(40480700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 12:09:46.1867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21855f23-df66-4b59-ae15-08da7c5b8c39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2624
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, Syed Saba kareem <Syed.SabaKareem@amd.com>
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
 sound/soc/amd/ps/acp62.h  | 21 +++++++++
 sound/soc/amd/ps/pci-ps.c | 94 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 sound/soc/amd/ps/acp62.h
 create mode 100644 sound/soc/amd/ps/pci-ps.c

diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
new file mode 100644
index 000000000000..e91762240c93
--- /dev/null
+++ b/sound/soc/amd/ps/acp62.h
@@ -0,0 +1,21 @@
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
+#define ACP62_PHY_BASE_ADDRESS 0x1240000
+
+static inline u32 acp62_readl(void __iomem *base_addr)
+{
+	return readl(base_addr - ACP62_PHY_BASE_ADDRESS);
+}
+
+static inline void acp62_writel(u32 val, void __iomem *base_addr)
+{
+	writel(val, base_addr - ACP62_PHY_BASE_ADDRESS);
+}
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
new file mode 100644
index 000000000000..25169797275c
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
+		adata = devm_kzalloc(&pci->dev, sizeof(struct acp62_dev_data),
+				     GFP_KERNEL);
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


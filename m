Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB39F3BE2B4
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D3169F6;
	Wed,  7 Jul 2021 07:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D3169F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636472;
	bh=pYbgNPKbgf0QUB/Wp2FB3xlpLoTNjjfAVIdoYB4avGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eVvFBUoR6XhZ4YlcgHGwbUxkkglnNNMiNxz0zt+Mhr/joKzU+L6mA7oGLOD30ODc+
	 gswhkF2jaUUt6fBWMYMWC9k4wZu6aXj97qSVuTSvojKQ1OOqPU6GD3kmq4tXgIz0eA
	 Fe5r06caaHfm1Xdp9oFadPVp40bUgaEyWabRmK2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CFE7F804E0;
	Wed,  7 Jul 2021 07:39:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE99AF80302; Wed,  7 Jul 2021 07:39:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 319C5F8016C
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 319C5F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="nShwStSa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9DRrC5GQgoc4L2u5ddobVwPeltB/HFa9C3jXghxMiGZHG3gqY4hGjALhhbBWbekxYlWN1urHwa/RUcrhiBqIS454tKogPzzSZditWoDmerBA7xHHpM5k09pc4IfGzIJ2sMgC7S5/zAH2Q4b90TTAhQB/eqt87YeDFJLrH0SnDVjFAM9D0RNihwg/BTfFoBNzqjIxSz1CKLo+76j1fIfzclVk49RKR4C5hUI384s8UxeYLNsG3GxSRRjJdi3Mlt+MoIeXkRYGU38z1Lz+WMAHQ7D7PCCJqeKZGrRY3gYk1xELtCCZopDCqQjLa5+Dt9meoh0lx1T2DO5qUKNBbSK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU2mKuwQXdBVos+DMKe46QGy6YeizEUhYmEPIaBZrQk=;
 b=a5B196IywyJA2XtZWRXWaS69T5GpJQZRgfFE7+cTpavBGnv3stSSuZQtpj3WKmZFCILNUg89damfBiBUHxkGWDMegWKYn4dOox4mFV1HuGf6VXD5A+hJFOvWDuqZb0xTk4PhH3KbL/yZdEIl1I/IrA7fc5MtizjIsdrqQs/34B/lMzNc7BTf/jjfcsbhXUZKNMjv/t8Lsa1D+Vi0QMg0KdwmP258ahIxnHeIOBOLp+gfDMTKnxtsybwoR3YPAehXElrt4dWS5TV6i0Nl2MFoEsVHtza6D4WVhIT3y9LxlKM8z/cIvMNh4SqdvktSwov/YSD6OY485s9zt1we1zWvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU2mKuwQXdBVos+DMKe46QGy6YeizEUhYmEPIaBZrQk=;
 b=nShwStSayvuI8M4B3+XBzs/vcEjjR3ZB2rRHT98+QwyByXiyQMdOOKEDVYfkg18RA1fvQooy9djx5E68Agpccn1tZT5RNzJP2kfeAbuyWibZFi2rol/xeHcPV6I25+BHk3Jd9lB5j8wwMpSgzYuEpBqrarLTPdTz2HQGTdniXvk=
Received: from BN6PR2001CA0004.namprd20.prod.outlook.com
 (2603:10b6:404:b4::14) by MW2PR12MB2508.namprd12.prod.outlook.com
 (2603:10b6:907:9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 05:39:43 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:b4:cafe::79) by BN6PR2001CA0004.outlook.office365.com
 (2603:10b6:404:b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Wed, 7 Jul 2021 05:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 05:39:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:39:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 6 Jul 2021
 22:39:42 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:39:31 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 02/12] ASoC: amd: add Vangogh ACP PCI driver
Date: Wed, 7 Jul 2021 11:26:13 +0530
Message-ID: <20210707055623.27371-3-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d450bc19-5aff-427e-f37c-08d941099f70
X-MS-TrafficTypeDiagnostic: MW2PR12MB2508:
X-Microsoft-Antispam-PRVS: <MW2PR12MB25082892F39062D8F7F04D93971A9@MW2PR12MB2508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x5Kh53vbvbp3FrAW9an8SqMRkVQMGeBIwhcYbfIHpwuQ22KWP6ukZcjCZt9rXTrTXowWcTGSAURRB58Iwg5sKAl2FK2MkRwoan/cfT6jQxfvxsoaDrZJM4KI/0D0Kh+Y4w4iChKZI6vcYsFxhfijlYVuhaSfWz5CEB1KFKFbm7NcLyjdZHvrLLrXu5UJd8XW3U0TMiWqtgs2GHE9KmLcjQyJUvXQN40ihJOYoreJTCT1Nmd9/wGW0SPhpMExp4co2m8PGU/hh8kS6qqnel4yYNf4qjUKggWSwSlhTTxGSVJ8ZykJ0WN2Mn3zUISRNPPL4T9S871RIk+QHXHG0BuBLxujNq82+RlhkqDmLaRYPi+9fepNt67lbbvYhw6bFcFC3KBri9FuYrSMWOVkaYzCv0WSERg1gwFmrZjT4hg/Rj9Gfmt28bgVS1PXwVohShwNbFYhvrHv3Bx44fnI7/qD5JoJ0h7oqn2XaKetKBujLphT/AdeiYbkn+MSgztfoglrMPO6h3nAc8m6g7O7P2IZvxx/lEwjfwFJLMVi3nv1aDpP0+w6Pt+sd5P4PMigsLqzomyZ8WNGNaEcPPDDTJhlkEElaHNvgG3WIghRmHZxRoqRJxRZYUQzYJux9frAGFTXey48wV/xquG9ce+1SsH9Zf9u7X1Y2ycI5xSACvhla1G0z/ib24YBBiKO42xsTLbrIJTroAEfF3z9K3CkY+9FlxLtkCmee9YCj6ieqy29TCw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(47076005)(110136005)(316002)(44832011)(5660300002)(36756003)(356005)(82310400003)(82740400003)(36860700001)(83380400001)(81166007)(86362001)(2616005)(1076003)(6666004)(54906003)(478600001)(70586007)(4326008)(426003)(26005)(186003)(2906002)(70206006)(336012)(8936002)(8676002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:39:43.4586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d450bc19-5aff-427e-f37c-08d941099f70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2508
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <vijendar.mukunda@amd.com>, Alexander.Deucher@amd.com
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

ACP is a PCI audio device.
This patch adds PCI driver to bind to this device and get
PCI resources.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x.h     | 21 ++++++++
 sound/soc/amd/vangogh/pci-acp5x.c | 87 +++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/acp5x.h
 create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
new file mode 100644
index 000000000000..a5e7f7cb65a1
--- /dev/null
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ALSA SoC PCM Driver
+ *
+ * Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include "vg_chip_offset_byte.h"
+
+#define ACP5x_PHY_BASE_ADDRESS 0x1240000
+#define ACP_DEVICE_ID 0x15E2
+
+static inline u32 acp_readl(void __iomem *base_addr)
+{
+	return readl(base_addr - ACP5x_PHY_BASE_ADDRESS);
+}
+
+static inline void acp_writel(u32 val, void __iomem *base_addr)
+{
+	writel(val, base_addr - ACP5x_PHY_BASE_ADDRESS);
+}
diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
new file mode 100644
index 000000000000..e56d060a5cb9
--- /dev/null
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD Vangogh ACP PCI Driver
+//
+// Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
+
+#include <linux/pci.h>
+#include <linux/module.h>
+#include <linux/io.h>
+
+#include "acp5x.h"
+
+struct acp5x_dev_data {
+	void __iomem *acp5x_base;
+};
+
+static int snd_acp5x_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
+{
+	struct acp5x_dev_data *adata;
+	int ret;
+	u32 addr;
+
+	if (pci->revision != 0x50)
+		return -ENODEV;
+
+	if (pci_enable_device(pci)) {
+		dev_err(&pci->dev, "pci_enable_device failed\n");
+		return -ENODEV;
+	}
+
+	ret = pci_request_regions(pci, "AMD ACP5x audio");
+	if (ret < 0) {
+		dev_err(&pci->dev, "pci_request_regions failed\n");
+		goto disable_pci;
+	}
+
+	adata = devm_kzalloc(&pci->dev, sizeof(struct acp5x_dev_data),
+			     GFP_KERNEL);
+	if (!adata) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+	addr = pci_resource_start(pci, 0);
+	adata->acp5x_base = devm_ioremap(&pci->dev, addr,
+					 pci_resource_len(pci, 0));
+	if (!adata->acp5x_base) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+	pci_set_master(pci);
+	pci_set_drvdata(pci, adata);
+
+release_regions:
+	pci_release_regions(pci);
+disable_pci:
+	pci_disable_device(pci);
+
+	return ret;
+}
+
+static void snd_acp5x_remove(struct pci_dev *pci)
+{
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+}
+
+static const struct pci_device_id snd_acp5x_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
+	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
+	.class_mask = 0xffffff },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, snd_acp5x_ids);
+
+static struct pci_driver acp5x_driver  = {
+	.name = KBUILD_MODNAME,
+	.id_table = snd_acp5x_ids,
+	.probe = snd_acp5x_probe,
+	.remove = snd_acp5x_remove,
+};
+
+module_pci_driver(acp5x_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD Vangogh ACP PCI driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1


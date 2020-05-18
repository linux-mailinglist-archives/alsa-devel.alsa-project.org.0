Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B369A1D7FF8
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68BCA1756;
	Mon, 18 May 2020 19:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68BCA1756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822488;
	bh=XXCnLF1cNCGpEN3F+7JZigjD98xMguZnUE+XGV0qCI8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VMXsIpqlRkQOaqmkcjSTzMjaEooGa7McA8Ijk7303tBATVx31cD2MvHcLcotRMIbm
	 WoN5kaplbgnlCphJj4j90rmmqwNRuTm8Uc+Uul+cUIq3amwNTr+jOJMQIqPaPoiE51
	 9RAGh07Pog7vAfpdNtXuY1+LCpf+yQptMdYe0OZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F529F802C4;
	Mon, 18 May 2020 19:17:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91F84F802A7; Mon, 18 May 2020 19:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1615EF800C9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1615EF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="3dcaz19a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=If265OWmTSCmXNKI058L7kRGaxrMi9fneucUNEsDj5MiKF6X4rxudwzYfieDqnsUe1n5rJM5asYfzB3AVb7MPMFGiZsuicsNRVqB+cAbWtWZJWpRVLCniKwbsx25Jx5FZzPSxFL3GRx2WWX+U88Dkxm/St6AmZPYE8jv4GCF37enTriK/Iq3X1T8W75G6gRcHsuEA8p04M8iHsCMwsLEuo0F/4NyTmLX9HZzhC5oIossEbypGaN2qhMDWMqlAGD/hW5ZTr2I5gRn/YiaNeZqjIcqIQ+m2SvcpjS5qHokSnVFiuQ80kxsxb3uACI4+hS6Id2uAHF+pL12xU13GieI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tm4oFJ3XO2ZZTSDCdwax0pIwSrzNci+VwHVjafDfUM=;
 b=JF7/im9AIQEeWiNPBUI+WD6DkT5P5zF+8AZ7ZvA18Am5FeE66D4JCqxDmk4HVjsmr3yukJju4cPrjPi5t4HHvQRwq72XzDGILgLxNIFJ9WSJHPof23a1PQKBvsBF8pqjC/L8mKj5thSKDNEHRm7yfovqeEiv0IuuSbuPmbNCGWoGgeen/W8EsB5qpyyLzOj99gNdvuq9ascafMxvnfCvc+WUIIuKT61cJLrgNBb9xMO0Ccwkaqa47FYet4IZy/ZVnGzh/tX4ahECZAfKeWo4shu2FZH1Wx6/xgCEUxbrM9X6hKOY2j4+2Dxs+KoHc2DVfyX7qlJKmdVdzbXJr0DjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tm4oFJ3XO2ZZTSDCdwax0pIwSrzNci+VwHVjafDfUM=;
 b=3dcaz19auKyads/nhBITAXJWfTSzyuAQkTg3/4ct1UA4j7TgRSINpLOionTUye9dXfyLxPvON0lIwKYikBq7UckvRfXQatVksHVAmLveDTEbKelp98I+2C1U1XLVAvm7Y5EYk3AWas4PWmEVKJ+6UFmQbv8RjC9hleKYp/GJYnA=
Received: from MWHPR18CA0027.namprd18.prod.outlook.com (2603:10b6:320:31::13)
 by SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Mon, 18 May
 2020 17:17:15 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::84) by MWHPR18CA0027.outlook.office365.com
 (2603:10b6:320:31::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Mon, 18 May 2020 17:17:15 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:14 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:14 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:13 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 04/14] ASoC: amd: create acp3x pdm platform device
Date: Tue, 19 May 2020 01:16:54 +0800
Message-ID: <20200518171704.24999-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(6666004)(5660300002)(2616005)(82310400002)(478600001)(356005)(81166007)(110136005)(54906003)(186003)(316002)(426003)(7696005)(26005)(336012)(86362001)(47076004)(8936002)(2906002)(82740400003)(1076003)(4326008)(36756003)(8676002)(70206006)(70586007)(42413003)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbadeb54-e995-4c5c-fe41-08d7fb4f4f98
X-MS-TrafficTypeDiagnostic: SN6PR12MB2800:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2800CA67CF743315BB86F5C597B80@SN6PR12MB2800.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TlnzEuSehxb0iwFu9THEphcvdjpUKB9+qOnZTsDCnbscZgboE9hcM8GGM0CNk6iuZ0NiLZR3ZWra4hR8dGEqMALJQqy1iSSKhHaL89YCHPaaoiJaGWeNAjo74HtUwihZqXgS2PbWHtKk8fFdjeDex0s5ch7sQo2KQdVsDDKhkrxdDncgTqm5FnVZrmzGchReu+zDSAg4LQwWjpp3xyWC7tjGzgEbVSOlXSAG1ssPj2z6nMDf1sQNxXE3nPJhsVj90tISAjr1xrxULfFX88JkDlEchW+bG8Aqc9kxO0248045pR9KGoa2U53GWxYzVlTRag2oRePkVSB2DY5eruAx/FIuVMBAOSg58khd/T00RJQD8PNwzty2WMO8otJNTF24A/nPh9AvTxPSZRjOfTHLvWcNH7sKOC197d1JtfNbndkrQlPAmVbGuE37t1ybWyhberuU78LgpO+Jb0P1YteYXAjQVVi12O1NOYenXodLQB/etKxPsfB3gPoIxZe75aNsC3RyhDUKbJHSMX1xiz1jaHjqLGNVyb/j1kkq+isTJX4XAydn4GR1ufXpc03Xmqms
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:15.1010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbadeb54-e995-4c5c-fe41-08d7fb4f4f98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2800
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

ACP 3x IP has PDM decoder as one of IP blocks.
Create a platform device for it, so that the PDM platform driver
can be bound to this device.
Pass PCI resources like MMIO, irq to this platform device.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 61 ++++++++++++++++++++++++++++-
 sound/soc/amd/renoir/rn_acp3x.h     |  3 ++
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 429813f6ba1c..362409ef0d85 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -8,6 +8,8 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
 
 #include "rn_acp3x.h"
 
@@ -17,6 +19,8 @@ MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
 
 struct acp_dev_data {
 	void __iomem *acp_base;
+	struct resource *res;
+	struct platform_device *pdev;
 };
 
 static int rn_acp_power_on(void __iomem *acp_base)
@@ -151,6 +155,8 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 			    const struct pci_device_id *pci_id)
 {
 	struct acp_dev_data *adata;
+	struct platform_device_info pdevinfo;
+	unsigned int irqflags;
 	int ret;
 	u32 addr;
 
@@ -172,20 +178,70 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 		goto release_regions;
 	}
 
+	/* check for msi interrupt support */
+	ret = pci_enable_msi(pci);
+	if (ret)
+		/* msi is not enabled */
+		irqflags = IRQF_SHARED;
+	else
+		/* msi is enabled */
+		irqflags = 0;
+
 	addr = pci_resource_start(pci, 0);
 	adata->acp_base = devm_ioremap(&pci->dev, addr,
 				       pci_resource_len(pci, 0));
 	if (!adata->acp_base) {
 		ret = -ENOMEM;
-		goto release_regions;
+		goto disable_msi;
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	ret = rn_acp_init(adata->acp_base);
 	if (ret)
-		goto release_regions;
+		goto disable_msi;
+
+	adata->res = devm_kzalloc(&pci->dev,
+				  sizeof(struct resource) * 2,
+				  GFP_KERNEL);
+	if (!adata->res) {
+		ret = -ENOMEM;
+		goto de_init;
+	}
+
+	adata->res[0].name = "acp_pdm_iomem";
+	adata->res[0].flags = IORESOURCE_MEM;
+	adata->res[0].start = addr;
+	adata->res[0].end = addr + (ACP_REG_END - ACP_REG_START);
+	adata->res[1].name = "acp_pdm_irq";
+	adata->res[1].flags = IORESOURCE_IRQ;
+	adata->res[1].start = pci->irq;
+	adata->res[1].end = pci->irq;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	pdevinfo.name = "acp_rn_pdm_dma";
+	pdevinfo.id = 0;
+	pdevinfo.parent = &pci->dev;
+	pdevinfo.num_res = 2;
+	pdevinfo.res = adata->res;
+	pdevinfo.data = &irqflags;
+	pdevinfo.size_data = sizeof(irqflags);
+
+	adata->pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(adata->pdev)) {
+		dev_err(&pci->dev, "cannot register %s device\n",
+			pdevinfo.name);
+		ret = PTR_ERR(adata->pdev);
+		goto unregister_devs;
+	}
 	return 0;
 
+unregister_devs:
+	platform_device_unregister(adata->pdev);
+de_init:
+	if (rn_acp_deinit(adata->acp_base))
+		dev_err(&pci->dev, "ACP de-init failed\n");
+disable_msi:
+	pci_disable_msi(pci);
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -200,6 +256,7 @@ static void snd_rn_acp_remove(struct pci_dev *pci)
 	int ret;
 
 	adata = pci_get_drvdata(pci);
+	platform_device_unregister(adata->pdev);
 	ret = rn_acp_deinit(adata->acp_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index ec2a85085163..5e4fd99397d5 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -8,6 +8,9 @@
 #include "rn_chip_offset_byte.h"
 
 #define ACP_PHY_BASE_ADDRESS 0x1240000
+#define	ACP_REG_START	0x1240000
+#define	ACP_REG_END	0x1250200
+
 #define ACP_DEVICE_ID 0x15E2
 #define ACP_POWER_ON 0x00
 #define ACP_POWER_ON_IN_PROGRESS 0x01
-- 
2.26.2


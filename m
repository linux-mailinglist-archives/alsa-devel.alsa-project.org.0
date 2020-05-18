Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F61D800C
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044841776;
	Mon, 18 May 2020 19:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044841776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822806;
	bh=nSMzMtfH9razOAFGUdZ2AeDzZNlloSe+ZS0Vwbgf3Wg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aGUYajpQlwwKVvqsZgtfqth1St3iaMlba00dDnmY4taWA50T/ptL0k6ZEP5n1AZOI
	 2G/eQBDAVUqpAkTuHPr5kg56i8fwqwsiomPW6n2BI365WQ76mj2K2/fy4Ja5GXxZR5
	 jgIS2F26qso069pkdFRb4lxTUCouGmLvLdchezpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFAC1F80340;
	Mon, 18 May 2020 19:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D195F802FB; Mon, 18 May 2020 19:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E3B5F8028E
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E3B5F8028E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="4XaHGZQU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvBYC92qnqoWmlEq2lG6R7HgRfSOlrKlgL/FxNlWkSJubs8M14d/tI9aXg2c9O+SQwnE+1CIoJBobJA5o8B2P2iffhoD/g4R/e0IXcYzqltS/ZThc/boekklQ3BcaT94jsParIuwPfEq0OULO2d3JXWcsf7pL5AlqHbYdSVNbg9OrOVEyDkKoxl2knPNiLSKDKBbQLeJgxOMFUB+IkA1ZZqoc6FGsez+5Ji1SBn/2dJpGBFzSqw8beJq5bdVp/KWrmUzSDRy8yoripcwx71RrNIWfHtxOmbtJLl852Wi4/E+tiqdoGppKEq5kIflcTcCLn+VGqg8X0p0k8fTzVbx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc4f2MMr82xbcpSzOdH/z7PlpBGrO1vetbm1NCQZzhw=;
 b=TQIPUGXRvbVLqjYyaJaLK+UZk0zsiB6RcTJoeCVz7hK8q9At2NdECZvWDLmA3wwqBsPxkTYD3Fy+8eB1O8iRZfMs9seQitFGlcE+RPW/TfS3EmMnW+iVjCFqXdQfoHInd6piYC22SU1KFrKWbxaGhrj7d8ETHIFzPd+YfxjxjotpuBTO/qb9Cl/sEhUo/wFgWhXLgjwGe0/YzdQK2yQCeo450oMrrewCNoQcnCIIxo7RTpHt9a8nrBQPD9bboPPtnHuQQLKMXO+WZSkYbU1vpaf9JmjR8a7KNYTYuC5nVDofMpc/UbGTtvWx/XhdMsxWsDcwt+OrHGY+zO2Sk1wv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc4f2MMr82xbcpSzOdH/z7PlpBGrO1vetbm1NCQZzhw=;
 b=4XaHGZQUm8ly5mOpZBUlvqWg4lPJIYcGRL+Pb7KHxuN0QHuDRuvQYmcr1w+QptCoqbuvDthLbylQwYGWRPdP8WsirDpuikk/KLhHA9ikPWHSxV3lXqA5tB/mSmjejZ0nzKO2cXCL+NuxcrI5tl9NxP/j/7iYCnCazwyDsWlFwCg=
Received: from MWHPR11CA0021.namprd11.prod.outlook.com (2603:10b6:301:1::31)
 by BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Mon, 18 May
 2020 17:17:31 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::56) by MWHPR11CA0021.outlook.office365.com
 (2603:10b6:301:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Mon, 18 May 2020 17:17:31 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:30 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:29 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:27 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 12/14] ASoC: amd: create platform devices for Renoir
Date: Tue, 19 May 2020 01:17:02 +0800
Message-ID: <20200518171704.24999-13-Vijendar.Mukunda@amd.com>
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
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966005)(8936002)(2616005)(82310400002)(316002)(426003)(356005)(54906003)(2906002)(7696005)(86362001)(110136005)(8676002)(336012)(81166007)(70586007)(186003)(82740400003)(6666004)(70206006)(47076004)(26005)(36756003)(1076003)(478600001)(5660300002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899e4ee5-03ee-4eca-fcf0-08d7fb4f589a
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:
X-Microsoft-Antispam-PRVS: <BYAPR12MB271063DE48A6943A9639873C97B80@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:86;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKvCVZixQ5cyP0UHXQTqpv6tWUFxZ1cIjjuwRAYFx6wqcOoZ/FOov78paFSRn9JGHDK0EQ9m05MsqLRGMJZa1W3dyASDMUbmJRh32xTU1Ofa04f0nE5Osslnln72RbhY/K5ph5aRQOWdYMd8TIFk6NCewUO/uNqD+RwiGv2uAzzuAZncnfo4lcakaECMnqqFGJ/lLHyMEdbFcV6yxv4Gc8js49saxctLTEmvi4wtIzCHmwobqmCFmqvL47Jy8qB4GFaU7rkGZiINaLuGfcVclKVr4RlRNoWIig4eK1CvebDlJqrsqUob44mRVJZswYabQpUHP5lJ7cQ0JKYkuHmpJjAZsLK6ALAtwuhfRBWxqfSgtHEgWPVEqRo7hyQtom2mvhRuuwUkJNgWVTeGh8ZDPTyff4susZ1Fy8JT5r+iSH2POQLYCo2vtk0VKe03ib1JG0O9XIxwrwMh4e5c1vPancJrz+WUXlBqjKJcVyn6UjHhY5Uz2cqYYpz1+9XBVtX0JFvydLq5XgKZaYqkFk6hEg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:30.2175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899e4ee5-03ee-4eca-fcf0-08d7fb4f589a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
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

Create platform devices for generic dmic codec driver
and machine driver.
These platform devices required for creation of sound card.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 51 ++++++++++++++++++-----------
 sound/soc/amd/renoir/rn_acp3x.h     |  1 +
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 71bfae644372..502c3f794ba0 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -21,7 +21,7 @@ MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
 struct acp_dev_data {
 	void __iomem *acp_base;
 	struct resource *res;
-	struct platform_device *pdev;
+	struct platform_device *pdev[ACP_DEVS];
 };
 
 static int rn_acp_power_on(void __iomem *acp_base)
@@ -156,9 +156,9 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 			    const struct pci_device_id *pci_id)
 {
 	struct acp_dev_data *adata;
-	struct platform_device_info pdevinfo;
+	struct platform_device_info pdevinfo[ACP_DEVS];
 	unsigned int irqflags;
-	int ret;
+	int ret, index;
 	u32 addr;
 
 	if (pci_enable_device(pci)) {
@@ -219,20 +219,29 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	adata->res[1].end = pci->irq;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
-	pdevinfo.name = "acp_rn_pdm_dma";
-	pdevinfo.id = 0;
-	pdevinfo.parent = &pci->dev;
-	pdevinfo.num_res = 2;
-	pdevinfo.res = adata->res;
-	pdevinfo.data = &irqflags;
-	pdevinfo.size_data = sizeof(irqflags);
-
-	adata->pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(adata->pdev)) {
-		dev_err(&pci->dev, "cannot register %s device\n",
-			pdevinfo.name);
-		ret = PTR_ERR(adata->pdev);
-		goto unregister_devs;
+	pdevinfo[0].name = "acp_rn_pdm_dma";
+	pdevinfo[0].id = 0;
+	pdevinfo[0].parent = &pci->dev;
+	pdevinfo[0].num_res = 2;
+	pdevinfo[0].res = adata->res;
+	pdevinfo[0].data = &irqflags;
+	pdevinfo[0].size_data = sizeof(irqflags);
+
+	pdevinfo[1].name = "dmic-codec";
+	pdevinfo[1].id = 0;
+	pdevinfo[1].parent = &pci->dev;
+	pdevinfo[2].name = "acp_pdm_mach";
+	pdevinfo[2].id = 0;
+	pdevinfo[2].parent = &pci->dev;
+	for (index = 0; index < ACP_DEVS; index++) {
+		adata->pdev[index] =
+				platform_device_register_full(&pdevinfo[index]);
+		if (IS_ERR(adata->pdev[index])) {
+			dev_err(&pci->dev, "cannot register %s device\n",
+				pdevinfo[index].name);
+			ret = PTR_ERR(adata->pdev[index]);
+			goto unregister_devs;
+		}
 	}
 	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pci->dev);
@@ -241,7 +250,8 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	return 0;
 
 unregister_devs:
-	platform_device_unregister(adata->pdev);
+	for (index = 0; index < ACP_DEVS; index++)
+		platform_device_unregister(adata->pdev[index]);
 de_init:
 	if (rn_acp_deinit(adata->acp_base))
 		dev_err(&pci->dev, "ACP de-init failed\n");
@@ -294,10 +304,11 @@ static const struct dev_pm_ops rn_acp_pm = {
 static void snd_rn_acp_remove(struct pci_dev *pci)
 {
 	struct acp_dev_data *adata;
-	int ret;
+	int ret, index;
 
 	adata = pci_get_drvdata(pci);
-	platform_device_unregister(adata->pdev);
+	for (index = 0; index < ACP_DEVS; index++)
+		platform_device_unregister(adata->pdev[index]);
 	ret = rn_acp_deinit(adata->acp_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 6e1888167fb3..75228e306e0b 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -7,6 +7,7 @@
 
 #include "rn_chip_offset_byte.h"
 
+#define ACP_DEVS		3
 #define ACP_PHY_BASE_ADDRESS 0x1240000
 #define	ACP_REG_START	0x1240000
 #define	ACP_REG_END	0x1250200
-- 
2.26.2


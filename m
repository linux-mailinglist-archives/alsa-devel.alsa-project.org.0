Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2AEF2F46
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 14:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BB80167F;
	Thu,  7 Nov 2019 14:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BB80167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573133294;
	bh=Veit1XsMR09xnv3X4Ox7PWk1ZlhHU4KjGfYtDkDgWo8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcWZ2TzifF0YahOwLIIpfbnNDWXi80YTJrtC8iKlWN3welZ35YrOS4INc3aHlBdvy
	 oalwhMQE5TPkY5ZdDYUcuuw3hkM/S9x7OIIpiXR47s2raINz/46ehyq5SG0udvv3vR
	 ZOrRrpvsoOR//mtja7QLoymrHJRtJM6bP+t54n8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B20F9F8049B;
	Thu,  7 Nov 2019 14:26:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 400E2F80508; Thu,  7 Nov 2019 14:26:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790044.outbound.protection.outlook.com [40.107.79.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D25BF80111
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 14:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D25BF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="MZlQ26V0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kp6SPnCkEBiDUHxyefgpLnV1gXwZVFrPJtR1ww7L47Uy5Lh1i3QLajrhqZ8Dbu3RVmzx+egblK+TPe1d64mpxN3Z5H6r6xqRNf8lLv64zFLqQrZgkO/Z5njdPQB6SWVJNOE05IlSHENLMFJ0hCArKFwxDMMBA6bxMWWDaQMnn3ukJkzhMhTqv6urO4TuF1ULxERBxDiDjK/r4Sov+jNWRa93tB3L+RR8hORYRQSTaTNLJkfXF/k4Jlp8PXel9AKGVZw5e8EccCabpRo6WpSDu3Rpaa2XNSNI+VzOf1R2bJz+6Xccxs+G6SXwQVrZTfOl2Gi+aUVneulaZ+9ZsL2b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfZufcwbdQY9ftDHvA9zXIjlSwfqsdvSdYQdMQ6rZtQ=;
 b=ZRr8CRfPxTPLLztgU5rEyY9kGDNDLJusApFz+cVF9F6N9uFrD3xwPIOV4cjTBbD9UR/xE9KgRmAmecZgxf/JkSU8jDAAfwBgNRFXiqu/F0lMD3Z6q9bfOjxUleE3vdvlZK3wnSpIETUGRaDcbKVfmiSDvotuAKQolq5U/8/duq7nDar+Mnd0pYgSlkVfEmrLDje1khZNO3jxl8wxaz+hQ9xtLgaVK85qc+kQL0ST8UWETSrDy0T9sWuzO0yNezxlDNWJzH8Q+DuHbRFmyJK3WI0Zkn2wT4Eimw3prcypcPjWXFNAKebVll8evL7zssPI/z34n1EQ94hi+V0dHIy5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfZufcwbdQY9ftDHvA9zXIjlSwfqsdvSdYQdMQ6rZtQ=;
 b=MZlQ26V0dLbNfBEP2DS29sRqHxOJlSDyRqb5dScbYduGT3ibaAmX5Py8vDFRPIEW6ISoVTCGuoSxYMbIMac+FgCOiSQyg0/IksjPQujklRcriZQVV29Mn5iwqgROPKqgu2w3VeyIV5rLKUdxfa/OpNibtdNpMHh8YGlHylVV2fQ=
Received: from BN6PR12CA0037.namprd12.prod.outlook.com (2603:10b6:405:70::23)
 by MWHPR12MB1296.namprd12.prod.outlook.com (2603:10b6:300:f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Thu, 7 Nov
 2019 13:26:18 +0000
Received: from DM3NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by BN6PR12CA0037.outlook.office365.com
 (2603:10b6:405:70::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 13:26:18 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT023.mail.protection.outlook.com (10.152.82.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 13:26:18 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 07:26:17 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 7 Nov 2019 07:26:07 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 7 Nov 2019 18:54:48 +0530
Message-ID: <1573133093-28208-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(428003)(199004)(189003)(8676002)(305945005)(4326008)(8936002)(5660300002)(86362001)(36756003)(47776003)(356004)(81166006)(6666004)(16586007)(53416004)(1671002)(54906003)(70206006)(70586007)(316002)(186003)(50466002)(336012)(426003)(446003)(109986005)(126002)(81156014)(11346002)(2616005)(48376002)(476003)(486006)(2906002)(76176011)(7696005)(478600001)(51416003)(50226002)(26005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1296; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cea58c7-c2bf-4452-df03-08d76386126e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1296:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1296E82CC806771CF16A9055E7780@MWHPR12MB1296.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:182;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrH4Lr3dfgnaf7jFd+NawsLIlaR6tiO1yrthXld4WKCNBX/kUPP9wn8j5GNr5FjqaCOAlLGJ2SAaoiMsExfC3kYIQ2y7kRVNWkbTqtm2wFzCKTWQ+/LlhvC1rUkatBcA4Z0CTxaLpR/CENEhozaJKmeUvbo4Ej2iUxTJ3F3xS8RzNRft1o16ON201G9/yNRIvoizyiG/GXOEHTTDeOyfJLBOg18PT7VzfIvvPDiuaIsWvZgSqsS9PPZnUnsj03BLtmt8KTiNccvRMmIsg1FyNxYiogGp+90A/AWalD2z+e6o/3WhmZvpKCSJQU5Ru5jdHZT9JjEVNxIOQcEJr4hp97YlNm/CUwRpSk/Q/qRg/2qDr8R6pessqMw9aAQA0wlQOYDtW/8XqNPvs19pkvAXai/r/SMQRCZxttrcvYCR2rM0d0G3VfrUeXd0nwfDC+vd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 13:26:18.1392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cea58c7-c2bf-4452-df03-08d76386126e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1296
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>, Maruthi
 Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com, Sanju R Mehta <sanju.mehta@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v3 1/6] ASoC: amd:Create multiple I2S platform
	device endpoints
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Creates Platform Device endpoints for multiple
I2S instances: SP and  BT endpoints device.
Pass PCI resources like MMIO, irq to the platform devices.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x.h     |  5 +++
 sound/soc/amd/raven/pci-acp3x.c | 78 +++++++++++++++++++++++++++++------------
 2 files changed, 60 insertions(+), 23 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index 4f2cadd..2f15fe1 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -7,10 +7,15 @@
 
 #include "chip_offset_byte.h"
 
+#define ACP3x_DEVS		3
 #define ACP3x_PHY_BASE_ADDRESS 0x1240000
 #define	ACP3x_I2S_MODE	0
 #define	ACP3x_REG_START	0x1240000
 #define	ACP3x_REG_END	0x1250200
+#define ACP3x_I2STDM_REG_START	0x1242400
+#define ACP3x_I2STDM_REG_END	0x1242410
+#define ACP3x_BT_TDM_REG_START	0x1242800
+#define ACP3x_BT_TDM_REG_END	0x1242810
 #define I2S_MODE	0x04
 #define	BT_TX_THRESHOLD 26
 #define	BT_RX_THRESHOLD 25
diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index facec24..fe37160c 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -16,16 +16,16 @@ struct acp3x_dev_data {
 	void __iomem *acp3x_base;
 	bool acp3x_audio_mode;
 	struct resource *res;
-	struct platform_device *pdev;
+	struct platform_device *pdev[ACP3x_DEVS];
 };
 
 static int snd_acp3x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
 	int ret;
-	u32 addr, val;
+	u32 addr, val, i;
 	struct acp3x_dev_data *adata;
-	struct platform_device_info pdevinfo;
+	struct platform_device_info pdevinfo[ACP3x_DEVS];
 	unsigned int irqflags;
 
 	if (pci_enable_device(pci)) {
@@ -68,7 +68,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	switch (val) {
 	case I2S_MODE:
 		adata->res = devm_kzalloc(&pci->dev,
-					  sizeof(struct resource) * 2,
+					  sizeof(struct resource) * 4,
 					  GFP_KERNEL);
 		if (!adata->res) {
 			ret = -ENOMEM;
@@ -80,28 +80,52 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		adata->res[0].start = addr;
 		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
 
-		adata->res[1].name = "acp3x_i2s_irq";
-		adata->res[1].flags = IORESOURCE_IRQ;
-		adata->res[1].start = pci->irq;
-		adata->res[1].end = pci->irq;
+		adata->res[1].name = "acp3x_i2s_sp";
+		adata->res[1].flags = IORESOURCE_MEM;
+		adata->res[1].start = addr + ACP3x_I2STDM_REG_START;
+		adata->res[1].end = addr + ACP3x_I2STDM_REG_END;
+
+		adata->res[2].name = "acp3x_i2s_bt";
+		adata->res[2].flags = IORESOURCE_MEM;
+		adata->res[2].start = addr + ACP3x_BT_TDM_REG_START;
+		adata->res[2].end = addr + ACP3x_BT_TDM_REG_END;
+
+		adata->res[3].name = "acp3x_i2s_irq";
+		adata->res[3].flags = IORESOURCE_IRQ;
+		adata->res[3].start = pci->irq;
+		adata->res[3].end = adata->res[3].start;
 
 		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
 
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
-		pdevinfo.name = "acp3x_rv_i2s";
-		pdevinfo.id = 0;
-		pdevinfo.parent = &pci->dev;
-		pdevinfo.num_res = 2;
-		pdevinfo.res = adata->res;
-		pdevinfo.data = &irqflags;
-		pdevinfo.size_data = sizeof(irqflags);
-
-		adata->pdev = platform_device_register_full(&pdevinfo);
-		if (IS_ERR(adata->pdev)) {
-			dev_err(&pci->dev, "cannot register %s device\n",
-				pdevinfo.name);
-			ret = PTR_ERR(adata->pdev);
-			goto unmap_mmio;
+		pdevinfo[0].name = "acp3x_rv_i2s_dma";
+		pdevinfo[0].id = 0;
+		pdevinfo[0].parent = &pci->dev;
+		pdevinfo[0].num_res = 4;
+		pdevinfo[0].res = &adata->res[0];
+		pdevinfo[0].data = &irqflags;
+		pdevinfo[0].size_data = sizeof(irqflags);
+
+		pdevinfo[1].name = "acp3x_i2s_playcap";
+		pdevinfo[1].id = 0;
+		pdevinfo[1].parent = &pci->dev;
+		pdevinfo[1].num_res = 1;
+		pdevinfo[1].res = &adata->res[1];
+
+		pdevinfo[2].name = "acp3x_i2s_playcap";
+		pdevinfo[2].id = 1;
+		pdevinfo[2].parent = &pci->dev;
+		pdevinfo[2].num_res = 1;
+		pdevinfo[2].res = &adata->res[2];
+		for (i = 0; i < ACP3x_DEVS ; i++) {
+			adata->pdev[i] =
+				platform_device_register_full(&pdevinfo[i]);
+			IS_ERR(adata->pdev[i]) {
+				dev_err(&pci->dev, "cannot register %s device\n",
+					pdevinfo[i].name);
+				ret = -ENODEV;
+				goto unmap_mmio;
+			}
 		}
 		break;
 	default:
@@ -113,6 +137,9 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 
 unmap_mmio:
 	pci_disable_msi(pci);
+	for (i = 0 ; i < ACP3x_DEVS ; i++)
+		platform_device_unregister(adata->pdev[i]);
+	kfree(adata->res);
 	iounmap(adata->acp3x_base);
 release_regions:
 	pci_release_regions(pci);
@@ -124,9 +151,13 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
+	int i;
 	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
 
-	platform_device_unregister(adata->pdev);
+	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
+		for (i = 0 ; i <  ACP3x_DEVS ; i++)
+			platform_device_unregister(adata->pdev[i]);
+	}
 	iounmap(adata->acp3x_base);
 
 	pci_disable_msi(pci);
@@ -151,6 +182,7 @@ static struct pci_driver acp3x_driver  = {
 
 module_pci_driver(acp3x_driver);
 
+MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
 MODULE_AUTHOR("Maruthi.Bayyavarapu@amd.com");
 MODULE_DESCRIPTION("AMD ACP3x PCI driver");
 MODULE_LICENSE("GPL v2");
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C0F18E1
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 15:39:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A315C169C;
	Wed,  6 Nov 2019 15:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A315C169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573051157;
	bh=2TqIChsb/NA3bNd9NIbRR6oSm24NiH2ryiTcPlj/6aU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qSKgyEO/n23T1roYH5llNnp23xOKivcDkgfPx/I+acId1NZ7GzlF+gxeS7sLfJGTX
	 TTiaGW0sYDEvzl+pcYWUd/CJDeLWbPmZAI4aoqXl2jagg3DyKsfJVFZk5hS97G2Hly
	 j+7vIgNzZjw3l72wXvdsiaxZ/XmHGO37xlrtDIqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9F1F80321;
	Wed,  6 Nov 2019 15:37:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDE4DF803D0; Wed,  6 Nov 2019 15:37:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DATE_IN_FUTURE_12_24,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820071.outbound.protection.outlook.com [40.107.82.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 219CEF8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 219CEF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="bD4e1eB/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ5F4EppWjH8EiWK6ms9uNWlTCB1pfHR6yPkJVcPQse/JMastWk/19fh0BUsb9g713pagWCBgQF9nXyeuD30fCG5pZ3iLubAEKivZw1f6mjlrFtH1rxuonL3oWuyB6h3mcbSRCPlEneOyMmwO+bBY8UsakOYLHDSo9ZEuFAeyopOANYEu82jEozhYBMx8Twno1Uf/UdNvl7zn4P616iW/kMEc1PDJhUOUF+s3i3SgR/dq148pa6WkjD/EEmzH0yNjUMEICjB2LiT0niSiCHhwE+2o7/QCeKHxxFH4GvCES+UOvi+kg6rhTvBoKYblzjd7ZJXD66/NODlD7WgFlkHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kemQqCmt6oyqwqJuhjDK4eGgvzMZOms2o4VSyhIxNPU=;
 b=Scayk9VkEyvgGBAlEWODuFnRGp0d9URVc+JN+bHFQcv6b47B7VDORXK9BCV0FWZqiP8yZprNrs922tc+h4o3s9mifYEuzcgSUnbgxnBItSEVRG/35TugXA/CUTvZBoiPOepIhxdv3crMI2JXP6HIvPKcMpA+ofkX7DHlSMhKaNS1NGM8dHU4ZfOU6szk33J+hqGg3/GMBrqUfhchpwHxDIr6IRbja5sXC5kg5EoC3Iao0BUqHOSS2IDBopMgUhPKPrH46He3cxiXNuhqGYpQQEno1Rx0HFTLidnzZOjRhs1ZgwPScrEobczUPFxjCmLuaGfUnW/+dls6NveVyswTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kemQqCmt6oyqwqJuhjDK4eGgvzMZOms2o4VSyhIxNPU=;
 b=bD4e1eB/zEYRrH0NfS5MikGr190JhoseOhwEDSoFKMQqtqZKoq73KAnkFDSdMPJlSkI+SXdDIndr/ClkHel6qv4tYRdwr+xC11mq+kB5V/03CkL2fvjqbn7DvJayCrhJ0ZHYZQswbf9CbgFMP57d73C8LKIKUl4v4YsqPMTYrCw=
Received: from MWHPR1201CA0009.namprd12.prod.outlook.com
 (2603:10b6:301:4a::19) by BYAPR12MB3415.namprd12.prod.outlook.com
 (2603:10b6:a03:d5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Wed, 6 Nov
 2019 14:37:22 +0000
Received: from DM3NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by MWHPR1201CA0009.outlook.office365.com
 (2603:10b6:301:4a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Wed, 6 Nov 2019 14:37:22 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT025.mail.protection.outlook.com (10.152.82.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2430.20 via Frontend Transport; Wed, 6 Nov 2019 14:37:22 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 08:37:21 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 08:37:12 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 7 Nov 2019 20:05:58 +0530
Message-ID: <1573137364-5592-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(428003)(199004)(189003)(2906002)(86362001)(51416003)(50226002)(336012)(76176011)(7696005)(48376002)(356004)(6666004)(109986005)(4326008)(36756003)(54906003)(16586007)(316002)(47776003)(478600001)(1671002)(186003)(70586007)(70206006)(8676002)(5660300002)(26005)(426003)(50466002)(305945005)(8936002)(81156014)(81166006)(476003)(2616005)(53416004)(446003)(486006)(126002)(11346002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3415; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a630f49d-4c9d-44c6-f28c-08d762c6d5b4
X-MS-TrafficTypeDiagnostic: BYAPR12MB3415:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3415B5A7A72D71E82CCA88DCE7790@BYAPR12MB3415.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:182;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KoLmvRHWMlQdT2UtmPjcbell6pk6JxTe8APVUY0eauvRztAUFEqLGLyIHgRDGUfozX5wvhHJcT5GY0sYEVDsoSir0mHTJR16/Y3pj6nwmMvKPrf041p6A4I/qSZiBOKVIjqyNlIPv5WDp0BBk9RMR7WXF24YyrrUJj8cc50JVai53KQoKo1gURWnDe3jOyD4j3BhP06dZfUDKcWs0ItW9GNLoq9n8w6+ex199BCS+bzRFPHcPbzXUrtMAOckib185biDh0K79StiJcFjLuLC/De4pWstt5PvEnDHSSJtzhfY9eY5c5exAiqhUREgtEGSgKkNdaT+AafALNfMrqdAqASA5/7LzW/iVvTUwvtgOVnwcb7zryX6O+S1CDI1ZNr1zPEHB4Vx8M5H9WkAcRfT1/KcFw7H3PaZc9/ciQDySgmvbnFOozQb3u58zI7vb9Ue
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 14:37:22.3816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a630f49d-4c9d-44c6-f28c-08d762c6d5b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3415
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Maruthi
 Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com, Sanju R Mehta <sanju.mehta@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Colin Ian
 King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [RESEND PATCH v2 1/7] ASoC: amd: Create multiple I2S
	platform device endpoints
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
 sound/soc/amd/raven/pci-acp3x.c | 82 +++++++++++++++++++++++++++--------------
 2 files changed, 60 insertions(+), 27 deletions(-)

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
index facec24..ec3ef625 100644
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
@@ -80,39 +80,62 @@ static int snd_acp3x_probe(struct pci_dev *pci,
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
+			if (adata->pdev[i] == NULL) {
+				dev_err(&pci->dev, "cannot register %s device\n",
+					pdevinfo[i].name);
+				ret = -ENODEV;
+				goto unmap_mmio;
+			}
 		}
 		break;
-	default:
-		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
-		ret = -ENODEV;
-		goto unmap_mmio;
 	}
 	return 0;
 
 unmap_mmio:
 	pci_disable_msi(pci);
+	for (i = 0 ; i < ACP3x_DEVS ; i++)
+		platform_device_unregister(adata->pdev[i]);
+	kfree(adata->res);
 	iounmap(adata->acp3x_base);
 release_regions:
 	pci_release_regions(pci);
@@ -124,9 +147,13 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 
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
@@ -151,6 +178,7 @@ static struct pci_driver acp3x_driver  = {
 
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

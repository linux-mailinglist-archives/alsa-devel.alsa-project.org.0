Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34581FDD22
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:14:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D1F1666;
	Fri, 15 Nov 2019 13:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D1F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820046;
	bh=LxaQeFztRNGwjECoE0gr4qgRR83tCdrrlXw66mjgAvk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oy3eRFakC9ZnphptlCPR7o2OHwZAeEUzIC1WMk6xiPEPrYaUSBxh5dFQCckkhCUkB
	 HrkbQHGO8XyT2Ga/Bkcp9y+zbuSZb0KQa8apX7hRNzxZpDhDiOu1qtXnSPJOa9XQl1
	 x9FpR8BPIZA5msIYfsqh9m7GFJJ/cMJGlDL5rd5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31C38F800CC;
	Fri, 15 Nov 2019 13:12:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 409BDF80104; Fri, 15 Nov 2019 13:12:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730065.outbound.protection.outlook.com [40.107.73.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE212F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE212F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Il87WzvO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKJnYedHE8aXxEuXwvEteZM8RcNQR1RhDwM81/643ROQs+Ela+NyazJ5WD62fboU+AQfkLvLu4iilxCikNENZ7wAevpaFOmyfSQTXHaepg0TvuiuMzht9+jbwg6MwR9CSn18wvWldWCpTmvoEZOaHBkmhlakTq8jkiuoW4LdzCHSVZF4c1k67xGDBVrmZGM4g2muiJYfgAHkqhUHFheOBO6/xWspbJaCR9wPZTeZ/7JZhovLG0iUQG1ft5neBMsyyI1CvYn9Q3+halN+IR+b/PyBusapGQ9yiInaSvneijS8i28KVkQJXcN6DRWls+9JLLfNT3VvNqyPQnrrM48QXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcEmt8NxVLE7sSU0U/qd/lZSmQGTyMlbkItxAcY3C28=;
 b=h6m8Mh9F7qbO4rhPfEY/4cghmsJHogaqP/P8grCMUYj6CeULr2TvAg/x6p1sgbufFG0LmWFIvV5X+i2qPWkZvbyhSOftvqjhCA63EdkyjR6Vu4QSHv9nfkBrfr/sXn9v20LfDpg7u/Sz+j8/OQeh43UYDB3T148Z3K73SJZdD2+yTxQ2Q+ldX+9PLEjyeBXopT/TD0zvXPUUeYbPAHcg24BIVncY+aTEgYcHaTsUHbYHXJUvt80MysdDM/mVrCNXv98YVoKq1PBVxPQDUCk1m2RNYZm30gQZsf0eAi0ChjkqUSH2+RiJ7TJcaZjFhtuQn19MUNbYToDbn7+u5oF0AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcEmt8NxVLE7sSU0U/qd/lZSmQGTyMlbkItxAcY3C28=;
 b=Il87WzvOSRdXTZAYm+s/IauryHZMfLGByLMkC2MRLB2prKzV9DaPtG8lt2+pG6/x6OighHliVWK2CwQQ1rmwUZJJ0TOAIMO+0vSLI6NtwyvIds8r0+EjC0n12SuQFtFy4xUbLmflYX8+SK+ZZW8VCXe3nc+XlYkJvDv52JoLYbk=
Received: from DM3PR12CA0083.namprd12.prod.outlook.com (2603:10b6:0:57::27) by
 DM6PR12MB3116.namprd12.prod.outlook.com (2603:10b6:5:38::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Fri, 15 Nov 2019 12:12:12 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::207) by DM3PR12CA0083.outlook.office365.com
 (2603:10b6:0:57::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 12:12:12 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 12:12:12 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 15 Nov
 2019 06:12:11 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 15 Nov 2019 06:12:02 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 15 Nov 2019 17:40:18 +0530
Message-ID: <1573819823-23731-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(428003)(199004)(189003)(53416004)(26005)(81156014)(70206006)(81166006)(186003)(51416003)(7696005)(8676002)(305945005)(76176011)(5660300002)(54906003)(70586007)(316002)(11346002)(47776003)(16586007)(478600001)(2616005)(476003)(446003)(426003)(336012)(2906002)(126002)(50466002)(50226002)(6666004)(356004)(48376002)(36756003)(4326008)(86362001)(8936002)(109986005)(1671002)(486006)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3116; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a89a0a8a-488d-4a5d-3ef2-08d769c50ba7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3116:
X-Microsoft-Antispam-PRVS: <DM6PR12MB311616DDAB40644BFBEAD72EE7700@DM6PR12MB3116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:182;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucb7Y2MdG5VnOaszH8N6wB4oh2l/sGsMxl0BOoPjTRxZWjbIqDRQpWejqFSDcN+pNn85TcczfqaVhnvkaYT9B5oNVKNgofctjyxY0mZ8n3dUdlK0DtvrbTyZBnEW9rWP5mOyTc2SB8rm6ZfsMbdXAuTrEo1oeS4yJfJmoskCtzoDAeQJi6COqlT5wfyQZ99gV49egw1O2Jjac27wAtaNnEXWWvmVFWfFzqvA2/I/WRmWzI3ZJn0JC3T+Kmj3H99g/sVJe+94XJv6AR01Z4NIVQ2yUhJxTyeKbA/t+qvi1Esa+8WaqYNFjsAK1GapQUcR7PFPw5seyiVfNqidg9RhX95PGsg9yDPSheMGORqO/MqDWZ2vrq7l69WKYQ9NtJFdfbspdFaFY4JNhY1Huj9cdgpUmh2u0fkycBdOgFpgMurcyJZRhrrHi0iQyx+fbmLb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 12:12:12.0357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a89a0a8a-488d-4a5d-3ef2-08d769c50ba7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3116
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v6 1/6] ASoC: amd:Create multiple I2S platform
	device endpoint
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
 sound/soc/amd/raven/pci-acp3x.c | 96 +++++++++++++++++++++++++++++------------
 2 files changed, 73 insertions(+), 28 deletions(-)

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
index facec24..4c4601d 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -16,17 +16,17 @@ struct acp3x_dev_data {
 	void __iomem *acp3x_base;
 	bool acp3x_audio_mode;
 	struct resource *res;
-	struct platform_device *pdev;
+	struct platform_device *pdev[ACP3x_DEVS];
 };
 
 static int snd_acp3x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
-	int ret;
-	u32 addr, val;
 	struct acp3x_dev_data *adata;
-	struct platform_device_info pdevinfo;
+	struct platform_device_info pdevinfo[ACP3x_DEVS];
 	unsigned int irqflags;
+	int ret;
+	u32 addr, val, i;
 
 	if (pci_enable_device(pci)) {
 		dev_err(&pci->dev, "pci_enable_device failed\n");
@@ -43,7 +43,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 			     GFP_KERNEL);
 	if (!adata) {
 		ret = -ENOMEM;
-		goto release_regions;
+		goto adata_free;
 	}
 
 	/* check for msi interrupt support */
@@ -68,11 +68,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	switch (val) {
 	case I2S_MODE:
 		adata->res = devm_kzalloc(&pci->dev,
-					  sizeof(struct resource) * 2,
+					  sizeof(struct resource) * 4,
 					  GFP_KERNEL);
 		if (!adata->res) {
 			ret = -ENOMEM;
-			goto unmap_mmio;
+			goto release_regions;
 		}
 
 		adata->res[0].name = "acp3x_i2s_iomem";
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
+			if (IS_ERR(adata->pdev[i])) {
+				dev_err(&pci->dev, "cannot register %s device\n",
+					pdevinfo[i].name);
+				ret = PTR_ERR(adata->pdev[i]);
+				goto unmap_mmio;
+			}
 		}
 		break;
 	default:
@@ -112,10 +136,22 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return 0;
 
 unmap_mmio:
-	pci_disable_msi(pci);
+	for (i = 0 ; i < ACP3x_DEVS ; i++)
+		platform_device_unregister(adata->pdev[i]);
 	iounmap(adata->acp3x_base);
+	kfree(adata->res);
+	kfree(adata);
+	pci_disable_msi(pci);
+	pci_release_regions(pci);
+	pci_disable_device(pci);
 release_regions:
+	kfree(adata);
+	pci_disable_msi(pci);
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+adata_free:
 	pci_release_regions(pci);
+	pci_disable_device(pci);
 disable_pci:
 	pci_disable_device(pci);
 
@@ -125,10 +161,13 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
 	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
+	int i;
 
-	platform_device_unregister(adata->pdev);
+	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
+		for (i = 0 ; i <  ACP3x_DEVS ; i++)
+			platform_device_unregister(adata->pdev[i]);
+	}
 	iounmap(adata->acp3x_base);
-
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -151,6 +190,7 @@ static struct pci_driver acp3x_driver  = {
 
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

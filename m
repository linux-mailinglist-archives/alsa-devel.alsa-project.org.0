Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7AD1141BA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 14:41:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD40A166E;
	Thu,  5 Dec 2019 14:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD40A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575553264;
	bh=2tjOGhu9mZjH2fWHN713Zq+t6Jt3/gQmJ8STUjZ0fRc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tvi9UCJ70xgCFKYdmjeakOsQUGTOc+fqgr5fAthDOlGYmOiIVCr3fJdop2oSoh1EV
	 4vISJ0fl3DJFdD6UhRP2ljy54+psHr4sk8g/xISL0mtHRJg5Dte+DIA6MEZR9C1lIp
	 wPDL7kKpk0ra3ZlKexXizIO9Y6mBM4G8qPc2/gsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA7D9F80227;
	Thu,  5 Dec 2019 14:39:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E417F801F8; Thu,  5 Dec 2019 14:39:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1B8FF800F6
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 14:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B8FF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="F+9P5sMF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOzjPh2FkGMoDKZKTdbua5aJA7kdDa9ltoDs3ZG+YUThtfZidtF6cV3FkXgJ+9eq0zvXcyJkhkbR42arX1/rGXefHpJc5sMg4fD61rgXcwn9JSh3fdCHZ7lW0eA0hjvzodbzbnXwmBg+y1UOOp9mVCDiOGztWyC6N5ipyLJorrO4dwzJ4+QxNT702hO8m/4YTjZQQSilxwJ8TlT8tejl81E++W+Zae8FW9aqBCzRug+zwAS4QQ7ihhjJEimR5q6amQXXUkrDKyoKNqhAh0N+myj5a07zply/jSvKuhC0eoflHG1wKasGxVwRaHUtSzLxvmTooYE/FDbrKgvq3Iw4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fz1dqtk8WvUjuLkBhg/qwGWrrmk8haUxZMDbwSv0hk=;
 b=YbogKqgshTL5zKtUDJobMFgyMM0EI4TP1dyzkho+Xtimcgh9FoDxLyASXzJFz34rTCv/Ef7SU3qet5Jl31oaatHa0iSbULPbDMfJsl1jH6mT1BCdyfDp4rbMb1ZDdGf2K6wP4aEytmuFTd8JT81kzI9DwUBmX4/TmvRHJBkdLl0T6zrRGYKyObuzEkGxjK3/jI7NICmUnVMU+brOEHnwJvNV+8zRFe8R3FrFlWfgSrn8fGbqFLi03jUJcIGwAiWgWczRHzpwBgvVVNX2MSrqZIxpqI4SaAsjkJZ6rMXwa//pewVm+uFzfUaXU+LOx7KoiCZy8ncViRk2g9OxJHEb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fz1dqtk8WvUjuLkBhg/qwGWrrmk8haUxZMDbwSv0hk=;
 b=F+9P5sMFfc9dtRUmVO38/DKE59y4EgVdAnW7Wv3tOz9BmqGTa9pzAcga1aqkDji5l9tylVjYiF63FNZ0xVIhNDrQiFZTdtEooxHOsSV3AQALXFxojgTdxK1cqNr9XDhQxKoEcVIuxhuEN9HHmK4Y4kA83y8ycug4IsIDUGTmJ2s=
Received: from DM6PR12CA0013.namprd12.prod.outlook.com (2603:10b6:5:1c0::26)
 by MN2PR12MB3421.namprd12.prod.outlook.com (2603:10b6:208:cd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Thu, 5 Dec
 2019 13:39:04 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::209) by DM6PR12CA0013.outlook.office365.com
 (2603:10b6:5:1c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2516.13 via Frontend
 Transport; Thu, 5 Dec 2019 13:39:04 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 5 Dec 2019 13:39:04 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 07:39:03 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 5 Dec 2019 07:39:00 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 5 Dec 2019 19:07:26 +0530
Message-ID: <1575553053-18344-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(428003)(199004)(189003)(186003)(4326008)(76176011)(336012)(51416003)(7696005)(426003)(36756003)(50226002)(70586007)(2616005)(26005)(5660300002)(70206006)(305945005)(11346002)(86362001)(16586007)(50466002)(2906002)(478600001)(109986005)(54906003)(53416004)(48376002)(8936002)(81156014)(81166006)(6666004)(356004)(8676002)(316002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33ca8a4c-bf52-4e38-1024-08d779887e80
X-MS-TrafficTypeDiagnostic: MN2PR12MB3421:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3421724B48F5DD6CC9813B0FE75C0@MN2PR12MB3421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:182;
X-Forefront-PRVS: 02426D11FE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avbctO7Zmidbhx7VSjIw9iRbfAv8yVUgN3i6mpniTXJWYzrCfgPymnMr0mjF0r2/UzToHvipI7hf/RjLMupjp/BLGBdV0mYXRKiJEHzX0Yv7BZDzowKuWXeQWQgzTHkYMmbjHFvxLGp8FzvGsGHXCbSZjEX8Ef9RwlhED5i5Ck9oWerc4dZw6AFofB8ic/XMJl7j41HCM6gB82ElNReYJY7tHJd9ipAyUQA993NUeyqv2q576jDsdNbr8n/gzAkshPtgZqje8qL0jBykH0NcF3SSRSM97zgAf1iLTnoRdUEqGf4CA6/6VFgC6v3iqcNBb315ExiZeU/U22fTncVz8X9+/Jn1VJWbvZpa+KeDeGsXMrzrhFUjCs6OO6f5/eWS3gifDmtxkR1ibz02bbeSvQ0pp8LG4L1sAgidiIU1tUrGcVG5dmX6nFTkyCw/9b0D+ivzuKjIU+hIunh7A/khk/3DqXEXehQ51DkZPl/Wjn0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 13:39:04.0619 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ca8a4c-bf52-4e38-1024-08d779887e80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, pierre-louis.bossart@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com, Alexander.Deucher@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v14 1/7] ASoC: amd:Create multiple I2S platform
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
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/raven/acp3x.h     |  5 +++
 sound/soc/amd/raven/pci-acp3x.c | 95 +++++++++++++++++++++++++++--------------
 2 files changed, 68 insertions(+), 32 deletions(-)

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
index facec24..94f5f21 100644
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
+	int ret, i;
+	u32 addr, val;
 
 	if (pci_enable_device(pci)) {
 		dev_err(&pci->dev, "pci_enable_device failed\n");
@@ -56,10 +56,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		irqflags = 0;
 
 	addr = pci_resource_start(pci, 0);
-	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
+	adata->acp3x_base = devm_ioremap(&pci->dev, addr,
+					pci_resource_len(pci, 0));
 	if (!adata->acp3x_base) {
 		ret = -ENOMEM;
-		goto release_regions;
+		goto disable_msi;
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
@@ -68,11 +69,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	switch (val) {
 	case I2S_MODE:
 		adata->res = devm_kzalloc(&pci->dev,
-					  sizeof(struct resource) * 2,
+					  sizeof(struct resource) * 4,
 					  GFP_KERNEL);
 		if (!adata->res) {
 			ret = -ENOMEM;
-			goto unmap_mmio;
+			goto disable_msi;
 		}
 
 		adata->res[0].name = "acp3x_i2s_iomem";
@@ -80,40 +81,67 @@ static int snd_acp3x_probe(struct pci_dev *pci,
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
+				goto unregister_devs;
+			}
 		}
 		break;
 	default:
 		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
 		ret = -ENODEV;
-		goto unmap_mmio;
+		goto disable_msi;
 	}
 	return 0;
 
-unmap_mmio:
+unregister_devs:
+	if (val == I2S_MODE)
+		for (i = 0 ; i < ACP3x_DEVS ; i++)
+			platform_device_unregister(adata->pdev[i]);
+disable_msi:
 	pci_disable_msi(pci);
-	iounmap(adata->acp3x_base);
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -125,10 +153,12 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
 	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
+	int i;
 
-	platform_device_unregister(adata->pdev);
-	iounmap(adata->acp3x_base);
-
+	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
+		for (i = 0 ; i <  ACP3x_DEVS ; i++)
+			platform_device_unregister(adata->pdev[i]);
+	}
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -151,6 +181,7 @@ static struct pci_driver acp3x_driver  = {
 
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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6950A100706
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 15:07:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE984168A;
	Mon, 18 Nov 2019 15:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE984168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574086054;
	bh=BuDmVv9GNLic9wG2FfaHCQrp+sxsJHT958MutKQoU9M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKsqVZzVWK78tPavyUQTmC9LKDdnRzOnKF8ebwCzFi43ZiLpHYAKgqDtpoN9wzz+A
	 82uBYnET1Zy7udyNBMUHg4zLyJLHNoqxZ4b1XKs3WOll+FR7vfLECWJXelY+i5suS3
	 nSvGZJ3cfl3hV7VzGm1H4a3bZ9vx+Xa9mk0+Ry58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 844E8F8013B;
	Mon, 18 Nov 2019 15:05:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1530FF800F6; Mon, 18 Nov 2019 15:05:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81BA0F800F6
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 15:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81BA0F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="a3bcOp+d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0FQXfB4vmVVpBgqqdHfA4mluo3WlmJk2nXtPlozhyIdOSz3M9rdp2mxv4DFpPA9EEsC+z42ObOdN9VoeqV+mCB7cnCVtx6JG8k8IgA545vhSHN2gZSl7m4MqjI9qDXbHADjsuQa3g8sDVUTAnJq0w7E7aLLyTwIWFZWyc6PdVCayUu43BbbuFfklad2Sc62sX5cBUhfJQlDkWW1vYs7ZHZuLTXHRJz3H2zF1kMrqjEokcuQIRuSDW+Fph+nigqVVuq3T8+LOGagfTO6TAbrIXCU4wv/zgdP2boqmk7uZp9dwh0pW0c3ARqoVMdyhqmSZD/ngsG8R2aX76lhGMkVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd8V2NtpHfkEO0Ais6s6wkv4cdHngkDaq5ZKN2YVOJ0=;
 b=FIL/4azxFpsRQDkqtRUhqkp1Mn+cT8T6WEA6U4cOtfxYgcSJYjd9i9rCw0cZql1e+16CINXXfdv4HXFxAqUzGfwpZl5quHPogwtCWu4pU5t/RCGsW3yfsi6gSZ0dj0DqRKnMyrH01Uc0Ibku0E2CD5oGveYpyp+JZxTUzWs7ry8jXmKVb1s+cCUMLqbRkr/sAFcjaC6DS3Y3i1ZTKgfFkgnO5R/jH97w+rTJ0OP0L2dEXPyXUwKBmFCckrQYY3JsFZc+GdjAk/Fc6Lxkxe+IIq2pW/4dj06WwtIMYM9dnmzoEfHinBVMn6lRUfU0RGUKJsDq2ihDmsh7VD5j4zwEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd8V2NtpHfkEO0Ais6s6wkv4cdHngkDaq5ZKN2YVOJ0=;
 b=a3bcOp+dQY1EM/Uh/IHke7nXohGzQwtysevAu7tMnngUXHNDbAwa70C5ak+BNXFynI55nUq8hXdGS5soqhNs/a4Z9od7A4rtrTeovIad4DdoZZXcq2sog7p2k0ia6dlopLj6lZHgNJsAh+YZBQdw6GGlWjWzKp9Pd5Cys4Vv9uI=
Received: from DM6PR12CA0016.namprd12.prod.outlook.com (2603:10b6:5:1c0::29)
 by BN6PR12MB1458.namprd12.prod.outlook.com (2603:10b6:405:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Mon, 18 Nov
 2019 14:05:40 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::207) by DM6PR12CA0016.outlook.office365.com
 (2603:10b6:5:1c0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Mon, 18 Nov 2019 14:05:40 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 18 Nov 2019 14:05:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Nov
 2019 08:05:38 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Nov
 2019 08:05:38 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 18 Nov 2019 08:05:35 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Mon, 18 Nov 2019 19:34:16 +0530
Message-ID: <1574085861-22818-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574085861-22818-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574085861-22818-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(428003)(199004)(189003)(86362001)(426003)(11346002)(53416004)(54906003)(476003)(336012)(126002)(2616005)(8936002)(70206006)(5660300002)(486006)(36756003)(70586007)(26005)(50226002)(186003)(81156014)(8676002)(81166006)(305945005)(478600001)(446003)(316002)(47776003)(16586007)(109986005)(50466002)(1671002)(7696005)(4326008)(51416003)(2906002)(76176011)(48376002)(356004)(6666004)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1458; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17b08e15-4d17-471a-ca0d-08d76c30648d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1458:
X-Microsoft-Antispam-PRVS: <BN6PR12MB14582D16A3D0DA968CD01671E74D0@BN6PR12MB1458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:182;
X-Forefront-PRVS: 0225B0D5BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDzAzvAMiErGqGXHSxNFhf+qCIzgdfFVvaB9/fVeSQfWLkuabTpNN4rZBtyH8JKcuXgxj4P6GEVgxzRb7rgrurESlVhDhuCIQXzKGI0x+ntlOadSBsRnTtYkHsHhPT/Hg4DnwKPVLMCj23FPxVKrJY6wSc2TvsS3O7Q4o9RpwiNKoE+8qR+yMf5SuTjMsi6kPO/VJE9W6/MIFB/mFrvkkCqJ5J8EGM1bHZkX/Ii7eqrsEKyGINy+IvmRNKbAUdOU5Z6cVBudUOyZ5CLth6SmAdGnNMRrebRtVvGX1uU960RSGS2VRiqbJAM0CxXeAZMQbjPzl6y6dh73wk3CkfRYQrZTgzxQ0sMdSlh/x97pRUu2kI1TwPYbOJgGni2aHf5z4GFNhH4lik55hZ0JUY/yq6cIWeFJr7lPdJ7e5A/xpjAdvOM0s4jXTygrcmKZWqXG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 14:05:39.5847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b08e15-4d17-471a-ca0d-08d76c30648d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1458
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com, Alexander.Deucher@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v7 1/6] ASoC: amd:Create multiple I2S platform
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
 sound/soc/amd/raven/acp3x.h     |   5 ++
 sound/soc/amd/raven/pci-acp3x.c | 102 ++++++++++++++++++++++++++++------------
 2 files changed, 76 insertions(+), 31 deletions(-)

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
index facec24..174adbc 100644
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
+	int ret, val, i;
+	u32 addr;
 
 	if (pci_enable_device(pci)) {
 		dev_err(&pci->dev, "pci_enable_device failed\n");
@@ -40,10 +40,10 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	}
 
 	adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
-			     GFP_KERNEL);
+							     GFP_KERNEL);
 	if (!adata) {
 		ret = -ENOMEM;
-		goto release_regions;
+		goto adata_free;
 	}
 
 	/* check for msi interrupt support */
@@ -56,7 +56,8 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		irqflags = 0;
 
 	addr = pci_resource_start(pci, 0);
-	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
+	adata->acp3x_base = devm_ioremap(&pci->dev, addr,
+					pci_resource_len(pci, 0));
 	if (!adata->acp3x_base) {
 		ret = -ENOMEM;
 		goto release_regions;
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
+			goto release_regions;
 		}
 
 		adata->res[0].name = "acp3x_i2s_iomem";
@@ -80,28 +81,52 @@ static int snd_acp3x_probe(struct pci_dev *pci,
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
@@ -112,10 +137,22 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return 0;
 
 unmap_mmio:
+	if (val == I2S_MODE)
+		for (i = 0 ; i < ACP3x_DEVS ; i++)
+			platform_device_unregister(adata->pdev[i]);
+	devm_kfree(&pci->dev, adata->res);
+	devm_kfree(&pci->dev, adata);
 	pci_disable_msi(pci);
-	iounmap(adata->acp3x_base);
+	pci_release_regions(pci);
+	pci_disable_device(pci);
 release_regions:
+	devm_kfree(&pci->dev, adata);
+	pci_disable_msi(pci);
 	pci_release_regions(pci);
+	pci_disable_device(pci);
+adata_free:
+	pci_release_regions(pci);
+	pci_disable_device(pci);
 disable_pci:
 	pci_disable_device(pci);
 
@@ -125,10 +162,12 @@ static int snd_acp3x_probe(struct pci_dev *pci,
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

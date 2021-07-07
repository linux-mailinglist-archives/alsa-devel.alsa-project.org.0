Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31B3BE2B9
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:41:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999591672;
	Wed,  7 Jul 2021 07:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999591672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636510;
	bh=wTeTemyoyDL4Nuz8sxz76IG+SlKvQUy+uL+fc0Xm6oo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s89hMlbYVkiPHnbv7DfU+e9v2rSuxp7+p7tkhdUMx+BpUlAMP12YLA7dW9Tf3CBjc
	 auonHWzbp0ttDCmUo9HjGGNR67zTxLMC62D5vWx8IL2VMGYjW6/ekK1MJbrv7VJrA/
	 CJb5iBAfDSqpfY0sVOCrQ1glIE5ShwT4kw4ZUmfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A80F804DA;
	Wed,  7 Jul 2021 07:40:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1446F804DA; Wed,  7 Jul 2021 07:40:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2059.outbound.protection.outlook.com [40.107.100.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B38DF804D0
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B38DF804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="WWXtXE3F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDaGxb7crr11D3/24tye0LyisacYC38XC6t3GWwQpfxilbdHfh7HSnudiH9pzaAVPoPbp3ah60PoV5xXEGrhasPGVr5HQF5t6dDR9kR4pl5xmjNeHp0ISf5E/Gu2CkOgAWzij+XmJFnoMHj0gsTBeHAqO3qUSQOnXDdqoJNSKx4wS+DpjdLGfbdj8gvMzZEHEBLj0KjqelbymJrM+jF/uB96yVMzDfDDCqynyIwBeP8KWKNtRfRB9s0L6H6N70KKPZT2MPjx1lXs78QV+a7G6/ALijhikKijMCFuttvrrVGAe8JnOfIe0ELGlSvhyB6AtsWhte0K1H6k+TQJiY5lGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9uM4aykRUaF0x+7s0RFzT7ftejj17ls+sG3qzYVsKk=;
 b=TKvYOT224pkA8MPhY+RJNJHnYg1KcLQCNid34r1Bw7i/U6OUMwSAfAxHDC9mGT04dvYewRdM+JwXP3vSOWzsknVrlZCYrTo3ZzWGtKbpIorHUJWqI7m1eQFyAGGp7w/DjtvzZQ8u3r7YfYb1A4CU7qTi+RI6PCm8gaqv2NdPB89+qYQTNtV4jHWI8x++LmZRO5Z/F5VExNtDLW/3OJtMhAX2rWmtB+ua318ViIwkXfNbvTribTUonJoT1r7o3TGKDJdHlA3NSQpOSAApZFwi5tgFzYME9MWZ+RBMU6obdQOHbGFGjRQbWaEnqqA36A1whLJOmbxqEG/XjztPV/GzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9uM4aykRUaF0x+7s0RFzT7ftejj17ls+sG3qzYVsKk=;
 b=WWXtXE3FkdQIGnRk6mixqOnmo3eTdbBYrJXMu6f4YGKz0fZ2mmyCj9YJm2jkTzMl+opOZvmui80+pygTGYng2NvIczjzxfGffsSK7eQb9WIgyEA9Ti+GHcAJJd5prA/BX2IKqqqw8gtiEy+Gv7K7Vn71Kdem5dJtkpomzsFs4JM=
Received: from BN9PR03CA0390.namprd03.prod.outlook.com (2603:10b6:408:f7::35)
 by BL0PR12MB4691.namprd12.prod.outlook.com (2603:10b6:208:84::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 05:40:19 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::81) by BN9PR03CA0390.outlook.office365.com
 (2603:10b6:408:f7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 05:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 05:40:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:40:19 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:40:08 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 04/12] ASoC: amd: create acp5x platform devices
Date: Wed, 7 Jul 2021 11:26:15 +0530
Message-ID: <20210707055623.27371-5-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea193a7e-59a6-489d-f415-08d94109b4ff
X-MS-TrafficTypeDiagnostic: BL0PR12MB4691:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4691E337E3D1B264BC457326971A9@BL0PR12MB4691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n81lvRfjFOT2f/yX4yEvfHRst9F/0tEQK9CGjCl1OkhxayTBBE1Jt9aLIGBB81icYc0zvj/DvkF1VsfbIVyKoKu+ZbFIEVIuF+wyPjuq8IaUR4odTbwcsF78eVeFmlMp2mp+Fehe/KXs6/CfVG6SpXuGILea+8uyaECzgAjqc6dlE+lQtkCMOX1JF5WwYO6CVC1CE85i9MmmvzatK3Pj5XWrP5XF+jEyWLgC6520CQLVnaMXxCxjAURRThoEKMlWlpeTkeKfVwaQNaXjdneIyNShWRfXReELUA597gpicFPrjehk8SY0IQUAZtQ1dCsDkVxSlCopLBkNGpnr+Hs6mDtHIcOiHfMropRuaUiF+UU6FXmpjHHdZkgX/sYmRAAdTbv7BIkDvk6IH2OqtIt83nJarScMuOrRC+je8pNhLI05GjtUPu29cN55Z2jS1mHSi9/JY3hVw8pcq7pk61KeIjhWEDT4FuZSJY9joGVqvi57c3y9MPw89f9KfRv/uhbSTBk10QrEteXm7ULTEeHbCTBAjT7E382MzhlGQk+MM+qcH7WSNpSNjAsUm+PGfsYQfER6Q8yC/exX6SXFAwSY/juBzV7z/+2jktAGgUGyy1PrOj1pV5u0ENDKsqtdNRMeQFCzpErUbB+9A05oNhsMzGWWieJ71T5fx18gr/8GpnUhHIGwaV0QKQGLyHIcts1nUiGajfg0jQlZNbJzzGmf2gRA0SWmLcBQ6quncAOGwD9WR5K+92avaIV5IHm+w2gPBu5uED8NwIgWzFHj2rpSJJVu2JwAEnxWJIfdx5HMU2E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(46966006)(26005)(82310400003)(70206006)(54906003)(2906002)(7696005)(82740400003)(86362001)(186003)(426003)(8676002)(36860700001)(316002)(70586007)(36756003)(356005)(47076005)(5660300002)(2616005)(4326008)(336012)(83380400001)(6666004)(8936002)(1076003)(44832011)(478600001)(81166007)(110136005)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:40:19.6280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea193a7e-59a6-489d-f415-08d94109b4ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4691
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

ACP5.x IP has multiple I2S controllers and DMA controller.
Create platform devices for I2S HS controller instance, I2S SP controller
instance and DMA contrller.
Pass PCI resources like MMIO, irq to these platform devices.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x.h     | 10 ++++
 sound/soc/amd/vangogh/pci-acp5x.c | 95 ++++++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index 11b555306958..365e80b56ff9 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -22,6 +22,16 @@
 #define ACP_ERR_INTR_MASK	0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
+#define ACP5x_DEVS 0x03
+#define	ACP5x_REG_START	0x1240000
+#define	ACP5x_REG_END	0x1250200
+#define ACP5x_I2STDM_REG_START	0x1242400
+#define ACP5x_I2STDM_REG_END	0x1242410
+#define ACP5x_HS_TDM_REG_START	0x1242814
+#define ACP5x_HS_TDM_REG_END	0x1242824
+#define I2S_MODE 0x00
+#define ACP5x_I2S_MODE 0x00
+
 static inline u32 acp_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP5x_PHY_BASE_ADDRESS);
diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index dbe8fef3e294..2779423f7cd3 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -8,6 +8,8 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
 
 #include "acp5x.h"
 
@@ -17,6 +19,9 @@ MODULE_PARM_DESC(acp_power_gating, "acp power gating flag");
 
 struct acp5x_dev_data {
 	void __iomem *acp5x_base;
+	bool acp5x_audio_mode;
+	struct resource *res;
+	struct platform_device *pdev[3];
 };
 
 static int acp5x_power_on(void __iomem *acp5x_base)
@@ -143,9 +148,12 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
 	struct acp5x_dev_data *adata;
-	int ret;
-	u32 addr;
+	struct platform_device_info pdevinfo[3];
+	unsigned int irqflags;
+	int ret, i;
+	u32 addr, val;
 
+	irqflags = IRQF_SHARED;
 	if (pci->revision != 0x50)
 		return -ENODEV;
 
@@ -179,6 +187,83 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	if (ret)
 		goto release_regions;
 
+	val = acp_readl(adata->acp5x_base + ACP_PIN_CONFIG);
+	switch (val) {
+	case I2S_MODE:
+		adata->res = devm_kzalloc(&pci->dev,
+					  sizeof(struct resource) * 4,
+					  GFP_KERNEL);
+		if (!adata->res) {
+			ret = -ENOMEM;
+			goto de_init;
+		}
+
+		adata->res[0].name = "acp5x_i2s_iomem";
+		adata->res[0].flags = IORESOURCE_MEM;
+		adata->res[0].start = addr;
+		adata->res[0].end = addr + (ACP5x_REG_END - ACP5x_REG_START);
+
+		adata->res[1].name = "acp5x_i2s_sp";
+		adata->res[1].flags = IORESOURCE_MEM;
+		adata->res[1].start = addr + ACP5x_I2STDM_REG_START;
+		adata->res[1].end = addr + ACP5x_I2STDM_REG_END;
+
+		adata->res[2].name = "acp5x_i2s_hs";
+		adata->res[2].flags = IORESOURCE_MEM;
+		adata->res[2].start = addr + ACP5x_HS_TDM_REG_START;
+		adata->res[2].end = addr + ACP5x_HS_TDM_REG_END;
+
+		adata->res[3].name = "acp5x_i2s_irq";
+		adata->res[3].flags = IORESOURCE_IRQ;
+		adata->res[3].start = pci->irq;
+		adata->res[3].end = adata->res[3].start;
+
+		adata->acp5x_audio_mode = ACP5x_I2S_MODE;
+
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+		pdevinfo[0].name = "acp5x_i2s_dma";
+		pdevinfo[0].id = 0;
+		pdevinfo[0].parent = &pci->dev;
+		pdevinfo[0].num_res = 4;
+		pdevinfo[0].res = &adata->res[0];
+		pdevinfo[0].data = &irqflags;
+		pdevinfo[0].size_data = sizeof(irqflags);
+
+		pdevinfo[1].name = "acp5x_i2s_playcap";
+		pdevinfo[1].id = 0;
+		pdevinfo[1].parent = &pci->dev;
+		pdevinfo[1].num_res = 1;
+		pdevinfo[1].res = &adata->res[1];
+
+		pdevinfo[2].name = "acp5x_i2s_playcap";
+		pdevinfo[2].id = 1;
+		pdevinfo[2].parent = &pci->dev;
+		pdevinfo[2].num_res = 1;
+		pdevinfo[2].res = &adata->res[2];
+
+		for (i = 0; i < ACP5x_DEVS; i++) {
+			adata->pdev[i] =
+				platform_device_register_full(&pdevinfo[i]);
+			if (IS_ERR(adata->pdev[i])) {
+				dev_err(&pci->dev, "cannot register %s device\n",
+					pdevinfo[i].name);
+				ret = PTR_ERR(adata->pdev[i]);
+				goto unregister_devs;
+			}
+		}
+		break;
+	default:
+		dev_info(&pci->dev, "ACP audio mode : %d\n", val);
+	}
+	return 0;
+
+unregister_devs:
+	if (val == I2S_MODE)
+		for (i = 0; i < ACP5x_DEVS; i++)
+			platform_device_unregister(adata->pdev[i]);
+de_init:
+	if (acp5x_deinit(adata->acp5x_base))
+		dev_err(&pci->dev, "ACP de-init failed\n");
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -190,9 +275,13 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 static void snd_acp5x_remove(struct pci_dev *pci)
 {
 	struct acp5x_dev_data *adata;
-	int ret;
+	int i, ret;
 
 	adata = pci_get_drvdata(pci);
+	if (adata->acp5x_audio_mode == ACP5x_I2S_MODE) {
+		for (i = 0; i < ACP5x_DEVS; i++)
+			platform_device_unregister(adata->pdev[i]);
+	}
 	ret = acp5x_deinit(adata->acp5x_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
-- 
2.17.1


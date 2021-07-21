Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 100383D1579
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 19:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FB8B16F0;
	Wed, 21 Jul 2021 19:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FB8B16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626889788;
	bh=5Md67/IkDZn6bSwR1zdbL3NCAZgUp5rRgL/Z6x84b3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pXKFE9p8CmLX0eXltqarFTV8ZQ2vbZGP10oQYo8xEuBl/HvDM4yeLPuK+E03EUY+7
	 c50PHVWe4ZRGeu+GJOrOY//PHqenLkZwR+emSPVrHGyD3mSkIzf7bhOCiGXLXHg+pN
	 cLwrNhMsvDtD+nGzFKDnlFV8Os1WuFdllwcpJxdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F08C3F804AC;
	Wed, 21 Jul 2021 19:48:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36DA2F804E3; Wed, 21 Jul 2021 19:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53754F804AC
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 19:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53754F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="HH+tN9S7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiLQACn6/PyLSMFvBAmDls+Jlb30WHoyjhIoA7O6ZbXaJAY90ckHFj/KkBJvQjG5HmlhySjR0/F3l5LbxYOBCr+P3vx0OVqYj80/sk7uM5NUuxr21ZTde9DXf/9+kofiNsKA6Sqzd+bc6YKSluT8hf159thUYlH6kfXt5jlyw1klUT+hOOeYTfhDGzRDe+lSi9EGCER8K9yCXZaqFRbSAbRmjS6ydZfLtuy+ZZMj0MsMMQKhUH5Sw/Y/9uFcrEcP3wuuWwE32F+6V1QTYvoYCYyqOheCUDYPzVSdhNourOIeSw5iEPnx+MeJX3VnYuOCbjwBNADPNLRlW2F+RShQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UM8lvoM4hM1VScDYSPSay2K8WVC9qm+a5daEijat3MI=;
 b=gbVdYvfSaT4dbAYG1TJI1GiuRU2KWrmoXdrtyELvI2e0461NsKkzbdluOrfE7rfzmvgU84/f/DQZvG8+ohkcSm0STRB3OmFizuUd94J4K5zr2mT2+HBVKdQdJQeWMcqOxs8Z1baKgtE936LwT/p1qjAy7VwXscq9eEjNWEoKwbSx6vK3YP/RsxyYDFot/AkXMe5735kie52XbE7n0FAx3ucePHGBsbnU8koJkDvt9LdNaGzOjXPJ8fZxJjOJlR9RxP/KcZ9eOWLPb09DJNTU0lbpPYa6hkOim2p657QhfoGUBIe+kjqqWmWPCwN6+2wTshnP9zLCGdz28RtlSxJ6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UM8lvoM4hM1VScDYSPSay2K8WVC9qm+a5daEijat3MI=;
 b=HH+tN9S72YyNMxfjLpF/9QAVGbOBbAqaYZtDKKopleNfsOrYGbIgIDQBhfyX8PkvZAgDXiV2pANSqBHNtllRdFrfwXWGHqMpbFnI5NJ8JQoCTf76dAk8sktYlItjtK2lpZLB2+dsICmMyJ4kZZNdiNyUUBduAR6H6it3ZFBi9pI=
Received: from DM5PR08CA0044.namprd08.prod.outlook.com (2603:10b6:4:60::33) by
 CY4PR12MB1862.namprd12.prod.outlook.com (2603:10b6:903:121::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.34; Wed, 21 Jul 2021 17:48:05 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::d6) by DM5PR08CA0044.outlook.office365.com
 (2603:10b6:4:60::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 21 Jul 2021 17:48:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 17:48:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:48:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:48:03 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 21 Jul 2021 12:47:59 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v5 04/12] ASoC: amd: create acp5x platform devices
Date: Wed, 21 Jul 2021 23:34:20 +0530
Message-ID: <20210721180430.11571-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
References: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f33ab5f-fb87-424e-2ecf-08d94c6fb13c
X-MS-TrafficTypeDiagnostic: CY4PR12MB1862:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1862901D072445A9529BC0B897E39@CY4PR12MB1862.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTTpdIsciMlLUdDTQJZlFSJfa6EVyc/J9VTRIfqEqNcft14GUZbAgaAcfny6vJjrFW2WdRuuPydZS8UDdA9fyaM30v1aM7nykxD3xqYiWUd9u7HRfkKwgr2rFuR6TEgAlRLVzO31FQ56WdjmV6f2ehn93RYRxyn9TCFyUvYtVY1M6cypuzCti4vrvvKEnbuWhFlhK3RFGk9KQav2l7yjCZ014FCieoELSiZjPQXycTGAYug3O3DWqR8SVHvtGmpeLRFS7Zw+KGGgnWmAy0Li17i0T6XZSWJFD0Ps2TdJhmcP1zdiddFYQLQQ8t5bg4sPCVPiXqlDEi3y1yjn314+32SyrctQwV/9hGlaPOFeUdRXZyOLQWWOwNywzcaBxukdYP0gh3pBzKrHnslKQbs7FGPiKxSs38tpMHbaUDt3g0oBsab7WCJb3wAh2/yb+i208SkkB1OMeLblnT4ZpXcJ4szNMK7oiOYHg/1xCNtBt1oBHQYWFpQzTvuNddVsaiyf6FZP/72SZQDEeA4ZZLi2eziXQIFCeWgEuIi6HSXq5MRx2IbhOA44kgL3NnvQftcrKW8SqlCG2A1ciDy13b9P+g0DX9qUE8XCFMiJK46odfgXSdM8iZGQMqClicyr2mpZYjX9VdTI/A86/qMDFGRT3U7PgQVQhUaCN+x1h8VSluMS6IZJlw2aJDlXKjyup6a4viPPQ+tHdHl3dxu/DllFap+apYkTB9DzU0Qrw5AFCDCh9rLuomewybupziOQ6hJ+7D+EhjDCuYGPTnKFbL6HtTIJF6hLci+YY8xakyqudek=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966006)(36840700001)(2616005)(5660300002)(186003)(81166007)(4326008)(83380400001)(7696005)(2906002)(82310400003)(54906003)(426003)(36756003)(1076003)(316002)(47076005)(36860700001)(356005)(82740400003)(70586007)(336012)(110136005)(70206006)(86362001)(26005)(478600001)(8936002)(8676002)(6666004)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 17:48:04.7178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f33ab5f-fb87-424e-2ecf-08d94c6fb13c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1862
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

ACP5.x IP has multiple I2S controllers and DMA controller.
Create platform devices for I2S HS controller instance, I2S SP controller
instance and DMA controller.
Pass PCI resources like MMIO, irq to these platform devices.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x.h     | 11 ++++
 sound/soc/amd/vangogh/pci-acp5x.c | 94 ++++++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index db23fffce9a0..32e5db10c1c8 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -22,6 +22,17 @@
 #define ACP_ERR_INTR_MASK	0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
+#define ACP5x_DEVS 3
+#define	ACP5x_REG_START	0x1240000
+#define	ACP5x_REG_END	0x1250200
+#define ACP5x_I2STDM_REG_START	0x1242400
+#define ACP5x_I2STDM_REG_END	0x1242410
+#define ACP5x_HS_TDM_REG_START	0x1242814
+#define ACP5x_HS_TDM_REG_END	0x1242824
+#define I2S_MODE 0
+#define ACP5x_I2S_MODE 1
+#define ACP5x_RES 4
+
 /* common header file uses exact offset rather than relative
  * offset which requires subtraction logic from base_addr
  * for accessing ACP5x MMIO space registers
diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index 523b962fe35e..25b42a37ad3a 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -8,11 +8,16 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
 
 #include "acp5x.h"
 
 struct acp5x_dev_data {
 	void __iomem *acp5x_base;
+	bool acp5x_audio_mode;
+	struct resource *res;
+	struct platform_device *pdev[ACP5x_DEVS];
 };
 
 static int acp5x_power_on(void __iomem *acp5x_base)
@@ -114,9 +119,12 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
 	struct acp5x_dev_data *adata;
-	int ret;
-	u32 addr;
+	struct platform_device_info pdevinfo[ACP5x_DEVS];
+	unsigned int irqflags;
+	int ret, i;
+	u32 addr, val;
 
+	irqflags = IRQF_SHARED;
 	if (pci->revision != 0x50)
 		return -ENODEV;
 
@@ -150,6 +158,82 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	if (ret)
 		goto release_regions;
 
+	val = acp_readl(adata->acp5x_base + ACP_PIN_CONFIG);
+	switch (val) {
+	case I2S_MODE:
+		adata->res = devm_kzalloc(&pci->dev,
+					  sizeof(struct resource) * ACP5x_RES,
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
+	for (--i; i >= 0; i--)
+		platform_device_unregister(adata->pdev[i]);
+de_init:
+	if (acp5x_deinit(adata->acp5x_base))
+		dev_err(&pci->dev, "ACP de-init failed\n");
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -161,9 +245,13 @@ static int snd_acp5x_probe(struct pci_dev *pci,
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62943172C
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231851907;
	Mon, 18 Oct 2021 13:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231851907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556266;
	bh=w27+NnXzzY0ZzYGCGYSpUKwvvgfkZSwe3UtUuGffcDU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdTfsZitkC8AujbzXSKUpSzrMjJo4MniI32curSrd/V0UShkMYmC7WpW3FWJyJcCN
	 L4BcvpogZ+bl9uOqvF5nExRp1PR3zh9Nkzu927t6nxJJKJwm9YVdYyKnJfmDb2faHT
	 Kq5TNrfRpLZPjhhWROPIOsLvbc8N5zQ698tE8Frk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 002B0F8051A;
	Mon, 18 Oct 2021 13:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 201D6F80518; Mon, 18 Oct 2021 13:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E3A1F80510
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3A1F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="IvOS1cBz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gE87Dr0ziTQaYHyokvMFaMee/n7zyz2/eazifIIFB4xKyreaUONKzKswjUg82ph/ADWawcCHLZPPIL7v+mhH2xKgdRh+uCBFTbOTOqizRYoLwW3BAR6Fz9kkuGKmDrLhzrVk9MgmfP0fPyKP41vlNSBIS1Y4DrSZh0dminNkPueNG1GX0EjWX8XpkK/oGoz+VrxmG3FrsdxBDEzVitvOG887BxcxfzE2q7iKkmXMvk9Xb2+J83ogXevjVwAmf4knpXc9ygafcUSVPbbFdIka5DeGynGAQ34gGP9QQ7g4TY9vFp9l7Sa3JrRgEpt8LJQbQbCGzBJhbyi/PYlZNZ48OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJ+cw1WAdRIFJ22kr7K9dsdMu5wtwOeahQrXLF4+jrk=;
 b=HUV58w0sOwDzcDGsS+qtndf0t8D2D76Siq6jv7sBP+uXOhXa0PeDWIJQfoe85bCRiZTk9W+QrMkOlHB7xC96J1AE0Mo+unavvta/2UwKFCEYsWaW/pablMdRxUKWdu5V7zBEtlS63sY6vJ9Nc05hqndBgSA1DgvgvFghn1AK72mJBUA3pM4XWCp+i09/6JGYouoJAW8ZYBISt3CeGCKARLZ9V01qZBXaLxZdufsaYFZP5s+zo6EDfEZaTpqVTeTLhhLWBsJPhGqL6aPMA/sDbqxKI5bjSgYlN3jFeMmLVouEjcx0mMuAQVCRDUqxcpaZokuwzEEVdxuNPTPJ5Jv74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJ+cw1WAdRIFJ22kr7K9dsdMu5wtwOeahQrXLF4+jrk=;
 b=IvOS1cBz8wHkKAgg8wpbF7Dco0nFDa098jvYSKijJsl6GPOIaaIOiBH0RjzHDPgWXtMK1drirHHqg+h2pyyZFzMI/UkXdKskP8E5NAIfNs+Xjpxe4bRROEAZ281ZyZa3ZEHZw26M8UgQl0YWeAdY9/JOoqxOhhK6duKK9dfX/7c=
Received: from DM3PR14CA0138.namprd14.prod.outlook.com (2603:10b6:0:53::22) by
 BY5PR12MB5543.namprd12.prod.outlook.com (2603:10b6:a03:1d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:22:02 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::b8) by DM3PR14CA0138.outlook.office365.com
 (2603:10b6:0:53::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 11:22:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:22:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:01 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:21:57 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 04/13] ASoC: amd: add platform devices for acp6x pdm driver
 and dmic driver
Date: Mon, 18 Oct 2021 16:50:35 +0530
Message-ID: <20211018112044.1705805-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20b5df2c-85bc-4a55-c75f-08d99229821b
X-MS-TrafficTypeDiagnostic: BY5PR12MB5543:
X-Microsoft-Antispam-PRVS: <BY5PR12MB554389F2D319C46FF55D11B197BC9@BY5PR12MB5543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lFwMC+so961ea0f1s/tbUFVcUpILDPsM0InkrtMi61HM2k574ZyF0tCXHXHmfeBNO3Clwo0IjMP8cLWXpowtbSnkKBARQ+KSMBtpKE4PS7fSuHG4i7gVnwmvpYH0N9DL9vg6B6Frcke35QG+CrV67ODVIhVfdg2VpUSR8GwANygdhETKhu5iwCoS0RssjHFUdvFkJ/ptDEWt4dmnWIYVsBjx4eEC3Ehm3jfkhO+Bs/MCWhQmZZHkCyRLiIj9V9k4jztJsQtvF8GC8s2AO0xmwxYTpE+X+5g/nORjJX0eG2y6B3ZkuAK2FfUIoPUhhewsZrBF6cxN1w8piUbasUorNu/IsTQ7zCEvY53ieVR8yTg6v46hxSxcSjw470RJFMwkQx9HByCbHwvBDtMPWd0eaVl0eZZkGNK9bfxVIF18NnhPzjhak/2m7iQXLEzI5+2gtNW1nk/TxxXTqRmGetxntefK/Xq/vwZZaegzMNH+BsBGFinvLjs29lbS3bVXkAafeqZKthwBb8841BdHdRA+kTTE9A5U43gSKUgNH9m8l2RCILyiPT6KWpaUq8bnJq+fRTeLGpR4UUbN6vRs6cJkcDsN0AF+ZB7Sq/YgjT9gvdbwyd6o2K6skPNCaCcwAAfTm6A/Z55Z1xRHweRM5DF8iYNNtncq972GjSudVBhiqJ1Vw10XytuVajRU32Re30lPtY/OkW+HQoF85R1qjHItGhkEuuxmGN6tW7rk5r0thdIdCDWbrKhHAxyNIrxrg3tJ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(8936002)(36860700001)(54906003)(1076003)(47076005)(26005)(316002)(6666004)(508600001)(5660300002)(70586007)(81166007)(110136005)(8676002)(70206006)(356005)(7696005)(86362001)(336012)(83380400001)(82310400003)(36756003)(426003)(4326008)(2616005)(186003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:22:02.2959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b5df2c-85bc-4a55-c75f-08d99229821b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5543
Cc: Sunil-kumar.Dommati@amd.com, mlimonci@amd.com, richgong@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>
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

ACP6.x IP has PDM decoder block.
Create a platform device for it, so that the PDM platform driver
can be bound to this device.
Pass PCI resources like MMIO to this platform device.

Create a platform device for generic dmic codec driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x.h     | 23 ++++++++++++
 sound/soc/amd/yc/pci-acp6x.c | 68 ++++++++++++++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index 76e9e860e9bb..63bdea3188ea 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -9,6 +9,10 @@
 
 #define ACP_DEVICE_ID 0x15E2
 #define ACP6x_PHY_BASE_ADDRESS 0x1240000
+#define ACP6x_REG_START		0x1240000
+#define ACP6x_REG_END		0x1250200
+#define ACP6x_DEVS		2
+#define ACP6x_PDM_MODE		1
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
 #define ACP_PGFSM_CNTL_POWER_ON_MASK	1
@@ -22,6 +26,25 @@
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
+enum acp_config {
+	ACP_CONFIG_0 = 0,
+	ACP_CONFIG_1,
+	ACP_CONFIG_2,
+	ACP_CONFIG_3,
+	ACP_CONFIG_4,
+	ACP_CONFIG_5,
+	ACP_CONFIG_6,
+	ACP_CONFIG_7,
+	ACP_CONFIG_8,
+	ACP_CONFIG_9,
+	ACP_CONFIG_10,
+	ACP_CONFIG_11,
+	ACP_CONFIG_12,
+	ACP_CONFIG_13,
+	ACP_CONFIG_14,
+	ACP_CONFIG_15,
+};
+
 static inline u32 acp6x_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 03af3476a97c..bb66b4c670cd 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -9,11 +9,15 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/platform_device.h>
 
 #include "acp6x.h"
 
 struct acp6x_dev_data {
 	void __iomem *acp6x_base;
+	struct resource *res;
+	bool acp6x_audio_mode;
+	struct platform_device *pdev[ACP6x_DEVS];
 };
 
 static int acp6x_power_on(void __iomem *acp_base)
@@ -117,7 +121,9 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
 	struct acp6x_dev_data *adata;
-	int ret;
+	struct platform_device_info pdevinfo[ACP6x_DEVS];
+	int ret, index;
+	int val = 0x00;
 	u32 addr;
 
 	/* Yellow Carp device check */
@@ -154,8 +160,62 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	ret = acp6x_init(adata->acp6x_base);
 	if (ret)
 		goto release_regions;
+	val = acp6x_readl(adata->acp6x_base + ACP_PIN_CONFIG);
+	switch (val) {
+	case ACP_CONFIG_0:
+	case ACP_CONFIG_1:
+	case ACP_CONFIG_2:
+	case ACP_CONFIG_3:
+	case ACP_CONFIG_9:
+	case ACP_CONFIG_15:
+		dev_info(&pci->dev, "Audio Mode %d\n", val);
+		break;
+	default:
+		adata->res = devm_kzalloc(&pci->dev,
+					  sizeof(struct resource),
+					  GFP_KERNEL);
+		if (!adata->res) {
+			ret = -ENOMEM;
+			goto de_init;
+		}
+
+		adata->res->name = "acp_iomem";
+		adata->res->flags = IORESOURCE_MEM;
+		adata->res->start = addr;
+		adata->res->end = addr + (ACP6x_REG_END - ACP6x_REG_START);
+
+		adata->acp6x_audio_mode = ACP6x_PDM_MODE;
+
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+		pdevinfo[0].name = "acp_yc_pdm_dma";
+		pdevinfo[0].id = 0;
+		pdevinfo[0].parent = &pci->dev;
+		pdevinfo[0].num_res = 1;
+		pdevinfo[0].res = adata->res;
+
+		pdevinfo[1].name = "dmic-codec";
+		pdevinfo[1].id = 0;
+		pdevinfo[1].parent = &pci->dev;
 
+		for (index = 0; index < ACP6x_DEVS; index++) {
+			adata->pdev[index] =
+				platform_device_register_full(&pdevinfo[index]);
+			if (IS_ERR(adata->pdev[index])) {
+				dev_err(&pci->dev, "cannot register %s device\n",
+					pdevinfo[index].name);
+				ret = PTR_ERR(adata->pdev[index]);
+				goto unregister_devs;
+			}
+		}
+		break;
+	}
 	return 0;
+unregister_devs:
+	for (--index; index >= 0; index--)
+		platform_device_unregister(adata->pdev[index]);
+de_init:
+	if (acp6x_deinit(adata->acp6x_base))
+		dev_err(&pci->dev, "ACP de-init failed\n");
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -167,9 +227,13 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 static void snd_acp6x_remove(struct pci_dev *pci)
 {
 	struct acp6x_dev_data *adata;
-	int ret;
+	int ret, index;
 
 	adata = pci_get_drvdata(pci);
+	if (adata->acp6x_audio_mode == ACP6x_PDM_MODE) {
+		for (index = 0; index < ACP6x_DEVS; index++)
+			platform_device_unregister(adata->pdev[index]);
+	}
 	ret = acp6x_deinit(adata->acp6x_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
-- 
2.25.1


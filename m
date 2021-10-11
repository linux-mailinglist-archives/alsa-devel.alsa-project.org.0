Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744C42865C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:40:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1951688;
	Mon, 11 Oct 2021 07:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1951688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633930838;
	bh=g5Ex7gK8/l9eTYl9BgtJLt8jO0Afa6OyNBssB9vN4s4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HyMuhYPpw4/zZ4cyb9WoiC98+2On/5hMzAQdYMv2qrHG+Qs9Ky3e5uLktMlN6T/LY
	 eqnKHKIDbUQj8epn3JDBr5W79uI2S/UVGFLsnIrX3bchLyS4gPe6ham7TYKKo1GAnl
	 VDRMkWUPJzDFvri7vWy1X312dvS69eegxFsmGF7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFE0F804ED;
	Mon, 11 Oct 2021 07:39:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF898F804E2; Mon, 11 Oct 2021 07:39:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88319F8028D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88319F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="v31nQW1y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeIh2zaOP1mUo1XZ0Jk3ppYLzEJaHslXcMYuOCymrAQm5rJAbb5xPdFpsjnqox/ZY2MYQ/OJA2OW/twUzbz0GyPKwMCmxL4bxHwVm1PzCjI7vHbqW10rOCUdrJG7Sy6oJgKqqNKbJGmTMdSWata0xNwfrnwx+5O0hhPUR73ixwDqIwfvWbxNikMC/ChB2Q7sINGnrmDatpm3WszE5VzxsIQLVIK1adBscszwG+4ioKiAb5T3A4V2a1chOWIFyYV5kbXfs1mI7cUbAD669lGFFVIlBxH+3I0lLgHkMCYZEcpBmvezfIsc1jV4tcSnzsnwrajp+rzg4OPPA+fIGBZJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTorS6TE1MOUe5xzZCe5FwZ1vWNzb4SqytDu1K4+878=;
 b=au7HnVPs3HSxddsM/zKHwQf3reKmbVUBMNpSvJz72J6jjQYdQjq5cXruqPf20mBz2Z2Qau5JPHF7qa4crcIBCjLnzyUu9U56si1geh8m2aSe9cwx4kc36+2s2EMzJQQR5KElm2ytefGtZFXEiFimQUk8kzHTE5zMNXDtBprMlkdblYozGyOcMufiPdLzC5c6OsGey64g4eV45pcdvo1U3c7/LeXHAGjtkbfZGPfdRR4SQ9RC0kjpUBIye3aE/IOjpO59hwvgHw/YUmrE4ud4ChHcE6rKuq5FdCfyZWG7huCtszo17PwU0nUZN7vRUeJ8xsEA9K3uVR0ladNLq8es+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTorS6TE1MOUe5xzZCe5FwZ1vWNzb4SqytDu1K4+878=;
 b=v31nQW1yfCE403N2tLxsHogbDsK+pUdZ3uJxgjCZVXLgxXziecMOhpwQ745BcOGDhSbDX/Yb63l4wz01u9R50SVNYvMPbjc3NUJuEka/b3LM+1XGA/BBGb2eBnnFZchiV8/AlB+Vt+LCk9xNdqy+lRuMudv4k/o6/NeEskefiwk=
Received: from DM5PR19CA0045.namprd19.prod.outlook.com (2603:10b6:3:9a::31) by
 DM4PR12MB5295.namprd12.prod.outlook.com (2603:10b6:5:39f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.22; Mon, 11 Oct 2021 05:38:52 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::48) by DM5PR19CA0045.outlook.office365.com
 (2603:10b6:3:9a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:38:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:38:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:38:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 10 Oct
 2021 22:38:50 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:38:46 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 04/13] ASoC: amd: add platform devices for acp6x pdm driver
 and dmic driver
Date: Mon, 11 Oct 2021 11:26:12 +0530
Message-ID: <20211011055621.13240-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec7f8962-a5b1-4bec-ec1d-08d98c796858
X-MS-TrafficTypeDiagnostic: DM4PR12MB5295:
X-Microsoft-Antispam-PRVS: <DM4PR12MB529575DFA993D8109855ED2097B59@DM4PR12MB5295.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFkzVWHKjfUNBd/cDSHuhkNngIPqMSmwdvN8YLwStbBkDM3sgwtEnr7EXg9PWJyHw6ikr83PJPozr2e8lssPwltGngfGZmdKi5Tc6a2D55YercZ25h9Ch0HTKLFGkSRaHkjIYtB24SU8ZVC6gGS6bMbGCIhiF9DjQOvuLnwcHyoi0JkioM+Juwoql/ZG1LDBl7CrG70O5FTgeWkCgNovhMUPDZwEWUmuUYBU9w3QeCd0Gbsgrbo0AUA61zjmrK2qhM8Gd9Q52IDdpfJONnv5KiV8A+qgl4GA75gszHPUwGMsVXfE4uwTtTF29rF3HqYST0ixRlHsVIc0V8U92rHMn9y/zK2sa9pzXQ3KRP7yKEG0Q3aOnEaQoZY2wDtlGRFtleNeV2hTwTu2FHazTLEJmK8G9PeZDN5yG3ox/a+Cl0v/1Kg9kHJtQIPksYZlGMgUBI/EWaZN6pSh1b3QLl5rzid8G8Mr4et/YXAxwgzmyUIs+khewYF4dtT5EWzsgeSzWY3geaLnRlrSE7KpMYFcBuVOCUtCmGaKv4h67QLfa8l4pPew4NiZ80BsQrUUDuuB9N903aw3zPASvUUugZ824Y7e5HqmBW+aLHUEFyV+sTcInCqRjapgHNj9jtSSzvVDtunIgLv7tbWVX2c3sOkQz7HxMAmLbY/IktwrQQutghnEh3PBGEZtLDkn0BP7SmaZr9dDaCyil4iwAbdrlcT3iMFgeXChh0ZP0meGPbkoY6YPieeRrVJTJlpaD/pKSB6sdjEAdIHFvu3ZHJShuaCLVg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8676002)(110136005)(8936002)(86362001)(4326008)(54906003)(36756003)(316002)(83380400001)(82310400003)(47076005)(1076003)(6666004)(36860700001)(81166007)(2906002)(356005)(70206006)(70586007)(426003)(186003)(336012)(26005)(508600001)(2616005)(5660300002)(7696005)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:38:51.8435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7f8962-a5b1-4bec-ec1d-08d98c796858
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5295
Cc: Sunil-kumar.Dommati@amd.com, Richard.Gong@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 open list <linux-kernel@vger.kernel.org>
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
index 56fd7cdbc442..26c8d652fd08 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -8,11 +8,15 @@
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
@@ -116,7 +120,9 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
 	struct acp6x_dev_data *adata;
-	int ret;
+	struct platform_device_info pdevinfo[ACP6x_DEVS];
+	int ret, index;
+	int val = 0x00;
 	u32 addr;
 
 	/* Yellow Carp device check */
@@ -153,8 +159,62 @@ static int snd_acp6x_probe(struct pci_dev *pci,
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
@@ -166,9 +226,13 @@ static int snd_acp6x_probe(struct pci_dev *pci,
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 033993CB920
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834E716A6;
	Fri, 16 Jul 2021 16:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834E716A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447214;
	bh=uUsjQ0ZJhmFgNvogc4RIW5nt9Rvt/cTA3JOSWQ8lx9s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q4fiEG0YcIsQtTT6PmzD0OEVRkeiRleLCP+NLu/qGRuzfes7UGHqVAndbAw88/Ddh
	 73sXfmZ2eRK4jmHTYdS3aod47VnTH2wQFWlRTLHSWpZ2wH5h5GIYkVLE1ux/QFR+pS
	 WLyXgqSOZkMLOr3bUdgB9If5zlRK91bCugFtyn/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF5BF80254;
	Fri, 16 Jul 2021 16:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9EC0F804E3; Fri, 16 Jul 2021 16:52:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3015CF80254
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3015CF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="DP+VAbWs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl5V+PoHYWBw1b8HKGiU/0W719gnyyykdAqvqQ4QEIlI3VM2XQGwQik5jywwpKJH6gzyY0WXdb9BPVZYwCd+yyy/BblUfLsv0QaLzHYAQhrBhJFqxbVnZMl9NjXpPBl2XczYGx83lw6OqkMaGA/pv9YYpFfDW5bznPMdusNXcGGwNZ2oVc+Y90l8CQOUPKI6l5bmCs2nmJKFciy7FcQvsXwWp2GpaZkIRv/+2LVmEkJwcaCszCy+R7aBJWsTzjfCYcYkb6+Bf1eMJ9nfu6KfjJJfNkVPVLWR8keMidUP5p/l/ML7IrKoid1PsL1X47xYDSBo5LkiZY0MI1jxy49MqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA4jKcOAxvuYyc8Wc43GPzHv7QEt6orLbIomXiUEZTE=;
 b=HclxRVunIyRT+9Y2bOxoupxOUws9IYQ8fwJi0yD9SP+Aq7rzaqPp8ymMTXyHjDKkLcDLODA6MfFQPOXaQfRn/WkC/6qY1Yx9XuOY4I+mjdnnyGd3hqnR4Gg8zzHHhH43xfbg+hj8A/sjWYzLfu3+Z3j/BBW3wZ5Gby9PkREjlJ0Ck/OL8Vq+bgOmjr3WkzYZ/3zjNCLQ6WYqarLpwAGvTkQFaNBNTU5ojFR6bnBYItuwDVBGRCOatWMMHHKo1yUbbgsfbnfgV5PyO9SFn71677XKe9gcjAAVOQTTo8SDtNhkPhuMnSVytzBxPZuZJ2WOpAgjLHyp1qZ12k0NxL+zMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA4jKcOAxvuYyc8Wc43GPzHv7QEt6orLbIomXiUEZTE=;
 b=DP+VAbWsLxOwXimm5LkGho+knvbtv9/ktEIafcWtAKOVQkVDNi3Zdd8kQIEntxN6v0aCSYSRT2ViOopwMWTCzMXlPn5kDRBdddTUDh7Zwoy6ZkpGVlTept1HeknbJlhy0gYNIP0SqJ+HghyX9LpnsaW6bGciQDHH+J2v9y/4Dps=
Received: from DM5PR10CA0019.namprd10.prod.outlook.com (2603:10b6:4:2::29) by
 DM6PR12MB4894.namprd12.prod.outlook.com (2603:10b6:5:209::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.24; Fri, 16 Jul 2021 14:51:57 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::85) by DM5PR10CA0019.outlook.office365.com
 (2603:10b6:4:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 14:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:51:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:51:56 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:51:47 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 04/12] ASoC: amd: create acp5x platform devices
Date: Fri, 16 Jul 2021 20:38:01 +0530
Message-ID: <20210716150809.21450-5-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716150809.21450-1-vijendar.mukunda@amd.com>
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b97fd0a-b968-4b33-c27c-08d948694258
X-MS-TrafficTypeDiagnostic: DM6PR12MB4894:
X-Microsoft-Antispam-PRVS: <DM6PR12MB48945042AFF4D1F4C2D0FFBF97119@DM6PR12MB4894.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYPbRFtKZaA8uoWz1roOZHfuC24dL1o7W/5SpvwXfmGn657FGfRWuM5q/5726DqA0rRpj82mWz1ZYE7FtBY9tKEQC6Qh8/TvghFmBqiOJk+eSs0Tqo53ILd+gf7aS14VG/1v5NbUIheRXg15zwwsAKVrze0gz4eVNiWopStL+N+Pd/vCcr3Qn7eY+fxdO8hZBB+3aLAMh0JvpeiylZ7nBoWl4urGq8rCAEZYNBbtDg47ZkkgmxI1oTs3XLKZsgjNVKq+p5MG0Hc3aG6mMaGlsoHuRz5iC3h+sUZYTYJutqEZYrtN/OV7Egpr2yiE8Y+HkoI6O2lL4cbgGJ/1p/xKohcZCAxJxEBasU92+iM53729DBFUuavviYMYzEnLZ5Ozxb8e1j6mc6wXj3OWwZDZ643ohZOXOz6KT9kyRoNltP3i9RnVO37t+JcmZCjZSD3BfShC5mmNuK0muYnmrVyFfFWVQ5bAyclNduQwjEGeyyQ+Bnc1PWr4mBi0Sw/bUNG9GooJGUYeLWco9eNx8LrdCQLi9D2ma3oMhkJ2Y8BIvTGcF4kien4WpAzQchy83xsMNSxRLVsfXjQyortCKIC79TFxCqQITanP8wm/gB4JkOmptJF/hV6NR1zpCPoBHhNc5H6NxIbge/awgEsCRSEX0nDDAB0cCFBEXn8Jw29o/wCJoBSTKbbPq29b3UzSiZ443q1Ii8hXcJCNMf7lPiqCy4+yN+BaW6aXdzfxtgKnidFjgrDGIad8IY4KBHCR2xKlNxblps9BxRv5vhi1RrYUjatiXBEWC0WOjMWmBY+lq5E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(478600001)(336012)(81166007)(8936002)(186003)(7696005)(36860700001)(1076003)(47076005)(5660300002)(82740400003)(4326008)(8676002)(26005)(2906002)(356005)(316002)(70206006)(44832011)(83380400001)(426003)(110136005)(86362001)(82310400003)(54906003)(2616005)(70586007)(36756003)(6666004)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:51:57.0435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b97fd0a-b968-4b33-c27c-08d948694258
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4894
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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
instance and DMA contrller.
Pass PCI resources like MMIO, irq to these platform devices.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x.h     | 10 ++++
 sound/soc/amd/vangogh/pci-acp5x.c | 95 ++++++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index 708586109315..bbf29fd2b12f 100644
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
 /* common header file uses exact offset rather than relative
  * offset which requires substraction logic from base_addr
  * for accessing ACP5x MMIO space registers
diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index 523b962fe35e..3cc15a15b745 100644
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
+	struct platform_device *pdev[3];
 };
 
 static int acp5x_power_on(void __iomem *acp5x_base)
@@ -114,9 +119,12 @@ static int snd_acp5x_probe(struct pci_dev *pci,
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
 
@@ -150,6 +158,83 @@ static int snd_acp5x_probe(struct pci_dev *pci,
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
@@ -161,9 +246,13 @@ static int snd_acp5x_probe(struct pci_dev *pci,
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


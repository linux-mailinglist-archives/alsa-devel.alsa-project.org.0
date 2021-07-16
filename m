Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6DE3CB91D
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9900D16AE;
	Fri, 16 Jul 2021 16:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9900D16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447192;
	bh=Ipa/P3ZZNuVufnuNXU54kb0DMaP4K0YQqgy/8cFfl9E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXf+cRBtx1s453gRtuNNyfaqYJH3vzHhBgVOZ60ZydykLUrQnIDWwZ5DXysa/pNl5
	 VXuI70eplmMX61imdp73S0tYf6+VuVWzp4WvogxGN7K7RMCuKeXPZJCk3/9kXIHEDb
	 aDIg1odu4g/XLDmz26E/SDPiVHk2vZuWRGszjUus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4851FF804E1;
	Fri, 16 Jul 2021 16:52:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02C52F80254; Fri, 16 Jul 2021 16:51:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A180F80254
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A180F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="3XzaVGIB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uy86Kfyvv2sdH1L3lLz4EYog0ia+7tYskbPhVf8y+3jrCo/pv4O74a5mjbkdwQ47P9DIwFO3fary/nOU3Kov1zNeK3VB9AXdAcMtDSTMNO1IwznQbHNyJpAYqzZpqn094mQUb5OMgTy53HM7cLVRxqa73sy2mSThq6tIpC5QhboFbOZ5DUSDq6pWe6SzdFsMVcXoVwhlTUHKSu6W0vMcixFZdKp6acrV2ktAdh+kShUUnUNIn/yO+P5MZan6F8NdDcg4NQsaafxWGFM20oly+yD8LhawhkDzN0XWdZUQQqFzV/b/azij0e8dLMkY8P7qSOnTF7jO2UQXjfFlZIwy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79wGeATmNNYun2bNC1XOFvoVX2yNBG/3Nfm5BZ9WayI=;
 b=SyPP8SSdeuFguYf/WA7exhJrFhjWwFFXgSiRAMaVP1uCWaOXTytnbImyRInexuzwswazjEEA6JMhyNaBbEUvaQHFhDHS4+bFsbwWfW9gextF1nsS6P1NnBiRsIu5K5Nmd5sdqPcI1cx+YXDuYbDCcanSGLVi2CHk6FGM1o9+cBDwmaPCHb7JqpInUk82CP2UQ4Psm+8dY3zCGp7nd5CDOwYIf7Wcx7tWJ9HQw53hlBDqN+LItSOxSMXPxVxbDdO3G1EEFnwCnWIJzxznpHQ6mNOf4fB5C8/u6qFIvw1t+tniUA+Lod2bG/vk82UC+MBoCq5sNVIB0PD8C2liywtOFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79wGeATmNNYun2bNC1XOFvoVX2yNBG/3Nfm5BZ9WayI=;
 b=3XzaVGIB8KQNcZSzatAj0Yjrf/6N9q5GHFsI/uLmZs02ODHTKGKU+ZK04mok1M5GoNx1mDB4UYR79JInTTZDqG/TFH3FXG6BNBThl3srcsEnS7nf6kACQFzfL8zRTO7o/VFlTDMxGhR8AeK3Cf3ioLmjRFxplJImP5ys3YN/408=
Received: from MW4PR03CA0257.namprd03.prod.outlook.com (2603:10b6:303:b4::22)
 by DM6PR12MB2714.namprd12.prod.outlook.com (2603:10b6:5:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24; Fri, 16 Jul
 2021 14:51:41 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::cb) by MW4PR03CA0257.outlook.office365.com
 (2603:10b6:303:b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 14:51:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:51:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:51:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:51:40 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:51:31 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 03/12] ASoc: amd: add acp5x init/de-init functions
Date: Fri, 16 Jul 2021 20:38:00 +0530
Message-ID: <20210716150809.21450-4-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716150809.21450-1-vijendar.mukunda@amd.com>
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ceed7dd-f1d9-4fd5-2c94-08d948693931
X-MS-TrafficTypeDiagnostic: DM6PR12MB2714:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2714E45996F09B8FEFEC4CCF97119@DM6PR12MB2714.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5XzwnobYkgl+3Og1FdDXBgSqE5Mg1l5f+zio9EU0FWuOE4kOfcmyZr8LSlWPWbhZIqbY/PVKRXnnlgwzXObYwuWYFYwRRsqYrMkRMoHH3WyGh0kxyOD8m0IHrE9FP0Y+cmki6nWUVcOlTDk5qHeizHGAruTQFdaT3n1wj7AEBWtK0Z6K+HvunjJ0YVJtv5DoG6Tm/E6URjyFmiwjaXlfq7rwcC4WCQZFVOmTYvh+p5YCiqrz6L9euhAL2WeZU5ETiAY9F/u4YDR47a/nfNDH65+mZu2r1vGRonykp8vAcIuu9GiyjoQwxUVyeexiwq7WMdaB/fVfjM7/Uxb+Le5K0Wn9hv0ICchnKMw4NgoLGUNXRhVkTLfdlgrEn5iZOh2m5I9DKVTUa5VB4gZPV4rjNvvVd1eec3xbux/sQqskHXA/ohp9RNWOPj0oUutNmT0K91FDdbx7Euh8sDG6e6CHUvPEaoHhERxUdwfUrYgzMzjD0Vsj36FguTpLhuA2hNH2IQEkeoAUuqpY6MTkj0NWRQE7IA1xwBq2AShXCGWv4FSPe7vAHNKyQne5KGbF9OESMRDs2Uf3Pz1841iNGDcrTs7mhiDSWD4gkibfsdrk2ytjNsjq8csvtiCBa2QRudlr+yN+51ccvg97MBnAiSK74DS5+btAoNzeuveWringzYO/SpqroXQWl8YULpDMv0iRjsSSfBNQXsTtrVO1ZwFqY9ptre/bkOmf2x4HT7Nxwo6tDgXVVgk+IVSkgxOfrjyelyStIgpq4swkFwMvOPkIzKqMpnDX5Aq8YfSYkFyJoLo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(426003)(26005)(110136005)(8676002)(356005)(70586007)(478600001)(70206006)(47076005)(36756003)(316002)(8936002)(54906003)(83380400001)(7696005)(5660300002)(1076003)(186003)(82740400003)(4326008)(86362001)(81166007)(336012)(6666004)(36860700001)(2616005)(44832011)(82310400003)(2906002)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:51:41.5986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ceed7dd-f1d9-4fd5-2c94-08d948693931
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2714
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

Add Vangogh ACP PCI driver init/deinit functions.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 ->v2: add amd: tag in commit message
         modify condition check in acp5x_power_on()
         removed acp_power_gating flag related code
---
 sound/soc/amd/vangogh/acp5x.h     |  12 ++++
 sound/soc/amd/vangogh/pci-acp5x.c | 106 ++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index 8afa8144af4e..708586109315 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -9,6 +9,18 @@
 
 #define ACP5x_PHY_BASE_ADDRESS 0x1240000
 #define ACP_DEVICE_ID 0x15E2
+#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
+
+#define ACP_PGFSM_CNTL_POWER_ON_MASK	0x01
+#define ACP_PGFSM_CNTL_POWER_OFF_MASK	0x00
+#define ACP_PGFSM_STATUS_MASK		0x03
+#define ACP_POWERED_ON			0x00
+#define ACP_POWER_ON_IN_PROGRESS	0x01
+#define ACP_POWERED_OFF			0x02
+#define ACP_POWER_OFF_IN_PROGRESS	0x03
+
+#define ACP_ERR_INTR_MASK	0x20000000
+#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
 /* common header file uses exact offset rather than relative
  * offset which requires substraction logic from base_addr
diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index e56d060a5cb9..523b962fe35e 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -7,6 +7,7 @@
 #include <linux/pci.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 
 #include "acp5x.h"
 
@@ -14,6 +15,101 @@ struct acp5x_dev_data {
 	void __iomem *acp5x_base;
 };
 
+static int acp5x_power_on(void __iomem *acp5x_base)
+{
+	u32 val;
+	int timeout;
+
+	val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
+
+	if (val == 0)
+		return val;
+
+	if ((val & ACP_PGFSM_STATUS_MASK) !=
+				ACP_POWER_ON_IN_PROGRESS)
+		acp_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
+			   acp5x_base + ACP_PGFSM_CONTROL);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
+		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_ON)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int acp5x_reset(void __iomem *acp5x_base)
+{
+	u32 val;
+	int timeout;
+
+	acp_writel(1, acp5x_base + ACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = acp_readl(acp5x_base + ACP_SOFT_RESET);
+		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
+			break;
+		cpu_relax();
+	}
+	acp_writel(0, acp5x_base + ACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = acp_readl(acp5x_base + ACP_SOFT_RESET);
+		if (!val)
+			return 0;
+		cpu_relax();
+	}
+	return -ETIMEDOUT;
+}
+
+static void acp5x_enable_interrupts(void __iomem *acp5x_base)
+{
+	acp_writel(0x01, acp5x_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static void acp5x_disable_interrupts(void __iomem *acp5x_base)
+{
+	acp_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp5x_base +
+		   ACP_EXTERNAL_INTR_STAT);
+	acp_writel(0x00, acp5x_base + ACP_EXTERNAL_INTR_CNTL);
+	acp_writel(0x00, acp5x_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static int acp5x_init(void __iomem *acp5x_base)
+{
+	int ret;
+
+	/* power on */
+	ret = acp5x_power_on(acp5x_base);
+	if (ret) {
+		pr_err("ACP5x power on failed\n");
+		return ret;
+	}
+	/* Reset */
+	ret = acp5x_reset(acp5x_base);
+	if (ret) {
+		pr_err("ACP5x reset failed\n");
+		return ret;
+	}
+	acp5x_enable_interrupts(acp5x_base);
+	return 0;
+}
+
+static int acp5x_deinit(void __iomem *acp5x_base)
+{
+	int ret;
+
+	acp5x_disable_interrupts(acp5x_base);
+	/* Reset */
+	ret = acp5x_reset(acp5x_base);
+	if (ret) {
+		pr_err("ACP5x reset failed\n");
+		return ret;
+	}
+	return 0;
+}
+
 static int snd_acp5x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -50,6 +146,9 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = acp5x_init(adata->acp5x_base);
+	if (ret)
+		goto release_regions;
 
 release_regions:
 	pci_release_regions(pci);
@@ -61,6 +160,13 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 
 static void snd_acp5x_remove(struct pci_dev *pci)
 {
+	struct acp5x_dev_data *adata;
+	int ret;
+
+	adata = pci_get_drvdata(pci);
+	ret = acp5x_deinit(adata->acp5x_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
-- 
2.17.1


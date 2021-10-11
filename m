Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EB6428659
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:40:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E691690;
	Mon, 11 Oct 2021 07:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E691690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633930815;
	bh=yByZ5ePUgl+6XZZmewyQzi2GO4l9qu6P0LXBVkIZafs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCBeKqez2XcTVQxiUaSqYV3p6pmyeBeJYzRZ1tiujXRvSRWvdOGVFjddTOaScEi7b
	 f65IH21z+LSj3WnJ9bLl8vJKtYUtx7e9lep08eYYAOi/b755qky4UE8b6aBI0WtXQY
	 Lf3xzSBJAw8mmYqOBpJaOTV54cKM/gPheFoNCGqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2161DF804E6;
	Mon, 11 Oct 2021 07:38:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E5B8F804E6; Mon, 11 Oct 2021 07:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C368F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C368F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="AO7/lA69"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLc3nquyLzd9njD9zkE+C9OIxPjJMjxScsqwnWZwLN/Chc9/1pfU7l/mIn8fEZq+UMCF9/95wIM/ZYsN8PxmTQsxge5MHM4fchGRePxxvowQH4e5jIGHRntRdKaxq1W8Y0zKZOog/bmOR2RjX/vGULa+7699UbMJ5GCn/Tpn23yRdIsp272MCJedrgtV5VHUkOGfHgc94GGl5p6/VohRpgFD90G/Sw+I+CQAF7RhjffkI03usNsjLzW5nRmsdPEHOSO8Jg4YEJv/iXmUuTBSnpBKo2F7il+Bp0sIkhSkPwyw2wlov1Am/BFRJPB+GtJDUDIafVB3+rXyHahQbFRTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFvgQN0DB2DMUD/B6RjasXlc25OcveMTQPFh/i/8JPo=;
 b=YgzeyoXD/xba4LhZqZRSV/+F0qKFKLPhQxDLTtuG4pQsJM+TYPaHJmWZ2JgRmLUzscmxVyOF5Hg4abUWSZM1CiXteohsdbhPuTngG9V7jyvyHFfFqFUQGBTLBgDwKH8c+vdBD+usMtE6SyQdV6A+d80Dzb9cqRw3kO9qnH+OrPbIjUOPbHqJzLd76LVdj49W928UyQMlU6ii8BCS7tM9rrBasISbTkYfxjEJe+1xd7sqdU5spQ/hYGAqypWyFENHPD9Ag+lWpy72BIaflc0VgpEEaGzbmtdqP7U/0HeVVV2hCtpKq0jk+e9mb7NI1/PCbgWuhy7HdZdryTJiEwb1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFvgQN0DB2DMUD/B6RjasXlc25OcveMTQPFh/i/8JPo=;
 b=AO7/lA69zquzg2xN8b8OA+BkypLu5i+/Ec43/RNY8r3CcGv0JXFrjhm3uXOoPnCAbGopj155LzbFGbu1L3KksqSJDXx2Ug2VGEePs2lYIrit3Zrr10kSJmIw/JJ48WV3zvbEGWHd2p4vPNSDnlUu5XHmo7qM59iWT9tbBQlc9+0=
Received: from MWHPR1701CA0013.namprd17.prod.outlook.com
 (2603:10b6:301:14::23) by BY5PR12MB4243.namprd12.prod.outlook.com
 (2603:10b6:a03:20f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:38:42 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:14:cafe::b8) by MWHPR1701CA0013.outlook.office365.com
 (2603:10b6:301:14::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20 via Frontend
 Transport; Mon, 11 Oct 2021 05:38:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:38:41 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:38:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 10 Oct
 2021 22:38:39 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:38:36 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 03/13] ASoC: amd: add acp6x init/de-init functions
Date: Mon, 11 Oct 2021 11:26:11 +0530
Message-ID: <20211011055621.13240-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af6f2fa2-b11c-4685-9391-08d98c79626a
X-MS-TrafficTypeDiagnostic: BY5PR12MB4243:
X-Microsoft-Antispam-PRVS: <BY5PR12MB424342C12F1758C16927881497B59@BY5PR12MB4243.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gnHh6zQPVt9qUBvpBsM+sXDNeWYCyQJe6gxKwxEjVkiiBzLItk9jP39sggjHP3C0pRcIf70TAH/9zR+mNaVMd0NDcJ8sm9OjnI4K5fhioGuq6HhTE7YrIciVA4PUBnZeoRPfqadD7H9NwP9c8eIOPyNx/OqZ0dSw4/8xLnlj7LqT6fe9OinbR2ndrWUdW21l7nyyM+1kgnP8NCbgtlS4c97nKxZez7cMK7/1oPHVq4mkFO8Qp4Dr+VcJxpoRgzuIa/mdK/LwkJccTOQ2m0+b4qtQcUsuU0AID2W5waYuaVhR9shZxG5lnfCNMT/tt8eU3YBUr2B65TZw+mEUV1jFd5b9wqYD9DQC8Z5he0DDma2F7Rio1KrTHzHCmwORTZNfa4Q046vr9E9+tJt3091JlPQaaKH87YSITch42frlK+Ar5FuGp6jJdzDFQ62aLJQzvXGafFM1yq2l0fDCCMp5xPlg8t3Qo+PCOgmkJehxAEvlC6NmcsKEY4JFWwmA20qNgXydfhehwSRNa3PTksXbY9OTf34D4a/wIvpPfvqhliHC8OKAMLat15xyt/EETx8Gg9H1540cFCRJkHtNqvSg0FgN7g2yf3XxKtQhKFTtIakK/u3l+o7f/PEKgHvvSqwHFwmB1jzT42rmpeWBvG8Up7TKbnNnc1mEFDMMLvXLN7VCUWXNk6hDaCDS5AJuXzd7wKs6yQvJr1rxfEKM4em2+F+WqPxEpzeUyaZylwFiFuQc8AcvgFAHSXrq8/HUWSxthfRAy/TUDEl2hWzLkDzNUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(316002)(4326008)(70586007)(508600001)(336012)(81166007)(6666004)(110136005)(70206006)(356005)(36860700001)(7696005)(2906002)(186003)(1076003)(47076005)(82310400003)(86362001)(26005)(5660300002)(36756003)(8936002)(2616005)(8676002)(426003)(54906003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:38:41.8269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af6f2fa2-b11c-4685-9391-08d98c79626a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
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

Add Yellow Carp platform ACP6x PCI driver init/deinit functions.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x.h     |  12 ++++
 sound/soc/amd/yc/pci-acp6x.c | 109 +++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index 62a05db5e34c..76e9e860e9bb 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -10,6 +10,18 @@
 #define ACP_DEVICE_ID 0x15E2
 #define ACP6x_PHY_BASE_ADDRESS 0x1240000
 
+#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
+#define ACP_PGFSM_CNTL_POWER_ON_MASK	1
+#define ACP_PGFSM_CNTL_POWER_OFF_MASK	0
+#define ACP_PGFSM_STATUS_MASK		3
+#define ACP_POWERED_ON			0
+#define ACP_POWER_ON_IN_PROGRESS	1
+#define ACP_POWERED_OFF			2
+#define ACP_POWER_OFF_IN_PROGRESS	3
+
+#define ACP_ERROR_MASK 0x20000000
+#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
+
 static inline u32 acp6x_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 2965e8b00314..56fd7cdbc442 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -7,6 +7,7 @@
 #include <linux/pci.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 
 #include "acp6x.h"
 
@@ -14,6 +15,103 @@ struct acp6x_dev_data {
 	void __iomem *acp6x_base;
 };
 
+static int acp6x_power_on(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	val = acp6x_readl(acp_base + ACP_PGFSM_STATUS);
+
+	if (val == 0)
+		return val;
+
+	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
+		acp6x_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = acp6x_readl(acp_base + ACP_PGFSM_STATUS);
+		if (!val)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int acp6x_reset(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	acp6x_writel(1, acp_base + ACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = acp6x_readl(acp_base + ACP_SOFT_RESET);
+		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
+			break;
+		cpu_relax();
+	}
+	acp6x_writel(0, acp_base + ACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = acp6x_readl(acp_base + ACP_SOFT_RESET);
+		if (!val)
+			return 0;
+		cpu_relax();
+	}
+	return -ETIMEDOUT;
+}
+
+static void acp6x_enable_interrupts(void __iomem *acp_base)
+{
+	acp6x_writel(0x01, acp_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static void acp6x_disable_interrupts(void __iomem *acp_base)
+{
+	acp6x_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
+		     ACP_EXTERNAL_INTR_STAT);
+	acp6x_writel(0x00, acp_base + ACP_EXTERNAL_INTR_CNTL);
+	acp6x_writel(0x00, acp_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static int acp6x_init(void __iomem *acp_base)
+{
+	int ret;
+
+	/* power on */
+	ret = acp6x_power_on(acp_base);
+	if (ret) {
+		pr_err("ACP power on failed\n");
+		return ret;
+	}
+	acp6x_writel(0x01, acp_base + ACP_CONTROL);
+	/* Reset */
+	ret = acp6x_reset(acp_base);
+	if (ret) {
+		pr_err("ACP reset failed\n");
+		return ret;
+	}
+	acp6x_writel(0x03, acp_base + ACP_CLKMUX_SEL);
+	acp6x_enable_interrupts(acp_base);
+	return 0;
+}
+
+static int acp6x_deinit(void __iomem *acp_base)
+{
+	int ret;
+
+	acp6x_disable_interrupts(acp_base);
+	/* Reset */
+	ret = acp6x_reset(acp_base);
+	if (ret) {
+		pr_err("ACP reset failed\n");
+		return ret;
+	}
+	acp6x_writel(0x00, acp_base + ACP_CLKMUX_SEL);
+	acp6x_writel(0x00, acp_base + ACP_CONTROL);
+	return 0;
+}
+
 static int snd_acp6x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -52,6 +150,10 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = acp6x_init(adata->acp6x_base);
+	if (ret)
+		goto release_regions;
+
 	return 0;
 release_regions:
 	pci_release_regions(pci);
@@ -63,6 +165,13 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 
 static void snd_acp6x_remove(struct pci_dev *pci)
 {
+	struct acp6x_dev_data *adata;
+	int ret;
+
+	adata = pci_get_drvdata(pci);
+	ret = acp6x_deinit(adata->acp6x_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
-- 
2.25.1


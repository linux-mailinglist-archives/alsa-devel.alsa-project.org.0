Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C643172A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:24:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEA1191E;
	Mon, 18 Oct 2021 13:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEA1191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556249;
	bh=AdZ3FzvVx6JPHqutm0Rp67mnD1v+79gl3KulGexbu9g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isr0O4n6vXenVeXogPDh+EmIeiJv+6oc/nLhx2u6oJUyrL/IwNQLblfKBy1mK1Xeh
	 MpWXwEW0T8uxmYNrLmsu6WrGejuuqR1/+brWP5EXiVT10CZs6I3dMcceFDhoLOpC5Z
	 XSsj45dZQDFWIicLqW+2Ya+37fX8jPZKtMxvCdPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E93F9F80516;
	Mon, 18 Oct 2021 13:22:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7626FF80515; Mon, 18 Oct 2021 13:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71CE6F8050F
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CE6F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="fokR46y+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXlFNS8BqiP3cbe3rNFbuQiQbLm6e5gNnZG+be5cWM1sYsXCQo8KtXYZ7Dt1DxipO2edskR5qggceL+UDOlty0T4BLaF0RaVbQjyqGHUQWXMlc5roMGOU/JjZqzeEiN+gDALblJ8Q9s/cCh050ESImo3ejbAEnYT6jmv2Bh11dSObuy8ab+cjpEc4HH4+vwJ+1tZD7+6IDaC3wtDR/BCSHmkCirfhxPYfek5lgMLKFKn1dueQouvvFjbIR/u2kglUrGbLbDrxWYYyIq1N25bw63ABXfsTY/MXtYIEsZo0Cd7TGXgmEBaCrtOoJm9uIc1Znmm1A3O2cP9l9fxwJMjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFIN5JyUAgnCxWs5dyuOArOJvr2XRRyiJeh16La8sOQ=;
 b=m1BFgKsxcDxTnNgkk9DRo6h9LCOv+yfKzuMo/Y4bBDK/uACxecN9MHinI5P2ZiWscuzCpDwO/V4Mh75xqd3WX7sNss/Eu88SsWPjPdcaKL9q261GwajVSN8g12tqmp3cPTRk2/2PlHuzhDIyrwmHLi1TRTsMsFfY8HKiKTtFQwecUvgU4AL8wPxvAhoYInHYSqrukWn7s0vYQVZ57mqwaWHksNmFN6EQUM98AAKlXS4YdRL1hC7Ui9IF/j5CGZDMBSWb0IndXAU5dqmah30o4+12DQIXm/KCfqav5Pnx3bSaiIjjhHkehX4ff885PSeuzwCBOaC14YFL06V94TP/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFIN5JyUAgnCxWs5dyuOArOJvr2XRRyiJeh16La8sOQ=;
 b=fokR46y+vDiFejUwotrrySoGEh2CaLCY/Utl8VnVoQiZng/cs1FqTf7AWYxluq7WIRKxag+Rr1enV09b+N0tHudOKjfJ3kkb64x93EKEgSFylIA7irLxfZiHvLHa/L92UrU+cV6f/Q+OCF5mCV7qpo984gZmYPE4d8/EKd7G4/Q=
Received: from DS7PR07CA0021.namprd07.prod.outlook.com (2603:10b6:5:3af::23)
 by DM6PR12MB2603.namprd12.prod.outlook.com (2603:10b6:5:49::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 11:21:55 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::b1) by DS7PR07CA0021.outlook.office365.com
 (2603:10b6:5:3af::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 11:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:21:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:21:52 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:21:48 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 03/13] ASoC: amd: add acp6x init/de-init functions
Date: Mon, 18 Oct 2021 16:50:34 +0530
Message-ID: <20211018112044.1705805-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b8c23f6-39b1-424e-6c74-08d992297e26
X-MS-TrafficTypeDiagnostic: DM6PR12MB2603:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2603E9499724787D30B096CC97BC9@DM6PR12MB2603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiGrKnhQLUVmu89+GbuB56jbTmoYR23+ojsBhJ7iS/rmhxwVDstypdt+fqQz6y7lYEts2/Nh7+3IpMNg7Q3siL+9R/wGA4erglWgKUTFPkR5Iv37YkokEVtrUmZLgDN8lyXD0wMNlXHvcChZ+rjxwmb9UH0URau/qlnHU6eUldMmzbEJ83uvSCQvHjiMmXWURC0zu+zeU2N/mV6EsRd8DrAA/ts1i2dtF+XM9Mrj2UU3WA/TMIK0rGaRxvdIPMHaoHooayghC4Zk+YEUEHtiz8hMJi5vKk/0YWnJzD7PIJqHs8/h/RkduhmVjzM7ETwMHoP5z7IYwez4EjLE+wXskYrZtJi1rJs2jzdO6XGCtimTgstF31K4+MSSzDO2y696vJhn+i276wa/kxW5LZjXOOEEYT0AITMpbltAuJmV2KkB/OhHG5Ic2bKnl3J4my1O7FCcRjR28Ojqz1F78+IlNkr9TiOjoNrbq/L7BRwLGan2Gnyv+ouQyfOH/AsBWbBFe/HoA4ylGDSFqwWPxyrnyyMfVVVqyI05Y2eQnMeT0fd4V44Pg63rWdzXDndylHu63LudtmzaXZR+6zEyultokboZphXPsy7tGzEc2CMBWUDKU3bPeC6WPvDfIY1hDu2S8IpoAfdFBUiXA1BTbO2G7IunGAQNbC9d9SXKIWWt1lfFStcoZC37M63lMwBlXqDTQCBYjtmTw917pwn/mKFIVCK2GyAEcEo6TTZkh3YbH9JOm99Tmx++HD3lSmIxgu0TOlajPShj1hKX8Cp3+u+BUA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36860700001)(82310400003)(426003)(356005)(26005)(186003)(36756003)(8936002)(6666004)(508600001)(86362001)(4326008)(81166007)(336012)(5660300002)(2616005)(110136005)(54906003)(70586007)(8676002)(7696005)(316002)(70206006)(2906002)(1076003)(47076005)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:21:55.6549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8c23f6-39b1-424e-6c74-08d992297e26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2603
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
index 5c118328ea21..03af3476a97c 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -8,6 +8,7 @@
 #include <linux/pci.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 
 #include "acp6x.h"
 
@@ -15,6 +16,103 @@ struct acp6x_dev_data {
 	void __iomem *acp6x_base;
 };
 
+static int acp6x_power_on(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	val = acp6x_readl(acp_base + ACP_PGFSM_STATUS);
+
+	if (!val)
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
@@ -53,6 +151,10 @@ static int snd_acp6x_probe(struct pci_dev *pci,
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
@@ -64,6 +166,13 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 
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


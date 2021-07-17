Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC43CBCE9
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:44:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 473D716C8;
	Fri, 16 Jul 2021 21:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 473D716C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626464670;
	bh=1h4YS+0e9CaEjI3wjpBeuMIc4HAoVoVtnCrIueILIWI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDFrBMGJwmS9vaFLrvDGQ2XDUyfsYHpyuFCpPoBxvvRcf0c5Dr/IbAdaKYdeg1p1x
	 IkEHbTinJGHtVamOpfnF/m6P5UVHYd5u9698wQ7K7CJhb0CUmYBAmXNPjyAy0ausZd
	 VF66MddShurxWUisjkEkuW5gkxVBwM/ajBnxdOxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 160D8F804E4;
	Fri, 16 Jul 2021 21:42:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7F92F804EB; Fri, 16 Jul 2021 21:42:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAFB2F804E4
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFB2F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="CiF/D0wZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh/dTxBUcmHc6sp0lfvtQQc04kwM8GUV2p4H1DR87t14tvH72vkUQw4HRPyx0HQhr5UJQv6vOzW0+5gH8Z6NPJwnSVTdGzJmTTggtshRn4S3Uj8+wO5JGF04ngXunrLwSFtDtZuQ1bVuurCPot0OhOCU3zM/PeQ1gRj/5tIS/BgdM5phh0P8nCAoYv+ZiVUU2OcWTMs6sbTEyJUiKrLse9ANc1WwDh7yAddtb3Bt/6Xk9IfIzjV9uYDeeAKP0oZ9ljeORaPQkTPs2F+ly7izXRTvP8F/3xLHJJCe0tU8EQLt9uY5xwvldT7FrrOt232hGzOv4NGypTPubhgkKs+hyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+51jIDHGyeDnhRRcYsOfv22hO5bQsSxdJJ5wpCqDLWs=;
 b=RwCouTC4rglxg0qwmOuiPsptCERc5g5lKJpmkuOKyufO96+WVg+hQPVFF6dHIL+nfq92rmkacGOwrupQp7ns11DNvTuuw0ALmpgF7/gUlWGZ8t6RdRmSAT2Pa866vrEXiy0T2zbXjd8mSrU+u4+5yTgYv8o5lHD8cGkLF72yg+eA5gMlEZsGPGr1SOFYbe95thb+tsWuTjsyisvvDo0dICHRqiQ4e2J69n6Ck4sxIlrn5lRlxaC37WTdd9EMPZ2NtvkIY6hOx5AYxysXKUVw5JuTVBRQatbRhIIwth3abvzCx3VYzmY8P3Xfu5mzLntTWXL/DAjUI3WbEwfEGi/CUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+51jIDHGyeDnhRRcYsOfv22hO5bQsSxdJJ5wpCqDLWs=;
 b=CiF/D0wZB0s5wmRBpd50VaIEEpJlkKbDwEFyghSht5LbbYTiqJXSVBkA5NY+i4ElZaQztBY37aizcaqIgbd5eyM1+7qT4gmKaS7Zf8nbLkLQkl1FpN8XYPa/yB+VZr/idr0Oa/25iwugMWpwtlM+6jqok44un+Q4I8cQFBt8Xic=
Received: from MW4PR03CA0338.namprd03.prod.outlook.com (2603:10b6:303:dc::13)
 by CY4PR1201MB0199.namprd12.prod.outlook.com (2603:10b6:910:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 19:42:30 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::6b) by MW4PR03CA0338.outlook.office365.com
 (2603:10b6:303:dc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 19:42:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 19:42:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:42:29 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 16 Jul 2021 14:42:20 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND V2 03/12] ASoc: amd: add acp5x init/de-init functions
Date: Sat, 17 Jul 2021 09:30:50 +0530
Message-ID: <20210717040059.310410-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1cd8c31-1702-4c44-cf7e-08d94891d955
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0199:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01996DF9D4A433B28859D0C797119@CY4PR1201MB0199.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6+2sKg2AGsi1ZwueEoSzSIt5bPfbTTglvcm0W8jQ3kujQvAiin4TVsGOzOKAD+mtis/XSBpJ+9ajwbws+Fa96l7R0AVq0aE2nGpBB/iLyO11wHBX538msuWGWoGMGiBCBCHi2vtOeago5zkkwfk3Lb6uOQZR1oeRz3ZCVuQsGOYqIM9WIRlqpK0xTIt2QSa3eB9OHuVdyk1XKtQovYEF97jYCBA2rQX9kRtNTKizCC+7U9U/UcbNArfvdj+L4JNIvix4DhoURJo1pwEUrHpXLSzgl4PvzjaRMUI3WNWYW3Kt4EeOVMg5t4lrHG1jC7JwoDBKdRKE188aqu2ykPOSyrR7LAS5mkqwx8cJfHE4t3UtERnBfyBPo8CWXxld6AM7rI4PbAdd9lgzNtKgXgrThbgQP4np0rhRgrRSWpmHUlp5guaIMa/un1SYTenAmQMqMGoe4jQIDyuPIMU+eVB95ImBbUw3PWmWSNWNusFQmnqEfQ9oiMg4UfKfElWTdNWZ04KmAf+t4X42VuYvtPRFRi6Y/waPh3Ql5n6ARfzeqiJ0h33heurOywS3XbP0jBbB+PK0vmcATzInrxvd5MUv/HhT0Xgot4ypHorKqqcWTwFfqzyVCqmFGxXU3oaoIKR7IgMSyqzyX3EqDN4aSY5UxYjxEQx4l8tELzzM+pRmX/5ZZsKP3DmHUfgTPa21lknPKoYiix+ZajlCNl9XEl0m2k/bi7aTpGqii+tYBaDgbapmhSWAE91exxDh+6fFBewHXjHKlSP8KxVupaCKid9VkPHyxwAZfk/9wrgi7Kn7xQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(36840700001)(186003)(478600001)(36756003)(1076003)(81166007)(2906002)(86362001)(7696005)(70206006)(83380400001)(26005)(6666004)(47076005)(316002)(82740400003)(5660300002)(82310400003)(8936002)(4326008)(356005)(70586007)(8676002)(110136005)(336012)(2616005)(54906003)(36860700001)(426003)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 19:42:30.1694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cd8c31-1702-4c44-cf7e-08d94891d955
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0199
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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

From: Vijendar Mukunda <vijendar.mukunda@amd.com>

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
2.25.1


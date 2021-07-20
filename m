Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8603CFF2A
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7A2B1682;
	Tue, 20 Jul 2021 18:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7A2B1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798153;
	bh=PmJM4rbG5LYS2g3Pc1FecIOfp4xcm8P2pOaSrvzXQd4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMAjv5YPhqz7vT6f4Py6noznljy/vXNUrK/2sZ8xxmPRNmRE0fKMMPOtM9i5uJrxZ
	 ljzqGSbEB5sWpcjL6XqmoG6I2McEi2l0f38AU2YZOAn2iCqOamIhVUMroucnLQx/3n
	 pe165Pw2c1Tvql36qlS8X0f1M5qeykercrTMn68M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1ECFF804E4;
	Tue, 20 Jul 2021 18:20:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66E5CF804E3; Tue, 20 Jul 2021 18:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C32F9F804E0
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C32F9F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="WazVwO+a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlpWQ9WGAXLcOToS1fqA3ndfEVPiovBVRtVtmAzoiG8DOxa0El7VljnS49Vt2JNrWb3YN1/0Zrp9zyETEkPW60Prp0SoKm56Yhose7Hss2IZhACtcgEqFC2000jtuOfhJ/HIQpYSTO6R6nv1fCFiLrAXyDqDetH5A58NgfXZ7JBHZqw55vWiP+B9g5tXmIRkPJbfOV9WRVYmDn6L2E0LBgnO7XBZ4leBaSw7y06bsHLhPLUyXxyS85/PGiVB8xlomcwaXLw5ZjTqzzelq8QRd0gu1Cd0uEesrB88tGih8jNiIWZs+4XqJgqStTFYAWBsVLYe+ThIpbrWgedVElwNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCaL7WWa+YQbqiNLqtLpIFmE/vSUEd0KoImAUC4La68=;
 b=fxpfSh+jrO4F+pZAm5abwCAtZFWMbFZzkJ0NMw5BNaZ35Q0YKT+k+6Amqu8cXf5kceOXozkzPaVHojRxAHQCar28Zfkll3GWmKfG3WDiLrLsuOflwiJhrDHxrS2mquunetC1HTjrkful+AiLXhxULiD0hyFT7STI+ObmCewBCF/HFEUG+KrutMN/pPmLbTyuEqDWFWUK7ZTK9Zl6Xqubez7FO20ADUKNIKBCQhrTl9c86Vsp5ylgd3tTyDhe6ZVpKOsmg2CDrobvdiK2zGbvO4vTAPGvHkd21xRQj5+n4lGBsTU8EUiPF3R3x52ZZpMIor1eMuc+KAve2ksN9PwG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCaL7WWa+YQbqiNLqtLpIFmE/vSUEd0KoImAUC4La68=;
 b=WazVwO+aBhBdtv3kiBZqcW9H64Aunr9x+mJBbJebTWPOwRKUME/uMJ+wzop8KNPfsE7sTbTuAYbgtpwKyhaR5MbHDndzi0UlRjjoJCGFirnr3/5FNMhPE1dZKYq+tVpSZgvImHnGhMQJ6BHC2Vri/hfBj6PLLELa5dR9AMIRLYk=
Received: from MWHPR10CA0011.namprd10.prod.outlook.com (2603:10b6:301::21) by
 DM5PR12MB2470.namprd12.prod.outlook.com (2603:10b6:4:b4::39) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Tue, 20 Jul 2021 16:20:27 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:0:cafe::5b) by MWHPR10CA0011.outlook.office365.com
 (2603:10b6:301::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 16:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:20:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:20:25 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:20:22 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 03/12] ASoc: amd: add acp5x init/de-init functions
Date: Tue, 20 Jul 2021 22:07:23 +0530
Message-ID: <20210720163732.23003-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21ea2ca9-0aa5-45ac-f7fe-08d94b9a4907
X-MS-TrafficTypeDiagnostic: DM5PR12MB2470:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24705A99151D760512F1F61A97E29@DM5PR12MB2470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8lMAzc30BWHbolz4u5hy77LhYEJTPgDTvooTf+7Dy+XQq1vw6aHsfztNecmfPTMW3Cy0izi7d3DDM41TYEIcUJn2WLPPVwpEv9+kI1A9+HPiXUnokL1KsYo360X9qequBgyIkhTJfKO8AelOaBpRTZQOtlVnMkA0+rvft81aGwOrWNzGYEo+Q4t3Gylqk5GI7mVINRJqAdZeoQetfZVy7yiOVWvqxVgNn1anxO0fGbP61X8juGvVCZgK2vkcbvCnTDqoUzQHKeJbnBwJhFW5jfvy9BTHuUHmTE+RJbPrGSEIeuiMpKcSyJBEaAs/hsGlB3PaH2xRxLLkeZ9gfgLhOIisV49jKKehdlHCiPhhFWvQzUEuG0y7yuWk28XbZH1waCwAi7PCCvA9f/+Xjkmw6kSh9PC0Wx7bSJYBOV48MI0Hf7xBcX6U+slVyKismpRedZlDDMfcVWnPAKUdm4rDuUI80QUkiVJ+NKsr07CV1gQ8MuAJIUpoiCH3AnvrQlbpqBJkhZSveHtaWM2+MmJ8gcYfP8hKxRFv7fqUmg9ZG/a3rxtBBxD21VoAQ1S907KGQd+knw1Zo0zjaPzw/FGAglfpVJiADbHcBQff35/fVUdXFlELx8H4p38sZyVc9jq7i44TEqW5EoKyN5BjSIL3wCco2x784WdtzqeqY2+0lWi3myXyudW3DH8PFX+D1IIZBw4Ot4i0uvgGIXAGvaGJhPrSwpkHzcwUjWx9mSxJszBBKuJVw9NfRlSVx3zcl8mWRXk9o1N+0dYBdtJMpDiAhOoviPcQSthmfv1nsZveeh8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(36840700001)(46966006)(426003)(70586007)(478600001)(186003)(81166007)(1076003)(36756003)(47076005)(2906002)(336012)(86362001)(7696005)(2616005)(8936002)(8676002)(316002)(4326008)(70206006)(5660300002)(356005)(54906003)(26005)(82310400003)(36860700001)(82740400003)(110136005)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:20:27.0122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ea2ca9-0aa5-45ac-f7fe-08d94b9a4907
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2470
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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
 sound/soc/amd/vangogh/acp5x.h     |  12 ++++
 sound/soc/amd/vangogh/pci-acp5x.c | 106 ++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index 251a7e0347a7..db23fffce9a0 100644
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
  * offset which requires subtraction logic from base_addr
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


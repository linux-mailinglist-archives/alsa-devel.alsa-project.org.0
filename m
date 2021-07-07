Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1723BE2B7
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:41:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65EA2168B;
	Wed,  7 Jul 2021 07:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65EA2168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636487;
	bh=MhNBgia8sXk66U8vEQMMG7It5AkzJ0CuPBdkPKP1Qeg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=StyukU81fTjwW5JAU3kVRpHIHAvFuKuJQOxd0FASUAWGcchltFLz4m1CAOK9Em9Js
	 VV1a36nBzUQ7N6oeZHe1/tE8mXpwvZbYKV+QHLv66eC0zfUab96qq7jEkr15ZcrGS7
	 SH/HoH+NHiKSL7sA35BuddmI2F8CMhG45ywRrjaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA91EF80224;
	Wed,  7 Jul 2021 07:40:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3526F80301; Wed,  7 Jul 2021 07:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2042.outbound.protection.outlook.com [40.107.95.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E3E1F8016C
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E3E1F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="yv/38f9H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9G9gSkjSaWPuAk122iqhuliecwjLSlM2n9U1OHVhZ7j5NVrvQVGUxa+1pK+Ls5zhCPietDFhRQxXPJaiR2UryTUvfwyvYaGS7kfmpP7vA1OzHIVeI0e3vqscx1sFtKljxKIRwf9VJQAN+L/rHvJ3v6/OKfFQJN4GVhyhjg2CZfCD449jQc7i3wscR7i/Mdp1H+Adm2Z+k9CBDSkVYspjJypfnehBHgg6946gOf96DJFVCwObrtOdkegBB0mItf+vcQb1lpED84vnZ+qJ2JfGIEb2oOKrji+9q6JEI8m8wveglVes0kmTS4GmLp+Kp5aDeuGhsRMPz7yFOVQ1TbhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTCBT33SuXdC1swWyui1WS2DS+04WDUg5IreqvtjaHs=;
 b=YF6hmVPbI536ofXUZBD8Wno6gobK2GzBn4zgoBtTIV4Wh+SszpDX3qZv5wVW20nFKulDC8+PlaBUZB9pb5rYzcXJgX5NgMjCWtchtvAKM04kFo5JpwlW9cbZ/koQ2xynZ5XyFAa6JnugwmTP7CxJD3UKADoRnJU2eJKgsefvC+KUYPPX+xPg2mnumgBrru5UcSVTqdmBwq2hSfHKIedrltKACSzt2Ksi3yJOBVKKt/pD43u0GSrWEMVub/+GZyIYirelnIBZmapbQPrc5Y0avWuEQFfE8QzhWLhSOjJK97SNY2PmwL97taob/A+0c8HLDcOCsFfnFmLibS9+DA8JyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTCBT33SuXdC1swWyui1WS2DS+04WDUg5IreqvtjaHs=;
 b=yv/38f9Hl0WjGRIHHXM6B4MTuud2ExuNmxMhpK0enJidGnPDNiqfxqQB+sKkLwrHE+qwZa98lOYwlM/SPoBxxJ/pkve4izuFgMhCyt1s2TurAZ2lVPeYLghAjEX/xDpCqcH7pvEun5vQJOQpRBk8JLVnfMB8hH70wQDtzYwrMHo=
Received: from MW4PR04CA0384.namprd04.prod.outlook.com (2603:10b6:303:81::29)
 by DM4PR12MB5376.namprd12.prod.outlook.com (2603:10b6:5:39a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Wed, 7 Jul
 2021 05:40:02 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::ea) by MW4PR04CA0384.outlook.office365.com
 (2603:10b6:303:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 05:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 05:40:02 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:40:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 6 Jul 2021
 22:40:01 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:39:50 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 03/12] add acp5x init/de-init functions
Date: Wed, 7 Jul 2021 11:26:14 +0530
Message-ID: <20210707055623.27371-4-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 034a5717-b6ef-46d6-5ed5-08d94109aacd
X-MS-TrafficTypeDiagnostic: DM4PR12MB5376:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5376D1D4CF244AD337D0757B971A9@DM4PR12MB5376.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gOu1JYBk6yalJOiZneHqYpJDdk6phdg7mlMlr+92sbca1mX39nmdGpiRUnIG4S2FD28KN3qttDdtrP8+fuobit9lkO5sRFgMX9bPDnR631ptuY//EBtdLMiU3x74D2Yg6ImSLW5QgvqvQIoc1nnRV6HgXszXJcgvwwYy/Kigss7VxdEbyQRPhIyBHpgKvzvYBGln245fk3ybkxoWs9hSKyNeucnOEn7t7D7FqAo7FKNI83JnMb0jSnUVfTp12laamASpkwkTO9ULpBLl4K4wTQOKTHu1P08Lem7RmhHRP0Guf6SUxXhlkDg5IMBoBNE+0RUBxO9l+/lfRtgqgRCWipBfOrRrSwtteQyUXAXR7hU81dWm3rBMl72IS9B7xcMQNS9nHy7cA1CFY28IucYyFyXOt7DobiipMDeJfZfbe7B7msDEaB+xNQ8WYCyNTRB48kStfF4wrp/sKS2JJRM7tQoAl5kfcwmPcDJyswCPmOvwVbQArYlx6dqlkWqVmQJzx1ilJlAUB2LvfbkkPdbigpaXeH++vQNJkIXmpDHqjX/mJbXnQfKwX+Btq77aPrqk1tnbyWLh2AOe+1jN/8vhX4TzImTNghhVGFYq3v7eIiJKf1BKQUocAj/4c/wS2nmlzQz5l4TImN0HR+Wk683XbVYBF8qJBNkUQgVwkD4BPQ0Qynq/qkmDeBRyIyCuyO5UAOnbPcbSvlW5NQAQPcvmh8ElHsPpC/eAxhuQKwRa5Qo98Ulandc4JFddy1PFziTeFeGbOpur/EDG7s9DDOYV4OYuSaKSth1MrDgibKmuN0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(36840700001)(8676002)(70586007)(70206006)(82740400003)(36860700001)(47076005)(356005)(8936002)(6666004)(4326008)(1076003)(2906002)(5660300002)(26005)(186003)(7696005)(82310400003)(110136005)(86362001)(44832011)(54906003)(426003)(36756003)(478600001)(2616005)(316002)(336012)(81166007)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:40:02.4003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 034a5717-b6ef-46d6-5ed5-08d94109aacd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5376
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

Add Vangogh ACP PCI driver init/deinit functions.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x.h     |  12 +++
 sound/soc/amd/vangogh/pci-acp5x.c | 135 ++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index a5e7f7cb65a1..11b555306958 100644
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
 
 static inline u32 acp_readl(void __iomem *base_addr)
 {
diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index e56d060a5cb9..dbe8fef3e294 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -7,13 +7,138 @@
 #include <linux/pci.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 
 #include "acp5x.h"
 
+static int acp_power_gating;
+module_param(acp_power_gating, int, 0644);
+MODULE_PARM_DESC(acp_power_gating, "acp power gating flag");
+
 struct acp5x_dev_data {
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
+		if (!val)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int acp5x_power_off(void __iomem *acp5x_base)
+{
+	u32 val;
+	int timeout;
+
+	acp_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
+		   acp5x_base + ACP_PGFSM_CONTROL);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
+		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
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
+	/* power off */
+	if (acp_power_gating) {
+		ret = acp5x_power_off(acp5x_base);
+		if (ret) {
+			pr_err("ACP5x power off failed\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
 static int snd_acp5x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -50,6 +175,9 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = acp5x_init(adata->acp5x_base);
+	if (ret)
+		goto release_regions;
 
 release_regions:
 	pci_release_regions(pci);
@@ -61,6 +189,13 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 
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


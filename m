Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A11CD1D7FF4
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D4A2172D;
	Mon, 18 May 2020 19:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D4A2172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822444;
	bh=LetMFc2jqczjxVwZq6qt4E0M3Sb6oLagJgvCoVFGc8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FBchdZV2SBxuyl8nLEobn0l14xPovCy9ACq0J1ngpX5qACpBG2u3D+tKpxlP9xhN2
	 Qlm2Ztgx295EG0NCIVg4JXqGs2QBJw+y3WdgW1dOPng0nEWdMxHQy4dP0Jax0X2Gvl
	 tdMFXZjozJu5w7BoSTxXJusYlverWERKEEKUZlh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51D22F802C2;
	Mon, 18 May 2020 19:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFB53F80299; Mon, 18 May 2020 19:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75950F8026F
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75950F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="G1GJyPqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjvl11HHpQCYgF5hMYvFdJzTY5O3jNDam2clIu296oXFnhJSP8Zpu02AHUkmGbc7vORFBSCaCvdqyFnnUAlERhjd8qAbaJGST6QTkYb9L9Tvcs9lq9wf//7ayQevv8lAPs18gX9yaMTc2bh57WzmfC4XdZ57paCI46j9C2yj74/aeoZzmC3HHQMb4WthDUcEzDDBjs4sMpkdWkMMPBLaqGH2mONd+r56yBMCJ5x3blrEuI8ieiaQHd9nch/7HsztYcx6G6ifLsI5R8XTV+zaVklORJ1W2MYZWSd6JGJRQJCju+AWwPvJogi/o2YTYmSa56AcTipIkVgbaYcLXV23WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMhYSVo2+mcH2soqfH8CGL7ds+eMOgsDQI0FrC3hVpI=;
 b=itLB18UoLO+xHQHC0CZ0uMDSh4ldiVDpgmT0zj/8G+oxO3waQ0k6PxNF9vm2dtVABw71HHcXFehEHpodIQx9K3Gcsfcn6SYMIu/GBRwWyb8hNsPcF8k33yQROz7ekVY7HvxqnkY4OjFrH1edKgvZiCNA3YFcLAGy0iHmXXXn0g6mzD6PE3m5m+fZOtWQOPKLGgInleWkvYbGq4CzHzzwpUTjxNm1A7wA4x4En77ckNUDS4+kdbTNJvnHnX1RVCapvQZBEOOO/ka9nO0OwzeF9KEETz2MxTG2b19jrXcjVRjn+L7o+0IuLaFxhAKF9E2yN/3pt8X7mK1b4khA5PIYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMhYSVo2+mcH2soqfH8CGL7ds+eMOgsDQI0FrC3hVpI=;
 b=G1GJyPqQTpzk0QIFYmNWQE1FL/FMsI+PzQvdP+LiTD+ADE1nfEinO8Xe0YIvpDZ5fAKEQAL7sYAothcCQ4h2Qpxn326hXf4hS15dIPEE14KOsfS4RE5ii6LY3A+bX/9BALgQGpVAACAyeTKvx59bE0XjXrkkp8+7O0KIez8Gv3E=
Received: from MWHPR18CA0029.namprd18.prod.outlook.com (2603:10b6:320:31::15)
 by MWHPR12MB1647.namprd12.prod.outlook.com (2603:10b6:301:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Mon, 18 May
 2020 17:17:14 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::e0) by MWHPR18CA0029.outlook.office365.com
 (2603:10b6:320:31::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Mon, 18 May 2020 17:17:14 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:13 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:12 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:11 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 03/14] ASoC: amd: add acp init/de-init functions
Date: Tue, 19 May 2020 01:16:53 +0800
Message-ID: <20200518171704.24999-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(110136005)(2616005)(1076003)(7696005)(54906003)(70206006)(70586007)(426003)(5660300002)(8936002)(336012)(47076004)(82740400003)(186003)(316002)(478600001)(356005)(81166007)(8676002)(82310400002)(36756003)(86362001)(4326008)(2906002)(6666004)(26005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9272f134-2a6e-4a78-e0de-08d7fb4f4ed4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1647:
X-Microsoft-Antispam-PRVS: <MWHPR12MB16475BB8BA59E1629CC151D097B80@MWHPR12MB1647.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/Sp7tBw6zs6o98chzJKFWbcf603IDzFP0j4EylxH67Y5/poAXunsvCc+KljZ5NRBUWpesnJNsYkEQ3exVhucjS8qtNUlbJB7ibS2oEtkbVCpK9YptQdn1yaQpcMJ9dqiuvC/nYLyIABuILkUXFp9DDFtM3mEn6gW9aRiB45mkFtQGK3uPH5t799rf+e48vLzbMDeAGsvDISoDdHbdFX5+mvSmIkkUnr3P6gkEqp6HN+AvZptA9gDg7/jCWBfcsyfl31Ks/TaJG8sBoYXF/4018jZxC0ZoC4YpMLBbSggb1xZ4W3EjBSw1L70myW4H8nmFKrs60UR1vIuV+LUxZeZ0+G/rGvL+ysuV8T47D7umFYnG+ngs1CKqAst1/YzuL0JoUIeZjuAQ+PFCKiBJA5oY4klCH+jIPtBjjzP5LUxXGgHjbSsJ/T2g48cps4Sqjpm5Z6HHzAizHK31dP/gcBSTG7YfEzk7XvH68xPxZDF0Ve2neOKpPQ9zLzT3AD3F/+BdUMv7dvXOnl6qJbwjujaQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:13.8157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9272f134-2a6e-4a78-e0de-08d7fb4f4ed4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1647
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Add Renoir ACP PCI driver init/deinit functions.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 143 ++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h     |  16 ++++
 2 files changed, 159 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 56b76e355cd4..429813f6ba1c 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -7,13 +7,146 @@
 #include <linux/pci.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 
 #include "rn_acp3x.h"
 
+static int acp_power_gating;
+module_param(acp_power_gating, int, 0644);
+MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
+
 struct acp_dev_data {
 	void __iomem *acp_base;
 };
 
+static int rn_acp_power_on(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	val = rn_readl(acp_base + ACP_PGFSM_STATUS);
+
+	if (val == 0)
+		return val;
+
+	if ((val & ACP_PGFSM_STATUS_MASK) !=
+				ACP_POWER_ON_IN_PROGRESS)
+		rn_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
+			  acp_base + ACP_PGFSM_CONTROL);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rn_readl(acp_base + ACP_PGFSM_STATUS);
+		if (!val)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int rn_acp_power_off(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	rn_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
+		  acp_base + ACP_PGFSM_CONTROL);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rn_readl(acp_base + ACP_PGFSM_STATUS);
+		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int rn_acp_reset(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	rn_writel(1, acp_base + ACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rn_readl(acp_base + ACP_SOFT_RESET);
+		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
+			break;
+		cpu_relax();
+	}
+	rn_writel(0, acp_base + ACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rn_readl(acp_base + ACP_SOFT_RESET);
+		if (!val)
+			return 0;
+		cpu_relax();
+	}
+	return -ETIMEDOUT;
+}
+
+static void rn_acp_enable_interrupts(void __iomem *acp_base)
+{
+	u32 ext_intr_ctrl;
+
+	rn_writel(0x01, acp_base + ACP_EXTERNAL_INTR_ENB);
+	ext_intr_ctrl = rn_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_intr_ctrl |= ACP_ERROR_MASK;
+	rn_writel(ext_intr_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void rn_acp_disable_interrupts(void __iomem *acp_base)
+{
+	rn_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
+		  ACP_EXTERNAL_INTR_STAT);
+	rn_writel(0x00, acp_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static int rn_acp_init(void __iomem *acp_base)
+{
+	int ret;
+
+	/* power on */
+	ret = rn_acp_power_on(acp_base);
+	if (ret) {
+		pr_err("ACP power on failed\n");
+		return ret;
+	}
+	rn_writel(0x01, acp_base + ACP_CONTROL);
+	/* Reset */
+	ret = rn_acp_reset(acp_base);
+	if (ret) {
+		pr_err("ACP reset failed\n");
+		return ret;
+	}
+	rn_writel(0x03, acp_base + ACP_CLKMUX_SEL);
+	rn_acp_enable_interrupts(acp_base);
+	return 0;
+}
+
+static int rn_acp_deinit(void __iomem *acp_base)
+{
+	int ret;
+
+	rn_acp_disable_interrupts(acp_base);
+	/* Reset */
+	ret = rn_acp_reset(acp_base);
+	if (ret) {
+		pr_err("ACP reset failed\n");
+		return ret;
+	}
+	rn_writel(0x00, acp_base + ACP_CLKMUX_SEL);
+	rn_writel(0x00, acp_base + ACP_CONTROL);
+	/* power off */
+	if (acp_power_gating) {
+		ret = rn_acp_power_off(acp_base);
+		if (ret) {
+			pr_err("ACP power off failed\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
 static int snd_rn_acp_probe(struct pci_dev *pci,
 			    const struct pci_device_id *pci_id)
 {
@@ -48,6 +181,9 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = rn_acp_init(adata->acp_base);
+	if (ret)
+		goto release_regions;
 	return 0;
 
 release_regions:
@@ -60,6 +196,13 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 
 static void snd_rn_acp_remove(struct pci_dev *pci)
 {
+	struct acp_dev_data *adata;
+	int ret;
+
+	adata = pci_get_drvdata(pci);
+	ret = rn_acp_deinit(adata->acp_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index da5715759646..ec2a85085163 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -9,6 +9,22 @@
 
 #define ACP_PHY_BASE_ADDRESS 0x1240000
 #define ACP_DEVICE_ID 0x15E2
+#define ACP_POWER_ON 0x00
+#define ACP_POWER_ON_IN_PROGRESS 0x01
+#define ACP_POWER_OFF 0x02
+#define ACP_POWER_OFF_IN_PROGRESS 0x03
+#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
+
+#define ACP_PGFSM_CNTL_POWER_ON_MASK    0x01
+#define ACP_PGFSM_CNTL_POWER_OFF_MASK   0x00
+#define ACP_PGFSM_STATUS_MASK           0x03
+#define ACP_POWERED_ON                  0x00
+#define ACP_POWER_ON_IN_PROGRESS        0x01
+#define ACP_POWERED_OFF                 0x02
+#define ACP_POWER_OFF_IN_PROGRESS       0x03
+
+#define ACP_ERROR_MASK 0x20000000
+#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
 static inline u32 rn_readl(void __iomem *base_addr)
 {
-- 
2.26.2


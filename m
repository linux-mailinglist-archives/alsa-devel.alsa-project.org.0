Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D39205D9B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 22:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF2217CD;
	Tue, 23 Jun 2020 22:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF2217CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592943322;
	bh=PsjdAsAS/kcRpzsmR3mSoAcEkAxCvRPxZDb8BFMRpGg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J2nWzXzHlS+ULwRapMgYj1e2gJPa8Z0aPmJiE6cwlkSplxzAg4j25xOh4kV24SLKE
	 fzYq1b+rBHPXqt9PHOMq7ZY0x2+CZjB3vIv2vdqLmYPvFIO8mnguRUD2ic0wuHErjP
	 Rve2HcGUQkveenPI8XWJtxefJI/4jiAHQdlox0LA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB56F80234;
	Tue, 23 Jun 2020 22:13:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39A4BF80234; Tue, 23 Jun 2020 22:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED3BDF8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 22:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED3BDF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="S9+LXZs7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHzX9BfvsWs4o424wTl5ts2uPN+cnJAJzyHn9B4jd6fdf06iyWeZJiRWtghJlav+4X3qIgKdbNirjH4QRxFxiV5W1Fbkfar+l0oljEdage8/JF19xOvuidUfPmt9CuDc7rS58DO+Hn2zvQf5OVTGFIedvjath3t5WJAvvQaFeRh9EqfTGM52j+fVDaOooDLRIjNOMWFr0xM27jXyecg0aqERe4ABsviGo6RFWBJp5h72P6R1HuwxsMKPQxqwhoWNwBAMMbNZBtVv1dv/YFeo7qwQ86tFPEVK/DiP5Hc6vlvZeGzkfjzy/NGHb47Z6ztBZoxkcdI3hVbtEU2xs3sRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQezMtX1mvw9xogG2ZSNgFBzUASkH/IBZ59+2L0vj/Q=;
 b=c2RapbDSlNUPIclkdLfOnFAaGuLek1YcO0PgczwO9nabkKJxRHVoTQcq2u28F+vILcAFsw4cla+DsorJAKrl+mjTXwL6AY/c1LJ5Gsnm2WgindonVWqharNg/r2POgJn0dsQqhwtmPOCcjeGC/bVKKJeAhOMpw49Dvqx3veBUAtf/PiuCEqYbQWkrDnGTVG11XEJZcQix5TJgrUP/7UdJ39HVZFBbPN0w9J2+XTcrPDuq9yRIHdLYFsLFAJHHOucZ81b1iNHjdjFpM+99+ZcAr6A84n6tsNwU4P2PJ4ov6tRnXeR5Mx8JO+j2tE40pmimSe+u4xYhfnxdI7OtmWQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=perex.cz smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQezMtX1mvw9xogG2ZSNgFBzUASkH/IBZ59+2L0vj/Q=;
 b=S9+LXZs7Z4iLTGIoRSMLeD0mf05q7dZrenp+VUYXstYvLHZNqs8xeUZK/koqWsFQun3Zf4AOP2emM2U2+Kph1YCLCs5HoPgTXIOLQxGK+VSr9OaX5z+XIpPXL1sjSw/OvnX1bCnQ3Y73lt5ndo/lEj/1sCHjraNLp+rc4/xXzGE=
Received: from DM6PR02CA0059.namprd02.prod.outlook.com (2603:10b6:5:177::36)
 by SN6PR12MB2768.namprd12.prod.outlook.com (2603:10b6:805:72::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.24; Tue, 23 Jun
 2020 20:13:28 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::a2) by DM6PR02CA0059.outlook.office365.com
 (2603:10b6:5:177::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Tue, 23 Jun 2020 20:13:28 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 20:13:28 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 23 Jun
 2020 15:13:27 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 23 Jun 2020 15:13:25 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <perex@perex.cz>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: add logic to check dmic hardware runtime
Date: Wed, 24 Jun 2020 01:57:20 +0530
Message-ID: <1592944040-12974-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(426003)(82740400003)(7696005)(336012)(478600001)(8676002)(26005)(47076004)(186003)(36756003)(316002)(2616005)(83380400001)(4326008)(8936002)(81166007)(5660300002)(6666004)(110136005)(54906003)(70206006)(70586007)(356005)(86362001)(82310400002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a57d7467-c054-4b51-c6b2-08d817b1e47e
X-MS-TrafficTypeDiagnostic: SN6PR12MB2768:
X-Microsoft-Antispam-PRVS: <SN6PR12MB276807AECEBE03B57F32801697940@SN6PR12MB2768.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Quqnfa5qWixYwMAmY6RdV/s9d//afgApnNV/MFdaik0LDJkD33Im94zxZCCzho59jdOLidjSNNaYZpqjykK9hDNb5ql1e+ERPtTBvsZxlta309E3EbESvaxlv6rSZCWzsbqrgoTvxMIxJTMndTeUxHISDxHk+mb1+JV9FX2S0eV+cpHUPsc6/m+5X44GoRYmQ1hiQr1SXDApAIWhYCKPb+1GOoyyYwIv80Cuy7cjh4EC7kQGQac9dFC1waw/bRst6W6zubqy3iVtHjQrpDCyiRtdCOMxuQr/TB/UD1g8SCubddV7vmnmy8DrXKDfT4+wO62QnqN4lMH2FtGmEm4Uq4Yp8CVjlHuuTW1MmpKS/5WP/rglacl6Ng59J3sx1RxYhTYrgFSTrMU2eicMBPPPrg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 20:13:28.2259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a57d7467-c054-4b51-c6b2-08d817b1e47e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2768
Cc: Alexander.Deucher@amd.com, hui.wang@canonical.com,
 Virendra-Pratap.Arya@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Add logic to check DMIC hardware exists or not on
the platform at runtime.

Add module param for overriding DMIC hardware check
at runtime.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 29 +++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h     |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 859ed67..faa7566 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -5,6 +5,7 @@
 //Copyright 2020 Advanced Micro Devices, Inc.
 
 #include <linux/pci.h>
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/delay.h>
@@ -18,6 +19,16 @@ static int acp_power_gating;
 module_param(acp_power_gating, int, 0644);
 MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
 
+/**
+ * dmic_acpi_check = -1 - Checks ACPI method to know DMIC hardware status runtime
+ *                 = 0 - Skips the DMIC device creation and returns probe failure
+ *                 = 1 - Assumes that platform has DMIC support and skips ACPI
+ *                       method check
+ */
+static int dmic_acpi_check = ACP_DMIC_AUTO;
+module_param(dmic_acpi_check, int, 0644);
+MODULE_PARM_DESC(dmic_acpi_check, "checks Dmic hardware runtime");
+
 struct acp_dev_data {
 	void __iomem *acp_base;
 	struct resource *res;
@@ -157,6 +168,8 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 {
 	struct acp_dev_data *adata;
 	struct platform_device_info pdevinfo[ACP_DEVS];
+	acpi_handle handle;
+	acpi_integer dmic_status;
 	unsigned int irqflags;
 	int ret, index;
 	u32 addr;
@@ -201,6 +214,22 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	if (ret)
 		goto disable_msi;
 
+	if (!dmic_acpi_check) {
+		ret = -ENODEV;
+		goto de_init;
+	} else if (dmic_acpi_check == ACP_DMIC_AUTO) {
+		handle = ACPI_HANDLE(&pci->dev);
+		ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
+		if (ACPI_FAILURE(ret)) {
+			ret = -EINVAL;
+			goto de_init;
+		}
+		if (!dmic_status) {
+			ret = -ENODEV;
+			goto de_init;
+		}
+	}
+
 	adata->res = devm_kzalloc(&pci->dev,
 				  sizeof(struct resource) * 2,
 				  GFP_KERNEL);
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 75228e3..1462039 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -55,6 +55,8 @@
 
 #define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
 #define MIN_BUFFER MAX_BUFFER
+#define	ACP_DMIC_AUTO   -1
+
 struct pdm_dev_data {
 	u32 pdm_irq;
 	void __iomem *acp_base;
-- 
2.7.4


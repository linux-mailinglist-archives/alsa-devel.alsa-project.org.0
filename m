Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD02207BC1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 20:50:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9188418B0;
	Wed, 24 Jun 2020 20:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9188418B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593024614;
	bh=01wkH8+3pM58JVLgsMVsRLnjluM0Go+T+YBMMiMobZY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kL3Ti/DqUEqJC/P0I3Z0aG0PgwH38OxJp4XFoj3qBpH5QiyLu+u6l1KI4w7wAEbNs
	 mE0EcHL7dZE8Ae1WIF0e+l4Ispwjxi30xIt//trlNh25jy4t6ex8JrBpMW3aavEOqI
	 JezMhHv0QQT95yWr18QVFvv3G3rgLULed3/HdfEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5538F800B2;
	Wed, 24 Jun 2020 20:48:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FA87F8015A; Wed, 24 Jun 2020 20:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 993FFF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 20:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 993FFF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="aJU1Ivit"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkfNfRTMYb7+o0e/hZSjrp7kZozektxj6zQSsvuMlxWaXXFPHJTp3BW1fD0qXrl3nZ5mGAW7Os4e9f3Vb4+cltz+YXwoOULUQ4H1imHieELsRVqmkXrTkBZIaIcgGNviGK8hJfnKHA6BWR43CaxuTd9KCrm67iR+NP7ZfeqiB75Iu8vMHWqXVHtNUUCA4uQNEL/k6DdRDviP6HXCyanTHXu6bEPAXKtX2MbhXjYtUquhcefDZYCcMVsud0Q6c0WJHR4GYfC7FQBBh6oRaEl2Ubkny/8R2xN03m4kLOZXrMiAQz94cnKFElGb9uTs35erLmYgtLbSYZSkxpnXcjW/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA3tlyiIJAjO1PnWEeoltXP+m0H4Wcn22hmM1Y9arpk=;
 b=Ta/tF3mE3I6QwhVOocH65W0i3gdTb+A7ZLWvFW4xOaOacsn/dfE+a4b4UJbPxK8K5epOTRZzb01l2sENoob57WpThfdxD5hOf2mapKMxMaUpPTmnQ+3BtlutzantgPSUPf9NSsZLSCy9l8eLF/6W02C1BH+rpEdyzTD9KqdT0sd41KNMUWq21wCWUPxotedN9XzzdmykTUUM7ecGmpRRfUyFFuorhHVF3K8rAeYNGTTDoPIf2OOl1GCoxdIeRF1ILASN7qH0kRCSJaQ7lVaAAKEIBA075fnZ6EJrqX/TiitvPcaK7JDzrFXmT0PyjjxWitogiiv9//ONl67FGXlO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=perex.cz smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA3tlyiIJAjO1PnWEeoltXP+m0H4Wcn22hmM1Y9arpk=;
 b=aJU1IvitzhB/0mNbwfmrVLUuxp7jH16yaaqxE9X5IosFk9t+IbhTCtKooaJSers3IlhacSJ6d3a2N7itjYHnRWYtBn1GG1mJoJISE28kzy5Pd/uDPoh6o4PCkGnc/ZmO4XTtDqqlsDYX+gI+fKE+w6AoMjqA19+knfU04A5Wpks=
Received: from MWHPR07CA0008.namprd07.prod.outlook.com (2603:10b6:300:116::18)
 by MN2PR12MB4358.namprd12.prod.outlook.com (2603:10b6:208:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 18:48:19 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:116:cafe::e1) by MWHPR07CA0008.outlook.office365.com
 (2603:10b6:300:116::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Wed, 24 Jun 2020 18:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 18:48:18 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 24 Jun
 2020 13:48:16 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 24 Jun 2020 13:48:14 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <perex@perex.cz>, <alsa-devel@alsa-project.org>
Subject: [PATCH V3] ASoC: amd: add logic to check dmic hardware runtime
Date: Thu, 25 Jun 2020 00:32:16 +0530
Message-ID: <1593025336-21482-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(47076004)(70206006)(316002)(36756003)(110136005)(5660300002)(7696005)(54906003)(81166007)(86362001)(83380400001)(82740400003)(356005)(82310400002)(8676002)(26005)(4326008)(8936002)(2906002)(478600001)(426003)(70586007)(336012)(186003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a433711-83f1-492d-a679-08d8186f290b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4358:
X-Microsoft-Antispam-PRVS: <MN2PR12MB435844CFF496CAD2D04444F297950@MN2PR12MB4358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFJU16SQnh0yqXbpFdKI7fXW4eFg47C03LOkFo1wG7WfNuq5evwneLvptLFHjDdACOmzyOdVi7cmb638TUrEzrCyeKAUE+EXccWozI+GL63mBn3x1lZ9Wj4hHEq4kjrGoBH9p/1AAJSvtGuWUzn+XLLqtsmaUL4yo5huMW+bx/DYk8yz1EomIFdTXBccY5ekYd6WQwrU1kmcXyIw6R09ZlYoGmjxQpI+k3NLOF+UGPn1GVeI/aburBlPPZi21zxyDM7xYw0JFyP9ck5Ley99bh14WAfPAUY8+wiIZzdOtVtV3gA6ax+wCfI/SnLNNRLisJZnRVAn0KbYreKmdFFzkk00dU96ZHjy5IMENe/plBNhN1hOjwyQYCxo3jwYYUEIFLnN78LKPk5R/AEwdw5eCw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 18:48:18.0272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a433711-83f1-492d-a679-08d8186f290b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4358
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
v3: changed  dmic_acpi_check module param as bint
v2: changed module param usage -1 as default, 0 - skip, 1 - force
 sound/soc/amd/renoir/rn-pci-acp3x.c | 29 +++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h     |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 859ed67..d1faea5 100644
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
+module_param(dmic_acpi_check, bint, 0644);
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


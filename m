Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004E202371
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jun 2020 13:52:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73C5169A;
	Sat, 20 Jun 2020 13:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73C5169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592653974;
	bh=GvHYc4A8IGV7cE6DPvlx4QwZJ6+ABeW70IF8U271QJk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ozk+aEZ3CZjo5mNqlbYTwiOwhXa8FBvd0WCbmUHJysBRaodFkDsBKGUTasb7AgT4p
	 CxXsBfNmQSkQ6xi3RYVUGliEbRyCG359CfQqjVJfVC9LeYTkRsKosNcEcUGxgrHJIL
	 FA2lBmNkS4XOJAFH+jokovOZ2ch2hHrcr0zXoyzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F264FF80162;
	Sat, 20 Jun 2020 13:51:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 237C5F80171; Sat, 20 Jun 2020 13:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D566F800D0
 for <alsa-devel@alsa-project.org>; Sat, 20 Jun 2020 13:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D566F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Igz8Oe5A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUqQ1gqsxZtr15OigCn6q+0///PT4mVDcEivlM0mztVgg/a7UQNwKjFYdnlVyLWpETGXuxodhBwo3bm0OweKL0WST9nXrPHKzQfpTbyaleuN8g0maeViHpWTZJQyQPndxDHKN3jDXOgo3rWG5vKO/EZESahRC3TNbCf71VoYOg4ibVxffl/zcLlTbxjyH047MgJBWudI4093kfSLbuI73FwgkZbtfbWORm0X+gIXbSgIkt8wyTUsKanTUU7h/z0T3s+tp+1jyQUOdDdn1IF2qY9uevNECHY2TlDckzO7DPHQ2PAR/JBo9y0GLp4BUjPIvX6OvkIjxmKehj7NzjgeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6emLFSsKRu+cWRiYGfUrubaZvskOKgweD2/lrqUqHrY=;
 b=JktcHumis1HuACoF+t/jgJ7D+eH6wsKbD2YFetW5NkB73XyYS3z7n2sJ6HKW7iPsPlV7DaQXC7HYnbfpHIafTj4Bpb7M49mgKyUnwbF5+d2ChWOHTS9LFqVW6sc0UORE+yE7xsExcTnQAPMQJk59Ua/hG09+V2ATgsOonV5s7Vy61OqPIWa1x7hmlu0l/stf+myeTQyfsKumHperADQogfsE+U7o2JqU/Q3+rTcWrv6riLDhKI/ZmusPImTIMLD4Fqnd/k5RTXtZgoqTPp70FEwAqj1afHfH58T1E6I64FBCiPRDDY6A7jAKvcyTWm2M12TlqGSwznPdb35JxUrIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6emLFSsKRu+cWRiYGfUrubaZvskOKgweD2/lrqUqHrY=;
 b=Igz8Oe5A9tr4v/L4LBi3LFNdd57AXDwAPuvSTxkLLk/hCx9urxWljl3EwB912cO1eQ8lHaxUMVstvqHLfT+HSPvVbYi/wzkYo1mDTVsANm9htArdAzAFhbxy+e4MV0qioKb4grYCLHS5Ahxs53ke9nZCsS7fjLiEDG/WIG+/v7M=
Received: from DM6PR03CA0020.namprd03.prod.outlook.com (2603:10b6:5:40::33) by
 MN2PR12MB3824.namprd12.prod.outlook.com (2603:10b6:208:16a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Sat, 20 Jun
 2020 11:50:50 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::48) by DM6PR03CA0020.outlook.office365.com
 (2603:10b6:5:40::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Sat, 20 Jun 2020 11:50:50 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sat, 20 Jun 2020 11:50:49 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 20 Jun
 2020 06:50:48 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 20 Jun 2020 06:50:47 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: add logic to check dmic hardware runtime
Date: Sat, 20 Jun 2020 17:34:47 +0530
Message-ID: <1592654687-24574-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(36756003)(4326008)(83380400001)(86362001)(5660300002)(356005)(8676002)(336012)(2906002)(2616005)(82310400002)(8936002)(426003)(6916009)(81166007)(47076004)(70586007)(7696005)(478600001)(26005)(186003)(316002)(70206006)(82740400003)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac691c01-7e18-411a-4962-08d815102d48
X-MS-TrafficTypeDiagnostic: MN2PR12MB3824:
X-Microsoft-Antispam-PRVS: <MN2PR12MB382498E11A598872342A554A97990@MN2PR12MB3824.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0440AC9990
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6wBAIJobPGEWPvA6wSRogc66N/oaF2pkiND0uNuvEeLw3WgqhO4XzUri7GG5I27Zgc+sRfN5c2QDHinpLOTbOi+ibErGKyqhZgePksfBeJED8a0caj27ZDjv+gxlkWN8WNAeTjzxyHJyvYCLwy4ugdmB3LwP4Twdi+a0O2b5ZjqN+10SmQsfp47tF4TeIc3KqnlGhn/znMaYgP6RSAnoQfsWwSAFzAhNxDmymE6dA6APpuk2Cdde0AYNAGGEtdX8gRioDYYIfGei2TUhSRDPQBYR9KzB6uqfQZY3DSXAa9MLm0S8XIMXiL+mAroihkGZFjS/h53fBFw/IYaot0Ju5RdaMq92Sx5AHWyDbk3YBgTaBD2e+IAT3Z+ZtDmN+4WQdFaiGlol2rBopKUI5FXUQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2020 11:50:49.5457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac691c01-7e18-411a-4962-08d815102d48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3824
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
 sound/soc/amd/renoir/rn_acp3x.h     |  7 +++++++
 2 files changed, 36 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 859ed67..ef6eeba 100644
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
+ * dmic_acpi_check = 0 - Skips DMIC device creation and returns probe failure
+ *                 = 1 - Assumes that platform has DMIC support and skips ACPI
+ *                       method check
+ *                 = 2 - Checks ACPI method to know DMIC hardware status runtime
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
index 75228e3..fcc5dca 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -55,6 +55,13 @@
 
 #define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
 #define MIN_BUFFER MAX_BUFFER
+
+enum acp_dmic_audio {
+	ACP_DMIC_DISABLE = 0,
+	ACP_DMIC_ENABLE,
+	ACP_DMIC_AUTO
+};
+
 struct pdm_dev_data {
 	u32 pdm_irq;
 	void __iomem *acp_base;
-- 
2.7.4


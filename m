Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A907212B04
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D0616DC;
	Thu,  2 Jul 2020 19:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D0616DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593710115;
	bh=01wkH8+3pM58JVLgsMVsRLnjluM0Go+T+YBMMiMobZY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SjK3mv/mlioFjyjOYVhQmfGfV++wo6Wu4IxNS0PpNuw1GruOgGT8qETJ7dfFra98l
	 9imA84MRMOz+ZVJzX7CLrHoKFGIsbq2SSLrhuc0ZJ2/exDfe60ZykkybOvk8ZtqTxx
	 Um6wv0jACYibl60AfvtaT/Mocv15iNTcZnYUZxyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B818F80245;
	Thu,  2 Jul 2020 19:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A61AF8022D; Thu,  2 Jul 2020 19:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21306F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 19:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21306F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ujmTdace"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWyt31VFsJfq3zc5l+DWfPZlmUJ3Pmlb2jVydo8l94jWu8tezp35TUWVq0p4HPkAdu0PjqJpSnuhjbArMJE9+6jKNzdAcQ3RcE6/cUUy1M/7MXOSlY8Q1/teG6XBkluDwRR7UQ0Y6XJSnJrJksiIIEoVZwDRNosldyJNlXXrIZ1vM379nm2i9sIV1P5GduKOmQnPyyF0oUsrRrQUnbSBn3ehcqDFEyPzlhH8TLUyfGaZ5Q6dFwhe/vF/h5qSLGbHh52qZUASwtz9D6ORCleWkutQAbmcOP7epy3tojK+tWicBtgPQl9TIgNkaJY79/rE6IPf35bdIdZCe2xQLtFhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA3tlyiIJAjO1PnWEeoltXP+m0H4Wcn22hmM1Y9arpk=;
 b=TAvSnGRaIUz90eD925v1Y/w/9WINzgJtkh+pGUIHVkpxPm7Py2YeybFPwwjweSZV6TIC02OAqVFZ30op+eFQjPeP7P/FgK6W9XKPV9Z++e7meCOzk0VNSik7C1PfG+sChu/MRIi9O39MbuRCEgVcT0qgIKKiwovvizwt0e5kkirwqr/Z0zu6qkfdvna9vO8MtG6I3AYhAjQIYPHq44WiDiYHmOtpQBP+qfFCLgDJ8FCBnCn6V1kKtIylGjbCpKHQqqpRj+XJYkGZTFcCPGE7lkNAB7W7N1z2fytEnHz8MNYkuzg+Gaq8Z6Ffe7xsqg4GAXGWne9PLw9MtL/rvYmMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA3tlyiIJAjO1PnWEeoltXP+m0H4Wcn22hmM1Y9arpk=;
 b=ujmTdaceZts98nyoxJlVsIXGh+15XNmT8KHcNPAzrpmiFyTforQFQ8pI/cfY35BNrm7BMY5PlgooibXOrPj2rSq3HRAD9ju1lJFvR7I0paDfdiOZUwoIyK5D3O5nRZ+cwqZrlX+nuDL/AwnRUyCLXhT+J2Bs+41EJ5WOpUU63uI=
Received: from MWHPR15CA0056.namprd15.prod.outlook.com (2603:10b6:301:4c::18)
 by MWHPR12MB1261.namprd12.prod.outlook.com (2603:10b6:300:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Thu, 2 Jul
 2020 17:13:20 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::d2) by MWHPR15CA0056.outlook.office365.com
 (2603:10b6:301:4c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Thu, 2 Jul 2020 17:13:20 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3153.24 via Frontend Transport; Thu, 2 Jul 2020 17:13:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 2 Jul 2020
 12:13:18 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 2 Jul 2020
 12:13:18 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 2 Jul 2020 12:13:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>
Subject: [RESEND PATCH V3] ASoC: amd: add logic to check dmic hardware runtime
Date: Thu, 2 Jul 2020 22:56:52 +0530
Message-ID: <1593710826-1106-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(81166007)(2906002)(82310400002)(86362001)(5660300002)(83380400001)(6916009)(8936002)(8676002)(70586007)(70206006)(36756003)(356005)(186003)(26005)(426003)(336012)(4326008)(2616005)(316002)(54906003)(478600001)(7696005)(6666004)(47076004)(82740400003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90459b76-77c6-4d12-f26e-08d81eab37ce
X-MS-TrafficTypeDiagnostic: MWHPR12MB1261:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1261897D08948FA0E0666407976D0@MWHPR12MB1261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0452022BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /N3Kadan+NMAA3GjvKk7nLN7J/Cq2xICrtFn8PH137f3Cn+tDUl3feB0YD2qNvjE5E/ZJK8B+Zsn47QGEN0+4SEh3u8se5mb50raFCGPJ+REwlmHwZQAWpzzwBg6SxtFi26CXrl0nOy8XILJeU+YydgodbpX7/lpOZ44CVBVrbdymxCsYZ6mF+hmV3WefXBNFOClc5sKA/XvHWPbG99HEMsYg16QHS6e898MJZacWVdTT/fuXirRT3L4UiIdN8zp7rcdJ/0o6XYyG+FSJ+iQ6PfluVgELke1Q+43jiIl4x332WZP+7cgurt8xSSXuKU1NhbEUjabqLENl5S2SICp8O08ucqgk473LSYpN/zmnt24irzcIcnFfsisiDnuDFdXQXZZFus5ZoTfqz6/85imHg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2020 17:13:19.5766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90459b76-77c6-4d12-f26e-08d81eab37ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1261
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, hui.wang@canonical.com,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E17A16A39
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:03:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A71601DA;
	Mon, 20 Jan 2025 11:03:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A71601DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367393;
	bh=Q5aNoNoauKXY4uHDq9Qe4dllz1SyJPFBHOrMplBc084=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QggKE6D6mMLgEChi3zGfrdi73vE6yi5e5TUq1x9a5OGVksfJyyhn33OPTj9NrxhRp
	 1m0tdPV1w0mOJUjQl5bkXd1UCDHpMpE9tUfO6ODDWBEZQ27SR2t7K0i5nPfAkMP+HU
	 V44CSIhxSVdhZpQyI8GTXT+B+MEOSpX0Q/HpkK+U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E79BF805D9; Mon, 20 Jan 2025 11:02:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1819F805DF;
	Mon, 20 Jan 2025 11:02:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA983F80524; Mon, 20 Jan 2025 11:02:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::614])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D5DCF800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:01:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D5DCF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fkbPTpSt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaUbXqaIhTS5fPVpeAQoj+zA5jbvdM0PbeTII2kIL5FppHG3tK+9fs8FJP8775u0/FmRsf996LIbaFNnScFaS0r0Gazg54+aqIUfQufOB4ujdJoClAUTxltRxJqCqXScIvSB1YnEW47ond+sZxVpOSyerbbtVl919MAKVzQpu8V6tRmgEetEI0uXtCpyjZcTO2rvtP4wRRvuMmItBk7CIYtLPjNZdas1L7+FHR7BMprudGRuGdiU/nW5G/LOnzfJtiPgx8Ylg+kg7ljj9sMPwKBk3CxuFWbjHhXzRnSiuOlLudvDilubwqHbjoeEKNMJY85EjZL9mUj7glzJDtIXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2d4RrV6LRK8gp/01u9Ug0u3GqsFw/mlkJXCD6vAyb0=;
 b=lzDYRI4ImxSgmCFiRKpjRHJTTwmG9speATA++1kz0ZdOLx/eTaNBoconB+YcJJmaGK14EQLFYBOdRc+3eL2E5MuhttZ+5sNcalilrEY4J+/c+pmexgM9UaaO/tbTJt/sPLlt1C8311TYBPkmyfOjipJfz633iaTjgnFQTraFS+CiuoAr4ebszuap4KaIio7hh8b/1sWXNF2aGiguMzsEV3KnTqB6NqUg8U8+iabv/bhch+uz0JmAxOCZFrfnVBokpSR2PgYsNgk/TyzWN1txyv8OT4PRAnhhZX26sCK2Gfi+X4f7q7SxYMGsKsvx/zoNQkGUQM4iOkKTyfjBYW3IyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2d4RrV6LRK8gp/01u9Ug0u3GqsFw/mlkJXCD6vAyb0=;
 b=fkbPTpStl8GwvKsy/+mdFtXje7emGWww9KhirF8eEMfJHg3bzV3z/shuWYmEO2xsmPR4DwzhtuzCYOBpW7Sw/3lhwBn2PcvNAOROJR9YORoRInC7h2e/RNJyEQQU1tk9DAN2A1HUGX4pBB9pXkb0dB6w4pIjqPrPyDhfnGjETxI=
Received: from CH0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:610:b1::26)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:01:53 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::fd) by CH0PR13CA0021.outlook.office365.com
 (2603:10b6:610:b1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Mon,
 20 Jan 2025 10:01:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:01:53 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:01:49 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0 and
 ACP7.1 platforms
Date: Mon, 20 Jan 2025 15:31:09 +0530
Message-ID: <20250120100130.3710412-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS0PR12MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d4e691-83b3-4f3a-d65a-08dd3939773a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YtS6mxYfFaAVhfaOm4YXWVgy6X+t0Q460MRwSSX4f/jviVGwPS7Dn0o1X/AI?=
 =?us-ascii?Q?tuypIFPa80+vdpr9ug13WzSTMlHJ1foooMGCzLE8jy9hB0liKF1nQ92Zvsj0?=
 =?us-ascii?Q?CmC/e3+/T8kWXRodFIeEF4aHXePkXWxTyYttQ1+mBXGtrdYGb1o9fJpdhEFj?=
 =?us-ascii?Q?eIRdowXJFXj4OPDQ4DtWQoyogq/65sg7/vm4WJO99xfGt1Qc9XhtMh6UlGVC?=
 =?us-ascii?Q?P0AQFUfeFO7cKqG9LCqxZoxQfcpq4mPU1CbRMWt9SfNSbojwl/zzFXkyMy9t?=
 =?us-ascii?Q?IQlc7YSuRJSW73sx6bRbC7gbQkI9evcyCASRHrKlmZwpbbe+i+zu4mVYDlte?=
 =?us-ascii?Q?hDAKp4wBPFxRqDH3MB/Xum40FXAJs1G21cWpEAsvrsiCr+PHXc/LqgO2CNNK?=
 =?us-ascii?Q?K0e+plVrT1TQudCX6wHa8g6qJbZWFdOQ0IMIZwdGq1qRcpnVw6R/oEePzVMq?=
 =?us-ascii?Q?jvuSHwaIw+mlmzKrrpgi9HGKYnrZuHltScBnDFFdzn+W7Zk+jWyNz6Gx9uLL?=
 =?us-ascii?Q?vE2n9XSGomJrfRfPmGRnBJLcIk4UObeqq6akDqTqVMJkiJuGaOTul1F8e9ly?=
 =?us-ascii?Q?hgCPKjb2OUne74wX7PmxtXLaoWrsVzRGExINQgEmOqerFkKQHxi+NpDXC9QE?=
 =?us-ascii?Q?ILnT/KdWgKql8ykWHE9o1hn2/GiPftU+Y+Af8vKGUFStZVw1roAlRPJpp2OI?=
 =?us-ascii?Q?Gw+tp0rrHx6tYBpkSlQiO85Y4OCp1B/jKYYdtOESjaZgH8ua6MBHA8Stc6xq?=
 =?us-ascii?Q?N9u3uK2E2rfoO2hUcZFzBci1tDF9zJa3uD53zyeQgncQMyelu/SlqhVAq4Mh?=
 =?us-ascii?Q?K6AOYuw9RvbYUe91TSddu+STx4VbPN9YSnHcQLy+Apl6wj/bWpb3RpW6EZHR?=
 =?us-ascii?Q?72yCmEIWpulOR+FcyywHRQnQod0W3yMqDt19OTQIiQpr7QwurtGSpgNT2OM8?=
 =?us-ascii?Q?B8caFtVJB+NFghpIlyT/RxAk5+LYHY8KKm2X6YuEv4WPoLWqQLb1v8TWAZzY?=
 =?us-ascii?Q?e9CFtAW5izsFkYvP3Kb8ZauE1dgQhwbgUAu3DefBp6zg+Sojgr+AZXlr+vaZ?=
 =?us-ascii?Q?8/jIu1b0jEBkHSqACr6KoA2veY+Ya+ajqVjVV01r2+y8ImqK1B/zHwCPV/kB?=
 =?us-ascii?Q?h7lO8jxYT80bBpBPaWCSGrtUBROA15MQXEStDfnlPSzR3DR5egQAIBxoTRAa?=
 =?us-ascii?Q?UgrEK46v61PW04SMQRlnlTzEEKj6ls5J2el5FK/ZCwTFSPDnEMOK0Ye9tb1m?=
 =?us-ascii?Q?Rmhx/M5HRjEorgDqBocytrMEGVdCiuNZ9ni+mvVEbuQJfVBBH0YKHjk7vG9L?=
 =?us-ascii?Q?gdwKPtNHFAuTj+3YHlmC9XqMEYp8aNa3Uum05v4IGJpsZ3Qr4qn3JqudjeUH?=
 =?us-ascii?Q?wojoBkXJiTMuOV6HFnYEubBAB+OdvvuM4nE7m3gZRdyfL3hdxlQHCnjfOE/0?=
 =?us-ascii?Q?l46kPeK/796LqllLvyj+xzq33HaoaOHfPJ6LQOBq9iKE+ibJ5LKZSMWTkX/t?=
 =?us-ascii?Q?qghs7YKXzYs5XUU=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:01:53.1960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20d4e691-83b3-4f3a-d65a-08dd3939773a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826
Message-ID-Hash: MSREFMG26PJWQHYCOGN7RS6GRQI6TSMM
X-Message-ID-Hash: MSREFMG26PJWQHYCOGN7RS6GRQI6TSMM
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSREFMG26PJWQHYCOGN7RS6GRQI6TSMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP is a PCI audio device.
This patch adds common PCI driver to bind to this device and get PCI
resources for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  33 +++++++++++
 sound/soc/amd/acp70/pci-acp70.c | 100 ++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 sound/soc/amd/acp70/acp70.h
 create mode 100644 sound/soc/amd/acp70/pci-acp70.c

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
new file mode 100644
index 000000000000..28a46f0c2026
--- /dev/null
+++ b/sound/soc/amd/acp70/acp70.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ACP 7.0 platform Common header file
+ *
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <sound/acp70_chip_offset_byte.h>
+
+#define ACP_DEVICE_ID		0x15E2
+#define ACP70_REG_START		0x1240000
+#define ACP70_REG_END		0x125C000
+#define ACP70_PCI_REV		0x70
+#define ACP71_PCI_REV		0x71
+
+/**
+ * struct acp70_dev_data - acp pci driver context
+ * @acp70_base: acp mmio base
+ * @acp_lock: used to protect acp common registers
+ * @addr: pci ioremap address
+ * @reg_range: ACP reigister range
+ * @acp_rev : ACP PCI revision id
+ */
+
+struct acp70_dev_data {
+	void __iomem *acp70_base;
+	struct mutex acp_lock; /* protect shared registers */
+	u32 addr;
+	u32 reg_range;
+	u32 acp_rev;
+};
+
+int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
new file mode 100644
index 000000000000..23e47f619bd7
--- /dev/null
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD common ACP PCI driver for ACP7.0 & ACP7.1 platforms
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include "../mach-config.h"
+
+#include "acp70.h"
+
+static int snd_acp70_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
+{
+	struct acp70_dev_data *adata;
+	u32 addr, flag;
+	int ret;
+
+	/* Return if acp config flag is defined */
+	flag = snd_amd_acp_find_config(pci);
+	if (flag)
+		return -ENODEV;
+
+	/* Pink Sardine device check */
+	switch (pci->revision) {
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		break;
+	default:
+		dev_dbg(&pci->dev, "acp70 pci device not found\n");
+		return -ENODEV;
+	}
+	if (pci_enable_device(pci)) {
+		dev_err(&pci->dev, "pci_enable_device failed\n");
+		return -ENODEV;
+	}
+
+	ret = pci_request_regions(pci, "AMD ACP6.2 audio");
+	if (ret < 0) {
+		dev_err(&pci->dev, "pci_request_regions failed\n");
+		goto disable_pci;
+	}
+	adata = devm_kzalloc(&pci->dev, sizeof(struct acp70_dev_data),
+			     GFP_KERNEL);
+	if (!adata) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+
+	addr = pci_resource_start(pci, 0);
+	adata->acp70_base = devm_ioremap(&pci->dev, addr,
+					 pci_resource_len(pci, 0));
+	if (!adata->acp70_base) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+	adata->addr = addr;
+	adata->reg_range = ACP70_REG_END - ACP70_REG_START;
+	adata->acp_rev = pci->revision;
+	pci_set_master(pci);
+	pci_set_drvdata(pci, adata);
+	mutex_init(&adata->acp_lock);
+	return 0;
+release_regions:
+	pci_release_regions(pci);
+disable_pci:
+	pci_disable_device(pci);
+
+	return ret;
+}
+
+static void snd_acp70_remove(struct pci_dev *pci)
+{
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+}
+
+static const struct pci_device_id snd_acp70_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
+	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
+	.class_mask = 0xffffff },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, snd_acp70_ids);
+
+static struct pci_driver ps_acp70_driver  = {
+	.name = KBUILD_MODNAME,
+	.id_table = snd_acp70_ids,
+	.probe = snd_acp70_probe,
+	.remove = snd_acp70_remove,
+};
+
+module_pci_driver(ps_acp70_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP7.0 PCI driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


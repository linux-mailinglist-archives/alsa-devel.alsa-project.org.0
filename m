Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3379F743B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:51:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55C7260251;
	Thu, 19 Dec 2024 06:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55C7260251
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587479;
	bh=9WGb8A5ee4kLfkR9ePLod0YqPWGev1RzQaJsqsrr8D8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YpY0zrkU73E+2ehFesxyo9lekEljkyRX+OMGzNmb9VQRafM+yVzOFE5cEZbf3rB9x
	 KtNvcmB6TP8iW+qgYQ9P8geiXyEO4YtRjrp9Sr1B1pRqVzYGBydChzyHE+6U7/NLEr
	 chIlz9NO8YKpm0OJ01mLGnI+v+hS/vAhGKV6Oa4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A8B3F80615; Thu, 19 Dec 2024 06:50:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76BB0F80602;
	Thu, 19 Dec 2024 06:50:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9591AF8049C; Thu, 19 Dec 2024 06:50:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D6F2F8020D
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D6F2F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PJtUobPb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJuJ40017xHAO6Z6hNLZfT8DZ4FUM/PHcl8NaDSjmjEA1f8h5VA31U0rNkl4eZx0C87nUR7tDAUW/XDjTctLs2dpSXrqRtQzCT3njRtSga/aczMpO5eEBe/37iflqH4siqKPlSP6dLQiB2ic5TS7NFTM038kToJbfFTwvVM4YYNtXAIWm4zsqaEPnDvlz+NCBt5uf0lnNBlR4sOVnR+GrLzG3fWhOSawRPsqe41Ft1PAN+hN+umX0BoDkcGpVMsa2JYCEFrql443C/KJ6//8rp9BcQcmktrPv4TmbWgkBExWcqkbjQxr8C585nfVDic1zmuaFYo+2oPUro3Lcelq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=is0ljY+jrvV377UZxYtaTa7kQh3b1ki/xBEhg8a6QkE=;
 b=TWFXzU8K/xenK+NJUeO/fsMr4s586+N2UMtNY2uyeGcc61FFQl06OTpHGKxcxzCbGXGpXI6Uh7tZ0nz3LACMHt+HZQvrc+8R1oIKIGhcEKNI/zQfTvWSdGXIJuXfocxzM516HKBZmeKAJRwcEkjjTp27gDJd/bp79c3Atis2pCK+vsixGaVgxwYWcUZ8ChBfQe75Pz5aiNyveHRzOaN2ojv1JMWrkTRwloWoLYjKsjzFEbAjlnZC6AZBWOEExtNUSwiXwcXODA2pl7Gk5r+jOjPqvffSawrsNcNqkp4YU/wJto1Ejzp/VZi3PnsVfCndfslqHuVSXc0/Ck3SisQzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=is0ljY+jrvV377UZxYtaTa7kQh3b1ki/xBEhg8a6QkE=;
 b=PJtUobPbJTI8pkZn361SvoKM4wVYdM0r42uryZK80UAbp1m7v43opEv8iw7BzoCLa50P4f2PuM6+AKViG/cfVHdxfKVxFQlQDgyPe+5CXEHsq5sGPLwxSMKP8+vB+9ehpeQDOKduB6NbAwobuljqvOXqqsBY0caSEC3eInXPHpQ=
Received: from CH0PR03CA0295.namprd03.prod.outlook.com (2603:10b6:610:e6::30)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 19 Dec
 2024 05:50:17 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::c6) by CH0PR03CA0295.outlook.office365.com
 (2603:10b6:610:e6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:50:17 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:50:13 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 04/21] ASoC: amd: acp70: add logic for scanning acp child
 devices
Date: Thu, 19 Dec 2024 11:18:40 +0530
Message-ID: <20241219054857.2070420-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: 489c3a68-7153-4385-f55c-08dd1ff1043e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?67LJs9zP7ov2iXM5E8yPGENQll6UJkDQexfagx3ucZaOB3plPkhkz8FH5+/0?=
 =?us-ascii?Q?3aTJA9QS0xPLtZP6Ik5hT5DkATH62+K4HHJRqDblN9FRFBcwtr34RjpnSS17?=
 =?us-ascii?Q?kiNhbosBi4/TZqgUi5a1+VwKMzaPv747dEll1bDbGnh0HdODZjqXJAjsyD7e?=
 =?us-ascii?Q?jFen3SFU64Q6O+EB9lVg5HCDiDguT4tcPnslNTOPNiTlYbE2IlimSB+KTC3u?=
 =?us-ascii?Q?yC43qBeY5/fln7sx4gqHqBnvbM3CQaeUuBC8WKTUBrJZYnoC1GTyIZ5/GquQ?=
 =?us-ascii?Q?cEfcApTLrliyW9IKokw6XDoAnJRrinEacJo9VtVap0x9paSYOw2JAW2CxlJc?=
 =?us-ascii?Q?WQiY6DmrLrZ0WKb632TFVeGsrjJjalak3sjRTxOOuQYd1FkiZ2Mw6RmRVYUY?=
 =?us-ascii?Q?k+y+EiFxFKUmQPt1AaZQSj4ZataJYWWGnm6izM4O37rqhV0CD0OCOkP3r9bF?=
 =?us-ascii?Q?pssAEJs7Tqo8D9faDORLbLesnntweSOlxDa5LqQY3/Ff3eNqVIQU6zVZFpOm?=
 =?us-ascii?Q?BR0u5LXWOyc761pWKax2vP7Ar31qSPWARSfSwbU9GOd0t3OWoNtOZwJWkYhj?=
 =?us-ascii?Q?DN94Nflc8H2fA/3BcTQD9FECzstTXGYIhuP5hTRYd19F/vfb8II0MuhcGgxP?=
 =?us-ascii?Q?FRsGD8fkRTqf2e1FYadasqRxjlshkmXLjDqVvJ12ZZdCkJoCwkqmtshxxSAN?=
 =?us-ascii?Q?UIUPHjowBl4MMOFj2i6gccbEYV3uI8MzFIrvI9BTS0T0XTRN/1uw+igOyOAP?=
 =?us-ascii?Q?x9n2bLZ3trs0ETzaJThVsNELeijMTyYiF4qw3dEfGSOm3/0LAgzXnDI28XqC?=
 =?us-ascii?Q?q7xxOp8R5AXk50cPjfPeMK6SwvufCdtsY7I6YuMV0JmVnjtNqLSfE3CTnaWl?=
 =?us-ascii?Q?ZDB1K0Z+rgSACV/BZUeSMNW4eVrJQICYKSnFpBnjonta/00sGX/3WnA/VMoi?=
 =?us-ascii?Q?zvtgyuR+fXZ7pBc6YFVqozwAEWvQLsshxC6dI3PumwyrL1/hL1Az5uKPmHA7?=
 =?us-ascii?Q?EG8XaSpZ1NQl/7ZDzy5vOPLwbyCKtiVVdm7x2HOXRp2mQDZ2g03FsgLxeorw?=
 =?us-ascii?Q?FXjGZwm/L6uuFY6dWgZuydSHx24O1UPJkGqEau3jxwTgUEvQ8572S6pgmA4d?=
 =?us-ascii?Q?gUARaUfGq+euAgb0cC/zpe96wwnQ59NJWDBUVvb152pq2ude6ZV8wy1BnX6m?=
 =?us-ascii?Q?c0ztYXWFx0o1wDUknAF/1InTMPSYpZfiWPtysDPIGp71lNtpaFPlnhClkYTC?=
 =?us-ascii?Q?JhX4+bEt95bPiHitLXQRhUhsfLxWb0jtMrculPLWHWEbRb4va7/C1mkAhyJ3?=
 =?us-ascii?Q?LcE2MjLTbenP3I6qw1KPUBl7j2k5cDhlaL6vza8Biu3yJRXyA7USdZStW+jk?=
 =?us-ascii?Q?mBO8L2RoJgtsRyrTvAJwevJfFvQpWJROEvxpzyZDTQRv9l64NLZ9EBWcf10A?=
 =?us-ascii?Q?sPx3vw5+6y+/zmwvd/teN8iz4+Oj4Eb0R/RgCLaIRDp+oWZ3/ugQXg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:50:17.4511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 489c3a68-7153-4385-f55c-08dd1ff1043e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247
Message-ID-Hash: NKMBGC4AEXMT3EYWN2GYVVPXMEJPGFLB
X-Message-ID-Hash: NKMBGC4AEXMT3EYWN2GYVVPXMEJPGFLB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKMBGC4AEXMT3EYWN2GYVVPXMEJPGFLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Based on acp pin configuration, add logic for scanning child devices
under acp pci device acpi scope.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  43 +++++++++++++
 sound/soc/amd/acp70/pci-acp70.c | 103 ++++++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index b6f0f75de91d..1b20de75876a 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
  */
 
+#include <linux/soundwire/sdw_amd.h>
 #include <sound/acp70_chip_offset_byte.h>
 
 #define ACP_DEVICE_ID		0x15E2
@@ -28,21 +29,63 @@
 #define ACP_EXT_INTR_STAT_CLEAR_MASK	0xFFFFFFFF
 #define ACP_ERROR_IRQ			BIT(29)
 
+#define ACP_DMIC_DEV			2
+#define ACP70_DMIC_ADDR			2
+#define ACP70_SDW_ADDR			5
+#define AMD_SDW_MAX_MANAGERS		2
+
+enum acp_config {
+	ACP_CONFIG_0 = 0,
+	ACP_CONFIG_1,
+	ACP_CONFIG_2,
+	ACP_CONFIG_3,
+	ACP_CONFIG_4,
+	ACP_CONFIG_5,
+	ACP_CONFIG_6,
+	ACP_CONFIG_7,
+	ACP_CONFIG_8,
+	ACP_CONFIG_9,
+	ACP_CONFIG_10,
+	ACP_CONFIG_11,
+	ACP_CONFIG_12,
+	ACP_CONFIG_13,
+	ACP_CONFIG_14,
+	ACP_CONFIG_15,
+	ACP_CONFIG_16,
+	ACP_CONFIG_17,
+	ACP_CONFIG_18,
+	ACP_CONFIG_19,
+	ACP_CONFIG_20,
+};
+
 /**
  * struct acp70_dev_data - acp pci driver context
  * @acp70_base: acp mmio base
  * @acp_lock: used to protect acp common registers
+ * @info: SoundWire AMD information found in ACPI tables
+ * @sdw: SoundWire context for all SoundWire manager instances
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @acp_rev : ACP PCI revision id
+ * @is_sdw_dev: flag set to true when any SoundWire manager instances are available
+ * @is_pdm_dev: flag set to true when ACP PDM controller exists
+ * @is_pdm_config: flat set to true when PDM configuration is selected from BIOS
+ * @is_sdw_config: flag set to true when SDW configuration is selected from BIOS
  */
 
 struct acp70_dev_data {
 	void __iomem *acp70_base;
 	struct mutex acp_lock; /* protect shared registers */
+	struct sdw_amd_acpi_info info;
+	/* sdw context allocated by SoundWire driver */
+	struct sdw_amd_ctx *sdw;
 	u32 addr;
 	u32 reg_range;
 	u32 acp_rev;
+	bool is_sdw_dev;
+	bool is_pdm_dev;
+	bool is_pdm_config;
+	bool is_sdw_config;
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index a98407fa2cd2..d360dfc396ad 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -5,6 +5,8 @@
  * Copyright 2024 Advanced Micro Devices, Inc.
  */
 
+#include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -93,6 +95,99 @@ static int acp70_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_AMD_SOUNDWIRE)
+static int acp_scan_sdw_devices(struct device *dev, u64 addr)
+{
+	struct acpi_device *sdw_dev;
+	struct acp70_dev_data *acp_data;
+
+	acp_data = dev_get_drvdata(dev);
+	if (!addr)
+		return -ENODEV;
+
+	sdw_dev = acpi_find_child_device(ACPI_COMPANION(dev), addr, 0);
+	if (!sdw_dev) {
+		pr_err("%s No SoundWire devices found\n", __func__);
+		return -ENODEV;
+	}
+
+	acp_data->info.handle = sdw_dev->handle;
+	acp_data->info.count = AMD_SDW_MAX_MANAGERS;
+	return amd_sdw_scan_controller(&acp_data->info);
+}
+#else
+static int acp_scan_sdw_devices(struct device *dev, u64 addr)
+{
+	return 0;
+}
+#endif
+
+static int get_acp70_device_config(struct pci_dev *pci, struct acp70_dev_data *acp_data)
+{
+	struct acpi_device *pdm_dev;
+	const union acpi_object *obj;
+	u32 config;
+	int ret;
+	bool is_dmic_dev = false;
+	bool is_sdw_dev = false;
+
+	config = readl(acp_data->acp70_base + ACP_PIN_CONFIG);
+	dev_dbg(&pci->dev, "ACP_PIN_CONFIG:0x%x\n", config);
+	switch (config) {
+	case ACP_CONFIG_4:
+	case ACP_CONFIG_5:
+	case ACP_CONFIG_10:
+	case ACP_CONFIG_11:
+	case ACP_CONFIG_20:
+		acp_data->is_pdm_config = true;
+		break;
+	case ACP_CONFIG_2:
+	case ACP_CONFIG_3:
+	case ACP_CONFIG_16:
+		acp_data->is_sdw_config = true;
+		break;
+	case ACP_CONFIG_6:
+	case ACP_CONFIG_7:
+	case ACP_CONFIG_12:
+	case ACP_CONFIG_8:
+	case ACP_CONFIG_13:
+	case ACP_CONFIG_14:
+	case ACP_CONFIG_17:
+	case ACP_CONFIG_18:
+	case ACP_CONFIG_19:
+		acp_data->is_pdm_config = true;
+		acp_data->is_sdw_config = true;
+		break;
+	default:
+		break;
+	}
+
+	if (acp_data->is_pdm_config) {
+		pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP70_DMIC_ADDR, 0);
+		if (pdm_dev) {
+			/* is_dmic_dev flag will be set when ACP PDM controller device exists */
+			if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
+						   ACPI_TYPE_INTEGER, &obj) &&
+						   obj->integer.value == ACP_DMIC_DEV)
+				is_dmic_dev = true;
+		}
+	}
+
+	if (acp_data->is_sdw_config) {
+		ret = acp_scan_sdw_devices(&pci->dev, ACP70_SDW_ADDR);
+		if (!ret && acp_data->info.link_mask)
+			is_sdw_dev = true;
+	}
+
+	acp_data->is_pdm_dev = is_dmic_dev;
+	acp_data->is_sdw_dev = is_sdw_dev;
+	dev_dbg(&pci->dev, "is_pdm_dev:%d is_sdw_dev:%d\n", is_dmic_dev, is_sdw_dev);
+	if (!is_dmic_dev && !is_sdw_dev) {
+		dev_dbg(&pci->dev, "No PDM or SoundWire manager devices found\n");
+		return -ENODEV;
+	}
+	return 0;
+}
 static int snd_acp70_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -148,6 +243,13 @@ static int snd_acp70_probe(struct pci_dev *pci,
 	if (ret)
 		goto release_regions;
 
+	ret = get_acp70_device_config(pci, adata);
+	/* ACP PCI driver probe should be continued even PDM or SoundWire Devices are not found */
+	if (ret) {
+		dev_dbg(&pci->dev, "get acp device config failed:%d\n", ret);
+		goto skip_pdev_creation;
+	}
+skip_pdev_creation:
 	return 0;
 release_regions:
 	pci_release_regions(pci);
@@ -189,4 +291,5 @@ module_pci_driver(ps_acp70_driver);
 
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD ACP7.0 PCI driver");
+MODULE_IMPORT_NS("SND_AMD_SOUNDWIRE_ACPI");
 MODULE_LICENSE("GPL");
-- 
2.34.1


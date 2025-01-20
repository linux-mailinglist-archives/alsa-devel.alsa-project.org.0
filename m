Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB45A16A77
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CEEB602A6;
	Mon, 20 Jan 2025 11:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CEEB602A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367776;
	bh=a7VNhGTT1Wr3oK0c0QFvAD8rxJlcswyFj1JY0ZreaLY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PlVsHwOfe0c1Lf7Rf/oqLZ0IMpEh/aFpZY5pMTPO90YGgaVdREsWy9OM0/xlf+l++
	 3YZoc9psgmpn6IJe/ej9YGcnnXR58dTE4Ft1p4m74q2u4j6/wxLalNlq8oQ9VP1vaP
	 4SzRM7NMjac3+7RcjJbmqW35YWzb6Y0Prk5nLGzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC367F805D6; Mon, 20 Jan 2025 11:07:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABD8F806BD;
	Mon, 20 Jan 2025 11:07:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B52F805EB; Mon, 20 Jan 2025 11:03:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7A7AF805E0
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A7AF805E0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BpGLdRgt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkxiEktzapBD8tgAIltoNLu2JRFCd5MB/l9S0TkNg5qqP+mN9BGBCvF5f0bP6OBjwA9wHXEBCIbTO2kUKUtkLNEPjmq4dBCpYo3fNN9uEHoDiC14kgCMZNQ9XqYqpFATIe2KFehqqGs7Oig9RdFowRcS9skKDVkC8nbwXlEb82oMCOvxP8Pq7tpvv+X0ue8q6VhlbvLK3J0mTsjWX7nbws5k+l7fzZ7fQwX0DLM9Zt1HkVtkhcgffgq8/CBZFQqVxyudvRsyxvxmOAJ8RIxCelIfjx2FeMr/biqoD8a4Eh2MRC2BzKfjktB+UQ25qw/qvizFsdDlKJi7yTlXcsfQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr/Z/0lT7qQU6nTJljk4sxwJ4dM23M49s3IICkAn8ZM=;
 b=I7BmK9hZvNKkvQ+WwfOhrHgrRDUjFvxUdIdo95Z7ua4++85UQ3f5JDqIqcU2qFpzbFfCYbzxsmihHd/BhUYvBTybtneKBLqxAjnwVLu8I7SXx+6l+ESWdGJjDhxGvYKNbTImnncy+q1Kjgev23jUvQFYe/Ptx7T60fxHdoqHT4YfF85nfkYkTvUgqawN1b/IFpMpncj+HztQulp4whMmZbGDAYHKLk0pHZHMPN+KO85YD6zmcu0Kib7Zed5qaO1xRcgigVBrPGkhlcqwc+4r5PJTYvmgB2c/8i4Kz9n6/kyLiovNvqOmafYPC/Xtxid1Uiddt0pZ73QZsTESBBmYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr/Z/0lT7qQU6nTJljk4sxwJ4dM23M49s3IICkAn8ZM=;
 b=BpGLdRgtTS5kORKm/xeep+FhJ5zPFgfnA1vSPj6ooqQeFfnpNHGFM3WzgmkuMCpGoIhpISwhIqgPhYIXHPAfMup9O0mD8IA3gB3tKdXAOJ+zftxr3sIoy+Y8PXqtXK82okNoUZceRz+fol13pXI+UfcM9ZfHnEQnzQylVNJy6pQ=
Received: from CH0P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::22)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:03:02 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::48) by CH0P223CA0023.outlook.office365.com
 (2603:10b6:610:116::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:03:01 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:57 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 22/23] ASoC: amd: acp: add RT711,
 RT714 & RT1316 support for ACP7.0 platform
Date: Mon, 20 Jan 2025 15:31:29 +0530
Message-ID: <20250120100130.3710412-23-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: afd302b7-b815-47d5-924b-08dd3939a022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kzwniU7hOGT/22vsmKBfwjRMfKtc/vhV8YiTbBpyHbX/VoYmytXjQk/LaR7C?=
 =?us-ascii?Q?+qA6TT0GcU/ElZTk2kVLomvzZCDAAwNP+3MPVo8/Q/n8LnK1NlQu8kbYx3SI?=
 =?us-ascii?Q?WvIGd5Cr5zVFu5DE7FlyEyD+bQIOzUeNf1I0p+tRQaZqHO5tG3CGUKsjKNeL?=
 =?us-ascii?Q?audi+AFEFJpWG7GtqLwa03heQ8OjA0jT7RwSqEOPAWGwcGOpb8Z+szPwVpz0?=
 =?us-ascii?Q?n1R7s53cVhMQNGM1rKis5OV2+CNXondpco0nlJ0JTaoaOVSla8AeenSTk+oX?=
 =?us-ascii?Q?8eL74WttwmxQm51KplJ3JpjNgrLPo4tncXiMb7ia1DZS8tIzQVt15NrjSYlT?=
 =?us-ascii?Q?MX3If8rHnWsIupX6CNN5IrNUZ+Bmx7/3HU8gG/TMxhQfjrC5aob0kOhfUpar?=
 =?us-ascii?Q?Vjg52Ao1I4cbuIwCytDcIFA4x8L31/AbstEFOX+1W26Z/69kyMhyTfe2gQ6V?=
 =?us-ascii?Q?oR4kQL8eSLxt7HSAlOx13vSynXNIo6SyEkViHYPL/ZJJKwjoeHthL1RtjKvo?=
 =?us-ascii?Q?veUOP0XiiX8nR1s1LQwwVOG3NjPipJK44HO1TUZZ0ZGIV2GvJsis7x4flmgF?=
 =?us-ascii?Q?AmLOKTz42ST9O8vdLQOpBQsk38HwZJqzaWYWN2nW2G1RUM7XKWYdgcYs2NQ3?=
 =?us-ascii?Q?0M91zEMPr2J6/XkkvVv74qVgcTxGQLskQApJhXDZzBb4W+nC8xiByXn0XJCR?=
 =?us-ascii?Q?P5O2/SqjdYhKt8pjVdziD3DoSK+roLs1DkLQ3+UD6hb2phf/FcvpaKAX1SxV?=
 =?us-ascii?Q?uhTpaS0z/h3HaKtw629OqFuI9W14lwPVtXp4FNCQkRipfbnyhX1CSehd6UMC?=
 =?us-ascii?Q?gG9whWg3mJdIsXEvOXwGGdyndgnKlULr/NEOk+qnq9Ugc9zmQAVhxY7Im4fq?=
 =?us-ascii?Q?tcMWAyl2HBKypgwUiHydKLVfxVTFL1PZ5CvVH5tb4R/3mA1j2qoOpiwlRzBJ?=
 =?us-ascii?Q?iw8CXyBZZy41idcTvmSvz8FtVKtxuwL25eEUHuP0R9qWx6gRJoTFph8HV3z6?=
 =?us-ascii?Q?8cpgDbKxV4+mXi6wf8Ce8NeIaQm7e/LYSP+fdMz2711XrZpjY3Yz7NKC8wfI?=
 =?us-ascii?Q?SS8WxkMSPOBNBXjph3YPwPl/pOq3A3d1JK7pa4iLeY27CbcnfxYPEoIuoNCx?=
 =?us-ascii?Q?HjDhvnCNAgU1BuYq5uPpd4Q0lBwbyMirjaMTSD8hiXrnTH+sPHEYZnxfd2ew?=
 =?us-ascii?Q?jCCWPJu57DTHkJUivPw/yYuqH7z/VwCWgKwsezEa8mm30DHxqivRaY5UN/5U?=
 =?us-ascii?Q?X7TSseFfvdltna/30FszVFYi/pNoVcHrPLZxsf++XXtBWjjC1BWbqwqI8kqy?=
 =?us-ascii?Q?F6z+mr9SNQZRoeoqgxtlVnUaI1pAObFfg6GNYMsjXTNppwi4YwC6R6WzfE9Q?=
 =?us-ascii?Q?Z+Smuz6BJAuR0TVWBx88Aikm16pXxIMjwIn8WZbsSxUdJpofPhT1bxqaJLra?=
 =?us-ascii?Q?WlijwKBYOnzhKXirWExMNmU758Yafg+l4cggQIg4QKVA5kGVUhYXk8XG228D?=
 =?us-ascii?Q?Vp01VlW7jaL3DY8=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:03:01.8080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 afd302b7-b815-47d5-924b-08dd3939a022
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997
Message-ID-Hash: 2OGMVGUW4GUIMBQI7MBPYMC4TCFQ6HSA
X-Message-ID-Hash: 2OGMVGUW4GUIMBQI7MBPYMC4TCFQ6HSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OGMVGUW4GUIMBQI7MBPYMC4TCFQ6HSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for corresponding codecs on ACP7.0 platform hardware
configuration.

SDW0: RT711 Jack
SDW0: RT1316 Left Speaker
SDW0: RT1316 Right Speaker
SDW1: RT714 DMIC

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig                    |  1 +
 sound/soc/amd/acp/Makefile               |  2 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 88 ++++++++++++++++++++++++
 sound/soc/amd/acp70/pci-acp70.c          |  1 +
 sound/soc/amd/mach-config.h              |  1 +
 5 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/amd/acp/amd-acp70-acpi-match.c

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index c7339acb8370..eeb940a6ee7c 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -187,6 +187,7 @@ config SND_SOC_AMD_PS_MACH
 config SND_SOC_AMD_ACP70
 	tristate "AMD Audio Coprocessor-v7.0 SoundWire support"
 	select SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
+	select SND_SOC_ACPI_AMD_MATCH
 	depends on X86 && PCI && ACPI
 	help
 	  This option enables Audio Coprocessor i.e ACP v7.0 support.
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index bb2702036338..7c75892e678b 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -22,7 +22,7 @@ snd-acp70-y := acp70.o
 snd-acp-mach-y     := acp-mach-common.o
 snd-acp-legacy-mach-y     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
 snd-acp-sof-mach-y     := acp-sof-mach.o
-snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o
+snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o
 snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
 snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
 snd-acp-sdw-legacy-mach-y += acp-sdw-legacy-mach.o
diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
new file mode 100644
index 000000000000..1f30adb6c02a
--- /dev/null
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * amd-acp70-acpi-match.c - tables and support for ACP 7.0 platform
+ * ACPI enumeration.
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <sound/soc-acpi.h>
+#include "../mach-config.h"
+
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0
+};
+
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_adr_device rt711_rt1316_group_adr[] = {
+	{
+		.adr = 0x000030025D071101ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	},
+	{
+		.adr = 0x000030025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
+	},
+	{
+		.adr = 0x000032025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt714_adr[] = {
+	{
+		.adr = 0x130025d071401ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_4_in_1_sdca[] = {
+	{	.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_rt1316_group_adr),
+		.adr_d = rt711_rt1316_group_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt714_adr),
+		.adr_d = rt714_adr,
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_4_in_1_sdca,
+		.drv_name = "amd_sdw",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
+
+MODULE_DESCRIPTION("AMD ACP7.0 tables and support for ACPI enumeration");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index 211481cf2d87..f61dd2c1ad40 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -662,6 +662,7 @@ static int snd_acp70_probe(struct pci_dev *pci,
 	adata->addr = addr;
 	adata->reg_range = ACP70_REG_END - ACP70_REG_START;
 	adata->acp_rev = pci->revision;
+	adata->machines = snd_soc_acpi_amd_acp70_sdw_machines;
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	mutex_init(&adata->acp_lock);
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index a86c76f781f9..fdf016a64bbf 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -26,6 +26,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.34.1


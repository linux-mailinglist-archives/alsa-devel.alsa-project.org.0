Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE8A2BB95
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:35:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93EB86027D;
	Fri,  7 Feb 2025 07:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93EB86027D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910154;
	bh=7X5vCo5ST658RypRcCSU1E7RLmfdeKJPk/o+dkTapts=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h5BwMNEqEm5vdPSgzaeVg62FMnj3SfeSmzvFvYGpHQwZPxVHK7V4kgULdEp9QKsM9
	 FG9zqHqmziLAuVFr7WxcZHPROcQCmergi8F4Y5Q7cwkK5QuS78++//uLdes9ylYIG5
	 lYaYGFHiResfCaejAoyjdWeaWLl0PuXrSuRVniDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2644AF8971D; Fri,  7 Feb 2025 07:30:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 149B1F89727;
	Fri,  7 Feb 2025 07:30:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32936F8970E; Fri,  7 Feb 2025 07:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0131FF896F0
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0131FF896F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qXt4foSk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4bsRHATY49wYynl5l4YPTJBZNj5T6YU8IWg6M5b9MqESrAi5F6tLv4YRVIOsoTrKSgR5H1s5H7wbXftY8LGdJKEUKHcGmcTBnu1t6YxAvtbxwJQJ7ED0r4TVER4aaaRsPbsNXXBQruJqBqcQEwbS7ZrfM1rJlpuEvV2/PSZWYH9zbAktlYvDiSZ9oFPG4H7vtP4eKqvQUIlj+BfyWW8pwoZDzcaVmpqSAwNrYg/2afWafjpTfezxh3ELalULnE8z0wmZHgsa8Y5Wkivc0qVZweCBKmQHqVPNcelB1jLi53oiWN9KpshtqBVZgjTGY6MmqFTJp95uLMXznlZ7yMLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA/cGCg8R5lVX9AlOiMY17HxDdkq2iEDfElCf1zB7Lk=;
 b=XFn40mVtGPE80iHhUVs+FSFIq+BiFD4vcDvHD6Bj0sjrppN1HpF/elvNasj/uoZM+seCM4B1Hhn1ZJjv+F1ELpi1dsg2Jo1NFb60lsLoszUlzUvte+Myw3Z/YKnEQ1CTmYrCFOV7uDDVzeYUiRxq74R2nYqI/zMptm04J+u6hc1ekdvQbtQCRU7ciKzuv70a45YROvDd+Ko+igemfUwTdceznCSKJlj5gNGRgCojhBUWRE+3LPh6P48vedrbxnNisryMQ3V0mNqv9zo8HE222D/GdjwlPd9EWy0GpNMTSwL8+d9fz8GICumKxWvble9XWHuePLkqzA22cMvS0QBD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EA/cGCg8R5lVX9AlOiMY17HxDdkq2iEDfElCf1zB7Lk=;
 b=qXt4foSkyuWdn+5fbROAflA/IhYq0f6CLTX2NfHQcYdT9Bv8S8VU20d6N/c2YMSdtUnB85PwiYGdvIfxOnLN6JReJuNrQGgBGNndc4Muzwj5QCwgWe/yPRNkJwUS93ZtrcAqbwbu/94Po5QsIu/51vkgWTtJravOUQgkBJsRtLM=
Received: from PH8PR22CA0002.namprd22.prod.outlook.com (2603:10b6:510:2d1::26)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 06:30:32 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::3a) by PH8PR22CA0002.outlook.office365.com
 (2603:10b6:510:2d1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 06:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:31 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:27 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 22/25] ASoC: amd: acp: add RT711,
 RT714 & RT1316 support for ACP7.0 platform
Date: Fri, 7 Feb 2025 11:58:16 +0530
Message-ID: <20250207062819.1527184-23-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: ed88e333-c1e5-4adf-7598-08dd4740ebe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?phfOCFI9EbRuo+eAXCxllZQNchNbZTeYIQ8c35DN2uSyxqzRtgzDnetcaetL?=
 =?us-ascii?Q?oPjx4u8kLe/I1eakkurKLFKJkijYWYujD6UDZqNfc9n/MProYyRpWlMIlutO?=
 =?us-ascii?Q?4VwUv8pUHtO5nIBgAtwO6uaAb49pN6sqsP56MlpA19EYIPnb2aXDP6vZOo6y?=
 =?us-ascii?Q?bgQNnWYyCZcGuFMkZr/FWeEeGiSU73owR+MdRJa8mAYKWxzIvU8/eIdODUtX?=
 =?us-ascii?Q?+B5h3hsk7eF4hkyhCeQA8P20C+q7qGpJ3zEr4CgQb3mc0zdtAduUzWT39vV+?=
 =?us-ascii?Q?JHFN2hyvE6v0zeZBkWlLh7pc3MmzbqLx8aX2W1DPMgcWfRQOTAazbRP7ajlv?=
 =?us-ascii?Q?Ikxtr9cPBJb97faeJHy9x6nof9/BkONcCthRxxUSQXnTBBXGVwmJzHgEJegu?=
 =?us-ascii?Q?pSRZmyfCfYocxwjoO9uEUuY8njjPylCZLSSWbJej3MmgxWl7A6PsdSq2EjIW?=
 =?us-ascii?Q?StdSgTNTrOwq56O1MAABpCRSwOKbzxeYt9riGWkDn71jVCDoV2aiRk5Tmcoo?=
 =?us-ascii?Q?uXuwcB8r0wBaK98NEbbKx6hGScFiQPwRbXiP3s74+ZEu0cCxD+XYtqTV5Lzc?=
 =?us-ascii?Q?6OzkNI03YfmRoND8Z4Uw1+KQLfVIBxKLxpJyd9z6n7ud+sI6Cb8AeAbTldo+?=
 =?us-ascii?Q?PKtupP8bZPJIxxyzqkrEYUN4yM5uywltjLsqm8RYDLOgttY4rmHvam8JCyrA?=
 =?us-ascii?Q?b2qXsDAHmKREyccUE70ULk8u8uIVohbLvaHx4+S54CNmwVop0qKuVKRG6dEb?=
 =?us-ascii?Q?VI7EjfNP1kDBzvC0Kxi2nQQbCWCVaHQYvXHAEJRZ1Y8/k41aZM7cr4STPs6h?=
 =?us-ascii?Q?qCjNICLfsGvk1+gy1eiky+WVhnNOwgp0HYSMNov0b+BGnIHL3gTO1SyRUgTh?=
 =?us-ascii?Q?Go7S8S49Smtgnn5vvQ+Wj+9Hg3qWQi7GkchY2i0fPVg+I3QRsiyl3+15T1S1?=
 =?us-ascii?Q?tbw/tkG5NERhb/ekUpARW5AK0OlPDhTvtgXJVep/kjsIGtPcoqWdLDvwqHOs?=
 =?us-ascii?Q?fgZzWaasl49uCeObwnXLXT50X2LjMWGLGCN2f9csVHD1HoZI4BJOno4XHIn/?=
 =?us-ascii?Q?WHShJJSAusI/p0olykyshpyQVVuAbOn2rrkwjdc7XHjKol5yGtBxeQWNB+RY?=
 =?us-ascii?Q?udIWUVhEzthALcby/wrTxV8MBwBX/VEP7mWs/7Yt1NCra8HxnvbpPcFKC2Zl?=
 =?us-ascii?Q?65rY5q7aoJsgH0fZA4q4za0Dv/n3wB6dEIsXLm90ZsspYnV8RV/LR6CGwKzj?=
 =?us-ascii?Q?s9XXem+jvdAUtOC91UXGw2GgVCw4QEHnvsRimnhI4gvPf/oUGAlzaH+oqrG3?=
 =?us-ascii?Q?3E9dLaFc8igAWyWjt3h+aFCcK+Rk05PRzRz4oJX+IweIZu70NH8+eej/UQRs?=
 =?us-ascii?Q?ANv3TT1/+RbeUtSlNa4gjFmgvhZZUV77QqbjxbnKgmIR7MY9lmnNrqavjObZ?=
 =?us-ascii?Q?/7V5h85C7LHUCpcmy6lGeW/pIJ7snynJi6P0aYyxAJt6xdYJefvjAgFdIndD?=
 =?us-ascii?Q?55PU8GDzM6w++EQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:31.6275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ed88e333-c1e5-4adf-7598-08dd4740ebe8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652
Message-ID-Hash: OCRWG2U5BQPMTH3DROYLJPLSG4MXYXCE
X-Message-ID-Hash: OCRWG2U5BQPMTH3DROYLJPLSG4MXYXCE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCRWG2U5BQPMTH3DROYLJPLSG4MXYXCE/>
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
 sound/soc/amd/acp/Makefile               |  2 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 88 ++++++++++++++++++++++++
 sound/soc/amd/mach-config.h              |  1 +
 sound/soc/amd/ps/pci-ps.c                |  6 +-
 4 files changed, 95 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/amd/acp/amd-acp70-acpi-match.c

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
index 000000000000..fa59b462f227
--- /dev/null
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * amd-acp70-acpi-match.c - tables and support for ACP 7.0 & ACP7.1
+ * ACPI enumeration.
+ *
+ * Copyright 2025 Advanced Micro Devices, Inc.
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
+MODULE_DESCRIPTION("AMD ACP7.0 & ACP7.1 tables and support for ACPI enumeration");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
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
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 2cbfeb07d5c4..220dca8cba85 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -632,7 +632,11 @@ static int snd_acp63_probe(struct pci_dev *pci,
 		dev_err(&pci->dev, "ACP platform devices creation failed\n");
 		goto de_init;
 	}
-	adata->machines = snd_soc_acpi_amd_acp63_sdw_machines;
+	if (adata->acp_rev >= ACP70_PCI_REV)
+		adata->machines = snd_soc_acpi_amd_acp70_sdw_machines;
+	else
+		adata->machines = snd_soc_acpi_amd_acp63_sdw_machines;
+
 	ret = acp63_machine_register(&pci->dev);
 	if (ret) {
 		dev_err(&pci->dev, "ACP machine register failed\n");
-- 
2.34.1


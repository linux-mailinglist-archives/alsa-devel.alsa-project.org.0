Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A19A64370
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Mar 2025 08:25:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B02C860345;
	Mon, 17 Mar 2025 08:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B02C860345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742196313;
	bh=iI0gR3NvOrrqg2ic3pszD/K8KgVfjbDq24Mzc05Umsc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rGVMnGruIxsBBYgwMgjEIAoTcmzY9jBw7M7VNKNaKGFtfZnZH5x5WEWtmSqdJ0TUH
	 62lhXTeQEfPHuuDuzf65AtVd5AsqkjECGR+ck/GpZJNSjK05yHsGqfCeT+HTRI4dKP
	 3xxXmu7LI/uaemU929zYq4evHMnQgIML6oYNQ3/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 140D3F805B5; Mon, 17 Mar 2025 08:24:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB9D7F805B6;
	Mon, 17 Mar 2025 08:24:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CB3AF8055B; Mon, 17 Mar 2025 08:24:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B81EF8001D
	for <alsa-devel@alsa-project.org>; Mon, 17 Mar 2025 08:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B81EF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tCbSGR2V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJK5n2/kMdT2T5tAG2+4+OzFnAV39C+12nnNQMCaBAnXJxcet/gtIPauZ6r4jNSGl0uxfQP9LKEuKKVCNxWvKXzy/u0smVQAXTWKzVwuy+2ONEU00B9JCCbF7jTIBPnVEhSDntOgJAqoj95SqvOvWUaOyv+Ke5qIvEVh2EWTgzggeZbdQkFiH3LiXlm2aUUPTOr6fBqj9EJ7+uyOX7DxYDJWfTVLhJhoDyXcraHmjjGSeCFT36U/RmVGUdOME4DMlQb8r6s4cDxLp7JEQyxa3qV3H7nmRHtPgkkaI3xJ8Cnpe+r8hhwVe+jNRWqbubp1atV5FaQd/KjmEpnCHB8x3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvbojkVN+vekQ5YjjXWUPGF5dReaEudIB070wNCXyVA=;
 b=eTTq6Bb4mISfyYh2ycxL1gLz3+TeSFIbEz3rk2lXt9dv04Q5bQpl95QajV3ryMh5MIX+Ron3Ct0e0jXN3E4YBVzkYzyN9J0Tr8mju2fZOT6Rsb3yR6/3G3EdulTEMeSbjgDxh0Aht1cG/Zc2t4mu7ewKJi/a6565eaquIxNe2F/XS3bFQPMezWfgBNhsTwr5aljetwx7wJtrLlZkqWmtCbBHjCFuna4vJfW2JrfOCZV3PmnensfM53HtJ/tJrsQZ1GzBS8ZQeX4kSOlg9J4BA1h+EvBDmODp++eejMto8DOahSwDe7h8F2V5O0tapEWAa692dRcnj5EYROPedUfzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvbojkVN+vekQ5YjjXWUPGF5dReaEudIB070wNCXyVA=;
 b=tCbSGR2VcAI1JdnOYOB7Wkg897pbqV/U544Jt0+/FjMukzCyhCmjko5IAgPkBQ7cy/im12ZvL624kguYagjkI2/JTwKA8TP2JJmg+EZd4P3PZocKK7KP/Lgg0WvHO9ecex2Fx24Sp9tNN/c8PpFHez22GzyRzqlnk7jgMSrIURU=
Received: from DM6PR02CA0086.namprd02.prod.outlook.com (2603:10b6:5:1f4::27)
 by SJ2PR12MB7992.namprd12.prod.outlook.com (2603:10b6:a03:4c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 07:24:21 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::ae) by DM6PR02CA0086.outlook.office365.com
 (2603:10b6:5:1f4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Mon,
 17 Mar 2025 07:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 07:24:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 02:24:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 02:24:19 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Mar 2025 02:24:14 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, <nathan@kernel.org>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, kernel test robot <lkp@intel.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>,
	open list <linux-kernel@vger.kernel.org>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: amd: acp: Fix snd_soc_acpi_mach id's duplicate
 symbol error
Date: Mon, 17 Mar 2025 12:54:07 +0530
Message-ID: <20250317072413.88971-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|SJ2PR12MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9e9850-f8f1-4e71-af0d-08dd6524bc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UQvnf+A+RwgXk21oeNe0UP4vXSnhOYAj01phfSzA5majXR8QH066stTIjTOh?=
 =?us-ascii?Q?qOdeGMJxQSuFTD2lfBLlaizTxqYrgEh0f2AMu/drXGMpnIOb2mP61ynRFEI9?=
 =?us-ascii?Q?UoARF4jMREMhU9JZmLCYS4O4WwgmMOQyBpVa4eLdbZB1eIhexMQAnMJHkE93?=
 =?us-ascii?Q?EPVtsD+p3sVCn+aEjgzv7+biccA/izZBehZfGchJc6/h8FLY4+CYVk/9Th3l?=
 =?us-ascii?Q?HuhjRDV3GPN4mQcIMhjsfRNe0bOVDlJIRJ0IZPu6joAV73/2fHu65OI8bcC8?=
 =?us-ascii?Q?pqznC7u+e54j+gaJL2cc6idrE+e1osh/UPaOHZr2+AaIqQkZVeQDn0xmOuhD?=
 =?us-ascii?Q?Mgrm0Dj2LsD3+6B7Xy33L3IAGip3d9xs/8xqKfJQtvXFy8vJbeh4q6RVWrqt?=
 =?us-ascii?Q?z0nd/ghF/w4CMELEMWkihdto8CUNc33Hyjg87z7L9e+r3wC9cmXBgASA1BUD?=
 =?us-ascii?Q?EmfCaPsenwHNCmdikqBN6jfO5OOc0GiWikzvVYCl4VFo2LdGBuvk2Hz8gGH8?=
 =?us-ascii?Q?S5A7xKEeqilVMqNfD/yurJss7vMgaiID1EF3+jKg0p8JiO6w+AjWVdS5RDek?=
 =?us-ascii?Q?raH4y0tNBpxAuyJjgqounYqh4MMhcxNRhQwJi7d3OjN6NGeKffnbP07g9a5F?=
 =?us-ascii?Q?HwrI4aWwswV4uaxfiaCFqWmc7OvviACvJtkTLJtS6GrAultBK69ybabHGgqR?=
 =?us-ascii?Q?gMWczjBHY+UP48Hff7KbDpbSPNS3tdFcgbimIH6P3zI9so0//WZQu5YjBRcP?=
 =?us-ascii?Q?ohRfdLWgZyJjBX6B5Bi2dApd944ElY3yHD3WYWmuJjbVahTkpOg2FLf4pqaA?=
 =?us-ascii?Q?vnLr3H6jRvdKe2ytamQyJ8bxqVr+NB/c/T+DWtCxHbt157MNzgkbegtMtqOj?=
 =?us-ascii?Q?euj7lfrJr6vynnfqFE2JthnqzbAfMKXuXhcK5HX1jVSfiPXXcYtz+QdemIyr?=
 =?us-ascii?Q?EtazZClj/EIN1FGq8ve696pEJw8nqVT0CvZOBMb02l+TSevhJf6GSZho8teE?=
 =?us-ascii?Q?+rjBb//U2i0Xk0TLoXAOcJ56LMZK7rvs2KXeNE1TBGkIpL65M65j5BWw5EN6?=
 =?us-ascii?Q?dhWufD+PE7T5zTd65iRPk7aIjsn+thW4FSbqXdokIJVImxnQlwWMQZ/027lE?=
 =?us-ascii?Q?f52U54TTQlcNKjc3hfjk6vyxk62vXIBCaCftGAie7RVxSd2jUJOqegimVw8b?=
 =?us-ascii?Q?x7ZJ35jkm+w7Ih7PaxYjbnFyO/BnOkFyxUcyDwrAlt/t028/FjequZyUSZEw?=
 =?us-ascii?Q?u+mDRVO+Df/mi1C8vyQTv8+6+4EkHxzh0LlcK67l5vMHTfMgKIS1nJ32vSCi?=
 =?us-ascii?Q?UJCNPYvtG351kVuuPBxQ5WoYnU0V08v1fyzb7r5dWGQdZIug39RwKpMU5yIp?=
 =?us-ascii?Q?stfL+hObaBizYvoi083COinT/7n2R7OtaLQHpiF3qrmIQ0waN7+wmK5g8t4j?=
 =?us-ascii?Q?jWHo6weWKCFNxIfjcSEbxCoLS7JCE7WJzAgMwrrPYMpQnwmZ2moQKHnpSXUb?=
 =?us-ascii?Q?WC0WeGAtZ+iJ600=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 07:24:20.6010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e9e9850-f8f1-4e71-af0d-08dd6524bc2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7992
Message-ID-Hash: 4XAVWQXLF6S7JWZIAK7PRK3DB22BPKCB
X-Message-ID-Hash: 4XAVWQXLF6S7JWZIAK7PRK3DB22BPKCB
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XAVWQXLF6S7JWZIAK7PRK3DB22BPKCB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move snd_soc_acpi_mach id's of all acp platforms form header file to
amd-acpi-mach.c file to avoid below errors.

ld.lld: error: duplicate symbol: amp_rt1019
ld.lld: error: duplicate symbol: amp_max
ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp63_acp_machines
ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp70_acp_machines
ld.lld: error: duplicate symbol: snd_soc_acpi_amd_rmb_acp_machines
ld.lld: error: duplicate symbol: snd_soc_acpi_amd_acp_machines

Fixes: 6e60db74b69c ("ASoC: amd: acp: Refactor acp machine select")

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503160801.yExt0K2E-lkp@intel.com/
Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/Kconfig         |  8 +++
 sound/soc/amd/acp/Makefile        |  2 +
 sound/soc/amd/acp/acp-pci.c       |  8 +--
 sound/soc/amd/acp/amd-acpi-mach.c | 93 +++++++++++++++++++++++++++++++
 sound/soc/amd/acp/amd.h           | 79 ++------------------------
 5 files changed, 111 insertions(+), 79 deletions(-)
 create mode 100644 sound/soc/amd/acp/amd-acpi-mach.c

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 157c124570c8..b9432052c638 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -28,6 +28,9 @@ config SND_SOC_AMD_ACP_LEGACY_COMMON
 config SND_SOC_AMD_ACP_I2S
 	tristate
 
+config SND_SOC_AMD_ACPI_MACH
+	tristate
+
 config SND_SOC_AMD_ACP_PCM
 	tristate
 	select SND_SOC_ACPI if ACPI
@@ -37,6 +40,7 @@ config SND_SOC_AMD_ACP_PCI
 	depends on X86 && PCI
 	depends on ACPI
 	select SND_SOC_AMD_ACP_LEGACY_COMMON
+	select SND_SOC_AMD_ACPI_MACH
 	help
 	  This options enables generic PCI driver for ACP device.
 
@@ -47,6 +51,7 @@ config SND_AMD_ASOC_RENOIR
 	select SND_SOC_AMD_ACP_I2S
 	select SND_SOC_AMD_ACP_PDM
 	select SND_SOC_AMD_ACP_LEGACY_COMMON
+	select SND_SOC_AMD_ACPI_MACH
 	depends on X86 && PCI
 	help
 	  This option enables Renoir I2S support on AMD platform.
@@ -58,6 +63,7 @@ config SND_AMD_ASOC_REMBRANDT
 	select SND_SOC_AMD_ACP_I2S
 	select SND_SOC_AMD_ACP_PDM
 	select SND_SOC_AMD_ACP_LEGACY_COMMON
+	select SND_SOC_AMD_ACPI_MACH
 	depends on AMD_NODE
 	depends on X86 && PCI
 	help
@@ -74,6 +80,7 @@ config SND_AMD_ASOC_ACP63
 	select SND_SOC_AMD_ACP_I2S
 	select SND_SOC_AMD_ACP_PDM
 	select SND_SOC_AMD_ACP_LEGACY_COMMON
+	select SND_SOC_AMD_ACPI_MACH
 	help
 	  This option enables Acp6.3 I2S support on AMD platform.
 	  Say Y if you want to enable AUDIO on ACP6.3
@@ -88,6 +95,7 @@ config SND_AMD_ASOC_ACP70
 	select SND_SOC_AMD_ACP_I2S
 	select SND_SOC_AMD_ACP_PDM
 	select SND_SOC_AMD_ACP_LEGACY_COMMON
+	select SND_SOC_AMD_ACPI_MACH
 	help
 	This option enables Acp7.0 PDM support on AMD platform.
 	Say Y if you want to enable AUDIO on ACP7.0
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index 7c75892e678b..08220b9a3802 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -11,6 +11,7 @@ snd-acp-pdm-y     := acp-pdm.o
 snd-acp-legacy-common-y   := acp-legacy-common.o
 snd-acp-pci-y     := acp-pci.o
 snd-amd-sdw-acpi-y := amd-sdw-acpi.o
+snd-amd-acpi-mach-y	   := amd-acpi-mach.o
 
 #platform specific driver
 snd-acp-renoir-y     := acp-renoir.o
@@ -32,6 +33,7 @@ obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_PDM) += snd-acp-pdm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_LEGACY_COMMON) += snd-acp-legacy-common.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCI) += snd-acp-pci.o
+obj-$(CONFIG_SND_SOC_AMD_ACPI_MACH) += snd-amd-acpi-mach.o
 
 obj-$(CONFIG_SND_AMD_ASOC_RENOIR) += snd-acp-renoir.o
 obj-$(CONFIG_SND_AMD_ASOC_REMBRANDT) += snd-acp-rembrandt.o
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 9322379cb36f..e15904aabc06 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -137,26 +137,26 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		chip->name = "acp_asoc_renoir";
 		chip->rsrc = &rn_rsrc;
 		chip->acp_hw_ops_init = acp31_hw_ops_init;
-		chip->machines = snd_soc_acpi_amd_acp_machines;
+		chip->machines = &snd_soc_acpi_amd_acp_machines;
 		break;
 	case 0x6f:
 		chip->name = "acp_asoc_rembrandt";
 		chip->rsrc = &rmb_rsrc;
 		chip->acp_hw_ops_init = acp6x_hw_ops_init;
-		chip->machines = snd_soc_acpi_amd_rmb_acp_machines;
+		chip->machines = &snd_soc_acpi_amd_rmb_acp_machines;
 		break;
 	case 0x63:
 		chip->name = "acp_asoc_acp63";
 		chip->rsrc = &acp63_rsrc;
 		chip->acp_hw_ops_init = acp63_hw_ops_init;
-		chip->machines = snd_soc_acpi_amd_acp63_acp_machines;
+		chip->machines = &snd_soc_acpi_amd_acp63_acp_machines;
 		break;
 	case 0x70:
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
 		chip->rsrc = &acp70_rsrc;
 		chip->acp_hw_ops_init = acp70_hw_ops_init;
-		chip->machines = snd_soc_acpi_amd_acp70_acp_machines;
+		chip->machines = &snd_soc_acpi_amd_acp70_acp_machines;
 		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
diff --git a/sound/soc/amd/acp/amd-acpi-mach.c b/sound/soc/amd/acp/amd-acpi-mach.c
new file mode 100644
index 000000000000..d95047d2ee94
--- /dev/null
+++ b/sound/soc/amd/acp/amd-acpi-mach.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * amd-acpi-match.c - tables and support for ACP platforms
+ * ACPI enumeration.
+ *
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <sound/soc-acpi.h>
+
+struct snd_soc_acpi_codecs amp_rt1019 = {
+	.num_codecs = 1,
+	.codecs = {"10EC1019"}
+};
+
+struct snd_soc_acpi_codecs amp_max = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
+	{
+		.id = "10EC5682",
+		.drv_name = "acp3xalc56821019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "acp3xalc5682sm98360",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "acp3xalc5682s1019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{
+		.id = "AMDI1019",
+		.drv_name = "renoir-acp",
+	},
+	{
+		.id = "ESSX8336",
+		.drv_name = "acp3x-es83xx",
+	},
+	{},
+};
+EXPORT_SYMBOL_NS_GPL(snd_soc_acpi_amd_acp_machines, "SND_SOC_ACP_COMMON");
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines[] = {
+	{
+		.id = "10508825",
+		.drv_name = "rmb-nau8825-max",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+	},
+	{
+		.id = "AMDI0007",
+		.drv_name = "rembrandt-acp",
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "rmb-rt5682s-rt1019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{},
+};
+EXPORT_SYMBOL_NS_GPL(snd_soc_acpi_amd_rmb_acp_machines, "SND_SOC_ACP_COMMON");
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines[] = {
+	{
+		.id = "AMDI0052",
+		.drv_name = "acp63-acp",
+	},
+	{},
+};
+EXPORT_SYMBOL_NS_GPL(snd_soc_acpi_amd_acp63_acp_machines, "SND_SOC_ACP_COMMON");
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[] = {
+	{
+		.id = "AMDI0029",
+		.drv_name = "acp70-acp",
+	},
+	{},
+};
+EXPORT_SYMBOL_NS_GPL(snd_soc_acpi_amd_acp70_acp_machines, "SND_SOC_ACP_COMMON");
+
+MODULE_DESCRIPTION("AMD ACP tables and support for ACPI enumeration");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Venkataprasad.potturu@amd.com");
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 796f8efd395c..928aa60ab386 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -277,81 +277,10 @@ struct acp_resource acp70_rsrc = {
 	.sram_pte_offset = 0x03800000,
 };
 
-struct snd_soc_acpi_codecs amp_rt1019 = {
-	.num_codecs = 1,
-	.codecs = {"10EC1019"}
-};
-
-struct snd_soc_acpi_codecs amp_max = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
-struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
-	{
-		.id = "10EC5682",
-		.drv_name = "acp3xalc56821019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "acp3xalc5682sm98360",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_max,
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "acp3xalc5682s1019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{
-		.id = "AMDI1019",
-		.drv_name = "renoir-acp",
-	},
-	{
-		.id = "ESSX8336",
-		.drv_name = "acp3x-es83xx",
-	},
-	{},
-};
-
-struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines[] = {
-	{
-		.id = "10508825",
-		.drv_name = "rmb-nau8825-max",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_max,
-	},
-	{
-		.id = "AMDI0007",
-		.drv_name = "rembrandt-acp",
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "rmb-rt5682s-rt1019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{},
-};
-
-struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines[] = {
-	{
-		.id = "AMDI0052",
-		.drv_name = "acp63-acp",
-	},
-	{},
-};
-
-struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[] = {
-	{
-		.id = "AMDI0029",
-		.drv_name = "acp70-acp",
-	},
-	{},
-};
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines;
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines;
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines;
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines;
 
 extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
 extern const struct snd_soc_dai_ops acp_dmic_dai_ops;
-- 
2.39.2


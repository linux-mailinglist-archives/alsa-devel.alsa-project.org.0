Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA39A16A73
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:09:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C4DA6026C;
	Mon, 20 Jan 2025 11:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C4DA6026C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367758;
	bh=lqjIWZ+WJZcU8bKMLCcoJ/Hqz6Te8rCBswOU6/yglLo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=srcbgWUl94r9J79L6Cb1HbwReFMpmsCeKttFK8fK3Rbz/kWVpey+M6GuSr5ozsxz6
	 sMkWsemulk45aP5DWl6HA/Sag3I9E+x93fEd9c7Cd4q2PA71R4Hs4Q7Ld0CMR+Patu
	 f25Z5rL9iNCYjZAhzP1X+wHtS7xfnltLf4SSUipI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8DA5F805EA; Mon, 20 Jan 2025 11:07:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 559CFF805E9;
	Mon, 20 Jan 2025 11:07:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88CE4F805D2; Mon, 20 Jan 2025 11:03:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::625])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CBB2F805E3
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CBB2F805E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eaE+5H01
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD/TXLGLwWuSD0MyxRW04E4O6GJL72XxeYghRgqGHBgoLS4I8ToEa5LECgtjE+EBGHasczXeXJ4Io+8+ziUEBs7gwPbOOh8A8X0fpMiFsPoLMkjVNW2u1Y0F1KNK2+P2IQgEh1apG4hOEje7lc4MIBp67TXglYGn6mkOSEwno+9orGwCEPc9oNunxS9U8+AM67/vvl3vp9kq4WSvWKKWHJ1ser6a9C+PDvdxBLNE3IA658lhEdwJHQUAmz9XIMqYRKBFk1L8eRmz87Lf4efLitvcb0HW7S8+KjmHvd1vNnQHzraVp7yveK7sd6O2TaNErj2PHZIz6k7XT+a94cDA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhnJuXfdhb5iveqaaBpOujpDVIlNkFwQ+T3wchTIrtU=;
 b=TC+RlWFsza3+z3G4XUPubAabethdCIaSNqvqaAQ3TYoHsAxZxPsnS9xAoavZBkRTfUsuIh0xKJvt23SXFWcoSzVabE383VVEHCfW1zdJGPXfrv6B/Tn5U1FSUeoXo3PN3bCqOH/KtZRcAd6F3TutgLz3ixKlmhm3jwlDcnYa3FDL6LgxKlZZD7L5jQ8yhA/5mnvfLqto6YHzd4J4fylt1PRyrGSOX5/MXS4ZWA9RBZiyWpffoITWB37htsxPE/Ow8JiSimzDiiVOaap37tETOIqBZiozl2brsMQpV+0IGnRjbn07lJPDb+rNnngKfvSFFt4lRS+yhjqOXKSgDYBpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhnJuXfdhb5iveqaaBpOujpDVIlNkFwQ+T3wchTIrtU=;
 b=eaE+5H01AZhoDdVkD+OyrhIZd1oHDIKrT8wWPqw7I7np3rZS6N6kHJX+INRRaQeGOSV43Pce7npPBObHhCpgtAmd4eB349H5zvxqlaRlfJUexZmvXMpDsbtv26h29MQx8os85O6ZxPOcKeqTBFfpveGPoxIOBEK1yMGG3yRo0wY=
Received: from CH2PR08CA0010.namprd08.prod.outlook.com (2603:10b6:610:5a::20)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:03:04 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::9c) by CH2PR08CA0010.outlook.office365.com
 (2603:10b6:610:5a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:03:04 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:03:01 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 23/23] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722
 support
Date: Mon, 20 Jan 2025 15:31:30 +0530
Message-ID: <20250120100130.3710412-24-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ae0192-00ce-468f-cba2-08dd3939a1e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tntf39wS9LvzmYbjXOcGnFcKnE9c8u6GBdZJ+XMYzpe5W6yiv/YtFopy2FkP?=
 =?us-ascii?Q?Zawq7jhdn6+fzvqWqiw30zKC+s3+0ay2fQpscxPXEF2K2aP7uTlWKCSkcaNT?=
 =?us-ascii?Q?teNb331uGpz4ElG1ANA83ED+66+IFwRCqoZFu6LJl/7jFFkFCc6qfK4HnIJt?=
 =?us-ascii?Q?btadkW7GJ/EbvXGCTrJmHpTSXjaT8MPSVCefm/CKz8qfQtIbLUECovf64MqO?=
 =?us-ascii?Q?9MEffdptgIFxmWJTpty2PI25+ZAE0JK9NEK3hBJmPDFM+e+JLM8yraY6TyQ/?=
 =?us-ascii?Q?vOEulUK7xMjisnvxFy/pDXembX1idK9V7iVSwscafKDlXJgnNUg/8nlvV4IY?=
 =?us-ascii?Q?2dhZ9r1p2joeXQMtE/mqzXFCVrTqzhrVR6nKxeMpg8M+DbXKRxcUscaQjF/Q?=
 =?us-ascii?Q?jMz37BGlqYuJyI5wdHIvAbk42A3Rn8fcFCS28Dss0J3fA9YZjrcOqDjbnAV8?=
 =?us-ascii?Q?j7pFEGEqlo1psIrNty7QJbCCTTDcWF6NvnBzUVSuKnpRzAQ16ePKYhABcdHS?=
 =?us-ascii?Q?+nsVS9D8czg8aslGrsPKDQ+NQUEgsNb4hFcKK+uzjmF1/wspAe5OHVuKWfFt?=
 =?us-ascii?Q?l+VpOPcDCDERj2jQpO3rMijEC1CFjp6cNHcgjPAY7E5q7UXIzXDVnnqENCTX?=
 =?us-ascii?Q?PzX8ZC48vbUvRaOK63kwclQOCpg2kJ5VMsIqRPlXTcMWFX8aCOjXZfJ79OwH?=
 =?us-ascii?Q?OQeVM++82r6zGosAE9yAtkxH3ed2GgU5EkfMM/L3AafnPBSCRWSVZSzp3dbW?=
 =?us-ascii?Q?t2I0pok4AE54mUEzlO2yWu6qsjXNGlWuwK/da7FgjjEeY97jTowMK3M7AckM?=
 =?us-ascii?Q?bqZDsf7rHEgRMYwxhEjd1YSVce1EP7inxm86jGXaUGIQfp1KROUIppxDt+zL?=
 =?us-ascii?Q?qiSbl9kLYifkseknyiTmYTEv5GDMZP6glNjc3vQWKVX730d26sZ1VGocJWNt?=
 =?us-ascii?Q?St9EWnIeWkN/ywoeB9MTWwWdN+WnfafUEEb63ZARd0agC7zobcEFsXJjvf8q?=
 =?us-ascii?Q?/PB/DMS/X+tRAH4ZpWI9I5RBbrSVQ9tlHEs7/KZxK8QFAYVOyydR3A0tEA2Z?=
 =?us-ascii?Q?FKFciz8WA80wPWju/IMIETs7AY/iV1bvY1Ec6y8xB/Gf0MQzCNpMMjYzxlMT?=
 =?us-ascii?Q?8knMLdXXInTPj+qZX9Y/FgzgdJl+mf3qIS0/d9coa8uZbGlhkqyGrBPMLC3L?=
 =?us-ascii?Q?yrro7ImwcW1+868CGNgVOLdnQCPdqL3Tc+nnWmZm059kvOI85UKmHriomHFk?=
 =?us-ascii?Q?ktIGzf/HkmE3YZxCY7uOG9TamT38x4pofeR4pSdVnXygqqvDR8hmId9LLRfc?=
 =?us-ascii?Q?QgOyq5JEkibaWZBsb5JgKxW3wa89TlhJAp9lFq17zjLakBKqpDNfu0566Zjt?=
 =?us-ascii?Q?57yLI7PRGuGPd45oPXgQb+T45NPtAApCMwoalS0a/hmU1wG/OBNmfnooTHsz?=
 =?us-ascii?Q?90+EzMrmGBZFlugi1tSY343A6FiISqLjf6SQoFiOpJTDs0+E/qxkT5W1KSft?=
 =?us-ascii?Q?qHzLfPSJjo11ThQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:03:04.7939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 62ae0192-00ce-468f-cba2-08dd3939a1e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314
Message-ID-Hash: L6HHECVSNBG5WP7NY5KOVSKEREJI53DD
X-Message-ID-Hash: L6HHECVSNBG5WP7NY5KOVSKEREJI53DD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6HHECVSNBG5WP7NY5KOVSKEREJI53DD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Patch adds driver data and match table for rt722 multi-function codec on
acp7.0 and acp7.1 platforms at sdw link0 for legacy(NO DSP) stack.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index 1f30adb6c02a..d31b681b19e2 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -73,7 +73,51 @@ static const struct snd_soc_acpi_link_adr acp70_4_in_1_sdca[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt722_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = acp70_rt722_only,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = acp70_4_in_1_sdca,
-- 
2.34.1


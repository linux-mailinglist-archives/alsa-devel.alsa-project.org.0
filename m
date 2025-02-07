Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B656A2BB97
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:36:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CE9A60286;
	Fri,  7 Feb 2025 07:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CE9A60286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910189;
	bh=BdCzaGWZxv/A5maVjKGVmEvCSGO3p1c3BmChfqo73XM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HUoUMSg6SfAUPSSNk19CnAVIh4XI9YOSBOQEzKBLnT+ItqQRrpH+3mPQwJr1AiZf/
	 MZW/Xv2kh3lU8E8+/jhUK87wtFxcxS9giciG6jn9TA9FxRPIRIbSq9T61f/yB3n3wk
	 TTJHLVlkpyQKGLBz6m1enzRV6bbK8uiI9FiFP6Pk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A3E0F89759; Fri,  7 Feb 2025 07:30:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 113FDF89754;
	Fri,  7 Feb 2025 07:30:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5C4CF89750; Fri,  7 Feb 2025 07:30:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E26DFF89738
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E26DFF89738
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NvEr2V5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7pVg4YwiJ7SogydEDAaP7GOyg9lHeqx7E15IvHoBvIBa12WwDNTaJb85p11SPJQ6jnVpGUssAj2RugeOZRGS+Ij/CWA8K1ZJoXe+adC750VnwHFPSbtEHbdhF/d3WDb5c8IRuIGNMm+dR06TYD0QiQ88aRaDgaFn3PrpW4WsrnGpCxsbMXIwOadHJVjjtkmeN5rm684r+jQNa+8TI306x2LqhAn6AYZYn1R3i5eN9g2EqtfyQbiDRENxlTjcAy47IvFap6V0Qj4XVZLmBHOdv47B2mNx+pLhE1gOJ3a96ot2IxWu2EQ99X9v0pjfNafNhlMQn4Z3zGmYlKFa/Jr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcFSNdWxW0hDj5AqZyPgafkTZkrkv87yVbs2WOjSlCU=;
 b=DIctqhrt+ZZ0yPxVpnKxtTkUXQjY2rxR8RG7ekJOQ0L13FltHFNIhbZBy24btGU7CCyQee0kFvwdx+jIglfFM18ysQqMVC3YXqAtx5sZRUzAIUWiv7AZPlhCh3veE/iUUHO0xYeY5tRonPQVs/x1YhjWYaF2KvmBeD3wGwgZ1XlUu8VceQseJ0i9UH0T7NawsJuZOMmL38xjvA8jFPOUT7jmqZ7Wq7mzK9slT5qwFnssQlrI4Bruq58a5iKaZoM0ZGDx2NonaDCeskHtJogYIntnXbEZLQM1P9HIgNzDhQmioQQlO2jA8oEClQGwqz9/De+6ydgrXnMy/kulW4Ro9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcFSNdWxW0hDj5AqZyPgafkTZkrkv87yVbs2WOjSlCU=;
 b=NvEr2V5diVq4ewSEEsoNahSGZEBzlqeNmDsZmT6RdWt6L25R8ilzR6igkQBw/X1+wMc6yx8g2WTWYMiAW253ib647CmJvRsYVzESbnKcum13z+XMY+1RNrURLahCTRg7l7nC4kovUAh6L6i3sVWI44ySphTbK/vwqz0RBBp0G00=
Received: from PH7P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::14)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 06:30:39 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:338:cafe::3c) by PH7P223CA0022.outlook.office365.com
 (2603:10b6:510:338::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:39 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:34 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 24/25] ASoC: amd: acp: amd-acp70-acpi-match: Add RT1320 &
 RT722 combination soundwire machine
Date: Fri, 7 Feb 2025 11:58:18 +0530
Message-ID: <20250207062819.1527184-25-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: d71581c7-43b2-4914-51ed-08dd4740f08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tlzLvz6MzB6Es0li93hwLIa5T5RXcjyRRmicnQZ3VxOWTfWTkW5rEEQdeBfF?=
 =?us-ascii?Q?2qvqgEG7Z5eXm2M/bdkfHG5hVpWdgAjd1EdycQSajxEwOtpuBxhZsXDTDVyG?=
 =?us-ascii?Q?ciUYHcpaTrmyfW9A5tDlz7ExtDMqQpmKVESbYm5xew3Wwtegvgxj1nyTdesN?=
 =?us-ascii?Q?NZ8CxthbO/zMnOYjTSZOtNEwXm4Hm8huAM7Ar3ZB3NMjwfdlMh15KAt5ByN7?=
 =?us-ascii?Q?9UAtZLj2LlL8VZrZNLLEbV+afwlQgEK4fyi05kFOxD4TjyMBKTOeDntDunS+?=
 =?us-ascii?Q?quA0bzKM9LyZc82rd4AR9Cx2ZthO3lTNfw9dvG2YJUo8FbvaPhDGX2UcwFeQ?=
 =?us-ascii?Q?OrQw8jRO8QxmcwVt5H9lpdxH5Vx+Q7W09pHVYvvasWTmsLnnkuBlJKaC0Ygl?=
 =?us-ascii?Q?rD4YMk55GPKJ+Gy3hieKXEjUo6/cIHzXehAJlx428XHFwVz20kkP6qJaiLBY?=
 =?us-ascii?Q?EsnR0cfjawZi9kJuUZgPleIqjTWPFWX0mkBfMD/b2dR3mcHbuf30B3EMdxCw?=
 =?us-ascii?Q?1q6B2eMbUUt4QTSIFE4Trf9RzOvUBoqrNK+55Bf8WjodFyJT/6B35uYzhN7B?=
 =?us-ascii?Q?hFSYDT0QKEmuRigMxyKIsMonBmINoD30keTWbD7Toqhz//5Qyfbbk7iw9ZZU?=
 =?us-ascii?Q?KZsJCXRAQS917Vkw42C+UaoszbbCwhwpr+ohh2nzDARkcn4n/219IMYc8wUj?=
 =?us-ascii?Q?esV61a1xEBbvEX+JjsLovQ9trF5qNSWAI/fudyeeTEPohaKrotUAMCkliue4?=
 =?us-ascii?Q?bNVwRCOru1efXyreD4+bo+J05P18LW72/6GdGvk42NsYqfj8H2gR5JFq/Dw7?=
 =?us-ascii?Q?onCvMEEoREdfZua7z4BnK1N4tjI7YUmVweMTHa9Uxu8fnQA1iotcU206nb8W?=
 =?us-ascii?Q?WFGkfUtARnbSm6WXyX/8LVXtleqzCsrAbTWa9XzqSVKNg5kz2zZsV2Keb/jI?=
 =?us-ascii?Q?DnO+lYIhSyyu2IkBD4kLTvwQ6ObOf9rbfqID3LTxigWZxWraDveyhXpVCqtH?=
 =?us-ascii?Q?amA1sHvr6fS9xzTkCKchz596Jy/0aOfIa/m4ZZtZQXClQ6/tprB8Yvs7Bn1b?=
 =?us-ascii?Q?A30L/N8Ex+ZeLfC4jdrWmDPM4UwYRGhp8p6BEGxg1JdGD7iEpkiUFbS5YLlJ?=
 =?us-ascii?Q?ThWsYdbjJ6kA9RuKKICWMO27h6uMRzku9wTEIS/6sxyFmksdPJCBXpMlAbFi?=
 =?us-ascii?Q?vf50YlKQNqVzGzZFYPJklJ+GG/oZC2t6SmKzpxHzEKmAa9b9uWXhnOPzgTD5?=
 =?us-ascii?Q?1N8nrtoTGMTFISif37xFtzDNuL73ngKZw8n/wagZnA1SEZPqDaWoZGOPrcDP?=
 =?us-ascii?Q?Lnq9JjFTd97ROQD1+usd58MartPIflZuXFXqPDnbMWKeDzbt90AhaR9sv94t?=
 =?us-ascii?Q?CFiATB7dNZIJYe6bbqkPalRPn5cKalaSul76Mi7lERdtepsbrVAbDOFMpWIT?=
 =?us-ascii?Q?ZLWDumJPVwydI/BjYlMhHlqC6q19MopUjeGZoUDWda5shqigbLOI8HirxcT5?=
 =?us-ascii?Q?IzeSYZ98wfWUH7w=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:39.4188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d71581c7-43b2-4914-51ed-08dd4740f08d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
Message-ID-Hash: 2S5EDQMU5EJNB7KLGHRFU67XHBRA4PMJ
X-Message-ID-Hash: 2S5EDQMU5EJNB7KLGHRFU67XHBRA4PMJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2S5EDQMU5EJNB7KLGHRFU67XHBRA4PMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds below machine configuration for the ACP7.0 & ACP7.1
platforms.

Link 0: RT722 codec with three endpoints: Headset, Speaker, and DMIC.
Link 1: RT1320 amplifier.

Note:
The Speaker endpoint on the RT722 codec is not used.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/Kconfig                |  1 +
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 28 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 03f3fcbba5af..53793ec7c7b4 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -156,6 +156,7 @@ config SND_SOC_AMD_LEGACY_SDW_MACH
 	select SND_SOC_RT712_SDCA_SDW
 	select SND_SOC_RT712_SDCA_DMIC_SDW
 	select SND_SOC_RT1316_SDW
+	select SND_SOC_RT1320_SDW
 	select SND_SOC_RT715_SDW
 	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT722_SDCA_SDW
diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index fe166015dc29..e87ccfeee5bd 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -103,6 +103,15 @@ static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_1_single_adr[] = {
+	{
+		.adr = 0x000130025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr acp70_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -112,7 +121,26 @@ static const struct snd_soc_acpi_link_adr acp70_rt722_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr acp70_rt722_l0_rt1320_l1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_single_adr),
+		.adr_d = rt1320_1_single_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_rt722_l0_rt1320_l1,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = acp70_rt722_only,
-- 
2.34.1


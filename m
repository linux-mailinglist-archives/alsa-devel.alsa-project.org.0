Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E09F7462
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:56:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6B0601F8;
	Thu, 19 Dec 2024 06:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6B0601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587783;
	bh=lqjIWZ+WJZcU8bKMLCcoJ/Hqz6Te8rCBswOU6/yglLo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F8QcLI+g9AYRz4LEl5mo2QSND73DG/HWb4gstq8nnPolcdaXQEWN/l9Trs2nYNYzZ
	 QlhJ0Yv0gv6LffW8y7O1kTe0TpSoEXv4qELb0VCExEl7yJHlEhoxVHUU9T6J1pfU3S
	 ArmWK1EdpRfpvL0nm+obL0qV33zDqWPJegaNuTK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2973EF80CAD; Thu, 19 Dec 2024 06:52:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD388F805F2;
	Thu, 19 Dec 2024 06:52:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF1F3F8081A; Thu, 19 Dec 2024 06:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B73E6F80817
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:52:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73E6F80817
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3iL9hJZ3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oi/3t4XgYXv73W/V4JtSmoctNY6Ep/W+lPEIhimPsy5lUFnJPgAElADzaFKBQooJwn1jFLxUTc9fDH5LlaZFYfZUeaERJoN/ov7cXpsEQ3qYx4kTcRplyL4jd/zYgWfN2SZ4VMLJQVpcku0DeujdG1Gtb8vNaOxim9WuM360t4GpVMuOfd0ddkphpDd6ZzEkBdpK/HY7YxyKanktTQtGV3uqC5wzpzqsvMiV5a27rGFfgd80GZ7mY6haoijmT0JIEVyxtP/v252zXJA2JV2+4L33yS5INmIhb7XfZ6LEvR0GSpmI0RMKkcdH4+FHcJu3nv/dTojAVsAyJaLso0d48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhnJuXfdhb5iveqaaBpOujpDVIlNkFwQ+T3wchTIrtU=;
 b=cCaFqf1yYey1Lj9H3TZORVmu62bNJpdlntYD7m6t3f5jljl0XQHHasNYsSy+iAgv+QDEN1BzzWa1wQ99MWERezShbEB+ie6GN0t94MRl832pL60lzRnbh9kKN9uz/Whl0QQTqXsbdDR0iwxK4D1+JfHIvOkkIssp2gR3yUpFiPxdLuHIiN9TyMy1EIidiyP64cZ8s89oxzLD/SoVpZgN17fGgDcFJVICCznmj2vyYNVY94tl7GKo8m6ztGzOKAXlG59VqL5mE/6Obbd4U35ipBCAmkS0i79ttmOIqHw0BV4K/c48bujJQ2RpDKBg6Pe0nwIPZL9rhaqBg3kIcopHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhnJuXfdhb5iveqaaBpOujpDVIlNkFwQ+T3wchTIrtU=;
 b=3iL9hJZ3x7Nh9pxUW8wtLG8lB78XHRFANblFaQ8tGN29S1vcv2PFJfaXqyUal/nyuCq59CN4McGMIrwkOCLOZTa9zTlRIda+qJ78knTJjFAs0ljn+1Yz+zPA/X3V4NllwDfqifBEqj2FlxywIAY4Fm1FlMmndxD4DpkDjQ05Yi0=
Received: from CH5P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::19)
 by LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:52:00 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::3c) by CH5P222CA0007.outlook.office365.com
 (2603:10b6:610:1ee::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:52:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:52:00 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 21/21] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
Date: Thu, 19 Dec 2024 11:18:57 +0530
Message-ID: <20241219054857.2070420-22-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f648df-0c0d-4cab-09e5-08dd1ff14175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7AE4hLxR+UmLZre5lAtUqldDHHumDRaT5wLMa95IDAePLREFhERYe/H53/yZ?=
 =?us-ascii?Q?BjCnoDkaulqc5ihsnj4JDNlSzTfJpRGU43EIEuXi4OVXI/lSW1jvZR5OgRz+?=
 =?us-ascii?Q?OwBCFTNif/2+CoghATBX6mK2qKUl6efaXDemeQx8DeIrSN0xwsOsEuYMRshL?=
 =?us-ascii?Q?HmpsL8fxuOKq6wM3oqZWRAXwb7LjOEtHS6ZFF09U8P8/At45RYN2Q5zCpXCc?=
 =?us-ascii?Q?g1zS2ggl9a+eY+zhmqGr4oOTfLcZWpnaCbWXvW8MLJEzRtw1aVnhovgvUJRh?=
 =?us-ascii?Q?VdaXKJtdxflzK5jdMnuMHZ6QMZfausxy0WqQAUWk4ZcXcM1jneNEhEejUuWc?=
 =?us-ascii?Q?5V+FAnWw4MMZ3dazCMp79Y4lbs4+hdCSsYn9v5Kptxn/PNxBwyFAuO2Mieow?=
 =?us-ascii?Q?1OtY41fefgzO7UzVIMjkHW/qItNpAYK5/zU20pWQvQY2+PRBud7yErmM6/if?=
 =?us-ascii?Q?dmYiwG4QIC/biWujikWxFVlX9jWiWFYms/bymSs9SlBt/wqQSO7QiU2eKV0w?=
 =?us-ascii?Q?Wv9LFng1M7D6oj/8Qih8wOyc/U4pSMMFvKrNxx2pqIqy9chv3sn5c/SU/tAn?=
 =?us-ascii?Q?+3uhTxsRkwX79XRuqf0GIXpBjZhVgGkz+HS6GnevlBSOGXgIlzymegBtiDA/?=
 =?us-ascii?Q?a1NHVS7t2BjPjpUC7HrAnsyJ0bHGFhee7g/WFz8mbPxX+A0yypWWdnqBX2NS?=
 =?us-ascii?Q?tUNi8J2TXcpPDGbC5qVK3UqOIYiD2K9NDS2u3BJAVT4vh1ao6Ii4SuAv/a/0?=
 =?us-ascii?Q?pGqoPZDsVzEjONClITgn9eJ8NjL+hjOru2Chy6Wq0csEHuCRI34jkeztwMam?=
 =?us-ascii?Q?5B3K91CLBXPdwLZopohr2E4GP2B5uityUXIqCqAKGw1ak7d3CQHY2Vg3s1Bt?=
 =?us-ascii?Q?q1tTaFhbjC88TmxWeTx11Gz6EmDFpfUs5XA3F9m8Uem005ytZgz6x+CV6bRg?=
 =?us-ascii?Q?pg6R+b/NxiZtg36pVdBfQAn4wWVcMQH0Qko0UFIJ5X3M3zcvfYyYGaCxYWFV?=
 =?us-ascii?Q?M1TIBSPSwDQOeoWi/71ftxaxWv6r8de90uPGKkNqsftMH02xls8JRX8MhDyk?=
 =?us-ascii?Q?RpWPjxCy3yK1SjcZ+NGD46KagrJfFw+ME9xQtTBJ6BqhNLDZ2zYtdLe9rDqZ?=
 =?us-ascii?Q?r+1l2E+6S4pM1dWgYJV0eB4+7tN+uqb7B2QyRenLVSdr1DxgkmMLXEVJeBHi?=
 =?us-ascii?Q?dAgjydYdWfMO2isLhgufhCCdIXxqujFu82Q0xRxR22SC1x5oMkyEYdK0vLOZ?=
 =?us-ascii?Q?UtoTVLBljaQi3CLtvXUQMb5OepGBBlllsK8T/t7HLapIM5dp4m/gCY+1jk2F?=
 =?us-ascii?Q?UIgNFKf+Uq59dvv05e4rX2loJmefegZR/guWqxw1sKDeBu5LlOztY5V0nRq6?=
 =?us-ascii?Q?W/6iYMAHPipKKIkyMrKI91gjYRAaPJ8VXnBCct9ZbvzpRbJReX3lcn4bAxwY?=
 =?us-ascii?Q?s97qhXXWNlECu4Wv4QyZfR1XNgd0LI9QsCKwvnQPPW5PHhyymqmuF8YOxPiC?=
 =?us-ascii?Q?8lo4U0O0rBOPFXY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:52:00.1309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2f648df-0c0d-4cab-09e5-08dd1ff14175
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437
Message-ID-Hash: OXBZN3QNCNFHFBBTZSX2M3RLNLDPPLQN
X-Message-ID-Hash: OXBZN3QNCNFHFBBTZSX2M3RLNLDPPLQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXBZN3QNCNFHFBBTZSX2M3RLNLDPPLQN/>
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


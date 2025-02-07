Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B899A2BB96
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:36:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E18E6023A;
	Fri,  7 Feb 2025 07:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E18E6023A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910168;
	bh=wR1I1erG7hsNY3GIEh7BL0uGvje3H8thQAWq3EKO9JE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BA3hOVeFVM9L1wvgCRyFpeakHs9n79YH7U0Qrl9RGvs2oEINpn1NYgXNzoNaC5lKG
	 tKISMveOXk30SBp1T0L9qkLnmpsw1bD5rKs9YoQW32t4zSJxqsJCqTL5/WD+fz09Rc
	 yDUzIZfCrFiKAYLu3hKv+1q8yJxUKlo1nVup78IU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68AA6F89744; Fri,  7 Feb 2025 07:30:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46757F8973B;
	Fri,  7 Feb 2025 07:30:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7BE4F89716; Fri,  7 Feb 2025 07:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::606])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 949E6F89714
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 949E6F89714
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yOJXDP4X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTfaGvkDwx98oamXdm9d0qVbYDHC/9O6EUMYDS97wRI/cHubfFo1YLaf0zMfNCsZPvCXtBi5/izijXPawDylnVVIssh/bGzJvywuqS1mnQe7FEF1Q3CfjKB1dO0H91JNH9CYqjVTQH8acbExmhZkbYJEm9fwSkgDbFGD3qXZ0f38T1XU8NhTB6B9tEqltIVPk8Zki2OYGJ/e30z/HJa64KkrKLmSqSLlVkfjkczviscql9uUYZFOVYjgnjw5JWXu8f7jaF6J//+YCq9vbNs8tnbC01PB2CqvY5ZQDWludR6ryajX+h8uOaCB0lE3JZEW/JnhxMnTX4Xxk5aKVE3g4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnqII4rpADUUoTJo1uktwHIhKaGGOPDVHfZM15aV2P8=;
 b=yDYfevCgpMTyYFJSsDMWXKnrSmUcfIbWQrIVcJd2AetXB7wQcJEZDxhpVFtH/MNE6V+tB2nTIJzRnAa2XoNy0i3UiEgPZePSp/crcLz1LPkSmz24jjKNeMZ9R24RAA38wX4OE+wPPkr/psyoSDXUJ/rRf+F/wzOwBhSoVdyqNo0oNAagvL7g9XDz6SsPt/6fHKVbbzVA04tyCd60hTr2u9MqTWJ4I7fBS0OODuvqPWn+qLubRSbQQpizvM+QY/TShObM/IFxzIn+9RduvA4kX+xukrWwrmFm/jJr34TgM93AvPNtR/kPBizUEPGTS7Y54fAD8iCqAQXMBm+xK7Cciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnqII4rpADUUoTJo1uktwHIhKaGGOPDVHfZM15aV2P8=;
 b=yOJXDP4Xr2UslAOIdqVOn7vrlMkJsFe8PeFCpy96SxjrPBmIN3qv9lrjMEy5rJZZub4Zofaz1ze3QM8q0De5HzFI4nLQjSZATH114XhfSv9kTQuRw2D6AtqJwTNQZAeXpAlpMsmjGnTmlRns4oeR5evZAtoyzBO1kFl2L1KPMsE=
Received: from PH8PR22CA0003.namprd22.prod.outlook.com (2603:10b6:510:2d1::6)
 by DM4PR12MB7526.namprd12.prod.outlook.com (2603:10b6:8:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 06:30:35 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::5d) by PH8PR22CA0003.outlook.office365.com
 (2603:10b6:510:2d1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Fri,
 7 Feb 2025 06:30:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:35 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 23/25] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722
 support
Date: Fri, 7 Feb 2025 11:58:17 +0530
Message-ID: <20250207062819.1527184-24-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|DM4PR12MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 36baf3b1-b028-4817-5ed5-08dd4740edf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YF/LvSNFnu0J9twwLksEqYtvATHtdQFI7Nt7LRHYbJ1q3B9rnA5k4MXFZjbF?=
 =?us-ascii?Q?6wCxCfgafdDau82zZL0oIFl4fue1N3+upTVsOgcDJK4JiDqQv5ZYBQDr1FlM?=
 =?us-ascii?Q?Hp/ZXhuw9eapde8NM7k1kJ/5XN2ojmfq/rkzGVGZZzaLQ5kZg7k+5OQ/5bl4?=
 =?us-ascii?Q?7da8msGVZy5U5Z2eg9wI6nVLS9fUWQBeSv0vdSJTRfy7X/ysHTfMxZvmO5LS?=
 =?us-ascii?Q?U48oKQH/+s8xZrd66I2GXrS+OVZkxw7HthiIjA71ijo3SoPkfLQtls6DUoVw?=
 =?us-ascii?Q?Utso1v1zqbQMCbgjqboXxjAH5k9TmSOZ7pFIRnKh63Y0DnZdgO5+NF48K4ae?=
 =?us-ascii?Q?D2ZSUXmnLVF1DK1wossFZknwSa2AxGOjOTelGdg9fbZ8lsb/zyW8+UvrNCxf?=
 =?us-ascii?Q?yreI9Fg4LRW2/OYRWlC7Z0qDbDOJXezvBbKbnDv/9apDNIJybP65fX287DX1?=
 =?us-ascii?Q?VVTPTMf3R0Q/pRHb3S0BEu7Jzfz3nyaLMf/yIPhc1kbGmwZfeHnF5awwUxeZ?=
 =?us-ascii?Q?xupMnlTmY+XxwAmnZOV07+mlVYniopUP12qKuHTruHgGtzSNj7qa3a2jYqju?=
 =?us-ascii?Q?FffEHndVyHudSZlCaGqPtaGd1lA7yT5bZh0TXhA3puDAoG9EUOSB8HSev4FA?=
 =?us-ascii?Q?ujShkixQCFFNR9KgFr+yQNID4EEbqNav9a6idR0tg+fH7J3/Z68tQNDCAUFV?=
 =?us-ascii?Q?I4n2Nge9rGjj6X5x5VY3vFlLJoVOMmWs6i2J2zrmyAICwz8Xzj01CzP5b9fO?=
 =?us-ascii?Q?d4tEEUXapBKnhLPAxSabefiopbGczIzxo3EEeFOg36Bwohxd0qTMqRN3KzUV?=
 =?us-ascii?Q?nuVRteEcU2Jq7ivnu5LwT/6kMSr3P+Rn9H6edjGKVXmwPNvf5yfXNlbOyyzy?=
 =?us-ascii?Q?qBQeOZrnbu26zWMdqweAXyi9mJUvdFVg0g0ZrWozF5BCWYDm8Q6py5N5Zu7s?=
 =?us-ascii?Q?e2g++MBwfHcBP6kpFnSQhLWSujhAr6dLXlQRvpiLp4tEehQ6M7lcW/fqZf/7?=
 =?us-ascii?Q?sOZruS+/wSpCm3NFufFNYn37h0knhs0+69VgSmoNpa5pAEMEumxZs5olDyr/?=
 =?us-ascii?Q?8/idLtfVLypWTpmkoe+7idyciN7g4kUgN6NRsaEhUVo8XDJC75CtLLqHRDoZ?=
 =?us-ascii?Q?FsASMWfyvOJybwWpzTlFkgOg3YM+C6MMsypgUnsYdMpBwNi/JjCfCAq0M5AR?=
 =?us-ascii?Q?ug86AMetUhKnuD/p31XVB7O7C19ucqgh95dOt/No6Dq3ZcvSRvKZxhtZKJjo?=
 =?us-ascii?Q?Z1GPCnRwFN0AWTt+xfQvClN232biaGblkZFacIsXTQuY8kD35afMFpyWr1yy?=
 =?us-ascii?Q?nnO54XIImIl+fih0oKY4H7/sx2tJQV1AazGlaLNFfFKUO+4EX9l/xYb8sPzB?=
 =?us-ascii?Q?ZGQ+DSMvQFQhSsCpoTHTN3O1JhGNaLZ18NPOA8mTPfrFWulZ9fY9BHMQPaaO?=
 =?us-ascii?Q?MnOczZWCtVuPjIC6Ml7r+OduyqvSJxPVFLTRRDAkYCScp0G8DBgmNkzJ6qth?=
 =?us-ascii?Q?UJxum5uqkIavOZo=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:35.0806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 36baf3b1-b028-4817-5ed5-08dd4740edf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7526
Message-ID-Hash: PVGPQQM5AT4OVKE7CC43J7E2ACOQB4PJ
X-Message-ID-Hash: PVGPQQM5AT4OVKE7CC43J7E2ACOQB4PJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVGPQQM5AT4OVKE7CC43J7E2ACOQB4PJ/>
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
index fa59b462f227..fe166015dc29 100644
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


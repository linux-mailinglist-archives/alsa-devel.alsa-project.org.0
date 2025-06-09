Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB728AD1CEC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 14:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50156601F9;
	Mon,  9 Jun 2025 14:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50156601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749471229;
	bh=t40cmaha6ipJo0AH+2OyiPNpIjHDl7OZeUBk7v55T6s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I5svUQJLWKRHIt0SmSITWk/CXMgKmQLCC4KOkpJ0gu+m79HH4OuqIv8atZAR3rY14
	 nMGNYwDmE7advAMEGT70TLU5yygVHdF8ys3B9LlYZJ7hUknl5qKy7oDS+h+Nzpq26P
	 JtK1TcntkG+GcG5N9LxkXEvR4Fe9gMHGVBTC8wt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A8A3F805BF; Mon,  9 Jun 2025 14:13:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F42F80038;
	Mon,  9 Jun 2025 14:13:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9427F8049C; Mon,  9 Jun 2025 14:13:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE4A7F80038
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 14:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE4A7F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QF08ff1h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2jyrM0UKNE6WGFXoHtcdOyMkQjIFcOlaqVWeYUsiYt3uokmUZbriRKyYm8moUxZKKReml6NrzvgUWi4trddR27/86bSgHq+lgUk/cYZf5IpPTPLAoQA9BsefAS0AYOmhm8waWvu9eBfBHaCQlE2IwQVzBYL+GxlUVQV7PHnRYMh4A96MIdDRO9170aGVHDbp7Xo719n3mXzWZNxF0jZgXiqyNDLM+i3Gs8eQXmtPWw8ZOiksJa7usxksz9nrvsCBxxwjlSam+z9TqUUQrzqDjOsOlWf0xz/qrFE7Ai23hLrvig0tyd026qXYg23EwqIYiwWhdOxE7XtO7xUfbOB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKTHUJzaqJ7iOnzEAz8ylKhwoyebarNEyFVcISo8rRc=;
 b=JhC33clSpLP1iFpwYT7NP3Z3Q4oVY30+BDST/OdcZIBk5swBsqzuTLLXHjF5SpLLVKUPrwFSLGsU/GSkDaiJW4Of75jhyAaCOJcnLil1HuyfvmoMoNiXZOe2vowIcbGkby92gRNvaM309MJZa8fpbHJvvCsCMYWsofSa8HN4DdIBJYTPQY3cTiXP2t1+uRYpUvrTd+8LFxz1+9FU2/BYpcL02+VCBL1zcDWMmWBTqCjwlth7PT99xoAH1s6Vd4GlfGJdcIoLhDmqYX3sEXjSJw4uMwELiPX3Y+VrkYAjXCRabSXv+7cDd2YiEEFK38D2KINKixVNTcVNhkDDHov1DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKTHUJzaqJ7iOnzEAz8ylKhwoyebarNEyFVcISo8rRc=;
 b=QF08ff1h6lKGXlhmjNkZ2/qkA0xHVWLsuU5J+N/CT2WqR10qF1s/C0AeUpGC596d+833K1TX3RG/m+9YdfbjSmlnMFsj/73Ze4wHWB+/qVGGHpjki+a+p4Bo1OJ2NkOIyO7SbBikHzGtK8Ud7362KGLuze5ccVBBzTi0VbP57qI=
Received: from CH0PR03CA0231.namprd03.prod.outlook.com (2603:10b6:610:e7::26)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 9 Jun
 2025 12:13:01 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::98) by CH0PR03CA0231.outlook.office365.com
 (2603:10b6:610:e7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Mon,
 9 Jun 2025 12:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 12:13:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 07:13:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 07:13:00 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 07:12:57 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<mario.limonciello@amd.com>, <yung-chuan.liao@linux.intel.com>, "Venkata
 Prasad Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: Fix pointer assignments for snd_soc_acpi_mach
 structures
Date: Mon, 9 Jun 2025 17:42:32 +0530
Message-ID: <20250609121251.639080-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: a000bee0-2270-429a-9f79-08dda74efae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xkx6jexUzzN70C1o37UaJyYWQGP4B1FwDeLyuWNPWx9GS1AyduNUcAgxwy6f?=
 =?us-ascii?Q?hnZmesgduj7IxD2WZ0/bIZ2P18bFBxguStoal77RO51ZabLl+enmv0ukzUAO?=
 =?us-ascii?Q?fFlnwdRRemQcymmZjb77CGONiv2ZY/PB2xp+4LLQjsHgUHEjm/kRQlKMDyCd?=
 =?us-ascii?Q?OITHioB3vPx29q7W6mqJbw84QAAXsUQx1rOelnqvB7W4mO1BlP5VwztCdBH1?=
 =?us-ascii?Q?mjZDhAYg03oZE7FXnRq4+Vn+pBtvOSMMgSQh5BKYcUbE9ffYkvAFpwd7m+9R?=
 =?us-ascii?Q?wbT1D1V66ns0kVrugt/sHqjplwhDuCc8TcO21jOVvGLvLX7cw8zp3Iuehwly?=
 =?us-ascii?Q?oOMfkWBCUTAFN3cjUumu2bWIQBljqNuGWs7wKHixEsSO7dJ4yQmxyv0ZlyRM?=
 =?us-ascii?Q?E2iV9Lp9NVCm6nhILX5nPxakQx9kNOy3dMrLgrXN+iW1Undrqnyv5sFNQ4Ec?=
 =?us-ascii?Q?u5mAnknKu2LB3/cidtX2qwHzBSEsHvjoDqfhBull7hhfUTAq0GMZqyIaY1wq?=
 =?us-ascii?Q?F1Vf1UObsGApu8F6T0lDlT5YIYDx4bAPRbEsn+7ykTaUQR2pi3ZGHd5SQ0Rs?=
 =?us-ascii?Q?U0M21SrSeKGXvQaWd9qSIdFZL8ALwMlCFbZdPpDHp4rJnxK3uS077/T94xU4?=
 =?us-ascii?Q?F6MbFl2pqRSoPpGfrJ+m+HkAafz/64H+Zn1BweEL+wNvO7djTEKzxaBka8Jy?=
 =?us-ascii?Q?w7xdtZskx/w1u3f5zsghCMUx33nASLdXZOQGhPkdou+hKW7Gs1fU6JBlrvy7?=
 =?us-ascii?Q?ZTRhaclM8o47zir37WlJwOCme3nEHrUuxBDqMQUmbCAPgXWH/Ma1sXHh6a9B?=
 =?us-ascii?Q?e9NMTGqJc6/D0tNxpuELRh6xAKa3/ybDdnXcB/v23cRnbvXGjoBtet8ecPSx?=
 =?us-ascii?Q?XcD8890iT38APDcthxtKPCBT3h11Te6ULGd8utQtJw2BWwv3ujZ44SVnf1Pg?=
 =?us-ascii?Q?g9WSn07p7Msk+tkByJ1RxDuiMwMl5lbcg3Z5jfvq3Ss/0hp29ROFRcML/3Bo?=
 =?us-ascii?Q?OQVQKzA2qugsDs+Yi4kIvXNfOZz7P7D/bxHda7nn9wuxJ7+bfgR8WFeP8Nl/?=
 =?us-ascii?Q?2XR/QJhDKdRaUyz0KGkWkTdxXAqx7QBDdI0qUrTKkdKvsWuLYODcPH9Zs3+j?=
 =?us-ascii?Q?tyUE6UF3kZ3EvkMcwarM7L/TU2t3K82dI0Mu2zbqLmwXipPQllydUdWCd4hd?=
 =?us-ascii?Q?jfND8bkNPzNHgjcQfI7BirlxuGVZ0UcyOXClpwDDk0dVupoBHlOM75uExRdN?=
 =?us-ascii?Q?+aB2AWz72wQ2gUnlSFAU6RQYUvRVx6JnDAtWGiU4taoCx2XvJ6Q2FK6icFr4?=
 =?us-ascii?Q?CrmhaPuRXv+cCf+Vczljq1cac56UsBUwZeATJfA698W7cb6z0dSN8KNJAw/o?=
 =?us-ascii?Q?7z76GjITKGWPitNqWiTnWCUDCiTUZfZMwNj87NZBjnpmqQ36QhFuZgnYtWll?=
 =?us-ascii?Q?TG5EAmUvXl1gR5eMNQvrKJcHQBIX2/vhwhbC9ePNR+aT6PKV6zw840+76VK8?=
 =?us-ascii?Q?RVZ0kIEzXQfwlvyW+eQtUmXFbWKj6cylw8/y?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:13:01.4723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a000bee0-2270-429a-9f79-08dda74efae8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212
Message-ID-Hash: U26DSP3WWKJVHM7QUFQNNXQEN6ZVEZN2
X-Message-ID-Hash: U26DSP3WWKJVHM7QUFQNNXQEN6ZVEZN2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U26DSP3WWKJVHM7QUFQNNXQEN6ZVEZN2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch modifies the assignment of machine structure pointers in the
acp_pci_probe function. Previously, the machine pointers were assigned
using the address-of operator (&), which caused incompatibility issues
in type assignments.

Additionally, the declarations of the machine arrays in amd.h have been
updated to reflect that they are indeed arrays (`[]`). The code is
further cleaned up by declaring the codec structures in
amd-acpi-mach.c as static, reflecting their intended usage.

error: symbol 'amp_rt1019' was not declared. Should it be static?
error: symbol 'amp_max' was not declared. Should it be static?
error: symbol 'snd_soc_acpi_amd_acp_machines' was not declared. Should it be static?
error: symbol 'snd_soc_acpi_amd_rmb_acp_machines' was not declared. Should it be static?
error: symbol 'snd_soc_acpi_amd_acp63_acp_machines' was not declared. Should it be static?
error: symbol 'snd_soc_acpi_amd_acp70_acp_machines' was not declared. Should it be static?

Fixes: 9c2c0ef64009 ("ASoC: amd: acp: Fix snd_soc_acpi_mach id's duplicate symbol error")

Link: https://github.com/thesofproject/linux/issues/5438
Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c       | 8 ++++----
 sound/soc/amd/acp/amd-acpi-mach.c | 4 ++--
 sound/soc/amd/acp/amd.h           | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 0b2aa33cc426..2591b1a1c5e0 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -137,26 +137,26 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		chip->name = "acp_asoc_renoir";
 		chip->rsrc = &rn_rsrc;
 		chip->acp_hw_ops_init = acp31_hw_ops_init;
-		chip->machines = &snd_soc_acpi_amd_acp_machines;
+		chip->machines = snd_soc_acpi_amd_acp_machines;
 		break;
 	case 0x6f:
 		chip->name = "acp_asoc_rembrandt";
 		chip->rsrc = &rmb_rsrc;
 		chip->acp_hw_ops_init = acp6x_hw_ops_init;
-		chip->machines = &snd_soc_acpi_amd_rmb_acp_machines;
+		chip->machines = snd_soc_acpi_amd_rmb_acp_machines;
 		break;
 	case 0x63:
 		chip->name = "acp_asoc_acp63";
 		chip->rsrc = &acp63_rsrc;
 		chip->acp_hw_ops_init = acp63_hw_ops_init;
-		chip->machines = &snd_soc_acpi_amd_acp63_acp_machines;
+		chip->machines = snd_soc_acpi_amd_acp63_acp_machines;
 		break;
 	case 0x70:
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
 		chip->rsrc = &acp70_rsrc;
 		chip->acp_hw_ops_init = acp70_hw_ops_init;
-		chip->machines = &snd_soc_acpi_amd_acp70_acp_machines;
+		chip->machines = snd_soc_acpi_amd_acp70_acp_machines;
 		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
diff --git a/sound/soc/amd/acp/amd-acpi-mach.c b/sound/soc/amd/acp/amd-acpi-mach.c
index d95047d2ee94..27da2a862f1c 100644
--- a/sound/soc/amd/acp/amd-acpi-mach.c
+++ b/sound/soc/amd/acp/amd-acpi-mach.c
@@ -8,12 +8,12 @@
 
 #include <sound/soc-acpi.h>
 
-struct snd_soc_acpi_codecs amp_rt1019 = {
+static struct snd_soc_acpi_codecs amp_rt1019 = {
 	.num_codecs = 1,
 	.codecs = {"10EC1019"}
 };
 
-struct snd_soc_acpi_codecs amp_max = {
+static struct snd_soc_acpi_codecs amp_max = {
 	.num_codecs = 1,
 	.codecs = {"MX98360A"}
 };
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 863e74fcee43..cb8d97122f95 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -243,10 +243,10 @@ extern struct acp_resource rmb_rsrc;
 extern struct acp_resource acp63_rsrc;
 extern struct acp_resource acp70_rsrc;
 
-extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines;
-extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines;
-extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines;
-extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines;
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[];
 
 extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
 extern const struct snd_soc_dai_ops acp_dmic_dai_ops;
-- 
2.43.0


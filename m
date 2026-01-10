Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1226BD0D0B6
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jan 2026 07:47:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C9C60172;
	Sat, 10 Jan 2026 07:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C9C60172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768027664;
	bh=/rR+wCUTaWOhZwhVzZviN5tRbdhvKoaCFT2pnW2xhtg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iyJrFOeYuUSeW+L5sRyIe3W/nl4vUbh4PRO6oh5XcSu6dXFemxmjl9W/41PA2MbT8
	 gUldXeOjuHylaqPwdFXavEAXRnWpcLf7/2ccOy9aBB2++c59fBZAdsHjZMI2vHg71R
	 F1vlrsQVqvNlhHU0wRdLdnjSpwHUI925VGwKeToY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F8CF805E6; Sat, 10 Jan 2026 07:47:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A1C2F805E2;
	Sat, 10 Jan 2026 07:47:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A322EF80496; Sat, 10 Jan 2026 07:45:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012066.outbound.protection.outlook.com
 [40.107.200.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E49EAF80212
	for <alsa-devel@alsa-project.org>; Sat, 10 Jan 2026 07:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E49EAF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kBm7mnpK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khgXi7kJsj1HQDFCBlmP6PiZpL/M8e3CPTCLSFlBuQ+X7YOz7gcK4oOWswAo7+EUHchosiFIN38PER3KG3ihbLBHFY5R6FbDB3oJ+qRZsujDNORydmi+fRhW5hRFr5vwECUjAvj7IHnhSqbniZyxsw8foOAFuM6SBoLZNDEJ67zhvDzP6netC2GaWtHTJG3B3sCz8gLbdV+0peWG4sGSkJRcVNJHhPBU2gngCYaQyQ64aL598NhNhlfKs0b5rTfhoP5ZbZCZXnVskksWzHrh13EeAOQfUatTknr7t0phExlskiAuykbSpHOCG/xqk1inDzpswQwoXB1mXnrh0lbAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYPzNQsjXOwoBNBajPotZ2uIUQJirximAAPAwwWtQd4=;
 b=eK1puZbFD6cyrSBGUSYn6fTcs2mmBGc4ykDNdOXiwLeN89Qi7htpN8rB/lICL+2SLZg025iUkYaeR0dvGvRNhuC6TBDu26OsJIwGOzjzNdZxm4sB2mlaAp1TDSWZGZFyKaDPegg58NZWUaM5dFstsrumgdtunlK7amqdFJKDQyoLs4yWDPAe2WJWsQDA8UTnj+YheHkCJuYRbGa7Z0o3vpYe9a6+yC6F3lCqyqbqbuPIhgmvBYmfhiQWf0cY4Cvz5ND2qRp7J2HEQpBw8pUe3ht65vypcLmx/RA5a8y5aF3KwWKt9LnyguT3oKdFK7HTDLpkXmTRCR+f7M2MwcL6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYPzNQsjXOwoBNBajPotZ2uIUQJirximAAPAwwWtQd4=;
 b=kBm7mnpKVCGCIHzXgvZj4gWDOmALVvZSqfK7CZvksGRSMclZ75kPBNN8IW96lQiwAGghpNbWaEYYRJYdCbpKlVCvg6JOK5JW/P9NzQ/xuHFAYQ5W12Q9NMPk0Ain97Z9YZuZgn+EdWbWws+TMnvfpFQJM6ls7rruheBh6VdHRKk=
Received: from CH0P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::14)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Sat, 10 Jan
 2026 06:45:22 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::8e) by CH0P221CA0036.outlook.office365.com
 (2603:10b6:610:11d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.6 via Frontend Transport; Sat,
 10 Jan 2026 06:45:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Sat, 10 Jan 2026 06:45:22 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 10 Jan
 2026 00:45:18 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<simont@opensource.cirrus.com>, <Sunil-kumar.Dommati@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
Date: Sat, 10 Jan 2026 12:14:14 +0530
Message-ID: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 427cbe84-c823-4f5e-feab-08de5013d40a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ERJBh1b0Dt8h9q7uxdRYUeOv0BkQ4sTIn7I5aDIqyOsQL1+oWZDvH0TktJ/c?=
 =?us-ascii?Q?gfgNgBIUbR3w54Hzb7Q0rJcahVOSxwTd5nofnnHvd2Pdgy0eU/yik+YwLW/F?=
 =?us-ascii?Q?19AO1+gBEgDDjLv13ZY8c9qv/UtgekKMbdiSBdXYZ0XEiqZh0LGLw3MGrkqd?=
 =?us-ascii?Q?bgvTx2a2ijlCW/uVJp75Y1VgmItBKLWkcE312DNgNxYlT3AJ7NQTtG+gmFzH?=
 =?us-ascii?Q?JZk2ze+5EDOCT1Xv9JUXSpRLjKB9FvIeUGQjCGFzJP3qbx9+YncmqAc5GlAS?=
 =?us-ascii?Q?wNCsp6YYXY4BdK44ERDTkeAqBFQS3o14XS1go5Ie1LqSxmycHVvtRw0iwKa5?=
 =?us-ascii?Q?qWioDFnW5gPtZcPKI7mlgPtmVJ87X7vAbVdbm+79lwGNqvRBToRUOqY1WI0Q?=
 =?us-ascii?Q?6N8May+fQzduFx2avXv17SfO7KkRdLarXbpTBMdrXQlo64u84f9NE9s/YZZK?=
 =?us-ascii?Q?65tzSeyPCxTvD7cbqXL7sejF3I6EjLV4S0Gomos4wlhtW4gWdQMSHfHhEiGd?=
 =?us-ascii?Q?51GqAJL+Q3EM9uvBDHlgf6Cg2fFx6YYKt1uIZD7k0n1V1OnBB61KAJ5cZVK6?=
 =?us-ascii?Q?NFoiQaCZmo72YxLClPH4sr7GGTgGbBbp0+9/baE/2gSJTRj/1IXFiBkVjca8?=
 =?us-ascii?Q?CKFbwPeD2PDuVXi4vczuD7ZBx/TZMLzBp8CjXxU0K6N6prKCQ25eplqhDDE5?=
 =?us-ascii?Q?6YFNkdjsWVShJOajohGtp7bbn4wBOneYEAsEudIekecEfcEYsu2fT6VP76aT?=
 =?us-ascii?Q?U1q6PeJFAuA9zoJrC0vZpSKNIoTgMLMRaCAQuxKfGQ580NDMhBY78/DfNKiq?=
 =?us-ascii?Q?bjp7Aq5LNDzzc00JjCTLwgnAWhXdU/GSD37+jX1X4OnKivXagrEA6PMmfgwd?=
 =?us-ascii?Q?dBfn/WcVUHLS5HHUYFRqwJpfF2N4zuGUecOIPhI9LPxdqBQ3nRBgXBpVLSzF?=
 =?us-ascii?Q?lA4lyvfjn0c9orHjoU8nHa+EO53EXlxu4DwKO5i085RO4jq3H/AKr5A3C2Gs?=
 =?us-ascii?Q?aqMGSyDBMLeRFSpG6bjBazla5OWaOA2XP8ejvmvenzEmHTw7jsgqJ3mN7bzG?=
 =?us-ascii?Q?ET4Kg0RwXKTryhnJEaYCjmudLreieuxg2eukNv/V29Lrkk3I/dkiDqB143ql?=
 =?us-ascii?Q?ZDi1REDaxik5NhFhjOojtPtyilpZxaCtd4ireSb+Kt/VsJ5DyS50nu0UKEql?=
 =?us-ascii?Q?jNiiOVhICZddK11J0jVS4V7yP6PedsbOZvjG8uKmYnOloG7aQTqW9LuHIGx/?=
 =?us-ascii?Q?Lg9bWy7fXhcIVpeq3fitZjucrL0ktgT2YFNSVqRpDRcZ78Hn/1spk30z1uLi?=
 =?us-ascii?Q?Mpqagpb5Lr5bHqhdIDVGwQdVWa+PP8N9+pkuSJnSZMK7IDcNcIWq6sauAvxB?=
 =?us-ascii?Q?CCu6cUOreNeM1VB09y8t7bVr/NE60xkbL0VL0hllUqHkThCVsxZk1nya/sDx?=
 =?us-ascii?Q?uoz57lw2rqH1ZUyfcvztz5MBUHL4N6jZsMGaLT9YwxaktSiJs7E/srkRDmGR?=
 =?us-ascii?Q?snCIFRiN8LUhkbSkBDRMfgy3n43AnVZ159ePdxzwCLmA8N24wYBN9iklpyhH?=
 =?us-ascii?Q?Ze2TAI3FeBN/tVmW5J0=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 06:45:22.4747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 427cbe84-c823-4f5e-feab-08de5013d40a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219
Message-ID-Hash: 5N7ZD4EGTRH3664HQICZ4OHC6A4ECUJT
X-Message-ID-Hash: 5N7ZD4EGTRH3664HQICZ4OHC6A4ECUJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5N7ZD4EGTRH3664HQICZ4OHC6A4ECUJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a filter to skip the RT172 VB configuration if a SmartMic Function
is not found in the SDCA descriptors.

If the ACPI information is incorrect this can only be quirked further
with DMI information.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/Kconfig                    |  6 +++
 sound/soc/amd/acp/Makefile                   |  2 +
 sound/soc/amd/acp/amd-acp70-acpi-match.c     | 50 ++++++++++++++++++++
 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c | 42 ++++++++++++++++
 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h | 14 ++++++
 5 files changed, 114 insertions(+)
 create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
 create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index c2a60bc80ee6..ed2fa055f7f6 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -15,8 +15,14 @@ config SND_SOC_AMD_ACP_COMMON
 
 config SND_SOC_ACPI_AMD_MATCH
 	tristate
+	select SND_SOC_ACPI_AMD_SDCA_QUIRKS
 	select SND_SOC_ACPI if ACPI
 
+config SND_SOC_ACPI_AMD_SDCA_QUIRKS
+	tristate
+	depends on ACPI
+	depends on SND_SOC_SDCA
+
 if SND_SOC_AMD_ACP_COMMON
 
 config SND_SOC_AMD_ACP_PDM
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index 08220b9a3802..81d23aded348 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -27,6 +27,7 @@ snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o
 snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
 snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
 snd-acp-sdw-legacy-mach-y += acp-sdw-legacy-mach.o
+snd-soc-acpi-amd-sdca-quirks-y += soc-acpi-amd-sdca-quirks.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
@@ -40,6 +41,7 @@ obj-$(CONFIG_SND_AMD_ASOC_REMBRANDT) += snd-acp-rembrandt.o
 obj-$(CONFIG_SND_AMD_ASOC_ACP63) += snd-acp63.o
 obj-$(CONFIG_SND_AMD_ASOC_ACP70) += snd-acp70.o
 
+obj-$(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS) += snd-soc-acpi-amd-sdca-quirks.o
 obj-$(CONFIG_SND_AMD_SOUNDWIRE_ACPI) += snd-amd-sdw-acpi.o
 obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
 obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index 871b4f054a84..fa39f18578ca 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -7,6 +7,7 @@
  */
 
 #include <sound/soc-acpi.h>
+#include "soc-acpi-amd-sdca-quirks.h"
 #include "../mach-config.h"
 
 static const struct snd_soc_acpi_endpoint single_endpoint = {
@@ -44,6 +45,39 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
 	.group_id = 1
 };
 
+static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
+	/* Jack Endpoint */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* Amp Endpoint, work as spk_l_endpoint */
+	{
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 0,
+		.group_id = 1,
+	},
+	/* DMIC Endpoint */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt712_vb_1_group1_adr[] = {
+	{
+		.adr = 0x000130025D071201ull,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
+		.name_prefix = "rt712"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_rt1316_group_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -254,6 +288,15 @@ static const struct snd_soc_acpi_link_adr acp70_cs35l56x4_l1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr acp70_alc712_vb_l1[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt712_vb_1_group1_adr),
+		.adr_d = rt712_vb_1_group1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr acp70_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -308,6 +351,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_cs35l56x4_l1,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(1),
+		.links = acp70_alc712_vb_l1,
+		.machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
+		.drv_name = "amd_sdw",
+	},
 	{},
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
@@ -327,3 +376,4 @@ EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_sdw_machines);
 MODULE_DESCRIPTION("AMD ACP7.0 & ACP7.1 tables and support for ACPI enumeration");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_IMPORT_NS("SND_SOC_ACPI_AMD_SDCA_QUIRKS");
diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
new file mode 100644
index 000000000000..63bf9e3c0ae1
--- /dev/null
+++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * soc-acpi-amd-sdca-quirks.c - tables and support for SDCA quirks
+ *
+ * Copyright(c) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ */
+
+#include <linux/soundwire/sdw_amd.h>
+#include <sound/sdca.h>
+#include <sound/soc-acpi.h>
+#include "soc-acpi-amd-sdca-quirks.h"
+
+/*
+ * Pretend machine quirk. The argument type is not the traditional
+ * 'struct snd_soc_acpi_mach' pointer but instead the sdw_amd_ctx
+ * which contains the peripheral information required for the
+ * SoundWire/SDCA filter on the SMART_MIC setup and interface
+ * revision. When the return value is false, the entry in the
+ * 'snd_soc_acpi_mach' table needs to be skipped.
+ */
+bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg)
+{
+	struct sdw_amd_ctx *ctx = arg;
+	int i;
+
+	if (!ctx)
+		return false;
+
+	for (i = 0; i < ctx->peripherals->num_peripherals; i++) {
+		if (sdca_device_quirk_match(ctx->peripherals->array[i],
+					    SDCA_QUIRKS_RT712_VB))
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_NS(snd_soc_acpi_amd_sdca_is_device_rt712_vb, "SND_SOC_ACPI_AMD_SDCA_QUIRKS");
+
+MODULE_DESCRIPTION("ASoC ACPI AMD SDCA quirks");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
new file mode 100644
index 000000000000..7e345a236da1
--- /dev/null
+++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * soc-acpi-amd-sdca-quirks.h - tables and support for SDCA quirks
+ *
+ * Copyright(c) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ */
+
+#ifndef _SND_SOC_ACPI_AMD_SDCA_QUIRKS
+#define _SND_SOC_ACPI_AMD_SDCA_QUIRKS
+
+bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg);
+
+#endif
-- 
2.45.2


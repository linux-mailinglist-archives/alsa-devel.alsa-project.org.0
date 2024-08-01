Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE1F944A51
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4798A3E1C;
	Thu,  1 Aug 2024 13:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4798A3E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511581;
	bh=+jN4DsfvQgeQPKEtYa748iZOohmyJb/7aSkaMJeXSgc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TwFKfRwz2/SsCOZ+N6NfigXGnA87pLrs9G1jXVs9JnToa4QkowrFSyIU8n7s8Y8Id
	 mP65cYWqIgGhAjwyo3C4EIpSxeSKIImP8ixyRYEVsO9BcNugRoMcxvwjRyVZ2L2ryC
	 q9xoivOr6RdK3BUEaKl9RivEmx3t/SqgqYNgHBgU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9C90F8065C; Thu,  1 Aug 2024 13:24:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF77F80685;
	Thu,  1 Aug 2024 13:24:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2CD9F802DB; Thu,  1 Aug 2024 13:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7779EF80269;
	Thu,  1 Aug 2024 13:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7779EF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TQcwuLD+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDD0f+t5kaHoXWIsYCsaWqlzQjIGzL62lVKxN3pHNT8D/j6zulmL69eTD0vo9nbE1dJimPW/VowzB3sNn3rNyN/GmhoiYbv5/wD/2S38oU/oKu/M2j3CsKjZ9DMvwfRoQcVmEMNCani6lW/P/TqnVoxoDB8GH0oM9RTDnXbBVw00/W8d7ro+kKW8zu2fqRkCNY//6KIyvKo0+dI4PBiFmLT2UxQL0tbAlIThUG6dd5cuUapVT7WPEHMGEvUQ/P+JtpLtVhSmPVIxg8OwmFXgFUqYW9f0LBTyqvVd9pgDe0vYaYc2HLiCewxxf365HMb0NgN6D4QUUM1SjvzPn8dh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrIta7C4C6avlHixZ0x4CVjBu2XXbz4hTDAbz6r/g9E=;
 b=ML2n8DadOiAsOmAHhliv7Bmk/0yyP6kU3K3518B7dO0hyrnKiT+3d2m8lqYDZK1SvoxV+Lx92e4iEkkduvb+yMT/62XZavCmLivr5TpZ7oO/jH1jxQfQqKR+hCqrCEQGpfKVYkNwt+VnrruYdaSsPCBKc7xOxIa5byDdG5IEZmgGYIvXEIxSPhJEATWJ/VpnIe4Bf5lYtOCjQsoQsf4z65xL3ygxAxY06tF2xcq+d8lQ/43zIJs4OIKm+FqNoqx3bQ3Y1JPLjGYrjyeM0iXERdO3Egly9R5OHNmaQvffWJ9ADRjDTuZCJtNn1QCf+TIAzFu8/qNbqdC8DhC/aWgLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrIta7C4C6avlHixZ0x4CVjBu2XXbz4hTDAbz6r/g9E=;
 b=TQcwuLD+2sNjP0qA34clr6ucf+TlGpk0N/SX/hUDSjtvozuw7hVhwhLaavZTTTLT6mb+E+0ysDxpp9A1PxfcnpnwBRxlmb9kvNUdOc8pzAJEjd4S+TOkTHRuoKwZhzWDy+J4IqxhOK//tJTgkZnjlyq7QGi/tw+uLxc2praMylU=
Received: from MN2PR20CA0039.namprd20.prod.outlook.com (2603:10b6:208:235::8)
 by MW6PR12MB8867.namprd12.prod.outlook.com (2603:10b6:303:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Thu, 1 Aug
 2024 11:20:42 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::1e) by MN2PR20CA0039.outlook.office365.com
 (2603:10b6:208:235::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 11:20:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:20:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:20:41 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 06:20:30 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vijendar.mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <linux-sound@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Arnd Bergmann <arnd@arndb.de>, Marian Postevca
	<posteuca@mutex.one>, open list <linux-kernel@vger.kernel.org>, "moderated
 list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH RESEND 28/31] ASoC: amd: acp: add soundwire machines for
 acp6.3 based platform
Date: Thu, 1 Aug 2024 16:48:14 +0530
Message-ID: <20240801111821.18076-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b7de8ea-fa0a-46a6-2fb0-08dcb21bfab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q3whCjJRAZ6sSFdLp7mFhov1QPjPUGdqzUoxfzGyJ+bn6jN65CuLzMKZzxGF?=
 =?us-ascii?Q?DmHpGb+r5b2/s9+kV259QYGa4oFUAAVKVYdbhFqHwp1KWdx0DbKxVseBc2Zz?=
 =?us-ascii?Q?IAexak73oZZ1tCnE5FqZX7I+PGw1Eo1+WR1y6sH3Cr121VS2tQ381G+K6AKp?=
 =?us-ascii?Q?IFJSM1Ph3HmP1Jld4LUL+O1l62ipfjZ8o0Mbg6fn+4vNo+jxAQPb7+3Kva8C?=
 =?us-ascii?Q?Vj5477fmRqL3PKlc1UVK+RKcj55rNnUweRvqYvg50DZE3hJBAmn+/QgHWJlp?=
 =?us-ascii?Q?Fpvqd6J4l+bz44mUg5Gd17Wcy3+eZjnt086F/6h2xn+M1O5FdP4epLRB7vUR?=
 =?us-ascii?Q?qZIlKvCArsgGOwMOWirGc9Ei0889MLbJ5YfA1gez4+tiGQ6KOdQoEniZQaIC?=
 =?us-ascii?Q?cpV3NE3c5/JPFq0RYLBnRZFg4MvHLxODpiFS7ynt6rckoiAOzclde2bmVnOa?=
 =?us-ascii?Q?GDoybA9/pQCqQsZsGjTYDNClRj6XqsbXu2zLcA5vno2QujpIUE2sPV/snfVm?=
 =?us-ascii?Q?YR9Ufh1FJ/3kYBEJe4u6wwbCe0Wmc5TszOgzJL3i3HCJfDsif92zRAq8xK6q?=
 =?us-ascii?Q?AV3v1wOEm2EF3D7ZPY8mUIau9JYy3Dtgb8KD8xHczlPLKrnyCQhH8vJO9/QS?=
 =?us-ascii?Q?Qu8GS+vkzjfi48PUx9wnmwFbsRxHp+3ph+wmjVQmQsU7hZBqLJqz629lmMHR?=
 =?us-ascii?Q?Qe2CJ3+jdNxUJ2+aMLzQmZ6lOCEAGPkpYboTHvtyyGmyZdZxgJAtbTbhBU49?=
 =?us-ascii?Q?JfifyLpsK/I8Bo23a9dry5bBbiajO+/Kb2MNlnfCgC0OmTeRsu3as5oF8ZoH?=
 =?us-ascii?Q?+Tqmymg4U5bq8shpgYAnjmxxdau3UMhQNeRfyD5uquij4bE4UZouh7XpAihq?=
 =?us-ascii?Q?9d/Hc5C+Od46QBA/VATOE2BBazoKRnJ4m17oX19MJssA3Zjpoon3QQ1j12T6?=
 =?us-ascii?Q?+mdlv7WxVZHKA0BlAAqGJ+ubOBoad6AtJoh3HBTePH1gN/ZSGxb1SjPCptGA?=
 =?us-ascii?Q?oleLtXaEWmL5X3SOFySM4LcMd85ElbHEd6SK4Tz7+G8KHBKvnay1y3OkW44v?=
 =?us-ascii?Q?HZnNdMWlNjOr/YV/36z1oBL0Rhn90I/64p9xR5cUBKVKViqL+HczbXKDTtp0?=
 =?us-ascii?Q?Hox1UGFnn7F4UrU84sk8VSqqKS1jEesoLaAXFToAyXQSLIzfD1D81x2SocFM?=
 =?us-ascii?Q?IGIoM5e4S2ETWncVChKC75dBY98itYc+MVVI7el6qbdney5/HMZdvUgy5EAV?=
 =?us-ascii?Q?5FjNcphp4hTITbA4jBC3sr7Zf/7iEbAG1imSnmA3OOyjeVWUJSS/5ZYZXDv7?=
 =?us-ascii?Q?0NViz5QhNMDH41bpDEjey5bYphubl46ercy0OEomdjIziv7yHDvQnk2lndR4?=
 =?us-ascii?Q?5O/2tmdtuYFn2ngi3/iu9TvqNPI37d00tg1M69eeQqizsfRaKQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:20:41.8763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b7de8ea-fa0a-46a6-2fb0-08dcb21bfab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867
Message-ID-Hash: 6AZP7N3EO44VSI5L2OQK4N3SOKWOJLLV
X-Message-ID-Hash: 6AZP7N3EO44VSI5L2OQK4N3SOKWOJLLV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AZP7N3EO44VSI5L2OQK4N3SOKWOJLLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Soundwire machines for acp6.3 based platform.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/acp/Kconfig                |  4 ++
 sound/soc/amd/acp/Makefile               |  2 +
 sound/soc/amd/acp/amd-acp63-acpi-match.c | 90 ++++++++++++++++++++++++
 sound/soc/amd/mach-config.h              |  1 +
 sound/soc/sof/amd/Kconfig                |  1 +
 5 files changed, 98 insertions(+)
 create mode 100644 sound/soc/amd/acp/amd-acp63-acpi-match.c

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 30590a23ad63..19859b1b73c5 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -13,6 +13,10 @@ config SND_SOC_AMD_ACP_COMMON
 	  This option enables common modules for Audio-Coprocessor i.e. ACP
 	  IP block on AMD platforms.
 
+config SND_SOC_ACPI_AMD_MATCH
+	tristate
+	select SND_SOC_ACPI if ACPI
+
 if SND_SOC_AMD_ACP_COMMON
 
 config SND_SOC_AMD_ACP_PDM
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index b068bf1f920e..516a44f3ffb6 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -22,6 +22,7 @@ snd-acp70-y := acp70.o
 snd-acp-mach-y     := acp-mach-common.o
 snd-acp-legacy-mach-y     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
 snd-acp-sof-mach-y     := acp-sof-mach.o
+snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
@@ -38,3 +39,4 @@ obj-$(CONFIG_SND_AMD_SOUNDWIRE_ACPI) += snd-amd-sdw-acpi.o
 obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
 obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
 obj-$(CONFIG_SND_SOC_AMD_SOF_MACH) += snd-acp-sof-mach.o
+obj-$(CONFIG_SND_SOC_ACPI_AMD_MATCH) += snd-soc-acpi-amd-match.o
diff --git a/sound/soc/amd/acp/amd-acp63-acpi-match.c b/sound/soc/amd/acp/amd-acp63-acpi-match.c
new file mode 100644
index 000000000000..be9367913073
--- /dev/null
+++ b/sound/soc/amd/acp/amd-acp63-acpi-match.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * amd-acp63-acpi-match.c - tables and support for ACP 6.3 platform
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
+static const struct snd_soc_acpi_link_adr acp63_4_in_1_sdca[] = {
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
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp63_4_in_1_sdca,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp_6_3-rt711-l0-rt1316-l0-rt714-l1.tplg",
+		.fw_filename = "sof-acp_6_3.ri",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sof_sdw_machines);
+
+MODULE_DESCRIPTION("AMD ACP6.3 tables and support for ACPI enumeration");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 7af0f9cf3921..32aa8a6931f4 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -23,6 +23,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_vangogh_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
 
 struct config_entry {
 	u32 flags;
diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 2729c6eb3feb..848c031ed5fb 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -23,6 +23,7 @@ config SND_SOC_SOF_AMD_COMMON
 	select SND_AMD_ACP_CONFIG
 	select SND_SOC_SOF_XTENSA
 	select SND_SOC_SOF_ACP_PROBES
+	select SND_SOC_ACPI_AMD_MATCH
 	select SND_SOC_ACPI if ACPI
 	help
 	  This option is not user-selectable but automatically handled by
-- 
2.34.1


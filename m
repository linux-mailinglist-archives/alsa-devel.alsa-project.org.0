Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D62119C6E4F
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2024 12:55:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98B0E210F;
	Wed, 13 Nov 2024 12:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98B0E210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731498911;
	bh=DCxGkbcYVhKBbQOy4O61+Y+euI+S15gtPI3YDPumR88=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ThRh2tbbVnQYZGI2zIpuLRQ8VmO4E/GQMDq84sCaEDAu3aGIEVVzjrWyiaHWe8Gxd
	 bvrdlDEBcRZOtfP2i7FomntmnvmUoWgcL+LGIoSKOmAaFvBTV4i/ezamNQ2mZjnsbW
	 NANsmXIsuS5bQexVmVqQRGceVc9giZLBpFTaOPWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 666BAF806B1; Wed, 13 Nov 2024 12:53:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9824CF806B1;
	Wed, 13 Nov 2024 12:53:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F2AF806A3; Wed, 13 Nov 2024 12:53:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1758F80631
	for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2024 12:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1758F80631
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jWQSS4Es
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOnI7daDiug0CAaYNFtPmk9Xjfagors1CJTIxL7pRQ5CmuXTN6HwlH6t/cLiRKIPgrWPtJ5f23owicskY3vY/lDlvlgdW8iEHnsa5NGP7i3EetkW9rg0qd3QBe0AGFqWilBN2Vn3E47BmxbiEP5wjVjt3nJvvrLnfyIOR+7Fwicus7TWtO6A+guS4oarTd1/8rbzbYoatxddJyqZ7fKih01HnVDQA2kv74sjjkWDtOqEMp9ruXnrRoTK1AoNuc8uiEefwYEgbhAoYvA01tTmOQtqwzw/5xesxwhNKqAyqxiDulyzPZc8VeN1oK4vvRQG30RazVmZBfqfj4WV7XbJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMhPOkm6RKYClPiuU6VT8v06xrmjOgqRPIumGqMfk4Y=;
 b=PuwN23RQDY3Q55S35ZgCpKI5x4P9QnfbmmAaR7AVJpN2UOsH/BhQeOs8lKQFz6TpnXrmtSF6mpPd8pjWC4/mLD6Y5ClDslh+keQ+uULuBWIqnpsies94DXhdYm3DLhQ1d3SPlikJrClEDoHWje5+VpwPIJcctFcAacTXHwy6oXjdlRAIPUpsAyXBnUkcyf8hNjvSl1jzHZ8YBL24Gtimy9oAA50EwCCzsezflV7dB0KDybOKECDAKaZZ8sCCEASyXL282UsQuJXJd3nP6b+x5sqm/dyRifmFXJ9JvG2S816a9wc4Lptkoo/b/aIWx8Tqq010AbwaoJrZuOCajcqSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMhPOkm6RKYClPiuU6VT8v06xrmjOgqRPIumGqMfk4Y=;
 b=jWQSS4Es38eIFXalz/GsGXsXSqWh+EpHQ2OESk8xlmZOvytK5v/mbF90IjhdQeAGbHjCrMwf7eh935ZB48VM/4chF/QD9BTru7ziVpk/PhXQ4QiQi3jWIFthXLE29RSKAA+WcksQl8njEZvE2+cDlDO/fk1rcTZSVEF6oW3C970=
Received: from BY5PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:180::42)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 11:53:03 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::9b) by BY5PR13CA0029.outlook.office365.com
 (2603:10b6:a03:180::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Wed, 13 Nov 2024 11:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 11:53:03 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 05:52:57 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 5/6] ASoC: amd: acp: add soundwire machine driver for legacy
 stack
Date: Wed, 13 Nov 2024 17:22:22 +0530
Message-ID: <20241113115223.3274868-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
References: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: f82380ce-e09a-4b09-cce1-08dd03d9bacf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nJZ4qX35r91oOQP7H5NGnBqKFWa5Wa7mkHeqrdn2tqI8NCAhJntnfcTc45KE?=
 =?us-ascii?Q?Ouku1TnwFPGBdjTqt6+PxAvFLlNOP/F/PlMD1xtYz+KwXjn22v1PkHTAS9Tq?=
 =?us-ascii?Q?AZarSTBtSSp4aOoN52b4jiuK0HgtHWnlVWgz2EmjwrM+AGUYMX8WBgMBtMjd?=
 =?us-ascii?Q?XHod/R7Xcf+VzRawkYwrYihSN3r1SVwjY7Kf0Cu6fYqzq19AFHb4/Jw8Prwh?=
 =?us-ascii?Q?2N5PUi1zvIPNbU9M7i6ocrfrWxva9n1syrOlpTa6Jn4MMMWdUVctO7rutxdp?=
 =?us-ascii?Q?yTyyPHGmNcPZRedWnPK09iglzfh4Yc/UWMfEQRgZVvDth3PC7X+Ih3umHLuo?=
 =?us-ascii?Q?SSCnBgdt0tL9wKL0/DZHkrNs28nlWu5eULAK36L81zLDtr4g9ovBYikQoODi?=
 =?us-ascii?Q?JAXLH5NhP9c2FZERHR2RFAANsZ/I4ISzJPVDqyk1o4Vg7J5OJt7Y6cegaT6J?=
 =?us-ascii?Q?rBHMGjwMsI8JhR26YiTwwbAcL8nzAyoV7lJqQqo8J2gMhn1c97cAkt2yrGn4?=
 =?us-ascii?Q?1oYZMwA/wXydz6GZSyPCimKXMdv2jTpIEReZ+O2jm6OVm8HZ956ZrmmAeYdF?=
 =?us-ascii?Q?voseN0K+wObz/lz/sCP7tuA9u7S9CZJPv6/e3dhEZd11PmF5iE88AqZUKTT1?=
 =?us-ascii?Q?C0/Iwos8xxjT4TgCUaqdYX00dWf6553xlL9UZpZLDiIzls35TrKuHuf96Cvd?=
 =?us-ascii?Q?jfnmN9ijkgvH62zmBZjwN0THabvzHh5S6Sx/v03RePV1bAgR9aCteazhmvBG?=
 =?us-ascii?Q?rH9rbnIjVR6FsrRbxQtvEe3sMyIJbjSB0igSdOvPKmpYU5N/eDVOFbmlKjGR?=
 =?us-ascii?Q?yGlwJ8EqLgaHDx1aXCeliCtcEc0+vNsJlMbink4UlMkEvYBIn0/26n93t/Um?=
 =?us-ascii?Q?fceSb0DT8682MJJwaXgmreAp7SVjRB20iD06JUCmeSzu3DH8nrc++tBUGv0/?=
 =?us-ascii?Q?e5PaPHjVMKAcQl6/OJlalLbuwx+N69sUB3nbaSX3DRXU6CwbqnMbiRIgadcs?=
 =?us-ascii?Q?A//bfs8WNdArO04eXABPonFjZu1dr7CN+UekZ70uhKmQd7w/9wZVPwWh5A9s?=
 =?us-ascii?Q?fblCDb0fWAPQqyWvqJK6VOrotm/AyAPsoWT8JhLymky6zXHvprsZX2oyPDur?=
 =?us-ascii?Q?dw6urrVs+Y1IZtlvIKDb10xr7NQLsRsrmniipz6tRp8wdQ7Bt2gLUtA8YIbu?=
 =?us-ascii?Q?AD9M6Bf6ONsF9xQAGwGINFCrevrf3e7c5f6a58IrQrGwX4mb2+LTrrlP/tIj?=
 =?us-ascii?Q?IhQ20LK2Mlsq2A4QOAAPzKgE516iDGak1rvHxLY9Kowsg6Y8jMLNpuqQ1FQQ?=
 =?us-ascii?Q?cmE0JoKZKGH2QjwnnjNOYpxlWR1qXUM1XHpbz8MJ76UYpiqdT3AMrnGgcq5v?=
 =?us-ascii?Q?V6C7BlLKG2Z3OG4/UYjdkvEFBfpjX1x7/0VXe0WMCk+03zvmjQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 11:53:03.1258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f82380ce-e09a-4b09-cce1-08dd03d9bacf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277
Message-ID-Hash: NBS4DXN7QM63UVXXJ6Z3HCGINZ5DE7U2
X-Message-ID-Hash: NBS4DXN7QM63UVXXJ6Z3HCGINZ5DE7U2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBS4DXN7QM63UVXXJ6Z3HCGINZ5DE7U2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire machine driver for legacy(No DSP) stack for ACP6.3 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/Kconfig               |  22 ++
 sound/soc/amd/acp/Makefile              |   2 +
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 486 ++++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h  |   2 +
 4 files changed, 512 insertions(+)
 create mode 100644 sound/soc/amd/acp/acp-sdw-legacy-mach.c

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index acd047d558bd..03f3fcbba5af 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -144,6 +144,28 @@ config SND_SOC_AMD_SOF_SDW_MACH
 	  on AMD platform.
 	  If unsure select "N".
 
+config SND_SOC_AMD_LEGACY_SDW_MACH
+	tristate "AMD Legacy(No DSP) Soundwire Machine Driver Support"
+	depends on X86 && PCI && ACPI
+	depends on SOUNDWIRE
+	select SND_SOC_AMD_SDW_MACH_COMMON
+	select SND_SOC_SDW_UTILS
+	select SND_SOC_DMIC
+	select SND_SOC_RT711_SDW
+	select SND_SOC_RT711_SDCA_SDW
+	select SND_SOC_RT712_SDCA_SDW
+	select SND_SOC_RT712_SDCA_DMIC_SDW
+	select SND_SOC_RT1316_SDW
+	select SND_SOC_RT715_SDW
+	select SND_SOC_RT715_SDCA_SDW
+	select SND_SOC_RT722_SDCA_SDW
+	help
+	  This option enables Legacy(No DSP) sound card support for SoundWire
+	  enabled AMD platforms along with ACP PDM controller.
+	  Say Y if you want to enable SoundWire based machine driver support
+	  on AMD platform.
+	  If unsure select "N".
+
 endif # SND_SOC_AMD_ACP_COMMON
 
 config SND_AMD_SOUNDWIRE_ACPI
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index 0e6c4022e7a2..bb2702036338 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -25,6 +25,7 @@ snd-acp-sof-mach-y     := acp-sof-mach.o
 snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o
 snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
 snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
+snd-acp-sdw-legacy-mach-y += acp-sdw-legacy-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
@@ -44,3 +45,4 @@ obj-$(CONFIG_SND_SOC_AMD_SOF_MACH) += snd-acp-sof-mach.o
 obj-$(CONFIG_SND_SOC_ACPI_AMD_MATCH) += snd-soc-acpi-amd-match.o
 obj-$(CONFIG_SND_SOC_AMD_SDW_MACH_COMMON) += snd-acp-sdw-mach.o
 obj-$(CONFIG_SND_SOC_AMD_SOF_SDW_MACH) += snd-acp-sdw-sof-mach.o
+obj-$(CONFIG_SND_SOC_AMD_LEGACY_SDW_MACH) += snd-acp-sdw-legacy-mach.o
diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
new file mode 100644
index 000000000000..48952a238946
--- /dev/null
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -0,0 +1,486 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2024 Advanced Micro Devices, Inc.
+
+/*
+ *  acp-sdw-legacy-mach - ASoC legacy Machine driver for AMD SoundWire platforms
+ */
+
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/module.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "soc_amd_sdw_common.h"
+#include "../../codecs/rt711.h"
+
+static unsigned long soc_sdw_quirk = RT711_JD1;
+static int quirk_override = -1;
+module_param_named(quirk, quirk_override, int, 0444);
+MODULE_PARM_DESC(quirk, "Board-specific quirk override");
+
+static void log_quirks(struct device *dev)
+{
+	if (SOC_JACK_JDSRC(soc_sdw_quirk))
+		dev_dbg(dev, "quirk realtek,jack-detect-source %ld\n",
+			SOC_JACK_JDSRC(soc_sdw_quirk));
+	if (soc_sdw_quirk & ASOC_SDW_ACP_DMIC)
+		dev_dbg(dev, "quirk SOC_SDW_ACP_DMIC enabled\n");
+}
+
+static int soc_sdw_quirk_cb(const struct dmi_system_id *id)
+{
+	soc_sdw_quirk = (unsigned long)id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id soc_sdw_quirk_table[] = {
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "AMD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Birman-PHX"),
+		},
+		.driver_data = (void *)RT711_JD2,
+	},
+	{}
+};
+
+static const struct snd_soc_ops sdw_ops = {
+	.startup = asoc_sdw_startup,
+	.prepare = asoc_sdw_prepare,
+	.trigger = asoc_sdw_trigger,
+	.hw_params = asoc_sdw_hw_params,
+	.hw_free = asoc_sdw_hw_free,
+	.shutdown = asoc_sdw_shutdown,
+};
+
+static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
+
+static int create_sdw_dailink(struct snd_soc_card *card,
+			      struct asoc_sdw_dailink *soc_dai,
+			      struct snd_soc_dai_link **dai_links,
+			      int *be_id, struct snd_soc_codec_conf **codec_conf,
+			      struct snd_soc_dai_link_component *sdw_platform_component)
+{
+	struct device *dev = card->dev;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
+	struct asoc_sdw_endpoint *soc_end;
+	int cpu_pin_id;
+	int stream;
+	int ret;
+
+	list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
+		if (soc_end->name_prefix) {
+			(*codec_conf)->dlc.name = soc_end->codec_name;
+			(*codec_conf)->name_prefix = soc_end->name_prefix;
+			(*codec_conf)++;
+		}
+
+		if (soc_end->include_sidecar) {
+			ret = soc_end->codec_info->add_sidecar(card, dai_links, codec_conf);
+			if (ret)
+				return ret;
+		}
+	}
+
+	for_each_pcm_streams(stream) {
+		static const char * const sdw_stream_name[] = {
+			"SDW%d-PIN%d-PLAYBACK",
+			"SDW%d-PIN%d-CAPTURE",
+			"SDW%d-PIN%d-PLAYBACK-%s",
+			"SDW%d-PIN%d-CAPTURE-%s",
+		};
+		struct snd_soc_dai_link_ch_map *codec_maps;
+		struct snd_soc_dai_link_component *codecs;
+		struct snd_soc_dai_link_component *cpus;
+		int num_cpus = hweight32(soc_dai->link_mask[stream]);
+		int num_codecs = soc_dai->num_devs[stream];
+		int playback, capture;
+		int j = 0;
+		char *name;
+
+		if (!soc_dai->num_devs[stream])
+			continue;
+
+		soc_end = list_first_entry(&soc_dai->endpoints,
+					   struct asoc_sdw_endpoint, list);
+
+		*be_id = soc_end->dai_info->dailink[stream];
+		if (*be_id < 0) {
+			dev_err(dev, "Invalid dailink id %d\n", *be_id);
+			return -EINVAL;
+		}
+
+		switch (amd_ctx->acp_rev) {
+		case ACP63_PCI_REV:
+			ret = get_acp63_cpu_pin_id(ffs(soc_end->link_mask - 1),
+						   *be_id, &cpu_pin_id, dev);
+			if (ret)
+				return ret;
+			break;
+		default:
+			return -EINVAL;
+		}
+		/* create stream name according to first link id */
+		if (ctx->append_dai_type) {
+			name = devm_kasprintf(dev, GFP_KERNEL,
+					      sdw_stream_name[stream + 2],
+					      ffs(soc_end->link_mask) - 1,
+					      cpu_pin_id,
+					      type_strings[soc_end->dai_info->dai_type]);
+		} else {
+			name = devm_kasprintf(dev, GFP_KERNEL,
+					      sdw_stream_name[stream],
+					      ffs(soc_end->link_mask) - 1,
+					      cpu_pin_id);
+		}
+		if (!name)
+			return -ENOMEM;
+
+		cpus = devm_kcalloc(dev, num_cpus, sizeof(*cpus), GFP_KERNEL);
+		if (!cpus)
+			return -ENOMEM;
+
+		codecs = devm_kcalloc(dev, num_codecs, sizeof(*codecs), GFP_KERNEL);
+		if (!codecs)
+			return -ENOMEM;
+
+		codec_maps = devm_kcalloc(dev, num_codecs, sizeof(*codec_maps), GFP_KERNEL);
+		if (!codec_maps)
+			return -ENOMEM;
+
+		list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
+			if (!soc_end->dai_info->direction[stream])
+				continue;
+
+			int link_num = ffs(soc_end->link_mask) - 1;
+
+			cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"SDW%d Pin%d",
+							link_num, cpu_pin_id);
+			dev_dbg(dev, "cpu->dai_name:%s\n", cpus->dai_name);
+			if (!cpus->dai_name)
+				return -ENOMEM;
+
+			codec_maps[j].cpu = 0;
+			codec_maps[j].codec = j;
+
+			codecs[j].name = soc_end->codec_name;
+			codecs[j].dai_name = soc_end->dai_info->dai_name;
+			j++;
+		}
+
+		WARN_ON(j != num_codecs);
+
+		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
+		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
+
+		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
+				       cpus, num_cpus, sdw_platform_component,
+				       1, codecs, num_codecs,
+				       0, asoc_sdw_rtd_init, &sdw_ops);
+		/*
+		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
+		 * based on wait_for_completion(), tag them as 'nonatomic'.
+		 */
+		(*dai_links)->nonatomic = true;
+		(*dai_links)->ch_maps = codec_maps;
+
+		list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
+			if (soc_end->dai_info->init)
+				soc_end->dai_info->init(card, *dai_links,
+							soc_end->codec_info,
+							playback);
+		}
+
+		(*dai_links)++;
+	}
+
+	return 0;
+}
+
+static int create_sdw_dailinks(struct snd_soc_card *card,
+			       struct snd_soc_dai_link **dai_links, int *be_id,
+			       struct asoc_sdw_dailink *soc_dais,
+			       struct snd_soc_codec_conf **codec_conf)
+{
+	struct device *dev = card->dev;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
+	struct snd_soc_dai_link_component *sdw_platform_component;
+	int ret;
+
+	sdw_platform_component = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+					      GFP_KERNEL);
+	if (!sdw_platform_component)
+		return -ENOMEM;
+
+	switch (amd_ctx->acp_rev) {
+	case ACP63_PCI_REV:
+		sdw_platform_component->name = "amd_ps_sdw_dma.0";
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* generate DAI links by each sdw link */
+	while (soc_dais->initialised) {
+		int current_be_id;
+
+		ret = create_sdw_dailink(card, soc_dais, dai_links,
+					 &current_be_id, codec_conf, sdw_platform_component);
+		if (ret)
+			return ret;
+
+		/* Update the be_id to match the highest ID used for SDW link */
+		if (*be_id < current_be_id)
+			*be_id = current_be_id;
+
+		soc_dais++;
+	}
+
+	return 0;
+}
+
+static int create_dmic_dailinks(struct snd_soc_card *card,
+				struct snd_soc_dai_link **dai_links, int *be_id, int no_pcm)
+{
+	struct device *dev = card->dev;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
+	struct snd_soc_dai_link_component *pdm_cpu;
+	struct snd_soc_dai_link_component *pdm_platform;
+	int ret;
+
+	pdm_cpu = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
+	if (!pdm_cpu)
+		return -ENOMEM;
+
+	pdm_platform = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
+	if (!pdm_platform)
+		return -ENOMEM;
+
+	switch (amd_ctx->acp_rev) {
+	case ACP63_PCI_REV:
+		pdm_cpu->name = "acp_ps_pdm_dma.0";
+		pdm_platform->name = "acp_ps_pdm_dma.0";
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*be_id = ACP_DMIC_BE_ID;
+	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "acp-dmic-codec",
+					    0, 1, // DMIC only supports capture
+					    pdm_cpu->name, pdm_platform->name, 1,
+					    "dmic-codec.0", "dmic-hifi", no_pcm,
+					    asoc_sdw_dmic_init, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	return 0;
+}
+
+static int soc_card_dai_links_create(struct snd_soc_card *card)
+{
+	struct device *dev = card->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
+	int sdw_be_num = 0, dmic_num = 0;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	struct asoc_sdw_endpoint *soc_ends __free(kfree) = NULL;
+	struct asoc_sdw_dailink *soc_dais __free(kfree) = NULL;
+	struct snd_soc_codec_conf *codec_conf;
+	struct snd_soc_dai_link *dai_links;
+	int num_devs = 0;
+	int num_ends = 0;
+	int num_links;
+	int be_id = 0;
+	int ret;
+
+	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends);
+	if (ret < 0) {
+		dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
+		return ret;
+	}
+
+	/* One per DAI link, worst case is a DAI link for every endpoint */
+	soc_dais = kcalloc(num_ends, sizeof(*soc_dais), GFP_KERNEL);
+	if (!soc_dais)
+		return -ENOMEM;
+
+	/* One per endpoint, ie. each DAI on each codec/amp */
+	soc_ends = kcalloc(num_ends, sizeof(*soc_ends), GFP_KERNEL);
+	if (!soc_ends)
+		return -ENOMEM;
+
+	ret = asoc_sdw_parse_sdw_endpoints(card, soc_dais, soc_ends, &num_devs);
+	if (ret < 0)
+		return ret;
+
+	sdw_be_num = ret;
+
+	/* enable dmic */
+	if (soc_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num)
+		dmic_num = 1;
+
+	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
+
+	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
+	if (!codec_conf)
+		return -ENOMEM;
+
+	/* allocate BE dailinks */
+	num_links = sdw_be_num + dmic_num;
+	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
+	if (!dai_links)
+		return -ENOMEM;
+
+	card->codec_conf = codec_conf;
+	card->num_configs = num_devs;
+	card->dai_link = dai_links;
+	card->num_links = num_links;
+
+	/* SDW */
+	if (sdw_be_num) {
+		ret = create_sdw_dailinks(card, &dai_links, &be_id,
+					  soc_dais, &codec_conf);
+		if (ret)
+			return ret;
+	}
+
+	/* dmic */
+	if (dmic_num > 0) {
+		if (ctx->ignore_internal_dmic) {
+			dev_warn(dev, "Ignoring ACP DMIC\n");
+		} else {
+			ret = create_dmic_dailinks(card, &dai_links, &be_id, 0);
+			if (ret)
+				return ret;
+		}
+	}
+
+	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
+	WARN_ON(dai_links != card->dai_link + card->num_links);
+
+	return ret;
+}
+
+static int mc_probe(struct platform_device *pdev)
+{
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
+	struct snd_soc_card *card;
+	struct amd_mc_ctx *amd_ctx;
+	struct asoc_sdw_mc_private *ctx;
+	int amp_num = 0, i;
+	int ret;
+
+	amd_ctx = devm_kzalloc(&pdev->dev, sizeof(*amd_ctx), GFP_KERNEL);
+	if (!amd_ctx)
+		return -ENOMEM;
+
+	amd_ctx->acp_rev = mach->mach_params.subsystem_rev;
+	amd_ctx->max_sdw_links = ACP63_SDW_MAX_LINKS;
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	ctx->codec_info_list_count = asoc_sdw_get_codec_info_list_count();
+	ctx->private = amd_ctx;
+	card = &ctx->card;
+	card->dev = &pdev->dev;
+	card->name = "amd-soundwire";
+	card->owner = THIS_MODULE;
+	card->late_probe = asoc_sdw_card_late_probe;
+
+	snd_soc_card_set_drvdata(card, ctx);
+
+	dmi_check_system(soc_sdw_quirk_table);
+
+	if (quirk_override != -1) {
+		dev_info(card->dev, "Overriding quirk 0x%lx => 0x%x\n",
+			 soc_sdw_quirk, quirk_override);
+		soc_sdw_quirk = quirk_override;
+	}
+
+	log_quirks(card->dev);
+
+	ctx->mc_quirk = soc_sdw_quirk;
+	dev_dbg(card->dev, "legacy quirk 0x%lx\n", ctx->mc_quirk);
+	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
+	for (i = 0; i < ctx->codec_info_list_count; i++)
+		codec_info_list[i].amp_num = 0;
+
+	ret = soc_card_dai_links_create(card);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * the default amp_num is zero for each codec and
+	 * amp_num will only be increased for active amp
+	 * codecs on used platform
+	 */
+	for (i = 0; i < ctx->codec_info_list_count; i++)
+		amp_num += codec_info_list[i].amp_num;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  " cfg-amp:%d", amp_num);
+	if (!card->components)
+		return -ENOMEM;
+	if (mach->mach_params.dmic_num) {
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "%s mic:dmic cfg-mics:%d",
+						  card->components,
+						  mach->mach_params.dmic_num);
+		if (!card->components)
+			return -ENOMEM;
+	}
+
+	/* Register the card */
+	ret = devm_snd_soc_register_card(card->dev, card);
+	if (ret) {
+		dev_err_probe(card->dev, ret, "snd_soc_register_card failed %d\n", ret);
+		asoc_sdw_mc_dailink_exit_loop(card);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, card);
+
+	return ret;
+}
+
+static void mc_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+
+	asoc_sdw_mc_dailink_exit_loop(card);
+}
+
+static const struct platform_device_id mc_id_table[] = {
+	{ "amd_sdw", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, mc_id_table);
+
+static struct platform_driver soc_sdw_driver = {
+	.driver = {
+		.name = "amd_sdw",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = mc_probe,
+	.remove = mc_remove,
+	.id_table = mc_id_table,
+};
+
+module_platform_driver(soc_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC AMD SoundWire Legacy Generic Machine driver");
+MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SND_SOC_SDW_UTILS);
+MODULE_IMPORT_NS(SND_SOC_AMD_SDW_MACH);
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index eba92cd004d4..b7bae107c13e 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -36,6 +36,8 @@
 #define ACP63_SW1_AUDIO0_TX	0
 #define ACP63_SW1_AUDIO0_RX	1
 
+#define ACP_DMIC_BE_ID		4
+
 struct amd_mc_ctx {
 	unsigned int acp_rev;
 	unsigned int max_sdw_links;
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FDEA16A45
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:04:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E447601DB;
	Mon, 20 Jan 2025 11:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E447601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367479;
	bh=IRrWuamcbmGdVycOuXlQTpZ0GIgRSZoWfsjbKq7uWKE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AuxmdkHx4hX/7C04ro5iEQ/Ty2f5y/cF8CzCI/y+KrjwR38zU4X16WWC06D33Rpma
	 ISa51he8mFhmzPquAijX4UhTbhPt2YAe68rZB5CjX4Q9iZes2/kv6/fig7qy7EeB8v
	 oYT0vpHKFGd13xAiqzdK5BGt0fb4BvgScWaqOt2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E72FDF805F3; Mon, 20 Jan 2025 11:03:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B3BF805E2;
	Mon, 20 Jan 2025 11:03:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA7AF805C6; Mon, 20 Jan 2025 11:02:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51DAAF805BD
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51DAAF805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VEsW0rRs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9jZekGdBAUP4BFvPijfaLuKKoxYroqc4pXvbHoXwUkB5VNA/PIeT/P59lPOwQgqYgX+k+iXjn8PPn2VlzgXOo8twQwK/aHW3C83qULeYLWXf35tjincsnLGQ+/syVf1fkkgHlLqUzNL+z+6zNgAfdpNwrQTfssQr92EyqHPvBH8Daj90eE5VWHWAxxkXeX+mzUZ0R6Gx/FIUjcpbmHt5AVtyUfraQ7ME1I6Z3xsSTyapn7q/ZdUbnrA95JNTX3OMgvsBtAM9J69xYf1tgRLEuavihI6jNRMw2HG7o3IZrRkISl+x8shWQqXDxnpPJOAjM2PjRFP+7C3pXD/INhhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPk1E21AP/QyNkEB9RNusjZMp/3x2yPkKsPRl1y0YGY=;
 b=jE7LinDOz4iyaVOM4EBua1tWBrORXYnRhZ00t7jEHdxoJ9xdyPX/G2cfmdV0TIkFKVjpBg90fPfDoJ9YPzmAurYM4TC40edSSwjiJ1CaFUHqbgeHUI88PLsYfDi3wt6hNtnjgHx4JfIM8bS5jTAjbysTo7zsm4ktZ+vRmqPIYtYUb6Zoy3j1PV/stg+hbBqagcEHUT1n7pM7WttobS4SIp2Fb1euu7bnUTYhbWRJ43qHeZ1+wNHPOzYE7WkiFkNnT6NiG8QFaaKclRDnjScT1cb3VWgMK1lRutoq7V0zwqhXn0Y5xWs5i/1AsDtZgK+Y8swpSrBUbOh5soJvxagc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPk1E21AP/QyNkEB9RNusjZMp/3x2yPkKsPRl1y0YGY=;
 b=VEsW0rRslEQHuI3nSGfziuq9pKSr3jYIlGRKLRQHXIGWecANb2Un20PGf9qTTddauzJ3rWvIk9m4PlJsbN4bTd9Mf2wlCumgJ4IlsjVkyN8tO8BpBquJ5yIkGhI6zcOL1HCcILfRhdDdPPWQ4Qt6mHnsdTUYITiwqPda8NE4VAg=
Received: from CH2PR08CA0013.namprd08.prod.outlook.com (2603:10b6:610:5a::23)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:02:07 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::d6) by CH2PR08CA0013.outlook.office365.com
 (2603:10b6:610:5a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:07 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:03 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 06/23] ASoC: amd: acp70: enable driver build for ACP7.0
 platform
Date: Mon, 20 Jan 2025 15:31:13 +0530
Message-ID: <20250120100130.3710412-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS7PR12MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 12348d0d-cc6b-4014-ebcb-08dd39397fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rJwXHdCMrIPBkFBExmPYoKcfGvM969IBg5HRGP/iRHIlcQLXBXsVjNOWtDww?=
 =?us-ascii?Q?/CQZCO5XsJkGD0OwincjGNY+2rmjnTVsmqoFOgC8SVbbDyqfFEGYm4szZhJd?=
 =?us-ascii?Q?6m7Pla7sX8EgAHVxB62++EbMJkPlxjFC18xvmHQ9P3Dmu4ONY08uabxEWUPO?=
 =?us-ascii?Q?+4Lb0LcVRxTISrJtKGwfUpf0lkwewjcyUwVyuHPoG0mftJh666W1B01WQnPk?=
 =?us-ascii?Q?+unXDAO27Zvh5nbrAXA7DRLXsoEUistTuZKTkDqqYqpNr5KGMKT8ahYSKuhO?=
 =?us-ascii?Q?3TCWbY/moDoDoEFIx6YgUU4AvXGsX3P+kACMzfUlDXOlMKSk97wWStnc+sc2?=
 =?us-ascii?Q?gDuP8e+qddXuVwdZoZkgbO/IDwJKPkvfSWQcMuSN+awhJwp1B0g3w1ngkntq?=
 =?us-ascii?Q?zQGxiZM5bBn1099qKvaESWqFzGfcGtcrkQSI8HZHImQtHAR+pJSHrlShGzLU?=
 =?us-ascii?Q?CGt5T9h1Khvz0HFKUbhpVWYCHyxGRKIw7Ye/YAGKF910iVlMPTyCwVWFqPab?=
 =?us-ascii?Q?2zllEQmPij4dSSJwBD0I2x8yY4yHf/7UDjVZzfZuJnRhuMIepHGXwB8yr+xg?=
 =?us-ascii?Q?IMJXdErA5wgftVXyPskr55bvrh0XbMeGr/3nsqG6D8S2NEEKILEWF+QF/zVk?=
 =?us-ascii?Q?opzkoCNMsnq0yD9tygTyutCwdDeKd0KoLg43m9BrUhCZ6PmGHOHjk7UiDrrR?=
 =?us-ascii?Q?VdSJKfS9tinTCvn07Jw9FNI6MHbXd0iLrCbIX3caFq6qf4+XVteichN+BQp0?=
 =?us-ascii?Q?KZZyRml5FpVsfYsyIoZ1r8pOpXFsk3QcY0KHL8Ie6j/mQsh43WP72P+T7l7D?=
 =?us-ascii?Q?SBQHFzT+khlOQD4W+l7UfFvTNkrmja79qi+jjO9venDNP4v0tamAmiIfQ6/u?=
 =?us-ascii?Q?pmbIMWergEHqS80LPwkcIl0d9k/IW2B7njgYdEdELaJGkBDhO5oTDwm3kS/7?=
 =?us-ascii?Q?YZcBdeov0LQ1kDVpDm3znKwgvXcYQ64/lAoyeL3Sv+YfmzopX0HoJ9NIZWlK?=
 =?us-ascii?Q?LJcCI5YDQR90LRx0mxspsRRAKW6mLX2aYcnvp0qzPwwWAbcKaajf5IyvJ9Vb?=
 =?us-ascii?Q?MHdbvz6qjwSXVx0dCoDJOM/VCVccHoqrYCrXwck5lL6fpXh0MiU57tFk4s3/?=
 =?us-ascii?Q?t/xQPNa6Tr3UGIVO/VZ3+b7LU0vUsX9zIbAYhGl9C5Dh9vx7zqgzb6pqf6FJ?=
 =?us-ascii?Q?YfRKQaGV3wtq7zOk0SKjuJAcisWcE8/hNLVMrYxtqnX+q2F+0i0cT2adLXPf?=
 =?us-ascii?Q?pr5x+uOPylxrCpLLt4eoTkYhmO4zAdnhlPzbNMqdHoBIBqPLM2BeTCEh8deq?=
 =?us-ascii?Q?O5lKmtBLVt1vO/zP0Q58TAmPfT+44CZ8FBMa7P4g/+tWl/qZ6w1JqZGDEDYh?=
 =?us-ascii?Q?TiWw0K2sDyZnj+53nvQljLtESXU33uBrnW7DXdDpJkjJUqGKGEY1qRNL4CVm?=
 =?us-ascii?Q?KsyFBuwB5KnnW9m+qsvypFxFdkdHSz2lqF1Io5BPP7yb0EQiGvErTeaHvmZ2?=
 =?us-ascii?Q?yO3YDs3C2v4Vzm8=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:07.4179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 12348d0d-cc6b-4014-ebcb-08dd39397fb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008
Message-ID-Hash: HKRQZ4YS2R4XO73DW27SZPZA2NAMNXOK
X-Message-ID-Hash: HKRQZ4YS2R4XO73DW27SZPZA2NAMNXOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKRQZ4YS2R4XO73DW27SZPZA2NAMNXOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Config options for ACP7.0 platform and Make file to trigger ACP7.0
driver build.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig        | 10 ++++++++++
 sound/soc/amd/Makefile       |  1 +
 sound/soc/amd/acp70/Makefile |  5 +++++
 3 files changed, 16 insertions(+)
 create mode 100644 sound/soc/amd/acp70/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 803521178279..bc0bceee9494 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -184,4 +184,14 @@ config SND_SOC_AMD_PS_MACH
           Say m if you have such a device.
           If unsure select "N".
 
+config SND_SOC_AMD_ACP70
+	tristate "AMD Audio Coprocessor-v7.0 SoundWire support"
+	select SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
+	depends on X86 && PCI && ACPI
+	help
+	  This option enables Audio Coprocessor i.e ACP v7.0 support.
+	  By enabling this flag build will be triggered for ACP PCI driver.
+	  Say m if you have such a device.
+	  If unsure select "N".
+
 endif
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 4f89d962cce2..d71f74f957ff 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_SND_AMD_ACP_CONFIG) += acp/
 obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
 obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += rpl/
 obj-$(CONFIG_SND_SOC_AMD_PS) += ps/
+obj-$(CONFIG_SND_SOC_AMD_ACP70) += acp70/
diff --git a/sound/soc/amd/acp70/Makefile b/sound/soc/amd/acp70/Makefile
new file mode 100644
index 000000000000..5e553de6c772
--- /dev/null
+++ b/sound/soc/amd/acp70/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# ACP 7.0 platform Support
+snd-pci-acp70-y := pci-acp70.o
+
+obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-pci-acp70.o
-- 
2.34.1


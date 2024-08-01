Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB034944A5A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:28:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299533E95;
	Thu,  1 Aug 2024 13:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299533E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511646;
	bh=gjVfaO7godzl4qc/FIQYwvRqdMT5PkQX2OQJc8nRRfs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cLtDYPNHfKDZyE1j8KPLYyQap0zh7CCDlxj+v5Tpk10L4OUwE5cTOAeV6uyGjKMll
	 ttUDBF0HXwpEXqLwxS3dRehYIbtM9DlHdHaj8D+XhB+6ths7le3ArroMtR9rnswyiD
	 kDq0HWRHt1xPaZYsZzQcg77+9N6tJ/YeDf5r+27U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3095AF806F7; Thu,  1 Aug 2024 13:24:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D02BF806CD;
	Thu,  1 Aug 2024 13:24:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA32FF8026A; Thu,  1 Aug 2024 13:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E2ACF80269
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 13:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2ACF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XP9Ka1ik
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keM5li6yXHTaeCMEEvXqn0L5BlIrgTRI7PPEzoAyqwN7oD88DaubbWdUIpFvrf/3IiSta9yhVV5NbfTkhgyvXpjMVsy2Dtag1vXYvQNiABTgqVHqpJ4s00tSYCMI17p+J5dutGTKG1nQ+qCxtBLGs9Vvq1g/q+gf9IqKSETgfh3i6oW0/RnOp+ix9frUnytcRKa233WVEI5JoYfFovsbYgWYlzhEc9Fs0P0qEHESi8qDWne8i39XYBWXRrO5IQmvDJs67RPMk+yz91pdM86lA7TpSrtl1JJYlhjxYXaKQ0Girm2nzpEeBt0x7J4Hp1zIAgTvTJoQMxjkYcHLtC3zEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rlz4Sgo7zIx58RR6CkdBAmxgTcXU0KqACOvLkkyfF7k=;
 b=KnRgfuFMvUuhV3Vl4xqWP5vDmFMLN/fIIxn1P07vP5q8yTMYEZtkGK2OcmXG1eiE2VmirFTr6Oo8auaGokqGs2iuWZY5EKM3OBAQLZQa83n/KJVhexeoYFLV2/7NA703AcTBpy6+dZl6syDtCuLA9f4jNoZG/b6OPHkldglUIpssJOQ+zG8BXgwIYNmAsrBkKseuPeKaxHbp3du9UKkcOfBnIeRaoAIZNaUE6cBEsiZ3IkUNQS2jWWn8qGX8M62oQFhVG2kxjt6R5dIMgj2kHLlDv6YPlq2EwfvCG1iaPGdwCjwIhBx4z6rMMsI5BULWGWzfl/l9IE9CcjoaaMCehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rlz4Sgo7zIx58RR6CkdBAmxgTcXU0KqACOvLkkyfF7k=;
 b=XP9Ka1ikIV3JGpY5vEbqIBXZtbbwC2n559Q3qbm4sMgtTAWggjQUTvjMbAlnXzUp3MC1d1Yc9vr43vdzsbUl0lOX1NjNhBeoJXpOAcRFy9vAny22ZOOX2nSM1Kmg2yahEOaJcQSnTOEe36cR4Xpvg0qEk0MOpP3iNLgqpq/MxSQ=
Received: from BL0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:2d::41)
 by SJ2PR12MB9139.namprd12.prod.outlook.com (2603:10b6:a03:564::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 11:21:47 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:2d:cafe::cb) by BL0PR03CA0028.outlook.office365.com
 (2603:10b6:208:2d::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Thu, 1 Aug 2024 11:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:21:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:21:46 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 06:21:36 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vijendar.mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <linux-sound@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Marian
 Postevca" <posteuca@mutex.one>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 31/31] ASoC: amd/sdw_utils: add sof based soundwire
 generic machine driver
Date: Thu, 1 Aug 2024 16:48:17 +0530
Message-ID: <20240801111821.18076-11-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SJ2PR12MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab17601-793c-4632-c98e-08dcb21c21a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aS79psivKrI2vxHlabMRJEkO/6LanAayRLk03gyWpdDWTCXaYQsAltq9H4F2?=
 =?us-ascii?Q?IrfR+V2/LHwB/OldIL2kpVVLEwHusJaxAz3kMjLdCgsGAyB4EmhAiAPUVWTx?=
 =?us-ascii?Q?vQwbMJl3qON9Yc5roygmIO48iPfQItMZRp6E3b2xfBib97GdfLKgg9VQHnYL?=
 =?us-ascii?Q?j30GaHCMOF2J24DbT+XHNrSERoXdkhXppZlcn20cbx1xKRfFKYwfpFF5r048?=
 =?us-ascii?Q?ZZJuyvScNbVoxtc2BMrtLe/4qU6Gbx8sG057XpmLhIhK5V/bQa+0dOqMNmDx?=
 =?us-ascii?Q?JtwYW9Jxa43t6j9NNgnrFlicD2wNMRsNZ2ne1oqTO9ThTLCrCdcp6p4iOInY?=
 =?us-ascii?Q?VGMpoPdRlgxIV7G0+76eN8vzirly0xIG6Wl8IQL4zoe/n8xogX+heG0Ev/89?=
 =?us-ascii?Q?wOL09OBOsU7Zc9PGttb604O3VtQOqR9AzO+xznNfLiwGBex3vLwimlhgDHJ2?=
 =?us-ascii?Q?iGVqfXoPpxCUil32GnsAaunBfeB8LNrA25gVC64mEf+28aSiYCyxDCV8t2lj?=
 =?us-ascii?Q?aZU5f5m9+gj91iYzq2+W48Qt5ibcim7yp8Ne8pZ+PHdZEOP8zHWFpR65J09B?=
 =?us-ascii?Q?F/41uCvk5KXxKCuI/f4jf22m53ClF0+kuB+Z6H5ARxi+8GYFOnAWdEj/QXkV?=
 =?us-ascii?Q?0BdIYOBQSlpziKG4DNHjI3wLFRXCHDk8tfqHTOzR/kxvbcOwFLW1bq5F0/uH?=
 =?us-ascii?Q?VnwaEfyFsVafl+J2tp3XE7TfQuXzARmq7LX0qQiBXe2G8a8dTHJsWksrWCWI?=
 =?us-ascii?Q?gMEqL/bvoiF8SGavgT8KIcCQBbAucsdp6U7P3xlUYHIWHosAl3pWUr/W+4Dx?=
 =?us-ascii?Q?2zfukNb0gNXqgpnx3ZUVV2yLrg4/oZMYz3KYq8h6Hfw9H+DiC0JETHjvbdWy?=
 =?us-ascii?Q?RY5MpOm0qH+oevmup1SiutBONnsiwybj76tDZhqeu/aX9a1jR2kLjRms8l5j?=
 =?us-ascii?Q?oTM7C6495615lMCB39KMhtFSgA2ErMj0bHIEdqLkgNUak5M9Uz4MFReobJdM?=
 =?us-ascii?Q?kiMu9yV/TroJyFAUmZMTMcJzrP2cMfhgJm2MuRUj+K8tiYx0GDRp6gZy3ASn?=
 =?us-ascii?Q?fxgB7QM1GzjOuFREJ6Ft4mZrdtzyBTXnQHHgq1EbD/EcybgabDI4fsmIelv9?=
 =?us-ascii?Q?ONRV93OJ8Uq0ceIt93Nv1Pqq8ZaFeRx/wDyCY0FpMUhNPefqvBCNSJHTuWX/?=
 =?us-ascii?Q?CQXkQ8UZ1RRrTW4xXfoQ7Rclhq+AM74fdO4886ZjvMdUA6mvMID5IJH9XoOX?=
 =?us-ascii?Q?P8tWsYJew75par9p+VKIepDRVRvSc14jwNSNdE2OXALEPakvIuD2SnkCZx3b?=
 =?us-ascii?Q?iXaUPHiilzD30mqwUmw4CPY/tcxJEKGXfEQeV4N/eZdLiATpa3ATGMW2ba8q?=
 =?us-ascii?Q?Jjow/8f8umpUAsiz7D7ZChHpY+39TO2BGz1ReTQAYzCkX851mw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:21:47.2287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ab17601-793c-4632-c98e-08dcb21c21a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9139
Message-ID-Hash: 4FYKSMPGE6LHIL4OGL3NMLNKSHW647HI
X-Message-ID-Hash: 4FYKSMPGE6LHIL4OGL3NMLNKSHW647HI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4FYKSMPGE6LHIL4OGL3NMLNKSHW647HI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sof based Soundwire generic driver for amd platforms.
Currently support added for ACP6.3 based platforms.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/acp/Kconfig              |  18 +
 sound/soc/amd/acp/Makefile             |   2 +
 sound/soc/amd/acp/acp-sdw-sof-mach.c   | 742 +++++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h |  44 ++
 4 files changed, 806 insertions(+)
 create mode 100644 sound/soc/amd/acp/acp-sdw-sof-mach.c
 create mode 100644 sound/soc/amd/acp/soc_amd_sdw_common.h

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 19859b1b73c5..88391e4c17e3 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -119,6 +119,24 @@ config SND_SOC_AMD_SOF_MACH
 	help
 	  This option enables SOF sound card support for ACP audio.
 
+config SND_SOC_AMD_SOF_SDW_MACH
+	tristate "AMD SOF Soundwire Machine Driver Support"
+	depends on X86 && PCI && ACPI
+	depends on SOUNDWIRE
+	select SND_SOC_SDW_UTILS
+	select SND_SOC_DMIC
+	select SND_SOC_RT711_SDW
+	select SND_SOC_RT711_SDCA_SDW
+	select SND_SOC_RT1316_SDW
+	select SND_SOC_RT715_SDW
+	select SND_SOC_RT715_SDCA_SDW
+	help
+	  This option enables SOF sound card support for SoundWire enabled
+	  AMD platforms along with ACP PDM controller.
+	  Say Y if you want to enable SoundWire based machine driver support
+	  on AMD platform.
+	  If unsure select "N".
+
 endif # SND_SOC_AMD_ACP_COMMON
 
 config SND_AMD_SOUNDWIRE_ACPI
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index 516a44f3ffb6..82cf5d180b3a 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -23,6 +23,7 @@ snd-acp-mach-y     := acp-mach-common.o
 snd-acp-legacy-mach-y     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
 snd-acp-sof-mach-y     := acp-sof-mach.o
 snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o
+snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
@@ -40,3 +41,4 @@ obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
 obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
 obj-$(CONFIG_SND_SOC_AMD_SOF_MACH) += snd-acp-sof-mach.o
 obj-$(CONFIG_SND_SOC_ACPI_AMD_MATCH) += snd-soc-acpi-amd-match.o
+obj-$(CONFIG_SND_SOC_AMD_SOF_SDW_MACH) += snd-acp-sdw-sof-mach.o
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
new file mode 100644
index 000000000000..3419675e45a9
--- /dev/null
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -0,0 +1,742 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2024 Advanced Micro Devices, Inc.
+
+/*
+ *  acp-sdw-sof-mach - ASoC Machine driver for AMD SoundWire platforms
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
+static unsigned long sof_sdw_quirk = RT711_JD1;
+static int quirk_override = -1;
+module_param_named(quirk, quirk_override, int, 0444);
+MODULE_PARM_DESC(quirk, "Board-specific quirk override");
+
+static void log_quirks(struct device *dev)
+{
+	if (SOC_JACK_JDSRC(sof_sdw_quirk))
+		dev_dbg(dev, "quirk realtek,jack-detect-source %ld\n",
+			SOC_JACK_JDSRC(sof_sdw_quirk));
+	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC)
+		dev_dbg(dev, "quirk SOC_SDW_ACP_DMIC enabled\n");
+}
+
+static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
+{
+	sof_sdw_quirk = (unsigned long)id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id sof_sdw_quirk_table[] = {
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "AMD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Birman-PHX"),
+		},
+		.driver_data = (void *)RT711_JD2,
+	},
+	{}
+};
+
+static struct snd_soc_dai_link_component platform_component[] = {
+	{
+		/* name might be overridden during probe */
+		.name = "0000:04:00.5",
+	}
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
+/*
+ * get BE dailink number and CPU DAI number based on sdw link adr.
+ * Since some sdw slaves may be aggregated, the CPU DAI number
+ * may be larger than the number of BE dailinks.
+ */
+static int get_dailink_info(struct device *dev,
+			    const struct snd_soc_acpi_link_adr *adr_link,
+			    int *sdw_be_num, int *codecs_num)
+{
+	bool group_visited[AMD_SDW_MAX_GROUPS];
+	int i;
+	int j;
+
+	*sdw_be_num  = 0;
+
+	if (!adr_link)
+		return -EINVAL;
+
+	for (i = 0; i < AMD_SDW_MAX_GROUPS; i++)
+		group_visited[i] = false;
+
+	for (; adr_link->num_adr; adr_link++) {
+		const struct snd_soc_acpi_endpoint *endpoint;
+		struct asoc_sdw_codec_info *codec_info;
+		int stream;
+		u64 adr;
+
+		/* make sure the link mask has a single bit set */
+		if (!is_power_of_2(adr_link->mask))
+			return -EINVAL;
+
+		for (i = 0; i < adr_link->num_adr; i++) {
+			adr = adr_link->adr_d[i].adr;
+			codec_info = asoc_sdw_find_codec_info_part(adr);
+			if (!codec_info)
+				return -EINVAL;
+
+			*codecs_num += codec_info->dai_num;
+
+			if (!adr_link->adr_d[i].name_prefix) {
+				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
+					adr_link->adr_d[i].adr);
+				return -EINVAL;
+			}
+
+			endpoint = adr_link->adr_d[i].endpoints;
+			if (endpoint->aggregated && !endpoint->group_id) {
+				dev_err(dev, "invalid group id on link %x\n",
+					adr_link->mask);
+				return -EINVAL;
+			}
+
+			for (j = 0; j < codec_info->dai_num; j++) {
+				/* count DAI number for playback and capture */
+				for_each_pcm_streams(stream) {
+					if (!codec_info->dais[j].direction[stream])
+						continue;
+
+					/* count BE for each non-aggregated slave or group */
+					if (!endpoint->aggregated ||
+					    !group_visited[endpoint->group_id])
+						(*sdw_be_num)++;
+				}
+			}
+
+			if (endpoint->aggregated)
+				group_visited[endpoint->group_id] = true;
+		}
+	}
+	return 0;
+}
+
+static int fill_sdw_codec_dlc(struct device *dev,
+			      const struct snd_soc_acpi_link_adr *adr_link,
+			      struct snd_soc_dai_link_component *codec,
+			      int adr_index, int dai_index)
+{
+	u64 adr = adr_link->adr_d[adr_index].adr;
+	struct asoc_sdw_codec_info *codec_info;
+
+	codec_info = asoc_sdw_find_codec_info_part(adr);
+	if (!codec_info)
+		return -EINVAL;
+
+	codec->name = asoc_sdw_get_codec_name(dev, codec_info, adr_link, adr_index);
+	if (!codec->name)
+		return -ENOMEM;
+
+	codec->dai_name = codec_info->dais[dai_index].dai_name;
+	dev_err(dev, "codec->dai_name:%s\n", codec->dai_name);
+	return 0;
+}
+
+static int set_codec_init_func(struct snd_soc_card *card,
+			       const struct snd_soc_acpi_link_adr *adr_link,
+			       struct snd_soc_dai_link *dai_links,
+			       bool playback, int group_id, int adr_index, int dai_index)
+{
+	int i = adr_index;
+
+	do {
+		/*
+		 * Initialize the codec. If codec is part of an aggregated
+		 * group (group_id>0), initialize all codecs belonging to
+		 * same group.
+		 * The first link should start with adr_link->adr_d[adr_index]
+		 * because that is the device that we want to initialize and
+		 * we should end immediately if it is not aggregated (group_id=0)
+		 */
+		for ( ; i < adr_link->num_adr; i++) {
+			struct asoc_sdw_codec_info *codec_info;
+
+			codec_info = asoc_sdw_find_codec_info_part(adr_link->adr_d[i].adr);
+			if (!codec_info)
+				return -EINVAL;
+
+			/* The group_id is > 0 iff the codec is aggregated */
+			if (adr_link->adr_d[i].endpoints->group_id != group_id)
+				continue;
+			if (codec_info->dais[dai_index].init)
+				codec_info->dais[dai_index].init(card,
+								 dai_links,
+								 codec_info,
+								 playback);
+
+			if (!group_id)
+				return 0;
+		}
+
+		i = 0;
+		adr_link++;
+	} while (adr_link->mask);
+
+	return 0;
+}
+
+/*
+ * check endpoint status in slaves and gather link ID for all slaves in
+ * the same group to generate different CPU DAI. Now only support
+ * one sdw link with all slaves set with only single group id.
+ *
+ * one slave on one sdw link with aggregated = 0
+ * one sdw BE DAI <---> one-cpu DAI <---> one-codec DAI
+ *
+ * two or more slaves on one sdw link with aggregated = 1
+ * one sdw BE DAI  <---> one-cpu DAI <---> multi-codec DAIs
+ */
+static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
+			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
+			  int *codec_num, unsigned int *group_id,
+			  int adr_index)
+{
+	int i;
+
+	if (!adr_link->adr_d[adr_index].endpoints->aggregated) {
+		cpu_dai_id[0] = ffs(adr_link->mask) - 1;
+		*cpu_dai_num = 1;
+		*codec_num = 1;
+		*group_id = 0;
+		return 0;
+	}
+
+	*codec_num = 0;
+	*cpu_dai_num = 0;
+	*group_id = adr_link->adr_d[adr_index].endpoints->group_id;
+
+	/* Count endpoints with the same group_id in the adr_link */
+	for (; adr_link && adr_link->num_adr; adr_link++) {
+		unsigned int link_codecs = 0;
+
+		for (i = 0; i < adr_link->num_adr; i++) {
+			if (adr_link->adr_d[i].endpoints->aggregated &&
+			    adr_link->adr_d[i].endpoints->group_id == *group_id)
+				link_codecs++;
+		}
+
+		if (link_codecs) {
+			*codec_num += link_codecs;
+
+			if (*cpu_dai_num >= ACP63_SDW_MAX_CPU_DAIS) {
+				dev_err(dev, "cpu_dai_id array overflowed\n");
+				return -EINVAL;
+			}
+
+			cpu_dai_id[(*cpu_dai_num)++] = ffs(adr_link->mask) - 1;
+		}
+	}
+
+	return 0;
+}
+
+static int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev)
+{
+	switch (sdw_link_id) {
+	case AMD_SDW0:
+		switch (be_id) {
+		case SOC_SDW_JACK_OUT_DAI_ID:
+			*cpu_pin_id = ACP63_SW0_AUDIO0_TX;
+			break;
+		case SOC_SDW_JACK_IN_DAI_ID:
+			*cpu_pin_id = ACP63_SW0_AUDIO0_RX;
+			break;
+		case SOC_SDW_AMP_OUT_DAI_ID:
+			*cpu_pin_id = ACP63_SW0_AUDIO1_TX;
+			break;
+		case SOC_SDW_AMP_IN_DAI_ID:
+			*cpu_pin_id = ACP63_SW0_AUDIO1_RX;
+			break;
+		case SOC_SDW_DMIC_DAI_ID:
+			*cpu_pin_id = ACP63_SW0_AUDIO2_RX;
+			break;
+		default:
+			dev_err(dev, "Invalid be id:%d\n", be_id);
+			return -EINVAL;
+		}
+		break;
+	case AMD_SDW1:
+		switch (be_id) {
+		case SOC_SDW_JACK_OUT_DAI_ID:
+		case SOC_SDW_AMP_OUT_DAI_ID:
+			*cpu_pin_id = ACP63_SW1_AUDIO0_TX;
+			break;
+		case SOC_SDW_JACK_IN_DAI_ID:
+		case SOC_SDW_AMP_IN_DAI_ID:
+		case SOC_SDW_DMIC_DAI_ID:
+			*cpu_pin_id = ACP63_SW1_AUDIO0_RX;
+			break;
+		default:
+			dev_err(dev, "invalid be_id:%d\n", be_id);
+			return -EINVAL;
+		}
+		break;
+	default:
+		dev_err(dev, "Invalid link id:%d\n", sdw_link_id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
+
+static int create_sdw_dailink(struct snd_soc_card *card,
+			      struct snd_soc_dai_link **dai_links,
+			      const struct snd_soc_acpi_link_adr *adr_link,
+			      struct snd_soc_codec_conf **codec_conf,
+			      int *be_id, int adr_index, int dai_index)
+{
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
+	struct device *dev = card->dev;
+	const struct snd_soc_acpi_link_adr *adr_link_next;
+	struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
+	struct snd_soc_dai_link_component *codecs;
+	struct snd_soc_dai_link_component *cpus;
+	struct asoc_sdw_codec_info *codec_info;
+	int cpu_dai_id[ACP63_SDW_MAX_CPU_DAIS];
+	int cpu_dai_num;
+	unsigned int group_id;
+	unsigned int sdw_link_id;
+	int codec_dlc_index = 0;
+	int codec_num;
+	int stream;
+	int i = 0;
+	int j, k;
+	int ret;
+	int cpu_pin_id;
+
+	ret = get_slave_info(adr_link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
+			     &group_id, adr_index);
+	if (ret)
+		return ret;
+	codecs = devm_kcalloc(dev, codec_num, sizeof(*codecs), GFP_KERNEL);
+	if (!codecs)
+		return -ENOMEM;
+
+	sdw_codec_ch_maps = devm_kcalloc(dev, codec_num,
+					 sizeof(*sdw_codec_ch_maps), GFP_KERNEL);
+	if (!sdw_codec_ch_maps)
+		return -ENOMEM;
+
+	/* generate codec name on different links in the same group */
+	j = adr_index;
+	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
+	     i < cpu_dai_num; adr_link_next++) {
+		/* skip the link excluded by this processed group */
+		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
+			continue;
+
+		/* j reset after loop, adr_index only applies to first link */
+		for (k = 0 ; (j < adr_link_next->num_adr) && (k < codec_num) ; j++, k++) {
+			const struct snd_soc_acpi_endpoint *endpoints;
+
+			endpoints = adr_link_next->adr_d[j].endpoints;
+			if (group_id && (!endpoints->aggregated ||
+					 endpoints->group_id != group_id))
+				continue;
+
+			/* sanity check */
+			if (*codec_conf >= card->codec_conf + card->num_configs) {
+				dev_err(dev, "codec_conf array overflowed\n");
+				return -EINVAL;
+			}
+
+			ret = fill_sdw_codec_dlc(dev, adr_link_next,
+						 &codecs[codec_dlc_index],
+						 j, dai_index);
+			if (ret)
+				return ret;
+			(*codec_conf)->dlc = codecs[codec_dlc_index];
+			(*codec_conf)->name_prefix = adr_link_next->adr_d[j].name_prefix;
+
+			sdw_codec_ch_maps[codec_dlc_index].cpu = i;
+			sdw_codec_ch_maps[codec_dlc_index].codec = codec_dlc_index;
+
+			codec_dlc_index++;
+			(*codec_conf)++;
+		}
+		j = 0;
+
+		/* check next link to create codec dai in the processed group */
+		i++;
+	}
+
+	/* find codec info to create BE DAI */
+	codec_info = asoc_sdw_find_codec_info_part(adr_link->adr_d[adr_index].adr);
+	if (!codec_info)
+		return -EINVAL;
+
+	ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
+
+	sdw_link_id = (adr_link->adr_d[adr_index].adr) >> 48;
+	for_each_pcm_streams(stream) {
+		char *name, *cpu_name;
+		int playback, capture;
+		static const char * const sdw_stream_name[] = {
+			"SDW%d-PIN%d-PLAYBACK",
+			"SDW%d-PIN%d-CAPTURE",
+			"SDW%d-PIN%d-PLAYBACK-%s",
+			"SDW%d-PIN%d-CAPTURE-%s",
+		};
+
+		if (!codec_info->dais[dai_index].direction[stream])
+			continue;
+
+		*be_id = codec_info->dais[dai_index].dailink[stream];
+		if (*be_id < 0) {
+			dev_err(dev, "Invalid dailink id %d\n", *be_id);
+			return -EINVAL;
+		}
+		switch (amd_ctx->acp_rev) {
+		case ACP63_PCI_REV:
+			ret = get_acp63_cpu_pin_id(sdw_link_id, *be_id, &cpu_pin_id, dev);
+			if (ret)
+				return ret;
+			break;
+		default:
+			return -EINVAL;
+		}
+		/* create stream name according to first link id */
+		if (ctx->append_dai_type) {
+			name = devm_kasprintf(dev, GFP_KERNEL,
+					      sdw_stream_name[stream + 2], sdw_link_id, cpu_pin_id,
+					      type_strings[codec_info->dais[dai_index].dai_type]);
+		} else {
+			name = devm_kasprintf(dev, GFP_KERNEL,
+					      sdw_stream_name[stream], sdw_link_id, cpu_pin_id);
+		}
+		if (!name)
+			return -ENOMEM;
+
+		cpus = devm_kcalloc(dev, cpu_dai_num, sizeof(*cpus), GFP_KERNEL);
+		if (!cpus)
+			return -ENOMEM;
+		/*
+		 * generate CPU DAI name base on the sdw link ID and
+		 * cpu pin id according to sdw dai driver.
+		 */
+		for (k = 0; k < cpu_dai_num; k++) {
+			cpu_name = devm_kasprintf(dev, GFP_KERNEL,
+						  "SDW%d Pin%d", sdw_link_id, cpu_pin_id);
+			if (!cpu_name)
+				return -ENOMEM;
+
+			cpus[k].dai_name = cpu_name;
+		}
+
+		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
+		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
+		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name,
+				       playback, capture,
+				       cpus, cpu_dai_num,
+				       platform_component, ARRAY_SIZE(platform_component),
+				       codecs, codec_num,
+				       asoc_sdw_rtd_init, &sdw_ops);
+		/*
+		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
+		 * based on wait_for_completion(), tag them as 'nonatomic'.
+		 */
+		(*dai_links)->nonatomic = true;
+		(*dai_links)->ch_maps = sdw_codec_ch_maps;
+
+		ret = set_codec_init_func(card, adr_link, *dai_links,
+					  playback, group_id, adr_index, dai_index);
+		if (ret < 0) {
+			dev_err(dev, "failed to init codec 0x%x\n", codec_info->part_id);
+			return ret;
+		}
+
+		(*dai_links)++;
+	}
+	return 0;
+}
+
+static int create_dmic_dailinks(struct snd_soc_card *card,
+				struct snd_soc_dai_link **dai_links, int *be_id)
+{
+	struct device *dev = card->dev;
+	int ret;
+
+	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "acp-dmic-codec",
+					    0, 1, // DMIC only supports capture
+					    "acp-sof-dmic", platform_component->name,
+					    ARRAY_SIZE(platform_component),
+					    "dmic-codec", "dmic-hifi",
+					    asoc_sdw_dmic_init, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	return 0;
+}
+
+static int sof_card_dai_links_create(struct snd_soc_card *card)
+{
+	struct device *dev = card->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
+	int sdw_be_num = 0, dmic_num = 0;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
+	struct snd_soc_codec_conf *codec_conf;
+	int codec_conf_num = 0;
+	bool group_generated[AMD_SDW_MAX_GROUPS] = { };
+	struct snd_soc_dai_link *dai_links;
+	struct asoc_sdw_codec_info *codec_info;
+	int num_links;
+	int i, j, be_id = 0;
+	int ret;
+
+	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
+	if (ret < 0) {
+		dev_err(dev, "failed to get sdw link info %d\n", ret);
+		return ret;
+	}
+
+	/* enable dmic */
+	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num)
+		dmic_num = 1;
+
+	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
+
+	/* allocate BE dailinks */
+	num_links = sdw_be_num + dmic_num;
+	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
+	if (!dai_links)
+		return -ENOMEM;
+
+	/* allocate codec conf, will be populated when dailinks are created */
+	codec_conf = devm_kcalloc(dev, codec_conf_num, sizeof(*codec_conf),
+				  GFP_KERNEL);
+	if (!codec_conf)
+		return -ENOMEM;
+
+	card->dai_link = dai_links;
+	card->num_links = num_links;
+	card->codec_conf = codec_conf;
+	card->num_configs = codec_conf_num;
+
+	/* SDW */
+	if (!sdw_be_num)
+		goto DMIC;
+
+	for (; adr_link->num_adr; adr_link++) {
+		/*
+		 * If there are two or more different devices on the same sdw link, we have to
+		 * append the codec type to the dai link name to prevent duplicated dai link name.
+		 * The same type devices on the same sdw link will be in the same
+		 * snd_soc_acpi_adr_device array. They won't be described in different adr_links.
+		 */
+		for (i = 0; i < adr_link->num_adr; i++) {
+			/* find codec info to get dai_num */
+			codec_info = asoc_sdw_find_codec_info_part(adr_link->adr_d[i].adr);
+			if (!codec_info)
+				return -EINVAL;
+			if (codec_info->dai_num > 1) {
+				ctx->append_dai_type = true;
+				goto out;
+			}
+			for (j = 0; j < i; j++) {
+				if ((SDW_PART_ID(adr_link->adr_d[i].adr) !=
+				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
+				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
+				    SDW_MFG_ID(adr_link->adr_d[j].adr))) {
+					ctx->append_dai_type = true;
+					goto out;
+				}
+			}
+		}
+	}
+out:
+
+	/* generate DAI links by each sdw link */
+	for (adr_link = mach_params->links ; adr_link->num_adr; adr_link++) {
+		for (i = 0; i < adr_link->num_adr; i++) {
+			const struct snd_soc_acpi_endpoint *endpoint;
+
+			endpoint = adr_link->adr_d[i].endpoints;
+
+			/* this group has been generated */
+			if (endpoint->aggregated &&
+			    group_generated[endpoint->group_id])
+				continue;
+
+			/* find codec info to get dai_num */
+			codec_info = asoc_sdw_find_codec_info_part(adr_link->adr_d[i].adr);
+			if (!codec_info)
+				return -EINVAL;
+
+			for (j = 0; j < codec_info->dai_num ; j++) {
+				int current_be_id;
+
+				ret = create_sdw_dailink(card, &dai_links, adr_link,
+							 &codec_conf, &current_be_id,
+							 i, j);
+				if (ret < 0) {
+					dev_err(dev,
+						"failed to create dai link %d on 0x%x\n",
+						j, codec_info->part_id);
+					return ret;
+				}
+				/* Update the be_id to match the highest ID used for SDW link */
+				if (be_id < current_be_id)
+					be_id = current_be_id;
+			}
+
+			if (endpoint->aggregated)
+				group_generated[endpoint->group_id] = true;
+		}
+	}
+
+DMIC:
+	/* dmic */
+	if (dmic_num > 0) {
+		if (ctx->ignore_internal_dmic) {
+			dev_warn(dev, "Ignoring ACP DMIC\n");
+		} else {
+			be_id = SOC_SDW_DMIC_DAI_ID;
+			ret = create_dmic_dailinks(card, &dai_links, &be_id);
+			if (ret)
+				return ret;
+		}
+	}
+
+	WARN_ON(dai_links != card->dai_link + card->num_links);
+	return 0;
+}
+
+/* SoC card */
+static const char sdw_card_long_name[] = "AMD Soundwire SOF";
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
+	card->name = "amd-soundwire",
+	card->owner = THIS_MODULE,
+	card->late_probe = asoc_sdw_card_late_probe,
+
+	snd_soc_card_set_drvdata(card, ctx);
+
+	dmi_check_system(sof_sdw_quirk_table);
+
+	if (quirk_override != -1) {
+		dev_info(card->dev, "Overriding quirk 0x%lx => 0x%x\n",
+			 sof_sdw_quirk, quirk_override);
+		sof_sdw_quirk = quirk_override;
+	}
+
+	log_quirks(card->dev);
+
+	ctx->mc_quirk = sof_sdw_quirk;
+	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
+	for (i = 0; i < ctx->codec_info_list_count; i++)
+		codec_info_list[i].amp_num = 0;
+
+	ret = sof_card_dai_links_create(card);
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
+
+	card->long_name = sdw_card_long_name;
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
+	{ "amd_sof_sdw", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, mc_id_table);
+
+static struct platform_driver sof_sdw_driver = {
+	.driver = {
+		.name = "amd_sof_sdw",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = mc_probe,
+	.remove_new = mc_remove,
+	.id_table = mc_id_table,
+};
+
+module_platform_driver(sof_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC AMD SoundWire Generic Machine driver");
+MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:amd_sof_sdw");
+MODULE_IMPORT_NS(SND_SOC_SDW_UTILS);
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
new file mode 100644
index 000000000000..f1bd5a7afc8e
--- /dev/null
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *  Copyright (c) 2024 Advanced Micro Devices, Inc. All rights reserved
+ */
+
+/*
+ *  soc_amd_sdw_common.h - prototypes for common helpers
+ */
+
+#ifndef SOC_AMD_SDW_COMMON_H
+#define SOC_AMD_SDW_COMMON_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+#include <sound/soc.h>
+#include <sound/soc_sdw_utils.h>
+
+#define ACP63_SDW_MAX_CPU_DAIS		8
+#define ACP63_SDW_MAX_LINKS		2
+
+#define AMD_SDW_MAX_GROUPS		9
+#define ACP63_PCI_REV			0x63
+#define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
+#define ASOC_SDW_FOUR_SPK		BIT(4)
+#define ASOC_SDW_ACP_DMIC		BIT(5)
+
+#define AMD_SDW0	0
+#define AMD_SDW1	1
+#define ACP63_SW0_AUDIO0_TX	0
+#define ACP63_SW0_AUDIO1_TX	1
+#define ACP63_SW0_AUDIO2_TX	2
+
+#define ACP63_SW0_AUDIO0_RX	3
+#define ACP63_SW0_AUDIO1_RX	4
+#define ACP63_SW0_AUDIO2_RX	5
+
+#define ACP63_SW1_AUDIO0_TX	0
+#define ACP63_SW1_AUDIO0_RX	1
+
+struct amd_mc_ctx {
+	unsigned int acp_rev;
+	unsigned int max_sdw_links;
+};
+
+#endif
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C99445B2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 09:41:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BE7F343F;
	Thu,  1 Aug 2024 09:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BE7F343F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722498086;
	bh=pGvmqBUW3OmH5h1zfuCPKubfFRHxZaRwEtYaBWodBCY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JJ9LBMhkOwNb4fj+9fsvYjJL4hdKYn/Mq6699eUYWrMS/+Wc+S8YrhifEldCs4WwC
	 u3Hv5UIFqQV32Vg8OWDB2XoBYWX8sVsjFlbUw2rNekG1gwL7fP0BQp6lEEKlos4UCe
	 F07spAF3Eo2nzBuZD68S4aKYg/BzEXQ91GpLZ5T8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C0FBF805B1; Thu,  1 Aug 2024 09:40:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C94D1F805B0;
	Thu,  1 Aug 2024 09:40:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E308F802DB; Thu,  1 Aug 2024 08:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA0E6F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA0E6F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cecihoN1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX5reQ1uSOFcjTN/b6ZO7AXyojr/ZQoa5DJPMITHwUKIQXkM/sbz/BKDgadW5oR/a3xtn8oyh3aejnVLswQet4ZKZJ7n17pH43YzjFtv2gFPhL1ia8uJLj82fF0caxbojQV6RDgIiWRZdW1Exq1wsC68LYQrY/hRR/V/e9sU8XKh5nQ+DK4HlqDYJsoT8++4tpkUOKgrdIvBDqpqNHcL4HUxpxv8MfjOLiD4sZN0/VCRHTzLQMWczgQdAIVoDRiOU0SbcjRNZPm+5bTwcAvSaPYAxfRe5pPTmTLB3gR8YdJ9BA36kU/LWfeuxemmbWndIjThGdSk8hBnS0Yc4LwVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/2fLUxBp7tyZAIixcn0vslXHejd8+OfNGTCTx6ZR04=;
 b=lPFues+jp2kzQ3heMjfNkFD92blFi8LQh435LDWiIwF79t9qg2DnUXIwYv4VI0AC5aotKTn/jmwirEIZ4GECP8Gk2+uy52EYT5CupWZVdQ6D9HbrG6Y7gtLsFnyIzNWN3I/z6yOA00eQSL5i+IMsX3HCqbRyN/lZe+BgX3mGT0xU4t9sM+ITbJPPCJnPIMfJBEAWrP07jSaxyvh7fS6Q1vqXgO3dmriKd0scL5Jf6ulG56sX9uhRUnbhwXy/xM4fZBeXahoF3vbkIIQMyVknz+Kd3qJR56iJLQ04oPtnou5gI70MSckptPAC2vpRiOS3p+GajwuLbYMEG0rTztGnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/2fLUxBp7tyZAIixcn0vslXHejd8+OfNGTCTx6ZR04=;
 b=cecihoN1DfxDJ4nQTo8hNPbeWFBksC1zYTvvnGOKsbAwPa4yTqpZPecf3CrXFMRWb4L3oGfhBFxMH3imowVFsUpSMu2tOMF8z3vCWIjI/N8Mb/TEI/So6f0kpwPMnWLybbP7XPl7j5lv+b4p/bH3FPaB76W69TF0/azRE1iLMCg=
Received: from DM6PR08CA0028.namprd08.prod.outlook.com (2603:10b6:5:80::41) by
 IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 06:27:57 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::a4) by DM6PR08CA0028.outlook.office365.com
 (2603:10b6:5:80::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Thu, 1 Aug 2024 06:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:27:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:27:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:27:55 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:27:50 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Cezary
 Rojewski" <cezary.rojewski@intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Rander Wang
	<rander.wang@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Chao Song
	<chao.song@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>
Subject: [PATCH 07/31] ASoC: intel/sdw-utils: move soundwire machine driver
 soc ops
Date: Thu, 1 Aug 2024 11:53:52 +0530
Message-ID: <20240801062416.2203673-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: de616e7f-a676-4796-eac1-08dcb1f3158b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dHJQME3SJmPqQ5CaOYLXCN0P8qdL0uRr1j+xOM8pOAnABcVGG/Tih2xjGJFr?=
 =?us-ascii?Q?/Y4r6C5q8hBUC2WB7XLW/iuZ2IMZLNjZ/cTSMPzxvKk7l8sC7IbndCNMiN2p?=
 =?us-ascii?Q?M3cMYGxxJIynj0VqiFAPeehkteklpTfu2uCHElx2PnxvPL1FJHUG+x8zx4jm?=
 =?us-ascii?Q?BBXZElbZlGu/Plg9qOwJmT8BAmClwOBYsLg69sweiWJWdqX+MaPsNqAgkgKt?=
 =?us-ascii?Q?+mmXeC+7YfTuSxkXZTig+z8zSImsWXo2AqqZH361CTluZYHXuS6DeA8XRn4x?=
 =?us-ascii?Q?YjHhUVNbooF7uMLVzW5SFBw83T4OnW5BE7AiyibmRfnWTxFRWxUXdZrkrNjJ?=
 =?us-ascii?Q?kHavQmLxjWmIkjf7JlqvoAqyDIGqmeacRd3qUGeSyo/sCC65au8A06/n2JDz?=
 =?us-ascii?Q?yvn8/VnpFwiFpS/84f1rzIlEuQia05ioKGJbB0Q3ajcH9dE+mVzMpUwfBLpz?=
 =?us-ascii?Q?srDBEC+S45rs05dP208/8jU1fKJWeaMweUahLaSF0SgYfzUfKZTGTCkQjB7+?=
 =?us-ascii?Q?Hmo284trYLMxPOFFu5unlfYILDPIRJNIZxZ62LwGP02e1wQ5EvoxgKF4NjQM?=
 =?us-ascii?Q?HYmTfM9V5FbQV+uiy0wQni9ZDdgdxFl4Tu3WY3tCuyN99ZXUWA1LHuc4Z4o5?=
 =?us-ascii?Q?perRCGq9kVEdPu49BB/p/uE1MPROzn7A4jk0G0K/Ychy6pf1HZmo0TLVp7Za?=
 =?us-ascii?Q?Bjmt4JpCaYovjw3khi3wu6kvm+T0SZXq7I1v6beIhx6dAJZkgtMvEVeSiHNy?=
 =?us-ascii?Q?X/ueDVz9/8PcZuvL3pVGTbRQcLD/k9+jvkiDhd29ac2tnUXaE+Q3dPKbG801?=
 =?us-ascii?Q?HYhZ/nbA1YvtkuzNa4l0EjqCEWxCKnjR/J4SZ6rBu+oya3HIxtl8ctwaZSeH?=
 =?us-ascii?Q?GouvmCKU0FLQr0CvuqKhQnVKRajQMB6Ecw4+rucif34APUx3XqcziUVX1L7+?=
 =?us-ascii?Q?CIqgp+DxKrC3Cc/uTGZudq8IaEVdNcPRPAhUfu+GBTk2LTJTY0DglGsRDp4X?=
 =?us-ascii?Q?cxo4q9CD4jZLN+aQQqrIztEVUDKoMMq9Wm3dMU2Kvq+jJ25tPknR+11Tg+ze?=
 =?us-ascii?Q?ddpot6XFHKDdYW9mch1pVAijRGLzpIcBO+70NzOxIGKuizyjTPoVPgHNUXzy?=
 =?us-ascii?Q?rgNYohQ8n2Ofq0QIldCAzyts9dpRQ0XqMbGY8/8PJY1f6c0tLYx1pb2K3uJo?=
 =?us-ascii?Q?Is6Zl4S09F3+H8jvqMauO3iy+r0+0ehd+zvE310j/n+n6ME/S0ufEWcNm9dg?=
 =?us-ascii?Q?AQHHzXhOAVgTfubcWWWdy/07grlgs/+zb7whLra+SyEatrAaeOe08SneTn6L?=
 =?us-ascii?Q?D2YPXNta4nPAeAYu7vK3eOIFO4L969jhS9nCYKGpXLkdsdT7febdgWFqTHzK?=
 =?us-ascii?Q?WQ7Oa0SEIqGnlqE7pFAdpjd6lAFEpROju+zujEStefmvpNOj5w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:27:57.5334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de616e7f-a676-4796-eac1-08dcb1f3158b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087
Message-ID-Hash: L62WQAKSU62LB5FN3XYIU7PPRU5REXO4
X-Message-ID-Hash: L62WQAKSU62LB5FN3XYIU7PPRU5REXO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L62WQAKSU62LB5FN3XYIU7PPRU5REXO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move Intel SoundWire generic machine driver soc ops to common place
so that it can be used by other platform machine driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h           |  23 ++++
 sound/soc/Kconfig                       |   2 +
 sound/soc/Makefile                      |   1 +
 sound/soc/intel/boards/Kconfig          |   1 +
 sound/soc/intel/boards/sof_sdw.c        | 131 +--------------------
 sound/soc/intel/boards/sof_sdw_common.h |   9 +-
 sound/soc/sdw_utils/Kconfig             |   6 +
 sound/soc/sdw_utils/Makefile            |   3 +
 sound/soc/sdw_utils/soc_sdw_utils.c     | 150 ++++++++++++++++++++++++
 9 files changed, 188 insertions(+), 138 deletions(-)
 create mode 100644 include/sound/soc_sdw_utils.h
 create mode 100644 sound/soc/sdw_utils/Kconfig
 create mode 100644 sound/soc/sdw_utils/Makefile
 create mode 100644 sound/soc/sdw_utils/soc_sdw_utils.c

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
new file mode 100644
index 000000000000..cf4cdb66b2de
--- /dev/null
+++ b/include/sound/soc_sdw_utils.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This file incorporates work covered by the following copyright notice:
+ * Copyright (c) 2020 Intel Corporation
+ * Copyright(c) 2024 Advanced Micro Devices, Inc.
+ *
+ */
+
+#ifndef SOC_SDW_UTILS_H
+#define SOC_SDW_UTILS_H
+
+#include <sound/soc.h>
+
+int asoc_sdw_startup(struct snd_pcm_substream *substream);
+int asoc_sdw_prepare(struct snd_pcm_substream *substream);
+int asoc_sdw_prepare(struct snd_pcm_substream *substream);
+int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd);
+int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
+		       struct snd_pcm_hw_params *params);
+int asoc_sdw_hw_free(struct snd_pcm_substream *substream);
+void asoc_sdw_shutdown(struct snd_pcm_substream *substream);
+
+#endif
diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index a52afb423b46..e87bd15a8b43 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -126,6 +126,8 @@ source "sound/soc/xtensa/Kconfig"
 # Supported codecs
 source "sound/soc/codecs/Kconfig"
 
+source "sound/soc/sdw_utils/Kconfig"
+
 # generic frame-work
 source "sound/soc/generic/Kconfig"
 
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index fd61847dd1eb..775bb38c2ed4 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -75,3 +75,4 @@ obj-$(CONFIG_SND_SOC)	+= uniphier/
 obj-$(CONFIG_SND_SOC)	+= ux500/
 obj-$(CONFIG_SND_SOC)	+= xilinx/
 obj-$(CONFIG_SND_SOC)	+= xtensa/
+obj-$(CONFIG_SND_SOC)	+= sdw_utils/
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f1faa5dd2a4f..3d59d6982763 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -656,6 +656,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
+	select SND_SOC_SDW_UTILS
 	select SND_SOC_MAX98363
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98373_SDW
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 28021d33fd2d..fc73db4af186 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
-#include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include "sof_sdw_common.h"
 #include "../../codecs/rt711.h"
@@ -593,135 +592,6 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
-/* these wrappers are only needed to avoid typecast compilation errors */
-int asoc_sdw_startup(struct snd_pcm_substream *substream)
-{
-	return sdw_startup_stream(substream);
-}
-
-int asoc_sdw_prepare(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct sdw_stream_runtime *sdw_stream;
-	struct snd_soc_dai *dai;
-
-	/* Find stream from first CPU DAI */
-	dai = snd_soc_rtd_to_cpu(rtd, 0);
-
-	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
-	if (IS_ERR(sdw_stream)) {
-		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
-		return PTR_ERR(sdw_stream);
-	}
-
-	return sdw_prepare_stream(sdw_stream);
-}
-
-int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct sdw_stream_runtime *sdw_stream;
-	struct snd_soc_dai *dai;
-	int ret;
-
-	/* Find stream from first CPU DAI */
-	dai = snd_soc_rtd_to_cpu(rtd, 0);
-
-	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
-	if (IS_ERR(sdw_stream)) {
-		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
-		return PTR_ERR(sdw_stream);
-	}
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-	case SNDRV_PCM_TRIGGER_RESUME:
-		ret = sdw_enable_stream(sdw_stream);
-		break;
-
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
-		ret = sdw_disable_stream(sdw_stream);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	if (ret)
-		dev_err(rtd->dev, "%s trigger %d failed: %d\n", __func__, cmd, ret);
-
-	return ret;
-}
-
-int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
-		       struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai_link_ch_map *ch_maps;
-	int ch = params_channels(params);
-	unsigned int ch_mask;
-	int num_codecs;
-	int step;
-	int i;
-
-	if (!rtd->dai_link->ch_maps)
-		return 0;
-
-	/* Identical data will be sent to all codecs in playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ch_mask = GENMASK(ch - 1, 0);
-		step = 0;
-	} else {
-		num_codecs = rtd->dai_link->num_codecs;
-
-		if (ch < num_codecs || ch % num_codecs != 0) {
-			dev_err(rtd->dev, "Channels number %d is invalid when codec number = %d\n",
-				ch, num_codecs);
-			return -EINVAL;
-		}
-
-		ch_mask = GENMASK(ch / num_codecs - 1, 0);
-		step = hweight_long(ch_mask);
-
-	}
-
-	/*
-	 * The captured data will be combined from each cpu DAI if the dai
-	 * link has more than one codec DAIs. Set codec channel mask and
-	 * ASoC will set the corresponding channel numbers for each cpu dai.
-	 */
-	for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
-		ch_maps->ch_mask = ch_mask << (i * step);
-
-	return 0;
-}
-
-int asoc_sdw_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct sdw_stream_runtime *sdw_stream;
-	struct snd_soc_dai *dai;
-
-	/* Find stream from first CPU DAI */
-	dai = snd_soc_rtd_to_cpu(rtd, 0);
-
-	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
-	if (IS_ERR(sdw_stream)) {
-		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
-		return PTR_ERR(sdw_stream);
-	}
-
-	return sdw_deprepare_stream(sdw_stream);
-}
-
-void asoc_sdw_shutdown(struct snd_pcm_substream *substream)
-{
-	sdw_shutdown_stream(substream);
-}
-
 static const struct snd_soc_ops sdw_ops = {
 	.startup = asoc_sdw_startup,
 	.prepare = asoc_sdw_prepare,
@@ -2232,3 +2102,4 @@ MODULE_AUTHOR("Rander Wang <rander.wang@linux.intel.com>");
 MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_SDW_UTILS);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index c1b58180efe5..d97aedeef9e8 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/types.h>
 #include <sound/soc.h>
+#include <sound/soc_sdw_utils.h>
 #include "sof_hdmi_common.h"
 
 #define SOC_SDW_MAX_NO_PROPS 2
@@ -134,14 +135,6 @@ struct mc_private {
 
 extern unsigned long sof_sdw_quirk;
 
-int asoc_sdw_startup(struct snd_pcm_substream *substream);
-int asoc_sdw_prepare(struct snd_pcm_substream *substream);
-int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd);
-int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
-		       struct snd_pcm_hw_params *params);
-int asoc_sdw_hw_free(struct snd_pcm_substream *substream);
-void asoc_sdw_shutdown(struct snd_pcm_substream *substream);
-
 /* generic HDMI support */
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/sdw_utils/Kconfig b/sound/soc/sdw_utils/Kconfig
new file mode 100644
index 000000000000..d915083c3889
--- /dev/null
+++ b/sound/soc/sdw_utils/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config SND_SOC_SDW_UTILS
+	tristate
+	help
+	  This option enables to use SoundWire common helper functions and
+	  SoundWire codec helper functions in machine driver.
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
new file mode 100644
index 000000000000..29b2852be287
--- /dev/null
+++ b/sound/soc/sdw_utils/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+snd-soc-sdw-utils-y := soc_sdw_utils.o
+obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
new file mode 100644
index 000000000000..cccab173fd17
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2020 Intel Corporation
+// Copyright(c) 2024 Advanced Micro Devices, Inc.
+/*
+ *  soc-sdw-utils.c - common SoundWire machine driver helper functions
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc_sdw_utils.h>
+
+/* these wrappers are only needed to avoid typecast compilation errors */
+int asoc_sdw_startup(struct snd_pcm_substream *substream)
+{
+	return sdw_startup_stream(substream);
+}
+EXPORT_SYMBOL_NS(asoc_sdw_startup, SND_SOC_SDW_UTILS);
+
+int asoc_sdw_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_dai *dai;
+
+	/* Find stream from first CPU DAI */
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
+	if (IS_ERR(sdw_stream)) {
+		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
+		return PTR_ERR(sdw_stream);
+	}
+
+	return sdw_prepare_stream(sdw_stream);
+}
+EXPORT_SYMBOL_NS(asoc_sdw_prepare, SND_SOC_SDW_UTILS);
+
+int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_dai *dai;
+	int ret;
+
+	/* Find stream from first CPU DAI */
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
+	if (IS_ERR(sdw_stream)) {
+		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
+		return PTR_ERR(sdw_stream);
+	}
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = sdw_enable_stream(sdw_stream);
+		break;
+
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = sdw_disable_stream(sdw_stream);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret)
+		dev_err(rtd->dev, "%s trigger %d failed: %d\n", __func__, cmd, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_trigger, SND_SOC_SDW_UTILS);
+
+int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
+		       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link_ch_map *ch_maps;
+	int ch = params_channels(params);
+	unsigned int ch_mask;
+	int num_codecs;
+	int step;
+	int i;
+
+	if (!rtd->dai_link->ch_maps)
+		return 0;
+
+	/* Identical data will be sent to all codecs in playback */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ch_mask = GENMASK(ch - 1, 0);
+		step = 0;
+	} else {
+		num_codecs = rtd->dai_link->num_codecs;
+
+		if (ch < num_codecs || ch % num_codecs != 0) {
+			dev_err(rtd->dev, "Channels number %d is invalid when codec number = %d\n",
+				ch, num_codecs);
+			return -EINVAL;
+		}
+
+		ch_mask = GENMASK(ch / num_codecs - 1, 0);
+		step = hweight_long(ch_mask);
+	}
+
+	/*
+	 * The captured data will be combined from each cpu DAI if the dai
+	 * link has more than one codec DAIs. Set codec channel mask and
+	 * ASoC will set the corresponding channel numbers for each cpu dai.
+	 */
+	for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
+		ch_maps->ch_mask = ch_mask << (i * step);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_hw_params, SND_SOC_SDW_UTILS);
+
+int asoc_sdw_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_dai *dai;
+
+	/* Find stream from first CPU DAI */
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
+	if (IS_ERR(sdw_stream)) {
+		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
+		return PTR_ERR(sdw_stream);
+	}
+
+	return sdw_deprepare_stream(sdw_stream);
+}
+EXPORT_SYMBOL_NS(asoc_sdw_hw_free, SND_SOC_SDW_UTILS);
+
+void asoc_sdw_shutdown(struct snd_pcm_substream *substream)
+{
+	sdw_shutdown_stream(substream);
+}
+EXPORT_SYMBOL_NS(asoc_sdw_shutdown, SND_SOC_SDW_UTILS);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SoundWire ASoC helpers");
-- 
2.34.1


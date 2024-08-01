Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C3594487C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE2153A97;
	Thu,  1 Aug 2024 11:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE2153A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504748;
	bh=pGvmqBUW3OmH5h1zfuCPKubfFRHxZaRwEtYaBWodBCY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b3UIdJSQ4YHonvZDDdwZ+17e0/QlO+FUIlWssHDSaYRoQffvXKr1d38HLYcXm9J0q
	 4E/hl10FUsdV4m3Lt0dqlC/8wqPtYvgtUOM3ch5DT2PoDi0CkHCFrZewzsDYbQP2px
	 fyQ24xOJ8R/pkYozgj//oTwrzlyHZrysO7qKxk8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BD03F80694; Thu,  1 Aug 2024 11:30:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96472F8068E;
	Thu,  1 Aug 2024 11:30:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 436ACF802DB; Thu,  1 Aug 2024 11:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27368F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27368F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xCvY4WMd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfMFVUURzxOzMuybR1POsrlSjG3KDCNyGebfg2wRh2G54Hb2jbJUmSV6bKn4FZA7Sjb4nxkUslC8IwJ6enuBl3x5qMPDoqZOb0bXr/pekkaocYthii/jyHETKOo85ep2x62VzGVMoB9Q8saNVzbh08ZJKIE1rWVeuWlFhLY+FuDbyY50hO9Bk24uACskdXRLHQOUFRosMUMGbe4NFDnLIDd5yn7INq+UYjdQGAG0mJahdBJ8Jp0wUAC7LkFXhjHAFM4oypo/f09t4riPr8K0D+KRCTk+6IwU0CoEdclBPbrP4ApJBnNPLSxQk6ouxxYSVsUcoXUeSDQJeEi+XHG5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/2fLUxBp7tyZAIixcn0vslXHejd8+OfNGTCTx6ZR04=;
 b=gYL84bDH6JN+hGOG7yCbmJ4Jh0H/dRZsNFJ75JIRfWYgn3LqcdRjpaj1ipYaXFpjMGDippGdJuKseqaVRPhzxe5LQ9fXAzMM0zSOVdFTCznvC51m/eIf7KY0RTobBmMCnHS8ht0UJHQLQbvdOcuMJ32spQCXEKPZ3t5AxGKNlHgafvLmqmR++DNy2PiN9AcrLR0bI29ic6ph+XZgdDPPluWgmgRXZuA8ipu3E//tMP8WmzczCfkLBWRzJ/AVAd5ZdgdibI1Qkr1P8hqHU3xJmKSD1EQ+oeGrBjxXwXPC6+SIEQ1W6kM3HhEHx77uZVqh+b9XzGJpekF6RrGHd/ytmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/2fLUxBp7tyZAIixcn0vslXHejd8+OfNGTCTx6ZR04=;
 b=xCvY4WMdRaPsVZSy01qLuc8Mym0psaJaAI1Vrf0wY0MxlQsQMhGEpXFEQ43ux2fsDxpMRxe96bb9+SZfTOv00+L3mwBydgoWkeL4ridktSg47x0N6uNV5H/SEStWPb+3woz9tsS5NJbwOFd3pKs4bkQ9YZ32l7as6YEx7Zn3E90=
Received: from CH5P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::13)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 09:18:37 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::e9) by CH5P221CA0018.outlook.office365.com
 (2603:10b6:610:1f2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:18:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:18:35 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:18:29 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
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
Subject: [PATCH RESEND 07/31] ASoC: intel/sdw-utils: move soundwire machine
 driver soc ops
Date: Thu, 1 Aug 2024 14:44:22 +0530
Message-ID: <20240801091446.10457-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|SA1PR12MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 679743dd-f99f-4e26-4c64-08dcb20aec86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZjAKzBZJAN2r2Ze3NtO/tooYridBLjtVNMTF5GJHvCQ4CzJAUAXy5GkQZrvR?=
 =?us-ascii?Q?Y40IgZCkmxnlT1taixi9zNakKDPlxJjMC28GNi/koHVfkbgg/PnyefEMAamH?=
 =?us-ascii?Q?lhMB6bUNCp6aeERYIzbwwQMv6jxnamctFHH6LG64YhdhgxSF357rUFgQIhij?=
 =?us-ascii?Q?seBHt3Jt8wWaf2mX5VkIclQwc15tnYS/yhaaNx2SrvR5esizdDcQDaivZruY?=
 =?us-ascii?Q?Dw/6Hn1lW+MoFnzSzTKyLc9eQcnRdCp6fXvkA81TbeH1C1OHfKgqDmBM19c6?=
 =?us-ascii?Q?202b5L2RTtaFxZUfSHDI162y8jBL/VNttzHy/+rnIQwJ8u68zfv47/yhyXO9?=
 =?us-ascii?Q?BgMFaL7cUnj6bnsim0q3Z0xu4K/omNNMsXBYm5G45qgXkL01f9zX5yqFYvP9?=
 =?us-ascii?Q?XF/PF2CNa45iiA8czzxwbF8C6B5c6h9jOHLCspHKpcsgEuTtja1cWDvPJsTC?=
 =?us-ascii?Q?pc10BModhnh7RunGnmoLst3cV0srUYYvReqfYtUldtS7sxDfreLV55atANRR?=
 =?us-ascii?Q?/DOmIy/8FQDLbpuqBD7i7zYOzW+XqMQ2pk3C36nqxnEZwqkZ+drQxrrM6wcb?=
 =?us-ascii?Q?xik/vII0TNF+5zdvGYPmw4y7fRiu7FDPEkV5VQsdnogFhmQ0BnavelgR2SMp?=
 =?us-ascii?Q?j+X1/L2vIN2zh/mhuEKcryBLrQLt/1mI1+ndJXyUY395qnulCFaS1k2s/bpn?=
 =?us-ascii?Q?hSIvOS1tyEa4rdkjirXC43PxDSX19jyL9XsP+OUSC9c0SJyzLsEb+gcPaNd2?=
 =?us-ascii?Q?cH3fvOJcxGTTZONTMh9sEQ6gOOrUGEhZmlysEenzY5ONIrMvrsf9NTPgDDUV?=
 =?us-ascii?Q?9hlwNKu2VEDX3Snbyg2OCN3wjRGNRgQtwli4lAY8iqDS0ex3mMObOwnTGKNZ?=
 =?us-ascii?Q?rzQa25E5XdcleRO49+Hom951jlc+nxYDi0TG2AvVLV/NY+HqVtWskMNT51zR?=
 =?us-ascii?Q?7WNszd+FVk1Y3cMFVmcTGApirVBxoZn8YrA37q5zFc0yv0qrZSgCv3Bf/U/U?=
 =?us-ascii?Q?NhSc+ULLKdib0DhX6N8ICxLbdc4xzL+VTAbrkj0emX6HUTN6SF8uM6g82ANG?=
 =?us-ascii?Q?zjwM//WegW75YUt3HTqkeoeklBcTQ2aZRiUFbbHqyyNWbiWvyRtnoAD6bRSh?=
 =?us-ascii?Q?/LXRL4Lq9StOt9ze2nRnbABS1GUvxiJO72vI60fM7yefZFPKRgLktHlyK+JS?=
 =?us-ascii?Q?L/upwzK0jqkjWCngVHdt1kRFqWegD5m+q2QuYd/Zy64gxGv+niLoOJJSi+/w?=
 =?us-ascii?Q?DBDq32rB0xLLYPK4K49IOtusR7hVzVgodw7X0tBFVJ6op8RGrZE1pmh1eLxk?=
 =?us-ascii?Q?ocpYY4u4JBC83yeGem8FRSxxhw26bkMmym/3CdHCpF7mqjrpbVHWqMmOfKpV?=
 =?us-ascii?Q?B8/ihXTJJz28AiL06jvq1fioBJ21QQTgGVgWTQTmHzCC60JNig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:18:36.6471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 679743dd-f99f-4e26-4c64-08dcb20aec86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948
Message-ID-Hash: F3V2BBXSWNLJUHPQ2RO2QZLKSXHH26II
X-Message-ID-Hash: F3V2BBXSWNLJUHPQ2RO2QZLKSXHH26II
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3V2BBXSWNLJUHPQ2RO2QZLKSXHH26II/>
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


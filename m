Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F18049446DC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:44:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 000623504;
	Thu,  1 Aug 2024 10:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 000623504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501841;
	bh=S2ST/oiY44ugBEXzrBU0fyAlgGAV1t9LSEzykBOMz4c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ibA0OT69H81U9aaJrWQTGT0E1O6RCAS23i47nUoanyTI8kmDH6f+dpLEDuNfvsdSH
	 MtWJvYc2QrcyJrpRjzDni1g1946yv9873muNgOrily7bBycKRSS9enb6rvNs+3Akak
	 4MJlDaCr1FuNb//oMA4B7YoSByAQFZMM1I5XKxy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF5C3F805E9; Thu,  1 Aug 2024 10:43:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD4DF805C6;
	Thu,  1 Aug 2024 10:43:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09E45F8026A; Thu,  1 Aug 2024 08:29:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54753F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54753F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=whMjaqNE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hL8gxgA3y6MX/jlhni/bxlNUf2PLSfOqcWehrK2O8nCQH6+jLaLez4crWGZBYDi14IbNLHDpdGFgtd0aWVflisfBD3vfcGb8fZN6udeJpPMPFcmiXTdtSWV8xaO18rpYGry9Q02U7g2L/MBnfUiQhNfxTxDlMERTT2PGPV5+l1yXV/JXWDUG3c+T0vcbVW3BG3OzsU6Dwmh84+dqnBJkQa+2NYLOGlbePIRN/R0Cq9J+Olwv1BI3Kuxf3AgVvjwx1riJSNrm21zrVJeCmsYN9iRQpMv02+r1TrY9KktVBctZ/vTbYZJvubOzHxl9uffm5SYL+IpyEVsUk+FEnqeGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1hnEfkIC+ghzF+oVLNepXM9R2KLwrnFBZkn4np8uO0=;
 b=YCG9o/Mru/dXBXa4XSGGb8GoJubp7O6OOHG/eNXfBd/O/e5WrwFTYLdE5gX2eyLzsfOoU8KB3tSG1tuoXWLcfqm1KqLiuVsUqRHoWGzaB4NXMyFlw7tjZw6zYy2zAFNnxbizMdTlB6SzX6VgRbhc1DHiN/p6wBcF/xc3NX63dpJ0D1IaJKLredlxbHZL+68Tw2f07+6U1D+S4/JdDIzoyX4Pb7VwkH0jpvSz1x6kNbeQS/iqFcWS087qAV0V6uDMilTLiRCG0WB3vFXCk5Iam7KBY/TYM5syE34JMr1I5RlHSsggYm61YReFSU7nX2tYIOY9PNqMIcYPmGnn/rrJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1hnEfkIC+ghzF+oVLNepXM9R2KLwrnFBZkn4np8uO0=;
 b=whMjaqNEg836Pi+MBMTfoZGGjBTKTlP4nhQ37iWPukTbwA5MPzvyOeIRRzS4T7fJ5jpPXUQT2ci03GfxaDDM/HgegHh7XGr9z0APGh6XMYvoWS2pGqJzIA7LQ/NWi73RFzOpAfmo1Fjl3OU7plXK9m0brHlAMCur5Vo15YmBeUs=
Received: from BY3PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:39a::25)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:29:37 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::c7) by BY3PR03CA0020.outlook.office365.com
 (2603:10b6:a03:39a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 06:29:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:29:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:29:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:29:35 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:29:28 -0500
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
	<kai.vehmanen@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Chao Song <chao.song@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 12/31] ASoC: intel/sdw_utils: move rt712 sdca helper functions
Date: Thu, 1 Aug 2024 11:53:57 +0530
Message-ID: <20240801062416.2203673-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ0PR12MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7257f9-04ee-4b5e-7a1e-08dcb1f350ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DwdC90z2KccsoC0qzDsbc6NimKCCn+vgJVgAEn4rjGcKusPb1JwsovmnnzNQ?=
 =?us-ascii?Q?F+CvV574uUVDe+kPJna012/qrU0Yek1f/HD2vONOIaci1pxWA8yagYT9FsZK?=
 =?us-ascii?Q?tWEArq9F4txc6FnXGyxortXn9rHQWaXhBzCMB3UjRiMNfSJAcKAWIniKOD83?=
 =?us-ascii?Q?vQ5J/V9wgg8dSmwe2BJ3IFVSJrHglielegyI1+jvSIHdSuqVGE64/LHkmy7y?=
 =?us-ascii?Q?+L7wDpHdM5gsFnqNufhJGMuW5vjl40XS0/CzOlZhnPqWjAYczzESLzNeGKY1?=
 =?us-ascii?Q?UQKlHk7AYjyiZWU4u/Zok0xbxbxyh3THt1lpGaouePEGCmeZP65at0ZLmO/B?=
 =?us-ascii?Q?9/jo1wTvKsYUXiUViWuQY8/jfPeqf2liXEfdii2Ua6q40cwAISws8E4FCeIR?=
 =?us-ascii?Q?bcJlPTHqAM+sFT9jJ4tSY9HPUIhG+6OpJNBu7MR/cPtrtiCd2GgKG4n+2uCM?=
 =?us-ascii?Q?607ufNhvOuDxiuS36FDb3Rt3vfhZdQwGFXfHjhsWo3yHoBQ/fU5bfJYsEaMj?=
 =?us-ascii?Q?CtjaJlWKx8kC5m40KjUcTJfiDOxt8jHoXgBlPg+z1sFMKGd/XmOvkpzJMwkz?=
 =?us-ascii?Q?CPHTXCPp3mKRQDm0HbkcGpiDaZ/PpzmyTZHrKonutaKGbvT7xofBVbpM369G?=
 =?us-ascii?Q?sS40D1nzIs7yqwdYAtHge1ISb3R8ENZmqn8d302LF5ueTYu6GWp+Y9bJ0DjB?=
 =?us-ascii?Q?s8dJbYEMhgnRffQRKduFug3kd7f+3d0DKIEyJrj+4Xvqk00dZmjAeZqk1uuD?=
 =?us-ascii?Q?GN4fol4m1yqu84PW+yi6gE/HHoddWlV3ZVb0z5ZKTtooBrVD7C4amiJdUR4g?=
 =?us-ascii?Q?3R4Mc8+gxUfZUCLcD7t8A7rRjR1LgTsPEn961OCdi57I32TlS1cOYtyIU8pA?=
 =?us-ascii?Q?bel1LwKj7fp/NdN38YXDpTFFz4GHK+STgTHY2WUKecdiIiQmI0XBDMKpsEuI?=
 =?us-ascii?Q?YhNF93kCyKp9ATYssvYpmcT2puIxQMm3KrpB+eiqJNGs0xlevAnY6tYaC+XB?=
 =?us-ascii?Q?djGmeefce8t7JM3avyqmJfMwWeA1CjDoqCZCIVsC5Ka1y7IA/I1KIh6yYQTH?=
 =?us-ascii?Q?WNvAmSouiTIU8PJSfURW4hQ9vCx7xER7cavzUqZ6fEbuqiqk7vVRFtnzgfhO?=
 =?us-ascii?Q?6ZoHlJOt9FcxYz7TPxZ24V/3fAlVRrc+qKvVYYfMQyZYHv7w8qS+3TRhf6Uw?=
 =?us-ascii?Q?/qEljpCyprcJPjJy416IDZwa428ESvLNzYZNYpfoIvWtwiwubiH5KTYbe+qW?=
 =?us-ascii?Q?64JzxsLULLP/q2boglpWYShGV4IHM1GxBFnOlXvARnO7cBblZ30DbiJYqeET?=
 =?us-ascii?Q?/AzUzdkxBMlxCH+bSgWFl6RWkgQRKOtHp0EQ1UELF7PZkXizs3auqQ84rM7C?=
 =?us-ascii?Q?MwYz4CYPkmX+SgC/zsZ3gVrBbagv2WCUqPtkaVlYyGlcd+epGA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:29:37.1402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e7257f9-04ee-4b5e-7a1e-08dcb1f350ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806
Message-ID-Hash: T5ZPORMFXJ7SXCQ4JMAXSJ7SLVSGVBSX
X-Message-ID-Hash: T5ZPORMFXJ7SXCQ4JMAXSJ7SLVSGVBSX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5ZPORMFXJ7SXCQ4JMAXSJ7SLVSGVBSX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move RT712 SDCA codec helper file to sdw_utils folder so that these
helper functions can be used by other platform machine drivers.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                             | 1 +
 sound/soc/intel/boards/Makefile                           | 2 +-
 sound/soc/intel/boards/sof_sdw_common.h                   | 1 -
 sound/soc/sdw_utils/Makefile                              | 3 ++-
 .../soc_sdw_rt712_sdca.c}                                 | 8 +++++---
 5 files changed, 9 insertions(+), 6 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_rt712_sdca.c => sdw_utils/soc_sdw_rt712_sdca.c} (80%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 9fa102fc03c3..6fd305253e2a 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -74,5 +74,6 @@ int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
 /* dai_link init callbacks */
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index dca8eecfa820..3bc9d25fc9bb 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -39,7 +39,7 @@ snd-soc-sof-sdw-y += sof_sdw.o				\
 			bridge_cs35l56.o			\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
-			sof_sdw_rt712_sdca.o sof_sdw_rt722_sdca.o	\
+			sof_sdw_rt722_sdca.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 73227ebf8e7b..b190aae1e093 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -160,7 +160,6 @@ int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index 2c8f70465a12..f9a2baa49617 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o
+snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
+		       soc_sdw_rt712_sdca.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/sdw_utils/soc_sdw_rt712_sdca.c
similarity index 80%
rename from sound/soc/intel/boards/sof_sdw_rt712_sdca.c
rename to sound/soc/sdw_utils/soc_sdw_rt712_sdca.c
index bb09d1ddafd2..5127210b9a03 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt712_sdca.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2023 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_rt712_sdca - Helpers to handle RT712-SDCA from generic machine driver
+ *  soc_sdw_rt712_sdca - Helpers to handle RT712-SDCA from generic machine driver
  */
 
 #include <linux/device.h>
@@ -13,7 +15,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 /*
  * dapm routes for rt712 spk will be registered dynamically according
@@ -43,4 +45,4 @@ int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 
 	return ret;
 }
-
+EXPORT_SYMBOL_NS(asoc_sdw_rt712_spk_rtd_init, SND_SOC_SDW_UTILS);
-- 
2.34.1


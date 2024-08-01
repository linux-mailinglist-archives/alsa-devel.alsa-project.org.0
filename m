Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D939944891
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E97BB3C7E;
	Thu,  1 Aug 2024 11:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E97BB3C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504945;
	bh=Yzz8WOg43WeIoUjtkJVapYM27Be74R5TXQtiY0PKNKk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EMVr7fDRft180yY0UMm139PExnTPBvpgrlR9sp8TepoV3DxurDPjWsH/RxDJCxVTH
	 EZCgniLCbM0WSKz7ylEiwQeKf66WlsU4p44r2YNH0saC6pDkYaMFybKB4v6zEXMprN
	 QodUsJIgsdR11yxSE25XkObicJg+PvtA1OtLNNJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 360ECF8019B; Thu,  1 Aug 2024 11:34:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DE5F802DB;
	Thu,  1 Aug 2024 11:34:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFF96F8026A; Thu,  1 Aug 2024 11:21:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 98CADF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98CADF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lV8Ztiwt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaPgqe+sUDsduTJl/lEP6BjL9nJzzHFL9GeQpuvDKSk6aRoRbUMelx4PzUyiW+RSz5L1h5Bp+X5p15V7qUcMYx3WjE0kRiOaqtPkyezuVma8vvQywpuWpWHA6iogSnMt73CpkFqid1MGZd4GBgYxlc5jKjUcAgynHjwHPrVhS2GUuQBqSSsg9fQ7zN3bHDY8zkP4mCaokUYMvu71zpsxyKWwEeoeTBQ9pcT9b7Na/2He81CLjmu3upMWJMNOgBQTwDXGN8x8KihahFuN5ql901fr0ZGdKXYe/BY8x41IMIg4aHIboOR3PY5A6/XEk5Z7lq2a2adOfbjD1WQDEzZK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6mKQYLX0Q5OVdsXYYGk5DZZpfqfgmCoNaifWSLyRIk=;
 b=jqNgv5M+2Yk/C53vUiEp7Ij+M8ouRxH/uayfTkN2uethvLJIVnzWA+pCBGf93y1O2B52mGOG6RWJLHqW4PpTnEmSyoBS/vy5LMURxLy5AyIgkzNwLf2xZSgvjDRDgL4NVkYHY7Bedekpib7r4u1T0+mN7VHv6El6F1EXdd9WN2OTPALz2L94ldGfs0BI5ChHsAYi4uCbc548muUikAImNeJaxPDyT0bCq45+5extcn2SYxJtT4FaareWAMc6qmgPG1lViTOWSVPiWBOsaM4usMZMfogRKZ0/4J46jeLlbADsr90geFyW70Jtu2j8zUtBKNBjy7zXxkRKrinQ70yP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6mKQYLX0Q5OVdsXYYGk5DZZpfqfgmCoNaifWSLyRIk=;
 b=lV8ZtiwtiaMn5LDJ0Un68NeY8/sOSklz6HcM9cC5hZF+HzeL8RhsPavOdW5edC5XDjAb1DkgCVL8f7EB93+kVmTuqpRNn1ETllD34XvWTIvVR3aCygvKWioZ1Jn9padJ/83qcEdz4iba2a08/ZZWEC5KUW7DVF6fnepvHcsx5wk=
Received: from MN2PR05CA0014.namprd05.prod.outlook.com (2603:10b6:208:c0::27)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:21:52 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:c0:cafe::97) by MN2PR05CA0014.outlook.office365.com
 (2603:10b6:208:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 09:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:21:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:21:51 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:21:44 -0500
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
	<kai.vehmanen@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Chao Song <chao.song@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 15/31] ASoC: intel/sdw_utils: move rt5682 codec helper
 function
Date: Thu, 1 Aug 2024 14:44:30 +0530
Message-ID: <20240801091446.10457-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d8c33a-dcfb-4031-bc07-08dcb20b60fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FTylGS+XhOummUlTgVdfrcdV2P6ywhwoSM+iiu+qk/5+9Gj6YTG++XbKewm7?=
 =?us-ascii?Q?uI5SDBh4IJ+ZJqPd0QK5Jzl3VIYfEToNlPk8o/2C+GLg6bE0d31aClidseWz?=
 =?us-ascii?Q?7tS+BzyXokk1f1v6+Km8o5XKJnQ6N7rnnStn83SoZDauSUGSs41zTj+6pR8r?=
 =?us-ascii?Q?0VFmtAtHYIn0PvxjEcqCZ+OXf+SCPpNhJeLcAj42b+YzOzEC/lJy+v2HKBEA?=
 =?us-ascii?Q?5u5MMoyPYSCiaa4z4sRFWqpVjO7YjNnBUD1NRkkXt8gjNmDN/5tTyPvR8n7g?=
 =?us-ascii?Q?48LX7wnsrMmCz9k3xcWj8UjarGCY2a9LgxIfwA9lZh4tUvSV0lSXmfYXuw7X?=
 =?us-ascii?Q?DVGKEgpKxB7LFn0HgpNmosSGToyGHh0P9MCP+I6Qd38djg0ansO23mBYxfk8?=
 =?us-ascii?Q?NtYS8OirTR6VEifh4QejOliRCsEi587orvgft6MQFwpJvzf7mdq55REdlKZg?=
 =?us-ascii?Q?tQf1MQTQdOAVm0Aq/aWID6yeHOojNkhTlS0Yemsp2zwHoij1L0oJHcjLshNW?=
 =?us-ascii?Q?BYqwlQPeT/xAvyiMycR5Yz2VeeYUuhUSl8ip1v5A/BZtovzDQSE2Vv44Q7Ha?=
 =?us-ascii?Q?OyhQbHg2qMs78ZIo1LNFWLTDyR/XS7znUU8PKq/G51GzLdiMRquJ7GrnqFg2?=
 =?us-ascii?Q?3dy48J57CMa62jyyV7H748DH1/eweiiTk/lIIy4TPni2NCjSQ5NrTVLrlEyi?=
 =?us-ascii?Q?3pvxSBRrP7dCESz0f1LCpEBXon80p2MXySy7tpzgwiPJpsfE3IwRxlm04yjs?=
 =?us-ascii?Q?jHIIH5CdMZMFbAOLgi8Eti51Vz2Q+YRkWXapsUvVyx+IPUF7u8JppLo+WTFY?=
 =?us-ascii?Q?oT25DI8Fa5bZoJ8EviaUmEb+UtVzzsR2wEPsj0NOEATLHVry5j9XPQY4lXEr?=
 =?us-ascii?Q?pJrwdiVz3qMu3xU+6P+HzpKX3JQCIoZB9FZBtwdRE5HalHZtncGrlrs5Z7xM?=
 =?us-ascii?Q?nrUfwzVJMAAX1j1FHEZY3BrWgt1fWSZfAof92Kdp4bvlX6pB+xI6PZD902+3?=
 =?us-ascii?Q?4GJzlf5SuNnHTKjF5RCKey3tNq4Qw4D7Kh0O0PUzmw4GfWkAZ5k/jBkv8MLm?=
 =?us-ascii?Q?9dA0wglGO86MXnLEOSSdu2usoysrD9l1hXO+BRf7NsirL458shVwNFMy5fcO?=
 =?us-ascii?Q?NOLGSZ+8aO+eiyvmRr1cvYN4cSgPrwf3bPTf8LBL08GFdVdPnCY3D8Wrx5E9?=
 =?us-ascii?Q?rg2dwQsPRNBjQQ53AAXJAdptVnFrcwwwVSpp9BETjqVL4E2lE2AxywvrKmJY?=
 =?us-ascii?Q?EwuOBHB8AXnEhQeTvNrqZL2n96VHHWOr4FQCuZOAL8jAzonM9039I2rFzNS2?=
 =?us-ascii?Q?U6GXc4j0Q7v4KQ368LG5Y//Z4/23iHtYGNZdXBpvenKsHid++6rsDhiMO9Zy?=
 =?us-ascii?Q?qap96RVE8TWwAyirS+/BNOLPuU+l?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:21:52.0481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a7d8c33a-dcfb-4031-bc07-08dcb20b60fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
Message-ID-Hash: WTJ5UPP4B5PVOML7DZRSNUU4YNWPFFRO
X-Message-ID-Hash: WTJ5UPP4B5PVOML7DZRSNUU4YNWPFFRO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTJ5UPP4B5PVOML7DZRSNUU4YNWPFFRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move rt5682 sdw codec helper function to common place holder to make it
generic.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                             | 1 +
 sound/soc/intel/boards/Makefile                           | 4 ++--
 sound/soc/intel/boards/sof_sdw_common.h                   | 1 -
 sound/soc/sdw_utils/Makefile                              | 3 ++-
 .../sof_sdw_rt5682.c => sdw_utils/soc_sdw_rt5682.c}       | 8 +++++---
 5 files changed, 10 insertions(+), 7 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_rt5682.c => sdw_utils/soc_sdw_rt5682.c} (88%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index eb713cdf4079..ed97d78336da 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -86,5 +86,6 @@ int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index f3baf9ecfbb7..80c33e4b4cfe 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -37,8 +37,8 @@ snd-soc-sof-ssp-amp-y := sof_ssp_amp.o
 snd-soc-sof-sdw-y += sof_sdw.o				\
 			sof_sdw_maxim.o sof_sdw_rt_amp.o	\
 			bridge_cs35l56.o			\
-			sof_sdw_rt5682.o sof_sdw_rt700.o	\
-			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
+			sof_sdw_rt700.o sof_sdw_rt711.o		\
+			sof_sdw_rt_sdca_jack_common.o		\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 7954472c11bb..bbd09698c69d 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -151,7 +151,6 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index 261c60098e88..fea2b6ae6975 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
-		       soc_sdw_rt712_sdca.o soc_sdw_rt722_sdca.o
+		       soc_sdw_rt712_sdca.o soc_sdw_rt722_sdca.o	\
+		       soc_sdw_rt5682.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/sdw_utils/soc_sdw_rt5682.c
similarity index 88%
rename from sound/soc/intel/boards/sof_sdw_rt5682.c
rename to sound/soc/sdw_utils/soc_sdw_rt5682.c
index 7e52720e0195..80b4caa92667 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt5682.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2020 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_rt5682 - Helpers to handle RT5682 from generic machine driver
+ *  soc_sdw_rt5682 - Helpers to handle RT5682 from generic machine driver
  */
 
 #include <linux/device.h>
@@ -15,7 +17,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 static const struct snd_soc_dapm_route rt5682_map[] = {
 	/*Headphones*/
@@ -86,4 +88,4 @@ int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 	return ret;
 }
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt5682_rtd_init, SND_SOC_SDW_UTILS);
-- 
2.34.1


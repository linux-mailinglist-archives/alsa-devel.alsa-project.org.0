Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74546944893
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15F8D3C5D;
	Thu,  1 Aug 2024 11:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15F8D3C5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504971;
	bh=ouY1nxnfjw9PexoiCybB7uIlzM1I8yJ48mTNr9sxP/s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vgQHxjIlXuk8nJj0Jmg6JtsZ8nJTUw/0qnK6+1uSjNDIAHXHxZhYM4ycfIr+Wzfa8
	 PoQcH9HIDASauvZjnSozGjo5p//Xp1FJacvVDYzT1J4Ihc+RvOv3d3On4dhH0UiE1g
	 UWDHU7WDfnIojZYImzvq/yDwNeWbEplYdWr9lOng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A39E1F8007E; Thu,  1 Aug 2024 11:35:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDB0F800E3;
	Thu,  1 Aug 2024 11:35:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D469DF8026A; Thu,  1 Aug 2024 11:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6D83F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6D83F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=m4zcQ1k8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lkxo0Pu0XwTXfzAQhCFp6D3+LGCj8dp9g2WVULC4QgdwXROe90Li4fWPenweOQIWQbJy1JczqEyb62rksz/Lt+NHVbEBKwPBvXNAOKXnW2LgIAq7SgTx9gm7vQDi/09hPMjsZ8vlq+MF4Z5+jpSpTd1dJBYlWBjzZ8JlCEnpIQx0/i0Sn3s9xSZ76CqCQtETz+vMYDrjFRDWtQ4XZ2KEcD+uPvQjhZh4TsRafPHaUwqXbJVjhNaHtvrOaoy8GRp/xr857hQtc1F+iAWAFZPhFe9xtcccz3ssZBWRTPcZHUZpYsZX++l2OazwzGFRlYBFqixWHTSYLAYlJ8dKzNOf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1oVuq3hwPFTWMdqa0cdEAyN9Tqh9cP8L5UQI44VQus=;
 b=ZVnwj10Gs2aHJ3OpYxhx88VYbYoAFu50Qol++bkhWOW3moSn/BpVMvXOe4Dp8wA9bbBbtzJ16CrXaSPLPMno0uCDpKNSsn8yuokKwkOWmFDLiHqWORqrZPDRAfyQ8jxZLMgNvEwIL1qPCzz5onGR8exiA2Ywd+Yk4i+kIdsMYAUybQPMPv6hz2W5JF2ubhw8jmm+Z2ywvnioqoV2Ag+qNYhZkzsrweSRYAyDpf1LNqYa6fdNBW+vZEYs4tgWVrrxrCCSaYDbhL8l0xZf3N+5t+Z93WyMLdGH1Q/NelPlSGhyimma2ATBTdtMswQlLlj+g4XGRSCmZmHmUNJSIMefBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1oVuq3hwPFTWMdqa0cdEAyN9Tqh9cP8L5UQI44VQus=;
 b=m4zcQ1k82VNDUitBAXXzMZU7ZrCYXuhCyC6xMVhz4TiE4iz46zN4p5+ZPx7+ViTANKUlgW/hk7F4DT3gcgu+0BANB4QxmmEIEkH0N4XYhdrVf6USYXAokp9gx/csZM9Pc//gdjGuOix0XM4ywbraxxrggFq0tYMadgAwsYDuAWg=
Received: from BLAPR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:36e::16)
 by SA3PR12MB9160.namprd12.prod.outlook.com (2603:10b6:806:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 09:22:54 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::74) by BLAPR05CA0009.outlook.office365.com
 (2603:10b6:208:36e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 09:22:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:22:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:22:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:22:52 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:22:47 -0500
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
Subject: [PATCH RESEND 17/31] ASoC: intel/sdw_utils: move rt700 and rt711
 codec helper functions
Date: Thu, 1 Aug 2024 14:44:32 +0530
Message-ID: <20240801091446.10457-18-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|SA3PR12MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: 468fefcf-72a9-4e76-a75a-08dcb20b85ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7E6h8Ao9baRCZbdcbWwyT+dMSxbt4a+VBibIvoIbyIO82qkLvtziOnW98AQ0?=
 =?us-ascii?Q?du62dDqMLdvVG/1yd9XXpREIt5nAuIrf7Ej1JHJQPFeZi/XAw7bUWelXHrLr?=
 =?us-ascii?Q?z+E1VkHjHfDAeBH8SiMxhBQnHwZ8VNLBZVY4A05fqOGq7lxfEMJ/vl2mWAaW?=
 =?us-ascii?Q?7oFmvac9+Sg+kjeSXppaOcMamW8PYRVO1p2+Pz+eNvxtq00MgIMspJ09A1EA?=
 =?us-ascii?Q?2FfFcene/lEEUJhQXatzvNfkBI+kOdvinl9C8E2+4eATSXK5La6luNY/Jhmq?=
 =?us-ascii?Q?X3rqBurlrMcUBIWlxxVDRcl0c7k3kFIPhsbb/II3X/Bvt35r7JwWwzoXrrzQ?=
 =?us-ascii?Q?2OCcdjwabCr+tM9mGIrmgCKtSu1CAuOR4/9D1qkgkso4d31ANw3zwYWf82K3?=
 =?us-ascii?Q?8sq45uwsKb6qyvgj1/2i7JkbfMnrqxdsbRwAEtCBj8DNeRAxuOQLnnpXRDdo?=
 =?us-ascii?Q?sAj8teaq0XSV6uYBFgp96JZHHa5hiC46ViEsbuG4uQTUVeOMzodJVqsUBsm8?=
 =?us-ascii?Q?En3epmP8r8Ajz3GkkHu/llq3iRjld2kFV0ghrGNLiJM11FZoMAcjBjkZzHts?=
 =?us-ascii?Q?MbP6XpgXh1uJizP8qkGaORRRjXwBx3tMZs11pYdVvSZzhWvwQwXMgXyB0Pjw?=
 =?us-ascii?Q?VhYIKXUCZAxWuwNEEIwPZx7d4QaRQ7eK0BB4UhjLYVfGDmtVDxWWk1cFgas+?=
 =?us-ascii?Q?Qm/M8z+9U5KmE8DZ6AEBArPdF/cjsk/NYLpBeWuM7ExkGDkOYOh9XSQMfONN?=
 =?us-ascii?Q?5fmGKXMx4y++pvH5mCYtmJeu+OOWVsrvBZmPRwJwGCW5KpyAKSaTQy/xDiKZ?=
 =?us-ascii?Q?9dEP+u9B4dTO7ZjU5NZJiQQdTbHz6Xq6bZsh5Jn4VAyJ5qxmjhoMjMArmRez?=
 =?us-ascii?Q?01Et6VVwPsjADogSCUHCjF2ssJXH96rT0mT3woILAlxperTLE84/jZ1AAT7a?=
 =?us-ascii?Q?x4QdTbn34ppetH8HwvzNCojIQGAb5kdbm4B9MkXJO9/k62Mv2F1fMshvht3l?=
 =?us-ascii?Q?Ldwn5hS+/rT2acWrSoEZXlWXIrjxsKdtdZT4HcT+Cdd9Mp2fA7GRrvqUlfwC?=
 =?us-ascii?Q?15FRixZyGNS9UnU0e0iLyj79SqbnZ+ei1WF6LDL2GOJYKYyW8N16pngjzxMt?=
 =?us-ascii?Q?KuQVCCF2leLS1K6FSkuHVVf3jVTAiAJQ3IKeFUQaAvzkKZE55Su7VYB/wHkl?=
 =?us-ascii?Q?bp0aj6ldhQXtXA1QNh3kNdY53ZCJZVILIe4S8CEx6YHqe3SHV3XrWs2n/gzy?=
 =?us-ascii?Q?RLqpmWT+feYyKWkoiCMJm9QcVxTjPqPgdtWSb6PZMkGPlz7VEfFGE1s8zUs6?=
 =?us-ascii?Q?2ztQucLYktf8jtUVTvOQL5SwRCrj/BjooAf2cDqbMLQI8wJaMhZW2nwrl1Xa?=
 =?us-ascii?Q?yGlWa+e4zfMOcttKKx7BnjuWEm4w?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:22:54.0471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 468fefcf-72a9-4e76-a75a-08dcb20b85ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9160
Message-ID-Hash: RCQDTAPUIAUPWPOYRTCMXTJYZQTZD6KT
X-Message-ID-Hash: RCQDTAPUIAUPWPOYRTCMXTJYZQTZD6KT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCQDTAPUIAUPWPOYRTCMXTJYZQTZD6KT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move RT700 and RT711 Soundwire codec helper functions to common
place holder so that it can be used by other platform machine driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                  |  9 +++++++++
 sound/soc/intel/boards/Makefile                |  1 -
 sound/soc/intel/boards/sof_sdw_common.h        |  9 ---------
 sound/soc/sdw_utils/Makefile                   |  1 +
 .../soc_sdw_rt700.c}                           |  8 +++++---
 .../soc_sdw_rt711.c}                           | 18 +++++++++++-------
 6 files changed, 26 insertions(+), 20 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_rt700.c => sdw_utils/soc_sdw_rt700.c} (88%)
 rename sound/soc/{intel/boards/sof_sdw_rt711.c => sdw_utils/soc_sdw_rt711.c} (85%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 6b6bab8d3310..3e55cac33176 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -85,6 +85,13 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 /* DMIC support */
 int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
+/* RT711 support */
+int asoc_sdw_rt711_init(struct snd_soc_card *card,
+			struct snd_soc_dai_link *dai_links,
+			struct asoc_sdw_codec_info *info,
+			bool playback);
+int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+
 /* RT711-SDCA support */
 int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			       struct snd_soc_dai_link *dai_links,
@@ -95,6 +102,8 @@ int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_lin
 /* dai_link init callbacks */
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 0f1b2c288162..9f92f49cc517 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -37,7 +37,6 @@ snd-soc-sof-ssp-amp-y := sof_ssp_amp.o
 snd-soc-sof-sdw-y += sof_sdw.o				\
 			sof_sdw_maxim.o sof_sdw_rt_amp.o	\
 			bridge_cs35l56.o			\
-			sof_sdw_rt700.o sof_sdw_rt711.o		\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index af656716c9d2..1d7e6df02247 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -89,13 +89,6 @@ int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card);
 
-/* RT711 support */
-int asoc_sdw_rt711_init(struct snd_soc_card *card,
-			struct snd_soc_dai_link *dai_links,
-			struct asoc_sdw_codec_info *info,
-			bool playback);
-int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-
 /* RT1308 I2S support */
 extern const struct snd_soc_ops soc_sdw_rt1308_i2s_ops;
 
@@ -142,8 +135,6 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index 68b8fddeb77e..20516094f453 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
+		       soc_sdw_rt700.o soc_sdw_rt711.o 			\
 		       soc_sdw_rt712_sdca.o soc_sdw_rt722_sdca.o	\
 		       soc_sdw_rt5682.o soc_sdw_rt_sdca_jack_common.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/sdw_utils/soc_sdw_rt700.c
similarity index 88%
rename from sound/soc/intel/boards/sof_sdw_rt700.c
rename to sound/soc/sdw_utils/soc_sdw_rt700.c
index 0abaaeacfd90..4dbeeeca3434 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt700.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2020 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_rt700 - Helpers to handle RT700 from generic machine driver
+ *  soc_sdw_rt700 - Helpers to handle RT700 from generic machine driver
  */
 
 #include <linux/device.h>
@@ -13,7 +15,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 static const struct snd_soc_dapm_route rt700_map[] = {
 	/* Headphones */
@@ -83,4 +85,4 @@ int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 	return ret;
 }
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt700_rtd_init, SND_SOC_SDW_UTILS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/sdw_utils/soc_sdw_rt711.c
similarity index 85%
rename from sound/soc/intel/boards/sof_sdw_rt711.c
rename to sound/soc/sdw_utils/soc_sdw_rt711.c
index fb5bc611b5e7..38b4126dd45f 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt711.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2020 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_rt711 - Helpers to handle RT711 from generic machine driver
+ *  soc_sdw_rt711 - Helpers to handle RT711 from generic machine driver
  */
 
 #include <linux/device.h>
@@ -15,21 +17,21 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 /*
  * Note this MUST be called before snd_soc_register_card(), so that the props
  * are in place before the codec component driver's probe function parses them.
  */
-static int rt711_add_codec_device_props(struct device *sdw_dev)
+static int rt711_add_codec_device_props(struct device *sdw_dev, unsigned long quirk)
 {
 	struct property_entry props[SOC_SDW_MAX_NO_PROPS] = {};
 	struct fwnode_handle *fwnode;
 	int ret;
 
-	if (!SOC_SDW_JACK_JDSRC(sof_sdw_quirk))
+	if (!SOC_SDW_JACK_JDSRC(quirk))
 		return 0;
-	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOC_SDW_JACK_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOC_SDW_JACK_JDSRC(quirk));
 
 	fwnode = fwnode_create_software_node(props, NULL);
 	if (IS_ERR(fwnode))
@@ -110,6 +112,7 @@ int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_rt711_rtd_init, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -123,6 +126,7 @@ int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_rt711_exit, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_rt711_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
@@ -144,7 +148,7 @@ int asoc_sdw_rt711_init(struct snd_soc_card *card,
 	if (!sdw_dev)
 		return -EPROBE_DEFER;
 
-	ret = rt711_add_codec_device_props(sdw_dev);
+	ret = rt711_add_codec_device_props(sdw_dev, ctx->mc_quirk);
 	if (ret < 0) {
 		put_device(sdw_dev);
 		return ret;
@@ -153,4 +157,4 @@ int asoc_sdw_rt711_init(struct snd_soc_card *card,
 
 	return 0;
 }
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt711_init, SND_SOC_SDW_UTILS);
-- 
2.34.1


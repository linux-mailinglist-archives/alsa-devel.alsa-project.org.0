Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA39446EB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B973604;
	Thu,  1 Aug 2024 10:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B973604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501938;
	bh=ouY1nxnfjw9PexoiCybB7uIlzM1I8yJ48mTNr9sxP/s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nt2bMUx1yuMjRbqztLX8nrk5MSqwNmQgepNG/uqz/1Euj7jqXdmLhFNkkF1cOZQkv
	 c4FWftRXSVrzftWVZnocByJlY2OPAv15tAKfhVh5dleAeAV2/+tiKv2xwORhsu9eJs
	 3EgXSAN0UiTN/c6xZU1xhTCAckN4guvH76f/65Yc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AA5BF80693; Thu,  1 Aug 2024 10:44:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 829DCF8065B;
	Thu,  1 Aug 2024 10:44:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E0D6F8026A; Thu,  1 Aug 2024 08:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83909F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83909F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JuOxiCAI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iB5x7oTLJOzHUGQlmFmhDwTHy+h2m0s43K+y4D7K9Z2mMZQyjoN75qXfbvlyeyoZmg50J5pBDpnN8UjZw6BQVBIn04p2IWTCY20+ulbYa8kCFufNwin0077SSbRT4MJU1FWrKf7uw5ukkGzJeS9uUAauPiFtoDDZed2LtQIn5Nmxuq6q9+9897kcgEamI+PT1vMbFunrfep84Wxf28iR1G540JXbxw4WM36Jx5hgy3U9Uc7zz0n+bQRsfU9VRo78TUkuXQT33rTb/HSMBwh/LGDCem6XFaG52NsQH3yPId0deqV+l8oeQDngxtjm3w42xEYnTscXs2Ylh300Q+FPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1oVuq3hwPFTWMdqa0cdEAyN9Tqh9cP8L5UQI44VQus=;
 b=Kt9eOqV6ztUE48zjIOJurdMOpfmrmQqXI+fYDo2owEiv60dVHVxsp6LTnq6GbAfI1rsSoFs+LZNWCzGcU/Da2V3lHCYoazAvNPIQGi0zv/vTyNInmbM2YKLBd/JGLFVJ6DBwka0AwVhTbA2gJmYC/9sBG+IX8htkM5/gnasJJmHcytLoVZaEq03+/whEZGx/YxpvRu5bGhP6Jk882/1Mt5GQr836dk696kk8mH+78lrAQ/xveYnXzDQbQKdnHRPe2s9MAJ+kJlK6bK5KZRbXNkF9J0ET6DMP29iARbo2DVuAdEXzDFAZIf3SUiZnA1HqK3RfWjNXZAjc4nhNBJXwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1oVuq3hwPFTWMdqa0cdEAyN9Tqh9cP8L5UQI44VQus=;
 b=JuOxiCAIRoWBAteACbqH3F8/ppw/i4QLJLBf15+XTJ7nPqLe67H7Mh8269zoWAqHIanH+NzpU/y7fuao5Tc0H/IU9XJgnUf8a4xjF3HVTaW5jc6bBUd5uwjhV2J9I6I3vMhA2AJF6xi6fKBe5mv6vUpI9Z0InzMNy6PEQ91o4Vg=
Received: from BY3PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:39b::12)
 by SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 06:32:14 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::63) by BY3PR05CA0037.outlook.office365.com
 (2603:10b6:a03:39b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 06:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:32:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:32:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:32:12 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:32:06 -0500
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
	Rander Wang <rander.wang@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 17/31] ASoC: intel/sdw_utils: move rt700 and rt711 codec
 helper functions
Date: Thu, 1 Aug 2024 11:54:02 +0530
Message-ID: <20240801062416.2203673-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|SA1PR12MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: f63c6a2f-91ff-490c-24dc-08dcb1f3ae45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jyxdmw536gCFxMLNq1AUPNpay3nLscfdHR27Lad5nwfpUuf7gQdt3FtWtT/E?=
 =?us-ascii?Q?HZn+QtoGdeWrM+wIp3PcSJx+/U4toV9x7eL+XkRAf7hYOj+EM76wp+SOph9i?=
 =?us-ascii?Q?dNefvOtukRIRouRWgBuQqR1OW9RQvt0VN8rO0vlxASxUU1z2DpTq0IrCS4hk?=
 =?us-ascii?Q?u3Tg5wAAyq1oFQ8iV/EKj1CZgVPJfPuWMgSE0hd4JYzXgqfN2NOGifEjdQk3?=
 =?us-ascii?Q?SwPOSYsPc8roTCxk09nQChaEKdMivy2xk/s5QkCjNtGvrSFlHSvKpQ7qVaxv?=
 =?us-ascii?Q?CdP2X4e8ERZyviFQwNgnNSXw/QEBQg+tF1IuDuItDsYK+S8RyPIBVaxbX16v?=
 =?us-ascii?Q?Sgo/xp9jr4ZC3jlUwoeqdkldrbptsmGVcebtBrKPi5VZBWRWoJyqXdwpGIuH?=
 =?us-ascii?Q?jtgnkD1lsoieGucXHbKB7wzf+Q1Ld1ABpWCtph8dVSFIjzNvzA0WWxdQ7W3D?=
 =?us-ascii?Q?+trLq2sktqK1P0oxYwhHJ1aFdL3MsNTs1Kc4cdoHu12W3wROopa0QJBs4Nnb?=
 =?us-ascii?Q?ATRrgfuMbtfdO4ziWTeueEaB6TSI+j8mU8yNHa1SQTA80y41C27V4Xo82NT6?=
 =?us-ascii?Q?lKhaF/FOfC1VDMQGf/YAGlHFfKshQGoP1HQD4BV3aOp6o5FHwn3yhMZQig2k?=
 =?us-ascii?Q?yJKtkJYDeBFCu12IadMsIRUrMFq94uxaxvD6nXcTOFDzmNHrSus3fYxtq53N?=
 =?us-ascii?Q?4aUzoAtgOlvYdmWIwk5iMkZzNMNXc5adtAHlUKyFi5cTPopBWgLpv2BROnfS?=
 =?us-ascii?Q?Rr2yNvL7Nkee6pE7pIjS2YvGKf5h9qTOkIpRi3dz/lC0yllfYGcRV+/N1Okd?=
 =?us-ascii?Q?bSP0VpPC3Mftb0bgAQ5uZkiobb0rEvqVRg5TUAjP3ACUrKhrFKqRTDZkDMUK?=
 =?us-ascii?Q?nh8xjpbXwG1qUYbCMaG9a6uG2ZVLxOmoRv/kZYr9pf4Ayz1qvPuUpGnHlpWJ?=
 =?us-ascii?Q?c9yxroc4sy3IwrItS2Lb5meJ6vB8ww99DRsm9V6kKsp8T4dWFwP6lnzIBj/R?=
 =?us-ascii?Q?zvzLimm2hUliBl5DGuiZxaRi8pNbVpq5q/SeubuDnAgOVNgUISh3xgeLkau0?=
 =?us-ascii?Q?7mSs21TS4qqLEj7vy4iaRKgRq4qScek+yx4Y4Sy+YJbfInAegcGsNLeTsnD9?=
 =?us-ascii?Q?X9GI/oct1GQhHvDtYIuSHttjXI5yQmwRgW4v96aYD6WIIEwajAD6Zid4gVJo?=
 =?us-ascii?Q?d7LzHIqaOHktgiDjtY0uta0//olSVQjC9h/T16YPdBntMh+6HLktLKXh9API?=
 =?us-ascii?Q?iYctgDtLpIHv1R9ArHSYIoVv1UdUv9Vkz0m5O3bEGMqn8mlr16CiYujmi8Xt?=
 =?us-ascii?Q?UpUad2diwduBu45RcW7XpEslrbuLwu/aSB/J86sXuO4whhrmdDUwFNl3ivPi?=
 =?us-ascii?Q?UwqFj2p3kMo4NALojweWX8c83UrP?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:32:13.6829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f63c6a2f-91ff-490c-24dc-08dcb1f3ae45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5615
Message-ID-Hash: 4PQ5IENYQPGMEFX7B47NQVSRFJLWX52L
X-Message-ID-Hash: 4PQ5IENYQPGMEFX7B47NQVSRFJLWX52L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PQ5IENYQPGMEFX7B47NQVSRFJLWX52L/>
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


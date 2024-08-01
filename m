Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAB49446E7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F4B63587;
	Thu,  1 Aug 2024 10:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F4B63587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501887;
	bh=Yzz8WOg43WeIoUjtkJVapYM27Be74R5TXQtiY0PKNKk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M9kYzFr70pCnHEhLvIpkzyZmgswKo33v9ZpLCgO2h53T0QuUqSpPmbSz9HL4g7aTF
	 is6UI0G1OBWhGEqOTnyzySQFKi4Biv+iN5BMM/DoI0P9aDh4aJhVJdpPJiPxAAEDQi
	 wTp9A9UgK3eQC7FflaLkbiCuKLNcoejloqVFoj4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EA01F805B4; Thu,  1 Aug 2024 10:44:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B677BF805C2;
	Thu,  1 Aug 2024 10:44:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E29AF8026A; Thu,  1 Aug 2024 08:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D698F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D698F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S/w+F6TA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFQylra7giED9TD4s0EFaCYpO+vOWeEMMfl16DtlAmNckvl3WA9ZjR4M5lTzTrAcz7p5sgwxpBEyLNr2BsCE0H3J1ykp28UpQB0MzKT6m8HWhPlcx7+AQh3aHeptBG3Q1vQkR6nIqtYWA4sV5PYPea8h8vLL/69EMG5ufPGCkd55h5fUSOaQp4qW1YgPlST1ALp9X479Meeo8QJc9FzkNg10dxvmS177ZPQhNmXsH/qHbY8D9bIpO1/BcryPA4QUVby9h2cTPpJYCMxrIJJgYI/ak7ysZXKSsZteBmMW5xEbQL+Ln8lD22ThLRIAzLa3qmi1RFAehVnAkfu4mdqYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6mKQYLX0Q5OVdsXYYGk5DZZpfqfgmCoNaifWSLyRIk=;
 b=TEQNTWPPVMKnRZY/fDi8UXvH17SW7US/wuxV0scQNBtBJwU2IDKkdAdggErPCqOsyEcUvNhKJykRTnBd3h9WS4dJUGVPvXKur1eWeBNii7yCC7JZkMIuyTutIdmX8xncBh6P4F39iFaLzFKyIFuUZfDF0qTUh/TeMf6h5J0zn2KyegcQubFz2yDRbYQ7GRkymGvflcOJiPTm65a6th4JuTN/OQzrM1/OhNSnvak5t5vjpa/CbFlh+VPlKepl97HgfOyryB3U/gUvhXGcwhXwu82ybhHM42IAqqdkIh1iag5nM0XSqyk/JNS3iAVaUbArjzzf4yYPAE2Yuutpvv08sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6mKQYLX0Q5OVdsXYYGk5DZZpfqfgmCoNaifWSLyRIk=;
 b=S/w+F6TAwwiptGmtuqzq2yp1jjpJKfbDPz0CpsUxUQSs3GuIOgV34ytOz2W4VjhaH7179jByR4O7WimO+TZckOvbjFx22C8jhhsj3i2+lg+DU2Sj0ajiewYkSyciITEMPi4aZFUWlvFS3Ih6EBooO2nQTF7FowoJfWiyjF9TA34=
Received: from DS7PR03CA0264.namprd03.prod.outlook.com (2603:10b6:5:3b3::29)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:31:14 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::66) by DS7PR03CA0264.outlook.office365.com
 (2603:10b6:5:3b3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 06:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:31:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:31:10 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:31:04 -0500
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH 15/31] ASoC: intel/sdw_utils: move rt5682 codec helper
 function
Date: Thu, 1 Aug 2024 11:54:00 +0530
Message-ID: <20240801062416.2203673-16-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: d562e3b0-f1e0-4c5d-7912-08dcb1f38a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iwP571J6q7VWWiUMqfzQg10Y5+8mutr9AlFncOEgWsC6SL6zY6ZtfnYHYXNo?=
 =?us-ascii?Q?yrzclmdsDa1r7ggDieyaSWuRoauecrvaZephWe+GkPp2NjPajL+JPNyIfevY?=
 =?us-ascii?Q?x8xpzqjWb+4LO/fGUBrut23RVw/Hzx1EocY/EKX6g692OIpnKFVH05T6o1T7?=
 =?us-ascii?Q?8qvhnUJbd22CdV3Llw9sewsQwBDnBe6KcWTOt7pfJx5zbo8GmshwF1UBNUyU?=
 =?us-ascii?Q?vx6wWJr4+HjKSre9kJjrYVaeaupbeYZ2bZ2NNiOoUkryipEWl0DVX9XaUrkH?=
 =?us-ascii?Q?f3ECalcACOTcjstwOwX91kzEin5pPswl48vuCg2uHgoeu+d+U9Zd7BZXc56s?=
 =?us-ascii?Q?kZGcxtPypq+tNF6c8GRQWkFgbm52LuNku7sbdHzBvmDT5ED1ZhrnX6aF8lRn?=
 =?us-ascii?Q?ALEm5Ahdv3vA7xrXr6FQUs76vq1pqHViFhMsTV9f/kh1oaoiWvO4SnB/M23Y?=
 =?us-ascii?Q?eobzjLGQKogCkY7sCit+Q8AxqJCzhXwherb1+lf6vREBYMQITp9nrYjsXs8z?=
 =?us-ascii?Q?XKYADlkR/68i0Yj2Bs205HAnXZbcRJ4DDoD4EeeQDTRWoc/xlGtaJAqr4Ggw?=
 =?us-ascii?Q?45UaZbBgMBhkXJexf65aAch2bEKm17eMI56QSm9HLlfkdLFpLisoVMK4waMW?=
 =?us-ascii?Q?1XMYATeXRin6fF8b5my8B/lpT8Rtfs9b+JS8Zs66pR4RFgZlrI6AQEWFoqJm?=
 =?us-ascii?Q?1wBgYAjIh/9DexTw9FaYWTC4FPc1Py8EdbkqY+aKYB+7x4QUyeP3wu3t3JRs?=
 =?us-ascii?Q?/l1JmYxTiAsKDV9Gislr2JDqhshHRGu8eRPLH6agbzDfynHDuA641mrE40OS?=
 =?us-ascii?Q?TD/La7fz1pfZ3L5oDxQyI0+6gWnPSfcsw4sdTuvxpANiDvYGGp0lX+jFwe/z?=
 =?us-ascii?Q?9yLXAtrbw54SFrO89WvQp31dWHGAGx3fdCiH/NLvjP9CQzB7aTbUxtBBAooS?=
 =?us-ascii?Q?U0axZ1ycjavrzWi7XBqd23EO7R1zqicpqONWGj2YnleHJC5RLHrsD737X2Gp?=
 =?us-ascii?Q?JM1E6Z8MGTHCO56FvreEQFOg692Ry0Lz1n4a+myHsoDO2WAkVbRkqSk7UmRH?=
 =?us-ascii?Q?fEHUqpj+Mvx3C/7xrtbc/6VVp2jr8pT720LKT9IU5UE7xSXxjKWjb7kIMMnD?=
 =?us-ascii?Q?1jhTzZKByNSzueAEmpWtaOYPJd534R/Fw8syvMjPlgZKhMBTmr1t9rTaf4ql?=
 =?us-ascii?Q?fDV8wXOhUvOSJjNyfqV7FkVCFpKE6ONv6N7ZEtweNgbbiTV4ioFkyM4+IN75?=
 =?us-ascii?Q?7AVdxj7g9Grl5elthKLkxaNwqXebCUezlY5qYOQYVSWrRlByWFmQIb9kChiY?=
 =?us-ascii?Q?6FeeD7onOkeKNdUh1t+g8WgygX2fkPobTMowB1IQQEQXfkXL6wGkKuQJtMCG?=
 =?us-ascii?Q?cz3CG4mdQK4kjjOlwPLaLZbWEXh/?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:31:13.9157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d562e3b0-f1e0-4c5d-7912-08dcb1f38a99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098
Message-ID-Hash: IWA5N44BJ4LDZA5EIHGSZKCQUFGF322M
X-Message-ID-Hash: IWA5N44BJ4LDZA5EIHGSZKCQUFGF322M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWA5N44BJ4LDZA5EIHGSZKCQUFGF322M/>
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


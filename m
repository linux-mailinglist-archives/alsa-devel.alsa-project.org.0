Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342DB944889
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9B93BE1;
	Thu,  1 Aug 2024 11:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9B93BE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504894;
	bh=S2ST/oiY44ugBEXzrBU0fyAlgGAV1t9LSEzykBOMz4c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uuCqgoQklk2bEBYfCwnVyRk34cdKLHSeK9sp6JklRE4Jn7jJfGl6U6xDCCmNpnMTR
	 xwfzDGmMyYFU4PIyNfPgG7ZM9rbolE1AuHYE7KftIaYOJrIW1hBbu4GyOvmaeJ1VfV
	 Ye6CNnEQRXQibgzHxDKTvuCaCLcP7ID+xw64ufi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83AF5F805D2; Thu,  1 Aug 2024 11:34:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB57F805DF;
	Thu,  1 Aug 2024 11:34:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35DB1F8026A; Thu,  1 Aug 2024 11:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36EA8F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36EA8F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=B99rXr9l
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED6rtxiAlySqvIvY8BZxl1+NPCHZ9YscRqj2RPhLsufFz2A0eNMMJrtWnh8siQeKLePk2bfjf2X7agjs0F18/35BK+NcHXYEGg9AiFeOeF+jBBm+uC+Wme8OO4UUSr6rKEpNE3kQ2LTsbrcQY+UbDoKrF4onws8LgpqgM34ArwCpSkIeY6MAd3clFJ99uUdRcdM52XsUow6zFXQyyDC3J3gMFInibkg8RQovi2MFqQkWplICaZlHmkyPCmwZ5Mi0fvalMGb9XiJ+wDPESV9hjRYv29EueKtK876oa+O0lo568nzbrbHaelzSno7Ejac9dCD/zv8r5WRXM7LUmv2B3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1hnEfkIC+ghzF+oVLNepXM9R2KLwrnFBZkn4np8uO0=;
 b=aBdiZBB6icBZkiP/7dy59xc9n5zJrz2P1S9Ij8qbc/xLxnKejgnQRpHj1cGcu9s6hADGy2avN4VkZdJ6Njb6rEVZrruOBz0YGd4DAQ892fmNGqtsp23uT8RjdtrKm7j16CUiN16ab8UoJ0jJEZXRaJ1Eve7QLAOpVJtHRtfnnzOVct4KMzXaL/Qud6GakSUDYyml0M9TTPbcfE9kw8OH5NTn22cfC9HFAgC86o3uo84jIkp2jBZafNJ6aiB2/82/6KBYVBbRpv/X2AYkLbQ5JyKJVikGWqYHdX5sCGcfNvARvLzkDTS9HMs5h9j81Umqh506+izyTenAQCE13KiDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1hnEfkIC+ghzF+oVLNepXM9R2KLwrnFBZkn4np8uO0=;
 b=B99rXr9lROcfaHS0Xf43dkoDuyFc5xnIX8rksnjzgWzKO6Ru1plO1ex14MoK2FHH4/UsB0Klofh/DxL4/iyuwpB6PmUcXV/qWJeCDtf2oKIT5CG/1DgiwXkrsfd60qKZFSoT1gSeE/TfFQtdqNjHkPDjomPJejzblia6H9FZnuI=
Received: from BL1P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::11)
 by LV8PR12MB9205.namprd12.prod.outlook.com (2603:10b6:408:191::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 09:20:18 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:2c7:cafe::36) by BL1P222CA0006.outlook.office365.com
 (2603:10b6:208:2c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:20:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:20:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:20:17 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:20:08 -0500
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
	Rander Wang <rander.wang@intel.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 12/31] ASoC: intel/sdw_utils: move rt712 sdca helper
 functions
Date: Thu, 1 Aug 2024 14:44:27 +0530
Message-ID: <20240801091446.10457-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|LV8PR12MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: c954f652-6237-42d8-a314-08dcb20b28f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BchwCXWxpFc4hPW/Kd6gP3kH2hYvPAwoH/jizPxv7LCl3pT9AE0ruyGDUME5?=
 =?us-ascii?Q?TUp+sFBMu3t3ykDnCo92PLV1mDtmf3VUkmJyWJmnGI84IXLSjm4evdluK0m1?=
 =?us-ascii?Q?dFI6sTaOAkcDjhslFOXAe4BCwYmMtPDsrq9KhdrJI8itChHQZNGcserWBoW7?=
 =?us-ascii?Q?9lBXqM+6eD1ry59lGTXJy6iMRMi1nuZFBcO8G63uaQpqWGuWCeMMIxgcRW4e?=
 =?us-ascii?Q?ILgN70Bq5M9NJKILyRw4cL/HxBuG/XJqjOm7wl7GxNKode/2GfYbnuqKadFW?=
 =?us-ascii?Q?6nX4ZCjbGmPWtn2050wJguGF2x4vuxrXaRNuBX2IZ+klPehfkVtEQZY1KYD8?=
 =?us-ascii?Q?6f4Zcx8o0mh2RpheH1t+MoCOj2q7pOlfURkYzoNKeBm+Sd7iumI2jMW/p5Qw?=
 =?us-ascii?Q?RLkxRXz/WHAVpexL0QAHYi1a7Tq3PSLVJGYmczz4xhnjdbNHB7w+ACSQXnfp?=
 =?us-ascii?Q?4oZe08ikp3JIxO6DawFAOx+7h3E4BEfxePrOSDSPa5uOCH9oXbTBbCd3J9D3?=
 =?us-ascii?Q?kWq8hjaVhurUX3n6PxclQGHG/OPJfGf8NzCByTd1jS2VqxtH7RoghMl0XqZe?=
 =?us-ascii?Q?5E+XcOVVJMkpGd/nKuXF49FOsADmI+lfYkvIYXTev/E8k4vbaEyHe3jT0uaA?=
 =?us-ascii?Q?NhJjLIo6mOllu07JRicCLhWnLnPPntBL8HqBlB/yUYzc7raLHDNXitIBvZrI?=
 =?us-ascii?Q?nmflhtsMBTGHVL0j7sFKG82rqIEPoKVFdGVOiQjbMzA1Qyi13iQhQVCZMqYq?=
 =?us-ascii?Q?iBqAkcd11NNNh/9NdIAgx2rRV4vXTbCezo/Ul3qL92opZjlj6NIGVxeAq0vz?=
 =?us-ascii?Q?UuAgKgoD1D0gPhHhdS073iyg8UEYCJ0UfSBJel9jONeJoxz2fxSs1kvy1ioh?=
 =?us-ascii?Q?+LLLY1yLAzgDadMEmPWaghVQ5JqDV35IiAnZOx5aPRpxJk6xTDB/XarOhra/?=
 =?us-ascii?Q?4vjM93qTOMCLRt+jLit7Ty7kRRYmgYDXwAaRrUBlO4HKuFNURZMEo2rK9ML1?=
 =?us-ascii?Q?i++VZO+ZBdx+iPAxy5v5telu11gsohPi7Y2ZDtAhOsptfDaZxyPybTHSXKgv?=
 =?us-ascii?Q?daR1UXWrsvwgiyjbdZpVoinJqFmYQPvHSIpdqpdZ3iCfiQ+5njrNc1VmGba6?=
 =?us-ascii?Q?klsNEeiwnN0vhL2eK95cb1/WZVqnaBLHpGjWi96CLBkMRp7R4mDDCmqzNkH2?=
 =?us-ascii?Q?x808jJduZKSr8MTTLrsq0Rq6n9vY+n8j+Vf5anmoHryYOZHER+V2BmSqrqrX?=
 =?us-ascii?Q?KrzRzcEySMZ6CA4lZX47V2e7OSu4vx619cNc7mGvTER5u1//+4iEJ2f5V258?=
 =?us-ascii?Q?ZlOfTkGbi1U3ii0onJLRJNTeNhRuKo1+vX6c4YX6sBp5SfjfD321qvp0qwmA?=
 =?us-ascii?Q?UsW3mmEB124pUw7/xnOnmalYBwwWK+suVoq82ffCBRORhUoCSw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:20:18.0451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c954f652-6237-42d8-a314-08dcb20b28f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9205
Message-ID-Hash: 3MRES275ELJZSG4YAZ7ZXK267MRZQJY6
X-Message-ID-Hash: 3MRES275ELJZSG4YAZ7ZXK267MRZQJY6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MRES275ELJZSG4YAZ7ZXK267MRZQJY6/>
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


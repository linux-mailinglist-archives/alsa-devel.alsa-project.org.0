Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A1694489A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A3AD3D3B;
	Thu,  1 Aug 2024 11:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A3AD3D3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722505025;
	bh=wZF5msvkReMqOaD9lENyucelsey8O5TFWxvA5TTaEio=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ega380DQE+3K+kV86LAkOtjPnijMLNHG8VemPfER6N9pLl0F/h8rIf0YVzFNPqIA9
	 92zqqetE7/b3FdcBWSUiGqWhcsxhXR7s+FSY6FnTOycOvZoQsaDJpPTzJDjkW9cIvt
	 1C+rtu5tqcjqjvsJKJ6xUv0T8kn8uemMBD1C22PA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8EA6F80604; Thu,  1 Aug 2024 11:36:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3840FF805AD;
	Thu,  1 Aug 2024 11:36:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EFAEF8026A; Thu,  1 Aug 2024 11:24:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 26864F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26864F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zmZpvqe2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzaZeGsZYKvm4GJ8WhcqkO85d2l2Vg82k+S/WSbHr0JYaz7KTLDjf7nnl0C8aCBlg6eLyR+p5n/C35pK8rTL78ttrON+dhIWN4goVst8b8FRoU8r50TbUGOtXDcSSVXOp6i2lgeXRagWz5nurP6ff88s8W45fEklskXi7ag//C+jA/GHrp9aCP8yayBdmGBCW2aLRRxHNVcAmdMXiayxDLeVZmW/qAXM3jeipYVSL2uJ7BEOKBHB8L7h45B2tN7RwnS3vejhMC1LhIqrAIr7N7rE0B3sChAX+AzokkWlTKvaO+L2q3O//iEfJQ97hZAD2N2CbJ3W3XzDYml5zPRV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRwr1M8HYTTJ9pQI1KdXfbC6gSD4Lv3+HS0qRoT2L1s=;
 b=JwPEoWIlpHMOAerYLRUhlYClDBI4bB0pmDJK/3nfCxMd9AGMPerwR6GnHyFLfEvzWtEPwfxb3J4igRtF9DspasYDZHUdkwQ1aQIm3ar905O0w42c1alHfypaI/2zPJeIRBekBDPvL7+4pN6p3xKmiV1H1JU7FlLWVFqycm24COto7act2dvUDHGV1hQjoi1c059So88ECek5YwzbeMp1KIO/OA1FOgjxFnq+9hVg8z2MvL1Jn9QUAWe23GIS7UJ8bzXn7+3UNlmr4zJ4bMSXsey7TGtJmjIVDTyCiaT0sQhEPYJIU4HY7oF0ZacYylaM9GFWxZ4oyXgW0eoPGbU0Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRwr1M8HYTTJ9pQI1KdXfbC6gSD4Lv3+HS0qRoT2L1s=;
 b=zmZpvqe2Yb3o1RWmorwif9C9eMWMmLsIf7DZ/6y7jhOrASySQuCrG4BOCrdaqVaDV1Q18aGI2qMttUQOCZGtw7MPRtVucvH0THt2kLoTfIk8s1pw5NKFV+FvUQ9vF2a1525c57V3yhebZZamgQ0IgNR1DaNeXjsHfQYnc5ZYYZs=
Received: from DS7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::10) by
 SA3PR12MB7781.namprd12.prod.outlook.com (2603:10b6:806:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 09:24:49 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::5b) by DS7P222CA0030.outlook.office365.com
 (2603:10b6:8:2e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Thu, 1 Aug 2024 09:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:24:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:24:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:24:48 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:24:42 -0500
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 20/31] ASoC: intel/sdw_utils: move maxim codec helper
 functions
Date: Thu, 1 Aug 2024 14:44:35 +0530
Message-ID: <20240801091446.10457-21-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|SA3PR12MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: b290afdc-f814-4ccc-d011-08dcb20bcaab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o+PsNO+MAFSnzIXXEfL9EaJwrJL1GWa/Xz+EUy2N1OAuVJqOfjpkipuZSeAz?=
 =?us-ascii?Q?OCPOUHl7VuRSEtuRPVJrhWa9AKwa2HWdoAkN/Bx0J5pyoG7LKAnkkRwvwEnG?=
 =?us-ascii?Q?RWinBBsJx212v62H17FsWkwTNfwErpPafCu1Yx2ZlOunrGFn1OjmG1FIZeQf?=
 =?us-ascii?Q?NXIsPGB94XsvEnK9mGBxB6nC7C+V0Kir1taWgHHNXSNClUKmUJLxj1Pxc5zl?=
 =?us-ascii?Q?YKkcG3twSNMJx54uQVKr74Ct0/P2/gUVEkJoiSXFrKXU1UU7m7ckTCY7qISv?=
 =?us-ascii?Q?AuCpC/wcz1GgjAbuaGxMO5y4yW3QO1BXmHWMVXXIMYNr6aW1jx9PQL3IOr+2?=
 =?us-ascii?Q?0d1cK//Vg6pWAnfMiKkz1zdT8V5eJOgipsZTT0zcRhdXTVmIL/xYoQOxTtis?=
 =?us-ascii?Q?Usuy0kFOmxAYWjdX3YBBtdNTk8LO4tcOvTlDBUPDC2kmels+j/f7vj32ATQg?=
 =?us-ascii?Q?eXKZMUQpwwSRrBk1RWrslYNAMKvE+x3vs5+f8K6WhvXLovTWBhC8ktXgI4cF?=
 =?us-ascii?Q?wZcS3m1o/kvCBgj3Q7GypotJxwRbPWaQkJirl0kyLoaGYT5gW9WNfUD+WFbt?=
 =?us-ascii?Q?Li0nlwldkUnojS6m97QtVsZcKDp/21SmGnLIr7YvOExuFJiVE6FBFBe9VcZe?=
 =?us-ascii?Q?3RD5IqZ8UCmlYob2A6/p8Xd6wrTfPqqd56E2PNwA/7fOrGt1szADCPKZmciS?=
 =?us-ascii?Q?HcV3bqmyb9mzdGJZRslG3ormPVzLXgc9wXQccf31p0BfOKGikSUF1nSn9jlp?=
 =?us-ascii?Q?XU9PnRj1Wem2npVIe5LGtMb7g/HBG37T8PD2Qg2YS/Pk1VOIRVOtqxcgave0?=
 =?us-ascii?Q?OX27nLolR7sFG3e/liDGeHTPxIORZQToSVK260scZm3lpvLgD3ERHdxx968W?=
 =?us-ascii?Q?auvlg8cZyqM1BE5WBHIdVkzQkkuy5aNS8jTNi6Nz/e4RPHO5j5uZU1LjW7bQ?=
 =?us-ascii?Q?7m8Svzg+Qg75ab+W2JqugGEtjFbrm1zlwE2xw+0hHkLajFNJpiQrY/H7v0wv?=
 =?us-ascii?Q?8Ksswwmd4a2cDqCqn+5JdJl4e2XwlBmyURC17sC06waOG8fAeqCVPyM3XlZv?=
 =?us-ascii?Q?v+fuunQ6C/fxYx8iekwZ+PaMqm8S+y5DOg+Cl3dWDmD2meH58E0rex68aXSo?=
 =?us-ascii?Q?0H2nbpFlT0sMMQCeeo9rJ4Uo1rUtuR03cBvNzrUjBUSkV87/T1QYadtacdlb?=
 =?us-ascii?Q?WnQIOWT1Z7POvbcpprliwbzGaYcw2gZhHthwYroJEyBITX4j2B6VLYY3iICH?=
 =?us-ascii?Q?Kkrem1ThF+qOo7XyJFwb3/nnOHZzqLNiWpT5kAAYNqijrAhLFlxSXkSMA2Ik?=
 =?us-ascii?Q?tXbM4Sr/SBcaKIPXfTcw+kT+m0x35F9Er5beIJ3BGamdSC3vl/y0oPTM7laM?=
 =?us-ascii?Q?niTOmsXE0502Nbah4iK/qzb5AblTIBriMTsaPq/sLpcI7PiTHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:24:49.3315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b290afdc-f814-4ccc-d011-08dcb20bcaab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7781
Message-ID-Hash: HPPI7NPIOV52OLFTV7EYL6R5NW4OJXPE
X-Message-ID-Hash: HPPI7NPIOV52OLFTV7EYL6R5NW4OJXPE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPPI7NPIOV52OLFTV7EYL6R5NW4OJXPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move maxim codec helper functions to common place holder so that
it can be used by other platform machine driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                      |  7 +++++++
 sound/soc/intel/boards/Makefile                    |  1 -
 sound/soc/intel/boards/sof_sdw_common.h            | 10 ----------
 sound/soc/sdw_utils/Makefile                       |  3 ++-
 .../sof_sdw_maxim.c => sdw_utils/soc_sdw_maxim.c}  | 14 +++++++++-----
 5 files changed, 18 insertions(+), 17 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_maxim.c => sdw_utils/soc_sdw_maxim.c} (86%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index d5dd887b9d15..9e84d1ab6cd0 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -144,6 +144,12 @@ int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
 			 struct asoc_sdw_codec_info *info,
 			 bool playback);
 
+/* MAXIM codec support */
+int asoc_sdw_maxim_init(struct snd_soc_card *card,
+			struct snd_soc_dai_link *dai_links,
+			struct asoc_sdw_codec_info *info,
+			bool playback);
+
 /* dai_link init callbacks */
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
@@ -158,5 +164,6 @@ int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 1ee903e12249..5bd8dc2d166a 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -35,7 +35,6 @@ snd-soc-skl_nau88l25_ssm4567-y := skl_nau88l25_ssm4567.o
 snd-soc-ehl-rt5660-y := ehl_rt5660.o
 snd-soc-sof-ssp-amp-y := sof_ssp_amp.o
 snd-soc-sof-sdw-y += sof_sdw.o				\
-			sof_sdw_maxim.o 		\
 			sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index b95daa32e343..664c3404eb81 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -77,14 +77,4 @@ int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card);
 
-/* MAXIM codec support */
-int asoc_sdw_maxim_init(struct snd_soc_card *card,
-			struct snd_soc_dai_link *dai_links,
-			struct asoc_sdw_codec_info *info,
-			bool playback);
-
-/* dai_link init callbacks */
-
-int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index c15b08f3ab0b..28229ed96ffb 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -6,5 +6,6 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_rt_amp.o					\
 		       soc_sdw_bridge_cs35l56.o 			\
 		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
-		       soc_sdw_cs_amp.o
+		       soc_sdw_cs_amp.o					\
+		       soc_sdw_maxim.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/sdw_utils/soc_sdw_maxim.c
similarity index 86%
rename from sound/soc/intel/boards/sof_sdw_maxim.c
rename to sound/soc/sdw_utils/soc_sdw_maxim.c
index 9933224fcf68..cdcd8df37e1d 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/sdw_utils/soc_sdw_maxim.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2020 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 //
-// sof_sdw_maxim - Helpers to handle maxim codecs
+// soc_sdw_maxim - Helpers to handle maxim codecs
 // codec devices from generic machine driver
 
 #include <linux/device.h>
@@ -10,7 +12,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 static int maxim_part_id;
 #define SOC_SDW_PART_ID_MAX98363 0x8363
@@ -41,8 +43,9 @@ int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_maxim_spk_rtd_init, SND_SOC_SDW_UTILS);
 
-static int mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enable)
+static int asoc_sdw_mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enable)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
@@ -84,7 +87,7 @@ static int asoc_sdw_mx8373_prepare(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
-	return mx8373_enable_spk_pin(substream, true);
+	return asoc_sdw_mx8373_enable_spk_pin(substream, true);
 }
 
 static int asoc_sdw_mx8373_hw_free(struct snd_pcm_substream *substream)
@@ -96,7 +99,7 @@ static int asoc_sdw_mx8373_hw_free(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
-	return mx8373_enable_spk_pin(substream, false);
+	return asoc_sdw_mx8373_enable_spk_pin(substream, false);
 }
 
 static const struct snd_soc_ops max_98373_sdw_ops = {
@@ -142,3 +145,4 @@ int asoc_sdw_maxim_init(struct snd_soc_card *card,
 	}
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_maxim_init, SND_SOC_SDW_UTILS);
-- 
2.34.1


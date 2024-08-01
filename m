Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE19446F1
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:46:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D490D3653;
	Thu,  1 Aug 2024 10:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D490D3653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501976;
	bh=wZF5msvkReMqOaD9lENyucelsey8O5TFWxvA5TTaEio=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JmIiljPccufUFkxIMGrge42SYEUmqes+kTogVstXF2Ml/EAyvlPIQuUK4vT7EKGcF
	 JM+T9tRhyQLFdaWCVE0OOsv7CtKOoa3lgVPJ5KJ5hwxYKTl3DiwoMk2oawmrILusiu
	 dSevevc3CzcYhF85cxwd9T/3/ZgpbDeiDvDKuNVk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A3AFF8060C; Thu,  1 Aug 2024 10:44:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA26F805BA;
	Thu,  1 Aug 2024 10:44:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 068CFF8026A; Thu,  1 Aug 2024 08:34:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A529BF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A529BF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sExfNgI/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Umn7gONcbUdvY8WgNd56pDca3WY3XwG/28TwoWGc8u3QJnqwPNTIwV4XPMRxg6DD3ddLEMPCZxgOgnKtLQTMG6F47kXT4trRiUOqSTfdQluECDl2n4S6B1rY95qWz5nifz+5EjHeoN9QMr0FXTI4k4IP13CHTnm/OEP53eHdGCCnUrtKqZiNV/+yiXMFq1byj7ytUKvqeM4EAY1gJKjCfPCjfGsX7jWlcS9jattkCqRaNgimCbLgAFZz+tt92CPbjJfk7Eh6X8dM4uBOKZzW1Iv28jyyNTuYqysOzmAHK64ik+I9h19V+x+GnXHrVW83Fjl4fBd7dYWH/Ty22wcYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRwr1M8HYTTJ9pQI1KdXfbC6gSD4Lv3+HS0qRoT2L1s=;
 b=HBsTGh5SHS+riM/lA4F8ymKiP8fqjHdu8yVCISzixxG/y6ir+i/dj/jYJVE+vlc1nCn4rzSU5fojLVjnnZYJdjnzYgoGN7cy3mHcWer7n478OLGn3LsrzLKZRotjZA+7RpMm4IdnGaO3ho37qJhN2RL3kUSIde0PSu854jARTZmQNsSVusgFAzGhwXjCV+k/eeG47Qh/A+JARBmrY4YR02sn7YuVu60pG2drJHoUcRwHHWsG+brfCzpA4wk/GxwWNmZ66mfZlMg9p2uejuUG5CoyFYSuKAi5u9/yz78Ct53bTv2sDAtjYHKdYdwXnbfEuv4rvNdEq9Xd+nwSk8ogeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRwr1M8HYTTJ9pQI1KdXfbC6gSD4Lv3+HS0qRoT2L1s=;
 b=sExfNgI/bDJCWL0oL7p3FXyYXvkP9G3dtHY8GMuN4c7Me5EDyqOGh48fKPCB4VayeyZPtEL7/t5t49/AiJoWeEEKK4GTYKMzqnCszrJWmvHAm4H2nY5ejBTy754qO0PRwq2Pdjbo87wf3Filu1ot81jtBhH1Zx6kVCo2GLFW+1w=
Received: from BYAPR04CA0020.namprd04.prod.outlook.com (2603:10b6:a03:40::33)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:34:08 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:40:cafe::42) by BYAPR04CA0020.outlook.office365.com
 (2603:10b6:a03:40::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 06:34:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:34:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:34:07 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:34:00 -0500
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
Subject: [PATCH 20/31] ASoC: intel/sdw_utils: move maxim codec helper
 functions
Date: Thu, 1 Aug 2024 11:54:05 +0530
Message-ID: <20240801062416.2203673-21-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: 984799a2-075b-494f-fba5-08dcb1f3f27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mXGH20R2gYzSSxGVFAOPidvqTh6EkeZ1o69St2VH/fJzuZLXhYmmIiaT/ZRz?=
 =?us-ascii?Q?xHamcqFGr31YYW2oEFhIr8Jt8eYa1bsggh5LdylsfwoEwV1p2HMG518cPsPw?=
 =?us-ascii?Q?xSEvzVNJUx8aydlagg9LbwOr+YbuMuZrn+Dw+Xc3MwPAwdJhxd9fJGTqU7N+?=
 =?us-ascii?Q?2wsOB6tc1ed7CJrR7DzSoHfQuc1Wwf1CeCUQLLQfr1SFjRi3SjzsG/kSdJff?=
 =?us-ascii?Q?NhHPKfiRi3Rc2gHew2AHoS39oIPvsUWEo8HPz3qHhDrQ3q0ytRt2kDCKC2ut?=
 =?us-ascii?Q?U5kFDZ5KTRt7P6ijQfyJ03D5Tw0Ug7XprPIfMcRtICjIGRHnob7xHnipNXZt?=
 =?us-ascii?Q?1bveqRSUbS5vOSVguNb0d6NwIGcnx9Dn8h1anzsEISmK7Zq0a++MBNK+b1Pg?=
 =?us-ascii?Q?wLcdjcS9tDHnTU2v/teSRYI/EZ7k0vkUKnDfWoaBu+pg/GL1m5zW/0WI8myB?=
 =?us-ascii?Q?B38WS0ybLJ3c2AmxiVxbzBR+RCRFNwVjdN5w9FREybELsg+DKxYZG3yhlmDK?=
 =?us-ascii?Q?6q9YQzwRN0e1SmlYdgfMgW6ST1bERuq9O9pwMr7HnLC3SKm8n6yRDf6HD92R?=
 =?us-ascii?Q?3MHJq9gjs6xr+RQe5nXYl9Bb//i9yXaFPukvy0K4b5OBQKgC+phYXiwW0qu3?=
 =?us-ascii?Q?K7m5Pq9ux99+vy7wT2dkPcYHIJJQTHqMTTMwn5rfOVKJiqtuR+8HZMhb7Wav?=
 =?us-ascii?Q?FdMC5PQSt1CyRRNLzb1E5HAMXPZ9c2n72bj2Bp2ish06WNAHgYEb9I8gmxOQ?=
 =?us-ascii?Q?p14Loz1jxpkQh34ksbFZ+MJiea5RCFDlfcn+6My6EuXviLGQJIKkTbfgCGB2?=
 =?us-ascii?Q?VdJAJ2HXmyGq3PCK1K1fjR85CL/O6DbVpFZHywdMNODbgDcx/vM98mOW4Em5?=
 =?us-ascii?Q?b2tMTOj9QOWIfBT8X1K16bD2gqv+kJYATKRkEoBuo32FrWxaAsHTNNwRbICV?=
 =?us-ascii?Q?sLthXl7UDDg+8LgkUd0/suHWWHomnvB2K6GIBtEThL7PLdR8V+vKtQHWDbuX?=
 =?us-ascii?Q?w8Qo2OLDt2XxO99zwZLtnt97uQOhG0jAogfGbuKRfjuQikr/uQjARGQFELZ6?=
 =?us-ascii?Q?ijwJUe8bb8NSEctD54llYnNxxoEZT9uwBYBkPsPhBGaPyw2KKmdTKlOpWHxU?=
 =?us-ascii?Q?aB7+x0W2bacUO+0lm7EFz15v5t+TaNXXR0sDQpaVqTYaovuiZY8UAFu+ubNO?=
 =?us-ascii?Q?+Jo8OIgAcfKbxUuOhUvIgZ2KX6AdbwJFMiFXHIwz/G1AqHJolQMVFN7UaOzV?=
 =?us-ascii?Q?MGHc4loq1rV+D8Q0+5JBuc8OgavQnegA33WG8ggr31fCLoM7oDc3LTR28Z8O?=
 =?us-ascii?Q?3MyrmVoR+ibvM9NjwcctS78whbUmMTkeIMHaQgUGqACCkfynGdeOKgIhdtyk?=
 =?us-ascii?Q?SActPXAySX7DpCOucQ21f4QHsE+eQh7S/7S2r1JKlE/ZbRYyzA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:34:08.1495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 984799a2-075b-494f-fba5-08dcb1f3f27c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
Message-ID-Hash: Y5YJ2KWNBBCACFIRA5EIFAB5UWEDBU4X
X-Message-ID-Hash: Y5YJ2KWNBBCACFIRA5EIFAB5UWEDBU4X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5YJ2KWNBBCACFIRA5EIFAB5UWEDBU4X/>
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


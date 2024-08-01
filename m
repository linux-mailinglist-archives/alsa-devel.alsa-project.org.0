Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE169446DB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:44:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0351234D7;
	Thu,  1 Aug 2024 10:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0351234D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501820;
	bh=nelUTE3UCSrTjZfAXz+ulsgjGceDQrtX87jFBIIf/U4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=akk4bMlMsO/5IGfLuDnm9C3H0u9u3a/W1Fq0egvzD+NBdDRWGPj4E+B/iiU4ijiu2
	 KUZ2/oIhdj6+4Q2wCdVzE0BZcp4A64t1yaCWRzbeMyoGmVykoQNmJb/XkE0G2fideS
	 AMNnB5V2q6M+z4soPA8uBQAFAPTTbKIHOfUMxqP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBDE3F805B4; Thu,  1 Aug 2024 10:43:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 236E6F805A1;
	Thu,  1 Aug 2024 10:43:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE54CF8026A; Thu,  1 Aug 2024 08:29:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A407EF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A407EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lEg1Ildw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPis+2mriMgZ91Fe0dQvJGq3RrmmR11OP9M7MMAoddnG8El6NOvm5fhzK7WLX31tiKN/ZH6Zsfdm3hMUCwiY1AoZjNpr3OeA73bFpBBUtZ+Wx4cVL0XJvH7Ro9iq86fUrD5lQRfORRrXwEFviRc2wdfm74ueMmMTOIYIBSCpk8DSGyzTDnIb683lWf26j+wFf6uJwHX6M+mDa+TeaDV8QnQja5BkWSll2h9MpywggWzWWmzDrkaFnWD/PBWx0B2cK5yQygkOXWnPieWkatW5kRatluFvmz8QbgUWg0jG7OyVatrEXLrM9DsQ58Qhr24TA9FmMpdw8g+ViDvuGWgwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3h/1p+WbV/j7E5Ukqg9CVqE+GidDOg+hifcmtgW1fCc=;
 b=OeJvDV00Aw+nmZfZi2uLsM1GVaAcAdyfTrW/r0I15ZIOYesBUXJabKk/6qW3aGcx3U6z123UxmPW1Sjt2vcW4MhD3vN2Nh9WrPRyjX+NWUWS84wYl21D6wTcTpAM59l1vbUJ1ZWQTaQVCp4kisqaqBsEYufv9jCX1Jyj+x3vjbcIZhjNUkdfAWos6KhRG+aMi84dhrWdhs6r8FIfHn4QzpVqXpriuvigZocHzadecGHLE6Jba8kdvFB1VghP3hwoCXzgk5D9AZZecwMxdTvpheD3OdTO61nc25PVKrtztu17WoZtmxPh2s+uZrX0Okxp2Wzde4GCBaBZRQGmletpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h/1p+WbV/j7E5Ukqg9CVqE+GidDOg+hifcmtgW1fCc=;
 b=lEg1IldwV/J6bsbXZhLjj5pzDbEMtGh7bEpe1gZzY/7HCF3JUq8l1mY6+86D62W5bxjpCPtj8/smKu42RGmYM34cOIyQelX+aMJNqPfvIn9rebhOPq65HBHW9JdtrY+ZzW1WGGSRBbI1kgKpXv2f+gGzflh4k3scGlS9/dYuCq8=
Received: from BY5PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:1e0::32)
 by CYYPR12MB8939.namprd12.prod.outlook.com (2603:10b6:930:b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 06:29:12 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::51) by BY5PR03CA0022.outlook.office365.com
 (2603:10b6:a03:1e0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 06:29:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:29:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:29:10 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:29:04 -0500
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
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 11/31] ASoC: intel/sdw_utils: move rtk dmic helper functions
Date: Thu, 1 Aug 2024 11:53:56 +0530
Message-ID: <20240801062416.2203673-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|CYYPR12MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ccd2dd-7bb2-42fd-4cba-08dcb1f341ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ssm70Fi486mU1oXFQJXq3SlevZ8nCOzuXCKcz5/Bb2s9TPnuC6BTK3cYABCp?=
 =?us-ascii?Q?6S7hHxqWB1ub74rvUR5h0j/BWPbOoKOPdFstyX98Ruo5SgFSt4J9YQ4h6OtN?=
 =?us-ascii?Q?gDAZ8lCewNWDPXHH/FtyV9QULC66Jq9Ym26fhDNoclTT3NNyXVy0YQspC2p8?=
 =?us-ascii?Q?kBIU0ifHRHiKcDwjAUkSvkcwRH5sDMsgHmaF4nuj7nO6mKkDnvkcMlPWhbNx?=
 =?us-ascii?Q?m75QVU9PEwr38iawsaxnsjCazSRn+f8cxQWfWD8J1Y5NZyubJwmG3bEsu9GM?=
 =?us-ascii?Q?TGiew0tWhHRRumtPX+HFn1NfpSWOUK69/aAP51av4FUOhJfOviVd0GgGLFGP?=
 =?us-ascii?Q?2qTIfRsKCffsvxaDeBEaTQdjAB+4DyerwWyhsfP7NdRI+WBwgMBMuGs6Q4PW?=
 =?us-ascii?Q?XnTp2ZqpYUI15+JLsC36Hbx0VYodiVsN7G9zxo+8us6pkNqbCYlZFsCQQieK?=
 =?us-ascii?Q?/kgbLxPMygvHQi/YUW2bS2ATxNEN3qvGjCVAXDSxl+mFGu8YDG2WwX2614nw?=
 =?us-ascii?Q?+fv3qr6GDeUGvFL8YFiXkSB8Xr6R+LnBE8pCZGmtqYPdkLEHBIMsnXWMjF0b?=
 =?us-ascii?Q?GPeJ4fEc2S24v9a5rrDOF1R7q+byQS/kcyrPkF8cPv4DRGg8ojVNKKFGysof?=
 =?us-ascii?Q?eSZpOwOBXdUosx6N/cBIwRvwxgJv96ipsW2qxdV/ouI//+5ZS34rLM6mbY28?=
 =?us-ascii?Q?Z3pydQtiFOIB3DtOWpBR8Ms4U1eiEh7mcyUs0ik0wcJJv47RCdWE04RQVCe7?=
 =?us-ascii?Q?qViXzdtxj6Hq8oerMO2n2etmJV0lLKoKoJbu1xNLPEJ0oeqENm9s67dQVW82?=
 =?us-ascii?Q?NbUFwH+MMn/R66/c85VbL2Jm657zOWnW2mLJU4K+ZkuReZH4pPh879mos9vA?=
 =?us-ascii?Q?Pu/Ueme5Oma5simk55rvhrFuTJGLEsKuTKC8AQq5aTLKd7FDAjZBTKeengxG?=
 =?us-ascii?Q?pEqGePdBq/zKGEYHYZ3C3IAlkF9ujWn/veQy4NTki6/B4EG3glT5JQOgMi4f?=
 =?us-ascii?Q?6qvwd0BiB35YANN/i1jo/UoJlC2d+wzrNw9xSXJRWvnKjuTqrR8offrrzKJE?=
 =?us-ascii?Q?Jntr5wtJT0OMuYjgmZkPCqS3HRVCrglSfoZiCbidtRpErHhV38/FFsp87Fxt?=
 =?us-ascii?Q?x704OUuER36V2YECeSh8VCWMJ3b0d+SrPmomp1ruIpCAOV9UdzB46IKGIKIg?=
 =?us-ascii?Q?A0eupNPV3CqnIgdPjhJr7tgtDO0iBBauo2Mp7reJ3HIqINrLMCiyRch4LDLr?=
 =?us-ascii?Q?lY4va4XQY+THLFPdzlC0oSFByxaRJezLb8K6cOL0u8SpRffwwjFOMRMSTb8D?=
 =?us-ascii?Q?sGGOmhVG9yXc5+gse5VJsH6eaKqolPbzpe/anM3U315zhCiD7iuQ9Df57XuB?=
 =?us-ascii?Q?40gFAGo2Y95HDtjksgvjBxq83lDZLxqiZuFcBB45K9I6GjVfUw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:29:12.0624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67ccd2dd-7bb2-42fd-4cba-08dcb1f341ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8939
Message-ID-Hash: MSQ6TSLVJVOTD4TOIHWH4U64EDGVWDJR
X-Message-ID-Hash: MSQ6TSLVJVOTD4TOIHWH4U64EDGVWDJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSQ6TSLVJVOTD4TOIHWH4U64EDGVWDJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move rtk SoundWire dmic helper functions implementation to sdw_utils
folder to make it generic.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                            | 3 +++
 sound/soc/intel/boards/Makefile                          | 1 -
 sound/soc/intel/boards/sof_sdw_common.h                  | 1 -
 sound/soc/sdw_utils/Makefile                             | 2 +-
 .../sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c}    | 9 +++++----
 5 files changed, 9 insertions(+), 7 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c} (77%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 0ffbd9847532..9fa102fc03c3 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -72,4 +72,7 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 /* DMIC support */
 int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
+/* dai_link init callbacks */
+int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+
 #endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 8ac6f7b5fbee..dca8eecfa820 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -40,7 +40,6 @@ snd-soc-sof-sdw-y += sof_sdw.o				\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt722_sdca.o	\
-			sof_sdw_rt_dmic.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 81b654407651..73227ebf8e7b 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -162,7 +162,6 @@ int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index de8aff8744d8..2c8f70465a12 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o
+snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
similarity index 77%
rename from sound/soc/intel/boards/sof_sdw_rt_dmic.c
rename to sound/soc/sdw_utils/soc_sdw_rt_dmic.c
index 64960b059834..7f24806d809d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
@@ -1,16 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2024 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- * sof_sdw_rt_dmic - Helpers to handle Realtek SDW DMIC from generic machine driver
+ * soc_sdw_rt_dmic - Helpers to handle Realtek SDW DMIC from generic machine driver
  */
 
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include "sof_board_helpers.h"
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
@@ -39,4 +40,4 @@ int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 
 	return 0;
 }
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_dmic_rtd_init, SND_SOC_SDW_UTILS);
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F412294488E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8043C3BAC;
	Thu,  1 Aug 2024 11:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8043C3BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504924;
	bh=xij3naBl87+OREF9dc9kTrO34TLDnQQpaz8qw7uMZ1s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KCF3fge4h1e84/xmLTZOMEZW5oXlMZqROBdn+Htg2lQ6oN8xYX0LzafeL0InV2udM
	 q+NOOOnWZs339NPMZCnUqiugk7zGv23YG1FCZ6TVoLSzsRcHgZivIqt6FMYoxDFAlT
	 8EJfrWoaSEzga687UiBh/KCs+9rfvSAbRzt8n1gE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8282F80612; Thu,  1 Aug 2024 11:34:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E409F80605;
	Thu,  1 Aug 2024 11:34:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91ED2F8026A; Thu,  1 Aug 2024 11:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E25C8F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E25C8F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Oh4aPrxs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJNWv2o/8iAU8LWduqvGbZ3l0593+PrChianjuIB5rA++zp4aNH2FHi7Hs83o+e5MuSugi1bkbGD7+cEKCP61K6HnrN7SaI7bGUibQkCL87TBBCTUJUsRj3LIXG9PgbR+pV+XAGSnpiPfE7rc6kpHc0UZbAxTnbnNV8jwaUXXvCp/L9pMF0UOZPTEiEBLEkZ/44bpAKX2/nWErzbS484C7cfah38X/gYZIaLFBJ7xZBDgrHK7LPrwOSPSJ4qb3oecBmY+pMxw5zJWSiyS6s+X+mL7eFf9zpwwIt36A7Iu8GuaU4hrk1FFTQCDjQsZTj/N2AT+hGZgRgr+k58CV0dBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4NJX/xVdvB3sXXMqg8vz7h4Q1OLf3RVEKnXa41Cz+c=;
 b=RhA/QzgtdHmBvmAj8WZeBXSlcct/LIwsfR7yyBfh7xECszauGlfQ+lR5+1Co5qtPPCHbq0LO3RKpBbc4xdyknjs9oLe6BRlpfQcVhWWwAy6hRTgqbzdioW4QpGwQG96M+PsQ1yxH3lP3+DBIswAAp8G6bZSyoPCOl1VZRcDXRxfP0Y1613XB53C5Ipb1RiQwiIC/dyXnj1y21wVIl3VT3s2uPsg71e4bmk78nXwi/2O95JxOO6uytH7GGMos3sSDH63HHbsYou0mnZ1cSAZtcmFStvd3Sh4BPRYqhYzKWsqucBxqO0s0D429N6lZlNI6xVSMC4pS9izQIDJNEezwhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4NJX/xVdvB3sXXMqg8vz7h4Q1OLf3RVEKnXa41Cz+c=;
 b=Oh4aPrxsFhC0/hqjxkCFu/Jx79YmEEm0PuzW5NoLgMwcRHaKZnsAN87uBM82sWGR4vv0IIYbWbRJK+hnxXMQvkaCReeiuxv1BhbuPSkcgYhkxclB/END0h0Emaux0NVX++YsZkYgG3ueX5v9nv/fxTKA86C2c+/JdCpnU/Wnh7U=
Received: from CY8PR12CA0011.namprd12.prod.outlook.com (2603:10b6:930:4e::14)
 by IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 09:21:27 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:930:4e:cafe::28) by CY8PR12CA0011.outlook.office365.com
 (2603:10b6:930:4e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:21:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:21:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:21:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:21:25 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:21:18 -0500
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
	<kai.vehmanen@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Chao Song <chao.song@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>, jairaj-arava <jairaj.arava@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Brent Lu
	<brent.lu@intel.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 14/31] ASoC: intel: split soundwire machine driver
 private data
Date: Thu, 1 Aug 2024 14:44:29 +0530
Message-ID: <20240801091446.10457-15-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e5dea1-d918-418d-8dca-08dcb20b523d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kc8j6xu+la4G3jfPDzSZ0q3n0NOHATTGZsTuF1cgEwx5A0aReE64y51nMmvG?=
 =?us-ascii?Q?Vg/Y9ITai2gDR1sqB1VW5EQ2OunTBUwTc8KzbKmkv67I7+j5B1G5sQLaSQhA?=
 =?us-ascii?Q?0tMhsZZi8ppv0/k3w7QzTq4hJL8mE9eUgL+5jHlyaSYgEG44M7ZssDY4ImOj?=
 =?us-ascii?Q?RlmjQObiKnYO6XvoYe2Plz4453OjH3HDU4/AQV4MZjtOlsRTcJy4NYD7rnvr?=
 =?us-ascii?Q?pA6cE6DtrigiqheZOxcVn9F+febghryXcznjSyOuJ/sHXWlNMh8W/Gw9oFS5?=
 =?us-ascii?Q?thBBwJHVfjvLnBQk25FMrn54lr40XmKucdnUm9hTh4CRCmQ9ELrvJXhWN89H?=
 =?us-ascii?Q?Gnz51Hwl1dlX/ebHl6NCYl1ZDAjaWo2SgCSvloSvm5DbhXqvnRy5nNRGHhiK?=
 =?us-ascii?Q?Xvs+SBKT92KE+SMUE6yZqcbA+32mXyX8OQRrRr9aEb2WrIYEx2SU+Uw6IjbD?=
 =?us-ascii?Q?lh9zvcjv/ZcKpDn+DYLoSLEnfnWWDVguneQl/mXZZY/ta7MrBOT/H+QEddJz?=
 =?us-ascii?Q?s7hPdz++a7a1D1R/1plu1sF6oIViKPsWZEohI89xIki6+tTNI6pdvrISzSfr?=
 =?us-ascii?Q?PJ5a0riF3jN55ou7M8vazbmylcyqWuFf0ypoiUSdN/KjPjvCf7etPOVSnnc5?=
 =?us-ascii?Q?v4xMCB4Epsr4SjqaQsq8TuC7kc5hsCBOj2fHzuH9unn2PxRAKO5TqMqNTMPJ?=
 =?us-ascii?Q?mYWPW3D2cMTVCl+Flj5qDKvb+msk0ahQmQxKUecrwil5kKXxRDRcBHD3UabS?=
 =?us-ascii?Q?WRvKf/S6lnPkbawbfU+uIwfKEL9PoDgr7WZSRsmAgRrrBA9gr0xP/7SabrAY?=
 =?us-ascii?Q?s5X9L13ZfczzhHpEHGIAItY0IqAPa26g3xS4IKnamX9tq214miyDzbTWXFlH?=
 =?us-ascii?Q?vMf1dnAfpNtzHRCrgAxDuL/v9H7kXybHS5/STLMqVS3RH1sXJgAQY4W9BIEr?=
 =?us-ascii?Q?Q0NBdDmJKfH5J6go9v5bDqcCuKnfZrtqelc2ebL3hS6h8zO+g+mzUGnKp4JG?=
 =?us-ascii?Q?2YS8oPr5d7ZG8Qh5iEGs+5fSrVn78tRzjwvcbX2tprMalAMVE1cQQgwoUKxJ?=
 =?us-ascii?Q?s7WObcTPIpd4vrAMWbJj/JW/v1ZBtney39TyVz69lhkpyWN77xs8MGsFuUNf?=
 =?us-ascii?Q?nq01Rbj2TcjeSwbCy+JYmXTkBC6aQIHGwkM+q/TO1zpRGtw06kGCfy/B8CoL?=
 =?us-ascii?Q?N0M38C5RuWVGktmrWQ+sXHVN1gJNh8GiGwZ9kDTSu4C4ocnV+fQfjCKboYKO?=
 =?us-ascii?Q?A50YatZuCHABOT9ass2W5X2fxSFkZ3CL96I6vPIZ+ku9wul+oKL1WoX0+T0M?=
 =?us-ascii?Q?tTmr1OQUHSURtnW1plM07KyzzABbt1PNdeaEmiwMA//34UAtrojUb8ACat+S?=
 =?us-ascii?Q?OeiHjpukuSV9igh/BDmLlkoII3cLi11iNSiRV91vHhydoje6Yg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:21:27.1886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77e5dea1-d918-418d-8dca-08dcb20b523d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908
Message-ID-Hash: OCSN2QJSBRYCB5XDYM5DPAG2WWPUWH7Z
X-Message-ID-Hash: OCSN2QJSBRYCB5XDYM5DPAG2WWPUWH7Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCSN2QJSBRYCB5XDYM5DPAG2WWPUWH7Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Split intel generic SoundWire machine driver private data into two
structures. One structure is generic one which can be used by other
platform machine driver and the other one is intel specific one.
Move generic machine driver private data to soc_sdw_utils.h.
Define a void pointer in generic machine driver private data structure
and assign the vendor specific structure in mc_probe() call.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                 | 10 +++++
 sound/soc/intel/boards/sof_sdw.c              | 37 ++++++++++++-------
 sound/soc/intel/boards/sof_sdw_common.h       |  8 +---
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  2 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  2 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c         | 14 ++++---
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  6 +--
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  4 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  6 +--
 11 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 5bc2a89bced4..eb713cdf4079 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -55,6 +55,16 @@ struct asoc_sdw_codec_info {
 			    struct snd_soc_codec_conf **codec_conf);
 };
 
+struct asoc_sdw_mc_private {
+	struct snd_soc_card card;
+	struct snd_soc_jack sdw_headset;
+	struct device *headset_codec_dev; /* only one headset per card */
+	struct device *amp_dev1, *amp_dev2;
+	bool append_dai_type;
+	bool ignore_internal_dmic;
+	void *private;
+};
+
 int asoc_sdw_startup(struct snd_pcm_substream *substream);
 int asoc_sdw_prepare(struct snd_pcm_substream *substream);
 int asoc_sdw_prepare(struct snd_pcm_substream *substream);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e1d2b744987f..236e3fab66b9 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1319,7 +1319,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			       int *num_devs)
 {
 	struct device *dev = card->dev;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link;
@@ -1440,7 +1440,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      int *be_id, struct snd_soc_codec_conf **codec_conf)
 {
 	struct device *dev = card->dev;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	struct sof_sdw_endpoint *sof_end;
 	int stream;
 	int ret;
@@ -1519,7 +1520,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 			if (cur_link != sof_end->link_mask) {
 				int link_num = ffs(sof_end->link_mask) - 1;
-				int pin_num = ctx->sdw_pin_index[link_num]++;
+				int pin_num = intel_ctx->sdw_pin_index[link_num]++;
 
 				cur_link = sof_end->link_mask;
 
@@ -1573,11 +1574,12 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 			       struct sof_sdw_dailink *sof_dais,
 			       struct snd_soc_codec_conf **codec_conf)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	int ret, i;
 
 	for (i = 0; i < SDW_MAX_LINKS; i++)
-		ctx->sdw_pin_index[i] = SOC_SDW_INTEL_BIDIR_PDI_BASE;
+		intel_ctx->sdw_pin_index[i] = SOC_SDW_INTEL_BIDIR_PDI_BASE;
 
 	/* generate DAI links by each sdw link */
 	while (sof_dais->initialised) {
@@ -1665,7 +1667,8 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 				int hdmi_num)
 {
 	struct device *dev = card->dev;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	int i, ret;
 
 	for (i = 0; i < hdmi_num; i++) {
@@ -1673,7 +1676,7 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
 		char *codec_name, *codec_dai_name;
 
-		if (ctx->hdmi.idisp_codec) {
+		if (intel_ctx->hdmi.idisp_codec) {
 			codec_name = "ehdaudio0D2";
 			codec_dai_name = devm_kasprintf(dev, GFP_KERNEL,
 							"intel-hdmi-hifi%d", i + 1);
@@ -1721,7 +1724,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
 	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, bt_num = 0;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct snd_soc_codec_conf *codec_conf;
 	struct asoc_sdw_codec_info *ssp_info;
@@ -1773,7 +1777,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	if (mach_params->codec_mask & IDISP_CODEC_MASK)
-		ctx->hdmi.idisp_codec = true;
+		intel_ctx->hdmi.idisp_codec = true;
 
 	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
 		hdmi_num = SOF_TGL_HDMI_COUNT;
@@ -1789,7 +1793,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d, bt: %d\n",
 		sdw_be_num, ssp_num, dmic_num,
-		ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
+		intel_ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
 
 	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
 	if (!codec_conf) {
@@ -1862,7 +1866,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	int ret = 0;
 	int i;
 
@@ -1875,7 +1880,7 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 		}
 	}
 
-	if (ctx->hdmi.idisp_codec)
+	if (intel_ctx->hdmi.idisp_codec)
 		ret = sof_sdw_hdmi_card_late_probe(card);
 
 	return ret;
@@ -1934,16 +1939,22 @@ static int mc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
 	struct snd_soc_card *card;
-	struct mc_private *ctx;
+	struct asoc_sdw_mc_private *ctx;
+	struct intel_mc_ctx *intel_ctx;
 	int amp_num = 0, i;
 	int ret;
 
 	dev_dbg(&pdev->dev, "Entry\n");
 
+	intel_ctx = devm_kzalloc(&pdev->dev, sizeof(*intel_ctx), GFP_KERNEL);
+	if (!intel_ctx)
+		return -ENOMEM;
+
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->private = intel_ctx;
 	card = &ctx->card;
 	card->dev = &pdev->dev;
 	card->name = "soundwire";
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index c7672dc1320c..7954472c11bb 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -78,16 +78,10 @@ enum {
 #define SOC_SDW_DAI_TYPE_AMP		1
 #define SOC_SDW_DAI_TYPE_MIC		2
 
-struct mc_private {
-	struct snd_soc_card card;
-	struct snd_soc_jack sdw_headset;
+struct intel_mc_ctx {
 	struct sof_hdmi_private hdmi;
-	struct device *headset_codec_dev; /* only one headset per card */
-	struct device *amp_dev1, *amp_dev2;
 	/* To store SDW Pin index for each SoundWire link */
 	unsigned int sdw_pin_index[SDW_MAX_LINKS];
-	bool append_dai_type;
-	bool ignore_internal_dmic;
 };
 
 extern unsigned long sof_sdw_quirk;
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index d28477c50469..3ce2f65f994a 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -39,7 +39,7 @@ static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index bb371b2649cf..47d05fe7de53 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -51,7 +51,7 @@ static struct snd_soc_jack_pin sof_jack_pins[] = {
 int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &ctx->sdw_headset;
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index f34fabdf9d93..4084119a9a5f 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -17,23 +17,25 @@
 
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	ctx->hdmi.hdmi_comp = dai->component;
+	intel_ctx->hdmi.hdmi_comp = dai->component;
 
 	return 0;
 }
 
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 
-	if (!ctx->hdmi.idisp_codec)
+	if (!intel_ctx->hdmi.idisp_codec)
 		return 0;
 
-	if (!ctx->hdmi.hdmi_comp)
+	if (!intel_ctx->hdmi.hdmi_comp)
 		return -EINVAL;
 
-	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
+	return hda_dsp_hdmi_build_controls(card, intel_ctx->hdmi.hdmi_comp);
 }
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 3584638e2192..7e52720e0195 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -38,7 +38,7 @@ static struct snd_soc_jack_pin rt5682_jack_pins[] = {
 int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index a90d69573736..0abaaeacfd90 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -36,7 +36,7 @@ static struct snd_soc_jack_pin rt700_jack_pins[] = {
 int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index e4d300d7d5ef..fb5bc611b5e7 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -62,7 +62,7 @@ static struct snd_soc_jack_pin rt711_jack_pins[] = {
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
@@ -113,7 +113,7 @@ int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 
 	if (!ctx->headset_codec_dev)
 		return 0;
@@ -129,7 +129,7 @@ int asoc_sdw_rt711_init(struct snd_soc_card *card,
 			struct asoc_sdw_codec_info *info,
 			bool playback)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
 	int ret;
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 4cf392c84cc7..fff746671c1d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -239,7 +239,7 @@ const struct snd_soc_ops soc_sdw_rt1308_i2s_ops = {
 
 int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 
 	if (ctx->amp_dev1) {
 		device_remove_software_node(ctx->amp_dev1);
@@ -259,7 +259,7 @@ int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
 			 struct asoc_sdw_codec_info *info,
 			 bool playback)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev1, *sdw_dev2;
 	int ret;
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index d84aec2b4c78..8059e483835d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -86,7 +86,7 @@ static const char * const need_sdca_suffix[] = {
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
@@ -163,7 +163,7 @@ int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 
 int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 
 	if (!ctx->headset_codec_dev)
 		return 0;
@@ -183,7 +183,7 @@ int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			       struct asoc_sdw_codec_info *info,
 			       bool playback)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
 	int ret;
 
-- 
2.34.1


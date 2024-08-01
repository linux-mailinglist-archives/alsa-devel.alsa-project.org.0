Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9D944874
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:32:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F52385D;
	Thu,  1 Aug 2024 11:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F52385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504701;
	bh=OOfg8tkbJLzoJgO5JTTXrI0kZwxWgXWhiT0Ax3KckYI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BLMLcVIxjZf1qmvQ0yBZwyAJdT4D7CDRpxJnX3W5azIvEeSJTMeaCqAdBOfPTpR2C
	 +DVVCyx1+ulXyXVXT+Ozxra+wMtYxEx9RtHkgAxuD0T7pnJXd1bLDVRopUW9FTb6vz
	 CSZK313PLUOiLKVMRSIt9B2iKt+fx4IpHTBQRyBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33883F8063C; Thu,  1 Aug 2024 11:30:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3718F8063B;
	Thu,  1 Aug 2024 11:30:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66B55F8026A; Thu,  1 Aug 2024 11:17:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D7D7F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D7D7F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h/uBE+Ln
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8WqA+b5vBXukXTIbRBrk0TCXc4nacRivUy8Qro9SjpAC65KGITdzfr3nc3dTy8D0uha3ChoiyBQ5u3nj5D1O6x9rmsQaQjNW4YToFpenq6us/nT98vvcCAzM1tLG0PlPYc/Q+dOFt8pWE3MwIO7dMZ+iBxk7Yo74rZOIlle4dSnG5PCbpzBB4E6mfKIYBSOTp0f2+B+J7gSWPopFZ5OI3XSNXSx6RsRRTbd8L14kr2GJBQdjkUmmoNn3gKCuM5yKevUPtKWY1bs8uk5EiVvj1cbmUEsTfZjGNTUTzGLN0khRMmCdQw2woBYwCeKFFF1l2QyuJylcjkpNYrHLuwPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFa3Pog6ZiXET4635aNpUlAaMrc7TXECglk3ZuIN4/I=;
 b=TON1JTpDQKcKUOkK0TCNCWBMHJD3dKJK2GN8dFQJ9t5VW6BoK0zprjmwVwvsbWmv4Sq0xx98/2L0XAmPHtwJhOmQ7wUPIcU+NpoQfwVQUdyQ3eNlyKNcalGLQ4m5WMks8yFBLoT5Gd6xltRDM7ja+88LWV/DGA6mWgNOknThTXJgj30ighhQKLelGt1IwRN+1STmQaJZN0eq0fDh/Iu5Kp8UGeJcymmM1HMwBSLq2Zo7JdfmpUtMb47wfcR2NEGaLtnOKFJb+zd4W91e3QXYJ04xGspCYBpPyqZHWAprNo2xyuWUJXXlPw4kNhXaK90BMJbrp+2SpHnqnUYXym4TtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFa3Pog6ZiXET4635aNpUlAaMrc7TXECglk3ZuIN4/I=;
 b=h/uBE+LnDGgOxVMoOa6unqRDNJrL8W9yfGZw9q3Usj7cBG4AlQClNMTgc/T5F+yZOdyhybtL3PRWeBxqmXVvyASFR4jWvWt3kgzrX9ZiNea80y2Rg0hVdxKbC7LpV0yjzmZekESmFb+S096TH2dKQrg48zIEKXz0XkAF9z/D9T0=
Received: from DM6PR02CA0156.namprd02.prod.outlook.com (2603:10b6:5:332::23)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:17:41 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::30) by DM6PR02CA0156.outlook.office365.com
 (2603:10b6:5:332::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 09:17:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:17:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:17:38 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:17:29 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Cezary Rojewski
	<cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	"Maciej Strozek" <mstrozek@opensource.cirrus.com>, Chao Song
	<chao.song@linux.intel.com>, jairaj-arava <jairaj.arava@intel.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Brent Lu <brent.lu@intel.com>, Rander Wang
	<rander.wang@intel.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 04/31] ASoC: intel: rename soundwire codec helper
 functions
Date: Thu, 1 Aug 2024 14:44:19 +0530
Message-ID: <20240801091446.10457-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4ce275-aafd-42aa-f4c3-08dcb20acb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MGB1jwGkrj0pUT852trwN7wxrYPWQf7e80hHP1gT0hUR6j76agrULcX/7h+w?=
 =?us-ascii?Q?IJ2yAVJ6N73l0Yc676eCYFBqqbaKHWIWYLoJUCkm/4h6vskb/JqRC3Du9s62?=
 =?us-ascii?Q?4uVgPG6RBaxog1M9TsOI2Ps2fdrrQSvEFW4u19vhV9HK5QfWHPCqH/3dG26O?=
 =?us-ascii?Q?yGyeQHQt0WtTHdU+kbgXgpS4zyWoSe+w/2VCme0qp2PqMCoxbHXuZ9sjuS+z?=
 =?us-ascii?Q?O/EkQDeUNIDpiuMPG5qthbOlJDlbHmWOy3qRrQQ8mL85bxLEBMfdPRJf7iY3?=
 =?us-ascii?Q?F4AlE5UajSZnJiPkVC/K0Am0kApLi+OYQ9UCr0uwb8M+wyK+TYgFVOocGsbr?=
 =?us-ascii?Q?Mk9jLuiUFYskqhRQUEZEgA4mPLoMPxuI6Jxyqs28Jpz9mR51qdnKo2ehpngd?=
 =?us-ascii?Q?NKQzfjNeYCbh9CQTRXmkvLsU0sh62xtsC/KkHPtuBCsJhMqnGqgAApIgQrHz?=
 =?us-ascii?Q?7KzFG3GzADlCTl9QQGj7qY3LCwzEgom3SOIsYQMkZah5MXhfTE/m6Vqo+tpK?=
 =?us-ascii?Q?0ILbq9QvpyvUuBfBXrcthkxaeoeJJHCdo3Ot3PGnmcNlwrvomXWtEgZ8D26A?=
 =?us-ascii?Q?xHHhx5WbPViIJ05PmYALOnkXQ/m+YNt/gSAZPHzsLXwjik2PrWyRXfyVQuWl?=
 =?us-ascii?Q?fBAvMCPGHDSW4eAczfnujxy6tS1bEQUmld57ArjZEvVb2cLiya8SI1Mc8ao1?=
 =?us-ascii?Q?7T1Ln9MSbjKZsPcc863IRB182Kk7jSrL/AfY77RUveULEBk7TNKQEkjtnnF7?=
 =?us-ascii?Q?g+gSVVy+u2kzEU4MRjALRwrPRgLIQfZ7cYWlOXeedYGwmntE4ybQGwLVIWv5?=
 =?us-ascii?Q?nkC2OU24xj1Cm9hBYAHdN5sFHI2Kcz7Qw6tPURg6r10djwSZyFYjqMKuwj77?=
 =?us-ascii?Q?N5NWNFRXa5um82obAd/4N4gzOcAiuSvLtrDNnj8DUnhU19Z7TrI1tcyBBxk+?=
 =?us-ascii?Q?U6NhP49TPOzap95FRku25zZ5U7ZL4dOOrIJe4MmJDczwKWMtdfWz7whWM0uN?=
 =?us-ascii?Q?p81cVr2nQmIfif7Bx+3oNQqW8f5Cf/GUBd7ZeV6xYKSy9vbGW0WPHxuk1q2U?=
 =?us-ascii?Q?cdJCNfmltpOdLsqKdMzoOn3kGcu9q19ptuI0+54V0DJmkejjRQeKyKOhOHVj?=
 =?us-ascii?Q?ream2lTDHIx1YLzBEXDtPbv89OQACIRkJuuGOBCU3/wYnVtWCPLC0L6DYsoO?=
 =?us-ascii?Q?xvoyXVFyhPPD6c0lfAqdNQJw/0c5qMsv+2XaTuQICGHExyJGmHrfwhIeB3dl?=
 =?us-ascii?Q?eRYA9q5obG8lJ22goTh9APlT4wyk6doecGIaXocFAaoqSQ1AI/mqSnrIIG6e?=
 =?us-ascii?Q?o3a/UsxJO5rLFTAE1eQzlc+YiqS21xUuguDxBtcorQ0Z6a74Asg7cQupOyhH?=
 =?us-ascii?Q?wgl08Gad059Pn/7oUylFQjirxT2APDszAtKhfgF97IsVgIKyYg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:17:41.3759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c4ce275-aafd-42aa-f4c3-08dcb20acb96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
Message-ID-Hash: TZZA7DAK7KRIUMM4ATOCPQWR7YZFPOXT
X-Message-ID-Hash: TZZA7DAK7KRIUMM4ATOCPQWR7YZFPOXT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZZA7DAK7KRIUMM4ATOCPQWR7YZFPOXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename SoundWire codec helper functions with "asoc_sdw" tag.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bridge_cs35l56.c       |  18 +-
 sound/soc/intel/boards/sof_sdw.c              | 154 +++++++++---------
 sound/soc/intel/boards/sof_sdw_common.h       | 104 ++++++------
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |   2 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  16 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  10 +-
 sound/soc/intel/boards/sof_sdw_dmic.c         |   2 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |  22 +--
 sound/soc/intel/boards/sof_sdw_rt5682.c       |   2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |   2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  12 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |   2 +-
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |   2 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  14 +-
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |   2 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  12 +-
 16 files changed, 188 insertions(+), 188 deletions(-)

diff --git a/sound/soc/intel/boards/bridge_cs35l56.c b/sound/soc/intel/boards/bridge_cs35l56.c
index 6b2526c781e5..55e5cfbb2f14 100644
--- a/sound/soc/intel/boards/bridge_cs35l56.c
+++ b/sound/soc/intel/boards/bridge_cs35l56.c
@@ -95,8 +95,8 @@ static const struct snd_soc_dai_link bridge_dai_template = {
 	SND_SOC_DAILINK_REG(bridge_dai),
 };
 
-int bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
-				 int *num_dais, int *num_devs)
+int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
+					  int *num_dais, int *num_devs)
 {
 	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS) {
 		(*num_dais)++;
@@ -106,9 +106,9 @@ int bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
 	return 0;
 }
 
-int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
-			       struct snd_soc_dai_link **dai_links,
-			       struct snd_soc_codec_conf **codec_conf)
+int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
+					struct snd_soc_dai_link **dai_links,
+					struct snd_soc_codec_conf **codec_conf)
 {
 	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS) {
 		**dai_links = bridge_dai_template;
@@ -125,10 +125,10 @@ int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 	return 0;
 }
 
-int bridge_cs35l56_spk_init(struct snd_soc_card *card,
-			    struct snd_soc_dai_link *dai_links,
-			    struct asoc_sdw_codec_info *info,
-			    bool playback)
+int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
+				     struct snd_soc_dai_link *dai_links,
+				     struct asoc_sdw_codec_info *info,
+				     bool playback)
 {
 	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS)
 		info->amp_num += ARRAY_SIZE(bridge_cs35l56_name_prefixes);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9395daf220e9..64418976aba4 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -740,7 +740,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt700-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = rt700_rtd_init,
+				.rtd_init = asoc_sdw_rt700_rtd_init,
 				.controls = rt700_controls,
 				.num_controls = ARRAY_SIZE(rt700_controls),
 				.widgets = rt700_widgets,
@@ -758,9 +758,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt711-sdca-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt_sdca_jack_init,
-				.exit = sof_sdw_rt_sdca_jack_exit,
-				.rtd_init = rt_sdca_jack_rtd_init,
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -778,9 +778,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt711-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt711_init,
-				.exit = sof_sdw_rt711_exit,
-				.rtd_init = rt711_rtd_init,
+				.init = asoc_sdw_rt711_init,
+				.exit = asoc_sdw_rt711_exit,
+				.rtd_init = asoc_sdw_rt711_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -798,9 +798,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt_sdca_jack_init,
-				.exit = sof_sdw_rt_sdca_jack_exit,
-				.rtd_init = rt_sdca_jack_rtd_init,
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -811,9 +811,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt712_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt712_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -831,7 +831,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -845,9 +845,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt_sdca_jack_init,
-				.exit = sof_sdw_rt_sdca_jack_exit,
-				.rtd_init = rt_sdca_jack_rtd_init,
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -865,7 +865,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -879,9 +879,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt1308-aif",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt_amp_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -889,7 +889,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.ops = &sof_sdw_rt1308_i2s_ops,
+		.ops = &soc_sdw_rt1308_i2s_ops,
 	},
 	{
 		.part_id = 0x1316,
@@ -899,9 +899,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt1316-aif",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt_amp_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -918,9 +918,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt1318-aif",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt_amp_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -939,7 +939,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-sdca-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -954,7 +954,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-sdca-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -969,7 +969,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -984,7 +984,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -998,9 +998,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt722-sdca-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt_sdca_jack_init,
-				.exit = sof_sdw_rt_sdca_jack_exit,
-				.rtd_init = rt_sdca_jack_rtd_init,
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -1012,9 +1012,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt722-sdca codec driver*/
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt722_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt722_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -1025,7 +1025,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt722-sdca-aif3",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 3,
@@ -1038,8 +1038,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "max98373-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_maxim_init,
-				.rtd_init = maxim_spk_rtd_init,
+				.init = asoc_sdw_maxim_init,
+				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
 				.controls = maxim_controls,
 				.num_controls = ARRAY_SIZE(maxim_controls),
 				.widgets = maxim_widgets,
@@ -1056,8 +1056,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "max98363-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_maxim_init,
-				.rtd_init = maxim_spk_rtd_init,
+				.init = asoc_sdw_maxim_init,
+				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
 				.controls = maxim_controls,
 				.num_controls = ARRAY_SIZE(maxim_controls),
 				.widgets = maxim_widgets,
@@ -1074,7 +1074,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt5682-sdw",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = rt5682_rtd_init,
+				.rtd_init = asoc_sdw_rt5682_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -1091,8 +1091,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs35l56-sdw1",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_cs_amp_init,
-				.rtd_init = cs_spk_rtd_init,
+				.init = asoc_sdw_cs_amp_init,
+				.rtd_init = asoc_sdw_cs_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -1109,7 +1109,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l42-sdw",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = cs42l42_rtd_init,
+				.rtd_init = asoc_sdw_cs42l42_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -1121,15 +1121,15 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x4243,
 		.codec_name = "cs42l43-codec",
-		.count_sidecar = bridge_cs35l56_count_sidecar,
-		.add_sidecar = bridge_cs35l56_add_sidecar,
+		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
+		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
 		.dais = {
 			{
 				.direction = {true, false},
 				.dai_name = "cs42l43-dp5",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.rtd_init = cs42l43_hs_rtd_init,
+				.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -1140,7 +1140,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l43-dp1",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = cs42l43_dmic_rtd_init,
+				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
 				.widgets = generic_dmic_widgets,
 				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
 			},
@@ -1155,8 +1155,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l43-dp6",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_cs42l43_spk_init,
-				.rtd_init = cs42l43_spk_rtd_init,
+				.init = asoc_sdw_cs42l43_spk_init,
+				.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -1220,7 +1220,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 };
 
-static struct asoc_sdw_codec_info *find_codec_info_part(const u64 adr)
+static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 {
 	unsigned int part_id, sdw_version;
 	int i;
@@ -1241,7 +1241,7 @@ static struct asoc_sdw_codec_info *find_codec_info_part(const u64 adr)
 
 }
 
-static struct asoc_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
+static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_acpi(const u8 *acpi_id)
 {
 	int i;
 
@@ -1255,8 +1255,8 @@ static struct asoc_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
 	return NULL;
 }
 
-static struct asoc_sdw_codec_info *find_codec_info_dai(const char *dai_name,
-						       int *dai_index)
+static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_dai(const char *dai_name,
+								int *dai_index)
 {
 	int i, j;
 
@@ -1320,12 +1320,12 @@ static int init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai
 	return 0;
 }
 
-static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
-			     unsigned int sdw_version,
-			     unsigned int mfg_id,
-			     unsigned int part_id,
-			     unsigned int class_id,
-			     int index_in_link)
+static bool asoc_sdw_is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
+				      unsigned int sdw_version,
+				      unsigned int mfg_id,
+				      unsigned int part_id,
+				      unsigned int class_id,
+				      int index_in_link)
 {
 	int i;
 
@@ -1354,10 +1354,10 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 	return true;
 }
 
-static const char *get_codec_name(struct device *dev,
-				  const struct asoc_sdw_codec_info *codec_info,
-				  const struct snd_soc_acpi_link_adr *adr_link,
-				  int adr_index)
+static const char *asoc_sdw_get_codec_name(struct device *dev,
+					   const struct asoc_sdw_codec_info *codec_info,
+					   const struct snd_soc_acpi_link_adr *adr_link,
+					   int adr_index)
 {
 	u64 adr = adr_link->adr_d[adr_index].adr;
 	unsigned int sdw_version = SDW_VERSION(adr);
@@ -1369,8 +1369,8 @@ static const char *get_codec_name(struct device *dev,
 
 	if (codec_info->codec_name)
 		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
-	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
-				  class_id, adr_index))
+	else if (asoc_sdw_is_unique_device(adr_link, sdw_version, mfg_id, part_id,
+					   class_id, adr_index))
 		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x",
 				      link_id, mfg_id, part_id, class_id);
 	else
@@ -1380,7 +1380,7 @@ static const char *get_codec_name(struct device *dev,
 	return NULL;
 }
 
-static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
+static int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct asoc_sdw_codec_info *codec_info;
@@ -1390,7 +1390,7 @@ static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	int i;
 
 	for_each_rtd_codec_dais(rtd, i, dai) {
-		codec_info = find_codec_info_dai(dai->name, &dai_index);
+		codec_info = asoc_sdw_find_codec_info_dai(dai->name, &dai_index);
 		if (!codec_info)
 			return -EINVAL;
 
@@ -1538,13 +1538,13 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 				return -EINVAL;
 			}
 
-			codec_info = find_codec_info_part(adr_dev->adr);
+			codec_info = asoc_sdw_find_codec_info_part(adr_dev->adr);
 			if (!codec_info)
 				return -EINVAL;
 
 			ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
 
-			codec_name = get_codec_name(dev, codec_info, adr_link, i);
+			codec_name = asoc_sdw_get_codec_name(dev, codec_info, adr_link, i);
 			if (!codec_name)
 				return -ENOMEM;
 
@@ -1736,7 +1736,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		init_dai_link(dev, *dai_links, be_id, name, playback, capture,
 			      cpus, num_cpus, codecs, num_codecs,
-			      sof_sdw_rtd_init, &sdw_ops);
+			      asoc_sdw_rtd_init, &sdw_ops);
 
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
@@ -1831,7 +1831,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
 				   0, 1, // DMIC only supports capture
 				   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
-				   sof_sdw_dmic_init, NULL);
+				   asoc_sdw_dmic_init, NULL);
 	if (ret)
 		return ret;
 
@@ -1840,7 +1840,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
 				   0, 1, // DMIC only supports capture
 				   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
-				   /* don't call sof_sdw_dmic_init() twice */
+				   /* don't call asoc_sdw_dmic_init() twice */
 				   NULL, NULL);
 	if (ret)
 		return ret;
@@ -1956,7 +1956,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	 * system only when I2S mode is supported, not sdw mode.
 	 * Here check ACPI ID to confirm I2S is supported.
 	 */
-	ssp_info = find_codec_info_acpi(mach->id);
+	ssp_info = asoc_sdw_find_codec_info_acpi(mach->id);
 	if (ssp_info) {
 		ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
 		ssp_num = hweight_long(ssp_mask);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index e88b5627560b..28db2f1c6dae 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -148,75 +148,75 @@ int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card);
 
 /* DMIC support */
-int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
+int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
 /* RT711 support */
-int sof_sdw_rt711_init(struct snd_soc_card *card,
-		       struct snd_soc_dai_link *dai_links,
-		       struct asoc_sdw_codec_info *info,
-		       bool playback);
-int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+int asoc_sdw_rt711_init(struct snd_soc_card *card,
+			struct snd_soc_dai_link *dai_links,
+			struct asoc_sdw_codec_info *info,
+			bool playback);
+int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT711-SDCA support */
-int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			      struct snd_soc_dai_link *dai_links,
-			      struct asoc_sdw_codec_info *info,
-			      bool playback);
-int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT1308 I2S support */
-extern const struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
+extern const struct snd_soc_ops soc_sdw_rt1308_i2s_ops;
 
 /* generic amp support */
-int sof_sdw_rt_amp_init(struct snd_soc_card *card,
+int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback);
+int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+
+/* MAXIM codec support */
+int asoc_sdw_maxim_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
 			struct asoc_sdw_codec_info *info,
 			bool playback);
-int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-
-/* MAXIM codec support */
-int sof_sdw_maxim_init(struct snd_soc_card *card,
-		       struct snd_soc_dai_link *dai_links,
-		       struct asoc_sdw_codec_info *info,
-		       bool playback);
 
 /* CS42L43 support */
-int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *dai_links,
-			     struct asoc_sdw_codec_info *info,
-			     bool playback);
+int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			      struct snd_soc_dai_link *dai_links,
+			      struct asoc_sdw_codec_info *info,
+			      bool playback);
 
 /* CS AMP support */
-int bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
-				 int *num_dais, int *num_devs);
-int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
-			       struct snd_soc_dai_link **dai_links,
-			       struct snd_soc_codec_conf **codec_conf);
-int bridge_cs35l56_spk_init(struct snd_soc_card *card,
-			    struct snd_soc_dai_link *dai_links,
-			    struct asoc_sdw_codec_info *info,
-			    bool playback);
-
-int sof_sdw_cs_amp_init(struct snd_soc_card *card,
-			struct snd_soc_dai_link *dai_links,
-			struct asoc_sdw_codec_info *info,
-			bool playback);
+int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
+					  int *num_dais, int *num_devs);
+int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
+					struct snd_soc_dai_link **dai_links,
+					struct snd_soc_codec_conf **codec_conf);
+int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
+				     struct snd_soc_dai_link *dai_links,
+				     struct asoc_sdw_codec_info *info,
+				     bool playback);
+
+int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback);
 
 /* dai_link init callbacks */
 
-int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index fc18e4aa3dbe..d28477c50469 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -36,7 +36,7 @@ static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 	},
 };
 
-int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 1688f29a977a..bb371b2649cf 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -48,7 +48,7 @@ static struct snd_soc_jack_pin sof_jack_pins[] = {
 	},
 };
 
-int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -99,7 +99,7 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai
 	return ret;
 }
 
-int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -121,10 +121,10 @@ int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *da
 	return ret;
 }
 
-int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *dai_links,
-			     struct asoc_sdw_codec_info *info,
-			     bool playback)
+int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			      struct snd_soc_dai_link *dai_links,
+			      struct asoc_sdw_codec_info *info,
+			      bool playback)
 {
 	/* Do init on playback link only. */
 	if (!playback)
@@ -132,10 +132,10 @@ int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 
 	info->amp_num++;
 
-	return bridge_cs35l56_spk_init(card, dai_links, info, playback);
+	return asoc_sdw_bridge_cs35l56_spk_init(card, dai_links, info, playback);
 }
 
-int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 206fe7610a56..6479974bd2c3 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -14,7 +14,7 @@
 
 #define CODEC_NAME_SIZE	8
 
-int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	const char *dai_name = rtd->dai_link->codecs->dai_name;
 	struct snd_soc_card *card = rtd->card;
@@ -45,10 +45,10 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 	return 0;
 }
 
-int sof_sdw_cs_amp_init(struct snd_soc_card *card,
-			struct snd_soc_dai_link *dai_links,
-			struct asoc_sdw_codec_info *info,
-			bool playback)
+int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback)
 {
 	/* Do init on playback link only. */
 	if (!playback)
diff --git a/sound/soc/intel/boards/sof_sdw_dmic.c b/sound/soc/intel/boards/sof_sdw_dmic.c
index 19df0f7a1d85..d9f2e072f401 100644
--- a/sound/soc/intel/boards/sof_sdw_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_dmic.c
@@ -19,7 +19,7 @@ static const struct snd_soc_dapm_route dmic_map[] = {
 	{"DMic", NULL, "SoC DMIC"},
 };
 
-int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
+int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index f689dc29c493..fd8347e28849 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -21,7 +21,7 @@ static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	{ "Right Spk", NULL, "Right BE_OUT" },
 };
 
-int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -75,7 +75,7 @@ static int mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enabl
 	return 0;
 }
 
-static int mx8373_sdw_prepare(struct snd_pcm_substream *substream)
+static int asoc_sdw_mx8373_prepare(struct snd_pcm_substream *substream)
 {
 	int ret;
 
@@ -87,7 +87,7 @@ static int mx8373_sdw_prepare(struct snd_pcm_substream *substream)
 	return mx8373_enable_spk_pin(substream, true);
 }
 
-static int mx8373_sdw_hw_free(struct snd_pcm_substream *substream)
+static int asoc_sdw_mx8373_hw_free(struct snd_pcm_substream *substream)
 {
 	int ret;
 
@@ -101,14 +101,14 @@ static int mx8373_sdw_hw_free(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops max_98373_sdw_ops = {
 	.startup = asoc_sdw_startup,
-	.prepare = mx8373_sdw_prepare,
+	.prepare = asoc_sdw_mx8373_prepare,
 	.trigger = asoc_sdw_trigger,
 	.hw_params = asoc_sdw_hw_params,
-	.hw_free = mx8373_sdw_hw_free,
+	.hw_free = asoc_sdw_mx8373_hw_free,
 	.shutdown = asoc_sdw_shutdown,
 };
 
-static int mx8373_sdw_late_probe(struct snd_soc_card *card)
+static int asoc_sdw_mx8373_sdw_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_context *dapm = &card->dapm;
 
@@ -118,10 +118,10 @@ static int mx8373_sdw_late_probe(struct snd_soc_card *card)
 	return snd_soc_dapm_sync(dapm);
 }
 
-int sof_sdw_maxim_init(struct snd_soc_card *card,
-		       struct snd_soc_dai_link *dai_links,
-		       struct asoc_sdw_codec_info *info,
-		       bool playback)
+int asoc_sdw_maxim_init(struct snd_soc_card *card,
+			struct snd_soc_dai_link *dai_links,
+			struct asoc_sdw_codec_info *info,
+			bool playback)
 {
 	info->amp_num++;
 
@@ -133,7 +133,7 @@ int sof_sdw_maxim_init(struct snd_soc_card *card,
 		 */
 		break;
 	case SOF_SDW_PART_ID_MAX98373:
-		info->codec_card_late_probe = mx8373_sdw_late_probe;
+		info->codec_card_late_probe = asoc_sdw_mx8373_sdw_late_probe;
 		dai_links->ops = &max_98373_sdw_ops;
 		break;
 	default:
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 67737815d016..3584638e2192 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -35,7 +35,7 @@ static struct snd_soc_jack_pin rt5682_jack_pins[] = {
 	},
 };
 
-int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index 0db730071be2..a90d69573736 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -33,7 +33,7 @@ static struct snd_soc_jack_pin rt700_jack_pins[] = {
 	},
 };
 
-int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index fff76291fca2..e4d300d7d5ef 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -59,7 +59,7 @@ static struct snd_soc_jack_pin rt711_jack_pins[] = {
 	},
 };
 
-int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -111,7 +111,7 @@ int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 	return ret;
 }
 
-int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
@@ -124,10 +124,10 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 	return 0;
 }
 
-int sof_sdw_rt711_init(struct snd_soc_card *card,
-		       struct snd_soc_dai_link *dai_links,
-		       struct asoc_sdw_codec_info *info,
-		       bool playback)
+int asoc_sdw_rt711_init(struct snd_soc_card *card,
+			struct snd_soc_dai_link *dai_links,
+			struct asoc_sdw_codec_info *info,
+			bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 788796461885..bb09d1ddafd2 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -26,7 +26,7 @@ static const struct snd_soc_dapm_route rt712_spk_map[] = {
 	{ "Speaker", NULL, "rt712 SPOR" },
 };
 
-int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index 083d281bd052..2da9134ad1a3 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -19,7 +19,7 @@ static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
 
-int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index da1a8cc1c63d..4cf392c84cc7 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -173,7 +173,7 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 		return rt1318_map;
 }
 
-int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	const struct snd_soc_dapm_route *rt_amp_map;
@@ -233,11 +233,11 @@ static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 /* machine stream operations */
-const struct snd_soc_ops sof_sdw_rt1308_i2s_ops = {
+const struct snd_soc_ops soc_sdw_rt1308_i2s_ops = {
 	.hw_params = rt1308_i2s_hw_params,
 };
 
-int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
@@ -254,10 +254,10 @@ int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 	return 0;
 }
 
-int sof_sdw_rt_amp_init(struct snd_soc_card *card,
-			struct snd_soc_dai_link *dai_links,
-			struct asoc_sdw_codec_info *info,
-			bool playback)
+int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev1, *sdw_dev2;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index ea7c1a4bc566..64960b059834 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -12,7 +12,7 @@
 #include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
-int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_component *component;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 9c3b93f808a2..d84aec2b4c78 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -83,7 +83,7 @@ static const char * const need_sdca_suffix[] = {
 	"rt711", "rt713"
 };
 
-int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -161,7 +161,7 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *d
 	return ret;
 }
 
-int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
@@ -178,10 +178,10 @@ int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link
 	return 0;
 }
 
-int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			      struct snd_soc_dai_link *dai_links,
-			      struct asoc_sdw_codec_info *info,
-			      bool playback)
+int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50136944892
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:36:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA0733CAF;
	Thu,  1 Aug 2024 11:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA0733CAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504963;
	bh=BIFI18q4ByQH2ewrJK/kJ4FJ3bbVKAwu989UsVKHreg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BNBREw6YjMfInYq3XX0SYbom8gJYujm0Ui5vCH7p5Hs+Uz8/h8eP5dPw0zp+1OMGf
	 NVB8gBy0pkijREeht4zlSbmLtCLQMZH4JVRSuhT7I5MdrNra9SEEJn0jsWUdP4IdeQ
	 WRvNFQqo9TNQKwqvy53YEUBpeGBlBMrnufkqjdOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64CECF8061D; Thu,  1 Aug 2024 11:35:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A42F0F805FD;
	Thu,  1 Aug 2024 11:35:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A525F8026A; Thu,  1 Aug 2024 11:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E977AF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E977AF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lTyJp3II
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOMnrc2LnMsnMIWYw76AgwgF9l23cfHjbePk/N7DP81uaVEYhSz4SBzi62PqwA28MJVktEyEBE1RPTaEpw9IjiQMHA1hZmtAtIIR0ibD6rX6ccTTgn0oC6VGiigjurDAv7t65d2j2DF7zL8gPQ/yaG8X8nfGy4NZ0vGzrxR5aZASSl7OP34XNd31DOgL9z/zwryWvAWeX8z1lura58fk/c6NDkEO/DJbyWnLq5s5Q1lSZO2YajQlNwhsKizAN7Ds3z9fb+BXYtIMscLpDi0QTy5Zmw/3E/IPyg8Ziuv3f0ndYo2Lfp/O7z49WldY90ig07dsyAS1hIWp0yDwAiAQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8eb6F6KXiovGQZ5qK0hVz3A8v39vgjsYiTEqUy9guY=;
 b=EFhQGZQ6XdWhQTbDgp14G1sOw2OhqlOgAPGMCDkMdC79tSR+L2oSK78vRIpC7o7iN0ljv8VNWNwCsdN1QBVQdDQLEaGJM4iVSLtp88W6IGAl9tTKTgBwXiixg/+LZ9FB00V7SuYDtcnHvICnOaTCzPIzgvu55nRjs6fgNYatOBRfSqkwqmMg8OYyYfHQlyBZkeVFy5jt50oOwIQnOgV1kRz5VWquTN1qOLXl68hOJsbNBboWJypUdRtZYV+L3BASa+Z0NaeoO7wHrGblN7Ug1T1UgDURyGLegGl5nDUjSPGkOqEVZrRuLjvK+XU/tvRSiSMtSEE5zRBPJF/tDNQn2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8eb6F6KXiovGQZ5qK0hVz3A8v39vgjsYiTEqUy9guY=;
 b=lTyJp3II4KB+pYRdCxzSqW6KDXvjfwq8UhPnn0o4zn2ou2vztrM4o15FCl5SCoSQFu2jyS53KEgqD1vIJsVLVt4CJ5CHWm1FQZiQaicFmJaTHsT9egclk5GyOLDnNRiKYM8QmCx/7023XEC42kia/7bwcQjTh91eWWFd1KH0AfM=
Received: from DM6PR03CA0045.namprd03.prod.outlook.com (2603:10b6:5:100::22)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Thu, 1 Aug
 2024 09:22:22 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::cc) by DM6PR03CA0045.outlook.office365.com
 (2603:10b6:5:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:22:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:22:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:22:20 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:22:13 -0500
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
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 16/31] ASoC: intel/sdw_utils: move rtk jack common
 helper functions
Date: Thu, 1 Aug 2024 14:44:31 +0530
Message-ID: <20240801091446.10457-17-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 13613b73-407e-4a18-11e0-08dcb20b72bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ahAh9Wj7K52yJ+/rizkjzP19NItue8CAMF8ybRU3AczuTsgxnR4GP/ke6qRi?=
 =?us-ascii?Q?OG5uKYrgnjdDq65UDSEDTQmc2c2fuNWOTCmtyLH6PO6tHENHks1aukYKT79N?=
 =?us-ascii?Q?jjXSI7q7pP1w74G5Lc7SjxAanC9CmJgTQNB3xYPzvuHyyQeCAi7jJGq9mnvQ?=
 =?us-ascii?Q?1Wbn/7OS8t5hGq0h4weaVTXSJrvE2F+teF8jivOjIo7nlxwzHuj1Cn65vMwA?=
 =?us-ascii?Q?2J7bNElIIDRReeSwmuiI8B2m0NdPixUqHw1OMBe1BUczkc1JjzAGkJrZMEyL?=
 =?us-ascii?Q?1gpOCgagN8c3rJO/YK6LkNmo48a8jIQD+ci7OQ7V07IbyTpeaKmu+jXqyqJ9?=
 =?us-ascii?Q?qYn9I7F0oKaoM215s4vh3kUDkOykEXza5lWt76iN8/rTRb8GO6vUJjZeP6qo?=
 =?us-ascii?Q?RJA8qlJs+A+oDBTot/1/6rlQGt1evqEM59SXgHMyZjRI6SufPGkmW+/TJ/Y0?=
 =?us-ascii?Q?d1fGxZ0e8DYTKoobvlOf2hhSYOFTwwfsIdCNu3nXqdiQMb4IJaWI/urxORzD?=
 =?us-ascii?Q?8qhn69Q/RVIDcV7iT2qOYFYSqNFjQG6jys7FHI4BXHJHKaex/kChrLQkbmh/?=
 =?us-ascii?Q?cwDHlWQSeSqjGxY7HC1mBsJJRWUU3S0AJUkv1RwoRCga/d70syUz1YOlJ+GE?=
 =?us-ascii?Q?dNmVZ/roTh8PgaJNPNGB9qmwAeEAVT+MiuLHxvTPiG0qVYRpV9zrzXICSwnw?=
 =?us-ascii?Q?ndZF3lNu0VnKJ2jlxQ2NEjwY3pv6mFGSV/f5yfM7ihZqAq57aVySWH7eQcv0?=
 =?us-ascii?Q?bNoVrQpr/5ikkcNINSlrlmdLwIJnUdWzC/0AZ4dJP2/5+jN/27Y/waPRVnPg?=
 =?us-ascii?Q?z+aX1USx93jnjbwaouVVHwsb553wDNexKpq795hflJqcqPRG/5cLVm4AbiNy?=
 =?us-ascii?Q?mgpRexWhRjnDJLhow6Q9RJLp07nCpu3j5aIpZRSNX8ES1/ZDCjSywn42XRxE?=
 =?us-ascii?Q?yYT0p1VvZIAPi1QXxdJeP7vcWa1Yr8mljKZPHiJ2nm48OhHFFqshs23zAH2a?=
 =?us-ascii?Q?wN1WU34KyOcmBsdsDdXY6pxVbgxXfk8adh6bYaHl6Fg8ZPhGfmvnCdGvMNzg?=
 =?us-ascii?Q?jkS5SwkMax18/QJgAqDGFBB7R7NvXFc2OVB3ecUSL65rssXsCjMYw26kqQCP?=
 =?us-ascii?Q?CkGvzIQpUhruL/YzLORyGcrHvfMdYUk8Gg8pSOfmmpRRzNOJfSmOTMOZsr5w?=
 =?us-ascii?Q?84bxFOlEP+SO8LoO5nAVJ1F0Dlk433B9jqxIZQbHktea0Oq5CGuibEwBIThf?=
 =?us-ascii?Q?+QEMKLoSmQoRGthjqnm6Dv7p13jwa4uZ4wJgeW06kF02Nh+gddQVAJyRraLu?=
 =?us-ascii?Q?FzEih/RvlNTZh82OBIeJm7+lAorjaLJvOuSuTIqg0wgAjRuMAtY9A2zJvnZe?=
 =?us-ascii?Q?T0zfkUO71KJg3bdTzm/+l22FXBqkuWJ8KdXsWNfhylNiIh9Vjw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:22:21.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 13613b73-407e-4a18-11e0-08dcb20b72bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038
Message-ID-Hash: ND7CJ6RCD3565K3ZX3ZZLGZW5MJ75LFS
X-Message-ID-Hash: ND7CJ6RCD3565K3ZX3ZZLGZW5MJ75LFS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ND7CJ6RCD3565K3ZX3ZZLGZW5MJ75LFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move RTK codec jack common helper functions to common place holder
(sdw_utils folder) to make it generic so that it will be used by
other platform machine driver code.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                 | 11 ++++++++++
 sound/soc/intel/boards/Makefile               |  1 -
 sound/soc/intel/boards/sof_sdw.c              |  1 +
 sound/soc/intel/boards/sof_sdw_common.h       | 10 ----------
 sound/soc/sdw_utils/Makefile                  |  2 +-
 .../soc_sdw_rt_sdca_jack_common.c}            | 20 +++++++++++--------
 6 files changed, 25 insertions(+), 20 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_rt_sdca_jack_common.c => sdw_utils/soc_sdw_rt_sdca_jack_common.c} (90%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index ed97d78336da..6b6bab8d3310 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -13,6 +13,8 @@
 #include <sound/soc-acpi.h>
 
 #define SOC_SDW_MAX_DAI_NUM             8
+#define SOC_SDW_MAX_NO_PROPS		2
+#define SOC_SDW_JACK_JDSRC(quirk)	((quirk) & GENMASK(3, 0))
 
 struct asoc_sdw_codec_info;
 
@@ -63,6 +65,7 @@ struct asoc_sdw_mc_private {
 	bool append_dai_type;
 	bool ignore_internal_dmic;
 	void *private;
+	unsigned long mc_quirk;
 };
 
 int asoc_sdw_startup(struct snd_pcm_substream *substream);
@@ -82,8 +85,16 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 /* DMIC support */
 int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
+/* RT711-SDCA support */
+int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+
 /* dai_link init callbacks */
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 80c33e4b4cfe..0f1b2c288162 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -38,7 +38,6 @@ snd-soc-sof-sdw-y += sof_sdw.o				\
 			sof_sdw_maxim.o sof_sdw_rt_amp.o	\
 			bridge_cs35l56.o			\
 			sof_sdw_rt700.o sof_sdw_rt711.o		\
-			sof_sdw_rt_sdca_jack_common.o		\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 236e3fab66b9..e310843974a7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1973,6 +1973,7 @@ static int mc_probe(struct platform_device *pdev)
 
 	log_quirks(card->dev);
 
+	ctx->mc_quirk = sof_sdw_quirk;
 	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		codec_info_list[i].amp_num = 0;
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index bbd09698c69d..af656716c9d2 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -15,7 +15,6 @@
 #include <sound/soc_sdw_utils.h>
 #include "sof_hdmi_common.h"
 
-#define SOC_SDW_MAX_NO_PROPS 2
 #define MAX_HDMI_NUM 4
 #define SOC_SDW_UNUSED_DAI_ID -1
 #define SOC_SDW_JACK_OUT_DAI_ID 0
@@ -45,7 +44,6 @@ enum {
 	SOF_I2S_SSP5 = BIT(5),
 };
 
-#define SOC_SDW_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 /* Deprecated and no longer supported by the code */
 #define SOC_SDW_FOUR_SPK		BIT(4)
 #define SOF_SDW_TGL_HDMI		BIT(5)
@@ -98,13 +96,6 @@ int asoc_sdw_rt711_init(struct snd_soc_card *card,
 			bool playback);
 int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
-/* RT711-SDCA support */
-int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			       struct snd_soc_dai_link *dai_links,
-			       struct asoc_sdw_codec_info *info,
-			       bool playback);
-int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-
 /* RT1308 I2S support */
 extern const struct snd_soc_ops soc_sdw_rt1308_i2s_ops;
 
@@ -154,6 +145,5 @@ int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index fea2b6ae6975..68b8fddeb77e 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_rt712_sdca.o soc_sdw_rt722_sdca.o	\
-		       soc_sdw_rt5682.o
+		       soc_sdw_rt5682.o soc_sdw_rt_sdca_jack_common.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
similarity index 90%
rename from sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
rename to sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
index 8059e483835d..3e6211dc1599 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2020 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_rt711_sdca - Helpers to handle RT711-SDCA from generic machine driver
+ *  soc_sdw_rt711_sdca - Helpers to handle RT711-SDCA from generic machine driver
  */
 
 #include <linux/device.h>
@@ -15,22 +17,22 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 /*
  * Note this MUST be called before snd_soc_register_card(), so that the props
  * are in place before the codec component driver's probe function parses them.
  */
-static int rt_sdca_jack_add_codec_device_props(struct device *sdw_dev)
+static int rt_sdca_jack_add_codec_device_props(struct device *sdw_dev, unsigned long quirk)
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
@@ -160,6 +162,7 @@ int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_rtd_init, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -168,7 +171,7 @@ int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_lin
 	if (!ctx->headset_codec_dev)
 		return 0;
 
-	if (!SOC_SDW_JACK_JDSRC(sof_sdw_quirk))
+	if (!SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
 		return 0;
 
 	device_remove_software_node(ctx->headset_codec_dev);
@@ -177,6 +180,7 @@ int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_lin
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_exit, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			       struct snd_soc_dai_link *dai_links,
@@ -198,7 +202,7 @@ int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 	if (!sdw_dev)
 		return -EPROBE_DEFER;
 
-	ret = rt_sdca_jack_add_codec_device_props(sdw_dev);
+	ret = rt_sdca_jack_add_codec_device_props(sdw_dev, ctx->mc_quirk);
 	if (ret < 0) {
 		put_device(sdw_dev);
 		return ret;
@@ -207,4 +211,4 @@ int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 
 	return 0;
 }
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_init, SND_SOC_SDW_UTILS);
-- 
2.34.1


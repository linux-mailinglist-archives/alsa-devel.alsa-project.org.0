Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD079446E9
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DBB835C4;
	Thu,  1 Aug 2024 10:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DBB835C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501914;
	bh=BIFI18q4ByQH2ewrJK/kJ4FJ3bbVKAwu989UsVKHreg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nKoTMzsyKvFCeqnAHsdqsmfEJUq3PQZJ4aVbmmiIe/Yv6XRCO8C8HNb37914UV6PQ
	 3akCjPDOYtVXWo/jbPe2PoMwUncffUqW8VEaHbWRGTTcr7p00t4VIJH+sw8kcT1/13
	 cMo6d/xhzDK1OAOvaNQkBHu+wCp2OcfIDG5vkxIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E02D6F80612; Thu,  1 Aug 2024 10:44:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5620F805B1;
	Thu,  1 Aug 2024 10:44:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68E30F8026A; Thu,  1 Aug 2024 08:31:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1211F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1211F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2uzqDs3F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvnGz2DZpv2FJ1uO2h2tw3w5m8NzWpBrahPDsTXfdzjBpEorAM0Ej1lnHTYAa4CV5XW+mN8CnMFFuonJaN5j0+K+KvhhSd8uSf1RgYodm/F+GswO4iGJj4A76yTRtCCL3lGN0pIMpqmjWih5ad5hSlBLztBVOHX47DPCk5uQ5GnABKa64xxU/5lIxoWLsLqlVMuG9itdb8pE7aJnObnqr9yd4hAaBMyX3g8URxtCvtbax3JuqD0reX83EEJfjfJzCVRn6E+ZoMMULCOgY5du380gZlTkkFtWat+kjz62S3k31ogE4rjEqf7acoSpHBIi6SUlrP6l040yLIoxaV+oxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8eb6F6KXiovGQZ5qK0hVz3A8v39vgjsYiTEqUy9guY=;
 b=T4Wi9Exu2OTNXALDu9mjghwOCXAhVTTIIpCeu5bSZbpTBlodg4u9am9VPhWdpB7us8vv9HGSAIsPEM51EKWSvgvkCplmmZdCegEDpedjQR7OUw7BKqHAC6VpwKatFZJHPOBbeTf3tSKg3rMt1mnEkgPr7trBGJv+jxNy0swvYJiNnIjP/12mAauDQylKCxUtGZ8RWl14AglszRqI5j4MlJjaM93KSwpZ3EnIfzUBdGrPhWv+mNxwbzsQp+c8wUBSpmSNxWAICXCANooF4C+mgtgF+Hof7BZ2yAe6rL4YhfNuJF/6CsYs0TeeLjw01UE3XfNT1wEIAAYXNOctGFMoCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8eb6F6KXiovGQZ5qK0hVz3A8v39vgjsYiTEqUy9guY=;
 b=2uzqDs3FS0X8wPqNMBTMPphSMZB9kP1rv0DQKbA4w73S6KtAhN9+Hd1maPY93UjQAQ+FqarZwsANQGqyPxr/IpQrOp6aTV3KkEEBWiq3SyYStvhWcUkMTb2NziQHIsNRrLN8VXgdCJGXTTTHYZ0fZdVTx9NJH8qgDRsixCkHq80=
Received: from DM6PR08CA0064.namprd08.prod.outlook.com (2603:10b6:5:1e0::38)
 by SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:31:40 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::73) by DM6PR08CA0064.outlook.office365.com
 (2603:10b6:5:1e0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 06:31:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:31:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:31:39 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:31:33 -0500
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
Subject: [PATCH 16/31] ASoC: intel/sdw_utils: move rtk jack common helper
 functions
Date: Thu, 1 Aug 2024 11:54:01 +0530
Message-ID: <20240801062416.2203673-17-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|SN7PR12MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: a63ee296-b03d-422c-9c18-08dcb1f39a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qaf6D30zU/vcWbbsDDeETcw4lIQ23zTEQnwMdibqYYTaO+ckgdu4QKR1v+Fl?=
 =?us-ascii?Q?EpDaWdz1jOFOrWoQEnibdKKiiIXXMUSAsZWLkP02y/Sj4ODXSjlkteOeft4x?=
 =?us-ascii?Q?o1xGnk4Cgq9Avbo+UusjbhgfMDWXOihNlLh6S2W4w4mOwdQXNP3dO/Jr3VcR?=
 =?us-ascii?Q?EO97B8WSH7IykVuUxnodBKHYKwSYiaVUB9HZUJR0MygsIVoenEaeBjqVJcJ0?=
 =?us-ascii?Q?GV4ePoS3pa5T3BIygS5rcbxkuaHKCaFUIRyZ+X34rBKTGUSKKgYPOoZyvWKy?=
 =?us-ascii?Q?xq8tRKgOvrxl3EvqUbx+2G1kw6IhXgTtXTu0RgaMu7tSNAiV2tXjhCPAnr0M?=
 =?us-ascii?Q?cN31GAdwGCOzi7Oh4bLcn6+2P2b8DRJQDxNyv9vjgvyOvI7Xc0UKY3oKaPf/?=
 =?us-ascii?Q?vmdDdFBpYsYe98sVlnLp8+NRLT99I75BFjOI1MR2CACoAIn6JadCvaVt0TI+?=
 =?us-ascii?Q?7CcGLfC4n3wk86vaiDTjcWrWOMuTBqNvleiC1XqDLTM0bDC34qH6riF70uOq?=
 =?us-ascii?Q?JdaO57jV6d+Y+C1avI2ThJ0dpF7jffv9Tcq4qhsrSYE1/0B8OU5GQf+VwQlE?=
 =?us-ascii?Q?a18ZgqMhqqQCzm2jEhROe+ySrk+NfCaiZLbBn3aPggKh3P3NFY1jcIpxufA9?=
 =?us-ascii?Q?ukHPikl9W4lLBi8yvutof+MPzOmqt8qqFQ6BZ+xnsMqjWN//O6eHTRCWDncV?=
 =?us-ascii?Q?rtx1YhPi1YqLLFkf3M4oIHlTHx5sjcAUd5oKgBm3WOoy7MbPuaSMyVswDjlT?=
 =?us-ascii?Q?Lm4b7MxkPBd5+FK5PNSRaWmDkCgY0MgHDZ7kJ51g2ohz1CVXklTy4ox72nNf?=
 =?us-ascii?Q?wBgjtVLDtgRh4/B8nwAZo0EV+2m5DMklSH7Ppw42z1+W4tCaYnBlSpWZrfNW?=
 =?us-ascii?Q?6sbffOmNdb1oWK8GiUPju5cGyj22VR96TSp5UzmSTUaPyNb2heOGHp0pLqb8?=
 =?us-ascii?Q?+nJXq55sxvqFtblEalTJxrFaB1mfZJoh1NUr5wOjlpnNIzE2DeHliJn6NQcO?=
 =?us-ascii?Q?jv0JRB1Zzy5mbMUTPIwUUObWc2JYhRSfktqynGu5K92g/a4y9bMLieKn3Kvc?=
 =?us-ascii?Q?+iIyoC8JhyMp5Mk8Dv47joLHyKVAtRgKKYqxRz5yVRMV9HJIq5YyvSM4s8Ew?=
 =?us-ascii?Q?sPkkHqxMZOe5XDSMW0OozakinMl7ViePiO7SklNRh70XjqCAoR2qJ4eFcyis?=
 =?us-ascii?Q?sbAOhUrXu77oq1/XNGxPu3alDtKZcSqdZg+gd+z6tSS67sM/icj29nBjZItP?=
 =?us-ascii?Q?njSYDWqG7lMBkOhlNoLjLavHUKsPIUYnbEwlCxwbWiFHH+PABK4zgCJ6qV1D?=
 =?us-ascii?Q?KyrP8grsEES1lbIjvGkypR+yObXSW6fBo1rPPjLiuG6niQ9LTiTRpDVQ2MwL?=
 =?us-ascii?Q?PLksd1P4Dj3BVG4lCzNTZFcghqh4uc7tS6MqTnMDgx2gyw2jeQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:31:40.2424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a63ee296-b03d-422c-9c18-08dcb1f39a4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715
Message-ID-Hash: LVGOAAUMQM2B7W6JCZPZSWDOUPPJNCX7
X-Message-ID-Hash: LVGOAAUMQM2B7W6JCZPZSWDOUPPJNCX7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVGOAAUMQM2B7W6JCZPZSWDOUPPJNCX7/>
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


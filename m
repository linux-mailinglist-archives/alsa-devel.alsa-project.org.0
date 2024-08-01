Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35809944897
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:36:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F0283D13;
	Thu,  1 Aug 2024 11:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F0283D13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504987;
	bh=mO7YQ+kpTp1+yWnA682z7NdxMzu/Rh2XK0nHxXaUbVI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uQnjEM0J7EkCbiBuHnBTEfUuLB6fa5Ai4jmUCHER5ItjMn02USBXTjWeSZj5Y8kOc
	 6C+0095Hoe8xtdEQclu0wwvltXmMMKjpIByvrxDYW/a2kJ7PYTv54nW/U/33idmKDu
	 SW3YVQfi1YWoBXWp8fdXkPMVbkEdYIdG1CxtlBUc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81DCDF805E9; Thu,  1 Aug 2024 11:35:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F354F8019B;
	Thu,  1 Aug 2024 11:35:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDC32F8019B; Thu,  1 Aug 2024 11:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A843AF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A843AF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1ssoJ5Qa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c96n+RTVu5JEXP85QD3XogJRnNNHynrHCZy/U/pxFnl8sEDIoBjJxmo6OiiN5UJAdVYVHzfmxEn1qKLilt//G4ZPjcuHzlM0Q4l9hckUajEOi/+LDAiSCdI+zZBvB3nWi+m85VQGUELcMtApv7uUu3kpE2cqO0PPM4pW+1cNx+s/8wdQLNDQv/Z9qrtfoxyI8P2lM5aUHldRcKwVL6JS57uuF0j29lYYNZ3JYDNGMzlyw1yL6NceQBidQmYuX+xjDiv10D7PdR4CfAFOiZDw1lWSj7iKe8/H4FxeSungD5d2nTR/gT3yxjwegt51r/Psifa8cM5zeyPBFX/IlJpDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbozI4ddjgSv9+7bNOMeGoYJHbEvkkiHespHtCIOw/0=;
 b=d4ym223ie8YPnsJYhwzXmtkNUQmZwyiE+iDurUHMrVMEFCF3X2DmTrXTSF5auGuSrxWHTUPv2ZhljAAJ2eXzaY80+HSMBWhuES7bPWcuEKSY6xNbR0a2d2XjkOH1A/L1evHMcfouohNz9XUmMHzv9IZyyssBg23ZPUGOpvXzJ1NbEaaCongHN7RU0ngyYRPzJEzFEFXfysBV2OJeoJHKQvc/CrhO3QlBcorTlUQLx0XxaX0lhv1P/mQzzNsRkxohOCjMvewzP3giaIGB0eLIlhoDhtA6J2n3E0cJKdYDg8i1Kq5JOwNp46avb9/gnP1cbR8M/SAB3C+fYEmxHO0+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbozI4ddjgSv9+7bNOMeGoYJHbEvkkiHespHtCIOw/0=;
 b=1ssoJ5QapYkewENGexsp/kP1eYmQdXtE+7FpsQpnLKIAF4d6BF4tAPk0EpdS8EnGsty/g35jnoH9YVzapSU9E3vZJ/MQN85i+c8Ay56DM2l+KryLrH7q/+nI7KPQrR9pqGMDpxvGgtpz0Ocv1q41L4oYZLJq5D3ZuWhYk+/3sSA=
Received: from BL0PR1501CA0024.namprd15.prod.outlook.com
 (2603:10b6:207:17::37) by BY5PR12MB4097.namprd12.prod.outlook.com
 (2603:10b6:a03:213::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:23:29 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:207:17:cafe::bf) by BL0PR1501CA0024.outlook.office365.com
 (2603:10b6:207:17::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Thu, 1 Aug 2024 09:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:23:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:23:28 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:23:20 -0500
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 18/31] ASoC: intel/sdw_utils: move rtk amp codec helper
 functions
Date: Thu, 1 Aug 2024 14:44:33 +0530
Message-ID: <20240801091446.10457-19-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|BY5PR12MB4097:EE_
X-MS-Office365-Filtering-Correlation-Id: f313ab96-ea8e-4e5e-5da4-08dcb20b9ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iTUiVwy1PhJQyHrJd8eZaHnYycOEci4Xo6vk/rLhZfgDKn0YHuggy0KZfhv3?=
 =?us-ascii?Q?vDc4bCkubXArmlE4nOo+SlxOWJyNz3q04i0VBpvyUq1X302xSXsDqDCPyheb?=
 =?us-ascii?Q?kR1x/K4uPr5PwdXXtPnXlcdHwPnEE+FAvQdxP3UTa+vt5dh5ZSTarXDcsycs?=
 =?us-ascii?Q?rkDgN+SU7NX+J9gbGalxlKQZbdcWKkCMlLeWrjlkpPeMUKrzQ4YrhtzWCLa3?=
 =?us-ascii?Q?Dd2KlVDK4D+PU2ErDjst5R6UaFLNvlRr92Y166BrIUaug1aypk6pqm4by9fr?=
 =?us-ascii?Q?dcuotcn8EBCpjs2IFMddavbcEaQ8Snvpg97uu3GZh+Oq/A5wmpeT5d2p8gLl?=
 =?us-ascii?Q?H4Af1KZbdpeXeGSGg7jdVTOLlnYpr9hRxWZ4cWDEu2voJuPyiXQQOOWYMtxs?=
 =?us-ascii?Q?0SYK7e/lEcLjdS5e9vSNkEb+FSh8MSA6eXI0LkhsVyl/7sfYvYVolynD0tnb?=
 =?us-ascii?Q?0s6LMCnKXaZhDtNDLrsRfMs1XJoHQmETC2zSeQKUVhBFzHFfctd3rOII8BkM?=
 =?us-ascii?Q?6q3nBAe7t0T+wcyI4pb5PkXjfjxUwlMC51/SiSU7iHyJKdZEbh9ymgANvJln?=
 =?us-ascii?Q?YrfLDtbVdnf9ejnE+UZP++QUiMkTTeCP3rci9P8NwB4YuWQy187GswUOyidX?=
 =?us-ascii?Q?AWdFGBdiQdE5s3pe9g9cVCv9T6W7hUEaSMUPenHfnjLJxnyev/URyz1WSMbE?=
 =?us-ascii?Q?XluNCX4wRwFZluZkmzOxv6q0jZt5PpHyDCdkFqyTXx2Aju4BgJ05uxawiznt?=
 =?us-ascii?Q?AWCiLDSsW3Mqv3mUBKUnS1d2Sow2M5pLh1sOtEQhAci79xqNagKJmkKcdN6Q?=
 =?us-ascii?Q?DC1YdEp73NC7JOdOKsl8aa6Zu5TCeTKV4EoQJ+/QYfaTrFccRR7dKMF+zlS3?=
 =?us-ascii?Q?bngx+N12K4h6EsWikSm89qvdcf4zR6gJnAJ/V4ZFlUu5Qx3TnkzN3bO1cmX8?=
 =?us-ascii?Q?MI4dtXgqgT47B/yiHEgIrNBSdLiO2Ryvi1uaT6svi1M5KlZ+/dCUqU3s+Iaj?=
 =?us-ascii?Q?8/SpoR470OsmCd5rvu73wmQ0U5nK5CgewgfaufuZve9hkJaWmmHW4xuJCemE?=
 =?us-ascii?Q?NS2FxGP7g9iqDN7RiQTNHplap0W9IX5j0i0tFCzDJJwuCWxep5GhLlneNJAP?=
 =?us-ascii?Q?BLcFpfAp2ujFnwuOhtTV1TPtFFuHJpQuxhUUuRMQtne7I97T8hf/BunuDA51?=
 =?us-ascii?Q?t846akyHmnxnVwNjdXSmHvH7g6Sm41Hwfcm1O7UMg8YZzmT/k0XyCsBOse+1?=
 =?us-ascii?Q?twYtWURqf5SP1JjzMSD/eC/Bf77yPXGMwtIBgMs0TDfUfUXv92MOqz+rk+Fc?=
 =?us-ascii?Q?+MJuy8GAkKSgivvQGh/QgKVf9bTzm4wOHelsk65vb2nvFLAxvwmZ9YNz6lEQ?=
 =?us-ascii?Q?RQ0yrwZZKhqgGg5nw7AsdCAcNwWu?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:23:29.2446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f313ab96-ea8e-4e5e-5da4-08dcb20b9ae8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
Message-ID-Hash: 6SGMQFD7SFVYS2YCAI7C6JRCA2MUMC4S
X-Message-ID-Hash: 6SGMQFD7SFVYS2YCAI7C6JRCA2MUMC4S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SGMQFD7SFVYS2YCAI7C6JRCA2MUMC4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move RTK amp codec helper functions related implementation to common
place holder to make it generic so that these helper functions will be
used by other platform machine driver modules.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                      | 11 +++++++++++
 sound/soc/intel/boards/Makefile                    |  2 +-
 sound/soc/intel/boards/sof_sdw_common.h            | 11 -----------
 sound/soc/sdw_utils/Makefile                       |  3 ++-
 .../soc_sdw_rt_amp.c}                              | 14 ++++++++++----
 .../soc_sdw_rt_amp_coeff_tables.h}                 |  6 +++---
 6 files changed, 27 insertions(+), 20 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_rt_amp.c => sdw_utils/soc_sdw_rt_amp.c} (93%)
 rename sound/soc/{intel/boards/sof_sdw_amp_coeff_tables.h => sdw_utils/soc_sdw_rt_amp_coeff_tables.h} (97%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 3e55cac33176..450542eb3ea0 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -99,9 +99,20 @@ int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			       bool playback);
 int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
+/* RT1308 I2S support */
+extern const struct snd_soc_ops soc_sdw_rt1308_i2s_ops;
+
+/* generic amp support */
+int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback);
+int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+
 /* dai_link init callbacks */
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 9f92f49cc517..70c56bdc180c 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -35,7 +35,7 @@ snd-soc-skl_nau88l25_ssm4567-y := skl_nau88l25_ssm4567.o
 snd-soc-ehl-rt5660-y := ehl_rt5660.o
 snd-soc-sof-ssp-amp-y := sof_ssp_amp.o
 snd-soc-sof-sdw-y += sof_sdw.o				\
-			sof_sdw_maxim.o sof_sdw_rt_amp.o	\
+			sof_sdw_maxim.o 		\
 			bridge_cs35l56.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 1d7e6df02247..7f856c6018aa 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -89,16 +89,6 @@ int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card);
 
-/* RT1308 I2S support */
-extern const struct snd_soc_ops soc_sdw_rt1308_i2s_ops;
-
-/* generic amp support */
-int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
-			 struct snd_soc_dai_link *dai_links,
-			 struct asoc_sdw_codec_info *info,
-			 bool playback);
-int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-
 /* MAXIM codec support */
 int asoc_sdw_maxim_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
@@ -135,6 +125,5 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index 20516094f453..7851af9b8593 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -2,5 +2,6 @@
 snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_rt700.o soc_sdw_rt711.o 			\
 		       soc_sdw_rt712_sdca.o soc_sdw_rt722_sdca.o	\
-		       soc_sdw_rt5682.o soc_sdw_rt_sdca_jack_common.o
+		       soc_sdw_rt5682.o soc_sdw_rt_sdca_jack_common.o	\
+		       soc_sdw_rt_amp.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
similarity index 93%
rename from sound/soc/intel/boards/sof_sdw_rt_amp.c
rename to sound/soc/sdw_utils/soc_sdw_rt_amp.c
index fff746671c1d..42be01405ab4 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2022 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_rt_amp - Helpers to handle RT1308/RT1316/RT1318 from generic machine driver
+ *  soc_sdw_rt_amp - Helpers to handle RT1308/RT1316/RT1318 from generic machine driver
  */
 
 #include <linux/device.h>
@@ -14,9 +16,9 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
 #include <linux/dmi.h>
-#include "sof_sdw_common.h"
-#include "sof_sdw_amp_coeff_tables.h"
-#include "../../codecs/rt1308.h"
+#include <sound/soc_sdw_utils.h>
+#include "soc_sdw_rt_amp_coeff_tables.h"
+#include "../codecs/rt1308.h"
 
 #define CODEC_NAME_SIZE	7
 
@@ -199,6 +201,7 @@ int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_spk_rtd_init, SND_SOC_SDW_UTILS);
 
 static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
@@ -236,6 +239,7 @@ static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 const struct snd_soc_ops soc_sdw_rt1308_i2s_ops = {
 	.hw_params = rt1308_i2s_hw_params,
 };
+EXPORT_SYMBOL_NS(soc_sdw_rt1308_i2s_ops, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -253,6 +257,7 @@ int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_exit, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_links,
@@ -295,3 +300,4 @@ int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_init, SND_SOC_SDW_UTILS);
diff --git a/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h b/sound/soc/sdw_utils/soc_sdw_rt_amp_coeff_tables.h
similarity index 97%
rename from sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
rename to sound/soc/sdw_utils/soc_sdw_rt_amp_coeff_tables.h
index 4a3e6fdbd623..4803d134d071 100644
--- a/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
+++ b/sound/soc/sdw_utils/soc_sdw_rt_amp_coeff_tables.h
@@ -2,11 +2,11 @@
  */
 
 /*
- *  sof_sdw_amp_coeff_tables.h - related coefficients for amplifier parameters
+ *  soc_sdw_rt_amp_coeff_tables.h - related coefficients for RTK amplifier parameters
  */
 
-#ifndef SND_SOC_SOF_SDW_AMP_COEFF_H
-#define SND_SOC_SOF_SDW_AMP_COEFF_H
+#ifndef SND_SOC_SDW_RT_SDW_AMP_COEFF_H
+#define SND_SOC_SDW_RT_SDW_AMP_COEFF_H
 
 #define RT1308_MAX_BQ_REG 480
 #define RT1316_MAX_BQ_REG 580
-- 
2.34.1


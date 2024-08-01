Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD26994488B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB7C3BFB;
	Thu,  1 Aug 2024 11:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB7C3BFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504901;
	bh=rx6H9awCtEys0PBAaSFFEHLXcC46ONFHPeHOOordOes=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eiYK9X8kvhXC//Y8ISlWRfVFKpF5J3iCQrZ9bVlXsgJ1TJ6HkqD/Sexs+g6LI/XES
	 64BX5iurpuTdXBzeLnxn3PIvl8RZ8sbn794Oq17bpiwvttNHMQJkTaci4MdXjcSvNb
	 dF8xT+B+uu03NwCgftUsqLQoI4xE0ebhNnoLrSgE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA112F805EC; Thu,  1 Aug 2024 11:34:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C943EF805F6;
	Thu,  1 Aug 2024 11:34:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D640F80269; Thu,  1 Aug 2024 11:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::600])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB2BFF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2BFF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mPIwdLFE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIYj9fHR/rf6CynpSpzKfrYTd+3BVyoidiomfvv2ElFCAf+b/Fy+e2nQ+VV6pXB6L/6Jc9rB2vvc1dfv7WG+l2OOn807QUAGT7Qva5zzEBinH/sN84CXtjJ/6HbUN7Wa/QO7UrGRWpA+qt5mOObo2JsDOLAIfBjGu3uiweHFUDJhiAB9jf0Rpt7EZsdqqzcNuXp2fuKF4s9ICLjtwUc6B/mEJ9/Gi0dVgbZJEIow0BJyMGb0AJ54k/tsRdA8tOY+Qg4wPD2MKf/Org+vhjLwXE4lorbsPFfqK0U8okwp4CsGkNnQNuerOkWIj5FH7iyMZdAxoOtV/4FknyTKmIauig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUL0WKFSAgQUSTbpbD6fIs0hWRhgtQ0XCpq5Iu9xYc4=;
 b=joW8KS8PAxT7U5bFQ5l1YKKFILGX2kZ5F8EGFf5py9YJFe/8wNQ1YqzemBrVdHsgKlav2a37Hxq4XIy/rfMZje9XDRfVTgEkoxF/4ky1OqYwOhy39eQ806py2dxF31I3LmS23mj8l8N9dmo1huN5kfVIRF8YGWmdlVbnQc6Q2Pyo7H47dNIIn2vZL05nv0qPBOKNhz5E+W2slqUWW7X72aJJfsXWZifEhwSrnBc5XrEKJG0XZK9lnvmaP4SAgP3RqTIjzTGJxHvJQX3qdlp7fCtEyhJwXV4HPsg3iBKlWnpiFm8JBw36Q8oWwnl3T05tgENUpViVpLWsutKxCvoZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUL0WKFSAgQUSTbpbD6fIs0hWRhgtQ0XCpq5Iu9xYc4=;
 b=mPIwdLFEPYeV7dxf9bgibQl2goVTL8TsdXZ/nmqufCi8RmfVLlWwh7VK3w5s7EqxgMS5uVl58OVIc0dsuS1OYVPELjUz5oA1GEee8e4L+DspLCvyIZyXNtFlY8TMsDLD2yGapusPSwuAa5RNtEokMb4Z9G7x1GTa2hXp2iHB2gA=
Received: from BL0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:91::28)
 by PH7PR12MB6978.namprd12.prod.outlook.com (2603:10b6:510:1b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 09:20:44 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:91:cafe::63) by BL0PR05CA0018.outlook.office365.com
 (2603:10b6:208:91::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 09:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:20:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:20:43 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:20:37 -0500
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
Subject: [PATCH RESEND 13/31] ASoC: intel/sdw_utils: move rt722 sdca helper
 functions
Date: Thu, 1 Aug 2024 14:44:28 +0530
Message-ID: <20240801091446.10457-14-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|PH7PR12MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: ba93e6c3-81a6-4f67-34a6-08dcb20b38bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nEnSjaAdZUibwpr6o1+9vi47J0Xs6QFACAgDxm/3fbZVGqxhLNcGVmG+Tf3g?=
 =?us-ascii?Q?ZAIkFANnA867cHxY+lcZKu41hirOOAWzGFnqcLdQoq/8TJV5r/otxMCbbDNT?=
 =?us-ascii?Q?o0Ym8vvg5Fq6BinjIQQi7X+pA9WWZCIQMwg0EnfEfXgJ727YZkCUyL9vGxh+?=
 =?us-ascii?Q?Jqq7rNk2mVqjU5s1YrkzA8wAkpVz5jk/kKmnAd9SwP5hZ9KLx1R/wZYKGmSG?=
 =?us-ascii?Q?9lsQWfClgE8I5YtKcoFJ2WGVC4qWaNKM0EVbp73QEA+r4yCIvFaUzNKxP0QC?=
 =?us-ascii?Q?Y+U7vxsfczvG/2r1tjW302z1fJSlce5TXbPHT4Qk5nHI997sBq7y7tsyyJxH?=
 =?us-ascii?Q?9jP/ufj2Hkr1PVe+sScLGaoDxxcoF/J2Y7JGQF0QyCpwoQ5EvX3i0vSk6R26?=
 =?us-ascii?Q?1sPIociyOl0DXT8Ggw1GOQ9ejqTV/llprXt/SA0dteZ3Q0/RxlU87LVlT2Rp?=
 =?us-ascii?Q?+OWksM4NFEBU6rqV68FAAuihU7hwHw9xeCMhq8j3EsVkSCTn2/Izh91W22+g?=
 =?us-ascii?Q?SgK/Ui2ZnXqW3Ka8979tX+m7Egt+eGHYWjp9aEM494TnySJRMNT9y/NsdZOO?=
 =?us-ascii?Q?av29xIlMwcqJsDavhGezyJfpWSlu9U3yDjNWtjeM1tBZeJOwztm0oaiW1x1V?=
 =?us-ascii?Q?yxkXKfL/9TXcTzxEfI6TXaCeAZlaWYx/eUkJkWA7IExDwUKXe6j4ZlxAH5i3?=
 =?us-ascii?Q?r0uZBYGVPeU5510FnsMYwFxHXZK/4j75liVHL1XBl6XxTxEKx6mBC31vrF9I?=
 =?us-ascii?Q?c7US6F9aiZnPTTfGhnj+QE1zUGdHtgNIf9uWkWaLsfBkP0EHGKQe+5iPLGAy?=
 =?us-ascii?Q?tzWsdlZc20AXkXCXj99EYb7OqSIFMi/9FP/YX4Q0AhN1NxGEFUsVIum/fPdc?=
 =?us-ascii?Q?8hsSHo9qUI78jpgt1dZm/LTj5ECCSgbJs1HpJ+/N8mRfv8ZKZYfS26eAyiKO?=
 =?us-ascii?Q?2osTFvYF9HfJaRGQVx44xy5IDf+BRWj+ujtX6gwmP8QACgJWBi9T/vPkmNDt?=
 =?us-ascii?Q?Z9uqzHRMGKKsZ7PxNxx/QnfF9k8jjeesuW1UcMlO8+BTJyae/JXJeyHNJ9gs?=
 =?us-ascii?Q?FZhYWdlMluEb8aAPpQnjFr5mF/hSRkBn2Bv4NNjT2G1Oe4RHvRkfvJzNPBCA?=
 =?us-ascii?Q?0boVRBE4PK7eyoMu7Q7qbWlwg/4WNNj0K+QnNxIqdJ40YJFBgmmLpDdf1Yjw?=
 =?us-ascii?Q?HI98qwfZWHRqOL6y6B79Du+YC4WeVF/cW8nROGdVcqg+z5xa3kEl1psdCVt8?=
 =?us-ascii?Q?6Ef8BlDwAFqiIp1Ym8a640KykRpE14ateSYhBNgbYr5tVlWAIGNVl8bNb13u?=
 =?us-ascii?Q?dJFYshk7UTncP45wpNGc7CFEOg/IDx9lxtwo+KEpF63x5Ezsqx70OHvXBDyV?=
 =?us-ascii?Q?iEgqwZfiRqda8McgvTiDob/Pxq1wPGofU2Y6xIIHuS7G/0uaJA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:20:44.5163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba93e6c3-81a6-4f67-34a6-08dcb20b38bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6978
Message-ID-Hash: IY5A2VABBS5QEHA63WUC7BPPNR32DCIY
X-Message-ID-Hash: IY5A2VABBS5QEHA63WUC7BPPNR32DCIY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IY5A2VABBS5QEHA63WUC7BPPNR32DCIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move RT722 SDCA codec helper file to sdw_utils folder to make it generic.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                             | 1 +
 sound/soc/intel/boards/Makefile                           | 1 -
 sound/soc/intel/boards/sof_sdw_common.h                   | 1 -
 sound/soc/sdw_utils/Makefile                              | 2 +-
 .../soc_sdw_rt722_sdca.c}                                 | 8 +++++---
 5 files changed, 7 insertions(+), 6 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_rt722_sdca.c => sdw_utils/soc_sdw_rt722_sdca.c} (75%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 6fd305253e2a..5bc2a89bced4 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -75,5 +75,6 @@ int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 /* dai_link init callbacks */
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 3bc9d25fc9bb..f3baf9ecfbb7 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -39,7 +39,6 @@ snd-soc-sof-sdw-y += sof_sdw.o				\
 			bridge_cs35l56.o			\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
-			sof_sdw_rt722_sdca.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index b190aae1e093..c7672dc1320c 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -160,7 +160,6 @@ int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index f9a2baa49617..261c60098e88 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
-		       soc_sdw_rt712_sdca.o
+		       soc_sdw_rt712_sdca.o soc_sdw_rt722_sdca.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/sdw_utils/soc_sdw_rt722_sdca.c
similarity index 75%
rename from sound/soc/intel/boards/sof_sdw_rt722_sdca.c
rename to sound/soc/sdw_utils/soc_sdw_rt722_sdca.c
index 2da9134ad1a3..6a402172289f 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt722_sdca.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2023 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_rt722_sdca - Helpers to handle RT722-SDCA from generic machine driver
+ *  soc_sdw_rt722_sdca - Helpers to handle RT722-SDCA from generic machine driver
  */
 
 #include <linux/device.h>
@@ -13,7 +15,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
@@ -36,4 +38,4 @@ int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 
 	return ret;
 }
-
+EXPORT_SYMBOL_NS(asoc_sdw_rt722_spk_rtd_init, SND_SOC_SDW_UTILS);
-- 
2.34.1


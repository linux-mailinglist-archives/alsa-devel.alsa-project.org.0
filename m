Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F66944872
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42E9A335C;
	Thu,  1 Aug 2024 11:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42E9A335C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504715;
	bh=RRWOhkNxk8bwcefOMdSEvxndn4+nmJJpgvQfwB5G1AA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ILfm5Lv1nxV3FwEGEwfR64HdVnUNdT9qSasb6cPZISwPKr495zv3d7sNPYZz7o71w
	 hhzlIACzdPtTBC5vvqU6I3cIj2Pm3gx/rQU4vTIvJuu7FBBpO38uEmhW16Z1bQpTMZ
	 yQjbRR24U1/fyPcuo1M6j7cOfC8RjGpw3KJF3oBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F193F80678; Thu,  1 Aug 2024 11:30:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B579F8065A;
	Thu,  1 Aug 2024 11:30:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93CBDF8026A; Thu,  1 Aug 2024 11:18:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C02DF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C02DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=P7FCZfwc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uViDMPkwqJjnyNLWOZmXTzxKz6E9KQdgQercZ+7v7j49GFxjjV9TtwJq14p6R9URBSGxdlN3q3haQRWy4WErnVB83eICZ3qwVFNcBKJP96yBJMIhLPuN/rgakm+jdyTJ9HPVzMM7CyTdEbidufzegpHlL1B/fefo3QNizOzIaDfEcxsPoJNtl7t6JysfbZYYNC+VACLory3LxKpY1Zit7oK3vnvSjaRvXsGhAnuSw/0V+NK0OSQH8TCzos6AMjx6kGKQFytzHwpBEXXSuuwulU4lWXlmfJ5UZgqPRR5s3J+9Sqj8NXA1+jRlCrnTKBFX1zk8hgsfM/XH4lK5KIXk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHxi7ctKGh80fVvl+RED+g1Xyt1hr9XfoIzAwJv4+84=;
 b=mVv5aHKy7diD+ij+Lw/95BNHwbzhZHwGpjzgzeMF8tz+N/oYDdQ1E/7bVqGvVTaKVxCnjrjse9M+T1lHLcKPV99sKQR0BeK/7hlK1wbbXOgCxKxePtbb8+zZjHxSlUBW2sMSJFMjpJZ2Ghlhi4GoHyHVQSi//AfBpp2Bf0iFBJOmzfWkkKjbGSo2koggZTMVNWA9jBstVPY9y0lTrrgre7agNBA227oWh0dpXtPV8JOfMs+6k75c5I3PJ15YvQJvgM2bY8YfgYfvs0pzEYjxsAfHzeWnAZMxNKeYu+/2UvBOEghSnk6gYOmo0ajSA/IDC1G4bpNMeCfiB+4jmKC5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHxi7ctKGh80fVvl+RED+g1Xyt1hr9XfoIzAwJv4+84=;
 b=P7FCZfwciFtuzJs6/CYUAfaL6BMD4SXSqb2feia3NKk1lHeD2ZBxOsuveoJpgj9Zb3ji1017q15jE+3Kr7xxKAwpW2cKwtcITg6qpVFqQTgZDkhVVJGM5TrUlV8kEUIbMu1WX9JMDh4u2Y52BjWwhyD8VVpy582uPcdM5MHF8Ho=
Received: from CH0P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::11)
 by SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 09:17:56 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::eb) by CH0P221CA0009.outlook.office365.com
 (2603:10b6:610:11c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Thu, 1 Aug 2024 09:17:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:17:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:17:50 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:17:44 -0500
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
 Iwai" <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Brent Lu
	<brent.lu@intel.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 05/31] ASoC: intel: rename maxim codec macros
Date: Thu, 1 Aug 2024 14:44:20 +0530
Message-ID: <20240801091446.10457-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SJ0PR12MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f4e0e5-44e4-4800-0cc4-08dcb20ad30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?69w/AftyS2MDs9ci4ArjEVsoTmT6vWjXvaqwv/HDg41exFmdVxtBixuMs7Yy?=
 =?us-ascii?Q?aZnfkov+mu5c/B6CuHJF69GcGx0KLMj2v6/unubp5b3AYCO1HXKbivZERPC+?=
 =?us-ascii?Q?qbT/V20H5vLFReooA7Y+jzF67VGDaAw9cFKtoheWfLchoDry+dhQISX5ob0j?=
 =?us-ascii?Q?88K6aZt80ZdaCyjdV9+WgyBG7FP9xB6q4C3Y99kMG6HkVXcBcQ1bketPIIL8?=
 =?us-ascii?Q?+FTTuh0XKtL4JtFkJjzDSEhO+ijj7W0qT9mdsrIKek/CQY3yq8/Lf/HcL9U/?=
 =?us-ascii?Q?Lc3Y+ciWqxmeRH9R2I3EtRToKzsKjQIPzYl0PPd+WAb+oSBsSzb60jOjP3sx?=
 =?us-ascii?Q?9mdOm93ygDT9HrvIjx51iZEz2BiadFzim9bgNDrk5gOGWVq0by5Za9fcdh+/?=
 =?us-ascii?Q?f8DjNJRe82C0y599m98snDUCCThubhzVDGw52jSmjcD8yxFw8q7Unl0lBLCo?=
 =?us-ascii?Q?wufoWT0jyJLYhpLucRg4SU8MhvYQnP/E/XzUwmDdgmlVMy/tW/MWPQmys8sy?=
 =?us-ascii?Q?J23oqDB3pZWgKKCKeG8ZD6qv2MdA5s6tuk6/X8BOKCt7x32b+NuBw46UgYZg?=
 =?us-ascii?Q?t+gZ6IcplBNGz0xiR+F9vv624WECbSr4aNeJe7UEMW7VpHMDJlLZhzF21O5o?=
 =?us-ascii?Q?JFuP2EDIKws18LqmEP7SzkW9OlexGhVs3bf07e3c5YFFtfpDYgz5qMBorTBq?=
 =?us-ascii?Q?JMlduZVCgNxE4Mfi2J8hCbEChZX1p4CpjrhG8h+RhPDJBueaTHt0gdjqr7fZ?=
 =?us-ascii?Q?QcqVQRRVyavSMn9yYov+D5TXZ97qH6iMn6tUHZyaEsE+RDGMRniIPAVPn0X0?=
 =?us-ascii?Q?U9xOAos4HdHi1qQiQSOH3zZRQfukaRZBAkshEP9g1AeP9u//LbFcVsndaPJY?=
 =?us-ascii?Q?uOb3KlVInSc1x5TyNEXoV7f/F7A7Hi0xrjtgL+vmASs6kt12EhvqDlQ4pyU9?=
 =?us-ascii?Q?6Dm3e5IYzDI5UOo4EoOfsRoS0d6vrx9amzCwyiAZLR4smawozzk6fPiuMa9f?=
 =?us-ascii?Q?px82ms+OwbDncpQjpcAPS2yC5gJbZOBDPWmC+WmIqJns/kRXcwXs4mx9DcSF?=
 =?us-ascii?Q?+ufpQ2G/7bBgK65OYQFQMtCe5q+E1x1Mmgjs+64AQMR9F8rmGwr8Syxr7VU7?=
 =?us-ascii?Q?KDh1ziHVlulfTonDzuqHpXebFhKruH4DKD9SsDXWDe3LiMz7YNY5R8c/VD+X?=
 =?us-ascii?Q?NSIjpQQJVlnHfj7Qk0v45n8D8l/YEmEwib3VG3LuB1Mb6nUxlKTEqRZFLm49?=
 =?us-ascii?Q?xUa+WFkq1w6rZ7pPT3Q+/F3cKLNal6noIlr/IeJd64q9a0qoFW/sUYOL5MEb?=
 =?us-ascii?Q?53dr+LC4XY8DrLviXKexQEaTPiiUTSeLOopppK8318mCgsA0MJGWoHr4THMn?=
 =?us-ascii?Q?a2g4WHNVUHw5bNpucT/rsVzbHnmAobaRtDqua464vqMzkzjiNA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:17:53.8873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18f4e0e5-44e4-4800-0cc4-08dcb20ad30c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5676
Message-ID-Hash: Z7HSZTWZRT2LXNDXGFR4BZ5YLN2O5Y2R
X-Message-ID-Hash: Z7HSZTWZRT2LXNDXGFR4BZ5YLN2O5Y2R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7HSZTWZRT2LXNDXGFR4BZ5YLN2O5Y2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename maxim codec part id macros.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_maxim.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index fd8347e28849..9933224fcf68 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -13,8 +13,8 @@
 #include "sof_sdw_common.h"
 
 static int maxim_part_id;
-#define SOF_SDW_PART_ID_MAX98363 0x8363
-#define SOF_SDW_PART_ID_MAX98373 0x8373
+#define SOC_SDW_PART_ID_MAX98363 0x8363
+#define SOC_SDW_PART_ID_MAX98373 0x8373
 
 static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	{ "Left Spk", NULL, "Left BE_OUT" },
@@ -127,12 +127,12 @@ int asoc_sdw_maxim_init(struct snd_soc_card *card,
 
 	maxim_part_id = info->part_id;
 	switch (maxim_part_id) {
-	case SOF_SDW_PART_ID_MAX98363:
+	case SOC_SDW_PART_ID_MAX98363:
 		/* Default ops are set in function init_dai_link.
 		 * called as part of function create_sdw_dailink
 		 */
 		break;
-	case SOF_SDW_PART_ID_MAX98373:
+	case SOC_SDW_PART_ID_MAX98373:
 		info->codec_card_late_probe = asoc_sdw_mx8373_sdw_late_probe;
 		dai_links->ops = &max_98373_sdw_ops;
 		break;
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D69445A6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 09:39:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20CA33B6;
	Thu,  1 Aug 2024 09:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20CA33B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722497983;
	bh=RRWOhkNxk8bwcefOMdSEvxndn4+nmJJpgvQfwB5G1AA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y/9hkWC34ImMHZYsRtg0QQEK4VHL4sbYqb4H2b7j4rDN0Mfnd5K4ra+Jvt138tD+O
	 hwMfCM7wNV2cAAjc7hfDU262PmcPM+ssd7mFr/vPUxj63B71BjCgdSTpAW5Y2aLnx5
	 lNlUeSvYAqvve+U+fiTOV3+H64VB98woYb1RBR5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B6F2F802DB; Thu,  1 Aug 2024 09:39:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6508DF805B0;
	Thu,  1 Aug 2024 09:39:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8FC3F80588; Thu,  1 Aug 2024 08:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D0F7F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D0F7F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lxCPFiD8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqVTr7rqLy18Hsb8UTcmM3oHU9fmm6k481yiv3SYFFGbBJ13ETGnDC8hn4QBYL4kOQlr66CZiCAzYYxoa+sFSp1SpJClTLLuWn7egMU9UPwu4/OHmLRtRJIVo3RYIjrKn1VqAQaAVb5kJ4xxqBy+tEIUB8lin+HfxCetcamLtRJwd5sDpWsuqE0oZXAzgM1xTNFzRL0ooTiygtLnGb94uAihE7SQPQ02N+9N0ztZgvxx5bC8Jlrevz37dCjQYq9kJW+TUK9lRJDGTrbsk0II+CDNS3CkLuk+3sU6giWn2zthWSmAYgQhGhv4jlEq7jgf/2fRDjQeiKDzqvripTOHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHxi7ctKGh80fVvl+RED+g1Xyt1hr9XfoIzAwJv4+84=;
 b=Kq8jDOekzIjSrqcnSSv6I6kgmoTpCifg4Wrz0VFH0olH5qFfSdE96GDxVfDaj43gZe8ozosQPWjF+HN6DQWh0Lg3kR5TEOS9RW2maeaSQEVvVLhBHsue4HjFjIHlZuvnspM/RYoLqyrFuI6AJyS8qyKhrFt1PvWI3eXobVibHSMUb7a2Xvk+zh8kqZNiKXCDzNPvgFsO3yD5eehVk8WjsB2w3BvZDafos2g6KjrrJdESaoekCLAZVf8k1HpZWdRr4dk6bcEaDIoukHD1UpllmonKiRurCflMmbl8VOLYnWerezl0EMlwfy5qnusoSuTrs2oefZB92Oi65xZEyhXJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHxi7ctKGh80fVvl+RED+g1Xyt1hr9XfoIzAwJv4+84=;
 b=lxCPFiD8y+Y0agwI6210deAN/y8RIT+0wZTPKr/6Zv8ya/6Y8uHh0moXlDxJVme6qTD+wzl/5K/KWAfcOM40PlUqbvkcTSxn3iRerxAMOwx2zvgbS+BRlcoTCFpe2NGMDJC2Z37wrmG2jGur9SqkCf0ztPpbm+EelMrNSwyVFjs=
Received: from DM6PR11CA0026.namprd11.prod.outlook.com (2603:10b6:5:190::39)
 by MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 06:27:12 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::fc) by DM6PR11CA0026.outlook.office365.com
 (2603:10b6:5:190::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 06:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:27:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:27:10 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:27:03 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Cezary Rojewski
	<cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 05/31] ASoC: intel: rename maxim codec macros
Date: Thu, 1 Aug 2024 11:53:50 +0530
Message-ID: <20240801062416.2203673-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 82de74ec-9df0-4e10-fa7b-08dcb1f2fa40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aPwpU2V2tpulWk0mGBZZsLMsAvC6ntLtsDhp8OrG4dvcIKr+d0UebgI0DSY0?=
 =?us-ascii?Q?7MV6l17PKc2WRblZ90SR4lz18k2hB8Othfq9bjc8+osvkO4ZNxuQpQock3ix?=
 =?us-ascii?Q?EqCl8p3H4EP4CsBzucv7IpMIRCI39jVZauvWREvwfj1CxQZEUK/RIgY441HS?=
 =?us-ascii?Q?qB9VHbaiVB4+0ABx5pR3YnJd3rYQzcX2b7IVcEoWPK4ByF44YLjAOd05IiRK?=
 =?us-ascii?Q?kiu9vcT8graXvyFlBqJc4eyTzGFJ7UwggYXWwAxQPWb4xvGWPMMP5+WuGCkb?=
 =?us-ascii?Q?jKF6k8TGcqYuM46GxG5caDrr89uU+omaqZqD5SA0FgQS/rsuIapHa6RCFi+D?=
 =?us-ascii?Q?xOac/Mj2VBhJvDi9wrUgdNlEJ6ORHosbyqsCbbQtFKi9n/B2zmPireywn1yz?=
 =?us-ascii?Q?tHCbiMeOFGgEdVQDHTzbWiX4CaQ0uJ0pkNxCZ0emXOzDg7k17Ck2RwFbEAvB?=
 =?us-ascii?Q?fCzOZ3gzr4LYpEwwN5hA3GArwSp2CabVKRJz7hUMjwqzxGH3nbAp6aKHq0Ok?=
 =?us-ascii?Q?eg02Qs5RGelWckuBulgF32hCvFeV6Srog3siO9bDVkvKGCviNuOEYGNmWYVa?=
 =?us-ascii?Q?RBL9FVy8qf49QVUA/i9cJxYfEcb/TFRRE99q16kyhgsSfTjDB+s26GTj36p2?=
 =?us-ascii?Q?d/Gsd/p3QhhNA9q6JjE5z5JA4FYx4R34RPGQWEGA/iWSwR92/TBLnbgCF/ks?=
 =?us-ascii?Q?ER31peMTBRriC/GqWplPSvsYJs9kfbpMTf1z5X4TMsGINLgpObPVLpBii1HT?=
 =?us-ascii?Q?UWoxvoJrl7Q/Swey0Ze0kZsaHArX67RnWcUNBD+nv2o9AUI1/7DpulgtZDy1?=
 =?us-ascii?Q?fSEsU75+Kb38srZ9Qj5mugo1mV/4EzuyNZKaxGxCaYiMvXNN51TmaOTPZboI?=
 =?us-ascii?Q?bgf8OFP4LilSxIMlkSTIuvpZt02BjsES22q3ke8XcviBuaCisYtEEGdRpbcX?=
 =?us-ascii?Q?tSjTn8GFkxMkbwv6D1DDqMOxQCMOZ38aWOcawRui9ZTECoYIxUlEPXvNvBM4?=
 =?us-ascii?Q?6xiA4veA8DbfAZRZ0uCxc98zrlWMuOKeZ7QzEG2Zv573KCXeSve62k7z5NfO?=
 =?us-ascii?Q?o3z/VDB0dXlz48xLhkHSApQEYKo7iLiTBQSrXrWaWQ+XdjnPN0WXkv8HWMsf?=
 =?us-ascii?Q?OMHEKxTcWtGvhKyXR0f8sa/aWmxQInhLO0bJSgL0iY5lI2LLJXPqdHKeW7sa?=
 =?us-ascii?Q?mPmmUVGYitGGf9Te8OECtFoIcdTvYJa+HlxYNgb7wSwB+MFzkLkyMurc0Dnh?=
 =?us-ascii?Q?KA+pDmBw2uTF/K+uy+hwG4lv+LS1LmzgHQtGKWxhBpaOGpMXG8c2TBgdlhMy?=
 =?us-ascii?Q?gmyBROafkdPCK1MtHsvwxMnlqET7gBDYYF1/6XCXu5hKtefyWQtD1P/iaWp1?=
 =?us-ascii?Q?7iSGQd5/gYFQ/FnHrKFAXQY7QbCFK4jBeswDI4fKKMgV6OecSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:27:11.7282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82de74ec-9df0-4e10-fa7b-08dcb1f2fa40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730
Message-ID-Hash: SLXMUCGMI6M6VF2QBKIW2BN6LBB6V55Y
X-Message-ID-Hash: SLXMUCGMI6M6VF2QBKIW2BN6LBB6V55Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLXMUCGMI6M6VF2QBKIW2BN6LBB6V55Y/>
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


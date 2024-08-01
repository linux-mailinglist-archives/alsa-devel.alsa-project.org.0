Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4509445A5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 09:39:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 479AB338B;
	Thu,  1 Aug 2024 09:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 479AB338B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722497945;
	bh=SC8XXaYdHrqKX305sqiPjndkCoUs8X1omIPvwLm2EY8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TSjfDNOi0wUkSkgU0IT/LGk+s9wcu8h/Va+g+LaEPb9nYCYW1wLIz1nkuMtakrMiR
	 z4XHMl+dsEe4NISNKt71BZ1oQHN5wTebConMXCoq0F+YKoKV/ell4DmldfA6es5Fbz
	 RQHZK1oPr4BfsMtV1OGiiifkpz2m+GffX0owgcIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B7CF805B0; Thu,  1 Aug 2024 09:38:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A2AFF805AF;
	Thu,  1 Aug 2024 09:38:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D00F5F80580; Thu,  1 Aug 2024 08:27:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EED90F8026A
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EED90F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=EBzLX/jF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyaX9eB+XzugnzBKfeLQ2FUw0AguNMTYijtxIHBpI/bEBAh3HM6zk8DLfZTVTgjKJcFWnwqJHShxGzQ9wsDficqSW0EG21arY++e237lxONXCdqzrG7mW9lv3HjF2tMyhxkUutaDpfx9WODdxyssO4nMU/WuKH/FqfVVKF0I72oZI/RFdzcDuF9L6hsdFt/DJkia5S/dks5UcUnAuvSYMoZuv4RVHhkP9rb2Ad3oPlXCQ42nWeh4HVDkpbNbm7FBRvlMdbOeVmm8Hn8U+vD4oLpHXbpKt86GNvp3DXhduF6K+Qwtauo+0WwcdGjlsHz5Le60NZxuoGLko91N+huPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pb/kCjdaY9LTHpq/7zeLBfpDJbotmGDtNOiv6yPhE9E=;
 b=gsm6Xncg6ZO+mOb3pogKCsxxLzOeZQ5xxBkFjIw8unHT3CujzuDag8E3X15iRZnj3E8MEZQdRJ90UF6FGohxmsRKAsPEVQO/ro7man/aNigImqzu092Dv9NIImw2A9wcN+oijCKyRw41HzTGFqGAslg3xsm+paM1qMjlzPt6O4Puk/XUnqjn1vUcNAFlUoM8IWBez/NwjzTf1diktXs/pIDrRsAjEzM6a0QsFgKH+MEgGpnuP2TfsQ7IxqC4dx/DE5MUp4dm+eFBMI1tRHJXeApD+pYq5E9WXWjpUsTsNO5vZ+1pOpvmvjtYgPeRMYo1n/1wU9H+SZwbCa/9SYTAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pb/kCjdaY9LTHpq/7zeLBfpDJbotmGDtNOiv6yPhE9E=;
 b=EBzLX/jFrWRLBjG1Rkq8oz3esDk6o6qCEsBaL2K2l/XGU0FNdPpq/aqoCj/BT8qWPMA+Xk4pLgmkxo5+7dQUT8gPhyixrerEwVFfDTXYSslGV21SlVz6ESwDXZ9dxpD1jTkEMZkIO6QYsR0Ca8fEQz1PjwSi/5iyDPIQJJ65AY8=
Received: from BN9P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::16)
 by PH7PR12MB7915.namprd12.prod.outlook.com (2603:10b6:510:27c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:25:41 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::62) by BN9P223CA0011.outlook.office365.com
 (2603:10b6:408:10b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Thu, 1 Aug 2024 06:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:25:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:25:34 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:25:28 -0500
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
 Iwai" <tiwai@suse.com>, Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Chao Song
	<chao.song@linux.intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 02/31] ASoC: intel: rename soundwire common header macros
Date: Thu, 1 Aug 2024 11:53:47 +0530
Message-ID: <20240801062416.2203673-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|PH7PR12MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 56806156-07e6-46c4-28b3-08dcb1f2c3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AtZH2go94zVVcRv8mRQNxCC/HLqN3gwfSQnVyQU4KOPMVIFVX3jFMiNoG2G2?=
 =?us-ascii?Q?Nzw/U32HtIP18gkEiBWtzRUPY9s1hleA6SkMJv4tJIZBkOhvDfstDIcR5w2r?=
 =?us-ascii?Q?hjIMkfyVEFwx8jsTF1NzO1whM0vv9VZ0kZQWeZZ8Om+RvcbIwMAZrO+McFWx?=
 =?us-ascii?Q?TjadQNau0+OSULHBSx6AtjhAfW6PNVA6fX+IZiAskNlUT8iYisqow0XI8pDb?=
 =?us-ascii?Q?42CCeZgK1c6BBBPn66m3+iKhydfeU9rByOWOzY1wNZH4Ovf69i4FRlEQN1Zx?=
 =?us-ascii?Q?QgPQt0wQwsQOGCn++HVy1O7nQwMplNFfo+KwlGjgi8BhoCvEl2ksPbSU+hVe?=
 =?us-ascii?Q?EButAkmeDF3RGObCoqfQ6Qcc4SuZxtcM02QG49DdYt4NexeDXkGWX4Y9+dn3?=
 =?us-ascii?Q?fpxGUOmNvHDO0xLdGdtx1owYN3G6szmpBe+U+I48/48M/1bcNOkY7lNU/y5O?=
 =?us-ascii?Q?ebH/Bb0REirRaH3h3sadJRui/VBX/em12hlq/XsqM9V2p5U7ww8Fksanyw31?=
 =?us-ascii?Q?+Hbo3YYKExz4mnG/M4P4JgFzWex+tp2Eow20DW+liEJKwKKdFKLpNPShgEGf?=
 =?us-ascii?Q?/AJTi7t1UrrqE5dEydlcwN00MhPu9y95IGERqIX2dncCDrzKM3teQGra0bRy?=
 =?us-ascii?Q?TBlFKF15M9sCyO/CrU7OYrteQ9k9QEQWW0FGjauYnABA6bmdWzyirbz/bdfb?=
 =?us-ascii?Q?ULWuGh5emk0GqM8wMUidBttl+VmG6wnwjJjSoxiVycuKQppcmDwg43Jpj8DF?=
 =?us-ascii?Q?IADFhfmgFHGCdVDzbvq1WyH5Bl8QvatOq8vqjD7xlWgOHzEgTACzBdaNk//n?=
 =?us-ascii?Q?/g76tUyqyI0vEXp18y7BoypbMKednUYUevcaGN+5af8h+CK8NNyyFlgVokdj?=
 =?us-ascii?Q?GVyQB+KYRYgniUrdD7bITsqtJkDJw5KiqoACBN8CK/ZiqD8BDYFu/cLejBvA?=
 =?us-ascii?Q?hD6FfX2CzvXegFH69v08XOGZTN8D8GCRG7X5DJJVbazw86uNh0nqj/Rfr7fB?=
 =?us-ascii?Q?OTwIasL0tCA5gkOoyBv/O/TDmUpR7CkIj5W/KEMkDIaAO2jBr48tEdJByr7D?=
 =?us-ascii?Q?x9Yw46XKbHD4pnu1uTrxwtftFnwulgH2SohnwSgyr1eboqsr25HWgHqEGEth?=
 =?us-ascii?Q?zNwVuTyGReYqfpED6OKiuq0BCCmtpadU6HrAWev/1cvA9Mjbu7xAVhrIYDl4?=
 =?us-ascii?Q?tDMUJKpT+adguCCnVuxU16R0YOHScktSMmTx+oOavYnEwjSHXwyXWiO11cWH?=
 =?us-ascii?Q?VZP8TLb7JVdo+VT2S3ddYie613zNWurForG4cpGTlJFwp2d484iclusvmXWT?=
 =?us-ascii?Q?b7+KXNSy7PEly1BQ50AiyzpPpHUMpB7ENKGMOSrdaoKqAI5YDf4CxNKv+PAg?=
 =?us-ascii?Q?QH2rxWP5DhMKTKVXUWRSitdEKAOu41U3feneDXmxWmIP//JvxA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:25:40.4805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56806156-07e6-46c4-28b3-08dcb1f2c3d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7915
Message-ID-Hash: F7FBIJFI5HQSES7TDJSEWFYEJZ2QVUOK
X-Message-ID-Hash: F7FBIJFI5HQSES7TDJSEWFYEJZ2QVUOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7FBIJFI5HQSES7TDJSEWFYEJZ2QVUOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename sof quirk macros, dai type and dai link macros with "SOC_SDW" tag.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bridge_cs35l56.c       |   6 +-
 sound/soc/intel/boards/sof_sdw.c              | 184 +++++++++---------
 sound/soc/intel/boards/sof_sdw_common.h       |  46 ++---
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |   2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |   6 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |   8 +-
 6 files changed, 126 insertions(+), 126 deletions(-)

diff --git a/sound/soc/intel/boards/bridge_cs35l56.c b/sound/soc/intel/boards/bridge_cs35l56.c
index b289bcb3847a..6b2526c781e5 100644
--- a/sound/soc/intel/boards/bridge_cs35l56.c
+++ b/sound/soc/intel/boards/bridge_cs35l56.c
@@ -98,7 +98,7 @@ static const struct snd_soc_dai_link bridge_dai_template = {
 int bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
 				 int *num_dais, int *num_devs)
 {
-	if (sof_sdw_quirk & SOF_SIDECAR_AMPS) {
+	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS) {
 		(*num_dais)++;
 		(*num_devs) += ARRAY_SIZE(bridge_cs35l56_name_prefixes);
 	}
@@ -110,7 +110,7 @@ int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links,
 			       struct snd_soc_codec_conf **codec_conf)
 {
-	if (sof_sdw_quirk & SOF_SIDECAR_AMPS) {
+	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS) {
 		**dai_links = bridge_dai_template;
 
 		for (int i = 0; i < ARRAY_SIZE(bridge_cs35l56_name_prefixes); i++) {
@@ -130,7 +130,7 @@ int bridge_cs35l56_spk_init(struct snd_soc_card *card,
 			    struct asoc_sdw_codec_info *info,
 			    bool playback)
 {
-	if (sof_sdw_quirk & SOF_SIDECAR_AMPS)
+	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS)
 		info->amp_num += ARRAY_SIZE(bridge_cs35l56_name_prefixes);
 
 	return 0;
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 26c467bb81a3..64fb53772c04 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -23,24 +23,24 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 static void log_quirks(struct device *dev)
 {
-	if (SOF_JACK_JDSRC(sof_sdw_quirk))
+	if (SOC_SDW_JACK_JDSRC(sof_sdw_quirk))
 		dev_dbg(dev, "quirk realtek,jack-detect-source %ld\n",
-			SOF_JACK_JDSRC(sof_sdw_quirk));
-	if (sof_sdw_quirk & SOF_SDW_FOUR_SPK)
-		dev_err(dev, "quirk SOF_SDW_FOUR_SPK enabled but no longer supported\n");
+			SOC_SDW_JACK_JDSRC(sof_sdw_quirk));
+	if (sof_sdw_quirk & SOC_SDW_FOUR_SPK)
+		dev_err(dev, "quirk SOC_SDW_FOUR_SPK enabled but no longer supported\n");
 	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
 		dev_dbg(dev, "quirk SOF_SDW_TGL_HDMI enabled\n");
-	if (sof_sdw_quirk & SOF_SDW_PCH_DMIC)
-		dev_dbg(dev, "quirk SOF_SDW_PCH_DMIC enabled\n");
+	if (sof_sdw_quirk & SOC_SDW_PCH_DMIC)
+		dev_dbg(dev, "quirk SOC_SDW_PCH_DMIC enabled\n");
 	if (SOF_SSP_GET_PORT(sof_sdw_quirk))
 		dev_dbg(dev, "SSP port %ld\n",
 			SOF_SSP_GET_PORT(sof_sdw_quirk));
-	if (sof_sdw_quirk & SOF_SDW_NO_AGGREGATION)
-		dev_err(dev, "quirk SOF_SDW_NO_AGGREGATION enabled but no longer supported\n");
-	if (sof_sdw_quirk & SOF_CODEC_SPKR)
-		dev_dbg(dev, "quirk SOF_CODEC_SPKR enabled\n");
-	if (sof_sdw_quirk & SOF_SIDECAR_AMPS)
-		dev_dbg(dev, "quirk SOF_SIDECAR_AMPS enabled\n");
+	if (sof_sdw_quirk & SOC_SDW_NO_AGGREGATION)
+		dev_err(dev, "quirk SOC_SDW_NO_AGGREGATION enabled but no longer supported\n");
+	if (sof_sdw_quirk & SOC_SDW_CODEC_SPKR)
+		dev_dbg(dev, "quirk SOC_SDW_CODEC_SPKR enabled\n");
+	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS)
+		dev_dbg(dev, "quirk SOC_SDW_SIDECAR_AMPS enabled\n");
 }
 
 static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
@@ -57,7 +57,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "CometLake Client"),
 		},
-		.driver_data = (void *)SOF_SDW_PCH_DMIC,
+		.driver_data = (void *)SOC_SDW_PCH_DMIC,
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -99,7 +99,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Ice Lake Client"),
 		},
-		.driver_data = (void *)SOF_SDW_PCH_DMIC,
+		.driver_data = (void *)SOC_SDW_PCH_DMIC,
 	},
 	/* TigerLake devices */
 	{
@@ -111,7 +111,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD1 |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					SOF_SSP_PORT(SOF_I2S_SSP2)),
 	},
 	{
@@ -159,7 +159,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Volteer"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
@@ -170,7 +170,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Ripto"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC),
+					SOC_SDW_PCH_DMIC),
 	},
 	{
 		/*
@@ -185,7 +185,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Conv"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					RT711_JD1),
 	},
 	{
@@ -199,7 +199,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8709"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					RT711_JD1),
 	},
 	{
@@ -210,7 +210,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "LAPBC"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					RT711_JD1),
 	},
 	{
@@ -221,7 +221,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "LAPBC710"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					RT711_JD1),
 	},
 	{
@@ -232,7 +232,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "LAPRC"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					RT711_JD2_100K),
 	},
 	{
@@ -243,7 +243,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "LAPRC710"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					RT711_JD2_100K),
 	},
 	/* TigerLake-SDCA devices */
@@ -293,7 +293,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Brya"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
+					SOC_SDW_PCH_DMIC |
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
@@ -501,7 +501,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Rex"),
 		},
-		.driver_data = (void *)(SOF_SDW_PCH_DMIC |
+		.driver_data = (void *)(SOC_SDW_PCH_DMIC |
 					SOF_BT_OFFLOAD_SSP(1) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
@@ -529,7 +529,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE3")
 		},
-		.driver_data = (void *)(SOF_SIDECAR_AMPS),
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -537,7 +537,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE4")
 		},
-		.driver_data = (void *)(SOF_SIDECAR_AMPS),
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
 	},
 	{}
 };
@@ -738,8 +738,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt700-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.rtd_init = rt700_rtd_init,
 				.controls = rt700_controls,
 				.num_controls = ARRAY_SIZE(rt700_controls),
@@ -756,8 +756,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt711-sdca-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
 				.rtd_init = rt_sdca_jack_rtd_init,
@@ -776,8 +776,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt711-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt711_init,
 				.exit = sof_sdw_rt711_exit,
 				.rtd_init = rt711_rtd_init,
@@ -796,8 +796,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt712-sdca-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
 				.rtd_init = rt_sdca_jack_rtd_init,
@@ -809,8 +809,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "rt712-sdca-aif2",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt712_spk_rtd_init,
@@ -829,8 +829,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "rt712-sdca-dmic-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
@@ -843,8 +843,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt712-sdca-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
 				.rtd_init = rt_sdca_jack_rtd_init,
@@ -863,8 +863,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "rt712-sdca-dmic-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
@@ -877,8 +877,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "rt1308-aif",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt_amp_spk_rtd_init,
@@ -897,8 +897,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt1316-aif",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt_amp_spk_rtd_init,
@@ -916,8 +916,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt1318-aif",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt_amp_spk_rtd_init,
@@ -937,8 +937,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "rt715-sdca-aif2",
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
@@ -952,8 +952,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "rt715-sdca-aif2",
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
@@ -967,8 +967,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "rt715-aif2",
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
@@ -982,8 +982,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "rt715-aif2",
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
@@ -996,8 +996,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt722-sdca-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
 				.rtd_init = rt_sdca_jack_rtd_init,
@@ -1009,9 +1009,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "rt722-sdca-aif2",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt722-sdca codec driver*/
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt722_spk_rtd_init,
@@ -1023,8 +1023,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "rt722-sdca-aif3",
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
@@ -1036,8 +1036,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "max98373-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_maxim_init,
 				.rtd_init = maxim_spk_rtd_init,
 				.controls = maxim_controls,
@@ -1054,8 +1054,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "max98363-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_maxim_init,
 				.rtd_init = maxim_spk_rtd_init,
 				.controls = maxim_controls,
@@ -1072,8 +1072,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt5682-sdw",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.rtd_init = rt5682_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
@@ -1089,8 +1089,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "cs35l56-sdw1",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_cs_amp_init,
 				.rtd_init = cs_spk_rtd_init,
 				.controls = generic_spk_controls,
@@ -1107,8 +1107,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "cs42l42-sdw",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.rtd_init = cs42l42_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
@@ -1127,8 +1127,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "cs42l43-dp5",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.rtd_init = cs42l43_hs_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
@@ -1138,8 +1138,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "cs42l43-dp1",
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = cs42l43_dmic_rtd_init,
 				.widgets = generic_dmic_widgets,
 				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
@@ -1147,21 +1147,21 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "cs42l43-dp2",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 			},
 			{
 				.direction = {true, false},
 				.dai_name = "cs42l43-dp6",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_cs42l43_spk_init,
 				.rtd_init = cs42l43_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
-				.quirk = SOF_CODEC_SPKR | SOF_SIDECAR_AMPS,
+				.quirk = SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS,
 			},
 		},
 		.dai_num = 4,
@@ -1173,8 +1173,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "sdw-mockup-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 			},
 		},
 		.dai_num = 1,
@@ -1186,8 +1186,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "sdw-mockup-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 			},
 		},
 		.dai_num = 1,
@@ -1199,8 +1199,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "sdw-mockup-aif1",
-				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 			},
 		},
 		.dai_num = 1,
@@ -1212,8 +1212,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.dai_name = "sdw-mockup-aif1",
 				.direction = {false, true},
-				.dai_type = SOF_SDW_DAI_TYPE_MIC,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 			},
 		},
 		.dai_num = 1,
@@ -1767,7 +1767,7 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 	int ret, i;
 
 	for (i = 0; i < SDW_MAX_LINKS; i++)
-		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
+		ctx->sdw_pin_index[i] = SOC_SDW_INTEL_BIDIR_PDI_BASE;
 
 	/* generate DAI links by each sdw link */
 	while (sof_dais->initialised) {
@@ -1971,7 +1971,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
 
 	/* enable dmic01 & dmic16k */
-	if (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num)
+	if (sof_sdw_quirk & SOC_SDW_PCH_DMIC || mach_params->dmic_num)
 		dmic_num = 2;
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index ebacb55de318..6ddfb1f9639a 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -14,16 +14,16 @@
 #include <sound/soc.h>
 #include "sof_hdmi_common.h"
 
-#define MAX_NO_PROPS 2
+#define SOC_SDW_MAX_NO_PROPS 2
 #define MAX_HDMI_NUM 4
-#define SDW_UNUSED_DAI_ID -1
-#define SDW_JACK_OUT_DAI_ID 0
-#define SDW_JACK_IN_DAI_ID 1
-#define SDW_AMP_OUT_DAI_ID 2
-#define SDW_AMP_IN_DAI_ID 3
-#define SDW_DMIC_DAI_ID 4
-#define SDW_MAX_CPU_DAIS 16
-#define SDW_INTEL_BIDIR_PDI_BASE 2
+#define SOC_SDW_UNUSED_DAI_ID -1
+#define SOC_SDW_JACK_OUT_DAI_ID 0
+#define SOC_SDW_JACK_IN_DAI_ID 1
+#define SOC_SDW_AMP_OUT_DAI_ID 2
+#define SOC_SDW_AMP_IN_DAI_ID 3
+#define SOC_SDW_DMIC_DAI_ID 4
+#define SOC_SDW_MAX_CPU_DAIS 16
+#define SOC_SDW_INTEL_BIDIR_PDI_BASE 2
 
 #define SDW_MAX_LINKS		4
 
@@ -44,27 +44,27 @@ enum {
 	SOF_I2S_SSP5 = BIT(5),
 };
 
-#define SOF_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
+#define SOC_SDW_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 /* Deprecated and no longer supported by the code */
-#define SOF_SDW_FOUR_SPK		BIT(4)
+#define SOC_SDW_FOUR_SPK		BIT(4)
 #define SOF_SDW_TGL_HDMI		BIT(5)
-#define SOF_SDW_PCH_DMIC		BIT(6)
+#define SOC_SDW_PCH_DMIC		BIT(6)
 #define SOF_SSP_PORT(x)		(((x) & GENMASK(5, 0)) << 7)
 #define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 7) & GENMASK(5, 0))
 /* Deprecated and no longer supported by the code */
-#define SOF_SDW_NO_AGGREGATION		BIT(14)
+#define SOC_SDW_NO_AGGREGATION		BIT(14)
 /* If a CODEC has an optional speaker output, this quirk will enable it */
-#define SOF_CODEC_SPKR			BIT(15)
+#define SOC_SDW_CODEC_SPKR		BIT(15)
 /*
  * If the CODEC has additional devices attached directly to it.
  *
  * For the cs42l43:
  *   - 0 - No speaker output
- *   - SOF_CODEC_SPKR - CODEC internal speaker
- *   - SOF_SIDECAR_AMPS - 2x Sidecar amplifiers + CODEC internal speaker
- *   - SOF_CODEC_SPKR | SOF_SIDECAR_AMPS - Not currently supported
+ *   - SOC_SDW_CODEC_SPKR - CODEC internal speaker
+ *   - SOC_SDW_SIDECAR_AMPS - 2x Sidecar amplifiers + CODEC internal speaker
+ *   - SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS - Not currently supported
  */
-#define SOF_SIDECAR_AMPS		BIT(16)
+#define SOC_SDW_SIDECAR_AMPS		BIT(16)
 
 /* BT audio offload: reserve 3 bits for future */
 #define SOF_BT_OFFLOAD_SSP_SHIFT	15
@@ -73,11 +73,11 @@ enum {
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
 #define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(18)
 
-#define SOF_SDW_DAI_TYPE_JACK		0
-#define SOF_SDW_DAI_TYPE_AMP		1
-#define SOF_SDW_DAI_TYPE_MIC		2
+#define SOC_SDW_DAI_TYPE_JACK		0
+#define SOC_SDW_DAI_TYPE_AMP		1
+#define SOC_SDW_DAI_TYPE_MIC		2
 
-#define SOF_SDW_MAX_DAI_NUM		8
+#define SOC_SDW_MAX_DAI_NUM		8
 
 struct asoc_sdw_codec_info;
 
@@ -108,7 +108,7 @@ struct asoc_sdw_codec_info {
 	const u8 acpi_id[ACPI_ID_LEN];
 	const bool ignore_pch_dmic;
 	const struct snd_soc_ops *ops;
-	struct asoc_sdw_dai_info dais[SOF_SDW_MAX_DAI_NUM];
+	struct asoc_sdw_dai_info dais[SOC_SDW_MAX_DAI_NUM];
 	const int dai_num;
 
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index e8370c3c96fd..1688f29a977a 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -104,7 +104,7 @@ int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *da
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
-	if (!(sof_sdw_quirk & SOF_SIDECAR_AMPS)) {
+	if (!(sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS)) {
 		/* Will be set by the bridge code in this case */
 		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 						  "%s spk:cs42l43-spk",
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 9ea8de609669..fff76291fca2 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -23,13 +23,13 @@
  */
 static int rt711_add_codec_device_props(struct device *sdw_dev)
 {
-	struct property_entry props[MAX_NO_PROPS] = {};
+	struct property_entry props[SOC_SDW_MAX_NO_PROPS] = {};
 	struct fwnode_handle *fwnode;
 	int ret;
 
-	if (!SOF_JACK_JDSRC(sof_sdw_quirk))
+	if (!SOC_SDW_JACK_JDSRC(sof_sdw_quirk))
 		return 0;
-	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOF_JACK_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOC_SDW_JACK_JDSRC(sof_sdw_quirk));
 
 	fwnode = fwnode_create_software_node(props, NULL);
 	if (IS_ERR(fwnode))
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index b63f4952e7d1..9c3b93f808a2 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -23,14 +23,14 @@
  */
 static int rt_sdca_jack_add_codec_device_props(struct device *sdw_dev)
 {
-	struct property_entry props[MAX_NO_PROPS] = {};
+	struct property_entry props[SOC_SDW_MAX_NO_PROPS] = {};
 	struct fwnode_handle *fwnode;
 	int ret;
 
-	if (!SOF_JACK_JDSRC(sof_sdw_quirk))
+	if (!SOC_SDW_JACK_JDSRC(sof_sdw_quirk))
 		return 0;
 
-	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOF_JACK_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOC_SDW_JACK_JDSRC(sof_sdw_quirk));
 
 	fwnode = fwnode_create_software_node(props, NULL);
 	if (IS_ERR(fwnode))
@@ -168,7 +168,7 @@ int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link
 	if (!ctx->headset_codec_dev)
 		return 0;
 
-	if (!SOF_JACK_JDSRC(sof_sdw_quirk))
+	if (!SOC_SDW_JACK_JDSRC(sof_sdw_quirk))
 		return 0;
 
 	device_remove_software_node(ctx->headset_codec_dev);
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262B944879
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A3C73896;
	Thu,  1 Aug 2024 11:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A3C73896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504736;
	bh=929Cw9r+c2BL0Vnc8cCXwQGvRi8hiyBrAUflFaXiA7Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S2SrIclcgKi2Bfa9suqfppcki7Stu57Ew3rJpcLt68tMXX+k+PxFGtZsI9jEYwgwW
	 XocBdICXNAdbpvW1WM78rinoB6tJwxCxQ87OIPybCeoaDwaAPORoyMdVv8u1O+WTch
	 LflPFFGjOaBP6gTZ6ebSQwgu0ETyXDhV3kouaTas=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E85B8F805D5; Thu,  1 Aug 2024 11:30:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7871F80689;
	Thu,  1 Aug 2024 11:30:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49006F8026A; Thu,  1 Aug 2024 11:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E79DF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E79DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5CKx8qgl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyLxjc/3/HByzR9FMw5BNIBvyX9stJ4Jsk4UJeiMrnPO9Jz+JpB3Y61B92yyw0SSuxapLPUVEbIEHGvs2qNMKy9TbfAdoziMcF9/gnDbJplYBEUJcfnIFosinTzviWg8VLR8hmon77V9G/7K18hIXdz7gD2Zc3Bl4Cfnm5x8LaR7xKkI12anMKtyJfO7XJmOeIhNWEdqvJsGTeXa0JXKINHWzJ7W6SRzxxeD+2WPtwue/UH7buhlJVCSpGoUQ7q7W0AUuIaj4KBEFaTRaPOm1FN0Rs2frKV9neZZSl069B2UawUBT8m76CUdjVTALiTtJa9dskWpzqaU2GYudoGebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNOtexsJH/a9wEuZJl1vRdbZkCUD0L0ijL6tYqKYwS4=;
 b=wjYFz2rnpl7YBo9BW6aiqsoXyyAVYW2cSA1hjdgZ6y97rYvxqWuZ0n69aRlv4npn8FV518AkFpzzBVaqt5q0Jyiy4sXgU39fZHKjtQjkGPTf8zv70NGNIe3KhOuzMoX/i5PICaKyx1114oP9WpOoCT8Y1fq7rOoEQFbfZdXpc9REdrzR3f4LSTIRXa2IeUYDESysvL44AIsxPjmh5vKd5JohVBcnUbEAKRwvbF+M8KLTLB3Jc0hK1CE3k/dRM5x9EauG8xmLeqg+vkIISpQ0miiBJP0QE4zqLXAevHLrZ9BH0xVaJExgR6gMHRPkHwy+5kDnqsXi2djfpeoY2da3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNOtexsJH/a9wEuZJl1vRdbZkCUD0L0ijL6tYqKYwS4=;
 b=5CKx8qglGsKLxB7M9SB0IJO/nkyCRgliQrJWqDjeVgjzhBLI7yTAYvXl4eAY3IvbuNFiVPYy9BOaw098clPrdEdSnMzjFalMsEddg4r9Y5fJkhGQf6wlFXVVN/cxCSZj8MBhosvwwGbiHo8DGOjrUqcaWUg434Oif2FOOP9sdrA=
Received: from CH2PR08CA0030.namprd08.prod.outlook.com (2603:10b6:610:5a::40)
 by SA3PR12MB7805.namprd12.prod.outlook.com (2603:10b6:806:319::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 09:18:04 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::5e) by CH2PR08CA0030.outlook.office365.com
 (2603:10b6:610:5a::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:18:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:18:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:18:03 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:17:57 -0500
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
	<chao.song@linux.intel.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 06/31] ASoC: intel: rename ignore_pch_dmic variable
 name
Date: Thu, 1 Aug 2024 14:44:21 +0530
Message-ID: <20240801091446.10457-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SA3PR12MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 468de2f9-6946-4ea6-f3e6-08dcb20ad969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H5OXihLx+1tcUNfibgHxzJJxx1xW9HsBAwXRWzBlzpgF/rUUgkIj7mlMfJ1Y?=
 =?us-ascii?Q?MGUqmnl/YIKn1BGXMqMZn+sY061+0iNj/6fEKXhvWUL5ZHw+e5SjXtxnw5ZS?=
 =?us-ascii?Q?sH5MB7YVtvciZwF5sE3s9j9YJ4iV7Kd3YEbgC8knjM97+STJRimrouVS3yCL?=
 =?us-ascii?Q?2EE40DPhAtZLdmL9MlgBC+N5IOJoax442f21OiA2Q5bmlgh/mSHWib/JyoYz?=
 =?us-ascii?Q?NrE41z5c/wZHTSvUPXPF0ZBtan7HNpGv3Y8iUTN+XI5kpbq6yuRitKryyF9C?=
 =?us-ascii?Q?JLSaWMZuyDYTf0UrxHJByo+Am2snvmh5ZAdcWsSa9lPq1LmtaqRL40y6WUCY?=
 =?us-ascii?Q?CgBI1NizaWPUMrtD5Jw7knoIGhy/3vh8yJcDpfruCuqZtaAlC3jqQc0rGmeT?=
 =?us-ascii?Q?D+ujXnYWS8x7/ye4HtNvHAeK0KCc0RlcaOg/nMfgHsMxksohsUtEDB4iCnbj?=
 =?us-ascii?Q?rShwEp4g+7cAmKmfCH5WlMF266ni0ZFEPp/qE53n76U4o2l64kw63JJ4NHbv?=
 =?us-ascii?Q?6Fl813Jye6NO1NwzcJQxf9NgFkWKucVLZ6T+S1iM9nIncVxaXeQ6Kbkn9Pyn?=
 =?us-ascii?Q?M2Lc0R6yX7Y6OLe/nK01NmX3bcjSaGn8PlginfY8JWeVBo0srroB1SGiBQNb?=
 =?us-ascii?Q?4zHRxVpYhpDf4y8UVNuKlo/m5+ZrErSrSiWQ6fFtQcrwUjsI/sh/PT49t9yS?=
 =?us-ascii?Q?hIMTzgaTHCcQGl/0HTGp734Gst3A8ZO1Dl5MgJe/cBSJQb1iPyLpkzqTmsP7?=
 =?us-ascii?Q?jS1LjPcuZMoCQg8UsixxMmEwss1IsrU8ooD2cWgbBQFaXI4XlJMUAorbNbSA?=
 =?us-ascii?Q?gc9L5WDhFi8zp7RhwkAoqoxkzCR5hvqA6v+dCFR+28i+G37r+2rQxvOqjGGc?=
 =?us-ascii?Q?37443mUmjiMeN6sX18gu5xY/dQcFXt8r9bJBBr2nLMo0qZdzx6IyxrJO/WAA?=
 =?us-ascii?Q?PrwQfNp5ipmt8dfzGBCgSzGX2WTnmzye6YXZOsudLtkcBm3vo44uxS5sf00H?=
 =?us-ascii?Q?VrPb2HpSHtbE4+N01PtSvIv4EaljrZ7mPA+UOSSkplhXb5s0uKoJXNFPIXf/?=
 =?us-ascii?Q?4xl7NEAwXtEYde1+5fdQTLFaJ+1/FHOfJ08fhHmbSf4J2AwEad3HKagWfG0+?=
 =?us-ascii?Q?gvJ52lrqh4mNB30b/bxMAd5nxyPmEdjj5ZuL218uE5TTGwFvu58y/62/iWHX?=
 =?us-ascii?Q?QhXkxGNuuVPVOwof8F1QQ9omFKO/0cpB+YaRi8+4R0IvUuxlqAEmqbQrGiEv?=
 =?us-ascii?Q?Pt6z0Mx/erkvKHIPSaAUuoIiSrMKAecR/l4QuPXTanWTnIpsPc+ybdxiKMtV?=
 =?us-ascii?Q?TCVIfvB9Z+224Zw2xilWanBMpZWTZ8nfiKQScX5hfZ9Q57a0J8m16Xz07s2v?=
 =?us-ascii?Q?dAZZq1wN1cB4oj48y+bRfmtC/VDZ5DnUwulQXCS+u4T0QlRXTw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:18:04.5378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 468de2f9-6946-4ea6-f3e6-08dcb20ad969
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7805
Message-ID-Hash: NMUUMXWPEMB4EKW6JGBNVQB3IU7KIEYT
X-Message-ID-Hash: NMUUMXWPEMB4EKW6JGBNVQB3IU7KIEYT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NMUUMXWPEMB4EKW6JGBNVQB3IU7KIEYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename 'ignore_pch_dmic' variable name as 'ignore_internal_dmic'.
This variable will be moved to common header file and will be used by other
platform machine driver code.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_common.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 64418976aba4..28021d33fd2d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -932,7 +932,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x714,
 		.version_id = 3,
-		.ignore_pch_dmic = true,
+		.ignore_internal_dmic = true,
 		.dais = {
 			{
 				.direction = {false, true},
@@ -947,7 +947,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x715,
 		.version_id = 3,
-		.ignore_pch_dmic = true,
+		.ignore_internal_dmic = true,
 		.dais = {
 			{
 				.direction = {false, true},
@@ -962,7 +962,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x714,
 		.version_id = 2,
-		.ignore_pch_dmic = true,
+		.ignore_internal_dmic = true,
 		.dais = {
 			{
 				.direction = {false, true},
@@ -977,7 +977,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x715,
 		.version_id = 2,
-		.ignore_pch_dmic = true,
+		.ignore_internal_dmic = true,
 		.dais = {
 			{
 				.direction = {false, true},
@@ -1542,7 +1542,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_info)
 				return -EINVAL;
 
-			ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
+			ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
 
 			codec_name = asoc_sdw_get_codec_name(dev, codec_info, adr_link, i);
 			if (!codec_name)
@@ -2018,7 +2018,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 	/* dmic */
 	if (dmic_num > 0) {
-		if (ctx->ignore_pch_dmic) {
+		if (ctx->ignore_internal_dmic) {
 			dev_warn(dev, "Ignoring PCH DMIC\n");
 		} else {
 			ret = create_dmic_dailinks(card, &dai_links, &be_id);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 28db2f1c6dae..c1b58180efe5 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -106,7 +106,7 @@ struct asoc_sdw_codec_info {
 	const char *codec_name;
 	int amp_num;
 	const u8 acpi_id[ACPI_ID_LEN];
-	const bool ignore_pch_dmic;
+	const bool ignore_internal_dmic;
 	const struct snd_soc_ops *ops;
 	struct asoc_sdw_dai_info dais[SOC_SDW_MAX_DAI_NUM];
 	const int dai_num;
@@ -129,7 +129,7 @@ struct mc_private {
 	/* To store SDW Pin index for each SoundWire link */
 	unsigned int sdw_pin_index[SDW_MAX_LINKS];
 	bool append_dai_type;
-	bool ignore_pch_dmic;
+	bool ignore_internal_dmic;
 };
 
 extern unsigned long sof_sdw_quirk;
-- 
2.34.1


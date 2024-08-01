Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DFD9445A7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 09:39:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912B933E2;
	Thu,  1 Aug 2024 09:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912B933E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722497995;
	bh=929Cw9r+c2BL0Vnc8cCXwQGvRi8hiyBrAUflFaXiA7Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E0xn/bQMWEIaIul2YF4iuOFonudIhsdXT6N/TyETZFM9wVgDb5QdGsE2oCF8ZLZ9K
	 mGZbdHdgcejWQ6UyQBksiZBhYCpIzN2Vwif09DN5xWZVI3GWZl5exeOyz5nESGee1E
	 zVH1oqSlJxbJJTjUhCSXRbuiBKtlDEQyi7O9rmIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20860F805BF; Thu,  1 Aug 2024 09:39:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DF8F805CA;
	Thu,  1 Aug 2024 09:39:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B476F80589; Thu,  1 Aug 2024 08:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13D4FF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13D4FF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pvKyBOJf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZKlPqAmr8Th14IyZNqKAPOa+sGNzygTG0M7dfQmu1Vodnv4KJqY4S7oqXRFBGsDO3ltotZx4h61Z6BS5gRivMha7QZYzQlT0BD8A3WFxsldEfhAzxx0zhiiDw005cHMaRTMmB2VVTc+oWqpTgJGjygaFGyYzsxN4qSrX2/ECDoU8vC/PVPW8Mgl6GWXkvGa6sJAkYhSSHYRvSXirV5sF4zNX4Hl9bBRlVnhSRorju7npzM+uvgQEZC06Ml6um9thV6Q7qceesjdN2CJo9hpVrpdxGj8Ks84NDmYBpgJ8ITmNPy4i3xsGVc/y5eaSNDN4xi9XbY47t65NNMOjO+Ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNOtexsJH/a9wEuZJl1vRdbZkCUD0L0ijL6tYqKYwS4=;
 b=yK1o1Etp0t7bWEkU6fy/tCaJaa0MJErtLXxSbINNnOsMK3m0qL+WJUPgTDWb7jXa3wpoNPwfYwcJDGWbXpPqZJ6GM18GnIEN8UoVdkgkJ3SNipVN10a5bLoYSsq2B5pG5EXMI5ZP1SMtltPZyR9cLWBlXbxAiHbduNV8vT4j67iaoDh7Zcvb41zWg9gxloBZEj7RvPy7RyUz/0a50ibEbMQ2jRzAoanaBOTK8+7SpeeAB2Aec52ogVsGSc9kK+27f0BbsFi87sr1wf+CQ4idHmhHtM/SHfwAYwRHT/xjHoeqTuTUcFHUDbQvSTyhlBmoCVJYmnaOFLkzsdqBXyyzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNOtexsJH/a9wEuZJl1vRdbZkCUD0L0ijL6tYqKYwS4=;
 b=pvKyBOJf2Igp3VoFo0JlMab6fhzq4Y1DdVnJWiiorPdZqYN2hJQLWRmZGVQVseo8czN2X543SJ4ZkRgP7kl6MrvFDP1zAV7SMtjGbIEDjRk8lLqfJ93toqNcmpRpG0eL5SfXA6htqZawyjLr9hxcVYYjnxM6a5UnNVeQSdQ2iMM=
Received: from MN2PR19CA0071.namprd19.prod.outlook.com (2603:10b6:208:19b::48)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:27:24 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:19b:cafe::10) by MN2PR19CA0071.outlook.office365.com
 (2603:10b6:208:19b::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 06:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:27:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:27:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:27:23 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:27:18 -0500
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
 Iwai" <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Chao Song
	<chao.song@linux.intel.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 06/31] ASoC: intel: rename ignore_pch_dmic variable name
Date: Thu, 1 Aug 2024 11:53:51 +0530
Message-ID: <20240801062416.2203673-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|MN2PR12MB4237:EE_
X-MS-Office365-Filtering-Correlation-Id: 09639fb3-4a14-4773-00ef-08dcb1f301f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OPJy66VsGRpTdL3mZGAE5cuPpniUWr2ji2lAxbXl1YYBn//grTLLHdjqx8A7?=
 =?us-ascii?Q?oUB07axv2YiNjRQjfpTw3TiZx9L35C4Ix/xnd8JOBnBNLBEt+zZcU4qv9rat?=
 =?us-ascii?Q?Db/RwdXylCw+UxIU9TUn44HLrO9Und1/jyQUJHWXPwjhu7LFBF63pQrzI4Rn?=
 =?us-ascii?Q?/vYcKcaUMe4KiFa6VGMVxfN4J1o/GWpUOgX37IrtCJ9wTXRYMCOMw17I9oyZ?=
 =?us-ascii?Q?sl/rVvaEOeE5vUZZ+bKpj/W/P0NezWR0sdXyRp/LaTpE/FeDu/K1sWE4kaeg?=
 =?us-ascii?Q?ujQkp32ZmqwiFADYpCV1EhnBgmQ+Xij+tVDzDqBQ3ae9QoQd0pmNEF62khsN?=
 =?us-ascii?Q?PnixLzKLJre7UEjVySEox2CmSVjyLjlQi4a960u6MC5SNCxE/60HgGNvr2eM?=
 =?us-ascii?Q?ULh5Z3OU1zkdmWx5BMwkbXpVTd8i2pQyq7mdoclMRGk44/hMrXcOa0nY1Ntu?=
 =?us-ascii?Q?jrrgPtGUHpOKf1StWbwJDH/ioWhpbCm5K0PLR/a6ALI+7jiecEODo2UkKPRu?=
 =?us-ascii?Q?oNY9IPEtGJu6jqoKCkONpHzm1AdpPYAaQhGdPJ47PGOH720XQFn01rvXa+wp?=
 =?us-ascii?Q?Dxc6eg6GqvCr1oBq802yP4/kvvendlb8f3ebDM1GFjwv1LYGhpDWc9x6TBKh?=
 =?us-ascii?Q?jWOnM7ihhmfRpMRP4XEO5Ogxyiuhe7TYTg/kOubKA7nXJwQjKuPhKILFTN1K?=
 =?us-ascii?Q?Ghknukg8gJiFcTKNog4+IKLsMhFXMTdHjmKUBAVhL54sLxs06gqmzhJrY1tf?=
 =?us-ascii?Q?mZFejvg+YXAQejLN2wafFu1iFgLsegRQ2LPVT698HkLc8lJ9oYUY+Pk4VEua?=
 =?us-ascii?Q?ccUCnVPS+GO03cRwplK5aib+TXztTwdAWlR1FJhH7bGOo9IYBBDFSttVnqoP?=
 =?us-ascii?Q?yC4wt7yQI1yjsXoYC4ZrfRlUb1TmLswRXAWwjRclw65myxJ3WB2zMIDeMK7U?=
 =?us-ascii?Q?3MKK/IttOi/6QqmcKgxMRhhgvaXV3td5G3Yr9nTbT2bBXSfzK41ddgaGFbZl?=
 =?us-ascii?Q?P0MQF8oZ460LGmJjjuTQ2VaZJeTJGAqSSYnm1LWlwwSOmP4ha92J4JcYP3fx?=
 =?us-ascii?Q?m9b63whGeNcSoj32chx3TNrufLIzdgIcmNp7SBQeHWwLBdVk8bMcP0RgLz0k?=
 =?us-ascii?Q?zyiCwM+BwfMvqwMpkJe5HOLGzJ73aVi4bzIoXNwlBcANd5QYcQ1PI8p9wf9E?=
 =?us-ascii?Q?t5DNTO0KnHvRH0gxqgUrhy5BByPoQFbqNFshGCOpqyCYqLlJ0G8GzCPkD0Hs?=
 =?us-ascii?Q?OOexI3dHly4pEwjMrV7dl2XDFYytNkyUqh7tHyBxtctbdUhyFGlpk3bcirVQ?=
 =?us-ascii?Q?Gbu4RIG+JO5SKVoyJJfm0M3D1KzdbChkxYfh0PAC6EujuQHnIyvx7ya5mF1M?=
 =?us-ascii?Q?aaGzU+FfMlyB9IJ6VdVBT249fwQOEOwm8bDf8gMY9ORj+VWcqw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:27:24.7186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 09639fb3-4a14-4773-00ef-08dcb1f301f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
Message-ID-Hash: V67YNXDZHCOZNGCGSILJKYLUVJNTVAPO
X-Message-ID-Hash: V67YNXDZHCOZNGCGSILJKYLUVJNTVAPO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V67YNXDZHCOZNGCGSILJKYLUVJNTVAPO/>
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


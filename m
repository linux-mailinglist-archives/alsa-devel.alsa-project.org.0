Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1C9445A4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 09:39:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 643B13329;
	Thu,  1 Aug 2024 09:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 643B13329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722497923;
	bh=DEyriH/vPZc9JnNMAOgPz51EJsfR+N8BIQziaDRC/is=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LJSAcEnXueGCwlx4EGR79oGQc++1raEJfG5RBH6UZeSmYRRlyJFJBqwPulCxO8efB
	 yy9OzgWOSB7UlFwQhaH9ZqSbVfB54s/bHntYJBIOxj0CTDiMz+379+sM0RFNJqEmuU
	 +CMRfqVm6xXjVUC1onRV5wRwljokIJ9VY1oZgERk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B652F8057A; Thu,  1 Aug 2024 09:38:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A104F805AF;
	Thu,  1 Aug 2024 09:38:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E569F802DB; Thu,  1 Aug 2024 08:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86EEAF800E3
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86EEAF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4T3LD/sC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcXgnYyyz0WjwbsgRQmeQC4YUMj6b0Ar7KZHYOOc1O1mS4HE12O46kplRyaNNf/naofoWrkupsjLh3J++1RJga5UgTEUjC9OURbQdtCE9V1xzYoXlwQFPcoz3vht70Eh9GdfgJSKkH+s05e/Im3KVgq6Fz7TWby9IEh5BIKOlENpVrH6L4htuX9oiAanu/fmfiWhw9ROTbv5fetv6oiwcUHhWcxyKoXG64pBY/O65tKIo+6oQJTkQW4Lpl4oggV7uoA5xYX8w7bTC2jGLymoxmX25s7VbFMvPfYs1HNeoCIEmbI4CXvxu+kI4UW2do0yTlHZVN7zdpiV4ka1JLbC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh6/9O6N5hkFvqNYO32bq/fMSHVHNmmNJeYjTlzMNZ4=;
 b=axU8o2Lj5N3wwuCbcRTYUoDh5NtLAZQ4W9VyKfpnGUI9qdbMeHPEysKEtrv454QczBHgHsAlWNKkzvBbNNoZRBlgX7BHaHmfLHEpq4lxZyStqj6AzxqdVDFqRguLMWBxfuGo91gtroc7z6ouP9tad6bgz4V25zohytYzbIZGclaj0cfTZSdTAokUJupAAZcuC8y5dbgMEDGVVRX2KmuiGyZhZSD0rEhy+jvR50uO9amgvdj8kmVRp4oyOe3rGWmrhKoPzLdYy+gL6tdqKqd0XCOdJX15SDjDJTUirFMAb6JazUF6z8SFFLtYFNodjuTswJsAQRcg4fUwX2WPxPTQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh6/9O6N5hkFvqNYO32bq/fMSHVHNmmNJeYjTlzMNZ4=;
 b=4T3LD/sClXZM1MqWu848spWQ8SHSc/QMviJ48Yfgq0hBkitoF61PtK5U4/HE4NS0eM7+lHcVpWFRu2XRmmvHS0NNxcG3eUPdpB4DDzqWAAz5bFCMizuijFRIfxZ2aJajq1kdwnwsiRALXldAGvxCbsc5V1xDjXYW33cxTAKz7PE=
Received: from BL1P223CA0025.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::30)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Thu, 1 Aug
 2024 06:25:05 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::28) by BL1P223CA0025.outlook.office365.com
 (2603:10b6:208:2c4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 06:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:25:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:25:03 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:24:56 -0500
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
	"Maciej Strozek" <mstrozek@opensource.cirrus.com>, Chao Song
	<chao.song@linux.intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Brent Lu <brent.lu@intel.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 01/31] ASoC: intel: rename codec_info and dai_info structures
 names
Date: Thu, 1 Aug 2024 11:53:46 +0530
Message-ID: <20240801062416.2203673-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 523d5a07-531f-4b5b-c840-08dcb1f2aec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+efY75fO5rzXuku6Sgcm/PH5aFGN9UkXwWmWjBob74KLbuSmnUO9/y2r1cOh?=
 =?us-ascii?Q?+173HL2kVPckXEGLBiind2uy2NxOYWv0FuIlKqDXhKC22Psfnyn098O1cIse?=
 =?us-ascii?Q?9lWOkCJKiQH+EeJGsh4DqtHh5tGyRlVjapAHoR7bHBeUp13k7Dw2rkxJ1TOk?=
 =?us-ascii?Q?r8Fk7f7xiXpoF5+V2T5XGVTeikjRJLZ272X4AuD3LaDwd4eh/7jCg9M9Etjd?=
 =?us-ascii?Q?b0UiD4fkzq6ZuR2sG2V+JYtpaQ7eyC5/ayvw0KzEU1GVTdu2pTA1SEvQ4aJB?=
 =?us-ascii?Q?sZT622/0SxxTZSYcJLJP17a7Y33lgW1qLirP2mrn58jfJIGSkR08+FV0Dhj/?=
 =?us-ascii?Q?F6ioHQo3WOEU2HUY1M2Cp6uhRfyLnT9CtizhE4tisZ/RUPOa7w0kIeJyjrvx?=
 =?us-ascii?Q?bbempp6kgJHfn0dKgMK0F20bfjPQEdK1O4vILWfTaNPWXBu2kNrdZk8DHnIk?=
 =?us-ascii?Q?2hfbrndYNEdMHANshARChSAYWurh9ma5NE2edIhE3XCFt4cLirjqm/ReQY8F?=
 =?us-ascii?Q?e4ANOZKJ4fIzSjtRJkPg9HZgUcGQzIJfGUwHNJj0bQNYNjYoa2t0Tb5JG7nB?=
 =?us-ascii?Q?8cWTjE/7mZrqQdZkylqhUnFKRZKznB6jdaCd0EgOjGwhMQJgZ0UEIJb065Kl?=
 =?us-ascii?Q?B0NOsS5BojWec6FhSOyc0l9whK5BZdhk3wuaqhXyf0/Vpb9gtG8LMjioH9s+?=
 =?us-ascii?Q?zfsTPpRDJgKZgnQ4O7DqoOMp0kVxrwEnJQ3NMYhygUV68seCgFLHhZYkrNsY?=
 =?us-ascii?Q?L7K5H74ewdYZ50CEFPOy03Vzbh7xMjuVjuI2iHL8aep3zpREJKR/OTGrn9N9?=
 =?us-ascii?Q?xCHGiClmAmVWRYTLiSJVIIicILLBfC/G0iLIzrhikKTv+w0/ixf91d+v0Opx?=
 =?us-ascii?Q?eiDX6eaqLyrjHqpQpYzadrO8qIel9qEszYoSFvb4yF6KmEX37IKnUYltjFG3?=
 =?us-ascii?Q?bv6Z18x5/mF7lucdYEr6OLnE64EGk8H7qgXA4zN6M05T/wGyKafQ1a4QamYO?=
 =?us-ascii?Q?leSPide5E1ol1iKa7VuWLIRkkhh2V669juXpVB8pMkmSzg9Twb82MrOIC+Y0?=
 =?us-ascii?Q?zfJ1t6NcBIlSYSpejvsXeC86dF9wS9icTjhnvNIZaNfRX6xNWJ6AYy06sEq2?=
 =?us-ascii?Q?vp2cyI8mgE1ALCVg9Pn7JmAERqJQc2zROzJButRq/8dBvdBvIv03X4nQ5nJI?=
 =?us-ascii?Q?adzZ4zUNrMJ6l0njUn1gS6KQYkWiT25v2rw5+vDaBw1QA7i9jMwTf9Jy21FI?=
 =?us-ascii?Q?YZ2viol1QgyO2u54Igz/ZXf/sNf0jz/EknYJLeE8aet7VmbZQsewnN+OPHkZ?=
 =?us-ascii?Q?dD5WY9U3EweTrG7yrdSmBUiLDOaubPqP2gEkmltyg0ER8GWCcbXp6u8UToh8?=
 =?us-ascii?Q?DNx126uPeI3wdpbunRR/MWFS1SWclCkBrIHlmu01TWOpiJ6jfQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:25:05.1214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 523d5a07-531f-4b5b-c840-08dcb1f2aec0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323
Message-ID-Hash: 3AQRZ6XOCCLWQ6IVUCG4LZFZIWUUKROO
X-Message-ID-Hash: 3AQRZ6XOCCLWQ6IVUCG4LZFZIWUUKROO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AQRZ6XOCCLWQ6IVUCG4LZFZIWUUKROO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To make it generic, rename structure 'sof_sdw_codec_info' as
'asoc_sdw_codec_info' and 'sof_sdw_dai_info' as 'asoc_sdw_dai_info'.
These structures will be moved to common header file so that it can
be used by other platform machine driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bridge_cs35l56.c       |  2 +-
 sound/soc/intel/boards/sof_sdw.c              | 26 +++++++++----------
 sound/soc/intel/boards/sof_sdw_common.h       | 24 ++++++++---------
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  2 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  2 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  2 +-
 9 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/boards/bridge_cs35l56.c b/sound/soc/intel/boards/bridge_cs35l56.c
index c3995e724aed..b289bcb3847a 100644
--- a/sound/soc/intel/boards/bridge_cs35l56.c
+++ b/sound/soc/intel/boards/bridge_cs35l56.c
@@ -127,7 +127,7 @@ int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 
 int bridge_cs35l56_spk_init(struct snd_soc_card *card,
 			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
+			    struct asoc_sdw_codec_info *info,
 			    bool playback)
 {
 	if (sof_sdw_quirk & SOF_SIDECAR_AMPS)
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e5feaef669d1..26c467bb81a3 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -731,7 +731,7 @@ static const struct snd_soc_ops sdw_ops = {
 	.shutdown = sdw_shutdown,
 };
 
-static struct sof_sdw_codec_info codec_info_list[] = {
+static struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x700,
 		.dais = {
@@ -1220,7 +1220,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 	},
 };
 
-static struct sof_sdw_codec_info *find_codec_info_part(const u64 adr)
+static struct asoc_sdw_codec_info *find_codec_info_part(const u64 adr)
 {
 	unsigned int part_id, sdw_version;
 	int i;
@@ -1241,7 +1241,7 @@ static struct sof_sdw_codec_info *find_codec_info_part(const u64 adr)
 
 }
 
-static struct sof_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
+static struct asoc_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
 {
 	int i;
 
@@ -1255,8 +1255,8 @@ static struct sof_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
 	return NULL;
 }
 
-static struct sof_sdw_codec_info *find_codec_info_dai(const char *dai_name,
-						      int *dai_index)
+static struct asoc_sdw_codec_info *find_codec_info_dai(const char *dai_name,
+						       int *dai_index)
 {
 	int i, j;
 
@@ -1355,7 +1355,7 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 }
 
 static const char *get_codec_name(struct device *dev,
-				  const struct sof_sdw_codec_info *codec_info,
+				  const struct asoc_sdw_codec_info *codec_info,
 				  const struct snd_soc_acpi_link_adr *adr_link,
 				  int adr_index)
 {
@@ -1383,7 +1383,7 @@ static const char *get_codec_name(struct device *dev,
 static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct sof_sdw_codec_info *codec_info;
+	struct asoc_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
 	int dai_index;
 	int ret;
@@ -1451,8 +1451,8 @@ struct sof_sdw_endpoint {
 	const char *name_prefix;
 	bool include_sidecar;
 
-	struct sof_sdw_codec_info *codec_info;
-	const struct sof_sdw_dai_info *dai_info;
+	struct asoc_sdw_codec_info *codec_info;
+	const struct asoc_sdw_dai_info *dai_info;
 };
 
 struct sof_sdw_dailink {
@@ -1529,7 +1529,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 
 		for (i = 0; i < adr_link->num_adr; i++) {
 			const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[i];
-			struct sof_sdw_codec_info *codec_info;
+			struct asoc_sdw_codec_info *codec_info;
 			const char *codec_name;
 
 			if (!adr_dev->name_prefix) {
@@ -1563,7 +1563,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 
 			for (j = 0; j < adr_dev->num_endpoints; j++) {
 				const struct snd_soc_acpi_endpoint *adr_end;
-				const struct sof_sdw_dai_info *dai_info;
+				const struct asoc_sdw_dai_info *dai_info;
 				struct sof_sdw_dailink *sof_dai;
 				int stream;
 
@@ -1790,7 +1790,7 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 
 static int create_ssp_dailinks(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links, int *be_id,
-			       struct sof_sdw_codec_info *ssp_info,
+			       struct asoc_sdw_codec_info *ssp_info,
 			       unsigned long ssp_mask)
 {
 	struct device *dev = card->dev;
@@ -1914,7 +1914,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct snd_soc_codec_conf *codec_conf;
-	struct sof_sdw_codec_info *ssp_info;
+	struct asoc_sdw_codec_info *ssp_info;
 	struct sof_sdw_endpoint *sof_ends;
 	struct sof_sdw_dailink *sof_dais;
 	int num_devs = 0;
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 2a3145d1feb6..ebacb55de318 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -79,9 +79,9 @@ enum {
 
 #define SOF_SDW_MAX_DAI_NUM		8
 
-struct sof_sdw_codec_info;
+struct asoc_sdw_codec_info;
 
-struct sof_sdw_dai_info {
+struct asoc_sdw_dai_info {
 	const bool direction[2]; /* playback & capture support */
 	const char *dai_name;
 	const int dai_type;
@@ -92,7 +92,7 @@ struct sof_sdw_dai_info {
 	const int num_widgets;
 	int  (*init)(struct snd_soc_card *card,
 		     struct snd_soc_dai_link *dai_links,
-		     struct sof_sdw_codec_info *info,
+		     struct asoc_sdw_codec_info *info,
 		     bool playback);
 	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
@@ -100,7 +100,7 @@ struct sof_sdw_dai_info {
 	unsigned long quirk;
 };
 
-struct sof_sdw_codec_info {
+struct asoc_sdw_codec_info {
 	const int part_id;
 	const int version_id;
 	const char *codec_name;
@@ -108,7 +108,7 @@ struct sof_sdw_codec_info {
 	const u8 acpi_id[ACPI_ID_LEN];
 	const bool ignore_pch_dmic;
 	const struct snd_soc_ops *ops;
-	struct sof_sdw_dai_info dais[SOF_SDW_MAX_DAI_NUM];
+	struct asoc_sdw_dai_info dais[SOF_SDW_MAX_DAI_NUM];
 	const int dai_num;
 
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
@@ -153,14 +153,14 @@ int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 /* RT711 support */
 int sof_sdw_rt711_init(struct snd_soc_card *card,
 		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
+		       struct asoc_sdw_codec_info *info,
 		       bool playback);
 int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT711-SDCA support */
 int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			      struct snd_soc_dai_link *dai_links,
-			      struct sof_sdw_codec_info *info,
+			      struct asoc_sdw_codec_info *info,
 			      bool playback);
 int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
@@ -170,20 +170,20 @@ extern const struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
 /* generic amp support */
 int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
+			struct asoc_sdw_codec_info *info,
 			bool playback);
 int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* MAXIM codec support */
 int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
+		       struct asoc_sdw_codec_info *info,
 		       bool playback);
 
 /* CS42L43 support */
 int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *dai_links,
-			     struct sof_sdw_codec_info *info,
+			     struct asoc_sdw_codec_info *info,
 			     bool playback);
 
 /* CS AMP support */
@@ -194,12 +194,12 @@ int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 			       struct snd_soc_codec_conf **codec_conf);
 int bridge_cs35l56_spk_init(struct snd_soc_card *card,
 			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
+			    struct asoc_sdw_codec_info *info,
 			    bool playback);
 
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
+			struct asoc_sdw_codec_info *info,
 			bool playback);
 
 /* dai_link init callbacks */
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index b7e2750c1074..e8370c3c96fd 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -123,7 +123,7 @@ int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *da
 
 int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *dai_links,
-			     struct sof_sdw_codec_info *info,
+			     struct asoc_sdw_codec_info *info,
 			     bool playback)
 {
 	/* Do init on playback link only. */
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 10e08207619a..206fe7610a56 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -47,7 +47,7 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
+			struct asoc_sdw_codec_info *info,
 			bool playback)
 {
 	/* Do init on playback link only. */
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index b7f73177867f..8faa06824869 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -120,7 +120,7 @@ static int mx8373_sdw_late_probe(struct snd_soc_card *card)
 
 int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
+		       struct asoc_sdw_codec_info *info,
 		       bool playback)
 {
 	info->amp_num++;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 60ff4d88e2dc..9ea8de609669 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -126,7 +126,7 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 
 int sof_sdw_rt711_init(struct snd_soc_card *card,
 		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
+		       struct asoc_sdw_codec_info *info,
 		       bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index d1c0f91ce589..da1a8cc1c63d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -256,7 +256,7 @@ int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 
 int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
+			struct asoc_sdw_codec_info *info,
 			bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 4254e30ee4c3..b63f4952e7d1 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -180,7 +180,7 @@ int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link
 
 int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			      struct snd_soc_dai_link *dai_links,
-			      struct sof_sdw_codec_info *info,
+			      struct asoc_sdw_codec_info *info,
 			      bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-- 
2.34.1


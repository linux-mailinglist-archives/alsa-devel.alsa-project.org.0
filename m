Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E239E9447D5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0147F3978;
	Thu,  1 Aug 2024 11:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0147F3978
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503781;
	bh=DEyriH/vPZc9JnNMAOgPz51EJsfR+N8BIQziaDRC/is=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ol1kI+0yVoIQG8FoNBhBxeZaKn9C5ZxnA9pNtwGz6z3b98ookk49t5Rztqec1/7J6
	 6H3DNIPlVgGEz/GEZqakRnyQ61zbl0tWrQN2lefkuh8cnOL65joIaooL1yQS02k8BG
	 Ojd1124HY+KPWvAfCiAP1L7qJXxwct0DJXPHDQqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0855BF805BD; Thu,  1 Aug 2024 11:16:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D338F80588;
	Thu,  1 Aug 2024 11:16:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41BD3F8026A; Thu,  1 Aug 2024 11:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A159F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A159F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ICVstOlH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/E2nverHfgXjUktT1DIBVcn2G96JdphA35S/02HK4T4GDo+g27waJ7dUHbtT2VoCCraIdZmSgrDRETjCufL3HcW5TL7Qgjwc0CuG771IxjTjYpZekVRq+pop38TpFvoC0Xa7r9+AMEPVh54KTFdprFWwFtH7E3rSKVCRkV/5zFqAYbm4ENJonT4hvS7DrOsu9nkt9tqOHnG1YbeWd8mHvgsflH4ggfpX3R+h0/hCmRWxIPu0r9OLetMSyp/3rU2q+ygDtrRJB2GdQBdtx4n6fjeWQvjzL6EincIPsQBVeQIZ+ErJ5QKzT0J0Aw5E0yiQCZBfJHgl5bwR70XbLeS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh6/9O6N5hkFvqNYO32bq/fMSHVHNmmNJeYjTlzMNZ4=;
 b=sbD0oQbvifeAUiwGEmus4DDylNA9N5p/UAGk+4XbW7DSPv9ZcP54oZHi2LldznQ9ngBApjwxSPmharlivBlOYxeUcQm2PS5qEyWG7Tv9cECJh/Bfkmvad7z5i1In71WyK9YgCTtPvkYjz81fmpx3V6wLnU3yqOAtdoGwKp+Fr2izre2RMVs/UR2ETZPpmhx5YZwZeKjP3uZ9tQEhpKjnNb0Te1PefxJHSIGBgCMzgKfaa5AQPNqNmwFcFB0lGvbQY8WhY/BzDlC2PPP/kHZ9+AJYKYQwJjtNmTAkUjPqQS1sTADtc7Yd84stiU/wtZIqrdk0mxGwWHa5FYy+70KxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh6/9O6N5hkFvqNYO32bq/fMSHVHNmmNJeYjTlzMNZ4=;
 b=ICVstOlH2R50dc1ketzZ9y+iXeID5J9/+VXMmVbETL0L9oIUe4rEVMf4J0bvCm61RIrhFhNs3vrrlt041iFS1Xse5zWSIwdFwFWuKHck6yA9FCyaBui8lurWkdq67m8JixoSxqMOvUaMPU74DiylYhW9hUDcrbUG3Trw0OOnprg=
Received: from BN9PR03CA0429.namprd03.prod.outlook.com (2603:10b6:408:113::14)
 by SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 09:15:42 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:113:cafe::f6) by BN9PR03CA0429.outlook.office365.com
 (2603:10b6:408:113::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.11 via Frontend Transport; Thu, 1 Aug 2024 09:15:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:15:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:15:41 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:15:32 -0500
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
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Chao Song
	<chao.song@linux.intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Brent Lu <brent.lu@intel.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 01/31] ASoC: intel: rename codec_info and dai_info
 structures names
Date: Thu, 1 Aug 2024 14:44:16 +0530
Message-ID: <20240801091446.10457-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SN7PR12MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 3605b40d-30fb-43db-c188-08dcb20a84d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LvUIlBtTXVS5eN6361MdOpo83UulYB9/WBY/72YKeR+oxNBdiUAkii79LUQy?=
 =?us-ascii?Q?YLphUHS4IfiOJA9w8LaR0c5YEylkcDpuO16E48H2forlfjqW3/4ZbdQKXzXx?=
 =?us-ascii?Q?IwSg5jZ2oiN6VGBMF6F+rnGFhfeVSMIFK5Qd4Te+VDo1F3cPhNK30NS7AkWU?=
 =?us-ascii?Q?93LrdPxGNeMHO6bYWXrIW9e9FkxJDEYOk4qCXQ3J2VfSlF8r488xt8L/nygD?=
 =?us-ascii?Q?21qxLIK+Hu7SQ3W259rUwTtWSY/BvliZStQfEJxPp0UneknSwSDcDGaeOYL+?=
 =?us-ascii?Q?QcblIWtzu1QIGlmMYKhaVai9C30pMOQLlfOIuQHfyAR6N0co5wCmBG+rGe/y?=
 =?us-ascii?Q?W+L5gdFJYU/NOT5b4w0BRFKHyzKPbR81Qk0dndjeNphbYuw5QrJypv/FAVej?=
 =?us-ascii?Q?6fsjwCrqzqUg9sWqwE6xQ+U0P6EbtOrul36e9DeYg611FvZ0oNhJ9XcG/UkO?=
 =?us-ascii?Q?A3vNp2f/k01dXuDsF7I3azItFMYoTECslXY+XGoFpaL2thnfdP2xkLuQnW1p?=
 =?us-ascii?Q?3wdb8Gx8XU+H0giT6y82X6iED1gfvkxq0WDYfbOLw3kYHtSTyzDtSdPVkz1+?=
 =?us-ascii?Q?kP4pSc+DykJYhvFNDJAy9xuNk5XG9Hvr3orqejk4hjIB9mry0lezb83mGQCz?=
 =?us-ascii?Q?HwL2mlvQlH2CDETGlDug4ICXdJ3+iutnkMiDG2wPnOtWhWpklZXwyf1FJpuC?=
 =?us-ascii?Q?Q8E1njJYe/Ta7iBNLsKbcXKsRqVd2zVPo5P0/bNJ0Hg8QmASeA4lbBDFU747?=
 =?us-ascii?Q?XTCL1nFWaVaTJzB2Zgu1623vMRFroppKsWRqiVs85h/wUpPzHoHXnbZlgDsh?=
 =?us-ascii?Q?6s+2+Cnmvn8QpI9aVVBnH5DYcto5sbSaBkYxzkmEJYRw0wtnK2gqF7C/n6Ao?=
 =?us-ascii?Q?PMh/E9OHKrFjZ5tvOPXoAvotj56HpCouoNxGCVMdu+l6ny8D4taAo8k4P9aT?=
 =?us-ascii?Q?+97qqifhGj6F3PW6P90pPFehvJuB0CcFa9cyXv2PgtwC7jNi+Q6lJErI7UNB?=
 =?us-ascii?Q?zKzNwII+J+aXVIKR/dNAhNReoGYMJV5C3/RXoxrgmocQyUD08tX9NFVnG+Xe?=
 =?us-ascii?Q?VhkXz+/qBMNsTw3DxudwhzJZTh53x9RlmcuSawGtS62vQZ0Kp73p91yFhjJu?=
 =?us-ascii?Q?IbM2pflqH/cQuQw1PUgJAy01aFCJt9Ug3hmQsKaJk4FFh8X6yMGLF5af4lYE?=
 =?us-ascii?Q?i4PT2EIwxPzU56qdvgEsHMDcLov5PWdP4zGf0+zWemBJyBSP/iQc3Uo6v7Tk?=
 =?us-ascii?Q?Qx/awxcndf5MVzVj37yzC2AM22PrizIztiU/pGARUrp5kY6twCtX0neTPMl1?=
 =?us-ascii?Q?DLIxhOz0Yqs6Mg3vFAjq0kDw0MEN7CUiQlqMoQukzI0GSgvyqbpn8pTqO3wy?=
 =?us-ascii?Q?hhaN4LXBjpZom05v5AAaobwxPQDgQV2Tvjb3CrXx5/+Hb+pExQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:15:42.7266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3605b40d-30fb-43db-c188-08dcb20a84d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765
Message-ID-Hash: NH6OOFWA2CQJV7XWTEZ5JSXG7TKWJOJ5
X-Message-ID-Hash: NH6OOFWA2CQJV7XWTEZ5JSXG7TKWJOJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NH6OOFWA2CQJV7XWTEZ5JSXG7TKWJOJ5/>
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


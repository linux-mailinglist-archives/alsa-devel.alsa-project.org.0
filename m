Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE8944859
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBC6D39EA;
	Thu,  1 Aug 2024 11:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBC6D39EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504658;
	bh=SC8XXaYdHrqKX305sqiPjndkCoUs8X1omIPvwLm2EY8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ipKTnNX4SF9LTlz1fxUwjq1gmsHKqAs1vHDbVOLYFFAVaKzMg1O8Lw/Cot87yvYeT
	 HkH5ecfPmWx8I6F7vDQ2y3rWH+FBlRen6P92kUfUIbCXCpWagdEh6bhYGOpJY1E+Oa
	 4zCWnx0YQ1Nk6pjdsNtm7H6TtdbA6nHSJhzK55Y4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ACDBF8007E; Thu,  1 Aug 2024 11:30:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50BEFF805EC;
	Thu,  1 Aug 2024 11:30:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2DAAF8026A; Thu,  1 Aug 2024 11:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CE97F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CE97F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oxrRF1+2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAq6U0lA1tqV4xwzSv5yiC+ALveD5HbVZVWgcN5aLaYC3nzoxEzqg8IxLzJ9ItXb6u1WwuE2/R7uAKc2jD7xqH2sANtRRkJGTt6d5ExPVPGVDiNO/FMmdIqyn95pOY1JUBJZVED+oenkH0WdLs5IOSSoYNuc2rSNm29Q3H4/hHPRR8tpEMdz62vlBRBXjGfgDBaMl6zB607Lynd5mVZvdGcBuIGLy87wlHdYthUbufPX3qvGRQrWofTXmlEqnHKpMl1l0e3XxD3USREO0oG9cGxR5EZH7o2ng1d1A7zd5yl2WHFd1sQbMeHcGQwgts8P8Qo9+b4vpdPhnmsGQyS9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pb/kCjdaY9LTHpq/7zeLBfpDJbotmGDtNOiv6yPhE9E=;
 b=UAXirRZI0wnA+nUPVtJdppDhuCxsIvxO6SmFUWja8ppy9hAfVuytr6vlT9XCk2g+ruQiJNc9VOLf6gEyI/ac1G/Zv/rsnI5cT6AfdaCjxH4TTlY7nng0JjJf5ESg/pavHPP8lN08dpt3tGukbTSPYzbtS/mMQjdlKk+Uza/PSI5Ts5g+bOUHgEUtB1aYrmN4XSjepm72TachJZW/3gLmcRiK4iUXcFtOSyLm/i+uIodGe1H/t/MSDejWJdXLKfbKrtOMKIGgwJAHInzV3z2r2j2GGVMNnzhmFCkmKS8DwSr/SLVZq6B8PtteUgha6CtDb6t5NFHpujM6lI4l7wdPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pb/kCjdaY9LTHpq/7zeLBfpDJbotmGDtNOiv6yPhE9E=;
 b=oxrRF1+2NdYEc1Heqo4lW3w5nyPud5BJwFfMgxIctOfSuP7Hd3ubZaH8ctRiwE7tZWV8eT+iKJPryMQtw7zKP2m3B4kfpw/RI6MwHviRREtXX1XNkyVTSoTQwzs9skoIYAk7Nn0A8OGDLNeHLebrODXYhcHjCbbXakybhFau8Pg=
Received: from CH2PR08CA0010.namprd08.prod.outlook.com (2603:10b6:610:5a::20)
 by LV8PR12MB9336.namprd12.prod.outlook.com (2603:10b6:408:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:16:15 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::8) by CH2PR08CA0010.outlook.office365.com
 (2603:10b6:610:5a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Thu, 1 Aug 2024 09:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:16:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:16:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:16:11 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:16:04 -0500
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
 Iwai" <tiwai@suse.com>, Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Chao Song
	<chao.song@linux.intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 02/31] ASoC: intel: rename soundwire common header
 macros
Date: Thu, 1 Aug 2024 14:44:17 +0530
Message-ID: <20240801091446.10457-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|LV8PR12MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: f5afe7d8-0eb1-4546-9319-08dcb20a9806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6BymWJNOBam272jHfptgxBtMJdjsfFGhOIXy71PpsdizT4Ck96bcNCIRrmVM?=
 =?us-ascii?Q?ad/fqt0VoK7HLg0lF1Oamg3sSaFapDvaWteUnRf2yu2qyGBG5RevWjej68ne?=
 =?us-ascii?Q?4OAWBaa+0R0H7NqU44bbnTXdTJhnVPGsXnzeqXZYVaXOrcxE/BgrO1uDnRwc?=
 =?us-ascii?Q?QdLW3+pSJHBdz77rzEQtHSMGmGOIgZQLLo83PW9th/FjkwrncAUDdJFx+xJo?=
 =?us-ascii?Q?aVkQdU9yIY4hNkvTfKx1mxn0yfV9p+nQDK3Wwwfl7tt8HdjQW+I5yGfLRnO7?=
 =?us-ascii?Q?NKqYXuKHE0FXyZ9dN/Xy9+sX03BWrpBpuxpAcgoPJPe6sbtKUUD8nQ5cqY3d?=
 =?us-ascii?Q?iiIe3KXkEdyZARLKG7qtJHXRF4k8C+EH6bzloOMAjTpoOOfNZWVUiapzKGTl?=
 =?us-ascii?Q?kNZcsdYAe4k9G9tGP62/R5GiTnvCeUlEy0VrMSrs6z0Ua4ZypsEW/FOiMkGJ?=
 =?us-ascii?Q?sDnulgFQtpyc5gS50H1SC9XWLlb3v9lEeakhClrCioAfd6p8AE3FAij+wfM6?=
 =?us-ascii?Q?iEw3Onf53ZlicxFXwbl+BFnRtZnuqfhVp5svxCltWWvC6xcR0GK7oSywzQdm?=
 =?us-ascii?Q?8bS/R6BRIufEYWDRQxZES5kutTv3oYhDXv1+I8UHVnvwe+siyDhvlULF7v75?=
 =?us-ascii?Q?fsLihL5lDSYojJ9zvShTDmte+JOBFkrUmCTZdtEyDKITw9Nf8Q+0A5Dr0WM2?=
 =?us-ascii?Q?XZVApI8aTEX5d7moYUUKBsSZVhpmc3syCo+XCCvE+yQJsQOguTOAMd0EiI6X?=
 =?us-ascii?Q?tRg7GkzkG3HLGEXdDviEKwNJ6SI/jeh3h1nfkQFa0bopDtTIcs6yrY69LB/u?=
 =?us-ascii?Q?TG6TLnA5EL7RV5dhIZOBOmp8Zn4X93tNO3fhMiCc0WHCr8byJPhCgPFdjeZa?=
 =?us-ascii?Q?ewxtw+anQMEHadGlbCgWnBbygim1avhXuvm5OGJAg5+WBH+sPILTIscqVlGJ?=
 =?us-ascii?Q?sKn3qYTP2wvHX2lXNwmtZKQp18tASpvd6EHQcmP+AuUcX2TZsqMTtm4Fit5e?=
 =?us-ascii?Q?CvUsl+eiuh6W8p7KK0Ge4KVjO7rYSzqha1qF6cuExtbe/jUZlBmel4oK0NMU?=
 =?us-ascii?Q?6IHw+zKm6p+A0rCy67yuLRqTblI5tnmPI778QOorfbEPfToUdGqmp1WNEnPq?=
 =?us-ascii?Q?9Y9TN+8Bbu9RE5AikFZohBUMRbKAm/otXUiudOr+Nl1qs9+XzPyquJ9fef4P?=
 =?us-ascii?Q?0hFuK0KTstQUCyrvuPWD36P6kwkvpx3bIH7wBaqrdWLBnRVUnJgNbcrsFj5J?=
 =?us-ascii?Q?qpTpXbfOSFkRjrXtYbLd7dNF7aQhvT1Va42lUj9h5nvWngAVjdwzkYTd4nHp?=
 =?us-ascii?Q?zjzP9e7+Vs0yOALAEara/f5bEpI4L9ptjRcT8+OPBlQVYjWMpaxeiKwS2VtF?=
 =?us-ascii?Q?AYLpherLlN8k+AyBPFb6PFYi1qeT4twH3arb2/gbooFYhctnqA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:16:14.8971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5afe7d8-0eb1-4546-9319-08dcb20a9806
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9336
Message-ID-Hash: XGFUEILA6PACNUDU7TIWDYTAA56H573X
X-Message-ID-Hash: XGFUEILA6PACNUDU7TIWDYTAA56H573X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGFUEILA6PACNUDU7TIWDYTAA56H573X/>
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


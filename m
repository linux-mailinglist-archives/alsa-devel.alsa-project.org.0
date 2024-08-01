Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C40C944864
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A664C3A1C;
	Thu,  1 Aug 2024 11:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A664C3A1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504676;
	bh=RDO+vloBM2GX4x3HsozmjsErgtAplHVdtbM9kcsLnNk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GlT3zPDkkW+7932ACk2S4GGmInnMdpov7WaL6XMcIjxzPXGarmdcUTrbjffPqUdHu
	 TENp2sfG78Hd1wqSEFPOkG9rk8PE/LfELlf2BXFvIgI73fXN/Z1TizCKcxg7dzWIkn
	 yxTUn0KKNFZsuWT5O7v1FACxDWWVuouBnT059QfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA6F3F80617; Thu,  1 Aug 2024 11:30:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D09A2F80615;
	Thu,  1 Aug 2024 11:30:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87206F80269; Thu,  1 Aug 2024 11:16:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 864CBF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 864CBF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RF3oOxRz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kA8H/GafgEZOBj9qP4VShpi8BKr9Pbfy3ur8Ju8w+r+1JkkbFHt1mYf4MUTFsakQ+JIFx7Clf8AHqxKhdQ1ohUR5yIzVzng/zugLlTsEY137H6gVVLMlxiWfzMH/kpS4usGS3NVKki7Qa6t67J6DdxmuPPtG7D8CKWI5XlmItwr2lpLJqOVJOkM+5XMsUkjIuXsl+/eqU9MExZ/MBIv8ZCU1rySdXVf5z1u5FMknm2YiBabN1zMsPDVv8xo1nTLYw6sQomyVktfpe499E/1tGbFLIuQsM6OHyHOce5xoulZxReuQPK9Ly8sNSh8BLDFXKRLBhhx0D0F3z/eVMIFf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PN6D6XRbeecwMVkpspR8HoNG+SKkdTm3cCEgvNTAC0=;
 b=eNTfujUiBe4JGuCaUkWnrggPg4bNMJaXWQr/E6RZ9TrV5vrPVQ0A663bzE9a/hSfiaR2NwSV7gNb9DfrE5ZbFqT/Y8yocfCxMFbq5fhKMCYWNuwX0HrAXU1+w8omAgGh1pJbV6KczbRF9ElsC48/J9jonPCWfS3AQWg9HT5v4WtKNSB4JIWVm76875BJdsCeuoTV2eoMWpjUSqVUJprsEBLVyTSROpeyzZVo5jDUPi7XZ+wR6WF+HCKqE3lXd2sMaztqoXR4/ynZcTNCdP/EvTKEx+Hh6sLW3jmA1ow0+J7SMhovtR4XUUl/9fNWDTldlGUgAC6NUcjB3SauNFiung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PN6D6XRbeecwMVkpspR8HoNG+SKkdTm3cCEgvNTAC0=;
 b=RF3oOxRzBLzpGUwhTZTrZuENKNHyzFTiKnFhiw8u4gPv1HxuGjGkdRzdCWx4XtNYYtZUkAHE0f3rUbhz43Wm+ae/WdpLOru+ebfhXXKj4Ra0BKCWDupX2wTh+C7ZLHjSBvheN6V4ny3P0T0+fZHg2EEhPXMbNEX5/1sN1niioVo=
Received: from CH0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:610:e4::10)
 by CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:16:33 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::24) by CH0PR03CA0185.outlook.office365.com
 (2603:10b6:610:e4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 09:16:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:16:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:16:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:16:31 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:16:23 -0500
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
	<kuninori.morimoto.gx@renesas.com>, Brent Lu <brent.lu@intel.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 03/31] ASoC: intel: rename soundwire machine driver soc
 ops
Date: Thu, 1 Aug 2024 14:44:18 +0530
Message-ID: <20240801091446.10457-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CY5PR12MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: bc71860c-b9cc-438f-99ed-08dcb20aa2ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?otIMqNHicGNQez6F1O6kZ1h411q0aR/MCjAqkvF26WWgVPGtHB7rKE5FArhX?=
 =?us-ascii?Q?CNp10Ot1AZgm6f7Lhx2T0hkaiYqbezYuPaSTyZLfDwSwz3S1dIzCCC8cFogi?=
 =?us-ascii?Q?Or67h3UWTw3wABwR9ELht7Xrk5YOcw+JQ7fjySzh4uXMDAREsNmGnxlP4DkY?=
 =?us-ascii?Q?9CCDDR9BqWF8V3gBYbwShQRYqRucLkUAQ5bF1r27Nk4a6L07+Ut0y1dfgSb9?=
 =?us-ascii?Q?MSAlKTTeis+vPNkOGeWQ5PvpoM6i9tQY+2x8Fq/Qu+QLANmlfblfWe2IXd/I?=
 =?us-ascii?Q?TaoLbCT1IXcxwfjggC9U6c3NnuM3otoFRkr80AE+eVq2q9/mPcURGf703AkO?=
 =?us-ascii?Q?JuB2nQnAU7e57nBCJLGsyFIbx4QJ3/Y0ZmupN335CTA2dMJkIIZujwAqjaL8?=
 =?us-ascii?Q?1gHJ1F5jDxzcDHvKpEeGTKK7HoCNpOjuwyURtc3dXtg4z3I08s6Uvfbz93xE?=
 =?us-ascii?Q?NC9wRhIcZ1IGiD2Du8Pn0etalsSWPx1y9iNOmG7AfBp7En47mYhVc9Aif/o8?=
 =?us-ascii?Q?2jvuSGKDbIs1pdT3Aj7WGDVEHOmgIRQASWfucRjQFVf7gmPUyS56r4QS9CH4?=
 =?us-ascii?Q?I+p3Nf2rhNYWR7qNKmjVg2znrADzRUgcwDj17DHwhvnQxTiA3ds8zfEHmxfC?=
 =?us-ascii?Q?i1XsQJ7lA0sqqtrTrb7/6uA1CyBNP3NUbW9eHsvEmECNIef/39blCKXVVeM9?=
 =?us-ascii?Q?9qdN4NNpbdx7GkdbW7cA+hgfi94dmfwoXCvZzU3vMYiPTqV9BWgr5BYx9PGH?=
 =?us-ascii?Q?VIjWULCnsDDLJPfOsh5F32Oj6b+zingCUCuPhpmQ6maH24tg3AcmMXAWcNn0?=
 =?us-ascii?Q?17WFXx/yDBRYWTXlr0SZzHv6Lyrihn9IuKTYxPTH9OrwGGTa9gPeD9Bpp43y?=
 =?us-ascii?Q?jJNAZTG5qY6hvGdnnRLFlOO14eTvJRC1zkebMWtnyc+avPH4dIBl8kFzNjJO?=
 =?us-ascii?Q?dyxqzTx6VUUhPOKXJxFxiWlElRwEAqZwWvEFZRk5OTA6G/rnbqf0rIEk9dZh?=
 =?us-ascii?Q?Xu2F0lRX2WKAqrkoIT/8+esS0mnGi+8jmtDcEBz3J+ZniV8S8mDH2xiLjjkN?=
 =?us-ascii?Q?+2ZnRqlOSHY8LFVYJo8o870gw07oHxhcZ882RQJM4UyKqvLOM/y38lWgQElr?=
 =?us-ascii?Q?qpVnYHvM0rBDOZXuaAOdo2BZltyClCgzz1GOitKjwS96PB7j3nu+QzP395rx?=
 =?us-ascii?Q?qqiVW00EOj43RwRaiv3f/ROIatx8mJQED9AZPtTOunZ31XMcsgW02EwA0mH9?=
 =?us-ascii?Q?0V2ZgA17+yTxllYrDu9dSvkhE4/jexldqxgaGqcYJc7dyk9iHTC7kmP9hwBD?=
 =?us-ascii?Q?BGnVGoPdLZQNhY1UqVg0+WLOL68Wc/bhMU91ku+LyF8enybYzyf9z/pq2oSP?=
 =?us-ascii?Q?RwQrdNfwCPMEhJEwn7OrGExaT2ZfYD84KtXTonnKgiOZufKjIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:16:32.9696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc71860c-b9cc-438f-99ed-08dcb20aa2ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6528
Message-ID-Hash: FOGOL5TRSZJ2VXH7EXJF7U7M6QANVH2M
X-Message-ID-Hash: FOGOL5TRSZJ2VXH7EXJF7U7M6QANVH2M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FOGOL5TRSZJ2VXH7EXJF7U7M6QANVH2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename Soundwire generic machine driver soc ops with tag "asoc".

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 26 ++++++++++++-------------
 sound/soc/intel/boards/sof_sdw_common.h | 14 ++++++-------
 sound/soc/intel/boards/sof_sdw_maxim.c  | 12 ++++++------
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 64fb53772c04..9395daf220e9 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -594,12 +594,12 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 };
 
 /* these wrappers are only needed to avoid typecast compilation errors */
-int sdw_startup(struct snd_pcm_substream *substream)
+int asoc_sdw_startup(struct snd_pcm_substream *substream)
 {
 	return sdw_startup_stream(substream);
 }
 
-int sdw_prepare(struct snd_pcm_substream *substream)
+int asoc_sdw_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
@@ -617,7 +617,7 @@ int sdw_prepare(struct snd_pcm_substream *substream)
 	return sdw_prepare_stream(sdw_stream);
 }
 
-int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
+int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
@@ -656,8 +656,8 @@ int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
-int sdw_hw_params(struct snd_pcm_substream *substream,
-		  struct snd_pcm_hw_params *params)
+int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
+		       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link_ch_map *ch_maps;
@@ -699,7 +699,7 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-int sdw_hw_free(struct snd_pcm_substream *substream)
+int asoc_sdw_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
@@ -717,18 +717,18 @@ int sdw_hw_free(struct snd_pcm_substream *substream)
 	return sdw_deprepare_stream(sdw_stream);
 }
 
-void sdw_shutdown(struct snd_pcm_substream *substream)
+void asoc_sdw_shutdown(struct snd_pcm_substream *substream)
 {
 	sdw_shutdown_stream(substream);
 }
 
 static const struct snd_soc_ops sdw_ops = {
-	.startup = sdw_startup,
-	.prepare = sdw_prepare,
-	.trigger = sdw_trigger,
-	.hw_params = sdw_hw_params,
-	.hw_free = sdw_hw_free,
-	.shutdown = sdw_shutdown,
+	.startup = asoc_sdw_startup,
+	.prepare = asoc_sdw_prepare,
+	.trigger = asoc_sdw_trigger,
+	.hw_params = asoc_sdw_hw_params,
+	.hw_free = asoc_sdw_hw_free,
+	.shutdown = asoc_sdw_shutdown,
 };
 
 static struct asoc_sdw_codec_info codec_info_list[] = {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 6ddfb1f9639a..e88b5627560b 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -134,13 +134,13 @@ struct mc_private {
 
 extern unsigned long sof_sdw_quirk;
 
-int sdw_startup(struct snd_pcm_substream *substream);
-int sdw_prepare(struct snd_pcm_substream *substream);
-int sdw_trigger(struct snd_pcm_substream *substream, int cmd);
-int sdw_hw_params(struct snd_pcm_substream *substream,
-		  struct snd_pcm_hw_params *params);
-int sdw_hw_free(struct snd_pcm_substream *substream);
-void sdw_shutdown(struct snd_pcm_substream *substream);
+int asoc_sdw_startup(struct snd_pcm_substream *substream);
+int asoc_sdw_prepare(struct snd_pcm_substream *substream);
+int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd);
+int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
+		       struct snd_pcm_hw_params *params);
+int asoc_sdw_hw_free(struct snd_pcm_substream *substream);
+void asoc_sdw_shutdown(struct snd_pcm_substream *substream);
 
 /* generic HDMI support */
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 8faa06824869..f689dc29c493 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -80,7 +80,7 @@ static int mx8373_sdw_prepare(struct snd_pcm_substream *substream)
 	int ret;
 
 	/* according to soc_pcm_prepare dai link prepare is called first */
-	ret = sdw_prepare(substream);
+	ret = asoc_sdw_prepare(substream);
 	if (ret < 0)
 		return ret;
 
@@ -92,7 +92,7 @@ static int mx8373_sdw_hw_free(struct snd_pcm_substream *substream)
 	int ret;
 
 	/* according to soc_pcm_hw_free dai link free is called first */
-	ret = sdw_hw_free(substream);
+	ret = asoc_sdw_hw_free(substream);
 	if (ret < 0)
 		return ret;
 
@@ -100,12 +100,12 @@ static int mx8373_sdw_hw_free(struct snd_pcm_substream *substream)
 }
 
 static const struct snd_soc_ops max_98373_sdw_ops = {
-	.startup = sdw_startup,
+	.startup = asoc_sdw_startup,
 	.prepare = mx8373_sdw_prepare,
-	.trigger = sdw_trigger,
-	.hw_params = sdw_hw_params,
+	.trigger = asoc_sdw_trigger,
+	.hw_params = asoc_sdw_hw_params,
 	.hw_free = mx8373_sdw_hw_free,
-	.shutdown = sdw_shutdown,
+	.shutdown = asoc_sdw_shutdown,
 };
 
 static int mx8373_sdw_late_probe(struct snd_soc_card *card)
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21794458D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 09:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40BFF32D9;
	Thu,  1 Aug 2024 09:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40BFF32D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722497743;
	bh=RDO+vloBM2GX4x3HsozmjsErgtAplHVdtbM9kcsLnNk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I5i/d62oNOu7+Ar3tSm+jLvugP4ISXlTupQS44CRPiqsHztzmM0wmS3q/AHgu1lPJ
	 T+q3/WI2SPl32BlaPuyZQvE0q8BxRnNo7ri8KeqveWXJavo4UxoXXKj4vCYw9EDgqY
	 GZfG117FZWdK5QFloEi/L8zuIE2M/0bFVriH3HR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B12CF805C7; Thu,  1 Aug 2024 09:35:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6223FF805D8;
	Thu,  1 Aug 2024 09:35:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48D29F80269; Thu,  1 Aug 2024 08:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD2F3F80448
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD2F3F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hjRTEXJp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxtxVWza04IqvGfofHRvO5ktYlZ8Aem96q9Ki00S2kvQNFpgjtkPBRDjW5z/O5/aDvMdhbx1IlclIrLyIE+TU13tG93FSU/hlwP9+293TVcrkozoW7FONCW1PWSSspXdZHovnmSWSAPFGpn5p6UVMIgJcQM+nZBWdgqsgrGcGqBKHnMnt9VYUrSM/owB6qkZaB3p6VDcZ3puzf43lIXEbgNUeUVFAyPurpBS2BoP3+PMC7PwSQhBdXbYHnq+1LZveZkYre36C5cJ3GaA02Of/gN9U5KxtYet0nlAEjc/DYNeVRZcOdWG26QsdLVD4ttEC7KveZKZJI4dB7jI8w2GFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PN6D6XRbeecwMVkpspR8HoNG+SKkdTm3cCEgvNTAC0=;
 b=ygl7Yb/sf8L88VdXfs/rieP7eW+lOz8ZYCJKkam/9PL/d50TA7jDCGGYn9LoLJaLzehiTG36XIZBhgWViA7/h/e/KP4L2so6h30WlJmNORKa0ejqpxEFa3nnnhqr/NTzCh0s2cZXmgLVjUmcxqenxTpAeXa4kAmZ8nO0IgEAiViS7v7vOS0xTvmdKhSKSK4E3tM3+oWE1itVMY6GFZ+Eyb6AGRM/o8inJ+JQJUYnQO6gICm/yoz8qyWKYMRpPGtf20VpgPC546BxsrAOSX6MzLhz1WqwYjx/v4z4RFEVQLpEmdwc5GOayDz4svC4W4rYaYfB6YHQqYx+Y5du+uHBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PN6D6XRbeecwMVkpspR8HoNG+SKkdTm3cCEgvNTAC0=;
 b=hjRTEXJpI/b6dTFHEXTvdjdQYeM9Wa8Tz6PcF+qRqafH1wkqoZ6sddhgtvTBPKxfViAMPKVtx65iwxHPEAwTGuFrSegiwAQr7sNJ3RX4dwEBloH1pm6KTdaeDly/3xAMBSVGYHT6FjooaLCWE5BmLwL4jIj//FJqAp5+pC1SYp8=
Received: from CH5P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::28)
 by MW4PR12MB6997.namprd12.prod.outlook.com (2603:10b6:303:20a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:25:54 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::97) by CH5P220CA0022.outlook.office365.com
 (2603:10b6:610:1ef::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 06:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:25:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:25:52 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:25:47 -0500
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
	<chao.song@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 03/31] ASoC: intel: rename soundwire machine driver soc ops
Date: Thu, 1 Aug 2024 11:53:48 +0530
Message-ID: <20240801062416.2203673-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|MW4PR12MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fc51f4-d49c-41e2-f882-08dcb1f2cbb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GPoB4yPKY4bqTsWXdvzskvI0EuSilralOZi/pCB6a+mfmWHKKF2QYYsAFP81?=
 =?us-ascii?Q?xixG+YeEvwNbnE3BDLQvtFVklzdDwRMuLsVMQ4T8CArMRo5LxsnpAJQq/U1L?=
 =?us-ascii?Q?4YiX6lzikpZAOvVe/UdsZAd5Z2K45n81Oukk7l09+vOoZ/IIHyWwzZZHUBW3?=
 =?us-ascii?Q?aeuDqTASXNnYUgB4EZalMtWEjrqeMtSchHaCUu3YwyhUU5mQyisonizQLyEo?=
 =?us-ascii?Q?TQ10UUrugc1nDR/8ChZSC13Zc1AP6rfGRV+1GUfTnZP2SqIs0h2YOzHmxcQn?=
 =?us-ascii?Q?QugDqUEZn6WBZd3TD46VsvIVW3fVGJSOEdf2OwN/YiePL/krTbd9DUe2hbkm?=
 =?us-ascii?Q?5k/QslSFCPTCQtaO7AJOTYEOmjIcK3didSxpH7Wf1WF7Du295Ky+xiMpVnl4?=
 =?us-ascii?Q?2YxTgSbErK6wsm98aE0CKoyQHyqAeVW8FH/6JCzfSaet9KH5SGxNGcAxzWxy?=
 =?us-ascii?Q?Y1jr2hFJj+k2UPW6/COFKQHPTUu1f2X9/vVpzkc3rUBGxiMdSrJ3lEUu7x8Y?=
 =?us-ascii?Q?7BSyZNL20vuMDj1gvzDoGHMpv3B3aLSN0SbE5xlHxs8IABSsmyFB/t+gaN+7?=
 =?us-ascii?Q?kUhqosCwfGXTBbpdzEiz+PVnV1gjDtOk4wyv1LyYvFiAG+R52WbEXbovVtq1?=
 =?us-ascii?Q?nUSpZuutUY1D7xLM9XeTDK8ilmbx+lKY5fpDyyCj5zDK5pId5aDvJ0xgzG9h?=
 =?us-ascii?Q?rywuovBv9sOptRlKNyHrmnjx1+OTEmHlX+/5vjk0WSsEBNgz59uzhWtSYyoU?=
 =?us-ascii?Q?2uQxlsEwq9+mq3vJR89u8Y6U+FhYsJjqmv0/DXu9PlbaPrP3MifV/uEgV5Z6?=
 =?us-ascii?Q?9pts052/CEJBQI9LoRoG1tBoXO1BxmN71vz6hUtkKeiVt8YRHNEe3kwz9xhw?=
 =?us-ascii?Q?dgz3n7IM2Wrjl5tiNdYJngIjrqJm6CiAslqAa0XxdtrnX5AdQqljQ7K0jn9O?=
 =?us-ascii?Q?Txo4rbSUCHl9ly7DHO23K6E6cl1QuHsLWm/dHEOqMmEZmhonHbKBB1zcbSzL?=
 =?us-ascii?Q?Sx0NV838ybRON8CQE7NJA+3fRwg4aApFiQPUQCobN9dUQ+OJNP/28klfvAMV?=
 =?us-ascii?Q?uIS9z8DguogrS24JDXnxRib2zjbQNrIBwvipwyrPMfHmvVDd2ipMPsA312Qt?=
 =?us-ascii?Q?bI5VNPr5i9hBLVdN9kfq5EJXnCqDdS9UGtg/BAkp15nbE2dplldjmdn3e3cC?=
 =?us-ascii?Q?LsyE8DdnCaH/TkJL9GVq2xKYn0TT8mWYgFpvvLUiUIJyG5CBk9IO/LpiKz7b?=
 =?us-ascii?Q?zj096o+NY/WByH/s58Wvvbcc0lNO/DRFCPPrXbKPz0vw8iaYGekHFv0d+d+X?=
 =?us-ascii?Q?8sjbASgzCOqpckY97Hi3cCanokqcc2kZJlAgJAIy9S4Xd9TkthyJqfr+J3Qz?=
 =?us-ascii?Q?t6dLEMZq48KAXcZbAbFXVawOCX7GQfVbTDBG07YzspsVOx0T6w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:25:53.6601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 37fc51f4-d49c-41e2-f882-08dcb1f2cbb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6997
Message-ID-Hash: M2ZBA5RIJAYEJFLFPRBTFBCMHP2EAG6N
X-Message-ID-Hash: M2ZBA5RIJAYEJFLFPRBTFBCMHP2EAG6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2ZBA5RIJAYEJFLFPRBTFBCMHP2EAG6N/>
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CABA969BFA
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:36:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D835E845;
	Tue,  3 Sep 2024 13:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D835E845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363379;
	bh=nlUWORNFd9KOa1CXYjKJZUeQgBqU/os8bdvHeLxrru8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L7Zjo+AOkaan4UaTA5B71leeJgeiZMY7v9QOK2DWwIX5zrKD/iH/ulSTpGce+qzhC
	 c4hmspSlps35IZVEJ6WUmgPwwwmHuHInyjYxlTPuwUUiqB7KyFf689y+d2kGrEwTi5
	 SqwcoWTJiM9xdVtT3wJcYGKagfFgLnLM5Gek5SUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD73BF80617; Tue,  3 Sep 2024 13:35:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B38F8016C;
	Tue,  3 Sep 2024 13:35:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FE0DF8060D; Tue,  3 Sep 2024 13:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B4A0F8060B
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4A0F8060B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=H4vYXqvg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaO7ua3s5nR/+abpx3MTlvkLjVEmvGKvIDdH0xYdh4kdjxOsyY0I8DdG3EKxcvG9qZJ4rQuFJVKhtphFxZ+lkoX1rEyP9LRz2aWGAq/5kLaqDPlWQF+CCJ7uBgkc+jKv90T2r2vwWzkqFfdNELTz2mM8K8Mf8rbHbNAQb2XbJgXbG89PiQdAx+3GSAv2yu9YuSyLkxEwq6Uk25v75pFSrHsdW2ogNhnbyGFyeQker7GLDemvS0NjV2F50x+bJZfYtFKvwaZzKAEzc0x4cJ2rbG4W0VC3I3GvSZ4OT0RsAxrzKoEiLdOz5zfdQzUky7A/Qo/VUZAEZTXFW3LcAd7wpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWiDPIkzvQd5Q44FRgFW2oHAncOpqnss+4Ve0U1l7Qg=;
 b=CODmWzh+eA4WugEy1wWoHitRinSnSP2D+wk8OXO2ZCV7mWUFY4jliqo9C4dTiWrj4nNZVQ+qBG5gWsIBamI7QFgyhAzDTsfJps8aSFrUhb1gvadwIL19xlOSYsF0ryOlVp4s/Z9ckewHmIw5z8sQ66VK1bSojPF9h05gEIYHRnyOiGZlHQ7+SYSE7z2oAJO8Xwc8CGnp2loKhWXYysZ3auvdTpHkoZ6Z3J51uMOQEmd8ZMA6elU2ZBqu20UDv9g63qkaI4IU77sETMwdmc6moVxhd4LM/zfbb3f5Kl719ylC7a/YkY9ao7N+09BQURAB+MfOrWA8BCqPR+OomlF1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWiDPIkzvQd5Q44FRgFW2oHAncOpqnss+4Ve0U1l7Qg=;
 b=H4vYXqvgVvsOByxQvM9ihNZ64uOTtjMTndlXBi3wC4a+1SNRgoAdllEAlLFEVspIgk8iL7o9CLlpNytWENaOKdaHHs87AEAmxk7ZykNqESuvaRXSdIeHeqSlgZySdwvWcT8mMHweCLZWKay7aLq9OWE0FIvdB+sraDmrzewdlUM=
Received: from DS7PR03CA0331.namprd03.prod.outlook.com (2603:10b6:8:55::26) by
 CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.28; Tue, 3 Sep 2024 11:35:05 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::67) by DS7PR03CA0331.outlook.office365.com
 (2603:10b6:8:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 11:35:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:35:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:35:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:35:03 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:34:55 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 03/12] ASoC: amd: acp: Update pcm hardware capabilities for
 acp6.3 platform
Date: Tue, 3 Sep 2024 17:04:18 +0530
Message-ID: <20240903113427.182997-4-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
References: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5960aa-c78f-449b-7945-08dccc0c74ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tI+Ft6PZifUk9qCxjtKyEXr8/oM9gqDVgWmkOuIs07/eySKYqtiTDJb7Iadw?=
 =?us-ascii?Q?I3q3zjrAg6mUvSUN5Fhljorm1/VGqgt8FwByQNyD0tF0hgNjkRBttAGv/PWa?=
 =?us-ascii?Q?RddN43OsKzG8UoxNUctY+niag2quyRTp+npEHpk4ZWjq/6c0Y8h/Xf/MTgYL?=
 =?us-ascii?Q?D5p++S6abTU3HeW2jl9hbW864+eVbKqMDtCNvG2EZPKzuoCLiczQb+vrIxON?=
 =?us-ascii?Q?UmCdD+dDC1F/zPwFaIEOnOagI52E76EcxqURJOPhgQE2hD18Ang9DupcZUxI?=
 =?us-ascii?Q?8Bid4PHJqnmE6BswnP3k6BKOYP1sktok3lpy1YOI2qz3aO8jNjrOaaO3qhp3?=
 =?us-ascii?Q?vYfO8hdbwNZdatmFRbmnF4FjUcMyjzwiQgJvgz/jHC69P9EDSKNw87ZbKclL?=
 =?us-ascii?Q?XJ1uH0CAsHwq3SIHnZ7vKcxkoDpS/EVpLjU8g/acMZuqZqlyiGcoSaycjPNl?=
 =?us-ascii?Q?GXvaWj4m2l3CDhu3i4mZGifne59v1wqJ+dO3KyjVb5TJ5Wnyff/Lk9Dw+/E5?=
 =?us-ascii?Q?NvTxOb2+Ded9aXiILgZcA7ijesgpqWoquec8Un2Y90UJQOM4BXaPAj8W9AXH?=
 =?us-ascii?Q?4p7GlRHm4xiQTOKTRyxOjuBksfWr47EFHOjsgEnvnOCK2cJ5TPuq4G+eMWVZ?=
 =?us-ascii?Q?ZfPL5tlh4KrvVKNvBcoChzvaPDXPqGE0WjrhByG3272bitXlXAOB05UC1Axf?=
 =?us-ascii?Q?2aEZNuZJh2zPjb0b4UfcZdonuRkFjcC9rSfHz0YqV6NJN20SPLnwzc0b+x/L?=
 =?us-ascii?Q?czaz0e7OtJyEaMILY836CZDX1S2eDMqJgw8/0eJMs/Cl3YekHQLpSrU61P0z?=
 =?us-ascii?Q?UAKdPqDz/4Lf5jIaAe/p2z/1SlhRu4UM23woW9gLolaW6YDfdfBRvojRvGpw?=
 =?us-ascii?Q?vNaktCflR4CbHofzos6YklA6yBcKYc/K/RBlr/CgfHcNM7cGhOSdfvPClgdI?=
 =?us-ascii?Q?XhzBRCtHDUP4nQ1/p9Ba17EzaPxlrHkXQnavw6iU6KLKPxU/opq3Xbf0R7p1?=
 =?us-ascii?Q?E6o3ct1/kwBfF3n6vMJbCfvmkr+s7tTi1tRhZgy+LFuNdDri5HP4zi+Zf5qO?=
 =?us-ascii?Q?s20Pk+hezT+N20vYmSH38B5oGryc47/wUBALFXON4bREcYxme6oQWF/zaKIn?=
 =?us-ascii?Q?K6hys2rpRpHNBAY20PnOdtMvU9N9O4l1OP/UfSJuHKJVd/EbL3erJpVhuQMl?=
 =?us-ascii?Q?1CQtBxVcDI5E6m/qkrLezDiVb17GvFELyi4iOFTR8NhM5VtjKCUKyeQ9IRaL?=
 =?us-ascii?Q?j9Qcp2pp0lLOvNLI7p0YzbrxWdZBuF0GmTPI0nyiCggEdeAGMygl5akHDfXO?=
 =?us-ascii?Q?wcqYsycQewilXKiMAyVlJ1+Z1jQJ72d8D44IkktsKcIoXA/skp7JaodBIFKc?=
 =?us-ascii?Q?0lIoePDFk2yLlOjign7u0GNosunqSrsGKvFOtl/tTfUJP4Dl3bks54tcPEB0?=
 =?us-ascii?Q?nM1D2p5FpNv0I1Ij5heedok9i5dPHugO?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:35:04.8095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b5960aa-c78f-449b-7945-08dccc0c74ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426
Message-ID-Hash: DD3VLCJMWHFEROQY3BFD7PBP5CYYMW46
X-Message-ID-Hash: DD3VLCJMWHFEROQY3BFD7PBP5CYYMW46
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DD3VLCJMWHFEROQY3BFD7PBP5CYYMW46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update pcm hardware capabilities based on acp revision id.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-platform.c | 61 +++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 4f409cd09c11..238b4f648f44 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -68,6 +68,46 @@ static const struct snd_pcm_hardware acp_pcm_hardware_capture = {
 	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
+static const struct snd_pcm_hardware acp6x_pcm_hardware_playback = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 32,
+	.rates = SNDRV_PCM_RATE_8000_192000,
+	.rate_min = 8000,
+	.rate_max = 192000,
+	.buffer_bytes_max = PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE,
+	.period_bytes_min = PLAYBACK_MIN_PERIOD_SIZE,
+	.period_bytes_max = PLAYBACK_MAX_PERIOD_SIZE,
+	.periods_min = PLAYBACK_MIN_NUM_PERIODS,
+	.periods_max = PLAYBACK_MAX_NUM_PERIODS,
+};
+
+static const struct snd_pcm_hardware acp6x_pcm_hardware_capture = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 32,
+	.rates = SNDRV_PCM_RATE_8000_192000,
+	.rate_min = 8000,
+	.rate_max = 192000,
+	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
+	.period_bytes_min = CAPTURE_MIN_PERIOD_SIZE,
+	.period_bytes_max = CAPTURE_MAX_PERIOD_SIZE,
+	.periods_min = CAPTURE_MIN_NUM_PERIODS,
+	.periods_max = CAPTURE_MAX_NUM_PERIODS,
+};
+
 int acp_machine_select(struct acp_dev_data *adata)
 {
 	struct snd_soc_acpi_mach *mach;
@@ -183,6 +223,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct device *dev = component->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip;
 	struct acp_stream *stream;
 	int ret;
 
@@ -191,11 +232,21 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 		return -ENOMEM;
 
 	stream->substream = substream;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		runtime->hw = acp_pcm_hardware_playback;
-	else
-		runtime->hw = acp_pcm_hardware_capture;
+	chip = dev_get_platdata(dev);
+	switch (chip->acp_rev) {
+	case ACP63_DEV:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			runtime->hw = acp6x_pcm_hardware_playback;
+		else
+			runtime->hw = acp6x_pcm_hardware_capture;
+		break;
+	default:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			runtime->hw = acp_pcm_hardware_playback;
+		else
+			runtime->hw = acp_pcm_hardware_capture;
+		break;
+	}
 
 	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, DMA_SIZE);
 	if (ret) {
-- 
2.39.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B490A75B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 09:35:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B033A4B;
	Mon, 17 Jun 2024 09:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B033A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718609728;
	bh=8Kiie8PJEQCfJbrhQWyt8QJX4b8c76PxkDwaEm1h/4c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CMXKtGU5RJTc4fpB40zallJkg1d7x8zPpXb0hLIJBrVOQ+hM/1tlvxOSm9YfSwCGe
	 /JBhrPU05BObW5eKNpYBp4e6qLWblRZGwkfKu5Rhdj0j4Erm3Hk5mNglMcCFJsifBO
	 lxYO1nSRRwEkMeLeHNWtb8NEfSjhdWtKMz4YYpO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11BF5F806AE; Mon, 17 Jun 2024 09:33:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82E12F8069D;
	Mon, 17 Jun 2024 09:33:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39D7CF80269; Mon, 17 Jun 2024 09:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F860F800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 09:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F860F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hID9vJdG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwxlS+xgPhufgmwHj9jeQqPtTyyIGCD7BwFQLwrmOLpxN9rEqLRgDTSKeQY/w1v99fhhKsAszaU3oSyEi2RiWlagMQuNJXGHlsCSFcU5jpxFDWiCPY7U7pUYo+0Bs2lKxUNoBRwp5Bwral7bzZFkbP9bJO3n0LAb5bHfZvWLkHQvIn8AVYAN4o2n5NJBhGs5qfPigVbtksMVtA227+9+KEktqk95XbouO07Wktad2/XM/p0Mcs01bzlUZMGGgGbstebekp2z96pxqKz/7aSADwJ3k4nKvRMcH00oyju/LyUXc+Vb2mGGV2MYOYBazJjqP4GNu2jxFu7Qsv41AH9wzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSK8T3jVEx+p3fxQ8QuFToo/lAjPdRTecPt6LmaBzeI=;
 b=TVolHKbrcL2muHOK8/Y/xHEw5jYZ6dOCQ1/Q67ZaXfiemXKuL9uiHBg8/wwHoSGjPhGPfhxRMRRiOaWjK5lfd1HLnTsFbwWGkUuq0znpNG6TXpy2POwUl+kk2L0Zwt4A3YSXROChzUzAURv3ZMwKUzFxv4DPMRSBzu0r7BUDB7gXitPFY5eTq2wHJrnFpi3B96AW39MnlX63J0wVFx6vt22pw33nfD62aCIXQXivKc+G7E+Ay3AMs69rbM2SWzbeZaViutQJnSOEH76Gc2mLbyrKm4oL1nIHpoJ6jpqGRGhHn6WEw3rGPwm72TFS1PgK6aR94/VfFAc3t/GQMbYO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSK8T3jVEx+p3fxQ8QuFToo/lAjPdRTecPt6LmaBzeI=;
 b=hID9vJdGICa3Jd0hvpXfcpWEfe+WY6kSfO3dhTBnocv4h1YSfaX3AFWBZLRpKp9HDCKrunMUhPevoLl9FaPWUVqu24fT5b+N6uAQN9pZS1Cb60vBWjw1Rhnx5PKQnYxZHj6Ls9xiMeYKXdyLZM/q95q7yM4DMGHAOGqyj+5sKTs=
Received: from SJ0PR05CA0170.namprd05.prod.outlook.com (2603:10b6:a03:339::25)
 by DS7PR12MB6167.namprd12.prod.outlook.com (2603:10b6:8:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 07:29:49 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::9b) by SJ0PR05CA0170.outlook.office365.com
 (2603:10b6:a03:339::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 07:29:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 07:29:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:29:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:29:47 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 17 Jun 2024 02:29:43 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, V Sujith Kumar Reddy
	<vsujithkumar.reddy@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>, "Yang
 Li" <yang.lee@linux.alibaba.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 6/8] ASoC: amd: acp: modify conditional check for programming
 i2s mclk
Date: Mon, 17 Jun 2024 12:58:39 +0530
Message-ID: <20240617072844.871468-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
References: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|DS7PR12MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: ee80cdf3-7f02-498c-e3cc-08dc8e9f4524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|376011|7416011|82310400023|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XNIZWX5ltQ4axKJCEIX9DhtqoMz0PJmZA25/5T8a0H/oz72iAD1FijZVc35v?=
 =?us-ascii?Q?ygEz044zlpYgPRa3TpXeRhehA4CpuYjukSFWxIxrOj8epW9MV03yA8OucNrv?=
 =?us-ascii?Q?cHi3YSWL5/i4tq6bWZ8twHeoyhKX6xxCCQDyPxEd3Hdm/zK8M9VzGYRt1DuM?=
 =?us-ascii?Q?IUNDL86dXHPTLprU9w2MFjACDqGvKWPH9w48iBGkydfCZ+BJzgL8lOaL+lp9?=
 =?us-ascii?Q?xC7nGLkM2lGbLHS4PKKP16xHzNU/uBNmTZKApDJ/+04u0YcYr5k4yVw53HaU?=
 =?us-ascii?Q?nD5973PZTQoqjOdjYizkPLQt1JTGoJJqzP0ms9BLtE6RYDGHJDbYDG6lUvTb?=
 =?us-ascii?Q?2eSPp9MUiJ89htfKnBeK22tfLrVjDrEEm42S3LNRDkxuTyHDH1TLOs4U8GRp?=
 =?us-ascii?Q?k5GiVEpFbTo4LoMmcFCX129bJv5snEip3xGxrplK/z3wuLMIg+bC1yGpsaIX?=
 =?us-ascii?Q?pmGJjEifwhk2bz9DLnNsEPJDpOl8kRDTiK9y2vcsm8Tq+aOLYD2603lyRBds?=
 =?us-ascii?Q?+lMt2nJssAMbrUfKLPtQVehRz1pUADlHii8arNQwWzJwGOY82mHfmBEoW9HS?=
 =?us-ascii?Q?Gx76zs9PtNijpez8K/MmmZsalAqXk2cvvINeuaMkMNeXjhkEF/jsfqyioKRS?=
 =?us-ascii?Q?RiPBy6Mne+4hjiVoHRgCtgbBinaXfSTY4RcJsY2uLUCxQQXb0A8Jw470v72S?=
 =?us-ascii?Q?l0Y/kNqEE5+Tao7Z5dyrMqAxvD81aKwo6jN3v6vQztgp1xXnBIyUQsIwZuDI?=
 =?us-ascii?Q?EhVPMiRP2eh4SdsWA4zbnu7Mrk3d5wJBOqeqEMSvlvIfYrr1lL7iWUSi325f?=
 =?us-ascii?Q?xBysv80bU9EgSg8S50J//ziittdl3xK1PMsr0IyxpMPqnCA33QZ8rxsqrrn6?=
 =?us-ascii?Q?MxtAsEhdSvQBIOt/bpzzAxpqTBmGlAVyD07V6OrPzh3PZgQPko7K8Df5hdVT?=
 =?us-ascii?Q?umA1kLL7nQNVx6DRnL/zlDgMIbcKQ37lvFFbZcT/lDcnoIiSLzBoiR1zb5iG?=
 =?us-ascii?Q?/9Fi2EA5G6LSPcVGY4a78dUunuIUgRrG4sR2JRuZ+wfgeCDdlFXo5ZwD3GtW?=
 =?us-ascii?Q?BgkVnP+QYYJgr67ijRn8g+KojKm7WyuGFqjT68sJm5gCXspvTAQm2AFwzlcf?=
 =?us-ascii?Q?Vdv9N0+FAkqE4UkauK85Xy/uOqVKfaQved5A17Gty0O7i8c9k3uXrkrCAcYn?=
 =?us-ascii?Q?12czjMAJFtsm49SDc85wPPeGYxl1OFvT4uHAysS85NSrLcXdQ2hfaSMowlX9?=
 =?us-ascii?Q?T6GEz03GZRuWWfdI59XxTU70mIESlK+d4xsmuwxOz2SAnS+L+/3rZ9GP0JIQ?=
 =?us-ascii?Q?8eCq5zf2Kwk4SJ42i5Aj6TVpnVf2smGpMIkL/sLsNCe/UdmVkIagrh9/IZyk?=
 =?us-ascii?Q?bOq39EPHOdy76eRjnVMgchLQ+WU8QDzLtpTpfpBuC6k0v8zJDg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(7416011)(82310400023)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 07:29:48.9351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee80cdf3-7f02-498c-e3cc-08dc8e9f4524
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6167
Message-ID-Hash: GGAWBPYLHVVCT7IUAHLD5HRCWENHWOPK
X-Message-ID-Hash: GGAWBPYLHVVCT7IUAHLD5HRCWENHWOPK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGAWBPYLHVVCT7IUAHLD5HRCWENHWOPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP provides different IO configurations(ACP PDM, I2S and SoundWire).
I2S mclk should be programmed only when I2S configuration is selected and
I2S controller is programmed as clock master.
Modify the conditional check for programming i2s mclk.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-rembrandt.c | 5 +++--
 sound/soc/amd/acp/acp63.c         | 5 +++--
 sound/soc/amd/acp/amd.h           | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 953a793de9a3..e19981c7d65a 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -229,12 +229,13 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	adata->rsrc = &rsrc;
 	adata->platform = REMBRANDT;
 	adata->flag = chip->flag;
+	adata->is_i2s_config = chip->is_i2s_config;
 	adata->machines = snd_soc_acpi_amd_rmb_acp_machines;
 	acp_machine_select(adata);
 
 	dev_set_drvdata(dev, adata);
 
-	if (chip->flag != FLAG_AMD_LEGACY_ONLY_DMIC) {
+	if (chip->is_i2s_config && rsrc.soc_mclk) {
 		ret = acp6x_master_clock_generate(dev);
 		if (ret)
 			return ret;
@@ -267,7 +268,7 @@ static int __maybe_unused rmb_pcm_resume(struct device *dev)
 	snd_pcm_uframes_t buf_in_frames;
 	u64 buf_size;
 
-	if (adata->flag != FLAG_AMD_LEGACY_ONLY_DMIC)
+	if (adata->is_i2s_config && adata->rsrc->soc_mclk)
 		acp6x_master_clock_generate(dev);
 
 	spin_lock(&adata->acp_lock);
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index f223311b6740..f340920b3289 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -239,11 +239,12 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	adata->rsrc = &rsrc;
 	adata->platform = ACP63;
 	adata->flag = chip->flag;
+	adata->is_i2s_config = chip->is_i2s_config;
 	adata->machines = snd_soc_acpi_amd_acp63_acp_machines;
 	acp_machine_select(adata);
 	dev_set_drvdata(dev, adata);
 
-	if (chip->flag != FLAG_AMD_LEGACY_ONLY_DMIC) {
+	if (chip->is_i2s_config && rsrc.soc_mclk) {
 		ret = acp63_i2s_master_clock_generate(adata);
 		if (ret)
 			return ret;
@@ -276,7 +277,7 @@ static int __maybe_unused acp63_pcm_resume(struct device *dev)
 	snd_pcm_uframes_t buf_in_frames;
 	u64 buf_size;
 
-	if (adata->flag != FLAG_AMD_LEGACY_ONLY_DMIC)
+	if (adata->is_i2s_config && adata->rsrc->soc_mclk)
 		acp63_i2s_master_clock_generate(adata);
 
 	spin_lock(&adata->acp_lock);
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index cbf9ca26f3ee..87a4813783f9 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -173,6 +173,7 @@ struct acp_dev_data {
 	unsigned int i2s_irq;
 
 	bool tdm_mode;
+	bool is_i2s_config;
 	/* SOC specific dais */
 	struct snd_soc_dai_driver *dai_driver;
 	int num_dai;
-- 
2.34.1


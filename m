Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A19BE406
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 11:16:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35D17EDB;
	Wed,  6 Nov 2024 11:16:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35D17EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730888204;
	bh=gzPyW1Rypt3DTVm07/LPgM2tk5VkTIp8fThvwvcm1so=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hUafkf25nk0YNPdXeFZaspVJeHEkR+MWhnXetks+Sz2KXpW4lJNINHSMK1QKO+0fq
	 XnYT4jd9Mqau/V2BNkJz0fBdSUtfGCedYcjZlMqJVpKVmCBrlAoUt7T7TqQ/r0hkSH
	 09+Hx2qhooqgerMklwFwJ9lcARG9KNKvyke2txFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 870DDF805AE; Wed,  6 Nov 2024 11:16:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB97CF80588;
	Wed,  6 Nov 2024 11:16:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C0F9F8013D; Wed,  6 Nov 2024 11:16:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F420BF800AA;
	Wed,  6 Nov 2024 11:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F420BF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SDEaZewb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv4M02KSX/VZaTncBXO2v+eI16PApB4ZrmMznfHzVh3HzC2h7nCF05l8m86LBGHw+WMa9eBeKOeejzGsu0CqGHkqgkKNKhSCWlFW/sgApdCcrCd0ZaW/ZJxN3KbDaW8Rtz3UFiY7eBPCDmYBxaU5guYY+VojJaDHq2jRMF4VhzKeOdCu4TtlrEoR67wpoWrqVZbITSAt2gnR14mx5+LkMb1Mu/lVqm4N4Wj+v7zxG7CvQ7nbNBndHFXLJkG8mdJw0V2TpDPBa2aeGAciwayyTicb4rKhyCLOk2xUp0v6JThugnHl23DzedMUEGadkf66R8WU3QV5muOV+6tf3uzW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJJb5BGhlMYTGa92ZN4aQhYD0LC48CDXxAryK6zr0WE=;
 b=BFHESX2ChkriDfZT6EXNa/5UXk0rPqgU6PWtz86g1HLayvyllsmutxiK7RCfv8jyr6LRnb+8lxk0ruhSmiVIm/k7ZkIIwsZoTE3RwJoAX+YUJY+OhWx/2OkG3BLXjgFko6O1VSB15A2p+AjE6fjgjGqXj5o+76Jcmm+MS9K0SFE4ygk4GHwCEVQyRLEPiXa/r2oC4FWiNO0Y25R92fUMH/8YCqinLVlxeDNg9HAosJVyC0AIJSoY+IoohTKgorjNcsJ0778vEhVYzVlH8zwUruJ2Gfv+slpKeAPTQN9bKSU8+5S2arrirWEGOyfiOUVjyqnZq5ohBmBciBZNDDfHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJJb5BGhlMYTGa92ZN4aQhYD0LC48CDXxAryK6zr0WE=;
 b=SDEaZewb0JEx4lzWlXV5uxJ4bQwO/Hch8OQOMqvdeug7PxdrlrG0WZzdWoJTKO5mo67uftR/igMFnP2tOuChyoGpVLmD8qsGNp8kX7vIWKY4mKHnLkhIOxJTdMMs1xv5GZhDbmVZJ5iyzi+CHbDauXLumKP46jXfaKV1aHNZsgo=
Received: from SN4PR0501CA0019.namprd05.prod.outlook.com
 (2603:10b6:803:40::32) by DS0PR12MB9060.namprd12.prod.outlook.com
 (2603:10b6:8:c4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 10:15:45 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:803:40:cafe::ed) by SN4PR0501CA0019.outlook.office365.com
 (2603:10b6:803:40::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.11 via Frontend
 Transport; Wed, 6 Nov 2024 10:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 10:15:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 04:15:15 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 04:15:01 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 04:14:56 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Emil Velikov
	<emil.velikov@collabora.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE
 (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: SOF: amd: Fix for incorrect DMA ch status register
 offset
Date: Wed, 6 Nov 2024 15:44:53 +0530
Message-ID: <20241106101455.1229113-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|DS0PR12MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 5325866b-a194-4fd7-9802-08dcfe4bfa22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P5cjJx/ohLX26YqfZu8ExmoPWVsX7x8Oz4hemhn8DLaYWQvO2hLV0hRjTReV?=
 =?us-ascii?Q?qPDzvRxP5MYm1EWiJ/0J0qtjjUESGtPz+TOtbwpB6K6gjoQvl5hbhFCTSNwv?=
 =?us-ascii?Q?dcrYIEuptqfFStoHEYRUNP0+N1/kITAp2mfnEIBoZRB/dGL8J/2g5dQREeAZ?=
 =?us-ascii?Q?+1sy3OMRNFZRk8y7MyvnHXGtKePWfx69Dur2s9aYW6k8RwYLpaClnOgGFZ2x?=
 =?us-ascii?Q?0P9x129KqtUN6ghYI2ocpBinr8u8fQ4H058+NWEWJl8EVjATTss0Wx/gck3V?=
 =?us-ascii?Q?IepBUjcdokG+dd3kafGkPMkrvqi4sMjq1pnw6dKoQy+uVTu7RkPH7JSWzpJ+?=
 =?us-ascii?Q?1JibjP/fvTAyvTlKzwMzX1P0kk50iPmAKC3jgcweo9/NvrKfcPDRnE9DSFhj?=
 =?us-ascii?Q?OaR7/2LqQCaCwB+23no/sJY23rvqmngumJeMZdBFTV5OFCBnppqydVktmcA8?=
 =?us-ascii?Q?E2D6T9V3MF212Y3ItAyIa1ic6qs4fTQ2kf2sGR2am+XSVu38BCsmoQqmihtQ?=
 =?us-ascii?Q?9MyxNiO8z1cDxQ0l14jFwy2UhZOkVqVzjfQRMdtP1u7P5tepowkEITqOqcuM?=
 =?us-ascii?Q?3byXsCDfKcfTNg7v6eX+31Wneu6tNxeKnqFwEJKJc2NWVJDzHUUJomAcJf3U?=
 =?us-ascii?Q?aOHIJfWYiQqJQgH3R+MGgdc3o+gHIPpcTEVzZLFR0T1GnlVxjkcrWjiiQNJ8?=
 =?us-ascii?Q?FBhJ4raihCIGnNw2jtJjej2/pFx7dUqT1Z5sdLLYUsu8BNmSYThjSnqwbjyw?=
 =?us-ascii?Q?v7tVCGtdziyDL+aq7RUE6+3h36rTG52u6adtNmzGcFBAFxOKgRjcv+fSjpIE?=
 =?us-ascii?Q?pl7aw5iQV8wyZdxqyzuZE/jSOZyoWIFxBqRog+hMEes4ZThWowvZE7TDLQup?=
 =?us-ascii?Q?XSosKySlYQejP0jEdmFm0eXlYYSVejHkYyOcikBl7lgEzDe5Q1clL30tzd4K?=
 =?us-ascii?Q?FSrLqhmBvRvVDbbQA8BZuD9gXzaOKf1ji5dUPioFB2wWDoXB7UVZWEiIG9KZ?=
 =?us-ascii?Q?oJtJKA2w1DK/jbc+lw9ofsnREpZ0kKCGSR4jyaPSpTD0/r844mdUBpfIURmF?=
 =?us-ascii?Q?FLpI1YoJ/S13f8LlbAlETo8d2Q+izj7O9LyCncz3VhNkcsJ0HPmD++/ISF/P?=
 =?us-ascii?Q?GLrUSNqUGbW+aaJQ+yO5jjXnwRsVHlF4RCH44hewddjVjSyNy0O3ekdXnJRB?=
 =?us-ascii?Q?8az3kKHzJ81yEgTczHlcXXiL/a5tFXlywHyYQ91NKP3Jc9AFm8ojZ3M8hTKp?=
 =?us-ascii?Q?kJ4eYLOIv02GU9xjjCEEejMCYlSvvrLckcGalnjRYrqehU6CAf2BkRmpds5C?=
 =?us-ascii?Q?4uf0ckvbHZqkX8HmXlR49uczJmrZy73ahtVqIKdq9Vxwb08YP7HxZlLK0GmW?=
 =?us-ascii?Q?Us0tIFjC7cBi6+UFovAMzzhOnqzV6jM6e0XiFTaBpriejyd0fw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 10:15:45.1560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5325866b-a194-4fd7-9802-08dcfe4bfa22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9060
Message-ID-Hash: RCITTOMLPLCTPOAPYS5AU3SRLX75JGXI
X-Message-ID-Hash: RCITTOMLPLCTPOAPYS5AU3SRLX75JGXI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCITTOMLPLCTPOAPYS5AU3SRLX75JGXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DMA ch status register offset change in acp7.0 platform

Incorrect DMA channel status register offset check lead to
firmware boot failure.

[   14.432497] snd_sof_amd_acp70 0000:c4:00.5: ------------[ DSP dump start ]------------
[   14.432533] snd_sof_amd_acp70 0000:c4:00.5: Firmware boot failure due to timeout
[   14.432549] snd_sof_amd_acp70 0000:c4:00.5: fw_state: SOF_FW_BOOT_IN_PROGRESS (3)
[   14.432610] snd_sof_amd_acp70 0000:c4:00.5: invalid header size 0x71c41000. FW oops is bogus
[   14.432626] snd_sof_amd_acp70 0000:c4:00.5: unexpected fault 0x71c40000 trace 0x71c40000
[   14.432642] snd_sof_amd_acp70 0000:c4:00.5: ------------[ DSP dump end ]------------
[   14.432657] snd_sof_amd_acp70 0000:c4:00.5: error: failed to boot DSP firmware -5
[   14.432672] snd_sof_amd_acp70 0000:c4:00.5: fw_state change: 3 -> 4
[   14.433260] dmic-codec dmic-codec: ASoC: Unregistered DAI 'dmic-hifi'
[   14.433319] snd_sof_amd_acp70 0000:c4:00.5: fw_state change: 4 -> 0
[   14.433358] snd_sof_amd_acp70 0000:c4:00.5: error: sof_probe_work failed err: -5

Update correct register offset for DMA ch status register.

Fixes: bff3c2a4062d ("ASoC: SOF: amd: add support for acp7.0 based platform")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/amd/acp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index ce10d128de25..f7814dadf3ba 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -342,11 +342,19 @@ int acp_dma_status(struct acp_dev_data *adata, unsigned char ch)
 {
 	struct snd_sof_dev *sdev = adata->dev;
 	unsigned int val;
+	unsigned int acp_dma_ch_sts;
 	int ret = 0;
 
+	switch (adata->pci_rev) {
+	case ACP70_PCI_ID:
+		acp_dma_ch_sts = ACP70_DMA_CH_STS;
+		break;
+	default:
+		acp_dma_ch_sts = ACP_DMA_CH_STS;
+	}
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DMA_CNTL_0 + ch * sizeof(u32));
 	if (val & ACP_DMA_CH_RUN) {
-		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_DMA_CH_STS, val, !val,
+		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, acp_dma_ch_sts, val, !val,
 						    ACP_REG_POLL_INTERVAL,
 						    ACP_DMA_COMPLETE_TIMEOUT_US);
 		if (ret < 0)
-- 
2.39.2


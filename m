Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8519BF020
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 15:27:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EF9914EA;
	Wed,  6 Nov 2024 15:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EF9914EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730903260;
	bh=rQb/lEkyT8t2jzs+4nhQ2oQ4IlLLymf4tlCZipi0Htw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kaC6LhUKR+U8s0vnSqRL8z810lWDpC/J98gGK/n9qUWWXSvXhToR3ZA+6g0HC49kZ
	 R5xFE9Sh6S+m8MfhQR1wxWZ47jc+BykJCh+64FuYBcEgv2YLIWtACDwJY6FmvTO7KX
	 +jmqXdRkIEpL5UhSuCT0p42epGO1nx991j4eWkYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA5DCF805BB; Wed,  6 Nov 2024 15:27:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2F00F80587;
	Wed,  6 Nov 2024 15:27:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54D57F8013D; Wed,  6 Nov 2024 15:27:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3381EF800C8;
	Wed,  6 Nov 2024 15:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3381EF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pQUBh47+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVjRN7csm08ZGhq8tWWyD0MqQGUKOdhYnqVJfhyrNQElHz8O5u4W3Cjj1edi8CLVlSxz6Aq4A3W2C8FHLjE3gQczxU6nlOCxjUG7o6dEqKm4JKf/Jt7QxDmU2z2aMOt+5BFh7B8aja3We5Jaat5tW+c7ziR1/exUGvD9NjMY1NZCxpRytOvs53/8YBV9jPtY45G5Bo00hIVfFwmLOAkp0wxrciq6T7cUJo2P1O/3LECqKz7sR6DRfxvYhZyQli3huTlIQ9wBP+CcwQ0CaoJkxucysYMgs9Va3OxouQPos7xvjw2nRYSFfmKRNmN8zTOjPFAOxx5n051BMf9rQ+arjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0j1MYDaMi27ZIf/xv0npjukaGFPibNi1rznTQeBNTIM=;
 b=hNg00MB/SkObKeukMdvSWepsnIw/rYW1SfyA5Q/GtfUU+zmHUKFNxqfBv9u5EJuCAmQkPtDa/mGyOGqWbzurzcKCPZK4af87mbtudYKKc9+cMFoCmVOx92EnpQf1ezzozczsBuANUhw4WM7xDSfYeYxkXlXrCVIWS68TV3C8cAt9yXiuuNe8bBGeaMLO6pksfrcZVrmT7XsNPxJB6Y1Uo9JlL/igDUS5d5Eq555lHqEx7yHN3xA2D/DNFVU6jYUxiEM3KODZhDv+vwK0PNsNCVS8VGiirO9rbY9XuxtB73VKH2yj/VRgGF03zN8bZniHF4nUdn8logeB+AoPHFrNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0j1MYDaMi27ZIf/xv0npjukaGFPibNi1rznTQeBNTIM=;
 b=pQUBh47+xytYPoEJmalkdLa3/WdLDFFXy65FkouOSPIzZyE3LqAjku+tcb8U1n3UI17HmXae0EPTdrpK93tQxmXUey5SDz6uRmAYtXWjulPBwzY4FqqXarT/qwLGgifgKg2do439gdY1fhONvNEecR5Q40rZRVjY8xF/ql2CHvs=
Received: from DM6PR11CA0048.namprd11.prod.outlook.com (2603:10b6:5:14c::25)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 14:27:05 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:14c:cafe::8c) by DM6PR11CA0048.outlook.office365.com
 (2603:10b6:5:14c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Wed, 6 Nov 2024 14:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 14:27:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 08:27:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 08:27:04 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 08:26:59 -0600
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
Subject: [PATCH v2] ASoC: SOF: amd: Fix for incorrect DMA ch status register
 offset
Date: Wed, 6 Nov 2024 19:56:57 +0530
Message-ID: <20241106142658.1240929-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e7a817-8246-4ec4-f010-08dcfe6f16ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dfKchqcFEVjFCIhBWZvAxe/eqny0KTwre0pOXtYmB/J5YmQJfdd0g1c0uft8?=
 =?us-ascii?Q?faOK+rFMXTQN5GK7FXwEJrODwxkTGBdgrYEt5453sLC+shOhsKvnyV8uoIqc?=
 =?us-ascii?Q?/26oYCMp5wtcVHxKNNjK9sVsLw2PdnMoruWxkOkhZJ0xRbF0aKhifW32TDCC?=
 =?us-ascii?Q?G4pKFbjPwvFQvRLEbRWaodGuA1K8D7L+BCIgxxtAJ8mtNZqfI9oGUsbCRJWn?=
 =?us-ascii?Q?u7H2jeCWfpJ+ls8iog/Odgn7F9yVXXRTDCd4OJLJHmJnFl4BWhETrEFC1iBP?=
 =?us-ascii?Q?TcKwoqohJr5y5x0GGcEYiPudRpZNVqcgSrkjznzwpdX/gmV+NwPw0Lc/hAM9?=
 =?us-ascii?Q?sJKzbsRsx6SbyoV2bcbfnrsNrX8UL9zu81nlB1Jjwba8vPnECKdfAQYSG6VS?=
 =?us-ascii?Q?ToWA/ydKn9M4arMzl4zMO0f1z9ykvtItVt8uG+eDHpBBq/AsV6QLKbZ/g/Nq?=
 =?us-ascii?Q?Srd9e7kh/L2b73i6yoqDrnlPfHYEqyOjSl84t4iARbtZR5yqbcNADPcBTqrN?=
 =?us-ascii?Q?vrwXB+tXKZzo3t4M7bn369vLIgt/NJD95IysvSmCTWp5+H2AMuLcyN57lVT0?=
 =?us-ascii?Q?OSlQhlfcP4LUNICQZh9dfHM2tJo3exlEhqlVLJbU/ahW0KiCe+Ho1fdd9H+T?=
 =?us-ascii?Q?2+Ux9z5H6uC7THAn+kW6ODBuy8QrP31wZyCOZrSUGxcnDCIXXvhgP0BORoGl?=
 =?us-ascii?Q?UPFAp33Xu0OBKVLMBqUe0aEUvYAoeSmnJaw/k16qCbIQxNCxDaqS7GY4+QF8?=
 =?us-ascii?Q?vbrjJYgT75rtxEcjkFLmBGYFryh0S30ClkXzvsyJrn6Toe2Ye6Ntkri0z+I1?=
 =?us-ascii?Q?CmmYBZUnUgRmn5TO7v2aMUCSdd9D9qwmOK9gqta+wnYhCQsmBuji000YmcMp?=
 =?us-ascii?Q?Fuj5+GUd0Ana227Yomg8FVSNn8dMEtGgZn58ZTDMyCTepXVN/+A+tRMbMeYa?=
 =?us-ascii?Q?Y7ULRnLLhojjZp92P8yl9gBqdIqzlnE9AxzdrW+gpLzJ6lL4rIjA94NbZSfW?=
 =?us-ascii?Q?DpewrlRoC4G8ZPuOZcqas9AUr5JTp6k1iRuK1MumNF//AAN/+5XeJYFcAYU0?=
 =?us-ascii?Q?NgvaYsDfoFPaHvHF8+/HxSUqECOr3ZRq/9qerOZczfo0BFP9FmL5wB/pm8w6?=
 =?us-ascii?Q?zAQjVIvIxhelxLfymBdFZ7uvNz2heYnS3G6FJ1MKR55sUkgySGzgB5YGFnbl?=
 =?us-ascii?Q?2m32OAicxSCxuJp2WHc0RdqheAWByNMgK0/AVh1QzU5xz3zewRqIX5iaFiNK?=
 =?us-ascii?Q?fsuifTclEEMIWs5bQ4MrDT3t/dFNXowT5Cg18b5kqbIq8h0nrpd0qe4/ux1y?=
 =?us-ascii?Q?ztZCEIOjL2rC4GxvuT0iF5PskwDnYj6SXHv72mVoy7iAMghQyNPsNK0Zvs7N?=
 =?us-ascii?Q?A3fjFpwd0gBVywFudAYDNUo911ykjHIp0vRwF6NVo55b7Z8OSw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:27:05.4022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e2e7a817-8246-4ec4-f010-08dcfe6f16ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143
Message-ID-Hash: IK4ACZPMFWBOXEYHVC5EEVFDVXDHYTVH
X-Message-ID-Hash: IK4ACZPMFWBOXEYHVC5EEVFDVXDHYTVH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IK4ACZPMFWBOXEYHVC5EEVFDVXDHYTVH/>
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

Fixes: 490be7ba2a01 ("ASoC: SOF: amd: add support for acp7.0 based platform")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/amd/acp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index de3001f5b9bb..95d4762c9d93 100644
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


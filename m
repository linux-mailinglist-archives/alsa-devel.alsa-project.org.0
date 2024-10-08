Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018839943DE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 11:15:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B3DC84A;
	Tue,  8 Oct 2024 11:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B3DC84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728378902;
	bh=QvG5+r9eSiVTbOEVFY6pDQBB1C6tpRemaoO9zdM6KVQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RYFa3UlPQufCzkhvxMwOE+PahoAAwoCFd7VqzLaIeHzJR7I19al4zUb3zRl1mQQOK
	 mELnA2Ggp2nzaHH4CHTbJICJ2cjPaeOyeB6Zia+7qFNuDozKJFAwj4JY8PM3xJB9kw
	 JrYsLxW72pyOQm6vEHUDvbW/i6yvLXceuNt+0UA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6C70F805F4; Tue,  8 Oct 2024 11:14:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE321F805E6;
	Tue,  8 Oct 2024 11:14:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F703F805D3; Tue,  8 Oct 2024 11:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90013F80104;
	Tue,  8 Oct 2024 11:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90013F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Ix+873GI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFb3y5FxHPkM9A4nZxGHEXvV+POBIFpN5z1Pnu3OVud5Pl5z5iCp4A+g6uYoNYbFQ9k3rcEwrTyToseMY5++jEZG+c4jPwDj9W/dyG7dz2QXnfkNNwoMsGCuLJIxUP5KJpBhQHpGChSujrkvn3P4xPYUcfZPhZS/FIVSocgrZy0eAzIqz/S/a6fvQ1keAzv8z0FmHRIkOLEngTyCAHxwrFdelF6GutEsCvazln+lbk+TBARbFHUEGBgs/Sxtv4PpUDUIPrkEJXUGqmCjhBcnF0KrcZ2iN+Dv4sXLcFGECIrk7Jzj5jqjiEuUdyYDmoFD2E0XpvWy25ktIz+G+iFshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xno093WOtphFC3g8IBRpej/BGbPTEmoOWEqMGFOX6u4=;
 b=mfopqvhvXaMu9mFQ1pzSXJA34twoLe5E2WcIcy6SxEnJhHd/azR6vqfwJ2JAF5XU2V0AHyIpawJNmgL0gdh52JxWG5RHHAOUgpvO3Vu3Y2pzMoMfMJakli//mtP70DXvU4TXJO+mMuszXjL4CHQgZzhncAdZOE4nssb2URh1IaLz0jVrw53Xp9phK8W6FJH7kZVNxXfXJ8OjYy6xmjKTtXbamm+Q7JSr4KZF2iu2GbDR40g37Y9ZfQAw2jmES3kD5gQRVqzOhvZ9+YSEsnwmkg4T56nrPlN4Fcc55cPJwDGpo9RyA/A5PJDsMmHieM5YjYl32JAeK0UEnDaL+j6TJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xno093WOtphFC3g8IBRpej/BGbPTEmoOWEqMGFOX6u4=;
 b=Ix+873GIC71AhjDg541x+8Uh6tNdEzOi8eHUoGtq+YMGT8ejGf7IMQ8iCyJzApjj3Xd5WxRHEVf2p2DCqQcg9wkgS6+p6J4YOKntvR/yyAckAZuMwX2q3FvgTASsRReGPTXFTDG8NqO5pybpS7N5e/idmaU+55u+8v9iJbECRVo=
Received: from MN2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:208:1a0::17)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 09:14:02 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::6b) by MN2PR07CA0007.outlook.office365.com
 (2603:10b6:208:1a0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 09:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 09:14:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 04:14:00 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 04:13:55 -0500
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
	<cristian.ciocaltea@collabora.com>, "moderated list:SOUND - SOUND OPEN
 FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: SOF: amd: Fix for ACP SRAM addr for acp7.0 platform
Date: Tue, 8 Oct 2024 14:43:45 +0530
Message-ID: <20241008091347.594378-2-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241008091347.594378-1-venkataprasad.potturu@amd.com>
References: <20241008091347.594378-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc51081-45fb-4b68-9800-08dce7798d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zc9Plh7k6id1L6sgfmH2fwWhV4fBJikLvEazE5JSyTpHUVSDT+1zHjYNjrYc?=
 =?us-ascii?Q?wX8ZqdSQOgalp4Ip/HR1MAjTXQvUNMXQus33r2ficlENR+0+oIX9CMXD8U1G?=
 =?us-ascii?Q?R3iBIO7VZexVGGbjH9KOeWUDAydqPNucsNIkyP4jAfh6Nkwp2tnTa+rZPrwe?=
 =?us-ascii?Q?Ph7/9qhM4gLBRGRkiD977PPdxHDKkyCa2Yudj53z2bGFHwXq4uFqjTppNwRi?=
 =?us-ascii?Q?VAJwm1A1aK9l5YINc7beDeA7rhgx19ckFaEB115UeavQgNMZ0v+zHbDiwlyT?=
 =?us-ascii?Q?NnknN+Sp0GnhuQt97Iv9aCWnQjVdjPuPjgwUJzzcQDMtDV0NNDDOAF8wbPdK?=
 =?us-ascii?Q?IFf+5Kk0/bhl6GizWWfHbhpV/5pOPhzxSOO4y0R/AvAMTa8B3oQbsnLBOorV?=
 =?us-ascii?Q?B2wVYgERl9mo+dtplSELaPFNlBqjrXEmWM9Ej/XMSGOyzlQnbdCChwlJ9Eoa?=
 =?us-ascii?Q?bRgCqaKxWslwX6nfrddf0ugCX/aYXUVkgsvWHSuEcgn1xm2RF9Yx20xfMuuB?=
 =?us-ascii?Q?cCig0Xah+ThXPYX+nDf2B1Nk/XZQ3uXHszIrZqXpBYiDAcRM+dGDzIxzElDc?=
 =?us-ascii?Q?RNZrPsCHNkXjfCMyJiXkNy6aui9faFkewIxM+vSdGojpy6cbqovGGWJKMzWV?=
 =?us-ascii?Q?fVYSaRDMcmuc329VQuVrJ/myrtWAACaPa/MVT+MZILXRPrCH4u6uM88h5IoN?=
 =?us-ascii?Q?Y5o/pdVS8KK0+y5c1Bw89oMlSVwlT5b5sLTQe4JTqqs/s4YRaem8eWEjxdxd?=
 =?us-ascii?Q?9FR1H1TSnnoQnu/pWuWOXITD66B0gTmrvMQKEluzv8rrmjQNABswfWdCc0V+?=
 =?us-ascii?Q?B5jOKFkOsgrYwwZ5s+fJnLfri1icql/PmkveSicXyODNKyq6CsvLn8BKizLB?=
 =?us-ascii?Q?npC+uBL3uWqCuC2s9sPAgwUk/NYqmXx1yk3VY61msYeGz03vuGsdHFFIq9EZ?=
 =?us-ascii?Q?2nW5dn+DBDmwApFoUkw/AlbYVkgpFHq8BHH/Fxp0lQjALIRA1DAefLFlcGat?=
 =?us-ascii?Q?5NeeUQ/J1Qs6C8Jxb0FXdi1ibNWtLvBYuLHd3e4ZFWScSqcxPB07WShXzhqw?=
 =?us-ascii?Q?CsFeyOmfvKmRcC1L5bLnkAhvfOaQIJ5sWT9XNtMLFklUh/n0QWfTQl+wDCA5?=
 =?us-ascii?Q?920QpDx4hoTs4aNbaHK6XcycqxBO0glK2PJL9m0W1jhwjsaeemJdvWprCaYj?=
 =?us-ascii?Q?iSMMAgnAwsOPMMATT4pQiYz7QSL2Ao/xNmILaPeblzQPtSI4qIUJ4NwNnEAy?=
 =?us-ascii?Q?wgxQwdvopz8ztxY9zZoxHlsMXL3YTCoMp/4Q3wzZuKyzsLnoMDn484wzz9AB?=
 =?us-ascii?Q?CQpLXVrlFcHQcMHXO5QKw1i/QaNXdjt3KxWqc+oHjwqY6pQwoZ3l+857O+W6?=
 =?us-ascii?Q?weGTsMmdAsePMFjl3C+T1vg2aIOl?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 09:14:02.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cdc51081-45fb-4b68-9800-08dce7798d5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763
Message-ID-Hash: T63VHTFC42QIR4KDHFVCAZ77ZQ5LQIDV
X-Message-ID-Hash: T63VHTFC42QIR4KDHFVCAZ77ZQ5LQIDV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T63VHTFC42QIR4KDHFVCAZ77ZQ5LQIDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Incorrect SRAM base addr for acp7.0 platform results firmware boot
failure.
Add condition check to support SRAM addr for various platforms.

Fixes: 145d7e5ae8f4 ("ASoC: SOF: amd: add option to use sram for data bin loading")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/amd/acp-loader.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
index 9489c7f5c4e6..3a532d69566e 100644
--- a/sound/soc/sof/amd/acp-loader.c
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -206,7 +206,10 @@ int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 		configure_pte_for_fw_loading(FW_SRAM_DATA_BIN, ACP_SRAM_PAGE_COUNT, adata);
 		src_addr = ACP_SYSTEM_MEMORY_WINDOW + ACP_DEFAULT_SRAM_LENGTH +
 			   (page_count * ACP_PAGE_SIZE);
-		dest_addr = ACP_SRAM_BASE_ADDRESS;
+		if (adata->pci_rev > ACP63_PCI_ID)
+			dest_addr = ACP7X_SRAM_BASE_ADDRESS;
+		else
+			dest_addr = ACP_SRAM_BASE_ADDRESS;
 
 		ret = configure_and_run_dma(adata, src_addr, dest_addr,
 					    adata->fw_sram_data_bin_size);
-- 
2.39.2


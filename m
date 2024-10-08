Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 509BF9943DA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 11:14:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B946682C;
	Tue,  8 Oct 2024 11:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B946682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728378881;
	bh=Y4415IW4b47NOHa94W5QgQujaXNkCHHhhhHysWGYUSg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KO3as6HKA57p0v1NM5R8UaucRIvXTuRXyzjkg92mRsXy+qyGOKshmpd61tWx42aa5
	 PIe7QHM4O3tbiKrBmVaIFaekHf8qXy2g07QtcZL/82onXiMrMVBQtoOEqVbfG6kJ+I
	 x5oLtaf6vyJXGfH0N5ezCieL7I1STB5Ma/OMNyo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88D0AF8001E; Tue,  8 Oct 2024 11:14:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C19A9F805B2;
	Tue,  8 Oct 2024 11:14:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB23CF80528; Tue,  8 Oct 2024 11:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C3F0F8001E;
	Tue,  8 Oct 2024 11:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C3F0F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fTvZpkPF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4K6CDSzTr5aR9eWtOKNGeubKx6epZ9USBmZXNuXe9lIbDdtZ1lhJz639JXNIo+4JCdqS+8V+v9wIkKfI91bU+xinr/9yYWNYppHv+hHrdCpWeBsYJIVis/MvSQKpojzkSdkFYxywNUbJGfUoZntDLXuAEP8RcanT9PF1IRUOUFvuEqbh5ln1Yw5EolM/D/wqlGA45QO5tUh/w6LKLy6GnDc4RJDla/73bf3GUSaQl9M7Co7XfwPy54Hdp/Su/8AslkETViCl8rn99LSVSv/MB/Cl9rBricKaoC/qk05V5C+IUcQQHCS9dn9HnG5JBDSU8b+4H78MxoAc7sdmRKnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btev7VOB2+6dFD2GdLn1YhVxSRoYERr9HQMuDPaEmQA=;
 b=NzbHYCrId/oYmCfZA7KZQ5WtQbA3T6OV6m8/ZNIjtS48tAKf23F8yWhc4VkIWBMaFMFckVVfmunPv477hmMSQwE5y0FC/5X9YWRSplPo4qZFBx2qy7AWvMuNUE3Je+xeKUYSHNMDNB/bzXSRQ8ThplcQdoIsdrLfrYuRlwsz/niThHybHB0ejCcMx9gtfgEldlSTsXwreq8oyASD98g5mb6rqy708763m7G+PDML95tT8r2yDROEp382iG+RPXVIgZD273E82109OXjViaExXp2wKlHObC2tj4PdM10oPrSCKcgtpfIUJ7nZM1EwlM7t7e7DkkpoLb1W9TyNZN12xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btev7VOB2+6dFD2GdLn1YhVxSRoYERr9HQMuDPaEmQA=;
 b=fTvZpkPFIp02Tp/YBYtNklDQV9qMtQRaiCDlNfWYUo8S+tP6iEHjy8osht2uoj3Ov7uHykJRaeIp3Cj2AEDiuwREvrjp9QPLQ0BtgmzQEiPQcToNdDq6ycp7U0dLgBqTxvsgZ2BylxqYnP8DN4eVunBc26Uw0e+JH7PPFAeR5Mk=
Received: from PH7P221CA0081.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::33)
 by SA0PR12MB7477.namprd12.prod.outlook.com (2603:10b6:806:24b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 09:13:56 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::cb) by PH7P221CA0081.outlook.office365.com
 (2603:10b6:510:328::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 09:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 09:13:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 04:13:53 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 04:13:48 -0500
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
Subject: [PATCH 1/2] ASoC: SOF: amd: Add error log for DSP firmware validation
 failure
Date: Tue, 8 Oct 2024 14:43:44 +0530
Message-ID: <20241008091347.594378-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SA0PR12MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 150a4e59-fcfa-4d5a-c477-08dce7798954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bKe4e3HeRGUf1BXwHaqwGfyL6zEiz1a2Hzk/zY19QO3Fv+qb4AgvXUvxZ4Ic?=
 =?us-ascii?Q?jdUkNsRRJPF3T1mPkmPHGE4x26fCrMToKkjMZ3oJJFk73rl8k28TjywJ0PBH?=
 =?us-ascii?Q?s26upVUCR/oDdzhUmqtYOUURG6A+anliHNxeg/Lkj2CjuJicv7HHaGlDbFfK?=
 =?us-ascii?Q?KWZOFy2dRP+48x7HOlYfstzF6IqmNjND60n8KLm1K3Mknn+7xClCNZa+D4db?=
 =?us-ascii?Q?74tbZURnTd6dgFkSeEnzcYGBlsPzNSDupL6FI4pJKZCTEiq/v9IMtDWE2AFj?=
 =?us-ascii?Q?9w8EZO+4ZeRcc9ioH3YDEIKgeznnNNRWie/Un01B5YDsDc9nCnQmaVAJZjoD?=
 =?us-ascii?Q?d6GXTS7f46SJc1KOTxXG36cJUqu5bQ02z6JdALuCoFNcF2USMilHDGjrg8zs?=
 =?us-ascii?Q?726fdbdVbaIM0Ho11juZw5UsG5qPtGM9nz8gJaLPvUdYlgDDrfU6a3ioTLZs?=
 =?us-ascii?Q?mhktysemupmsLZW3mtKV7ciIqS3/7C5WlM2V7ELN9EbEN5smDRHys3UxgrV7?=
 =?us-ascii?Q?TP/ZGjqZQdIMZWp6ggH5YuP4oswisxrfnUYWMw9EITQTsyAlO0WHDoceMGJL?=
 =?us-ascii?Q?ddZyN1P/Z/JbliiiYYv2UjgTyIoKQn2HAg+HY3LqyBOpBiEBQyf/ymbFB0Pr?=
 =?us-ascii?Q?bZ+XNHp7FDD3OD0vpjuQBPyvuOllXvcdVFHlngR9x2a9rtZlJcjQSgPM3i7Z?=
 =?us-ascii?Q?SagOMX5yGL0r/O1BiYppzlz607uM99rIXsq0mLRek8bwLDyGYrtAvoJetjP6?=
 =?us-ascii?Q?Iknj7tMMeo/H1dUGwR3ZPhz8jdztJuqgsbkXXyw53hF7mu0nvHXfOv5MZ0wU?=
 =?us-ascii?Q?KGUVXCOghwiddoxAt1kMRftjLocKHt4yFc7A+ifQWTf5i2CWuQa1GXAoWNdo?=
 =?us-ascii?Q?X53g87ZUz+k18tkW4lSVxs5vTCiYkLBRTrRJDhjT+r0FDEibZU0wcGIYCj9A?=
 =?us-ascii?Q?LaPZvKDV4XdbH/BEjzY4fky3BPXPxzZEPchwW02Kk9VXRWCVfAqT+abTENP3?=
 =?us-ascii?Q?FdJ2rr0xRslnjXRmi8qnKtyHDa4WXiuzWj2zpbSCXL+NtBUxbt/8uoD/wFcx?=
 =?us-ascii?Q?HR6/kmZcUzJb8uTfNZReLhvY/7QljHvxLfYV/KMchRGw9aacAKYjMNn0Yxqm?=
 =?us-ascii?Q?zqpbAuFjr0gVivuBK8vM2GeAPgpN6wszcr4IfevV9T0SMOxg+bJt1I+tqxxK?=
 =?us-ascii?Q?muNJVAph47VgMhD/tnzGPFaLNdlwWSid2qYdD8I59QwxbH0VMuF+Zj/4eDUu?=
 =?us-ascii?Q?nrs8Bxaf/8TtViOp0IEVQThH45vHzZ+BTYBHJtDP/9kiH5qhQixEv/KThkCh?=
 =?us-ascii?Q?SB2hxmC1Ny9x6UKMXN5bWYLaVltBRzmkEtaHhF9g4VWejkl74fFyZwhyoFkJ?=
 =?us-ascii?Q?DObBlxAIlynjq9jdv0W4wEyiB5Jg?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 09:13:55.8829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 150a4e59-fcfa-4d5a-c477-08dce7798954
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7477
Message-ID-Hash: VLLSYNVYX673YGWSHZJHEDEQMZ3C55Q3
X-Message-ID-Hash: VLLSYNVYX673YGWSHZJHEDEQMZ3C55Q3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLLSYNVYX673YGWSHZJHEDEQMZ3C55Q3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add dev_err to print ACP_SHA_DSP_FW_QUALIFIER and ACP_SHA_PSP_ACK
register values for PSP firmware validation failure case.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/amd/acp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index d579c3849392..de3001f5b9bb 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -329,7 +329,9 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 					    fw_qualifier, fw_qualifier & DSP_FW_RUN_ENABLE,
 					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
 	if (ret < 0) {
-		dev_err(sdev->dev, "PSP validation failed\n");
+		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_PSP_ACK);
+		dev_err(sdev->dev, "PSP validation failed: fw_qualifier = %#x, ACP_SHA_PSP_ACK = %#x\n",
+			fw_qualifier, val);
 		return ret;
 	}
 
-- 
2.39.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB4950360
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 13:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5460922C8;
	Tue, 13 Aug 2024 13:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5460922C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723547568;
	bh=eiL6s26raOgfrD1L3K1rHWY9zGMgZlq4g3aOws5bu58=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aRpnXS130mtOWFHpWnsUY3MprITWsxPhAV9svSDAcMSB+iqL540u1ngq7lZUmp8rv
	 9nwaJ1ytv/BEzXQEpSiyMPcssJh8yYFyd48ikpz1xjDriu8dcYRgYIQbYVxtsFfoU5
	 RhL6zCu5ZXw8canF06lLRlKE06nGPExi/NtUb9DE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D814EF800BF; Tue, 13 Aug 2024 13:11:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E62DF805E1;
	Tue, 13 Aug 2024 13:11:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33BD5F800B0; Tue, 13 Aug 2024 13:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70AA9F800B0;
	Tue, 13 Aug 2024 13:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70AA9F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=U55C6sk/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qH+JXHZ2m4AhpM+squrb+c6pFZhkGDmilqAiSt1JMS8y+5m5Cfh105hXzYCk5RYVt5ystINTtOtADTe5hhOV2pV0NWqLprSUOqEG5kNqZKYfFB10pQnifxKONHHLFQX+obBfRS9uzFOEXnp5j5l0FheH5fY1EYpCSZcsPhan7G0QDXWSlDE5fSakpSRSgCp7FfiNRGmNfHnc21UUlh373tA9vVCKzmatBsQxSPuscdyrIbxkAj3Wree17k2l1QR5iTid0YX+PATqHHTdOnluR7vZ6W9Z/aDTolRkE0JQQc2LNp34LvaK0dDksv+OSSXnc5SR5wx7jGgmAGSHDWcm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyKANzPYvNrLaSOvs3T932HMKi61kHkK49likocuQ2E=;
 b=cUxw4p7Nm1Jh1riCHMBH3wbHeEnWR6axuoE2uoZsqcQ6gX6rYmf2LqJvENKJSGTBVe0cXD4JlFgef2I44mQhFpPFFldziNcSFK47DxmnQsPu/9ZZtgzp7wAjngojkcZsLs0msTUJVcEDb4mxcRfK/S4rx34e3cpcIcADyWxHZh7afoIPMww38/v+Psxkpfhzh1GNE+qVE/y5NEtZzl9gVe2Y9ZHUcB1tigZXqrjW2AE8r2/fsqiwzr4j0RWvMeM5f2R9mda16jt3nOR+peutAvvcgX3A9D98gVwyw99lrVv0YKFlZJNtDAZh7nt8OAvWgCaKdRPjvLG+rZNoUVm4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyKANzPYvNrLaSOvs3T932HMKi61kHkK49likocuQ2E=;
 b=U55C6sk/9ktoSm4NciCN5zX/Az9YsctGgmFhu3c5OfIT0jXwKLtcAO5f30XGkqoL8VHFRYviAM3oOVPT085KPUW9P7mFv+gooLIbq2EkUf/v8lCrMa+zFrcQPNCcaZwTCdbb+YbOsB6km3+Dy9y7we4jtiYP/BvxwYnemTmIxKA=
Received: from SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 11:00:22 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::8b) by SJ0PR03CA0065.outlook.office365.com
 (2603:10b6:a03:331::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Tue, 13 Aug 2024 11:00:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 13 Aug 2024 11:00:22 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 06:00:16 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>,
	<pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<cristian.ciocaltea@collabora.com>, <Markus.Elfring@web.de>,
	<sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 1/2] ASoC: SOF: amd: move iram-dram fence register
 programming sequence
Date: Tue, 13 Aug 2024 16:29:43 +0530
Message-ID: <20240813105944.3126903-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: 8829dd5c-66f8-4baa-2528-08dcbb8720aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AUtM4IUZupazWFPGa9d7W1YHFtREpwyQnMfsiADF73F+y2UkwrxyImfDTZEJ?=
 =?us-ascii?Q?vpnnzkGlyrweXl2w7N3QlF+Bvi56KdkfXW9VHeK4y7c3cosUdHrJH4g7JsZg?=
 =?us-ascii?Q?ukqV/8yZocCnFVFSlfcfbIJBcyO3FpeJHBynK/CCg41uHTRhlzFoHEakRyjG?=
 =?us-ascii?Q?pBdA20HxlPBfyu1okWEdr6r+Eak0IkiTzilEg8CRNJLqzxQBn46Fl8IVbN/f?=
 =?us-ascii?Q?l9Ls690MMMcMK3PmzF0xq2qGqQI7yIQsOaiWYlSTNlEa2dIYZ517/OgMvA2F?=
 =?us-ascii?Q?UZPsa0+L5UKuJ8/ZQXATTClyQnok5TeppQZxtOow4PdprXJZi3WjAiiCG/PA?=
 =?us-ascii?Q?gB0CY7U/3Hb7kyXFzrs2CdVJE0t2bEejusDrtlfbPd7kQ5HJsvknzhAPnKL4?=
 =?us-ascii?Q?cVmUWBXb1XzWk7zyZPob3b4JKhrFhwEPIBd/sN4552baSNb2ovXKkJ6mxM4c?=
 =?us-ascii?Q?cPgN0efFIzo878snMUXho2ycYWCZfPtaPGcrD0BgrorgyIeTwaGDM6+R64Dq?=
 =?us-ascii?Q?npRY0kQ54ZK6+NkivzKLxtVp5gnumK8l1Bb8Hga3TcNo/pB0TJVAPzyw45fr?=
 =?us-ascii?Q?lT5825XXDnaCnhncqyKDSRJiEfBXRz20u6wt/XL+iIJpMfiEMxhNTi/eD4YE?=
 =?us-ascii?Q?DbVKd6o0e32WPvwHafb6m8+JH8HpOpPFmYV9J5B2dMwstggRrvx3A+Y6UDVq?=
 =?us-ascii?Q?QRSHmIBXHnOPDooLBZ0+5HpsQ8Knp6oJCKqDRqGhUwxzKhmO8o3/zGoSY+oY?=
 =?us-ascii?Q?x/OyGvGF8ImrW3fX6S8UuJn5BHcY7aHMkfsUC9q9xV9pDb8OoWHixvn1aVum?=
 =?us-ascii?Q?KsD0Ve/5gTjsSVFRDz+N4nRBhWs2WCZ4NRXUi85kbib24KyGZTcTpPJ+YPCG?=
 =?us-ascii?Q?yOT3tUCj7ea/h3nA3R4yzPIjTOs6y+RN2FB04fn7gaQg0pzjgTGDh58ME/gw?=
 =?us-ascii?Q?UVwpmOvIFRgXQoGoNvs3m06Wxdiy3CFRfFsNrOqW0Fur/9+wpdnzmKvfVU29?=
 =?us-ascii?Q?YEEsbRuzR62XsctrZVjw6GJxPGUJr0KzLaf5YTZV2Ey1tWbJwaYUd6j7yOic?=
 =?us-ascii?Q?RnVpSE0kLXk/3qLXfjxZPCpQxzxXDGPABQZZ/PJCzq8uXQRFCgbxC/gqtP4q?=
 =?us-ascii?Q?yyl3oAPZmDou3Zd3hXgC5UOikp1nH9c9/VRyIiknrUbim+6/mj10oT/I3prb?=
 =?us-ascii?Q?97ExgjXnqo0wxTYVTilQTXKEB5mmBzj3wdDu7rrJVq39NerC7svK+CW/hHPE?=
 =?us-ascii?Q?fZjm4YusjO4ABy2vYksYRyTssuleIikJACHbhuWJ0wtrN7fkmxtkOc/doveg?=
 =?us-ascii?Q?1xtrgj6mY1YVjovlkR0+C1eb9+tITrHm/0o+ZyewteC8eWpYWWFuVOhkSo3o?=
 =?us-ascii?Q?D4mIG59SNxRYgcf1DHmV0Ye0Y0pSGglGdDhufEzjWKNGQuuyP6cOufZCO/0s?=
 =?us-ascii?Q?Lhm1vkutwjBMm++ayVqDhtMR7CS2rkdK?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 11:00:22.1205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8829dd5c-66f8-4baa-2528-08dcbb8720aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148
Message-ID-Hash: 4FLKJ4INV4ITL2OWVAV3NCHQ3GFBWQKF
X-Message-ID-Hash: 4FLKJ4INV4ITL2OWVAV3NCHQ3GFBWQKF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4FLKJ4INV4ITL2OWVAV3NCHQ3GFBWQKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code modifies IRAM and DRAM size after sha dma start for
vangogh platform. The problem with this sequence is that it might cause
sha dma failure when firmware code binary size is greater than the default
IRAM size. To fix this issue, Move the iram-dram fence register sequence
prior to sha dma start.

Fixes: 094d11768f74 ("ASoC: SOF: amd: Skip IRAM/DRAM size modification for Steam Deck OLED")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
changes since v1:
	- Rephrase commit description

 sound/soc/sof/amd/acp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 7b122656efd1..b8d4f986f89d 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -263,6 +263,17 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_STRT_ADDR, start_addr);
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_DESTINATION_ADDR, dest_addr);
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_MSG_LENGTH, image_length);
+
+	/* psp_send_cmd only required for vangogh platform (rev - 5) */
+	if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
+		/* Modify IRAM and DRAM size */
+		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | IRAM_DRAM_FENCE_2);
+		if (ret)
+			return ret;
+		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | MBOX_ISREADY_FLAG);
+		if (ret)
+			return ret;
+	}
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RUN);
 
 	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_TRANSFER_BYTE_CNT,
@@ -280,17 +291,6 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 			return ret;
 	}
 
-	/* psp_send_cmd only required for vangogh platform (rev - 5) */
-	if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
-		/* Modify IRAM and DRAM size */
-		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | IRAM_DRAM_FENCE_2);
-		if (ret)
-			return ret;
-		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | MBOX_ISREADY_FLAG);
-		if (ret)
-			return ret;
-	}
-
 	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER,
 					    fw_qualifier, fw_qualifier & DSP_FW_RUN_ENABLE,
 					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
-- 
2.34.1


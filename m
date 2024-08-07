Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5891949F13
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F246514F7;
	Wed,  7 Aug 2024 07:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F246514F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008052;
	bh=3Dcu6aJU8X/aJgTk736SCzyefoHjdCUG7aL9wcxERrk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KFrvmgKt+5Vls7J4K4kDO862xX5sbHiEQ3HnrvO77a4PdMrIZ0DKexrEEa+Z7rrkb
	 yI/3gpzQM88yuYSDY0w+A15mptDHLonjFaRHxDDrtEa+djUFz+cMiwaAQBVxxYwll9
	 VVz32YJTymU8kW40438WQx27GC2YrAwEkGG3kELM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8BCBF8060F; Wed,  7 Aug 2024 07:19:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 523C4F80606;
	Wed,  7 Aug 2024 07:19:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD465F8049C; Wed,  7 Aug 2024 07:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAA93F8023A;
	Wed,  7 Aug 2024 07:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA93F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=iun5F19I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmI+WRKu4JH6uZ7+c5aRR5bbbhRZ6H+sFyQ7FcpzvLWp21XQjhxRxS7uVbaDs8DY4TLHkMvOwiqYp/7kR9/JhgvlPbq+ZIkXWqvAGwSdPmLSGn3St8bQALF2LZzCmCJAisvoD7NTWDOCOQzhrV4MlS5IS3KuqVfqTW13XtqXHYRup+L+IUeAGfzTrK0bAPYL5rU5vTdkisf/h2X3JMr9/QsysKJRhfRqryyLprJCgun1tWcY/aBZpH8Hd4W/SzYEJphl/pmgRRDWrfGeG7FBBHRO1kreE+SV/SZpZhv/Prk8flqRs9YEV9uMVv1nvv1gP43C0XuCkf/yDMw7N37u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2KCJG/+YUEu+WHixSrZZlPKZxJ6pb4opybJ0tKtTd4=;
 b=RhNkzm7xiNrD/JjBtForyZzyCEzeR7+vZq4OZ+i4YhX4FQRcpkgZIF/6o1kt2jL9ZwDkG5iibc/n4i0DWnKc4WrjbEWjKcad3WHKUeZzbcxgzp4RQHX+SGp60PvyoIO3ha5nVOU5K6UWmm0exxk2ggSiwRvrhVVctZWjVNrH///das5wpF0fuaAnefJWL8LTKSEiEKvGvr/zSFXMu+SVQRI1WN2zPAbACGR2Jzv9j85MOskHDSMMfhKKAPnvMrQkzysm5yIcVggLzYqQvN+IxXU3PZl/gslSmiKImUGrKRHWAk9g/ZEG1cINGm4/SAPhMCRwOcDIt+doSYuzL2/BOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2KCJG/+YUEu+WHixSrZZlPKZxJ6pb4opybJ0tKtTd4=;
 b=iun5F19I2IpPZ2H7vaHHem3gZullLn/6uDH94BJl+HBwzcJsWufLBqN8o680nhwgy6lSk2VhnnjuHbJT3oJIbCW8uFYuL5RYnwdanWcrq+/rNdYWHXR1yHJARVHIoyugOAQUt/OmKuvDQ9Q6r1rNbuBcBnGREV/xlhdIaWvpFLM=
Received: from MW4PR04CA0243.namprd04.prod.outlook.com (2603:10b6:303:88::8)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 05:14:37 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::bd) by MW4PR04CA0243.outlook.office365.com
 (2603:10b6:303:88::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13 via Frontend
 Transport; Wed, 7 Aug 2024 05:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:14:35 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:14:29 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Emil Velikov
	<emil.velikov@collabora.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE
 (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/8] ASoC: SOF: amd: move iram-dram fence register programming
 sequence
Date: Wed, 7 Aug 2024 10:43:15 +0530
Message-ID: <20240807051341.1616925-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|MN0PR12MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 935c2783-930f-418e-7260-08dcb69fd462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?htsKZ1Sjff1rPqE6lW7FAiLnrXXEaK8tFND+h7t0pqK/UFZJt0Lf8JkaVZeu?=
 =?us-ascii?Q?xaAbXE7xPxGhPvPmhd913Mtg5UmqESbupQWte0RjquM/ZYqbNRxl3k0O1iZA?=
 =?us-ascii?Q?O5ikRTdM7s8MzXK0dH4mW+lQEfFD3Dayekn1o570tWtBfZW2s55XMdNBE2NT?=
 =?us-ascii?Q?YdmMKnb4TRHjYxYcX403hRxx3t0yfbXQiiCQPS1L/S7+OXwtGLI9BTj8gUFn?=
 =?us-ascii?Q?DVwtflaSwTikj2D+xdt8xohXeg6vG8K9Q8FLPVmdIMxXWh4Od5dgWXNU3m80?=
 =?us-ascii?Q?9YBb20S9SNbBGe22i7wUWxbTKPs8EZGSqT1+/lvUWUtXT2dN/fhqG0OeVF43?=
 =?us-ascii?Q?nHDsqedhFo3nM+9ZCNZJdfcj5jCs6E2F0JbAQ3HhleWbj/6Y6wtMVg/59pSN?=
 =?us-ascii?Q?NRPc01EkgjrTftcJ3HP2iATAPBfhOrGdfVpcZ+KXrQcDAjpnl4ry1eGz0z+c?=
 =?us-ascii?Q?4syUS52wyqL98s9IYd7USqP5p4U/NMdDWLcTwfde/pCKc7eRJ5EHmc/FWlGS?=
 =?us-ascii?Q?4+gzHposI0OiuCgY4WmgHp99eseqaprTPugSgC0PwNgfksECpDbGUV+ZusKw?=
 =?us-ascii?Q?Dnddr2ibsN2dFgRcKgaMrPJH5BqoeQXcfRGtN2Fu4njrBWnlRphemm7yjgkT?=
 =?us-ascii?Q?DcY+lzQ4+O0+yQC4PMvt8nre/HoC5jl/ZJ6KMHKyKtkUeQD4v3WswCzeXcAz?=
 =?us-ascii?Q?GOW63oV93GzRuz0U1/38qYgvEdqQN6rBXEW0HgdYwjG4Ai5qQKh7Kc8FYZyP?=
 =?us-ascii?Q?yF6kOwpIYAMjICJfrit3bcwAZJWeUwRlkEXKTSbcUb6K3CvUKRwB5i3ZRtEX?=
 =?us-ascii?Q?gAEJRElrNTEmONlITz5cQs7NzTNkpGy65byzQYU2xxY2UXDmOLWlY6qIvG9n?=
 =?us-ascii?Q?2MVbOM2X90YXZm1O9bx1JUXQVqBUWHxBXhH06WhpgL9B1UagbASqRMsoN68n?=
 =?us-ascii?Q?3I2WlBD7U/zLGavlFdOTgqkc52rTJEuqtcAcErCvMwXCIZlUgePvovPW3gaj?=
 =?us-ascii?Q?MRnkpyYErVZw31goaizoEo9Oqe4XXHAckWhxp5gffkTW2TQKEd3vJrvKvJlA?=
 =?us-ascii?Q?ahFYZuxVwmok2UQv6huXaD2bGT1d5+o24r5dptGmc2DKu6LbWCgTElqyj5dA?=
 =?us-ascii?Q?bo/XotRq5UtciUKVX99MHRqqUrf//N5Ob9t/RTp+sKidSW7IxEbAgzmynHA6?=
 =?us-ascii?Q?GMx/kD7/fQKtKVY+Etap6H2zymGUkSk4wZpG9A6Le9hIm+4sq8kDZIJmCk+D?=
 =?us-ascii?Q?P1p9SN5+pnZmlbWnnpnhnwkv8dRwDCQNeHGAkkxH1MTlKRc9dqXEU+m4ey19?=
 =?us-ascii?Q?EJGhzcif1ssJkAsthls6ENnXUqKcCFycXs3zwOBUe627RRnlTYyDjQP0vQNW?=
 =?us-ascii?Q?+xbSt60AsYJfQ5LGK3g2npiU3zskOsQ7IH+OcQv52RVve27vMTL58PGfITe8?=
 =?us-ascii?Q?x/HTpX6ZU/zoBrxrgzhIP6OHT+lDHvV1?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:14:35.7638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 935c2783-930f-418e-7260-08dcb69fd462
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173
Message-ID-Hash: CFUCLGTUDUGWDBMLALRHZYM7JZJZHTC6
X-Message-ID-Hash: CFUCLGTUDUGWDBMLALRHZYM7JZJZHTC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFUCLGTUDUGWDBMLALRHZYM7JZJZHTC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As per design, ACP iram-dram fence register sequence should be initiated
before triggering SHA dma. This ensures that IRAM size will programmed
correctly before initiaing SHA dma.

Fixes: 094d11768f74 ("ASoC: SOF: amd: Skip IRAM/DRAM size modification for Steam Deck OLED")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 9ce8b5ccb3d7..d0ba641ba28c 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -264,6 +264,17 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
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
@@ -281,17 +292,6 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
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


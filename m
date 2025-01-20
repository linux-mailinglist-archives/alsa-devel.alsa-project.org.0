Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC813A16A53
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:06:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360B360227;
	Mon, 20 Jan 2025 11:06:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360B360227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367585;
	bh=VWcygLyxk3dKd5f2rSPJKHmqutOXHGarh/Ucs3TexFc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aTrvrWFirRLEvaKJw9y8WQhZdcie+middqziv8+6hhNAYnrM3LetS0+EAD+1pkimc
	 Vihu1SZEcr55VCY2POb7SeIQEbbM05+QISxUTDOWyU9rp7XUXSc45R9i3bULCLJIN6
	 J50nnBFBZqVioz8tSXSOez6CSzQ/Y/ycfWvyv+9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1086BF8068C; Mon, 20 Jan 2025 11:04:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82AC7F8068D;
	Mon, 20 Jan 2025 11:04:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB590F80675; Mon, 20 Jan 2025 11:02:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8884DF80676
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8884DF80676
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=J5ZbYgOZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJFtsrQlXPazYo6jhQa4SfCTarjlSHpYvMqOAWf2DdtEtxvbOva7PoHigxi/dXefkTlS1lPuq/l2ypDAplhFuT0XymhvyFhUpafuCqcEe2VeiKJu45Ny7zQzqTADVPSr2X8NLd392EvcY46Nl0EZCQLzrWeMAK6tUulck1Bz17bI1NDxm2ekEBsGay1xiq8fwuVB1jvrWP7d1ANMtPGBXW9gK8o3brr5bpJczm03HkGem5hlrCBoRlH7fN0QYsYDTIGVKFfsbJj+kEz85MiI+TOyr0gTPgy+6AmYQ3TqeHOKsBvpO3hKraSeXoDmTPzc00IjApTsF4ycjEg7hC6Geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1TNG6cFjI8nSJJv9jCpoQmJV9lD6JqbzsO99PpApSo=;
 b=PvyYWNVRtQgP8cgJXM0bjx8y1g6O2vhYw/mxL+rcSoHby63T0nTCuhH7iHgwi7myhD4XaSnrAcsMGoP2tDenXLE0E/ghHZdTuYszrmUUbeFaWSij9/qtRFuYKmT7y0YlIYHh6Mao7nmLxvz04LK2qbuEC+6sndaYFuaqB8hK3mpkLayQ2lJk1X7vQovD1ZiWVRqaKhGDVszkL7AQ6Zg/1OQTAUd9Bf5KMfBFcUchN9TojjyXjfxwrcnfAGQUgxNzNo5wBU10pqEANtxLdEv4xOSKMq78pKCS02WpyxdCExoTIsGcatUcniVuIC8sgdraIqVfODs8+6UqSl6TZ76/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1TNG6cFjI8nSJJv9jCpoQmJV9lD6JqbzsO99PpApSo=;
 b=J5ZbYgOZG7dOr4qgUifIl6oYa/pDXU1vtg8VFT9dm/KDYM4XVxe+prYaM+XA8iSR6wFwlMHjIwI0slTLWbAcGEGw+Qs19Q2mYQF/QuRrBsNjPdPe4fX8qspE8XJw0qFjKLspAnomoytybM1589gPlThTM6DLdcWt9l2URkLCaU0=
Received: from CH0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:610:b1::17)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:02:24 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::2) by CH0PR13CA0012.outlook.office365.com
 (2603:10b6:610:b1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8 via Frontend Transport; Mon,
 20 Jan 2025 10:02:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:23 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:20 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 11/23] ASoC: amd: acp70: add soundwire dma driver dma ops
Date: Mon, 20 Jan 2025 15:31:18 +0530
Message-ID: <20250120100130.3710412-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|CH3PR12MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe3615d-99df-4964-584a-08dd39398991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XqADnNKkSbk0pEUf9Flj5+rIJTaDNhBwjONOCBMDnh/pOBJqWOCuT5UfYpL/?=
 =?us-ascii?Q?HDvCEuOXp9Hw00sxOTsBR5kNGPMo3SvD5JMWQzeSUr3EzyJxAq8Bw3SvPNI5?=
 =?us-ascii?Q?URJvSHhEGFdv3tbLbPeakOgvnpkVdiw3fpHpw21elkJlTx0gwHpLWkBmRwIT?=
 =?us-ascii?Q?nS7ic94G6caxI6CDid/fIHJW8X7/kCtHnn2Yy06/J+V6gH5XaKp5aRYMLouP?=
 =?us-ascii?Q?8COsGDEGmedjhWSpgdtInp3P0zD2sXUo7tGtMa4X9oPJAvSpl7GPah94NV+P?=
 =?us-ascii?Q?L/2F21Bd2fVuCMTR2j83HwVL4HIsDDaImYqjSVUguFL+a3yCAr9gtYVPDBOJ?=
 =?us-ascii?Q?M12YUGBfaECv1xUriw48lzcXP+TjMzJRfqk/A5LwmokPWLSiFtcy1FWGB1sy?=
 =?us-ascii?Q?2uFu6hKCMO0dB7yqGiwbKhZ/Lm1h3DUgz9q3Qa9CmdXtIWlRcjSXWRBVW5T0?=
 =?us-ascii?Q?+SK236UiVHzewFEekOvG8qLGCFEePsQr+lqXG83nVHuG+E/+siVa4t7u2nP5?=
 =?us-ascii?Q?nkWT/1nvggrnAiaaIgwgPjy5lSWSj6yhMsCft7v4o9nU3dIwkCbLPIHvh/tK?=
 =?us-ascii?Q?OZkay/EUb5EI/8B21q3prnwIOzcd6yXUviy11Wh6jyN7icHE9nCcwroqQRIg?=
 =?us-ascii?Q?BOiAYJ3Whr+PeCu8vkrbuF9lqggSxB5KJrSG8w1U8M71E1o3MIGNw1GhA6nI?=
 =?us-ascii?Q?DTEcVJeLb9m67vh/wWKrK/jIe3Wlq5GL5c+oqbXVIyjgfYsVMs6U/H7LJdMz?=
 =?us-ascii?Q?qZgiICSqTe9WgPzEk3lr1qxiUMCM1UBp5WWyxaNEvQKOyZETUHSgzrjea4ST?=
 =?us-ascii?Q?ts3kBNTMU89Ei7tSi4377c2urQDUm82RY02NXy1k5DFcjWfYh6/3tCkj8Dwt?=
 =?us-ascii?Q?ft2uVWNI7bFCmx1/j9P95q5PdFYH40ghXuKHUBX1yrVCJfwEv/0Gv9LpO3UZ?=
 =?us-ascii?Q?kuRVz3lyYqZm0RQAGSExnGeSZ5G5L6MjeYWO2RSrwzoEe7qJ+EwFh4VvODq6?=
 =?us-ascii?Q?ByDzuX6ybE3hFWmBdC3Z/nmk/vtobyI+M9ZNZUq/i6w+KBGfx/bED/lf6vKK?=
 =?us-ascii?Q?C5e0jQw0AW53GRnmSGw7ElDS31rIj/7Tfe8nIHwWkcx7cqNNMAnhygxH5y9g?=
 =?us-ascii?Q?S8N3SckfHC2d195JI4cmJs8hJFqLJs8vLCaN2OS8wqPcXGlly7wB86z3gc6X?=
 =?us-ascii?Q?M8gzRMKBBu7tw89dQbQaW1LAgM9k+fUaZh9sshsXh+stheL9MDvJYFcnTtPI?=
 =?us-ascii?Q?gkO8OYqfqpEmXMLdEdIrGHmPY2CpN94a6gNj4Is+Aek1mM+RiQSluMr3kNfH?=
 =?us-ascii?Q?YZUO7vHp/LjNnRyDtYu301ddxIjMHlJD5O3ZMWxO4P7G33DjO1qdao0N1+Y1?=
 =?us-ascii?Q?PnQ7o1wS4PJjrT0jepknObZurk73bpWnMFXk+4xBPnaXaaTqYkpoZo9SPaUF?=
 =?us-ascii?Q?7iXjapmxtoFAlthoALQiD1xwms0wL3acXKP5d2rK5FX+gaIpqCtsCpo9Ve8W?=
 =?us-ascii?Q?YH16FgcnjTWJbbU=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:23.9620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cbe3615d-99df-4964-584a-08dd39398991
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147
Message-ID-Hash: DNNIOITCBZGHIPSL4VZ2UN737VS6RVSR
X-Message-ID-Hash: DNNIOITCBZGHIPSL4VZ2UN737VS6RVSR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DNNIOITCBZGHIPSL4VZ2UN737VS6RVSR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire dma driver dma ops for ACP7.0 and ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70-sdw-dma.c | 420 ++++++++++++++++++++++++++++
 sound/soc/amd/acp70/acp70.h         | 123 ++++++++
 2 files changed, 543 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70-sdw-dma.c b/sound/soc/amd/acp70/acp70-sdw-dma.c
index 6d748b295cb0..2c01f60cf3b9 100644
--- a/sound/soc/amd/acp70/acp70-sdw-dma.c
+++ b/sound/soc/amd/acp70/acp70-sdw-dma.c
@@ -18,8 +18,428 @@
 
 #define DRV_NAME "amd_acp70_sdw_dma"
 
+static struct sdw_dma_ring_buf_reg sdw0_dma_ring_buf_reg[ACP70_SDW0_DMA_MAX_STREAMS] = {
+	{ACP_AUDIO0_TX_DMA_SIZE, ACP_AUDIO0_TX_FIFOADDR, ACP_AUDIO0_TX_FIFOSIZE,
+	 ACP_AUDIO0_TX_RINGBUFSIZE, ACP_AUDIO0_TX_RINGBUFADDR, ACP_AUDIO0_TX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO0_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO0_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO1_TX_DMA_SIZE, ACP_AUDIO1_TX_FIFOADDR, ACP_AUDIO1_TX_FIFOSIZE,
+	 ACP_AUDIO1_TX_RINGBUFSIZE, ACP_AUDIO1_TX_RINGBUFADDR, ACP_AUDIO1_TX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO1_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO1_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO2_TX_DMA_SIZE, ACP_AUDIO2_TX_FIFOADDR, ACP_AUDIO2_TX_FIFOSIZE,
+	 ACP_AUDIO2_TX_RINGBUFSIZE, ACP_AUDIO2_TX_RINGBUFADDR, ACP_AUDIO2_TX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO2_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO2_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO0_RX_DMA_SIZE, ACP_AUDIO0_RX_FIFOADDR, ACP_AUDIO0_RX_FIFOSIZE,
+	 ACP_AUDIO0_RX_RINGBUFSIZE, ACP_AUDIO0_RX_RINGBUFADDR, ACP_AUDIO0_RX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO0_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO0_RX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO1_RX_DMA_SIZE, ACP_AUDIO1_RX_FIFOADDR, ACP_AUDIO1_RX_FIFOSIZE,
+	 ACP_AUDIO1_RX_RINGBUFSIZE, ACP_AUDIO1_RX_RINGBUFADDR, ACP_AUDIO1_RX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO1_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO1_RX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO2_RX_DMA_SIZE, ACP_AUDIO2_RX_FIFOADDR, ACP_AUDIO2_RX_FIFOSIZE,
+	 ACP_AUDIO2_RX_RINGBUFSIZE, ACP_AUDIO2_RX_RINGBUFADDR, ACP_AUDIO2_RX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO2_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO2_RX_LINEARPOSITIONCNTR_HIGH}
+};
+
+static struct sdw_dma_ring_buf_reg sdw1_dma_ring_buf_reg[ACP70_SDW1_DMA_MAX_STREAMS] = {
+	{ACP_P1_AUDIO0_TX_DMA_SIZE, ACP_P1_AUDIO0_TX_FIFOADDR, ACP_P1_AUDIO0_TX_FIFOSIZE,
+	 ACP_P1_AUDIO0_TX_RINGBUFSIZE, ACP_P1_AUDIO0_TX_RINGBUFADDR,
+	 ACP_P1_AUDIO0_TX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO0_TX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO0_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO1_TX_DMA_SIZE, ACP_P1_AUDIO1_TX_FIFOADDR, ACP_P1_AUDIO1_TX_FIFOSIZE,
+	 ACP_P1_AUDIO1_TX_RINGBUFSIZE, ACP_P1_AUDIO1_TX_RINGBUFADDR,
+	 ACP_P1_AUDIO1_TX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO2_TX_DMA_SIZE, ACP_P1_AUDIO2_TX_FIFOADDR, ACP_P1_AUDIO2_TX_FIFOSIZE,
+	 ACP_P1_AUDIO2_TX_RINGBUFSIZE, ACP_P1_AUDIO2_TX_RINGBUFADDR,
+	 ACP_P1_AUDIO2_TX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO2_TX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO2_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO0_RX_DMA_SIZE, ACP_P1_AUDIO0_RX_FIFOADDR, ACP_P1_AUDIO0_RX_FIFOSIZE,
+	 ACP_P1_AUDIO0_RX_RINGBUFSIZE, ACP_P1_AUDIO0_RX_RINGBUFADDR,
+	 ACP_P1_AUDIO0_RX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO0_RX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO0_RX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO1_RX_DMA_SIZE, ACP_P1_AUDIO1_RX_FIFOADDR, ACP_P1_AUDIO1_RX_FIFOSIZE,
+	 ACP_P1_AUDIO1_RX_RINGBUFSIZE, ACP_P1_AUDIO1_RX_RINGBUFADDR,
+	 ACP_P1_AUDIO1_RX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO1_RX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO1_RX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO2_RX_DMA_SIZE, ACP_P1_AUDIO2_RX_FIFOADDR, ACP_P1_AUDIO2_RX_FIFOSIZE,
+	 ACP_P1_AUDIO2_RX_RINGBUFSIZE, ACP_P1_AUDIO2_RX_RINGBUFADDR,
+	 ACP_P1_AUDIO2_RX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO2_RX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO2_RX_LINEARPOSITIONCNTR_HIGH}
+};
+
+static u32 sdw0_dma_enable_reg[ACP70_SDW0_DMA_MAX_STREAMS] = {
+	ACP_SW0_AUDIO0_TX_EN,
+	ACP_SW0_AUDIO1_TX_EN,
+	ACP_SW0_AUDIO2_TX_EN,
+	ACP_SW0_AUDIO0_RX_EN,
+	ACP_SW0_AUDIO1_RX_EN,
+	ACP_SW0_AUDIO2_RX_EN,
+};
+
+#define ACP_SW1_AUDIO0_TX_EN  0x0003C10
+#define ACP_SW1_AUDIO2_TX_EN  0x0003C6C
+#define ACP_SW1_AUDIO0_RX_EN  0x0003C88
+#define ACP_SW1_AUDIO2_RX_EN  0x0003D44
+
+static u32 sdw1_dma_enable_reg[ACP70_SDW1_DMA_MAX_STREAMS] = {
+	ACP_SW1_AUDIO0_TX_EN,
+	ACP_SW1_AUDIO1_TX_EN,
+	ACP_SW1_AUDIO2_TX_EN,
+	ACP_SW1_AUDIO0_RX_EN,
+	ACP_SW1_AUDIO1_RX_EN,
+	ACP_SW1_AUDIO2_RX_EN,
+};
+
+static const struct snd_pcm_hardware acp70_sdw_hardware_playback = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.buffer_bytes_max = SDW_PLAYBACK_MAX_NUM_PERIODS * SDW_PLAYBACK_MAX_PERIOD_SIZE,
+	.period_bytes_min = SDW_PLAYBACK_MIN_PERIOD_SIZE,
+	.period_bytes_max = SDW_PLAYBACK_MAX_PERIOD_SIZE,
+	.periods_min = SDW_PLAYBACK_MIN_NUM_PERIODS,
+	.periods_max = SDW_PLAYBACK_MAX_NUM_PERIODS,
+};
+
+static const struct snd_pcm_hardware acp70_sdw_hardware_capture = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.buffer_bytes_max = SDW_CAPTURE_MAX_NUM_PERIODS * SDW_CAPTURE_MAX_PERIOD_SIZE,
+	.period_bytes_min = SDW_CAPTURE_MIN_PERIOD_SIZE,
+	.period_bytes_max = SDW_CAPTURE_MAX_PERIOD_SIZE,
+	.periods_min = SDW_CAPTURE_MIN_NUM_PERIODS,
+	.periods_max = SDW_CAPTURE_MAX_NUM_PERIODS,
+};
+
+static void acp70_config_dma(struct acp_sdw_dma_stream *stream, void __iomem *acp_base,
+			     u32 stream_id)
+{
+	u16 page_idx;
+	u32 low, high, val;
+	u32 sdw_dma_pte_offset;
+	dma_addr_t addr;
+
+	addr = stream->dma_addr;
+	sdw_dma_pte_offset = SDW_PTE_OFFSET(stream->instance);
+	val = sdw_dma_pte_offset + (stream_id * ACP_SDW_PTE_OFFSET);
+
+	/* Group Enable */
+	writel(ACP_SDW_SRAM_PTE_OFFSET | BIT(31), acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_2);
+	writel(PAGE_SIZE_4K_ENABLE, acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2);
+	for (page_idx = 0; page_idx < stream->num_pages; page_idx++) {
+		/* Load the low address of page int ACP SRAM through SRBM */
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+
+		writel(low, acp_base + ACP_SCRATCH_REG_0 + val);
+		high |= BIT(31);
+		writel(high, acp_base + ACP_SCRATCH_REG_0 + val + 4);
+		val += 8;
+		addr += PAGE_SIZE;
+	}
+	writel(0x1, acp_base + ACPAXI2AXI_ATU_CTRL);
+}
+
+static int acp70_configure_sdw_ringbuffer(void __iomem *acp_base, u32 stream_id, u32 size,
+					  u32 manager_instance)
+{
+	u32 reg_dma_size;
+	u32 reg_fifo_addr;
+	u32 reg_fifo_size;
+	u32 reg_ring_buf_size;
+	u32 reg_ring_buf_addr;
+	u32 sdw_fifo_addr;
+	u32 sdw_fifo_offset;
+	u32 sdw_ring_buf_addr;
+	u32 sdw_ring_buf_size;
+	u32 sdw_mem_window_offset;
+
+	switch (manager_instance) {
+	case ACP_SDW0:
+		reg_dma_size = sdw0_dma_ring_buf_reg[stream_id].reg_dma_size;
+		reg_fifo_addr =	sdw0_dma_ring_buf_reg[stream_id].reg_fifo_addr;
+		reg_fifo_size = sdw0_dma_ring_buf_reg[stream_id].reg_fifo_size;
+		reg_ring_buf_size = sdw0_dma_ring_buf_reg[stream_id].reg_ring_buf_size;
+		reg_ring_buf_addr = sdw0_dma_ring_buf_reg[stream_id].reg_ring_buf_addr;
+		break;
+	case ACP_SDW1:
+		reg_dma_size = sdw1_dma_ring_buf_reg[stream_id].reg_dma_size;
+		reg_fifo_addr =	sdw1_dma_ring_buf_reg[stream_id].reg_fifo_addr;
+		reg_fifo_size = sdw1_dma_ring_buf_reg[stream_id].reg_fifo_size;
+		reg_ring_buf_size = sdw1_dma_ring_buf_reg[stream_id].reg_ring_buf_size;
+		reg_ring_buf_addr = sdw1_dma_ring_buf_reg[stream_id].reg_ring_buf_addr;
+		break;
+	default:
+		return -EINVAL;
+	}
+	sdw_fifo_offset = ACP_SDW_FIFO_OFFSET(manager_instance);
+	sdw_mem_window_offset = SDW_MEM_WINDOW_START(manager_instance);
+	sdw_fifo_addr = sdw_fifo_offset + (stream_id * SDW_FIFO_OFFSET);
+	sdw_ring_buf_addr = sdw_mem_window_offset + (stream_id * ACP_SDW_RING_BUFF_ADDR_OFFSET);
+	sdw_ring_buf_size = size;
+	writel(sdw_ring_buf_size, acp_base + reg_ring_buf_size);
+	writel(sdw_ring_buf_addr, acp_base + reg_ring_buf_addr);
+	writel(sdw_fifo_addr, acp_base + reg_fifo_addr);
+	writel(SDW_DMA_SIZE, acp_base + reg_dma_size);
+	writel(SDW_FIFO_SIZE, acp_base + reg_fifo_size);
+	return 0;
+}
+
+static int acp70_sdw_dma_open(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime;
+	struct acp_sdw_dma_stream *stream;
+	struct snd_soc_dai *cpu_dai;
+	struct amd_sdw_manager *amd_manager;
+	struct snd_soc_pcm_runtime *prtd = substream->private_data;
+	int ret;
+
+	runtime = substream->runtime;
+	cpu_dai = snd_soc_rtd_to_cpu(prtd, 0);
+	amd_manager = snd_soc_dai_get_drvdata(cpu_dai);
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		runtime->hw = acp70_sdw_hardware_playback;
+	else
+		runtime->hw = acp70_sdw_hardware_capture;
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(component->dev, "set integer constraint failed\n");
+		kfree(stream);
+		return ret;
+	}
+
+	stream->stream_id = cpu_dai->id;
+	stream->instance = amd_manager->instance;
+	runtime->private_data = stream;
+	return ret;
+}
+
+static int acp70_sdw_dma_hw_params(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct acp_sdw_dma_stream *stream;
+	struct sdw_dma_dev_data *sdw_data;
+	u32 period_bytes;
+	u32 water_mark_size_reg;
+	u32 irq_mask, ext_intr_ctrl;
+	u64 size;
+	u32 stream_id;
+	u32 acp_ext_intr_cntl_reg;
+	int ret;
+
+	sdw_data = dev_get_drvdata(component->dev);
+	stream = substream->runtime->private_data;
+	if (!stream)
+		return -EINVAL;
+	stream_id = stream->stream_id;
+	switch (stream->instance) {
+	case ACP_SDW0:
+		sdw_data->sdw0_dma_stream[stream_id] = substream;
+		water_mark_size_reg = sdw0_dma_ring_buf_reg[stream_id].water_mark_size_reg;
+		acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL;
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			irq_mask = BIT(SDW0_DMA_TX_IRQ_MASK(stream_id));
+		else
+			irq_mask = BIT(SDW0_DMA_RX_IRQ_MASK(stream_id));
+		break;
+	case ACP_SDW1:
+		sdw_data->sdw1_dma_stream[stream_id] = substream;
+		acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL1;
+		water_mark_size_reg = sdw1_dma_ring_buf_reg[stream_id].water_mark_size_reg;
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			irq_mask = BIT(SDW1_DMA_TX_IRQ_MASK(stream_id));
+		else
+			irq_mask = BIT(SDW1_DMA_RX_IRQ_MASK(stream_id));
+
+		break;
+	default:
+		return -EINVAL;
+	}
+	size = params_buffer_bytes(params);
+	period_bytes = params_period_bytes(params);
+	stream->dma_addr = substream->runtime->dma_addr;
+	stream->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
+	acp70_config_dma(stream, sdw_data->acp_base, stream_id);
+	ret = acp70_configure_sdw_ringbuffer(sdw_data->acp_base, stream_id, size,
+					     stream->instance);
+	if (ret) {
+		dev_err(component->dev, "Invalid DMA channel\n");
+		return -EINVAL;
+	}
+	ext_intr_ctrl = readl(sdw_data->acp_base + acp_ext_intr_cntl_reg);
+	ext_intr_ctrl |= irq_mask;
+	writel(ext_intr_ctrl, sdw_data->acp_base + acp_ext_intr_cntl_reg);
+	writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
+	return 0;
+}
+
+static u64 acp70_sdw_get_byte_count(struct acp_sdw_dma_stream *stream, void __iomem *acp_base)
+{
+	union acp_sdw_dma_count byte_count;
+	u32 pos_low_reg, pos_high_reg;
+
+	byte_count.bytescount = 0;
+	switch (stream->instance) {
+	case ACP_SDW0:
+		pos_low_reg = sdw0_dma_ring_buf_reg[stream->stream_id].pos_low_reg;
+		pos_high_reg = sdw0_dma_ring_buf_reg[stream->stream_id].pos_high_reg;
+		break;
+	case ACP_SDW1:
+		pos_low_reg = sdw1_dma_ring_buf_reg[stream->stream_id].pos_low_reg;
+		pos_high_reg = sdw1_dma_ring_buf_reg[stream->stream_id].pos_high_reg;
+		break;
+	default:
+		goto POINTER_RETURN_BYTES;
+	}
+	if (pos_low_reg) {
+		byte_count.bcount.high = readl(acp_base + pos_high_reg);
+		byte_count.bcount.low = readl(acp_base + pos_low_reg);
+	}
+POINTER_RETURN_BYTES:
+	return byte_count.bytescount;
+}
+
+static snd_pcm_uframes_t acp70_sdw_dma_pointer(struct snd_soc_component *comp,
+					       struct snd_pcm_substream *substream)
+{
+	struct sdw_dma_dev_data *sdw_data;
+	struct acp_sdw_dma_stream *stream;
+	u32 pos, buffersize;
+	u64 bytescount;
+
+	sdw_data = dev_get_drvdata(comp->dev);
+	stream = substream->runtime->private_data;
+	buffersize = frames_to_bytes(substream->runtime,
+				     substream->runtime->buffer_size);
+	bytescount = acp70_sdw_get_byte_count(stream, sdw_data->acp_base);
+	if (bytescount > stream->bytescount)
+		bytescount -= stream->bytescount;
+	pos = do_div(bytescount, buffersize);
+	return bytes_to_frames(substream->runtime, pos);
+}
+
+static int acp70_sdw_dma_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
+{
+	struct device *parent = component->dev->parent;
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       parent, SDW_MIN_BUFFER, SDW_MAX_BUFFER);
+	return 0;
+}
+
+static int acp70_sdw_dma_close(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	struct sdw_dma_dev_data *sdw_data;
+	struct acp_sdw_dma_stream *stream;
+
+	sdw_data = dev_get_drvdata(component->dev);
+	stream = substream->runtime->private_data;
+	if (!stream)
+		return -EINVAL;
+	switch (stream->instance) {
+	case ACP_SDW0:
+		sdw_data->sdw0_dma_stream[stream->stream_id] = NULL;
+		break;
+	case ACP_SDW1:
+		sdw_data->sdw1_dma_stream[stream->stream_id] = NULL;
+		break;
+	default:
+		return -EINVAL;
+	}
+	kfree(stream);
+	return 0;
+}
+
+static int acp70_sdw_dma_enable(struct snd_pcm_substream *substream,
+				void __iomem *acp_base, bool sdw_dma_enable)
+{
+	struct acp_sdw_dma_stream *stream;
+	u32 stream_id;
+	u32 sdw_dma_en_reg;
+	u32 sdw_dma_en_stat_reg;
+	u32 sdw_dma_stat;
+	u32 dma_enable;
+
+	stream = substream->runtime->private_data;
+	stream_id = stream->stream_id;
+	switch (stream->instance) {
+	case ACP_SDW0:
+		sdw_dma_en_reg = sdw0_dma_enable_reg[stream_id];
+		break;
+	case ACP_SDW1:
+		sdw_dma_en_reg = sdw1_dma_enable_reg[stream_id];
+		break;
+	default:
+		return -EINVAL;
+	}
+	sdw_dma_en_stat_reg = sdw_dma_en_reg + 4;
+	dma_enable = sdw_dma_enable;
+	writel(dma_enable, acp_base + sdw_dma_en_reg);
+	return readl_poll_timeout(acp_base + sdw_dma_en_stat_reg, sdw_dma_stat,
+				  (sdw_dma_stat == dma_enable), ACP_DELAY_US, ACP_COUNTER);
+}
+
+static int acp70_sdw_dma_trigger(struct snd_soc_component *comp,
+				 struct snd_pcm_substream *substream,
+				 int cmd)
+{
+	struct sdw_dma_dev_data *sdw_data;
+	int ret;
+
+	sdw_data = dev_get_drvdata(comp->dev);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = acp70_sdw_dma_enable(substream, sdw_data->acp_base, true);
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = acp70_sdw_dma_enable(substream, sdw_data->acp_base, false);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	if (ret)
+		dev_err(comp->dev, "trigger %d failed: %d", cmd, ret);
+	return ret;
+}
+
 static const struct snd_soc_component_driver acp70_sdw_component = {
 	.name		= DRV_NAME,
+	.open		= acp70_sdw_dma_open,
+	.close		= acp70_sdw_dma_close,
+	.hw_params	= acp70_sdw_dma_hw_params,
+	.trigger	= acp70_sdw_dma_trigger,
+	.pointer	= acp70_sdw_dma_pointer,
+	.pcm_construct	= acp70_sdw_dma_new,
 	.use_dai_pcm_id = true,
 };
 
diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index c707c10c4be4..a96b021e64da 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -58,6 +58,81 @@
 #define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
 #define MIN_BUFFER MAX_BUFFER
 
+#define ACP_SDW0_STAT			BIT(21)
+#define ACP_SDW1_STAT			BIT(2)
+#define ACP_ERROR_IRQ			BIT(29)
+
+#define ACP_AUDIO0_TX_THRESHOLD		0x1c
+#define ACP_AUDIO1_TX_THRESHOLD		0x1a
+#define ACP_AUDIO2_TX_THRESHOLD		0x18
+#define ACP_AUDIO0_RX_THRESHOLD		0x1b
+#define ACP_AUDIO1_RX_THRESHOLD		0x19
+#define ACP_AUDIO2_RX_THRESHOLD		0x17
+#define ACP_P1_AUDIO0_TX_THRESHOLD	0x8
+#define ACP_P1_AUDIO1_TX_THRESHOLD	0x6
+#define ACP_P1_AUDIO2_TX_THRESHOLD	0x4
+#define ACP_P1_AUDIO0_RX_THRESHOLD	0x7
+#define ACP_P1_AUDIO1_RX_THRESHOLD	0x5
+#define ACP_P1_AUDIO2_RX_THRESHOLD	0x3
+#define ACP_SDW_DMA_IRQ_MASK		0x1F800000
+#define ACP_P1_SDW_DMA_IRQ_MASK		0x1F8
+#define ACP70_SDW0_DMA_MAX_STREAMS	6
+#define ACP70_SDW1_DMA_MAX_STREAMS	6
+
+/*
+ * Below entries describes SDW0 instance DMA stream id and DMA irq bit mapping
+ * in ACP_EXTENAL_INTR_CNTL register.
+ * Stream id		IRQ Bit
+ * 0 (SDW0_AUDIO0_TX)	28
+ * 1 (SDW0_AUDIO1_TX)	26
+ * 2 (SDW0_AUDIO2_TX)	24
+ * 3 (SDW0_AUDIO0_RX)	27
+ * 4 (SDW0_AUDIO1_RX)	25
+ * 5 (SDW0_AUDIO2_RX)	23
+ */
+#define SDW0_DMA_TX_IRQ_MASK(i)	(ACP_AUDIO0_TX_THRESHOLD - (2 * (i)))
+#define SDW0_DMA_RX_IRQ_MASK(i)	(ACP_AUDIO0_RX_THRESHOLD - (2 * ((i) - 3)))
+
+/*
+ * Below entries describes SDW1 instance DMA stream id and DMA irq bit mapping
+ * in ACP_EXTENAL_INTR_CNTL1 register.
+ * Stream id		IRQ Bit
+ * 0 (SDW1_AUDIO0_TX)	8
+ * 1 (SDW1_AUDIO1_TX)	6
+ * 2 (SDW1_AUDIO2_TX)	4
+ * 3 (SDW1_AUDIO0_RX)	7
+ * 4 (SDW1_AUDIO1_RX)	5
+ * 5 (SDW1_AUDIO2_RX)	3
+ */
+#define SDW1_DMA_TX_IRQ_MASK(i)	(ACP_P1_AUDIO0_TX_THRESHOLD - (2 * (i)))
+#define SDW1_DMA_RX_IRQ_MASK(i)	(ACP_P1_AUDIO0_RX_THRESHOLD - (2 * ((i) - 3)))
+
+#define ACP_DELAY_US		5
+#define ACP_SDW_RING_BUFF_ADDR_OFFSET (128 * 1024)
+#define SDW0_MEM_WINDOW_START	0x4800000
+#define ACP_SDW_SRAM_PTE_OFFSET	0x03800400
+#define SDW0_PTE_OFFSET		0x400
+#define SDW_FIFO_SIZE		0x100
+#define SDW_DMA_SIZE		0x40
+#define ACP_SDW0_FIFO_OFFSET	0x100
+#define ACP_SDW_PTE_OFFSET	0x100
+#define SDW_FIFO_OFFSET		0x100
+#define SDW_PTE_OFFSET(i)	(SDW0_PTE_OFFSET + ((i) * 0x600))
+#define ACP_SDW_FIFO_OFFSET(i)	(ACP_SDW0_FIFO_OFFSET + ((i) * 0x500))
+#define SDW_MEM_WINDOW_START(i)	(SDW0_MEM_WINDOW_START + ((i) * 0xC0000))
+
+#define SDW_PLAYBACK_MIN_NUM_PERIODS    2
+#define SDW_PLAYBACK_MAX_NUM_PERIODS    8
+#define SDW_PLAYBACK_MAX_PERIOD_SIZE    8192
+#define SDW_PLAYBACK_MIN_PERIOD_SIZE    1024
+#define SDW_CAPTURE_MIN_NUM_PERIODS     2
+#define SDW_CAPTURE_MAX_NUM_PERIODS     8
+#define SDW_CAPTURE_MAX_PERIOD_SIZE     8192
+#define SDW_CAPTURE_MIN_PERIOD_SIZE     1024
+
+#define SDW_MAX_BUFFER (SDW_PLAYBACK_MAX_PERIOD_SIZE * SDW_PLAYBACK_MAX_NUM_PERIODS)
+#define SDW_MIN_BUFFER SDW_MAX_BUFFER
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
@@ -82,6 +157,24 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+enum amd_sdw0_channel {
+	ACP_SDW0_AUDIO0_TX = 0,
+	ACP_SDW0_AUDIO1_TX,
+	ACP_SDW0_AUDIO2_TX,
+	ACP_SDW0_AUDIO0_RX,
+	ACP_SDW0_AUDIO1_RX,
+	ACP_SDW0_AUDIO2_RX,
+};
+
+enum amd_sdw1_channel {
+	ACP_SDW1_AUDIO0_TX = 0,
+	ACP_SDW1_AUDIO1_TX,
+	ACP_SDW1_AUDIO2_TX,
+	ACP_SDW1_AUDIO0_RX,
+	ACP_SDW1_AUDIO1_RX,
+	ACP_SDW1_AUDIO2_RX,
+};
+
 struct pdm_stream_instance {
 	u16 num_pages;
 	u16 channels;
@@ -97,9 +190,39 @@ struct pdm_dev_data {
 	struct snd_pcm_substream *capture_stream;
 };
 
+union acp_sdw_dma_count {
+	struct {
+		u32 low;
+		u32 high;
+	} bcount;
+	u64 bytescount;
+};
+
+struct acp_sdw_dma_stream {
+	u16 num_pages;
+	u16 channels;
+	u32 stream_id;
+	u32 instance;
+	dma_addr_t dma_addr;
+	u64 bytescount;
+};
+
+struct sdw_dma_ring_buf_reg {
+	u32 reg_dma_size;
+	u32 reg_fifo_addr;
+	u32 reg_fifo_size;
+	u32 reg_ring_buf_size;
+	u32 reg_ring_buf_addr;
+	u32 water_mark_size_reg;
+	u32 pos_low_reg;
+	u32 pos_high_reg;
+};
+
 struct sdw_dma_dev_data {
 	void __iomem *acp_base;
 	struct mutex *acp_lock; /* used to protect acp common register access */
+	struct snd_pcm_substream *sdw0_dma_stream[ACP70_SDW0_DMA_MAX_STREAMS];
+	struct snd_pcm_substream *sdw1_dma_stream[ACP70_SDW1_DMA_MAX_STREAMS];
 };
 
 /**
-- 
2.34.1


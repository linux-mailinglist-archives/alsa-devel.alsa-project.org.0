Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96577CB00F5
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:30:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30F09601F4;
	Tue,  9 Dec 2025 14:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30F09601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765287039;
	bh=JxmgsnXBMGXo2/ktocDY47ESsbXOoQllx+109fbII7g=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ibzr7QFbXnsqBv0t4tuRvP8CTkPZAfnlFcVdSl4MBi8kwlTNAWsinP9JSTj+JdzRJ
	 R4heqD4VHwtA89B7PaZqbif0ahBgR4DpuG7jSHkZpvN0ra6bTYDx0ki1SjSz39m8Ku
	 a3pRXHuoEN2tvr39yejSOPznSEQpL/OC/z43SG7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C71EF805E9; Tue,  9 Dec 2025 14:29:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F316F805E4;
	Tue,  9 Dec 2025 14:29:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84455F80246; Tue,  2 Dec 2025 18:56:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DF80F800B5
	for <alsa-devel@alsa-project.org>; Tue,  2 Dec 2025 18:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF80F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NGSniLc5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/9KrigZIpBb4H6ZqtMoJJfax+y/YSFcMOI74QtE9Wj7qWN6CtL7beyDDJ5Y5jJg87foxFK7SbLE5LuJXpMP4s1yTdAfHk6eM7t5uYkiF82clOrUxEgduI3r44dtMeldp4rR0kifjYkQbA96lDpe5aP6+lpRYoCYaEqRpL/GrdzfMmCNg/xnyiO6ox1CEspGsodHjHKQehlORZrs5dvwcTI3uYzeDvGxT5KxUfytjrCQL9n8jMl7hVxqK/d+yhE6nwlJdfUrVni0OhvWvrlzGccaC2EKyN0+M2NRa9orXkwoDqzWSNMeqC7D6TNeorq+NXc8MUNYhoQyd43zadBOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHiFNnXPyqQXw5KI7KS0xr/u/SYmb5vv0v6dX9BzFiE=;
 b=MYnBXxowM3xH3OztLZ9VRXpZEnooG9oR4uHaRaYNpUE2auvOpgoeHXDovwI7yarC2XquWfNcTwBJJlJRZ1chWxOImYYnf7d85KKiyZwvFtLQfzvFfJEfBgCNgvXiBZMaMA8yildrf0T7J6CpL8KzYY1MVd5S1pBcjJhZEW+SeR4h3hp60vudVyLOrAxyxq0h1xG1dQPHAVdLeCmbOz8oYGfcIlVuixg4OmbvkAGrPqLT9Hk6eT+caSSUGPjCICXJIGlPYhXDre3I4k0KVh2Aa2H5Poo3pRBYr8YxnFu3IJeOsSGo6YqezEn8UqrNj0sgfI1ohScc01BmgbN613LP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHiFNnXPyqQXw5KI7KS0xr/u/SYmb5vv0v6dX9BzFiE=;
 b=NGSniLc502ZfKGOMVXduHLBbPW4pcu5IJK4n0QdFmo8Sb5heE7XjHDO72xFFdXLfOvUD3Dww2UDpZN1BZEhBj0iaejYf26m9bPhdMRNYfqWDaajNL7q7bYpBfeNlRJ56qx3L5HO9NeS2tUazeiev9ydxTpgDNFnPLWVHyx5We4A=
Received: from BY5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:1d0::24)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 17:56:27 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::34) by BY5PR04CA0014.outlook.office365.com
 (2603:10b6:a03:1d0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 17:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 17:56:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 11:56:25 -0600
Received: from drvdevbldsrv2.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 09:56:22 -0800
From: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Hemalatha Pinnamreddy
	<hemalatha.pinnamreddy2@amd.com>, Raghavendra Prasad Mallela
	<raghavendraprasad.mallela@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Venkata
 Prasad Potturu" <venkataprasad.potturu@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Peter Zijlstra <peterz@infradead.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] ASoC: amd: acp: Audio is not resuming after s0ix
Date: Tue, 2 Dec 2025 23:26:14 +0530
Message-ID: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7e07d5-eb32-4c8d-b9e3-08de31cc1d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?byCjLuQQHsVZMjEXOVJ/KjVm6FCQwNDP6fOkslRtlQC6UY63lJbXyWRcn2LP?=
 =?us-ascii?Q?z/WAHLLKZpoUSHm7v0rNulVA3LW4xxvYYEYMfZL0CYnxkBk4XlqFoe7qTFVa?=
 =?us-ascii?Q?p7D4Exykvw9/e5zMx077UX2tVJO2e1aEGc4WUCVmHMjq3m8K6p5IMKtd1FX4?=
 =?us-ascii?Q?g1Owb6UBXUJP+r2Jxc/VMTQyBKOa06VBBidQnQk7kGTfZ+eE1Ox7/GLCczAt?=
 =?us-ascii?Q?I07RO/g7ZV7skIrfA1KFE2qjqDEGpPXyE2BkB5XdtNP3a6xdg54bpbiM3YtN?=
 =?us-ascii?Q?CIuwY+MMiLcfbz7m0Os1cOxc2juIey11p78va2vBw+w3suGSWYnlfYCaCdnN?=
 =?us-ascii?Q?su75YuZ1JXJDxp8a4hmsr65vE/c6r/1E8ya0xAAvAMKhpHv5HBJ+w6jCA3Gm?=
 =?us-ascii?Q?ai3xmjziL1P1+Gm1ftL7VOZKmLSWDzh0hFhzaf72UiOV2P8p0Rd8xkuzNpnB?=
 =?us-ascii?Q?gHSvGPFjte8wM17BtuKpETtMGWaPG/ok5F1Ny7/78XZ3fQW+Ih3rKT2QjKs1?=
 =?us-ascii?Q?n9QXVvmFVbIcSxBHH2WWw39R2N8ke2ABP8cUd1y5/3r/T0czH3qgpvFUX9iP?=
 =?us-ascii?Q?74zLsX5eQetxNVMo1EQqMjOZRllGVmttWziQgIH5gIETNXd1c/Z65IozFKM8?=
 =?us-ascii?Q?3rzRy/rig8uRpR04Wl6gnRIa/iHKApPxhrL/T0KcePRDJkR0E623cdQY0Roa?=
 =?us-ascii?Q?IK1uSAVtdr3dlLeOhrGaijXODhlqdKIkoRYbLccSqLO6XsOPmgg9q7m4dFLj?=
 =?us-ascii?Q?r9QuX1tN/z3igEKkdemNOnnVYl7dmnPJjE610T0Eczo8hqMgXV6pUuW/4tkb?=
 =?us-ascii?Q?r382XXJktHXTwiGO/RANkbTgV0H5tABBZZCSFYhB8BNmsw6+MXVhiORzT9J9?=
 =?us-ascii?Q?Or3Cn5WHGQGK5Z8z1Phr4uRz64vGDbSXXyWLTCnMA9Ns5+QTgKlK19H+5XgC?=
 =?us-ascii?Q?wwukpOmABtTRqingMpSbK+hmivraJURtHuhfsFO4bmeq8M0FWLI+T7rGhSyW?=
 =?us-ascii?Q?gcmGajom9QRAGDIVxM8xbO57nQ2f//pND3aeY2oPg1+r+ANxtGrE0xqjHZKe?=
 =?us-ascii?Q?6GvKkl6wCU3x/CJntN269WKl2DgKocuNWsfXc6u8/RtFwhRBXxx/xTzWajQQ?=
 =?us-ascii?Q?YIkESZO8JGuJeOQI1SPq6GN0rA3eP5DCe3qlZBoM+8oDOc3rN0dbJI2VXHX2?=
 =?us-ascii?Q?L0QfOlgnDTP1BuOAkjyDtTm/sUskTXS2pWSMxvCvBJEhJP0rTretu1aiuN3L?=
 =?us-ascii?Q?pYbZLMkNfhEf9X2pTeozB6dGsHmPd+9+aC/wIt9QRAvIoO0YvxVNnhaYNmWY?=
 =?us-ascii?Q?PWhrZ9WzS88XdT6VDjYq1afWBhYnG3ee2F8uWsq8D2Z8pZ0gD2xDDuYEWi2R?=
 =?us-ascii?Q?ksb6tuk5uTewskeWpPbs9/rG8fSjCDX1xaEWv93vfmaDVAhcfmPW06NSbPRp?=
 =?us-ascii?Q?Xm/SM7U19USrs9slJD8Q03nHaKYETliHG2G8U8LvSHJJ5oXa2XORkNtBH6mJ?=
 =?us-ascii?Q?jnzGYcHGB1Uwp7PKik6cC6gHLEk30LgojQlD4pSS7YvEtMugMPhSZ6lqF+S6?=
 =?us-ascii?Q?fSgHkA61BlKa14uk8tg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 17:56:26.6511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e7e07d5-eb32-4c8d-b9e3-08de31cc1d4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
X-MailFrom: RaghavendraPrasad.Mallela@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FZQ5C4TBTXRXDEMUKM74LQPB7HUSP6OQ
X-Message-ID-Hash: FZQ5C4TBTXRXDEMUKM74LQPB7HUSP6OQ
X-Mailman-Approved-At: Tue, 09 Dec 2025 13:29:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZQ5C4TBTXRXDEMUKM74LQPB7HUSP6OQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>

Audio fails to resume after system exits suspend mode
due to accessing incorrect ring buffer address during
resume. This patch resolves issue by selecting correct
address based on the ACP version.

Signed-off-by: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
Signed-off-by: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 32 +++++++++++++++++++++------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 3078f459e005..da80c761d657 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -208,7 +208,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 	struct acp_resource *rsrc = chip->rsrc;
 	struct acp_stream *stream = substream->runtime->private_data;
 	u32 reg_dma_size, reg_fifo_size, reg_fifo_addr;
-	u32 phy_addr, acp_fifo_addr, ext_int_ctrl;
+	u32 phy_addr = 0, acp_fifo_addr, ext_int_ctrl;
 	unsigned int dir = substream->stream;
 
 	switch (dai->driver->id) {
@@ -219,7 +219,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					SP_PB_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_I2S_TX_FIFOADDR(chip);
 			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(chip);
-			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_I2S_TX_RINGBUFADDR(chip));
 		} else {
 			reg_dma_size = ACP_I2S_RX_DMA_SIZE(chip);
@@ -227,7 +230,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					SP_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(chip);
 			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(chip);
-			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_I2S_RX_RINGBUFADDR(chip));
 		}
 		break;
@@ -238,7 +244,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					BT_PB_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_BT_TX_FIFOADDR(chip);
 			reg_fifo_size = ACP_BT_TX_FIFOSIZE(chip);
-			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_BT_TX_RINGBUFADDR(chip));
 		} else {
 			reg_dma_size = ACP_BT_RX_DMA_SIZE(chip);
@@ -246,7 +255,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					BT_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_BT_RX_FIFOADDR(chip);
 			reg_fifo_size = ACP_BT_RX_FIFOSIZE(chip);
-			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_BT_RX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_BT_RX_RINGBUFADDR(chip));
 		}
 		break;
@@ -257,7 +269,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					HS_PB_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
 			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
-			phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_HS_TX_RINGBUFADDR);
 		} else {
 			reg_dma_size = ACP_HS_RX_DMA_SIZE;
@@ -265,7 +280,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					HS_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
 			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
-			phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_HS_RX_RINGBUFADDR);
 		}
 		break;
-- 
2.17.1


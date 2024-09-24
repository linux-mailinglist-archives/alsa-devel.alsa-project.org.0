Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D5983D02
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 08:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C1AF868;
	Tue, 24 Sep 2024 08:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C1AF868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727158837;
	bh=lOX1HUGFHBX1DNs2BNOg1eNej5qsVEYz7keCjTQ/4w4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jSqIO3DzhciY8MNLPwB4WyMl2w3F0D8S0JCaonuIXPvKCzUcM8V+Ga1ikWBay1+Wy
	 ebQBxF6iK4DFERhDhPQP8aU+0eoQRo3M1mdnMH300zS0Q+RrlMHEcXLlDPNgUVjuO0
	 N7xr1N1tu7kv/mdB8ioKCr1AaPdixodfbtYP+DtQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 250F7F8063C; Tue, 24 Sep 2024 08:19:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21F4AF8063D;
	Tue, 24 Sep 2024 08:19:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49C68F805E7; Tue, 24 Sep 2024 08:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAEEEF805AE
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 08:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAEEEF805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jjDeuVOZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enyo1EDa5eDfZJ2Jjnho1uuiwkg2AEuIbZIYrU1iidytGiTP5GaMQShUDNyK26Pmih0xsNbC4Jx7UHt85vNbPK6w90WqzRYjfCrShDQp25H1NqwQa9MSKt9iTs5PBATnuuoheioZL7DuKzrWx4oa/xn7zHL3VpznLs26I1ySSpKU3oAht9BX3LHNDDrCeg0TbGrL128wTSZH5IjHEIRfJe0DdXdGUDt8TZaDuf+JL3d43XqmoM7HPjOpRr2s369T41FSTfm+iZihYAcfvXbpjmM1oe1P4ej1KMudVdQuV4ew9UFq6wU8a5FVUXVfA+0e5n350pAbw7rz4JaAhpzP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H0wI6+uJGaRPBAubRwJVI2iQJgonhHPTKDcye/8Cfo=;
 b=PtsOXUApUJruS4+lmZvQdCBngg/ZcGg8aM/lzChZ3bc5aHcsu5DZnNToLgav2Bfy709aT7IZeGTsmY1oJ0tkAghk6SbNfWCZRcAGqrUINX3ZvR5hx3N3udAwnHG42OGemMTNBIEeKt52RzYr8vzBJzxYw0aImDI1ZD6BJ4BAzO0ejBaYMDFex3JhsHzXndEfGfzNIccxQr/n8gjeQjZDQDzBLD+Yg992Fh4Ubi7PbZ9Tv3RP+8FMNBVu04+QOtkK49sqlFSrPFZAzAhCjS/UdRsMIuK2s0vFb1JOAjUTXDdoFPr4XYpvlCsoBvbRJZa5QcJFd3z8ixpf8TFbSfmaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H0wI6+uJGaRPBAubRwJVI2iQJgonhHPTKDcye/8Cfo=;
 b=jjDeuVOZvqA6ti7c0oiJXcc5IGa+FwvRaxdNt1vT5jx7bTzeGO37ci03QsnoVon4S78N5i9JEtf8AIy6UKoMv74HFO+R9TnxleR7Ewx/mKlItaN1C5iQ1qp5pwB3R42XwCAv1IPOSSraWawbLVitWkeIu6Rv0faSXJ+3aop2RdQ=
Received: from SA9PR13CA0005.namprd13.prod.outlook.com (2603:10b6:806:21::10)
 by PH7PR12MB6659.namprd12.prod.outlook.com (2603:10b6:510:210::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 06:18:48 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:21:cafe::67) by SA9PR13CA0005.outlook.office365.com
 (2603:10b6:806:21::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.15 via Frontend
 Transport; Tue, 24 Sep 2024 06:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 06:18:48 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 01:18:44 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 3/9] ASoC: amd: acp: use acp pci revision id for platform
 differntiation
Date: Tue, 24 Sep 2024 11:48:15 +0530
Message-ID: <20240924061821.1127054-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924061821.1127054-1-Vijendar.Mukunda@amd.com>
References: <20240924061821.1127054-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|PH7PR12MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 927674e4-1599-4a16-7a82-08dcdc60c096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N2AZHnQGtYkiBEQ9DxVh26prIva1fxDIWlZGCHrsC6/5OntTg326dv/zlrz+?=
 =?us-ascii?Q?zpMLTxsdXjkjiw/5FzIYep33/9LagAPD2G45+ddKErtx7kN7TuKFkfVtrigQ?=
 =?us-ascii?Q?AjSUnFToJkZLZcPaFG/lOXBJAbkaQJ9cZ/iAS0DMOTdF/6X1+d/tO6mpg2Pk?=
 =?us-ascii?Q?zMJxGv68KmgbXszuMMAEqsV7axsfklbP0nK30N7r5gnClKnGA94VnDPL6JKx?=
 =?us-ascii?Q?QV7DtFpIJn5P7J4vUKhSczY/TC4fW9VrkDnFW3xmN/Bpaidzp1IfTWld4S46?=
 =?us-ascii?Q?1Ajl5nAYEUSQIeCL3Ea+1Q7pmgXYlASUNqZLdCfJBxeX/sJV2f0eCaPG2h+4?=
 =?us-ascii?Q?Yy2Me1HFBBHG3pbX1JdoVWlNwxwdyfS9tLjkEa6yoLl4sNfNoTN+b8gc3vyA?=
 =?us-ascii?Q?jbryDkUHZOWAEPG6xWlKlXAijdjDyVEJrTOiTU3eCw/p0sDRr4qiqYubk3XX?=
 =?us-ascii?Q?IKEzERfHJlvuHzDDTppJTt5eaAoytkh0fKb6GR/GDmpk5g8O6hajd7MaslcO?=
 =?us-ascii?Q?WPpOz1kmYkhLU6jpJVQ7WltKAQV9SQPnwgnBpMCF9b737hwXNwa+R4/aGxln?=
 =?us-ascii?Q?VvnSWDrNvsp6aCp9k77mbyz1hvmbL5E67Q8CeYU40vmIpOE5vK6UBvzwCAHJ?=
 =?us-ascii?Q?42+X1HnKXUs4oI12r2AfAzOxDo3dMxYyDcGz0iINHZ5SbDBhT9whd63Rdsp5?=
 =?us-ascii?Q?ERWlMUs0bQNq3vu6C/dfLc4Ndk5urRintIPL44jevQrWKICtiIV9YfJozxhc?=
 =?us-ascii?Q?ohBhctDNg4v4Y/84+83gEmLH38b+t0KAYWSIj+eUo7OEqJ+seyXez0UJfsdk?=
 =?us-ascii?Q?84an9IISovziSUdxbTIaxX44WTjcyn7rh6JKD8yah478cWFKrUmpaEHQLQqL?=
 =?us-ascii?Q?hAWk8mm8DGd0DY6ZMkvauhntX+XAVSO4rAgNajt3GLEFrzFc9JTD72q2nbho?=
 =?us-ascii?Q?EB6hVS4tyiZ/xHYxW9CZwc3U3Ds2p+1UmnguEh8PJ06M7IiUNAcHhrbyXV0i?=
 =?us-ascii?Q?G/r/3SovXSBGYQ61IantIFCk6Qncx1O6AWGQez5FIW0ZpLsluN6plKHa4Weq?=
 =?us-ascii?Q?aHaMXI1Wq9DBUNkJeu5qE/8CZHe+ofaiOTK/YWgKa1JlSX39kQiwmV5VVmKD?=
 =?us-ascii?Q?dqg4/a+PCZQaZz+Eh45lAs2ImNjTvQr3+6YlHcZNLg0aUZYEmPtvrzZxosbC?=
 =?us-ascii?Q?xka+KPNvYaVFqBaM2jTUy/PrtMi/2xgEqI8/R9OTKHSwMwOBHrj5yNQJiENT?=
 =?us-ascii?Q?WkTG/SImOO88wl6jotXQ81JEP3M9kq1HroPe1Rt49xYpwV2NtMo/bDSrhJ+m?=
 =?us-ascii?Q?QSqJ6RFsUeC6WG9WsgW+veLGfzIJlqtkQbN8f1TmS6AHbiU8kvIiefoqQnzi?=
 =?us-ascii?Q?u9dbybKjB/A9zgBA75KIVP9vPKkn?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 06:18:48.4888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 927674e4-1599-4a16-7a82-08dcdc60c096
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6659
Message-ID-Hash: KLEKKZOPCSJSPESTZRWMWUASXWY3TQX4
X-Message-ID-Hash: KLEKKZOPCSJSPESTZRWMWUASXWY3TQX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLEKKZOPCSJSPESTZRWMWUASXWY3TQX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Store acp pci revision id value in 'acp_rev' variable.
Use common ACP PCI revision id macros throughout the code for acp_rev
check and remove unused macros for platform differentiation from
common header file for acp platform driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c           | 38 +++++++++++++--------------
 sound/soc/amd/acp/acp-legacy-common.c | 24 ++++++++---------
 sound/soc/amd/acp/acp-pci.c           |  7 +----
 sound/soc/amd/acp/acp-pdm.c           |  2 +-
 sound/soc/amd/acp/acp-platform.c      |  6 ++---
 sound/soc/amd/acp/acp-rembrandt.c     |  2 +-
 sound/soc/amd/acp/acp-renoir.c        |  2 +-
 sound/soc/amd/acp/acp63.c             |  2 +-
 sound/soc/amd/acp/acp70.c             |  6 ++---
 sound/soc/amd/acp/amd.h               |  7 +----
 10 files changed, 43 insertions(+), 53 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 56ce9e4b6acc..515bf862deb5 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -59,9 +59,9 @@ static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
 		val |= BIT(1);
 
 	switch (chip->acp_rev) {
-	case ACP63_DEV:
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP63_PCI_ID:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, adata->lrclk_div);
 		val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, adata->bclk_div);
 		break;
@@ -121,8 +121,8 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 	}
 
 	switch (chip->acp_rev) {
-	case ACP3X_DEV:
-	case ACP6X_DEV:
+	case ACP_RN_PCI_ID:
+	case ACP_RMB_PCI_ID:
 		switch (slots) {
 		case 1 ... 7:
 			no_of_slots = slots;
@@ -135,9 +135,9 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 			return -EINVAL;
 		}
 		break;
-	case ACP63_DEV:
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP63_PCI_ID:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		switch (slots) {
 		case 1 ... 31:
 			no_of_slots = slots;
@@ -160,8 +160,8 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 	spin_lock_irq(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
 		switch (chip->acp_rev) {
-		case ACP3X_DEV:
-		case ACP6X_DEV:
+		case ACP_RN_PCI_ID:
+		case ACP_RMB_PCI_ID:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
 				adata->tdm_tx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
@@ -169,9 +169,9 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 				adata->tdm_rx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
 			break;
-		case ACP63_DEV:
-		case ACP70_DEV:
-		case ACP71_DEV:
+		case ACP63_PCI_ID:
+		case ACP70_PCI_ID:
+		case ACP71_PCI_ID:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
 				adata->tdm_tx_fmt[stream->dai_id - 1] =
 						FRM_LEN | (slots << 13) | (slot_len << 18);
@@ -534,7 +534,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR(adata);
 			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(adata);
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
@@ -546,7 +546,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(adata);
 			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(adata);
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
@@ -561,7 +561,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_BT_TX_FIFOADDR(adata);
 			reg_fifo_size = ACP_BT_TX_FIFOSIZE(adata);
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
@@ -573,7 +573,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_BT_RX_FIFOADDR(adata);
 			reg_fifo_size = ACP_BT_RX_FIFOSIZE(adata);
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
@@ -588,7 +588,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
 			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
@@ -600,7 +600,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
 			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index be01b178172e..3f76d1f0a9e7 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -257,20 +257,20 @@ static int acp_power_on(struct acp_chip_info *chip)
 
 	base = chip->base;
 	switch (chip->acp_rev) {
-	case ACP3X_DEV:
+	case ACP_RN_PCI_ID:
 		acp_pgfsm_stat_reg = ACP_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP_PGFSM_CONTROL;
 		break;
-	case ACP6X_DEV:
+	case ACP_RMB_PCI_ID:
 		acp_pgfsm_stat_reg = ACP6X_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP6X_PGFSM_CONTROL;
 		break;
-	case ACP63_DEV:
+	case ACP63_PCI_ID:
 		acp_pgfsm_stat_reg = ACP63_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP63_PGFSM_CONTROL;
 		break;
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		acp_pgfsm_stat_reg = ACP70_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP70_PGFSM_CONTROL;
 		break;
@@ -322,7 +322,7 @@ int acp_init(struct acp_chip_info *chip)
 		pr_err("ACP reset failed\n");
 		return ret;
 	}
-	if (chip->acp_rev >= ACP70_DEV)
+	if (chip->acp_rev >= ACP70_PCI_ID)
 		writel(0, chip->base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
@@ -337,7 +337,7 @@ int acp_deinit(struct acp_chip_info *chip)
 	if (ret)
 		return ret;
 
-	if (chip->acp_rev < ACP70_DEV)
+	if (chip->acp_rev < ACP70_PCI_ID)
 		writel(0, chip->base + ACP_CONTROL);
 	else
 		writel(0x01, chip->base + ACP_ZSC_DSP_CTRL);
@@ -448,20 +448,20 @@ void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
 	u32 pdm_addr;
 
 	switch (chip->acp_rev) {
-	case ACP3X_DEV:
+	case ACP_RN_PCI_ID:
 		pdm_addr = ACP_RENOIR_PDM_ADDR;
 		check_acp3x_config(chip);
 		break;
-	case ACP6X_DEV:
+	case ACP_RMB_PCI_ID:
 		pdm_addr = ACP_REMBRANDT_PDM_ADDR;
 		check_acp6x_config(chip);
 		break;
-	case ACP63_DEV:
+	case ACP63_PCI_ID:
 		pdm_addr = ACP63_PDM_ADDR;
 		check_acp6x_config(chip);
 		break;
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		pdm_addr = ACP70_PDM_ADDR;
 		check_acp70_config(chip);
 		break;
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index f7450a5bd103..4b6ad7abc3ba 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -77,27 +77,22 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 
 	res_acp = acp_res;
 	num_res = ARRAY_SIZE(acp_res);
-
+	chip->acp_rev = pci->revision;
 	switch (pci->revision) {
 	case 0x01:
 		chip->name = "acp_asoc_renoir";
-		chip->acp_rev = ACP3X_DEV;
 		break;
 	case 0x6f:
 		chip->name = "acp_asoc_rembrandt";
-		chip->acp_rev = ACP6X_DEV;
 		break;
 	case 0x63:
 		chip->name = "acp_asoc_acp63";
-		chip->acp_rev = ACP63_DEV;
 		break;
 	case 0x70:
 		chip->name = "acp_asoc_acp70";
-		chip->acp_rev = ACP70_DEV;
 		break;
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
-		chip->acp_rev = ACP71_DEV;
 		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index 22dd8988d005..48faafe724ed 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -47,7 +47,7 @@ static int acp_dmic_prepare(struct snd_pcm_substream *substream,
 	size_dmic = frames_to_bytes(substream->runtime,
 			substream->runtime->buffer_size);
 
-	if (chip->acp_rev >= ACP70_DEV)
+	if (chip->acp_rev >= ACP70_PCI_ID)
 		physical_addr = ACP7x_DMIC_MEM_WINDOW_START;
 	else
 		physical_addr = stream->reg_offset + MEM_WINDOW_START;
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 3a7a467b7063..c772520227c7 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -270,9 +270,9 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	stream->substream = substream;
 	chip = dev_get_platdata(dev);
 	switch (chip->acp_rev) {
-	case ACP63_DEV:
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP63_PCI_ID:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			runtime->hw = acp6x_pcm_hardware_playback;
 		else
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 396434a45eea..af6005888c82 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -197,7 +197,7 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (chip->acp_rev != ACP6X_DEV) {
+	if (chip->acp_rev != ACP_RMB_PCI_ID) {
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
 		return -ENODEV;
 	}
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 5e3f730aa6bf..65782023435e 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -157,7 +157,7 @@ static int renoir_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (chip->acp_rev != ACP3X_DEV) {
+	if (chip->acp_rev != ACP_RN_PCI_ID) {
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
 		return -ENODEV;
 	}
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index f325c374f228..099e2df5558d 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -207,7 +207,7 @@ static int acp63_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (chip->acp_rev != ACP63_DEV) {
+	if (chip->acp_rev != ACP63_PCI_ID) {
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
 		return -ENODEV;
 	}
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 68d2590e1a4e..0cd3daf677f5 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -175,8 +175,8 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	}
 
 	switch (chip->acp_rev) {
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		break;
 	default:
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
@@ -209,7 +209,7 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	adata->num_dai = ARRAY_SIZE(acp70_dai);
 	adata->rsrc = &rsrc;
 	adata->machines = snd_soc_acpi_amd_acp70_acp_machines;
-	if (chip->acp_rev == ACP70_DEV)
+	if (chip->acp_rev == ACP70_PCI_ID)
 		adata->platform = ACP70;
 	else
 		adata->platform = ACP71;
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 854269fea875..c82e438a1712 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -16,14 +16,9 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
 
+#include "acp_common.h"
 #include "chip_offset_byte.h"
 
-#define ACP3X_DEV			3
-#define ACP6X_DEV			6
-#define ACP63_DEV			0x63
-#define ACP70_DEV			0x70
-#define ACP71_DEV			0x71
-
 #define DMIC_INSTANCE			0x00
 #define I2S_SP_INSTANCE			0x01
 #define I2S_BT_INSTANCE			0x02
-- 
2.34.1


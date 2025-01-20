Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85735A16A5C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2040560260;
	Mon, 20 Jan 2025 11:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2040560260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367657;
	bh=WsN4egzqowCT/KyyuOQnj8hgfSs+Mq1vOSABbSdTlGo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dLEYp1kjUNwWlpGms2k7RSbbyLZaJLzOTbRQC1NsK9r74G9dLG4NflqrPPsrEr8rE
	 wTKu0UMcz14IMDIPcCue6MIYbQPlQXaMmoFEkca/lJvkJLYRLsQ4G7u9uKq/eJLcww
	 sIRQMrJebkqlQk4cKsFOrhjy3o9Rv9l9B0mKt9ZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5507BF805F4; Mon, 20 Jan 2025 11:06:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9EE0F80613;
	Mon, 20 Jan 2025 11:06:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06C56F805BB; Mon, 20 Jan 2025 11:02:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::61a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70CEDF8007E
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70CEDF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eVJO0kys
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkGIq7LiaV0GB9gJkmCqNQc8o0q13wLrZsusyTu/TJkJFRKJmxUg/UkVuHy+/dscElcS8fs+O1hCQelGBVT+YrMu0cDavhyj7berkTLLcrPALoqWwVosklDDxXcmHzVR7ZxZ1FPOUAQWJ5A0b85+LepHIZO5NBhXntAvRrMElzZBrnbQR7UcMPxGnZso2U1mkMBrGdNMdgXFgZkCF7kQCVBFvnHNjePzQB38qHVllPmMoFjegcZA//3aE3Yt4lfs4SdNXy1b7dRiy5mruP4uHLjaFjPW3PbkvSuolCz3eUlj7IeoU3iu+QN2oGMKrHflNu+u0AoCnNTnh35e+SRmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L07Lg19m2x85Ic42Hg2jv7JtDhhFVurFl/NxKaF31s=;
 b=FwRfD0z0EOuwbplWIA8+YrWfhTSu0oDy9pVpwzTKRE2SWvqeeXWg3xPaOnYPCIpN+vgHY2XF91G2vm5ZImNJAD1/iVWFrjMsGADft8sCG3BxGGJFp7E4SyvKDtb3pjMj1AjkwAf8lEjnbzijO60OzwlNNTfltjwgtUdmN2kvXh5krkaATH3hHsd6z+DILYctxVweVav8xAC2x8cVzd+zpgdHHuAdGezwO6bbhWulreWNF2KZOecA/HBMB3vnD9LfDEKYmDaEosMLf3DJGkBzDlsSOaHx1QbVeLlos0GxYfkxcQ6m9e7UQd7oRr5DaOFE9FcH9Gbb+kmJ9hScao9nsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L07Lg19m2x85Ic42Hg2jv7JtDhhFVurFl/NxKaF31s=;
 b=eVJO0kysB/0aENSNWZMAW8t1pnpcNRXErMofsXaI8IJ0KhBMtxscT8S5nF0ho/AHUaCgTujKgIsva9wY7SEuXhO94brBeVE5+gTr75u2f1cRKqbEW8q+Y8HU+3IhiMN9r+36N0vuxRuOskOt5+2G5PqNfQRCnPiDdwJT+SedjVk=
Received: from CH0P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::14)
 by SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:02:45 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::de) by CH0P223CA0004.outlook.office365.com
 (2603:10b6:610:116::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:44 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:41 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 17/23] ASoC: amd: acp70: add soundwire wake interrupt
 handling
Date: Mon, 20 Jan 2025 15:31:24 +0530
Message-ID: <20250120100130.3710412-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|SN7PR12MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 046eae51-a7d0-4052-2e0c-08dd393995fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N8qEYlxLkD4SoQV5kTycubxYsp76rFCzQQ3yySTG9x1kwZpaTuM/CjnWHn7o?=
 =?us-ascii?Q?sfXD6PsbbXQ7qPIY8cLq9UD0l2JytF56qwgwfdrW5qjEjkkzUHqTycQC4PFq?=
 =?us-ascii?Q?EGG3L0JwmhWYa34iwPquXtt2CQgeKp1QbyJCQrV4i75c5kbOVH4aFQVwGMOU?=
 =?us-ascii?Q?hEuUTiezglqcxHet1Hq9qn3CZoDKwpqDC2HsvrsNCcBY5Pmfsngov2HD/UWq?=
 =?us-ascii?Q?l2xtCgCnQlwSPLOvFDRYraR4/xw7EO5ArMRNQAf6CSa123iuSNlFmIV/u9bD?=
 =?us-ascii?Q?O3iInI7SdjqolgqJBuUmsyNn1uMjMUFY3b5v1IqRYdSXrKzJzXmOA+QH6mGH?=
 =?us-ascii?Q?6SIClVnrdC8pQZYIR9LigabtG6y+HmYsFLFo7ow+2/zKbGIHBi9FuJQXL87q?=
 =?us-ascii?Q?ApL4T2Pmtj7a0zgI/otQCyIttTCOTd/itrXoHyWeyEsDpLMrjafjz/ALa6UW?=
 =?us-ascii?Q?UkiqCg4buNdEJoW2U6u1kCE2Q9f+VJHX+RMnAbsBnbjpbzw3XsrSGcT3vE3n?=
 =?us-ascii?Q?mtplGCHJ6r42T0mWG4AOxrAawrPUignQf12x8oHsELPTsQGV2pVb1uCU85gS?=
 =?us-ascii?Q?PNrSsZ5zWrATk/kEnkqUMjRmJdURhxvNtAyh4qE+1Km9lSt9vdxBt7Q6XcpN?=
 =?us-ascii?Q?eWzpUg6JU71jnJg+3NHuNK0WOc4sqmc3PkNChdwyLxo1zODyqswPOzp87zDP?=
 =?us-ascii?Q?6+lStYN61UDN2lZAZ4uBiuOuSd8wOYfXWmqTXWwSq0HsqjCfORy5zerWS810?=
 =?us-ascii?Q?gXd3u+QN9eVByL/YgCQTG22NADfGdnVoCQSZ1Fsrq7wuKK/N4eB5nLVFs5vb?=
 =?us-ascii?Q?SSQ+zyAiNwVhOUxYCHD8TWPTNK7TFLMGCs0S7k+9p4+B4MUenPLvauHDotL3?=
 =?us-ascii?Q?entMplv7tSU0ct5/c4CJO96eiQ5DRcDAGVtoawK//gfjGKd3Dck+pB8ht7si?=
 =?us-ascii?Q?D2+FUl3oztIaD+HYWnCub5eicr0viByJoMi7DHIw565rZ26UV3jTX96BDAQy?=
 =?us-ascii?Q?yY9rLv1EWk8nQSb2w+5gFWtM0GuuWTcYgX7JNLGAheuHJ7x7uckMcHxTHwO4?=
 =?us-ascii?Q?ide29rqld5HLuFQhw2Mc2HtGP3N59ylqJIu0n4h05uMJvEMlEByuanOCfNij?=
 =?us-ascii?Q?llgYVHMMB56Jp9/Eqfgo4/nvJ6cj62lkPkA4tC1jkO6ZM7UmKmP/nXGcUoUB?=
 =?us-ascii?Q?7iP23AuAe1CnubI/OMbx3rd4Bqyb5Mx3oroQhSvvKYxC5VrGM4uZmQ6ndHt3?=
 =?us-ascii?Q?kBUB1q14gm5Icd8ayKmR3NwYGvIyPQVG2/fX5QKvvtyxyK3E/P6MromrhsD4?=
 =?us-ascii?Q?7XaSZtMaL1wEiIBDHFdE+VNZywlSkVq6MZsCCbYJ2lzZ1VW8QB/r2sLRBM8o?=
 =?us-ascii?Q?tVwT3/tgXPPYfv+0H0ESp1/CVuJMfvMf9hNOMxVhpLWto3GrV0HWmAlggRx7?=
 =?us-ascii?Q?iqiEi7y1/WVWKqWqFPDeuDTM4OmIfh0YWL0Ph1/hLw/zOj4Ri5lHGMjdbjKa?=
 =?us-ascii?Q?aaffKBAShCi8clw=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:44.7923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 046eae51-a7d0-4052-2e0c-08dd393995fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604
Message-ID-Hash: DO7EGCYI533YPBRLAIG3SIOWAVGDBHZ7
X-Message-ID-Hash: DO7EGCYI533YPBRLAIG3SIOWAVGDBHZ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DO7EGCYI533YPBRLAIG3SIOWAVGDBHZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For Soundwire wake event, SoundWire Host wake interrupt will be asserted
when ACP is in D0 state and SoundWire manager instance is in D3 state and
PME status is set when ACP is in D3 state and SoundWire manager instance
is in D3 state.

Add code to handle SoundWire PME status and host wake interrupts in
ACP7.0 interrupt handler.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  8 ++++++
 sound/soc/amd/acp70/pci-acp70.c | 51 +++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index c3b3b6c38902..ab4d6a5c1cd2 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -60,6 +60,10 @@
 
 #define ACP_SDW0_STAT			BIT(21)
 #define ACP_SDW1_STAT			BIT(2)
+#define ACP_SDW0_HOST_WAKE_STAT		BIT(24)
+#define ACP_SDW1_HOST_WAKE_STAT		BIT(25)
+#define ACP_SDW0_PME_STAT		BIT(26)
+#define ACP_SDW1_PME_STAT		BIT(27)
 #define ACP_ERROR_IRQ			BIT(29)
 
 #define ACP_AUDIO0_TX_THRESHOLD		0x1c
@@ -248,6 +252,8 @@ struct sdw_dma_dev_data {
  * @is_pdm_config: flat set to true when PDM configuration is selected from BIOS
  * @is_sdw_config: flag set to true when SDW configuration is selected from BIOS
  * @sdw_en_stat: flag set to true when any one of the SoundWire manager instance is enabled
+ * @sdw0_wake_event: flag set to true when wake irq asserted for SW0 instance
+ * @sdw1_wake_event: flag set to true when wake irq asserted for SW1 instance
  */
 
 struct acp70_dev_data {
@@ -270,6 +276,8 @@ struct acp70_dev_data {
 	bool is_pdm_config;
 	bool is_sdw_config;
 	bool sdw_en_stat;
+	bool sdw0_wake_event;
+	bool sdw1_wake_event;
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index 1e22be4f11bd..ff03fd493e98 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -99,6 +99,25 @@ static int acp70_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+static void handle_acp70_sdw_wake_event(struct acp70_dev_data *adata)
+{
+	struct amd_sdw_manager *amd_manager;
+
+	if (adata->sdw0_wake_event) {
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+		if (amd_manager && pm_runtime_suspended(amd_manager->dev))
+			pm_request_resume(amd_manager->dev);
+		adata->sdw0_wake_event = 0;
+	}
+
+	if (adata->sdw1_wake_event) {
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+		if (amd_manager && pm_runtime_suspended(amd_manager->dev))
+			pm_request_resume(amd_manager->dev);
+		adata->sdw1_wake_event = 0;
+	}
+}
+
 static irqreturn_t acp70_irq_thread(int irq, void *context)
 {
 	struct sdw_dma_dev_data *sdw_dma_data;
@@ -133,6 +152,7 @@ static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
 	u32 stream_id = 0;
 	u16 irq_flag = 0;
 	u16 sdw_dma_irq_flag = 0;
+	bool sdw_wake_irq = false;
 	u16 index;
 
 	adata = dev_id;
@@ -169,6 +189,37 @@ static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
 		irq_flag = 1;
 	}
 
+	if (ext_intr_stat1 & ACP_SDW0_HOST_WAKE_STAT) {
+		writel(ACP_SDW0_HOST_WAKE_STAT, adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->sdw0_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP_SDW1_HOST_WAKE_STAT) {
+		writel(ACP_SDW1_HOST_WAKE_STAT, adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->sdw1_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP_SDW0_PME_STAT) {
+		writel(0, adata->acp70_base + ACP_SW0_WAKE_EN);
+		writel(ACP_SDW0_PME_STAT, adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->sdw0_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP_SDW1_PME_STAT) {
+		writel(0, adata->acp70_base + ACP_SW1_WAKE_EN);
+		writel(ACP_SDW1_PME_STAT, adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->sdw1_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (sdw_wake_irq) {
+		handle_acp70_sdw_wake_event(adata);
+		irq_flag = 1;
+	}
+
 	if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
 		ps_pdm_data = dev_get_drvdata(&adata->pdm_dev->dev);
 		writel(BIT(PDM_DMA_STAT), adata->acp70_base + ACP_EXTERNAL_INTR_STAT);
-- 
2.34.1


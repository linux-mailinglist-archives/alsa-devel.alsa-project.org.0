Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DBA72374C
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 08:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B2F7847;
	Tue,  6 Jun 2023 08:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B2F7847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686031868;
	bh=S9LxC5cYWdS/1irnkjd6xwfsYaK7heShXc3EpqSDxxU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YOVLT+Jj7wM9b7q+OInfQAV7ZwK2f2KUyvoWEO8yKTcaI56vS2cZc0VskfZtDz5KR
	 exxxxyqyOGptSKrCZuRpNAsuSjR9CtNd7NaBex4qGJaG8ZiaPLRg+SBVl+wrqoLly9
	 zIeKn7BrorNum4qUWCdU+AqdXXkbz8IzibQd+/P8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ACDFF805AB; Tue,  6 Jun 2023 08:09:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 809DBF80568;
	Tue,  6 Jun 2023 08:09:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCD92F80548; Tue,  6 Jun 2023 08:03:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A48B2F80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 08:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A48B2F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h5tkuRSI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXxzhMq6QCQ2kiykVZg9kv7TWVcBoeUK12PCxeFP1qDLtCTyDnfOUpEBYE9wo8EnvVzchKEAxUrzTdaWcDaRSX4Nq/P/281WfMgjwFIwWyqcoRyrYoyUMTw1uecyk/qv/FU4H2VIz1jmA6KBYaMct6Cyt7BqvaFrLOPh0pgkxndWkphEALdEpVfORBbj1Y1Gj62bkZ01Xv2zhpSgYWqd/+jUTwUhkyCZ/ZliWDzIRDEybR96jmk6GxzT5NKpj1OJ+vEQVRnI4Me/V3DfKy8lSxAdNCGcDgneD903R7sYDEcTmUaL5xy4IcEueemp2BoKkeS5C804IWIU3nBP7F8tpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmmvwEK/xoq+OsitOkqTddADQxU14caofIr76SBsY1Y=;
 b=EBF5Y2C51OsxorZx3Bgbm2e89pCVgkWW4ZrYbVcI+Tqpy3haHy052ya74ll7dvkZmL8/zTcVbFuRME9sjfo2iaqgYVX7kwuQndGhDfBvvIFM2KLiVuBdsSAScjNHxBxqiJhpTy15PK6vtpbEZcP8ARkZzTPwsL399l53EMAKZ39+SXh2HcGvD11qAp/LiPqGVOkgxZLitsMUiX2pujeA4SVgZn/x72YQSa2OS3AqT+IvutRPIyqssrwsIDiqudhtzBki87TMmQISxgdza9vgguBotbn4J0qlf7hXb2ahRlVFni9ppcEG71SKwYGCW5cRm0/Cz3PwTwY1ui/Jx9zV1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmmvwEK/xoq+OsitOkqTddADQxU14caofIr76SBsY1Y=;
 b=h5tkuRSIPF43Sao4UxwRko22VUB8Mi96i13dgEJn5uPsaK7Pc0qsf1Aksp+rUZPYSRO6paQ7jahwViRVEoexnXjWjUzG+AjqC8Tb6mUirOJDYxAeH51VNhmu+20vRr0AL/de0gm6TFijWW8ogVZqNm8wQbnr91WFjIV3UNQEyUE=
Received: from DM6PR07CA0087.namprd07.prod.outlook.com (2603:10b6:5:337::20)
 by CH3PR12MB9026.namprd12.prod.outlook.com (2603:10b6:610:125::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 06:03:25 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::ab) by DM6PR07CA0087.outlook.office365.com
 (2603:10b6:5:337::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 06:03:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Tue, 6 Jun 2023 06:03:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 01:03:16 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 6 Jun 2023 01:03:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Mastan.Katragadda@amd.com>, <Arungopal.kondaveeti@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH V3 5/9] ASoC: amd: ps: add support for SoundWire DMA
 interrupts
Date: Tue, 6 Jun 2023 11:37:20 +0530
Message-ID: <20230606060724.2038680-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
References: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|CH3PR12MB9026:EE_
X-MS-Office365-Filtering-Correlation-Id: fe712fde-6723-4b92-ab6a-08db6653bdd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7eiZFvfR4WXVR/SEiYde8cKdBOZICIIYLc6b4tU50LCq8C0x8SujCfN0kmzT6coUcOYD/RmlG5ZRQ1vyckjr3c64uphjTezGD3pGvpwQzbehTgOdO5ngP844QVAt820pxKyJRmd5zl+o6TFDoy6NqvmKttad2HN80ClHdFMfpXJC3yEdKZY3drQMywFnjWfpPYUOQY7bVzO9Tb1ohFo6JcJXEa1GMo608WiAjDllfw95/R6TjaDk8fA9lm4wV4rbAtGhHaz4LCm0FIwDnZ9Zd1AsGIV9QcgmLkc55d4OIDSxx2LbAo21lH2iVzZogpMm5yfDMovlocq3B5NQHenXyLvRQh4q2IPHzQZRx6EV5tb6p5/T51RKTGKErwBePsSrwif7fK5xtPkLFD//sGRle4eaYurdpORmVogo4vYNILjhyv5rgEMnIt9xHyjU2hLhIkT8bGiLUYB3KtTM7nZg9+DJUbQXT1qgjn4bfwAng4wAzqIGcnxgGq5ERMkE/vlNqEmNQoND4rtCaF3+ueGl2rwpnlgQKe43bP5U0+s9nH197XHN5p+gVAC0q13k+nAjmMWJgBFIEEcVRN/RoX6wU8ov4xV+xpvYtuoZaZZ5UGdgzZg1OPHXRScmKRZS45zdnIH/tUm1k8N9qUMeGtEX5LgEfsquDnPcZSc7CDh3H9zCRo5inKgdcmcH+EIYCK9JQY+LBjFGylhSuAN68CXg5MBgNXDidfBdT9rzzuZkNCqYhN5A0uU6mClapo07xG4ZXgWXH4/RN6ecFL67Q6rbDg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(1076003)(40460700003)(26005)(36860700001)(36756003)(81166007)(47076005)(426003)(336012)(83380400001)(86362001)(82310400005)(82740400003)(356005)(186003)(2616005)(40480700001)(8676002)(4326008)(41300700001)(54906003)(2906002)(478600001)(70586007)(6916009)(8936002)(316002)(70206006)(5660300002)(7696005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 06:03:25.5269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe712fde-6723-4b92-ab6a-08db6653bdd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9026
Message-ID-Hash: BO6FE6E2RVBFQLT5KODVIR464MTIS4CZ
X-Message-ID-Hash: BO6FE6E2RVBFQLT5KODVIR464MTIS4CZ
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BO6FE6E2RVBFQLT5KODVIR464MTIS4CZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move to request_threaded_irq and use thread for handling
SoundWire DMA interrupts.
Whenever audio data equal to the SoundWire FIFO watermark level
are produced/consumed, interrupt is generated.
Acknowledge the interrupt and wake up the irq thread.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h  | 18 +++++++++
 sound/soc/amd/ps/pci-ps.c | 84 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 5779afdc8f02..c8ba0195846b 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -175,6 +175,20 @@ enum acp_pdev_mask {
 	ACP63_SDW_PDM_DEV_MASK,
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
+	ACP_SDW1_AUDIO1_TX,
+	ACP_SDW1_AUDIO1_RX,
+};
+
 struct pdm_stream_instance {
 	u16 num_pages;
 	u16 channels;
@@ -239,6 +253,8 @@ struct sdw_dma_ring_buf_reg {
  * @sdw0_dev_index: SoundWire Manager-0 platform device index
  * @sdw1_dev_index: SoundWire Manager-1 platform device index
  * @sdw_dma_dev_index: SoundWire DMA controller platform device index
+ * @sdw0-dma_intr_stat: DMA interrupt status array for SoundWire manager-SW0 instance
+ * @sdw_dma_intr_stat: DMA interrupt status array for SoundWire manager-SW1 instance
  * @acp_reset: flag set to true when bus reset is applied across all
  * the active SoundWire manager instances
  */
@@ -256,6 +272,8 @@ struct acp63_dev_data {
 	u16 sdw0_dev_index;
 	u16 sdw1_dev_index;
 	u16 sdw_dma_dev_index;
+	u16 sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
+	u16 sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
 	bool acp_reset;
 };
 
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 17e29a3e1c21..daf54fe9cafd 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -99,14 +99,44 @@ static int acp63_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+static irqreturn_t acp63_irq_thread(int irq, void *context)
+{
+	struct sdw_dma_dev_data *sdw_dma_data;
+	struct acp63_dev_data *adata = context;
+	u32 stream_index;
+	u16 pdev_index;
+
+	pdev_index = adata->sdw_dma_dev_index;
+	sdw_dma_data = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
+
+	for (stream_index = 0; stream_index < ACP63_SDW0_DMA_MAX_STREAMS; stream_index++) {
+		if (adata->sdw0_dma_intr_stat[stream_index]) {
+			if (sdw_dma_data->sdw0_dma_stream[stream_index])
+				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
+			adata->sdw0_dma_intr_stat[stream_index] = 0;
+		}
+	}
+	for (stream_index = 0; stream_index < ACP63_SDW1_DMA_MAX_STREAMS; stream_index++) {
+		if (adata->sdw1_dma_intr_stat[stream_index]) {
+			if (sdw_dma_data->sdw1_dma_stream[stream_index])
+				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
+			adata->sdw1_dma_intr_stat[stream_index] = 0;
+		}
+	}
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 {
 	struct acp63_dev_data *adata;
 	struct pdm_dev_data *ps_pdm_data;
 	struct amd_sdw_manager *amd_manager;
 	u32 ext_intr_stat, ext_intr_stat1;
+	u32 stream_id = 0;
 	u16 irq_flag = 0;
+	u16 sdw_dma_irq_flag = 0;
 	u16 pdev_index;
+	u16 index;
 
 	adata = dev_id;
 	if (!adata)
@@ -153,6 +183,56 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
 		irq_flag = 1;
 	}
+	if (ext_intr_stat & ACP_SDW_DMA_IRQ_MASK) {
+		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
+			if (ext_intr_stat & BIT(index)) {
+				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
+				switch (index) {
+				case ACP_AUDIO0_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO0_TX;
+					break;
+				case ACP_AUDIO1_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO1_TX;
+					break;
+				case ACP_AUDIO2_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO2_TX;
+					break;
+				case ACP_AUDIO0_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO0_RX;
+					break;
+				case ACP_AUDIO1_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO1_RX;
+					break;
+				case ACP_AUDIO2_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO2_RX;
+					break;
+				}
+
+				adata->sdw0_dma_intr_stat[stream_id] = 1;
+				sdw_dma_irq_flag = 1;
+			}
+		}
+	}
+
+	/* SDW1 BT RX */
+	if (ext_intr_stat1 & ACP_P1_AUDIO1_RX_THRESHOLD) {
+		writel(ACP_P1_AUDIO1_RX_THRESHOLD,
+		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->sdw1_dma_intr_stat[ACP_SDW1_AUDIO1_RX] = 1;
+		sdw_dma_irq_flag = 1;
+	}
+
+	/* SDW1 BT TX*/
+	if (ext_intr_stat1 & ACP_P1_AUDIO1_TX_THRESHOLD) {
+		writel(ACP_P1_AUDIO1_TX_THRESHOLD,
+		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->sdw1_dma_intr_stat[ACP_SDW1_AUDIO1_TX] = 1;
+		sdw_dma_irq_flag = 1;
+	}
+
+	if (sdw_dma_irq_flag)
+		return IRQ_WAKE_THREAD;
+
 	if (irq_flag)
 		return IRQ_HANDLED;
 	else
@@ -544,8 +624,8 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	ret = acp63_init(adata->acp63_base, &pci->dev);
 	if (ret)
 		goto release_regions;
-	ret = devm_request_irq(&pci->dev, pci->irq, acp63_irq_handler,
-			       irqflags, "ACP_PCI_IRQ", adata);
+	ret = devm_request_threaded_irq(&pci->dev, pci->irq, acp63_irq_handler,
+					acp63_irq_thread, irqflags, "ACP_PCI_IRQ", adata);
 	if (ret) {
 		dev_err(&pci->dev, "ACP PCI IRQ request failed\n");
 		goto de_init;
-- 
2.34.1


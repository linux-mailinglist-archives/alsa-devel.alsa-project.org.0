Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D60C70BFC6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 15:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5B79F6;
	Mon, 22 May 2023 15:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5B79F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684762149;
	bh=KzQCZFP8xR6AjVJ4LwsYVLK1bRK0L3KLDl5yjnna23A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kO/GB1HyGHdHqQPCy8I4aD0SaU/ABpiQvWndnNATn+RKXntOmKoEBQ0300FhUUeZ0
	 VkJFEHR6aRPLF8cuNx2UZxOKUmiQeASYmFvWvJTVHaGb00fA6vDvZlKskNngzhUdpH
	 mGS0ZFa7vZBGZGzaZcdTbTP5YWGgHaLwjVlDwqBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D4DBF805C7; Mon, 22 May 2023 15:27:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A204F805BB;
	Mon, 22 May 2023 15:27:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12E6AF805C4; Mon, 22 May 2023 15:27:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 568CCF805BA
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 15:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 568CCF805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hdv6bWQR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NG2xw7i3D8UBJ9tPn0tFmFnh5FZByNGVkhfwALmmSodjawhUj1PdraNb4mzivg3rFEARF9Tbm+QJkDxvNvp8Xtj4lV0Sh/on6DBl/rgqJIIEQTAuU6DrNuQl2jg2fcvDQPfuNQqzfvlUgrsAd5Snve8SO8jk1qEzG/g+GTXf7XAZRZKPWaRSOh7qiDk10zeYRFOfCxpmhFz6tPuEPXQkUN3zVoFcqg/d+KXkrE6jztBLTowzCSJkAlUWd1Gs9DElN5QwrdYfNpH0BUcUlPHsmtbhaJsA2LTIBoE/pac4wkhUrL0KUaGJQ+xGmW+puXYYDFZISuB48rp9f+PNGW7zRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZbxvAxYZC0EpswSIYqHHjUHd+fyDNp2Fy3fyBpR4L4=;
 b=PY3N8piMpkeI4AeFBc3BwF52Fe4E5MOjatxx3PVV4mzWxmAueJkT8SAf4dOj5ElZg5e1E9iF4dfN3h+8DRKbYGw1EjDhglXxtc4F+fchLOH30RHiuSTRuK8KKEZp8WcQnFIpr70EVmUve+5dVFuZyzM0bFSrI1EPuw/7WbGAM8hloDeHgSrtkyhUw6r5Wp1mV2iMiEfGPAK22n2slmoDirUNrJ5oruxQqMdBVv2Ju+yMEwrNprRZ1X1NAGBbbVAhKx0WtSSTzkiGN0ZyzaDHKGlcKHD6bcmniRn8mSQj5+Ri/ZoJcwc+UZIieVHJdQerSxoSFET+pcPjngaYws+gpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZbxvAxYZC0EpswSIYqHHjUHd+fyDNp2Fy3fyBpR4L4=;
 b=hdv6bWQRVOFjDz0JavZi0s0yL3r+wYuSfXzVtMnSjhGmCMAXj3C6l2FYURAyjxKAs1K9j9dYY55P5RRdhI58tA/1EkDZcVmCfNNFtlVI/1ff/6cgA9F/AYt3DUQ2S7JTq5AmgCq4ALI0JXV0AZKAFYdhAxVoOZdUCH3OGsHmdtE=
Received: from MW4PR03CA0071.namprd03.prod.outlook.com (2603:10b6:303:b6::16)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:27:02 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::21) by MW4PR03CA0071.outlook.office365.com
 (2603:10b6:303:b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 13:27:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.28 via Frontend Transport; Mon, 22 May 2023 13:27:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 08:27:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 08:27:00 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 22 May 2023 08:26:57 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Mastan.Katragadda@amd.com>, <Arungopal.kondaveeti@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 5/9] ASoC: amd: ps: add support for SoundWire DMA
 interrupts
Date: Mon, 22 May 2023 19:01:18 +0530
Message-ID: <20230522133122.166841-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 60dfc6bf-138b-4e20-1376-08db5ac83a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a7nXXbzDgGH3X1E4y1d8JJ6qRDLAPUwlq+2xmgUwV3DK5CpEC5u8+WAo3ZCMEDijv9jdB3E7v5FyTyAS0oNyKad0Aje/U426zinsve7AsjkE7TqbQmxK2Ehhuc+FNfMuJfFHFYJlNyLVMaB3xg5XYENtRyh2ebKS4Q8UbUqgcNtOBFv/ANW4+36/Pa+G/BB6qG3DG5E6jW6yEZn623h2rRTega9PEKNHPfE+LP0ltjgxhC1DVH8a/uD5TnZ6v68KK5VyoYnd902gu5gtxtQpmXBGYSfuwHY1woFVsa9COGoPmOEGu4g/nXfyfjF9FnqYymP2Pj26lqA4QiszDMHd2kr3MUBMUEYZCSRI+wp3klq6E6K4M2Rnb/j0a6MkNamb9x91b1gQIjAj16VSNLQXmzDf+ngs0Q9GKZ2xjvBnUZkygJbVi/9cC2UzYk4Y84dDfkwhlDTI7X5EHpcCUuutYEEayRIvyN3It+EqXLgSXF1QHJ3R6MTlCwoYyFBmZNH45lOC1Bv+rXDPCHynXUTOlonSQcwoFAqbTFO03TuEW5ZbIBSC+nIWEm6cbWFy7VgKqBranPIbj23HLlZ0SLCkt5WXuExcVy7hui/KdWZIiPX97dkjxfS6ZlaOVjwf84asY6MefZqy6DupLgZmI2AI70bovYz/Vp4tsg5kSLyXjzSrnY7VOz30a5GVz3eDL5yphpNq1qQJ90ydRHdq8MJyuiXgFws5Dwka3dIg3xt4dNizsiav+LbWvLf6zq2d9HCJDAxQwKIAtp2wkEYxQA06bA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(6666004)(316002)(478600001)(1076003)(26005)(54906003)(41300700001)(6916009)(4326008)(7696005)(70586007)(70206006)(40460700003)(8676002)(8936002)(5660300002)(82310400005)(40480700001)(86362001)(2906002)(83380400001)(47076005)(36860700001)(82740400003)(81166007)(186003)(36756003)(2616005)(356005)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 13:27:01.9281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60dfc6bf-138b-4e20-1376-08db5ac83a46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512
Message-ID-Hash: PADXZHKZRBVJ3R2ISHSGLGW47Z666SOP
X-Message-ID-Hash: PADXZHKZRBVJ3R2ISHSGLGW47Z666SOP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PADXZHKZRBVJ3R2ISHSGLGW47Z666SOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Initialize workqueue for SoundWire DMA interrupts handling.
Whenever audio data equal to the SoundWire FIFO watermark level
are produced/consumed, interrupt is generated.
Acknowledge the interrupt and schedule the workqueue.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h  | 20 +++++++++
 sound/soc/amd/ps/pci-ps.c | 87 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 37ae8f18225a..1a3e47fb9d02 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -173,6 +173,20 @@ enum acp_pdev_mask {
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
@@ -230,6 +244,7 @@ struct sdw_dma_ring_buf_reg {
  * @pdev: array of child platform device node structures
  * @acp_lock: used to protect acp common registers
  * @sdw_fw_node: SoundWire controller fw node handle
+ * @acp_sdw_dma_work: SoundWire DMA interrupts workqueue
  * @pdev_mask: platform device mask
  * @pdev_count: platform devices count
  * @pdm_dev_index: pdm platform device index
@@ -237,6 +252,8 @@ struct sdw_dma_ring_buf_reg {
  * @sdw0_dev_index: SoundWire Manager-0 platform device index
  * @sdw1_dev_index: SoundWire Manager-1 platform device index
  * @sdw_dma_dev_index: SoundWire DMA controller platform device index
+ * @sdw0-dma_intr_stat: DMA interrupt status array for SoundWire manager-SW0 instance
+ * @sdw_dma_intr_stat: DMA interrupt status array for SoundWire manager-SW1 instance
  * @acp_reset: flag set to true when bus reset is applied across all
  * the active SoundWire manager instances
  */
@@ -247,6 +264,7 @@ struct acp63_dev_data {
 	struct platform_device *pdev[ACP63_DEVS];
 	struct mutex acp_lock; /* protect shared registers */
 	struct fwnode_handle *sdw_fw_node;
+	struct work_struct acp_sdw_dma_work;
 	u16 pdev_mask;
 	u16 pdev_count;
 	u16 pdm_dev_index;
@@ -254,6 +272,8 @@ struct acp63_dev_data {
 	u16 sdw0_dev_index;
 	u16 sdw1_dev_index;
 	u16 sdw_dma_dev_index;
+	u16 sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
+	u16 sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
 	bool acp_reset;
 };
 
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 26514e340a33..c99ac5d90097 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -99,14 +99,44 @@ static int acp63_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+static void acp63_sdw_dma_workthread(struct work_struct *work)
+{
+	struct acp63_dev_data *adata = container_of(work, struct acp63_dev_data,
+						    acp_sdw_dma_work);
+	struct sdw_dma_dev_data *sdw_dma_data;
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
@@ -148,7 +178,57 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
 		irq_flag = 1;
 	}
-	if (irq_flag)
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
+		schedule_work(&adata->acp_sdw_dma_work);
+
+	if (irq_flag || sdw_dma_irq_flag)
 		return IRQ_HANDLED;
 	else
 		return IRQ_NONE;
@@ -231,6 +311,7 @@ static int get_acp63_device_config(u32 config, struct pci_dev *pci, struct acp63
 	sdw_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_SDW_ADDR, 0);
 	if (sdw_dev) {
 		acp_data->sdw_fw_node = acpi_fwnode_handle(sdw_dev);
+		INIT_WORK(&acp_data->acp_sdw_dma_work, acp63_sdw_dma_workthread);
 		ret = sdw_amd_scan_controller(&pci->dev);
 		/* is_sdw_dev flag will be set when SoundWire Manager device exists */
 		if (!ret)
@@ -610,6 +691,10 @@ static void snd_acp63_remove(struct pci_dev *pci)
 	int ret, index;
 
 	adata = pci_get_drvdata(pci);
+
+	if (adata->pdev_mask & ACP63_SDW_DEV_MASK)
+		cancel_work_sync(&adata->acp_sdw_dma_work);
+
 	for (index = 0; index < adata->pdev_count; index++)
 		platform_device_unregister(adata->pdev[index]);
 	ret = acp63_deinit(adata->acp63_base, &pci->dev);
-- 
2.34.1


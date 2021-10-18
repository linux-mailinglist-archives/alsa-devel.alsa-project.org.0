Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A77431734
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7F71932;
	Mon, 18 Oct 2021 13:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7F71932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556334;
	bh=DsfwoKR4XYmgCiWn+5aKwf50JqXz4nucL7a9RkkPmpE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+U0grKESd49QvCmL459K6ZfOoxpUVxsms+AbRwdxg5b/hPoARF+4prjJXoXHrYwq
	 U1Prm0RL5ifJKK7vEU1+yBL8lICh59VRS6d+4erllwpF6ZONn04aJIJZi3n3DZlHFk
	 ar6yxn1JOBSjOAJc38PIu/2D5oJkuy0/WAv9MMOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C3A3F804FA;
	Mon, 18 Oct 2021 13:22:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CCE8F804FA; Mon, 18 Oct 2021 13:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EECACF80253
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EECACF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ZBjLy+0v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3Iv2rY5QQkO17SDa5AAJ4REmFD57bzgaBynjspg1e4Qc3zPFt3d4qFdRJAXklfSKXaBqaYtSv0cBogx8mXOhXW1Z1wHM9yYk0RSCbKsq2EoVfE66k5HyrqPRCfbE72l3c9ZcHbtwCc8KiQStytio+DasRn4hsMMAo668xkxN0f1PEyg3r5XEBjCmj1s4KqsPo2dO2PEaLB1oU/Kg1yvimCtpURHwV7QsktFXXmesoe/UIeruAMxBUSlLmjZRSNAlZmN5TlrgKaVPN7wTe0eSbVEtX5EkH5mQ4nUFaa26195ZItffa4YLm2Eo4uv/n4O9w+7uGpgbRuMMtUF6A4qZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7P7HRvL58rwcVi1+NvKUZatbfIwyVdDMf8kMJgAC/I=;
 b=c4twGBk5lIHduFmYcQsE227Bzhp44g8QYIXmUPtmYy0wCJ/f54Ea449GTxlOhaE90V/o1DyoSITFVtlAR+3nav/w2xrTIwJe4TznrNxgIteCl2V/qnwXCdyI6iL/qQGmL6UOtsov/3wsd7+vN52eydU+DEo6l53YXY1zWVpOBULsjGrhnQVNDzS0STo3bMU8F+aM4Am1CAVaSbiXrf/r2XKqs7Rvky0ANQ75ByXP+2Nt2jePb+DSiBoREY4v8AmPvlWH5QWL9c9zljbXUJAEx+Apn9k6ITYDG21B2be7EpIKHCMe19rKrLjGWLjXByLiiUZS9HjYc7LwOmhHpHnl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7P7HRvL58rwcVi1+NvKUZatbfIwyVdDMf8kMJgAC/I=;
 b=ZBjLy+0v9kX7efcS/TXDSw53uVRPZ+xjiujrr8VjeuzzGvQz2I4mCX6pQNlDXbuMnV6w2PZRRMpySkl5ct5wlmDhKvwP4MYUTQaT+yBpvDpti0hlakbILPHwY5NK/adSIIC7JfdQj2oKkWblTq2nZFygjC0dtMwzDYi23YVyOh0=
Received: from DM5PR21CA0065.namprd21.prod.outlook.com (2603:10b6:3:129::27)
 by BL1PR12MB5378.namprd12.prod.outlook.com (2603:10b6:208:31d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 11:22:28 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:129:cafe::8c) by DM5PR21CA0065.outlook.office365.com
 (2603:10b6:3:129::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.1 via Frontend
 Transport; Mon, 18 Oct 2021 11:22:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:22:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:26 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:22:23 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 07/13] ASoC: amd: add acp6x pdm driver dma ops
Date: Mon, 18 Oct 2021 16:50:38 +0530
Message-ID: <20211018112044.1705805-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7351d875-5129-4462-cb93-08d992299152
X-MS-TrafficTypeDiagnostic: BL1PR12MB5378:
X-Microsoft-Antispam-PRVS: <BL1PR12MB537824BC8957C9BF502379A297BC9@BL1PR12MB5378.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDJlUN6BgSSIrPsO2irTodxbILCTrtWri2KEAf/55mAZ21t9edeaRFpICrOamtJNwxmTdtIbV/ZuzG8ptCFE2UvQpejAOSa31zA77egdiUfUNwNBsrPAicgNnapfDwQqa154TaBAKi1gAA1X1WZkYfVuBpBM8l9/t6OGmxOAWWLGpdrYR5oM7P6lbExs8ouvQbedsV6rOae3nUn9xw8wDlrDh5ZG0aOqp8Ni2pkxx0Q+OwjcY2cN7xPL+oQYZuK0mgkiEZlIF2rkapc4XEih/4j1xR6aKrl5HAeR2iBQWzvib9DmnqE3mufGii4C3Pjxq4Q9vncrAO6esBLA6CnAgTZWNSQB/P/6mnSuvWnnAlkVHLdrlnN6zOk6JQVvBk+p43LSZ7SL2jhQ61rp8bYdRCtbP/kwlQ8GWklYZRZNY2ZReZ1w/Y/o9gXEwzKeQVIku+2ykfZ4LKetX0WS7O2BXPsB9rwZ7emoRgreGD86b5AFgpGfpsxw0zz9Glz3IhAWNDUe1EhJ+CWLF9gLjlzA+aEiRU0wjmxPvpFwiJY5l954J9zpiHgRO15mcAx20sO5VfO4rslw/Bw+SbOG4+vODoSSJLaYBhd4/qfZeGgl6Xk7ZCVmToeObWDFM5m30ufnk0ZKZebrtuKuakVYrWmEV5UeLQXCxwp3wrVHghqNb9JXiGSMwNb8mNtS+nxGVAlu/mxAuqK1xe8dsto6ZzYerONhlI6OXPLOYOQP5ojuYkpgMc+4m9JxSiAjwxKL8ykclxI4ITkqB8hGikLdi7efhg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(54906003)(110136005)(47076005)(81166007)(7696005)(8676002)(186003)(2616005)(82310400003)(8936002)(70586007)(508600001)(6666004)(5660300002)(356005)(316002)(336012)(2906002)(426003)(36860700001)(4326008)(1076003)(36756003)(30864003)(83380400001)(86362001)(70206006)(26005)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:22:27.8213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7351d875-5129-4462-cb93-08d992299152
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5378
Cc: Sunil-kumar.Dommati@amd.com, mlimonci@amd.com, richgong@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds PDM driver DMA operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 310 +++++++++++++++++++++++++++++++
 sound/soc/amd/yc/acp6x.h         |  41 ++++
 2 files changed, 351 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 75228ce74da1..dc7c7ea5ea1a 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -17,6 +17,310 @@
 
 #define DRV_NAME "acp_yc_pdm_dma"
 
+static const struct snd_pcm_hardware acp6x_pdm_hardware_capture = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
+	.period_bytes_min = CAPTURE_MIN_PERIOD_SIZE,
+	.period_bytes_max = CAPTURE_MAX_PERIOD_SIZE,
+	.periods_min = CAPTURE_MIN_NUM_PERIODS,
+	.periods_max = CAPTURE_MAX_NUM_PERIODS,
+};
+
+static void acp6x_init_pdm_ring_buffer(u32 physical_addr, u32 buffer_size,
+				       u32 watermark_size, void __iomem *acp_base)
+{
+	acp6x_writel(physical_addr, acp_base + ACP_WOV_RX_RINGBUFADDR);
+	acp6x_writel(buffer_size, acp_base + ACP_WOV_RX_RINGBUFSIZE);
+	acp6x_writel(watermark_size, acp_base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
+	acp6x_writel(0x01, acp_base + ACPAXI2AXI_ATU_CTRL);
+}
+
+static void acp6x_enable_pdm_clock(void __iomem *acp_base)
+{
+	u32 pdm_clk_enable, pdm_ctrl;
+
+	pdm_clk_enable = ACP_PDM_CLK_FREQ_MASK;
+	pdm_ctrl = 0x00;
+
+	acp6x_writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
+	pdm_ctrl = acp6x_readl(acp_base + ACP_WOV_MISC_CTRL);
+	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
+	acp6x_writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);
+}
+
+static void acp6x_enable_pdm_interrupts(void __iomem *acp_base)
+{
+	u32 ext_int_ctrl;
+
+	ext_int_ctrl = acp6x_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl |= PDM_DMA_INTR_MASK;
+	acp6x_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void acp6x_disable_pdm_interrupts(void __iomem *acp_base)
+{
+	u32 ext_int_ctrl;
+
+	ext_int_ctrl = acp6x_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl &= ~PDM_DMA_INTR_MASK;
+	acp6x_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static bool acp6x_check_pdm_dma_status(void __iomem *acp_base)
+{
+	bool pdm_dma_status;
+	u32 pdm_enable, pdm_dma_enable;
+
+	pdm_dma_status = false;
+	pdm_enable = acp6x_readl(acp_base + ACP_WOV_PDM_ENABLE);
+	pdm_dma_enable = acp6x_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	if ((pdm_enable & ACP_PDM_ENABLE) && (pdm_dma_enable & ACP_PDM_DMA_EN_STATUS))
+		pdm_dma_status = true;
+
+	return pdm_dma_status;
+}
+
+static int acp6x_start_pdm_dma(void __iomem *acp_base)
+{
+	u32 pdm_enable;
+	u32 pdm_dma_enable;
+	int timeout;
+
+	pdm_enable = 0x01;
+	pdm_dma_enable  = 0x01;
+
+	acp6x_enable_pdm_clock(acp_base);
+	acp6x_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
+	acp6x_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	timeout = 0;
+	while (++timeout < ACP_COUNTER) {
+		pdm_dma_enable = acp6x_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		if ((pdm_dma_enable & 0x02) == ACP_PDM_DMA_EN_STATUS)
+			return 0;
+		udelay(DELAY_US);
+	}
+	return -ETIMEDOUT;
+}
+
+static int acp6x_stop_pdm_dma(void __iomem *acp_base)
+{
+	u32 pdm_enable, pdm_dma_enable;
+	int timeout;
+
+	pdm_enable = 0x00;
+	pdm_dma_enable  = 0x00;
+
+	pdm_enable = acp6x_readl(acp_base + ACP_WOV_PDM_ENABLE);
+	pdm_dma_enable = acp6x_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	if (pdm_dma_enable & 0x01) {
+		pdm_dma_enable = 0x02;
+		acp6x_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		timeout = 0;
+		while (++timeout < ACP_COUNTER) {
+			pdm_dma_enable = acp6x_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+			if ((pdm_dma_enable & 0x02) == 0x00)
+				break;
+			udelay(DELAY_US);
+		}
+		if (timeout == ACP_COUNTER)
+			return -ETIMEDOUT;
+	}
+	if (pdm_enable == ACP_PDM_ENABLE) {
+		pdm_enable = ACP_PDM_DISABLE;
+		acp6x_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
+	}
+	acp6x_writel(0x01, acp_base + ACP_WOV_PDM_FIFO_FLUSH);
+	return 0;
+}
+
+static void acp6x_config_dma(struct pdm_stream_instance *rtd, int direction)
+{
+	u16 page_idx;
+	u32 low, high, val;
+	dma_addr_t addr;
+
+	addr = rtd->dma_addr;
+	val = PDM_PTE_OFFSET;
+
+	/* Group Enable */
+	acp6x_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp6x_base +
+		     ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
+	acp6x_writel(PAGE_SIZE_4K_ENABLE, rtd->acp6x_base +
+		     ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
+	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
+		/* Load the low address of page int ACP SRAM through SRBM */
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+
+		acp6x_writel(low, rtd->acp6x_base + ACP_SCRATCH_REG_0 + val);
+		high |= BIT(31);
+		acp6x_writel(high, rtd->acp6x_base + ACP_SCRATCH_REG_0 + val + 4);
+		val += 8;
+		addr += PAGE_SIZE;
+	}
+}
+
+static int acp6x_pdm_dma_open(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime;
+	struct pdm_dev_data *adata;
+	struct pdm_stream_instance *pdm_data;
+	int ret;
+
+	runtime = substream->runtime;
+	adata = dev_get_drvdata(component->dev);
+	pdm_data = kzalloc(sizeof(*pdm_data), GFP_KERNEL);
+	if (!pdm_data)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		runtime->hw = acp6x_pdm_hardware_capture;
+
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(component->dev, "set integer constraint failed\n");
+		kfree(pdm_data);
+		return ret;
+	}
+
+	acp6x_enable_pdm_interrupts(adata->acp6x_base);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		adata->capture_stream = substream;
+
+	pdm_data->acp6x_base = adata->acp6x_base;
+	runtime->private_data = pdm_data;
+	return ret;
+}
+
+static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct pdm_stream_instance *rtd;
+	size_t size, period_bytes;
+
+	rtd = substream->runtime->private_data;
+	if (!rtd)
+		return -EINVAL;
+	size = params_buffer_bytes(params);
+	period_bytes = params_period_bytes(params);
+	rtd->dma_addr = substream->runtime->dma_addr;
+	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
+	acp6x_config_dma(rtd, substream->stream);
+	acp6x_init_pdm_ring_buffer(PDM_MEM_WINDOW_START, size,
+				   period_bytes, rtd->acp6x_base);
+	return 0;
+}
+
+static u64 acp6x_pdm_get_byte_count(struct pdm_stream_instance *rtd,
+				    int direction)
+{
+	union acp_pdm_dma_count byte_count;
+
+	byte_count.bcount.high =
+			acp6x_readl(rtd->acp6x_base + ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH);
+	byte_count.bcount.low =
+			acp6x_readl(rtd->acp6x_base + ACP_WOV_RX_LINEARPOSITIONCNTR_LOW);
+	return byte_count.bytescount;
+}
+
+static snd_pcm_uframes_t acp6x_pdm_dma_pointer(struct snd_soc_component *comp,
+					       struct snd_pcm_substream *stream)
+{
+	struct pdm_stream_instance *rtd;
+	u32 pos, buffersize;
+	u64 bytescount;
+
+	rtd = stream->runtime->private_data;
+	buffersize = frames_to_bytes(stream->runtime,
+				     stream->runtime->buffer_size);
+	bytescount = acp6x_pdm_get_byte_count(rtd, stream->stream);
+	if (bytescount > rtd->bytescount)
+		bytescount -= rtd->bytescount;
+	pos = do_div(bytescount, buffersize);
+	return bytes_to_frames(stream->runtime, pos);
+}
+
+static int acp6x_pdm_dma_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
+{
+	struct device *parent = component->dev->parent;
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       parent, MIN_BUFFER, MAX_BUFFER);
+	return 0;
+}
+
+static int acp6x_pdm_dma_close(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	struct pdm_dev_data *adata = dev_get_drvdata(component->dev);
+
+	acp6x_disable_pdm_interrupts(adata->acp6x_base);
+	adata->capture_stream = NULL;
+	return 0;
+}
+
+static int acp6x_pdm_dai_trigger(struct snd_pcm_substream *substream,
+				 int cmd, struct snd_soc_dai *dai)
+{
+	struct pdm_stream_instance *rtd;
+	int ret;
+	bool pdm_status;
+	unsigned int ch_mask;
+
+	rtd = substream->runtime->private_data;
+	ret = 0;
+	switch (substream->runtime->channels) {
+	case TWO_CH:
+		ch_mask = 0x00;
+		break;
+	default:
+		return -EINVAL;
+	}
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		acp6x_writel(ch_mask, rtd->acp6x_base + ACP_WOV_PDM_NO_OF_CHANNELS);
+		acp6x_writel(PDM_DECIMATION_FACTOR, rtd->acp6x_base +
+			     ACP_WOV_PDM_DECIMATION_FACTOR);
+		rtd->bytescount = acp6x_pdm_get_byte_count(rtd, substream->stream);
+		pdm_status = acp6x_check_pdm_dma_status(rtd->acp6x_base);
+		if (!pdm_status)
+			ret = acp6x_start_pdm_dma(rtd->acp6x_base);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		pdm_status = acp6x_check_pdm_dma_status(rtd->acp6x_base);
+		if (pdm_status)
+			ret = acp6x_stop_pdm_dma(rtd->acp6x_base);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static struct snd_soc_dai_ops acp6x_pdm_dai_ops = {
+	.trigger   = acp6x_pdm_dai_trigger,
+};
+
 static struct snd_soc_dai_driver acp6x_pdm_dai_driver = {
 	.capture = {
 		.rates = SNDRV_PCM_RATE_48000,
@@ -26,10 +330,16 @@ static struct snd_soc_dai_driver acp6x_pdm_dai_driver = {
 		.rate_min = 48000,
 		.rate_max = 48000,
 	},
+	.ops = &acp6x_pdm_dai_ops,
 };
 
 static const struct snd_soc_component_driver acp6x_pdm_component = {
 	.name		= DRV_NAME,
+	.open		= acp6x_pdm_dma_open,
+	.close		= acp6x_pdm_dma_close,
+	.hw_params	= acp6x_pdm_dma_hw_params,
+	.pointer	= acp6x_pdm_dma_pointer,
+	.pcm_construct	= acp6x_pdm_dma_new,
 };
 
 static int acp6x_pdm_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index 4ea37794db84..3f83de229409 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -27,6 +27,31 @@
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 #define PDM_DMA_STAT 0x10
 
+#define PDM_DMA_INTR_MASK	0x10000
+#define ACP_ERROR_STAT	29
+#define PDM_DECIMATION_FACTOR	2
+#define ACP_PDM_CLK_FREQ_MASK	7
+#define ACP_WOV_MISC_CTRL_MASK	0x10
+#define ACP_PDM_ENABLE		1
+#define ACP_PDM_DISABLE		0
+#define ACP_PDM_DMA_EN_STATUS	2
+#define TWO_CH		2
+#define DELAY_US	5
+#define ACP_COUNTER	20000
+
+#define ACP_SRAM_PTE_OFFSET	0x03800000
+#define PAGE_SIZE_4K_ENABLE	2
+#define PDM_PTE_OFFSET		0
+#define PDM_MEM_WINDOW_START	0x4000000
+
+#define CAPTURE_MIN_NUM_PERIODS     4
+#define CAPTURE_MAX_NUM_PERIODS     4
+#define CAPTURE_MAX_PERIOD_SIZE     8192
+#define CAPTURE_MIN_PERIOD_SIZE     4096
+
+#define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
+#define MIN_BUFFER MAX_BUFFER
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
@@ -52,6 +77,22 @@ struct pdm_dev_data {
 	struct snd_pcm_substream *capture_stream;
 };
 
+struct pdm_stream_instance {
+	u16 num_pages;
+	u16 channels;
+	dma_addr_t dma_addr;
+	u64 bytescount;
+	void __iomem *acp6x_base;
+};
+
+union acp_pdm_dma_count {
+	struct {
+	u32 low;
+	u32 high;
+	} bcount;
+	u64 bytescount;
+};
+
 static inline u32 acp6x_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
-- 
2.25.1


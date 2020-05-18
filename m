Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486E1D7FFC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:22:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333DB173A;
	Mon, 18 May 2020 19:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333DB173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822545;
	bh=jLwFtK/csV9DfuGb6qmfOcHdTFsqFVN2sqpyBYzKErY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VmrVVBv1zwIGqQb1pdr2hYg6n/s3htwiIa+hv1o55E0Xzyy/Tem3d/G+YJSUc9RH4
	 1xSMa6r3cjfhITvbAXUvjeq6HUkB738hHNA3DbZkrFSQXgFom9HC+gjz6UokUK45Q8
	 0Z23TUKpsh1636YFAF1pqiItc+HE+F45bBnJToL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ACF4F802E0;
	Mon, 18 May 2020 19:17:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9FC0F80213; Mon, 18 May 2020 19:17:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29AB1F80213
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29AB1F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="LSpNUwqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHTYswTgtCPGSdxpnfDM0xmNfuYQ957bSEXP23DXSLP1ZQyVHRGkacPNNZ+vzrFrcheXb3W6G9RoXCVALcCB5vHgkjGxrjS9WweXtD8YO2AbIbpbNYOLx2/SPETHLzDT/p7pXwOoOfkSfdX2GUOab8AOzUZm+yOai+ZDX5YZmKVguZqIe/URgQ7ofgp1sFzGEvvXMgE8JELK2OW6YG9wTdnAyl+Ygr547zK0EuyYaMzknl5SmfGz20Zd6iViDrv7DEQAvpiIorqzHMGjF8IqW6qAR9zErvs0BfEQMaEUR0EiG53KDPTjmpJw0cewFmarNZopvTT0B4eiHp9nF5hYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2IFhCrOv7HBYq0YMXJA07ZCZEGuMW53IP0NhL17iDI=;
 b=NMk9OF9+gV87LoYJNitw2LC8J8CAyamSPZcPOEB8Ggnh7fI65WKUmk/ZZ/O+YZaqzg+EI9o/VRgcAuc9Sl39a+PpWR1o0by6V20aae4XsmRngI9qLm1f8+1QhrYWZoKGZUWRpbkVrJGaAKPItmHkx6Y87cjPsj68JID3TBrIQNrhqJTOht2mivRQS0FRAcm3QT2lS57vNFT7S6MdTYaWWkkxvXnI/YEeaOGTkwkYuC6rhyg4gU0iBRIiFj3PtAJgX/jHr2WjcQfWUTarQn6yVKPIKxVyGUhPqhYlfliBBYcQuMg6VyZDvbcfPhAxALX2P3dAxM6nXVSl4YoFzmHT1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2IFhCrOv7HBYq0YMXJA07ZCZEGuMW53IP0NhL17iDI=;
 b=LSpNUwqkH9CLhvXtoS/F/yjqLTC5bQK4i6YrHtBadfFpOAZ2iV8I/hFvcO4WvpyfIPR+D3lYEnIkJmTi+glpYztc2VDm5fGOeTFpfo1ak9Y4wl90pUEPWCTaZU1qVDrGhzZyL1NZWmgiowfR11x8lzN9Z6vtSaQ1IaD2HKE2H18=
Received: from CO2PR06CA0059.namprd06.prod.outlook.com (2603:10b6:104:3::17)
 by DM5PR12MB1515.namprd12.prod.outlook.com (2603:10b6:4:6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Mon, 18 May 2020 17:17:21 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::ee) by CO2PR06CA0059.outlook.office365.com
 (2603:10b6:104:3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Mon, 18 May 2020 17:17:21 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:20 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:20 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:18 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 07/14] ASoC: amd: add acp3x pdm driver dma ops
Date: Tue, 19 May 2020 01:16:57 +0800
Message-ID: <20200518171704.24999-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(4326008)(8936002)(336012)(426003)(316002)(7696005)(82310400002)(2906002)(356005)(186003)(1076003)(36756003)(81166007)(82740400003)(5660300002)(70586007)(70206006)(110136005)(47076004)(478600001)(86362001)(26005)(6666004)(54906003)(2616005)(8676002)(42413003)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e83d37e6-3ddd-4424-30b1-08d7fb4f5316
X-MS-TrafficTypeDiagnostic: DM5PR12MB1515:
X-Microsoft-Antispam-PRVS: <DM5PR12MB151598F1FBB8A15D701D22E897B80@DM5PR12MB1515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +sOa8w0F59TZlstw73NpJIfMUOUNuIoH3ET0zeD3PErdHvOnYE5XYpxXs8aptsz1lsa3cfJIQFxI1NGlqZDGzY5mAA2RtDNuULgDRbOgTCOd2owFJPiT0H3WXwnzY9mewS7Wpc75O4zhxyv7P4Dli99YDdvLrkJOLvoMuqtwdYgBlSs+mMtoPccfYGXXg1IuU9NgT5X7D3I1Zqds4MPOB/bQ9rkTRXg2nozv6G0v861PDR3vFgDX+SnglxStgVk3Bai67ccJ3OflCotM6/F/m6VwIHjhd73wv9Ph2afhIkM/2NsKKCmBLTPdS+SsnxUaXFm+fHF4aboX2ERisk36t8QL6QPRmJdXWrlSxMtXFVYehUyeQO7ZECYreLSHN29chTthyQ6fKE63Cg/wpIwWIw7oV7pccSCNV5FWxqukXYE+g7ANJv3bWAcCyTZJCGLXEgq4fOPtS2vDRSzDlm0lhYulh4Ol6/p+Gl6yUnuM+6aieNYyJoSpQ8Zq3DgHSaaODIIYHRMk5nZgtTHEkFRYKWWEiNOzuoJvb8011prOk+GvfgX9oDHFrUTvUx3t66j1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:20.9456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e83d37e6-3ddd-4424-30b1-08d7fb4f5316
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1515
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 195 +++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |  29 ++++
 2 files changed, 224 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index fdac2c1e3acd..8bb03fa5b4a5 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -16,6 +16,25 @@
 
 #define DRV_NAME "acp_rn_pdm_dma"
 
+static const struct snd_pcm_hardware acp_pdm_hardware_capture = {
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
 static irqreturn_t pdm_irq_handler(int irq, void *dev_id)
 {
 	struct pdm_dev_data *rn_pdm_data;
@@ -41,6 +60,176 @@ static irqreturn_t pdm_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
+static void init_pdm_ring_buffer(u32 physical_addr,
+				 u32 buffer_size,
+				 u32 watermark_size,
+				 void __iomem *acp_base)
+{
+	rn_writel(physical_addr, acp_base + ACP_WOV_RX_RINGBUFADDR);
+	rn_writel(buffer_size, acp_base + ACP_WOV_RX_RINGBUFSIZE);
+	rn_writel(watermark_size, acp_base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
+	rn_writel(0x01, acp_base + ACPAXI2AXI_ATU_CTRL);
+}
+
+static void enable_pdm_interrupts(void __iomem *acp_base)
+{
+	u32 ext_int_ctrl;
+
+	ext_int_ctrl = rn_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl |= PDM_DMA_INTR_MASK;
+	rn_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void disable_pdm_interrupts(void __iomem *acp_base)
+{
+	u32 ext_int_ctrl;
+
+	ext_int_ctrl = rn_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl |= ~PDM_DMA_INTR_MASK;
+	rn_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void config_acp_dma(struct pdm_stream_instance *rtd, int direction)
+{
+	u16 page_idx;
+	u32 low, high, val;
+	dma_addr_t addr;
+
+	addr = rtd->dma_addr;
+	val = 0;
+
+	/* Group Enable */
+	rn_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp_base +
+		  ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
+	rn_writel(PAGE_SIZE_4K_ENABLE, rtd->acp_base +
+		  ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
+
+	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
+		/* Load the low address of page int ACP SRAM through SRBM */
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+
+		rn_writel(low, rtd->acp_base + ACP_SCRATCH_REG_0 + val);
+		high |= BIT(31);
+		rn_writel(high, rtd->acp_base + ACP_SCRATCH_REG_0 + val + 4);
+		val += 8;
+		addr += PAGE_SIZE;
+	}
+}
+
+static int acp_pdm_dma_open(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
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
+		runtime->hw = acp_pdm_hardware_capture;
+
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(component->dev, "set integer constraint failed\n");
+		kfree(pdm_data);
+		return ret;
+	}
+
+	enable_pdm_interrupts(adata->acp_base);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		adata->capture_stream = substream;
+
+	pdm_data->acp_base = adata->acp_base;
+	runtime->private_data = pdm_data;
+	return ret;
+}
+
+static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct pdm_stream_instance *rtd;
+	size_t size, period_bytes;
+
+	rtd = substream->runtime->private_data;
+	if (!rtd)
+		return -EINVAL;
+	size = params_buffer_bytes(params);
+	period_bytes = params_period_bytes(params);
+	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
+	config_acp_dma(rtd, substream->stream);
+	init_pdm_ring_buffer(MEM_WINDOW_START, size, period_bytes,
+			     rtd->acp_base);
+	return 0;
+}
+
+static u64 acp_pdm_get_byte_count(struct pdm_stream_instance *rtd,
+				  int direction)
+{
+	union acp_pdm_dma_count byte_count;
+
+	byte_count.bcount.high =
+			rn_readl(rtd->acp_base +
+				 ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH);
+	byte_count.bcount.low =
+			rn_readl(rtd->acp_base +
+				 ACP_WOV_RX_LINEARPOSITIONCNTR_LOW);
+	return byte_count.bytescount;
+}
+
+static snd_pcm_uframes_t acp_pdm_dma_pointer(struct snd_soc_component *comp,
+					     struct snd_pcm_substream *stream)
+{
+	struct pdm_stream_instance *rtd;
+	u32 pos, buffersize;
+	u64 bytescount;
+
+	rtd = stream->runtime->private_data;
+	buffersize = frames_to_bytes(stream->runtime,
+				     stream->runtime->buffer_size);
+	bytescount = acp_pdm_get_byte_count(rtd, stream->stream);
+	if (bytescount > rtd->bytescount)
+		bytescount -= rtd->bytescount;
+	pos = do_div(bytescount, buffersize);
+	return bytes_to_frames(stream->runtime, pos);
+}
+
+static int acp_pdm_dma_new(struct snd_soc_component *component,
+			   struct snd_soc_pcm_runtime *rtd)
+{
+	struct device *parent = component->dev->parent;
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       parent, MIN_BUFFER, MAX_BUFFER);
+	return 0;
+}
+
+static int acp_pdm_dma_mmap(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream,
+			    struct vm_area_struct *vma)
+{
+	return snd_pcm_lib_default_mmap(substream, vma);
+}
+
+static int acp_pdm_dma_close(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	struct pdm_dev_data *adata = dev_get_drvdata(component->dev);
+
+	disable_pdm_interrupts(adata->acp_base);
+	adata->capture_stream = NULL;
+	return 0;
+}
+
 static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 	.capture = {
 		.rates = SNDRV_PCM_RATE_48000,
@@ -55,6 +244,12 @@ static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 
 static const struct snd_soc_component_driver acp_pdm_component = {
 	.name		= DRV_NAME,
+	.open		= acp_pdm_dma_open,
+	.close		= acp_pdm_dma_close,
+	.hw_params	= acp_pdm_dma_hw_params,
+	.pointer	= acp_pdm_dma_pointer,
+	.mmap		= acp_pdm_dma_mmap,
+	.pcm_construct	= acp_pdm_dma_new,
 };
 
 static int acp_pdm_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 1ad8a7845fda..3536d24374f3 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -29,13 +29,42 @@
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 #define PDM_DMA_STAT 0x10
+#define PDM_DMA_INTR_MASK  0x10000
+#define ACP_ERROR_STAT 29
 
+#define ACP_SRAM_PTE_OFFSET	0x02050000
+#define PAGE_SIZE_4K_ENABLE     0x2
+#define MEM_WINDOW_START	0x4000000
+
+#define CAPTURE_MIN_NUM_PERIODS     4
+#define CAPTURE_MAX_NUM_PERIODS     4
+#define CAPTURE_MAX_PERIOD_SIZE     8192
+#define CAPTURE_MIN_PERIOD_SIZE     4096
+
+#define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
+#define MIN_BUFFER MAX_BUFFER
 struct pdm_dev_data {
 	u32 pdm_irq;
 	void __iomem *acp_base;
 	struct snd_pcm_substream *capture_stream;
 };
 
+struct pdm_stream_instance {
+	u16 num_pages;
+	u16 channels;
+	dma_addr_t dma_addr;
+	u64 bytescount;
+	void __iomem *acp_base;
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
 static inline u32 rn_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP_PHY_BASE_ADDRESS);
-- 
2.26.2


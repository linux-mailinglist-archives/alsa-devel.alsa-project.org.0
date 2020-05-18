Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F61D8002
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E62F175D;
	Mon, 18 May 2020 19:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E62F175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822630;
	bh=SmuWqsHQgBYc1mZUNM16UgUr8TU8HY9Vw76+wqUvMYw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Df2hnQnBGF0JET9nhhLcejDV/J3ZxOS55TfMv+73NLWb2XPcJRGs5GBetSIKhDY8x
	 TO7BJ617JA1xwExguVC3T6KOIpTHqLnKNUxRpcnCi+ahZy3FJMoMJ6pc2SWlGExUjE
	 +XdJJ/jWfcLK66m6mz8/dNRL0L9NzLgYvo9rSwcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4502F802FD;
	Mon, 18 May 2020 19:17:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3563BF802D2; Mon, 18 May 2020 19:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FAD9F802A7
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FAD9F802A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="RpYhoXyq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL2MDLAvPGSDLxkj7RkBF4Tiec7spJifuwK6k69r/5PD6rGtlmE/hJdAm5yz1w/DAUC+dhslVsHgCpsyW/pAXHxJxCK/Xn9k8gFgBiAi8lml85jP9HXN7/jAogdIokqxLwv7NXOkPtSnDPIwBThnkol756lO4YeAuwBFj2wCtxUhfzX/QG+LSqFKke3VP4WWCVhWh8JtTuSFabPhXnAZpEONahdvGe9YSiUoKbX2ZsvCCU3EzH3DV5p/PnApOn9UhC0eTnA/skuk7H5xmqYwDcL7DnDmCj7C0zPLLfacWn2icB+sB6IMjYo1UAR9XL5auHh9cUpiDopU04nlgyZluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4AMcxRGKmjPDc4PFWzXOy7ZjSYzAI+QERDBjgeC7Lw=;
 b=DYQQ3Gbm2PMi2L79A+ozXo9b/LE6Ehm6qYoaKv7tAvtF6mHKyd6W+kEeyT3to8Q0AadFVb52dj7oiopy+dxFFoLm4Rfs8HPVC3Tf0REWh9MUh2CiLxvfkcrppEbI666hRVk7C03TWED1XoEM6RfINhG4en/GxRDxp2Logz2kbAk9Eugj//DxoowmKKAQVdTUQsT7YPh33EMMCARURZ7VvXG7zrrwEwQG4ZAt530ynlfJ4SQqN55I7R8ptPp9MldHGQkN5Ef7zAcA2IbZc9qBTI6rInyOeun139w3+Lh2+P7YJjh2A0axhKh/owZ7edm3Wi7u4HFdhWtwsvqS64i2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4AMcxRGKmjPDc4PFWzXOy7ZjSYzAI+QERDBjgeC7Lw=;
 b=RpYhoXyqsfZUb/VOodHV/crxoo7MxZGNW05RMjcLogK64KLOWcYbwOWSGwAJyBW1j7ph8ig+QC8eJ8Vz1bQHSIcGhGWqRt3syKEbb/u/b70+31tTZPnd7Waau6jbhh7aKs24sXKr51TXpF2fZ2syVQfJRFirLEiE7/WDys0TxgU=
Received: from DM5PR21CA0034.namprd21.prod.outlook.com (2603:10b6:3:ed::20) by
 DM5PR12MB2566.namprd12.prod.outlook.com (2603:10b6:4:b4::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.27; Mon, 18 May 2020 17:17:23 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::d4) by DM5PR21CA0034.outlook.office365.com
 (2603:10b6:3:ed::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.5 via Frontend
 Transport; Mon, 18 May 2020 17:17:23 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:22 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:22 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:20 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Date: Tue, 19 May 2020 01:16:58 +0800
Message-ID: <20200518171704.24999-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966005)(47076004)(6666004)(26005)(1076003)(36756003)(82740400003)(5660300002)(186003)(7696005)(2616005)(8936002)(70206006)(70586007)(2906002)(82310400002)(356005)(86362001)(81166007)(110136005)(54906003)(316002)(478600001)(4326008)(336012)(426003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97aa8385-3ea2-416f-93ff-08d7fb4f5423
X-MS-TrafficTypeDiagnostic: DM5PR12MB2566:
X-Microsoft-Antispam-PRVS: <DM5PR12MB256654FC5BB9E184F5A946F297B80@DM5PR12MB2566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlwwM8EHy8baj85HLCpyqJzK2p6ARaEB5aLRI+zQOjFgueprcJFPFTkN6DXk52sjQ729tXEqa+9Z0fpEGHAueo1Wy3GPaQeMJqOHs0joS3qsvm8zok2MlF9AUj9ilSlx0h2KLMgWM/gmqxY8vqOKoFLaevzKsKvrzglIET3x83DNXEncdGFaIWWO/FUfyaI5IQo4sIHt0G8kGXFReRKUr+QAGfZTbEUrg2jLfNLVHMk25nSFhAubIRCHVG6x3GMmkENBE9cv1DsvCA1aeI1bcntTYllczgjuKsve613YRVh405qkAtly/IebaVVIGhkwmGnQWSFG9y7PXjef39rMN9Inc0tp8LPkzyxUHyMfY4DC9Mme25QLhxJYJpHb9WSb9awtwPXlOjFsGhK5ejA6nj5Q8nXmWZ88y1DtBPU56vpsxnMpEuhlPF587o4akTqq3PyOb86oGLGB6tKVsrlOS/KnSKLjia/wyqvltQQHuW8PAGNNGPLd8C2quaUFOoGOhih+LRuE8woXOp0+NKjP8w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:22.7920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97aa8385-3ea2-416f-93ff-08d7fb4f5423
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2566
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

This patch adds ACP3x PDM DMA driver DAI operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 149 +++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |   9 ++
 2 files changed, 158 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 8bb03fa5b4a5..fd19b17f553e 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -71,6 +71,27 @@ static void init_pdm_ring_buffer(u32 physical_addr,
 	rn_writel(0x01, acp_base + ACPAXI2AXI_ATU_CTRL);
 }
 
+static void config_pdm_stream_params(unsigned int ch_mask,
+				     void __iomem *acp_base)
+{
+	rn_writel(ch_mask, acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
+	rn_writel(PDM_DECIMATION_FACTOR, acp_base +
+		  ACP_WOV_PDM_DECIMATION_FACTOR);
+}
+
+static void enable_pdm_clock(void __iomem *acp_base)
+{
+	u32 pdm_clk_enable, pdm_ctrl;
+
+	pdm_clk_enable = ACP_PDM_CLK_FREQ_MASK;
+	pdm_ctrl = 0x00;
+
+	rn_writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
+	pdm_ctrl = rn_readl(acp_base + ACP_WOV_MISC_CTRL);
+	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
+	rn_writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);
+}
+
 static void enable_pdm_interrupts(void __iomem *acp_base)
 {
 	u32 ext_int_ctrl;
@@ -89,6 +110,77 @@ static void disable_pdm_interrupts(void __iomem *acp_base)
 	rn_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
 }
 
+static bool check_pdm_dma_status(void __iomem *acp_base)
+{
+	bool pdm_dma_status;
+	u32 pdm_enable, pdm_dma_enable;
+
+	pdm_dma_status = false;
+	pdm_enable = rn_readl(acp_base + ACP_WOV_PDM_ENABLE);
+	pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	if ((pdm_enable & ACP_PDM_ENABLE) && (pdm_dma_enable &
+	     ACP_PDM_DMA_EN_STATUS))
+		pdm_dma_status = true;
+	return pdm_dma_status;
+}
+
+static int start_pdm_dma(void __iomem *acp_base)
+{
+	u32 pdm_enable;
+	u32 pdm_dma_enable;
+	int timeout;
+
+	pdm_enable = 0x01;
+	pdm_dma_enable  = 0x01;
+
+	enable_pdm_clock(acp_base);
+	rn_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
+	rn_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	pdm_dma_enable = 0x00;
+	timeout = 0;
+	while (++timeout < ACP_COUNTER) {
+		pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		if ((pdm_dma_enable & 0x02) == ACP_PDM_DMA_EN_STATUS)
+			return 0;
+		udelay(DELAY_US);
+	}
+	return -ETIMEDOUT;
+}
+
+static int stop_pdm_dma(void __iomem *acp_base)
+{
+	u32 pdm_enable, pdm_dma_enable, pdm_fifo_flush;
+	int timeout;
+
+	pdm_enable = 0x00;
+	pdm_dma_enable  = 0x00;
+	pdm_fifo_flush = 0x00;
+
+	pdm_enable = rn_readl(acp_base + ACP_WOV_PDM_ENABLE);
+	pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	if (pdm_dma_enable & 0x01) {
+		pdm_dma_enable = 0x02;
+		rn_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		pdm_dma_enable = 0x00;
+		timeout = 0;
+		while (++timeout < ACP_COUNTER) {
+			pdm_dma_enable = rn_readl(acp_base +
+						  ACP_WOV_PDM_DMA_ENABLE);
+			if ((pdm_dma_enable & 0x02) == 0x00)
+				break;
+			udelay(DELAY_US);
+		}
+		if (timeout == ACP_COUNTER)
+			return -ETIMEDOUT;
+	}
+	if (pdm_enable == ACP_PDM_ENABLE) {
+		pdm_enable = ACP_PDM_DISABLE;
+		rn_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
+	}
+	rn_writel(0x01, acp_base + ACP_WOV_PDM_FIFO_FLUSH);
+	return 0;
+}
+
 static void config_acp_dma(struct pdm_stream_instance *rtd, int direction)
 {
 	u16 page_idx;
@@ -230,6 +322,62 @@ static int acp_pdm_dma_close(struct snd_soc_component *component,
 	return 0;
 }
 
+static int acp_pdm_dai_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct pdm_stream_instance *rtd;
+	unsigned int ch_mask;
+
+	rtd = substream->runtime->private_data;
+	switch (params_channels(params)) {
+	case TWO_CH:
+	default:
+		ch_mask = 0x00;
+		break;
+	}
+	config_pdm_stream_params(ch_mask, rtd->acp_base);
+	return 0;
+}
+
+static int acp_pdm_dai_trigger(struct snd_pcm_substream *substream,
+			       int cmd, struct snd_soc_dai *dai)
+{
+	struct pdm_stream_instance *rtd;
+	int ret;
+	bool pdm_status;
+
+	rtd = substream->runtime->private_data;
+	ret = 0;
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		rtd->bytescount = acp_pdm_get_byte_count(rtd,
+							 substream->stream);
+		pdm_status = check_pdm_dma_status(rtd->acp_base);
+		if (!pdm_status)
+			ret = start_pdm_dma(rtd->acp_base);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		pdm_status = check_pdm_dma_status(rtd->acp_base);
+		if (pdm_status)
+			ret = stop_pdm_dma(rtd->acp_base);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static struct snd_soc_dai_ops acp_pdm_dai_ops = {
+	.hw_params = acp_pdm_dai_hw_params,
+	.trigger   = acp_pdm_dai_trigger,
+};
+
 static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 	.capture = {
 		.rates = SNDRV_PCM_RATE_48000,
@@ -240,6 +388,7 @@ static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 		.rate_min = 48000,
 		.rate_max = 48000,
 	},
+	.ops = &acp_pdm_dai_ops,
 };
 
 static const struct snd_soc_component_driver acp_pdm_component = {
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 3536d24374f3..a4f654cf2df0 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -31,6 +31,15 @@
 #define PDM_DMA_STAT 0x10
 #define PDM_DMA_INTR_MASK  0x10000
 #define ACP_ERROR_STAT 29
+#define PDM_DECIMATION_FACTOR 0x2
+#define ACP_PDM_CLK_FREQ_MASK 0x07
+#define ACP_WOV_MISC_CTRL_MASK 0x10
+#define ACP_PDM_ENABLE 0x01
+#define ACP_PDM_DISABLE 0x00
+#define ACP_PDM_DMA_EN_STATUS 0x02
+#define TWO_CH 0x02
+#define DELAY_US 5
+#define ACP_COUNTER 20000
 
 #define ACP_SRAM_PTE_OFFSET	0x02050000
 #define PAGE_SIZE_4K_ENABLE     0x2
-- 
2.26.2


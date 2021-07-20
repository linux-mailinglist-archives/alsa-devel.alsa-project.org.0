Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB753CFF34
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83AB916A0;
	Tue, 20 Jul 2021 18:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83AB916A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798245;
	bh=WkpxgnkOgg2VXX62sRyJ2GE9K6KQQyTwuZJ3/DKeo9g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ez1A2bDEhxZWt5smRRkxkQe996ARUAscdalblt5KEW+FC03eJtFNsbBqqCdJrRoNA
	 JMMHbwm9WJP1S609UmssI9QcdgCLL7gF6fbp87GfwVh+ro14EZlSoV37DvAsqqYf67
	 Y5Ijece3UxQsAnTXXPlK7HBK5nwRJM9Qxx3JKZ1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7978DF800DA;
	Tue, 20 Jul 2021 18:21:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE9AEF8050F; Tue, 20 Jul 2021 18:21:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DB24F804FF
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB24F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="QoMs5O/4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJPpwKU9cvh1RJDmvaTVxYB/nYITv5fMD6z2J9wtzh0w7nxbNq+Nb/YKk4Wi7daUW7KxL+C+Bmv+YfwDl2XqQwO3r5LbxDZJB5rXpE6aKTmZKngrZNEBZD7ztL9wZ3iH6da0S1unZSygQ/wLXT5JIbrMaEdJE1GWR1pSNusiccVEujkYmxb9iPmE5YqdKPupsDTRqH48aQtBaycpRfgNQiZdwRAw7N4WZQOSZBbzJtKyHAiB0UNG3G063wK8PzjuGmX6uzPx1KF0MibhmU3YQk0rfxxYG/jfNbtsZShPcMJ7rBVmXUKTvxpVOEigvixC6B4T4WjLbLALi0KR1AymbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GNnyC4K70b3k0n5/4xTsJguxPYIppnNI6P3Ale4xnw=;
 b=lKXBcJR4k3VhIzzb6Qy7KAvi0uq5gsQDPI7ioiGsL+7yeFnxARAjypdHC7l+deKBeAyCcFam6DE2Qsn5/AeLVrOTjKQgR6w444MqfAdVGUQlvOVYx7DSl0k4BBwfdRWGQE21Naj4lh+Qpry2y9g5uYOrtZfcqxHdE6vHxKWEavgEnWZWgg34d7KwfJ7HklxelLqABLcvFl8O+6BS28AWixfRmWCejcZ/hZwSWl1TaIF3MumiSL9n+s/DP25KY5UQpvKfafla/sj+3fy+2O/qGOyPQ5Lm0BhChLkXa9welTKvPBWtlIX2sS3WclSbL7N5OUjAry+cx/dQnWhvhBwmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GNnyC4K70b3k0n5/4xTsJguxPYIppnNI6P3Ale4xnw=;
 b=QoMs5O/4fJh9nOfzk1GhCuVlngtJYPxEuRPNtIAS7seIkpY7LpvbouY8MSWo1bZB0GipFeC/BowZe0vUkgg5T7sGHCRfGR8c8Sifh7bniwoq3oFnZG0GwgpceQ8dMG8ZFXP9WZmYIL9nDcFAKAx5KnIsvjhFIDFfe/Xq89qlwDg=
Received: from MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::21)
 by BN8PR12MB3474.namprd12.prod.outlook.com (2603:10b6:408:46::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Tue, 20 Jul
 2021 16:21:13 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::8c) by MW4P223CA0016.outlook.office365.com
 (2603:10b6:303:80::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 16:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Tue, 20 Jul 2021 16:21:13 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:21:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 09:21:11 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:21:08 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 07/12] ASoC: amd: add ACP5x pcm dma driver ops
Date: Tue, 20 Jul 2021 22:07:27 +0530
Message-ID: <20210720163732.23003-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3507ed2-b097-4a5d-785a-08d94b9a648a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3474:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3474135814E496218D15D81097E29@BN8PR12MB3474.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mxviRJ7hKCRypV/PrDB1TV2cKkih+3PDK5f3j6yllEogLhy5RMr50brNNTEjz44phQYKwYXJEGH1N/5oefx4lve58TUIr85MRoZCGvQq2zLnxaYcf7ALdBIPD3TWrnLyo39h5++SKGRKvSbYY3RHmAubSxAu1AeLvQrNfnkdPmxF7iTjGIpYXgGcdtyshnLi8RW6oBV0Rc7/psvE9oAT2EhQ+tel+ddblvbvphoqCd3WSgZ0ge8R/3YQ4ghF6aL2/fljFX2u20oVj/XNASeShlY7Llne8h+L7uSwxxupTX0j7enpCFt42GEcKZDBf6ea6+3ekkMsRU5uZF2SoUQFEPbygBkXPXsZaydIhgrCeeDp7gq72gY9HAXm1Ky1y/hNKqBa71UXuVYG8OAYQb/qYwlice0CLz99MAPii70pgpuHtHwRLymivGI1IAxII7c/mbJjdMc7eWvCO0wyGV6wfcYSOcAiezDNJlwRU5L0ITg5E3I1EUvwuc24SpHkn9vS9NUwp7jwvdVmgeNOvjztUvxizU7LUacurRAWYtoEnsoOEWW/d4yT00W+I1xU+vwe5lUjgNal5e0Mxr2RuVD6q0eMU1BDwkkCeb3O48DlKWZX9yFPmBdJHfNN49E5Xruql9KABmADMfydWU31ROrL7A1lhC6uydTQ9Ehxey1YLMImfggacmehkxr974zbxkf+xqru/WdY+Jvr7K1xBiXjnxpOYw55L+ogvVo+YYSf5QxvFmiKkOh2/TpS50jFh9XVhOfjQPQMcU6b42VO84rt3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(8936002)(8676002)(5660300002)(316002)(6666004)(54906003)(36860700001)(82740400003)(26005)(81166007)(86362001)(110136005)(82310400003)(7696005)(186003)(83380400001)(36756003)(2616005)(70586007)(426003)(336012)(478600001)(47076005)(2906002)(4326008)(30864003)(1076003)(356005)(70206006)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:21:13.1630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3507ed2-b097-4a5d-785a-08d94b9a648a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3474
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

This patch adds ACP5x PCM driver DMA operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 305 +++++++++++++++++++++++++-
 sound/soc/amd/vangogh/acp5x.h         | 106 +++++++++
 2 files changed, 409 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 4bc32183297b..57a1a1f54155 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -17,8 +17,42 @@
 
 #define DRV_NAME "acp5x_i2s_dma"
 
-static const struct snd_soc_component_driver acp5x_i2s_component = {
-	.name		= DRV_NAME,
+static const struct snd_pcm_hardware acp5x_pcm_hardware_playback = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.rates = SNDRV_PCM_RATE_8000_96000,
+	.rate_min = 8000,
+	.rate_max = 96000,
+	.buffer_bytes_max = PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE,
+	.period_bytes_min = PLAYBACK_MIN_PERIOD_SIZE,
+	.period_bytes_max = PLAYBACK_MAX_PERIOD_SIZE,
+	.periods_min = PLAYBACK_MIN_NUM_PERIODS,
+	.periods_max = PLAYBACK_MAX_NUM_PERIODS,
+};
+
+static const struct snd_pcm_hardware acp5x_pcm_hardware_capture = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.rates = SNDRV_PCM_RATE_8000_96000,
+	.rate_min = 8000,
+	.rate_max = 96000,
+	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
+	.period_bytes_min = CAPTURE_MIN_PERIOD_SIZE,
+	.period_bytes_max = CAPTURE_MAX_PERIOD_SIZE,
+	.periods_min = CAPTURE_MIN_NUM_PERIODS,
+	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
 static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
@@ -65,6 +99,273 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
+static void config_acp5x_dma(struct i2s_stream_instance *rtd, int direction)
+{
+	u16 page_idx;
+	u32 low, high, val, acp_fifo_addr, reg_fifo_addr;
+	u32 reg_dma_size, reg_fifo_size;
+	dma_addr_t addr;
+
+	addr = rtd->dma_addr;
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			val = ACP_SRAM_HS_PB_PTE_OFFSET;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = ACP_SRAM_SP_PB_PTE_OFFSET;
+		}
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			val = ACP_SRAM_HS_CP_PTE_OFFSET;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = ACP_SRAM_SP_CP_PTE_OFFSET;
+		}
+	}
+	/* Group Enable */
+	acp_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp5x_base +
+		   ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
+	acp_writel(PAGE_SIZE_4K_ENABLE, rtd->acp5x_base +
+		   ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
+
+	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
+		/* Load the low address of page int ACP SRAM through SRBM */
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+
+		acp_writel(low, rtd->acp5x_base + ACP_SCRATCH_REG_0 + val);
+		high |= BIT(31);
+		acp_writel(high, rtd->acp5x_base + ACP_SCRATCH_REG_0 + val + 4);
+		/* Move to next physically contiguous page */
+		val += 8;
+		addr += PAGE_SIZE;
+	}
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			reg_dma_size = ACP_HS_TX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+					HS_PB_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
+			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
+			acp_writel(I2S_HS_TX_MEM_WINDOW_START,
+				   rtd->acp5x_base + ACP_HS_TX_RINGBUFADDR);
+			break;
+
+		case I2S_SP_INSTANCE:
+		default:
+			reg_dma_size = ACP_I2S_TX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+					SP_PB_FIFO_ADDR_OFFSET;
+			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR;
+			reg_fifo_size = ACP_I2S_TX_FIFOSIZE;
+			acp_writel(I2S_SP_TX_MEM_WINDOW_START,
+				   rtd->acp5x_base + ACP_I2S_TX_RINGBUFADDR);
+		}
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			reg_dma_size = ACP_HS_RX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+					HS_CAPT_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
+			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
+			acp_writel(I2S_HS_RX_MEM_WINDOW_START,
+				   rtd->acp5x_base + ACP_HS_RX_RINGBUFADDR);
+			break;
+
+		case I2S_SP_INSTANCE:
+		default:
+			reg_dma_size = ACP_I2S_RX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+					SP_CAPT_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = ACP_I2S_RX_FIFOADDR;
+			reg_fifo_size = ACP_I2S_RX_FIFOSIZE;
+			acp_writel(I2S_SP_RX_MEM_WINDOW_START,
+				   rtd->acp5x_base + ACP_I2S_RX_RINGBUFADDR);
+		}
+	}
+	acp_writel(DMA_SIZE, rtd->acp5x_base + reg_dma_size);
+	acp_writel(acp_fifo_addr, rtd->acp5x_base + reg_fifo_addr);
+	acp_writel(FIFO_SIZE, rtd->acp5x_base + reg_fifo_size);
+	acp_writel(BIT(I2S_RX_THRESHOLD) | BIT(HS_RX_THRESHOLD)
+		   | BIT(I2S_TX_THRESHOLD) | BIT(HS_TX_THRESHOLD),
+		   rtd->acp5x_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static int acp5x_dma_open(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime;
+	struct snd_soc_pcm_runtime *prtd;
+	struct i2s_dev_data *adata;
+	struct i2s_stream_instance *i2s_data;
+	int ret;
+
+	runtime = substream->runtime;
+	prtd = asoc_substream_to_rtd(substream);
+	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
+	adata = dev_get_drvdata(component->dev);
+
+	i2s_data = kzalloc(sizeof(*i2s_data), GFP_KERNEL);
+	if (!i2s_data)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		runtime->hw = acp5x_pcm_hardware_playback;
+	else
+		runtime->hw = acp5x_pcm_hardware_capture;
+
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(component->dev, "set integer constraint failed\n");
+		kfree(i2s_data);
+		return ret;
+	}
+	i2s_data->acp5x_base = adata->acp5x_base;
+	runtime->private_data = i2s_data;
+	return ret;
+}
+
+static int acp5x_dma_hw_params(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params)
+{
+	struct i2s_stream_instance *rtd;
+	struct snd_soc_pcm_runtime *prtd;
+	struct snd_soc_card *card;
+	struct acp5x_platform_info *pinfo;
+	struct i2s_dev_data *adata;
+	u64 size;
+
+	prtd = asoc_substream_to_rtd(substream);
+	card = prtd->card;
+	pinfo = snd_soc_card_get_drvdata(card);
+	adata = dev_get_drvdata(component->dev);
+	rtd = substream->runtime->private_data;
+
+	if (!rtd)
+		return -EINVAL;
+
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+			switch (rtd->i2s_instance) {
+			case I2S_HS_INSTANCE:
+				adata->play_stream = substream;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				adata->i2ssp_play_stream = substream;
+			}
+		} else {
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+			switch (rtd->i2s_instance) {
+			case I2S_HS_INSTANCE:
+				adata->capture_stream = substream;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				adata->i2ssp_capture_stream = substream;
+			}
+		}
+	} else {
+		dev_err(component->dev, "pinfo failed\n");
+	}
+	size = params_buffer_bytes(params);
+	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
+	config_acp5x_dma(rtd, substream->stream);
+	return 0;
+}
+
+static snd_pcm_uframes_t acp5x_dma_pointer(struct snd_soc_component *component,
+					   struct snd_pcm_substream *substream)
+{
+	struct i2s_stream_instance *rtd;
+	u32 pos;
+	u32 buffersize;
+	u64 bytescount;
+
+	rtd = substream->runtime->private_data;
+	buffersize = frames_to_bytes(substream->runtime,
+				     substream->runtime->buffer_size);
+	bytescount = acp_get_byte_count(rtd, substream->stream);
+	if (bytescount > rtd->bytescount)
+		bytescount -= rtd->bytescount;
+	pos = do_div(bytescount, buffersize);
+	return bytes_to_frames(substream->runtime, pos);
+}
+
+static int acp5x_dma_new(struct snd_soc_component *component,
+			 struct snd_soc_pcm_runtime *rtd)
+{
+	struct device *parent = component->dev->parent;
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       parent, MIN_BUFFER, MAX_BUFFER);
+	return 0;
+}
+
+static int acp5x_dma_mmap(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
+			  struct vm_area_struct *vma)
+{
+	return snd_pcm_lib_default_mmap(substream, vma);
+}
+
+static int acp5x_dma_close(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *prtd;
+	struct i2s_dev_data *adata;
+	struct i2s_stream_instance *ins;
+
+	prtd = asoc_substream_to_rtd(substream);
+	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
+	adata = dev_get_drvdata(component->dev);
+	ins = substream->runtime->private_data;
+	if (!ins)
+		return -EINVAL;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (ins->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			adata->play_stream = NULL;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			adata->i2ssp_play_stream = NULL;
+		}
+	} else {
+		switch (ins->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			adata->capture_stream = NULL;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			adata->i2ssp_capture_stream = NULL;
+		}
+	}
+	kfree(ins);
+	return 0;
+}
+
+static const struct snd_soc_component_driver acp5x_i2s_component = {
+	.name		= DRV_NAME,
+	.open		= acp5x_dma_open,
+	.close		= acp5x_dma_close,
+	.hw_params	= acp5x_dma_hw_params,
+	.pointer	= acp5x_dma_pointer,
+	.mmap		= acp5x_dma_mmap,
+	.pcm_construct	= acp5x_dma_new,
+};
+
 static int acp5x_audio_probe(struct platform_device *pdev)
 {
 	struct resource *res;
diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index a0d898e47bb8..929be9905e8e 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -6,6 +6,7 @@
  */
 
 #include "vg_chip_offset_byte.h"
+#include <sound/pcm.h>
 
 #define ACP5x_PHY_BASE_ADDRESS 0x1240000
 #define ACP_DEVICE_ID 0x15E2
@@ -37,6 +38,39 @@
 #define	HS_TX_THRESHOLD 24
 #define	HS_RX_THRESHOLD 23
 
+#define I2S_SP_INSTANCE                 1
+#define I2S_HS_INSTANCE                 2
+
+#define ACP_SRAM_PTE_OFFSET	0x02050000
+#define ACP_SRAM_SP_PB_PTE_OFFSET	0x0
+#define ACP_SRAM_SP_CP_PTE_OFFSET	0x100
+#define ACP_SRAM_HS_PB_PTE_OFFSET	0x200
+#define ACP_SRAM_HS_CP_PTE_OFFSET	0x300
+#define PAGE_SIZE_4K_ENABLE 0x2
+#define I2S_SP_TX_MEM_WINDOW_START	0x4000000
+#define I2S_SP_RX_MEM_WINDOW_START	0x4020000
+#define I2S_HS_TX_MEM_WINDOW_START	0x4040000
+#define I2S_HS_RX_MEM_WINDOW_START	0x4060000
+
+#define SP_PB_FIFO_ADDR_OFFSET		0x500
+#define SP_CAPT_FIFO_ADDR_OFFSET	0x700
+#define HS_PB_FIFO_ADDR_OFFSET		0x900
+#define HS_CAPT_FIFO_ADDR_OFFSET	0xB00
+#define PLAYBACK_MIN_NUM_PERIODS    2
+#define PLAYBACK_MAX_NUM_PERIODS    8
+#define PLAYBACK_MAX_PERIOD_SIZE    8192
+#define PLAYBACK_MIN_PERIOD_SIZE    1024
+#define CAPTURE_MIN_NUM_PERIODS     2
+#define CAPTURE_MAX_NUM_PERIODS     8
+#define CAPTURE_MAX_PERIOD_SIZE     8192
+#define CAPTURE_MIN_PERIOD_SIZE     1024
+
+#define MAX_BUFFER (PLAYBACK_MAX_PERIOD_SIZE * PLAYBACK_MAX_NUM_PERIODS)
+#define MIN_BUFFER MAX_BUFFER
+#define FIFO_SIZE 0x100
+#define DMA_SIZE 0x40
+#define FRM_LEN 0x100
+
 struct i2s_dev_data {
 	unsigned int i2s_irq;
 	void __iomem *acp5x_base;
@@ -46,6 +80,31 @@ struct i2s_dev_data {
 	struct snd_pcm_substream *i2ssp_capture_stream;
 };
 
+struct i2s_stream_instance {
+	u16 num_pages;
+	u16 i2s_instance;
+	u16 direction;
+	u16 channels;
+	u32 xfer_resolution;
+	u32 val;
+	dma_addr_t dma_addr;
+	u64 bytescount;
+	void __iomem *acp5x_base;
+};
+
+union acp_dma_count {
+	struct {
+		u32 low;
+		u32 high;
+	} bcount;
+	u64 bytescount;
+};
+
+struct acp5x_platform_info {
+	u16 play_i2s_instance;
+	u16 cap_i2s_instance;
+};
+
 /* common header file uses exact offset rather than relative
  * offset which requires subtraction logic from base_addr
  * for accessing ACP5x MMIO space registers
@@ -59,3 +118,50 @@ static inline void acp_writel(u32 val, void __iomem *base_addr)
 {
 	writel(val, base_addr - ACP5x_PHY_BASE_ADDRESS);
 }
+
+static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
+				     int direction)
+{
+	union acp_dma_count byte_count;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			byte_count.bcount.high =
+				acp_readl(rtd->acp5x_base +
+					  ACP_HS_TX_LINEARPOSCNTR_HIGH);
+			byte_count.bcount.low =
+				acp_readl(rtd->acp5x_base +
+					  ACP_HS_TX_LINEARPOSCNTR_LOW);
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			byte_count.bcount.high =
+				acp_readl(rtd->acp5x_base +
+					  ACP_I2S_TX_LINEARPOSCNTR_HIGH);
+			byte_count.bcount.low =
+				acp_readl(rtd->acp5x_base +
+					  ACP_I2S_TX_LINEARPOSCNTR_LOW);
+		}
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			byte_count.bcount.high =
+				acp_readl(rtd->acp5x_base +
+					  ACP_HS_RX_LINEARPOSCNTR_HIGH);
+			byte_count.bcount.low =
+				acp_readl(rtd->acp5x_base +
+					  ACP_HS_RX_LINEARPOSCNTR_LOW);
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			byte_count.bcount.high =
+				acp_readl(rtd->acp5x_base +
+					  ACP_I2S_RX_LINEARPOSCNTR_HIGH);
+			byte_count.bcount.low =
+				acp_readl(rtd->acp5x_base +
+					  ACP_I2S_RX_LINEARPOSCNTR_LOW);
+		}
+	}
+	return byte_count.bytescount;
+}
-- 
2.17.1


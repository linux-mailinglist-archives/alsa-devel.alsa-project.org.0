Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694D3CBCEF
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:46:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EA7A16E3;
	Fri, 16 Jul 2021 21:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EA7A16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626464762;
	bh=j8PGJ31yQj9M5HDxQmLD5godM2yXcIuyucami5XEjME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gN7FsmQSSuAWsJVDnvt+5Mnt1ocP9YglVzIVBEA5ujC29F4yHeeEvXE+SJInk7ZIO
	 vcID9CRbHSmZQDPfBwpQdeYJuA2nhtBW/qXuZtGu95ptjToyhYmbD0xoXikk159Wud
	 DNXtgdN3cdajzjh0bASn8ysRryAPbHnIW8A5Zu70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0266F804FD;
	Fri, 16 Jul 2021 21:43:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52968F804FD; Fri, 16 Jul 2021 21:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2041.outbound.protection.outlook.com [40.107.101.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0062CF804FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0062CF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Y5C+VYff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfiFzBtSX3h+2w5IICFDQGyR7DCQG2f4GZa4pOR0ZEbgWV0xHZe5IjeiaoqGM7owqnix3ZHidSbOJdiUAqfdw3jLs+1YggJRtjA3kOfP8R7cAwG93b5jFQgiLgb/WrzQl94Tz04yNdH4Jr/DOXhTiaSuU1dxbaNRJWUvs//Y+kf8mrUHM6wfGiM1Zs8hhnb4zu8R2F+S2kEYZGklA8TZS+KULkp+LvgVW6EB3iw4Bvzbvl9rgapTv45h3X3q+a7DnGvxbnLjFGoZKAjwfnvn2aOagLQCL+Ugt6vd2j3lv8mot9kWdcbuUojVoEeRZ9kJbgG16nP2B2aCbR8XG5UzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKgtEbfGjqUuP5sggGv3jIjnESOpyvfgdojiet7Vr8A=;
 b=ZfHH2i/YRO8XnkOeQnccsR5HqLqw+0FlxJZ45xVC1EVgxEf38K4TS5adBsAsHatt9n+OG+yddlQkEkd0DVdDh4XXB+MzMNgIvmRDXSAxafP1dvHSBpbH0wPkT/jBrK6YIZ6JLkeL1TQP2aHRxf0uw9f1frGLmXgXdbi8LwrSW9X/et9OtMGRkr+Pp/wDSemlQmTD/Ek13IWXYhqFPdibVqZFSWL/c3+SmvCP8bJ5XwQ1qnfKujw/yycTzqXoT1gwlhxuHMbuT91U2Txma2I/OW4GmD/OOG4KQrojU3YLw7FtPlNpNOyG+xdBzqUkro2KONA1ByHgfUXzdaAJtV0Rkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKgtEbfGjqUuP5sggGv3jIjnESOpyvfgdojiet7Vr8A=;
 b=Y5C+VYffeWTpQAWGNspcDi18GcD/Q55JNWuxkbnm13cKVM9llJs4rSU+6xel4qMSU+4EjJ32OdaQ2PxApEXrYd5PIhv6nqlQzGHfsWJI9bZzmH1t6h4opnL+eAkNqe+3ZfwpYXXE6R3Jk0qAOxTyTu1TQXehXqDOTzpQRSCu13Y=
Received: from MW4PR04CA0250.namprd04.prod.outlook.com (2603:10b6:303:88::15)
 by MN2PR12MB2877.namprd12.prod.outlook.com (2603:10b6:208:ae::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Fri, 16 Jul
 2021 19:43:23 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::73) by MW4PR04CA0250.outlook.office365.com
 (2603:10b6:303:88::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Fri, 16 Jul 2021 19:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 19:43:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:43:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:43:22 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 16 Jul 2021 14:43:14 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND V2 07/12] ASoC: amd: add ACP5x pcm dma driver ops
Date: Sat, 17 Jul 2021 09:30:54 +0530
Message-ID: <20210717040059.310410-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65c501a3-060e-4b11-8edf-08d94891f8c1
X-MS-TrafficTypeDiagnostic: MN2PR12MB2877:
X-Microsoft-Antispam-PRVS: <MN2PR12MB28773A9CEC5B63D403D1861F97119@MN2PR12MB2877.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zhAlZQQLNiOy5J7K6sP/nZRyOwxtwgeM2WjHz1hikQVQannFFbTWOdMPFrAfcjW0ClnOELSdEn5AyiPPqGxkkUhrTOf/XGT0+3IXI/MonzNWE/maE2ihAWjMK6I8f9i10i7/1jNPyGLtC6aK8Oac6zquu+AcYZLX/iKFhmcG0EmjT5lN1MozPZthTowUlQ/GNSH/JaVifHj+NBQMUN73CrVKoH7iVfsKqXYXASb0HrlkYFBEntU7ciQrB5VetixcmljJsTBXhpCP1/AxNhRqL8jMp6qH7yNRyUTGzaIz4wf8Ax3Y82Gax1iMdG5cRsSUoDzEnjLDLLDEZyZ0ct1821eNdlku52/kS++H6FA1BLozylqDHbm2umetMRK27zO87o/oOI+TqKmoX+YZga8Qje7gsGvFBr6Qu+elXpDwZMeRmqrnXM0unD3VGb6ixm3JhwvPXm0yFy2krZ5X2H7OD4Il/qJu4tP0/V2ZxH5QVYJwzy4uQeIdqSbnQrlHuB0XAP0kdcFkyaLVjOX2lb4j3DMp7AZETednDNmI10nLr8DpU16X4aWtD3Rm50x1EyGN3xNFKfVBxdV2t4YpSDLRI+Ba9sRHCq8iEtofwOq2ukKzCJnR7CYT4ejugWIzlDuTP46brvHsfD+dDvC7x7XOnzQ8zl/mfnl3fUUQsNM9gkKgMQh1jO4hn0clOo4BrtkE8vd5GrOVjRmiDSPk4upESii7DBxzt4RBcrS1UywUALZLwwmfvlnVjIkOakA4cdBlYdCKXUm9Be1ugDA4gpLrGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(36840700001)(46966006)(30864003)(70206006)(70586007)(2906002)(186003)(26005)(36756003)(478600001)(47076005)(86362001)(426003)(6666004)(336012)(82310400003)(81166007)(2616005)(83380400001)(356005)(82740400003)(5660300002)(8676002)(8936002)(54906003)(4326008)(1076003)(316002)(110136005)(7696005)(36860700001)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 19:43:22.8909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c501a3-060e-4b11-8edf-08d94891f8c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

From: Vijendar Mukunda <vijendar.mukunda@amd.com>

This patch adds ACP5x PCM driver DMA operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 ->v2: fixed indetation issue and used dev_err instead of pr_err
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 305 +++++++++++++++++++++++++-
 sound/soc/amd/vangogh/acp5x.h         | 106 +++++++++
 2 files changed, 409 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 76a965a8ec3c..a2bd53dc86b9 100644
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
@@ -67,6 +101,273 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
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
index 18df2b5a4283..b7bd5cb1906d 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -6,6 +6,7 @@
  */
 
 #include "vg_chip_offset_byte.h"
+#include <sound/pcm.h>
 
 #define ACP5x_PHY_BASE_ADDRESS 0x1240000
 #define ACP_DEVICE_ID 0x15E2
@@ -36,6 +37,39 @@
 #define	HS_TX_THRESHOLD 24
 #define	HS_RX_THRESHOLD 23
 
+#define I2S_SP_INSTANCE                 0x01
+#define I2S_HS_INSTANCE                 0x02
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
@@ -45,6 +79,31 @@ struct i2s_dev_data {
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
  * offset which requires substraction logic from base_addr
  * for accessing ACP5x MMIO space registers
@@ -58,3 +117,50 @@ static inline void acp_writel(u32 val, void __iomem *base_addr)
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
2.25.1


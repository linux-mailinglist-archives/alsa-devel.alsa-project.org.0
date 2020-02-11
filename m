Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C0158FA7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 14:16:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53AA85D;
	Tue, 11 Feb 2020 14:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53AA85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581427017;
	bh=n2xXvkckEyyF7sKL82ptpBObBLJD1zuVTJ1ZbaclUNI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WB/ZwtuPwE14wY1nOB+a8KEq18WKH/Rh7zgtj/aTLUNDoomZwEzfqCoMlDVwXlkHb
	 CkI3NlRHOp/3eVHsAA9RAs1+S+dSYFGTKeaPh7GumTASxviaspwjZTZdLWSuKUZ8ce
	 41D0lqXz5zcNiVFXI/HFPx1xsTTemZaB9mCHwmas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC0E6F8013D;
	Tue, 11 Feb 2020 14:15:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF8B6F80145; Tue, 11 Feb 2020 14:15:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 424B0F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 14:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 424B0F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Rxb0aqCA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGFZdLw4yhAwo7JEI9G6AB/XyRuvF33XPXfWueVhpbm7nTQEeiNu6nf5Al8vrT1R9hbsR1lDTHMB7oGosT4u/UBnzTC/tez9tOzA/9Ltsuw3LP8xKl2rWVbrPQWeO8Ss0Cp1ogypXI6IklPHkNIUt5xhj4vkuZ0spIzoX1LCrp9CcOtFNoQmWt7AcF6b0ikvWdD5vy/Jiw/vfgZunJuAVHZl55+anbWy3bIsS3j9j2+xlXwNpnjcXzVsDc8awl7ZSl4x1aOwpIdtJpnavGDAKlIvplWb+QrgtdQMOvmPl3KCFNMoyFjNrz1wIarvaOiGDJL6m1OAL1ty3gSm3iHCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtCyoG3S19+HEBXd1vO0E8dxMwf4RutRwh58bgELnJ8=;
 b=Qlw+Y5pq3tVB44dv2Lnzhk84agPCc2nb4bajc7FBBi//85wfZ0hAFiRiwv0i1FJugVjm7n+N8sNCVslKKhlpMmfyZuWIYuudXXv8G4IGV47YjgpwO00SfSQZeMjJ1jPjFjTEw7mpIZWVcHdEeoaEq2rWP06r99dT209xd9nwaS7ck98rw/5Q1mo9ceaWvQ6nXNU/BkkerQ/yYB+3nYudkTNQsA+lYwKhpj8ZzsA1cHv4z02oYwyRaK2lvucCFOF6XBq/4XxLMZAzKjWSuT7Qm2F9ybAThbwclndW8j8Kq+HxMqPCCOl5Wlg5g0MPsV73pXUlyIeLElJqhVJAKI1NwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtCyoG3S19+HEBXd1vO0E8dxMwf4RutRwh58bgELnJ8=;
 b=Rxb0aqCAik2BxV9jslltG4AyvXi98UTZ27tdpF8aubADqZdmqeRzaBsn7HfH+anQYY3pBfDJymXlvCazKKjSrWNRFDbWvzVUSSU30rRn5aqhnQgaM5RsNIgvPCUrJWF9VKq7n2f2YQqUMxd3qhJRGp+Qf3ryzIvfU17iQTzviTQ=
Received: from MWHPR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:301:4a::21) by DM6PR12MB3881.namprd12.prod.outlook.com
 (2603:10b6:5:148::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.28; Tue, 11 Feb
 2020 13:15:05 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::203) by MWHPR1201CA0011.outlook.office365.com
 (2603:10b6:301:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Tue, 11 Feb 2020 13:15:05 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2707.21 via Frontend Transport; Tue, 11 Feb 2020 13:15:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 11 Feb
 2020 07:15:04 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 11 Feb
 2020 07:15:04 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 11 Feb 2020 07:15:00 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 11 Feb 2020 18:42:28 +0530
Message-ID: <1581426768-8937-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(428003)(189003)(199004)(81156014)(81166006)(109986005)(426003)(36756003)(86362001)(8936002)(316002)(7696005)(6666004)(70206006)(70586007)(54906003)(8676002)(186003)(356004)(2616005)(478600001)(4326008)(7416002)(26005)(336012)(2906002)(5660300002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3881; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4185146-1515-4b1c-2536-08d7aef468e0
X-MS-TrafficTypeDiagnostic: DM6PR12MB3881:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3881B793BCDFD9393B50EF75E7180@DM6PR12MB3881.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 0310C78181
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95ZTNplCBs7/PodsaTaMYQ+A3MKThoGTaGKBTiFu1ZK8zdTZuhQ1XdiBmM4dlUkXF40DEGZKV1+/MJI1+jTKWd80u8prqrF9x+xdApbWdh4S081JMzOUCU31H2a8RULIqR7eNvf32W2LzSEqGscLZdsCZ5J1lWAdASr3R2f7Ta0iIR0vKU+bgvrJh1MJKWRhEDSZK1TOaO0CxJyyqxOvWBbORuoC2q9/7Wzp+2vUxzDOV77zySPUZ2UouBHti1be/NxWsPY63Wpi6OJCvZw7iqq3Pol2o3KPwlJf/+TbEZTy0YTvBxMGYPs20SU4X2BOxn5BkNHm44buWIjTmpWhocX24DrfaSvWv1GD3NNcItSSEeIOsVPynCsiEO+kfSZlH1U2UmdVk+zvhSl2XFHdQLWZb7YTAx84W60ajX9VlP/lzZK4IVhNW60XebL/j1aO22GEBj518HVsTXA3ey9DvjDB0fNrfuS+1o9dgWkr+oM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 13:15:05.0014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4185146-1515-4b1c-2536-08d7aef468e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3881
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu
 vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
Subject: [alsa-devel] [PATCH] ASoC: amd: Buffer Size instead of MAX Buffer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Because of MAX BUFFER size in register,when user/app give small
buffer size produces noise of old data in buffer.
This patch rectifies this noise when using different
buffer sizes less than MAX BUFFER.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c     | 8 ++++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c | 7 +------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 31cd400..91a3881 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -170,6 +170,7 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	struct snd_soc_card *card;
 	struct acp3x_platform_info *pinfo;
 	u32 ret, val, period_bytes, reg_val, ier_val, water_val;
+	u32 buf_size, buf_reg;
 
 	prtd = substream->private_data;
 	rtd = substream->runtime->private_data;
@@ -183,6 +184,8 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	}
 	period_bytes = frames_to_bytes(substream->runtime,
 			substream->runtime->period_size);
+	buf_size = frames_to_bytes(substream->runtime,
+			substream->runtime->buffer_size);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -196,6 +199,7 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 					mmACP_BT_TX_INTR_WATERMARK_SIZE;
 				reg_val = mmACP_BTTDM_ITER;
 				ier_val = mmACP_BTTDM_IER;
+				buf_reg = mmACP_BT_TX_RINGBUFSIZE;
 				break;
 			case I2S_SP_INSTANCE:
 			default:
@@ -203,6 +207,7 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 					mmACP_I2S_TX_INTR_WATERMARK_SIZE;
 				reg_val = mmACP_I2STDM_ITER;
 				ier_val = mmACP_I2STDM_IER;
+				buf_reg = mmACP_I2S_TX_RINGBUFSIZE;
 			}
 		} else {
 			switch (rtd->i2s_instance) {
@@ -211,6 +216,7 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 					mmACP_BT_RX_INTR_WATERMARK_SIZE;
 				reg_val = mmACP_BTTDM_IRER;
 				ier_val = mmACP_BTTDM_IER;
+				buf_reg = mmACP_BT_RX_RINGBUFSIZE;
 				break;
 			case I2S_SP_INSTANCE:
 			default:
@@ -218,9 +224,11 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 					mmACP_I2S_RX_INTR_WATERMARK_SIZE;
 				reg_val = mmACP_I2STDM_IRER;
 				ier_val = mmACP_I2STDM_IER;
+				buf_reg = mmACP_I2S_RX_RINGBUFSIZE;
 			}
 		}
 		rv_writel(period_bytes, rtd->acp3x_base + water_val);
+		rv_writel(buf_size, rtd->acp3x_base + buf_reg);
 		val = rv_readl(rtd->acp3x_base + reg_val);
 		val = val | BIT(0);
 		rv_writel(val, rtd->acp3x_base + reg_val);
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index aecc3c0..d62c0d9 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -110,7 +110,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 {
 	u16 page_idx;
 	u32 low, high, val, acp_fifo_addr, reg_fifo_addr;
-	u32 reg_ringbuf_size, reg_dma_size, reg_fifo_size;
+	u32 reg_dma_size, reg_fifo_size;
 	dma_addr_t addr;
 
 	addr = rtd->dma_addr;
@@ -157,7 +157,6 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
-			reg_ringbuf_size = mmACP_BT_TX_RINGBUFSIZE;
 			reg_dma_size = mmACP_BT_TX_DMA_SIZE;
 			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
 						BT_PB_FIFO_ADDR_OFFSET;
@@ -169,7 +168,6 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 
 		case I2S_SP_INSTANCE:
 		default:
-			reg_ringbuf_size = mmACP_I2S_TX_RINGBUFSIZE;
 			reg_dma_size = mmACP_I2S_TX_DMA_SIZE;
 			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
 						SP_PB_FIFO_ADDR_OFFSET;
@@ -181,7 +179,6 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 	} else {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
-			reg_ringbuf_size = mmACP_BT_RX_RINGBUFSIZE;
 			reg_dma_size = mmACP_BT_RX_DMA_SIZE;
 			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
 						BT_CAPT_FIFO_ADDR_OFFSET;
@@ -193,7 +190,6 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 
 		case I2S_SP_INSTANCE:
 		default:
-			reg_ringbuf_size = mmACP_I2S_RX_RINGBUFSIZE;
 			reg_dma_size = mmACP_I2S_RX_DMA_SIZE;
 			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
 						SP_CAPT_FIFO_ADDR_OFFSET;
@@ -203,7 +199,6 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 				rtd->acp3x_base + mmACP_I2S_RX_RINGBUFADDR);
 		}
 	}
-	rv_writel(MAX_BUFFER, rtd->acp3x_base + reg_ringbuf_size);
 	rv_writel(DMA_SIZE, rtd->acp3x_base + reg_dma_size);
 	rv_writel(acp_fifo_addr, rtd->acp3x_base + reg_fifo_addr);
 	rv_writel(FIFO_SIZE, rtd->acp3x_base + reg_fifo_size);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

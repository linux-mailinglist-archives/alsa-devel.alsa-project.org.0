Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD861C8356
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 09:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BC1217F5;
	Thu,  7 May 2020 09:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BC1217F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588835972;
	bh=l/69gPcatMDSLbjjBsky73LE8GrfsaWuoK68d2VrpJw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YNKNq489Jjceb5ialOd4DcPuZxNEEnZbeUbL8kYl8tA3ZwQNcRoFWpdUyTd+U3R6q
	 UeDu/zgFvvGWlJo5KspC4DkaGrghX4yv0kSO6ql2/xVKAwHV6bEoMEJak7by9e+ph4
	 avqFgeaS3/Lru9KXOQ2rViPSRqx5QydC7zX8/rmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EECBF80299;
	Thu,  7 May 2020 09:16:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F7BF8015F; Thu,  7 May 2020 08:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07924F800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 08:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07924F800AD
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4C5D4A87EB3CBC1BFCE0;
 Thu,  7 May 2020 14:33:21 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 14:33:14 +0800
From: Samuel Zou <zou_wei@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH -next] ASoC: amd: acp3x-pcm-dma: Use bitwise instead of
 arithmetic operator for flags
Date: Thu, 7 May 2020 14:39:22 +0800
Message-ID: <1588833562-14417-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 07 May 2020 09:16:08 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Samuel Zou <zou_wei@huawei.com>
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

Fix the following coccinelle warnings:

sound/soc/amd/raven/acp3x-pcm-dma.c:161:39-40: WARNING: sum of probable bitmasks, consider |
sound/soc/amd/raven/acp3x-pcm-dma.c:172:39-40: WARNING: sum of probable bitmasks, consider |
sound/soc/amd/raven/acp3x-pcm-dma.c:183:39-40: WARNING: sum of probable bitmasks, consider |
sound/soc/amd/raven/acp3x-pcm-dma.c:194:39-40: WARNING: sum of probable bitmasks, consider |

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index e362f0b..b0cc0fe 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -158,7 +158,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			reg_dma_size = mmACP_BT_TX_DMA_SIZE;
-			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET |
 						BT_PB_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = mmACP_BT_TX_FIFOADDR;
 			reg_fifo_size = mmACP_BT_TX_FIFOSIZE;
@@ -169,7 +169,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 		case I2S_SP_INSTANCE:
 		default:
 			reg_dma_size = mmACP_I2S_TX_DMA_SIZE;
-			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET |
 						SP_PB_FIFO_ADDR_OFFSET;
 			reg_fifo_addr =	mmACP_I2S_TX_FIFOADDR;
 			reg_fifo_size = mmACP_I2S_TX_FIFOSIZE;
@@ -180,7 +180,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			reg_dma_size = mmACP_BT_RX_DMA_SIZE;
-			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET |
 						BT_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = mmACP_BT_RX_FIFOADDR;
 			reg_fifo_size = mmACP_BT_RX_FIFOSIZE;
@@ -191,7 +191,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 		case I2S_SP_INSTANCE:
 		default:
 			reg_dma_size = mmACP_I2S_RX_DMA_SIZE;
-			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET |
 						SP_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = mmACP_I2S_RX_FIFOADDR;
 			reg_fifo_size = mmACP_I2S_RX_FIFOSIZE;
-- 
2.6.2


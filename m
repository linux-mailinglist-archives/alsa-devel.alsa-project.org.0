Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 398F23752B0
	for <lists+alsa-devel@lfdr.de>; Thu,  6 May 2021 12:58:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B376984B;
	Thu,  6 May 2021 12:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B376984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620298711;
	bh=odXIwjmvO4TjkheT5uUkH9rWzyN7m+vEEmZvqNYXprg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZcRooF2kjRs0pymgzyW1zY171LCZEC016CLSKs0RzhljQJeYsBFLVgsFUwp+99oww
	 dZGtqLeevtL+03bl4wj/17wfE0qp4Pd5vBVvMQwYcjRNfXvaVFj57DxHlr0ThWEab/
	 mzHORJBn1weLdmGFBQaACJjrpRW1Gdk9b6JNUXoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 305A4F80139;
	Thu,  6 May 2021 12:57:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4C68F8021C; Thu,  6 May 2021 12:57:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0812F80108
 for <alsa-devel@alsa-project.org>; Thu,  6 May 2021 12:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0812F80108
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0UXyl1SF_1620298592; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UXyl1SF_1620298592) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 06 May 2021 18:56:50 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: amd: renoir: Remove redundant assignment to pdm_ctrl
 and pdm_enable and pdm_dma_enable
Date: Thu,  6 May 2021 18:56:30 +0800
Message-Id: <1620298590-29749-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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

Variable pdm_ctrl and pdm_enable and pdm_dma_enable are set to '0x00',
but they are overwritten later on, so these are redundant assignments
that can be removed.

Clean up the following clang-analyzer warning:

sound/soc/amd/renoir/acp3x-pdm-dma.c:148:2: warning: Value stored to
'pdm_dma_enable' is never read [clang-analyzer-deadcode.DeadStores].

sound/soc/amd/renoir/acp3x-pdm-dma.c:147:2: warning: Value stored to
'pdm_enable' is never read [clang-analyzer-deadcode.DeadStores].

sound/soc/amd/renoir/acp3x-pdm-dma.c:80:2: warning: Value stored to
'pdm_ctrl' is never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 4c2810e..bd20622b 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -77,7 +77,6 @@ static void enable_pdm_clock(void __iomem *acp_base)
 	u32 pdm_clk_enable, pdm_ctrl;
 
 	pdm_clk_enable = ACP_PDM_CLK_FREQ_MASK;
-	pdm_ctrl = 0x00;
 
 	rn_writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
 	pdm_ctrl = rn_readl(acp_base + ACP_WOV_MISC_CTRL);
@@ -144,9 +143,6 @@ static int stop_pdm_dma(void __iomem *acp_base)
 	u32 pdm_enable, pdm_dma_enable;
 	int timeout;
 
-	pdm_enable = 0x00;
-	pdm_dma_enable  = 0x00;
-
 	pdm_enable = rn_readl(acp_base + ACP_WOV_PDM_ENABLE);
 	pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
 	if (pdm_dma_enable & 0x01) {
-- 
1.8.3.1


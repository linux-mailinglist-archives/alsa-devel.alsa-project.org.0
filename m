Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 997875968C4
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 07:42:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D99100;
	Wed, 17 Aug 2022 07:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D99100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660714965;
	bh=cl8ZqxUrsT5YnydS2t1cAVuZuPKj8w73/lvUlJNf+J0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lMmwtks3fjy0lTO7qPgQWFN+r8BhzSm96sfUCNd6HMsAukFrkJOpK2SqPnzcLjixg
	 JgE1jpKizZSf70IqD5X7BG0So/Mr7y11bxzfIz7/2j6BKzY7tjuieEwLI3lUgf84TC
	 JZ09QGxLtLcndEy3Tksr9JipyxJty4LfPPgFhSoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45398F800DA;
	Wed, 17 Aug 2022 07:41:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5272DF8025C; Wed, 17 Aug 2022 07:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAD3BF80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 07:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD3BF80088
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 31AE41A1A83;
 Wed, 17 Aug 2022 07:41:38 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EC0291A1A2E;
 Wed, 17 Aug 2022 07:41:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 71091180031E;
 Wed, 17 Aug 2022 13:41:36 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
Date: Wed, 17 Aug 2022 13:24:27 +0800
Message-Id: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

The FIFO reset drops the words in the FIFO, which may cause
channel swap when SAI module is running, especially when the
DMA speed is low. So it is not good to do FIFO reset in ISR,
then remove the operation.

Fixes: e2681a1bf5ae ("ASoC: fsl_sai: Add isr to deal with error flag")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d430eece1d6b..a7fa6f0bf83d 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -114,11 +114,8 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	if (flags & FSL_SAI_CSR_SEF)
 		dev_dbg(dev, "isr: Tx Frame sync error detected\n");
 
-	if (flags & FSL_SAI_CSR_FEF) {
+	if (flags & FSL_SAI_CSR_FEF)
 		dev_dbg(dev, "isr: Transmit underrun detected\n");
-		/* FIFO reset for safety */
-		xcsr |= FSL_SAI_CSR_FR;
-	}
 
 	if (flags & FSL_SAI_CSR_FWF)
 		dev_dbg(dev, "isr: Enabled transmit FIFO is empty\n");
@@ -148,11 +145,8 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	if (flags & FSL_SAI_CSR_SEF)
 		dev_dbg(dev, "isr: Rx Frame sync error detected\n");
 
-	if (flags & FSL_SAI_CSR_FEF) {
+	if (flags & FSL_SAI_CSR_FEF)
 		dev_dbg(dev, "isr: Receive overflow detected\n");
-		/* FIFO reset for safety */
-		xcsr |= FSL_SAI_CSR_FR;
-	}
 
 	if (flags & FSL_SAI_CSR_FWF)
 		dev_dbg(dev, "isr: Enabled receive FIFO is full\n");
-- 
2.34.1


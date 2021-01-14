Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3332F6217
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 14:36:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28E9116E6;
	Thu, 14 Jan 2021 14:35:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28E9116E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610631385;
	bh=C4/BMPDLZuQhXBNzb/wAtZHZe6z8pjCIHVfq3HdvhIs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nba+kjQY0+j9C2gqoUE4oEOgRMYrL10qS716YVktaPljFjBVPHSXRH1xY/IAG1yp+
	 tFeION+4SZxR9madcIFwa8SMIqUKqEIqk9Df19Rzcojj/MU/xEWHvmyAauQOeze/Ju
	 vDJ8xwvspdx5awJjOs/BVryy5a+EyiPaCtt7Be4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 316AEF804AB;
	Thu, 14 Jan 2021 14:33:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACB2DF804AB; Thu, 14 Jan 2021 14:33:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94EB9F80134
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 14:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94EB9F80134
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E11A5ADE5;
 Thu, 14 Jan 2021 13:33:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: SOF: intel: Simplify with
 dma_set_mask_and_coherent()
Date: Thu, 14 Jan 2021 14:33:36 +0100
Message-Id: <20210114133337.1039-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114133337.1039-1-tiwai@suse.de>
References: <20210114133337.1039-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

ASoC Intel SOF driver still has explicit calls of dma_set_mask() and
dma_set_coherent_mask().

Let's simplify with dma_set_mask_and_coherent().

Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/intel/hda.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 509a9b256423..7e703ce22fcd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -809,13 +809,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	sdev->mailbox_bar = HDA_DSP_BAR;
 
 	/* allow 64bit DMA address if supported by H/W */
-	if (!dma_set_mask(&pci->dev, DMA_BIT_MASK(64))) {
-		dev_dbg(sdev->dev, "DMA mask is 64 bit\n");
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(64));
-	} else {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64))) {
 		dev_dbg(sdev->dev, "DMA mask is 32 bit\n");
-		dma_set_mask(&pci->dev, DMA_BIT_MASK(32));
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32));
+		dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
 	}
 
 	/* init streams */
-- 
2.26.2


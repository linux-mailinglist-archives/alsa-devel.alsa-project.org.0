Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9312C2BBDF6
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Nov 2020 09:18:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AD4516D3;
	Sat, 21 Nov 2020 09:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AD4516D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605946721;
	bh=7oZgV1V8QvtNNs1hT5Sg2EoL+hYdVaDhCVp2FmBiFSQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vSrX2wlfgADWqYWpUluGZKBHzUl8Z+ow66Ag28+th71KA2u4q9O+FXwx8YPI3ybTQ
	 JFXE70kF7VmQmv3mumSKaYXjCJL1i6snUYOfGMBbT10HeTSm1zuF4gMYOLiSRsb5ip
	 dATRj4Ds4HuOEeukh9gjGvc4HQzN82PFmRVcq4qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91146F801F5;
	Sat, 21 Nov 2020 09:17:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51D65F80157; Sat, 21 Nov 2020 09:17:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5B2F80166
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 09:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5B2F80166
Received: from localhost.localdomain ([81.185.161.242]) by mwinf5d61 with ME
 id uwGk2300J5E5lq903wGkm7; Sat, 21 Nov 2020 09:16:46 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Nov 2020 09:16:46 +0100
X-ME-IP: 81.185.161.242
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: perex@perex.cz,
	tiwai@suse.com,
	dan.carpenter@oracle.com
Subject: [PATCH] ALSA: emu10k1: Use dma_set_mask_and_coherent to simplify code
Date: Sat, 21 Nov 2020 09:16:32 +0100
Message-Id: <20201121081632.1330159-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

With at it replace the 'card->dev' parameter passed to a 'dev_err()' call
by an equivalent '&pci->dev' which is more consistent with the test just
one line above.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/pci/emu10k1/emu10k1x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index def8161cde4c..f2b6fd434474 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -894,9 +894,9 @@ static int snd_emu10k1x_create(struct snd_card *card,
 
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
-	if (pci_set_dma_mask(pci, DMA_BIT_MASK(28)) < 0 ||
-	    pci_set_consistent_dma_mask(pci, DMA_BIT_MASK(28)) < 0) {
-		dev_err(card->dev, "error to set 28bit mask DMA\n");
+
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28)) < 0) {
+		dev_err(&pci->dev, "error to set 28bit mask DMA\n");
 		pci_disable_device(pci);
 		return -ENXIO;
 	}
-- 
2.27.0


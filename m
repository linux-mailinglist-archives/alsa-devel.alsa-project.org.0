Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488F2BBE1C
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Nov 2020 09:39:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A65E816D3;
	Sat, 21 Nov 2020 09:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A65E816D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605947974;
	bh=eKD9kM4LiQzkxF7RR3pbgrovqpISoeMtAjDzK/xYtsQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fSbNCBpBut26Lru3DD88Ls7Szifz3lyJZOrjl9tVDuEAs1X2NHanyCpiIVrwRrJ77
	 Pfd2LqwCNDPvhXlOnlFjuNL6TkFuwcxMfuJCX04t5kVr0p8aCEgemI3GZ4vD7sZaHC
	 ULlxuQncSxZUPkJz//dGmPPoxEhZxPKv6lUyUPoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C54F800C5;
	Sat, 21 Nov 2020 09:38:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFCCF801ED; Sat, 21 Nov 2020 09:37:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD69DF800C5
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 09:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD69DF800C5
Received: from localhost.localdomain ([81.185.161.242]) by mwinf5d61 with ME
 id uwdl2300M5E5lq903wdmYS; Sat, 21 Nov 2020 09:37:47 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Nov 2020 09:37:47 +0100
X-ME-IP: 81.185.161.242
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: perex@perex.cz,
	tiwai@suse.com,
	dan.carpenter@oracle.com
Subject: [PATCH V2] ALSA: emu10k1: Use dma_set_mask_and_coherent to simplify
 code
Date: Sat, 21 Nov 2020 09:37:47 +0100
Message-Id: <20201121083747.1330299-1-christophe.jaillet@wanadoo.fr>
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

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: do not update the dev_err message, to keep consistency with other dev_err
---
 sound/pci/emu10k1/emu10k1x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index def8161cde4c..f2b6fd434474 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -894,8 +894,8 @@ static int snd_emu10k1x_create(struct snd_card *card,
 
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
-	if (pci_set_dma_mask(pci, DMA_BIT_MASK(28)) < 0 ||
-	    pci_set_consistent_dma_mask(pci, DMA_BIT_MASK(28)) < 0) {
+
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28)) < 0) {
 		dev_err(card->dev, "error to set 28bit mask DMA\n");
 		pci_disable_device(pci);
 		return -ENXIO;
-- 
2.27.0


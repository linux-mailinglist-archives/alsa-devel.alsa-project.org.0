Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C181180B2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:47:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F1916B3;
	Tue, 10 Dec 2019 07:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F1916B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575960443;
	bh=pmSRaLBFNdnQSB79JbPjIG0CjJHCoP1M8CEyUcgDILo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9fyMi3ucFpRo8Bcg/LbZYb4qtp07WqFq6OpPQqGfnQkfUw0zS+2CTU65KIDgRaGn
	 xGR3xKXLHooEZ6h8kRqYroNbprCs5qqNz9BrJO0jJ+WRqD4Qn7jFSJNeQxKD6qTRJ/
	 k0FCgoYwip9hxovNLyL808aq4b4/zEc3ePjsUw3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F07F8028B;
	Tue, 10 Dec 2019 07:36:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C25F9F802F7; Tue, 10 Dec 2019 07:35:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5EC6F80259
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5EC6F80259
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3B3EB1F7
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:34:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:16 +0100
Message-Id: <20191210063454.31603-18-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 17/55] ALSA: ens137x: Support PCM sync_stop
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The driver invokes snd_pcm_period_elapsed() simply from the interrupt
handler.  Set card->sync_irq for enabling the missing sync_stop PCM
operation, as well as removing the superfluous synchronize_irq()
call.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ens1370.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index f69555c95263..378141aa7c7d 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1888,8 +1888,6 @@ static int snd_ensoniq_free(struct ensoniq *ensoniq)
 	outl(0, ES_REG(ensoniq, CONTROL));	/* switch everything off */
 	outl(0, ES_REG(ensoniq, SERIAL));	/* clear serial interface */
 #endif
-	if (ensoniq->irq >= 0)
-		synchronize_irq(ensoniq->irq);
 	pci_set_power_state(ensoniq->pci, PCI_D3hot);
       __hw_end:
 #ifdef CHIP1370
@@ -1990,7 +1988,6 @@ static void snd_ensoniq_chip_init(struct ensoniq *ensoniq)
 	outb(ensoniq->uartc = 0x00, ES_REG(ensoniq, UART_CONTROL));
 	outb(0x00, ES_REG(ensoniq, UART_RES));
 	outl(ensoniq->cssr, ES_REG(ensoniq, STATUS));
-	synchronize_irq(ensoniq->irq);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2074,6 +2071,7 @@ static int snd_ensoniq_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	ensoniq->irq = pci->irq;
+	card->sync_irq = ensoniq->irq;
 #ifdef CHIP1370
 	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				16, &ensoniq->dma_bug) < 0) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

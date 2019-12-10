Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9C118107
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 08:04:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B54661734;
	Tue, 10 Dec 2019 08:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B54661734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575961447;
	bh=WJS0wJF0wbBfn0AFLuelv105kRQNNrKv23ItxzX1HaE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cALImOajGPvkhLAs5nhJXJUCd4xQ106lbczB0DIz9xTi6X3xsvwjg6z/iYWVCWi9H
	 0Hpa4I94wW+RiqsJvEkXiwc967k+l1Tveuu3wMcqTPGLIsl4wWDuH8yolp5pubawnk
	 7i5E4n9dMhvfkIuBdAjLpPCp0UbIwPG+ZQtLP5BM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C60EF8046D;
	Tue, 10 Dec 2019 07:37:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BE87F80349; Tue, 10 Dec 2019 07:36:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A580F8028A
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A580F8028A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3EBE6AF87
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:41 +0100
Message-Id: <20191210063454.31603-43-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 42/55] ALSA: gus: Support PCM sync_stop
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
operation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_main.c  | 1 +
 sound/isa/gus/gusmax.c    | 3 ++-
 sound/isa/gus/interwave.c | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index af6b4d89d695..9f94b5f3b029 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -181,6 +181,7 @@ int snd_gus_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	gus->gf1.irq = irq;
+	card->sync_irq = irq;
 	if (request_dma(dma1, "GUS - 1")) {
 		snd_printk(KERN_ERR "gus: can't grab DMA1 %d\n", dma1);
 		snd_gus_free(gus);
diff --git a/sound/isa/gus/gusmax.c b/sound/isa/gus/gusmax.c
index 53eca205f870..efe576625f48 100644
--- a/sound/isa/gus/gusmax.c
+++ b/sound/isa/gus/gusmax.c
@@ -282,7 +282,8 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 		goto _err;
 	}
 	maxcard->irq = xirq;
-	
+	card->sync_irq = maxcard->irq;
+
 	err = snd_wss_create(card,
 			     gus->gf1.port + 0x10c, -1, xirq,
 			     xdma2 < 0 ? xdma1 : xdma2, xdma1,
diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index bc006dcf8de3..5cd4aa477ba7 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -667,6 +667,7 @@ static int snd_interwave_probe(struct snd_card *card, int dev)
 		return -EBUSY;
 	}
 	iwcard->irq = xirq;
+	card->sync_irq = iwcard->irq;
 
 	err = snd_wss_create(card,
 			     gus->gf1.port + 0x10c, -1, xirq,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

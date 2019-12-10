Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC01180C7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3539D11C;
	Tue, 10 Dec 2019 07:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3539D11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575960684;
	bh=+BpSuLOKITocvX7m+WEs8eQp8mrIzI3oxF44SRDSOEU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ov+xPRAGzCyqOv/i3wEHWL8uVD4CsnK61OdknoysuDNT5glzLyLDlxrzAvX1kx67y
	 vX0woAHwiEyhJL6rOyiH2BUIp6Y4umjDn65p4SJmCft6mQ3QvmwF60gRcVz9coq5p8
	 SlEr4TVkRSd5C7hyUu8gzqjJo406z6QpPlHnybOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC30FF802C4;
	Tue, 10 Dec 2019 07:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18B67F80304; Tue, 10 Dec 2019 07:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C721F80268
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C721F80268
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0C8AEB1FA
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:18 +0100
Message-Id: <20191210063454.31603-20-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 19/55] ALSA: es1968: Support PCM sync_stop
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
 sound/pci/es1968.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 4f5063ebce89..3610aa1da94c 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2602,8 +2602,6 @@ static int snd_es1968_free(struct es1968 *chip)
 #endif
 
 	if (chip->io_port) {
-		if (chip->irq >= 0)
-			synchronize_irq(chip->irq);
 		outw(1, chip->io_port + 0x04); /* clear WP interrupts */
 		outw(0, chip->io_port + ESM_PORT_HOST_IRQ); /* disable IRQ */
 	}
@@ -2712,6 +2710,7 @@ static int snd_es1968_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
+	card->sync_irq = chip->irq;
 	        
 	/* Clear Maestro_map */
 	for (i = 0; i < 32; i++)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

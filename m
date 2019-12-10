Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A631180A7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:43:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDDF4168F;
	Tue, 10 Dec 2019 07:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDDF4168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575960214;
	bh=0dpSsFts15+SePrbRma2OZMY+dW3M36qVOfCKlvQiL8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FEi7ofS6btv3uDiFldSdeFnZr3WURUEUyNL8ayZGRJD9HMUB+XwaXt87zTeH4drEa
	 zFlgqgJikiGhYkC/3i6pWuU6YvpGnuUvRZxI33I8l4aOEBxbSSWTsOQDtFsfjpnys8
	 WTyhsCcCPbZBi+IDNqfkvZU6T+eLGFTFPrusRCkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDBAFF80269;
	Tue, 10 Dec 2019 07:35:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6616F802E3; Tue, 10 Dec 2019 07:35:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C06B0F80255
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C06B0F80255
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F751B1ED
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:34:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:10 +0100
Message-Id: <20191210063454.31603-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 11/55] ALSA: cs4281: Support PCM sync_stop
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
 sound/pci/cs4281.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 0dcb2d15b560..e7294b9d2cb6 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1268,9 +1268,6 @@ static int snd_cs4281_free(struct cs4281 *chip)
 {
 	snd_cs4281_free_gameport(chip);
 
-	if (chip->irq >= 0)
-		synchronize_irq(chip->irq);
-
 	/* Mask interrupts */
 	snd_cs4281_pokeBA0(chip, BA0_HIMR, 0x7fffffff);
 	/* Stop the DLL Clock logic. */
@@ -1352,6 +1349,7 @@ static int snd_cs4281_create(struct snd_card *card,
 		return -ENOMEM;
 	}
 	chip->irq = pci->irq;
+	card->sync_irq = chip->irq;
 
 	tmp = snd_cs4281_chip_init(chip);
 	if (tmp) {
@@ -1600,7 +1598,6 @@ static int snd_cs4281_chip_init(struct cs4281 *chip)
 					BA0_HISR_DMA(1) |
 					BA0_HISR_DMA(2) |
 					BA0_HISR_DMA(3)));
-	synchronize_irq(chip->irq);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

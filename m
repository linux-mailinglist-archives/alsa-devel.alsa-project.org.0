Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 274731180C6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:50:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B15C316D4;
	Tue, 10 Dec 2019 07:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B15C316D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575960648;
	bh=fQl9W5D/KI2SZqRBSttYuWHIm7pekIouc6+XpEarxJ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sb7rlT+mv2ILLc33aMeQnwfktss/SrENYiKt9zZuPBM2k/SRPQNw53oa/zMJZSiSE
	 1tr2hNlsKGx/Qskpg8Kss6bg0zzHI0lxChn9WwOe29TpXUIqMxLrI2aa+OkhjhOFN2
	 GlEkEusaZxwEoo/LxbKyoi3nj+54U/Dq0qfNuqI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C8AF8035E;
	Tue, 10 Dec 2019 07:36:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEF75F80307; Tue, 10 Dec 2019 07:35:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40D02F80260
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D02F80260
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 48DA8B201
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:23 +0100
Message-Id: <20191210063454.31603-25-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 24/55] ALSA: intel8x0: Support PCM sync_stop
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
operation.  It's cleared and reset dynamically at IRQ re-acquiring for
the PM resume, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 4 +++-
 sound/pci/intel8x0m.c | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 2a3551deee74..f88008465c44 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2592,6 +2592,7 @@ static int intel8x0_suspend(struct device *dev)
 	if (chip->irq >= 0) {
 		free_irq(chip->irq, chip);
 		chip->irq = -1;
+		card->sync_irq = -1;
 	}
 	return 0;
 }
@@ -2612,7 +2613,7 @@ static int intel8x0_resume(struct device *dev)
 		return -EIO;
 	}
 	chip->irq = pci->irq;
-	synchronize_irq(chip->irq);
+	card->sync_irq = chip->irq;
 
 	/* re-initialize mixer stuff */
 	if (chip->device_type == DEVICE_INTEL_ICH4 && !spdif_aclink) {
@@ -3092,6 +3093,7 @@ static int snd_intel8x0_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
+	card->sync_irq = chip->irq;
 
 	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
 		snd_intel8x0_free(chip);
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 13dd3d873e95..2f73b45c845c 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -999,6 +999,7 @@ static int intel8x0m_suspend(struct device *dev)
 	if (chip->irq >= 0) {
 		free_irq(chip->irq, chip);
 		chip->irq = -1;
+		card->sync_irq = -1;
 	}
 	return 0;
 }
@@ -1017,6 +1018,7 @@ static int intel8x0m_resume(struct device *dev)
 		return -EIO;
 	}
 	chip->irq = pci->irq;
+	card->sync_irq = chip->irq;
 	snd_intel8x0m_chip_init(chip, 0);
 	snd_ac97_resume(chip->ac97);
 
@@ -1191,6 +1193,7 @@ static int snd_intel8x0m_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
+	card->sync_irq = chip->irq;
 
 	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
 		snd_intel8x0m_free(chip);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

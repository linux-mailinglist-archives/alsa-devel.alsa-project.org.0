Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BB225BF50
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648011904;
	Thu,  3 Sep 2020 12:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648011904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130010;
	bh=EDE6xyrAnUN47IzzlU68NcUTwnzUKIsPsiEdEtf2KUg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQjDL7wHtaRz29S9CEbXO+6oJ0wshklr9Msk6rkh0ZRMUQB4roMfvBSmiZHgnHADD
	 Md9ig3EqSiZDy6iOogjRaVb4/Ib03QeKOTzSOsmB4cSIJLuAm+E6qWYcUVN02QizCN
	 RDA/rOSsvIt7uy/F+D5LTu05MPujQX9g1r6k5eLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6FDEF802F7;
	Thu,  3 Sep 2020 12:42:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40B93F802E1; Thu,  3 Sep 2020 12:41:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4663F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4663F800F0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7E85B15A;
 Thu,  3 Sep 2020 10:41:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/11] ALSA: riptide: Replace tasklet with threaded irq
Date: Thu,  3 Sep 2020 12:41:28 +0200
Message-Id: <20200903104131.21097-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200903104131.21097-1-tiwai@suse.de>
References: <20200903104131.21097-1-tiwai@suse.de>
Cc: Clemens Ladisch <clemens@ladisch.de>
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

The tasklet is an old API that should be deprecated, usually can be
converted to another decent API.  In Riptide driver, a tasklet is
still used for offloading the PCM IRQ handling.  It can be achieved
gracefully with a threaded IRQ, too.

This patch replaces the tasklet usage in riptide driver with a
threaded IRQ.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 098c69b3b7aa..fcc2073c5025 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -445,7 +445,6 @@ struct snd_riptide {
 	union firmware_version firmware;
 
 	spinlock_t lock;
-	struct tasklet_struct riptide_tq;
 	struct snd_info_entry *proc_entry;
 
 	unsigned long received_irqs;
@@ -1070,9 +1069,9 @@ getmixer(struct cmdif *cif, short num, unsigned short *rval,
 	return 0;
 }
 
-static void riptide_handleirq(struct tasklet_struct *t)
+static irqreturn_t riptide_handleirq(int irq, void *dev_id)
 {
-	struct snd_riptide *chip = from_tasklet(chip, t, riptide_tq);
+	struct snd_riptide *chip = dev_id;
 	struct cmdif *cif = chip->cif;
 	struct snd_pcm_substream *substream[PLAYBACK_SUBSTREAMS + 1];
 	struct snd_pcm_runtime *runtime;
@@ -1083,7 +1082,7 @@ static void riptide_handleirq(struct tasklet_struct *t)
 	unsigned int flag;
 
 	if (!cif)
-		return;
+		return IRQ_HANDLED;
 
 	for (i = 0; i < PLAYBACK_SUBSTREAMS; i++)
 		substream[i] = chip->playback_substream[i];
@@ -1134,6 +1133,8 @@ static void riptide_handleirq(struct tasklet_struct *t)
 			}
 		}
 	}
+
+	return IRQ_HANDLED;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1699,13 +1700,14 @@ snd_riptide_interrupt(int irq, void *dev_id)
 {
 	struct snd_riptide *chip = dev_id;
 	struct cmdif *cif = chip->cif;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	if (cif) {
 		chip->received_irqs++;
 		if (IS_EOBIRQ(cif->hwport) || IS_EOSIRQ(cif->hwport) ||
 		    IS_EOCIRQ(cif->hwport)) {
 			chip->handled_irqs++;
-			tasklet_schedule(&chip->riptide_tq);
+			ret = IRQ_WAKE_THREAD;
 		}
 		if (chip->rmidi && IS_MPUIRQ(cif->hwport)) {
 			chip->handled_irqs++;
@@ -1714,7 +1716,7 @@ snd_riptide_interrupt(int irq, void *dev_id)
 		}
 		SET_AIACK(cif->hwport);
 	}
-	return IRQ_HANDLED;
+	return ret;
 }
 
 static void
@@ -1843,7 +1845,6 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	chip->received_irqs = 0;
 	chip->handled_irqs = 0;
 	chip->cif = NULL;
-	tasklet_setup(&chip->riptide_tq, riptide_handleirq);
 
 	if ((chip->res_port =
 	     request_region(chip->port, 64, "RIPTIDE")) == NULL) {
@@ -1856,8 +1857,9 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	hwport = (struct riptideport *)chip->port;
 	UNSET_AIE(hwport);
 
-	if (request_irq(pci->irq, snd_riptide_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (request_threaded_irq(pci->irq, snd_riptide_interrupt,
+				 riptide_handleirq, IRQF_SHARED,
+				 KBUILD_MODNAME, chip)) {
 		snd_printk(KERN_ERR "Riptide: unable to grab IRQ %d\n",
 			   pci->irq);
 		snd_riptide_free(chip);
-- 
2.16.4


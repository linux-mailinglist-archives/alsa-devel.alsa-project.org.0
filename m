Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFC25BF54
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 750431905;
	Thu,  3 Sep 2020 12:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 750431905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130054;
	bh=6B/hpgJH+QZgIa5PtXKYgCgesLTs5+jOMT40L/1fSBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RIrA+ujkOt3BV+zGUqM3xPoYBRdIaRhsDdwfzbo3m/CiV+9J0l1zWoKRv15Gp3diw
	 O+rtGPcwOq8e29DeNrvzcqHBSupwJrxIe7t3/AJf9azvWoeQfF4OfXHYrZlfngsoz6
	 o/eaxsYfeXJwCFsej+o48D6bHJ1LfeZjU+6lHR2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C195BF80305;
	Thu,  3 Sep 2020 12:42:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F4B1F802E1; Thu,  3 Sep 2020 12:42:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C116CF80278
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C116CF80278
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1EB4B15D;
 Thu,  3 Sep 2020 10:41:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/11] ALSA: asihpi: Replace tasklet with threaded irq
Date: Thu,  3 Sep 2020 12:41:29 +0200
Message-Id: <20200903104131.21097-10-tiwai@suse.de>
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
converted to another decent API.  In ASIHPI driver, a tasklet is
still used for offloading the PCM IRQ handling.  It can be achieved
gracefully with a threaded IRQ, too.

This patch replaces the tasklet usage in asihpi driver with a threaded
IRQ.  It also simplified some call patterns.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/asihpi.c  | 28 +++-------------------------
 sound/pci/asihpi/hpioctl.c | 16 +++++++++++++---
 2 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 35e76480306e..46d8166ceaeb 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -117,7 +117,6 @@ struct snd_card_asihpi {
 	 * snd_card_asihpi_timer_function().
 	 */
 	struct snd_card_asihpi_pcm *llmode_streampriv;
-	struct tasklet_struct t;
 	void (*pcm_start)(struct snd_pcm_substream *substream);
 	void (*pcm_stop)(struct snd_pcm_substream *substream);
 
@@ -547,9 +546,7 @@ static void snd_card_asihpi_pcm_int_start(struct snd_pcm_substream *substream)
 	card = snd_pcm_substream_chip(substream);
 
 	WARN_ON(in_interrupt());
-	tasklet_disable(&card->t);
 	card->llmode_streampriv = dpcm;
-	tasklet_enable(&card->t);
 
 	hpi_handle_error(hpi_adapter_set_property(card->hpi->adapter->index,
 		HPI_ADAPTER_PROPERTY_IRQ_RATE,
@@ -565,13 +562,7 @@ static void snd_card_asihpi_pcm_int_stop(struct snd_pcm_substream *substream)
 	hpi_handle_error(hpi_adapter_set_property(card->hpi->adapter->index,
 		HPI_ADAPTER_PROPERTY_IRQ_RATE, 0, 0));
 
-	if (in_interrupt())
-		card->llmode_streampriv = NULL;
-	else {
-		tasklet_disable(&card->t);
-		card->llmode_streampriv = NULL;
-		tasklet_enable(&card->t);
-	}
+	card->llmode_streampriv = NULL;
 }
 
 static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
@@ -921,10 +912,9 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 		add_timer(&dpcm->timer);
 }
 
-static void snd_card_asihpi_int_task(struct tasklet_struct *t)
+static void snd_card_asihpi_isr(struct hpi_adapter *a)
 {
-	struct snd_card_asihpi *asihpi = from_tasklet(asihpi, t, t);
-	struct hpi_adapter *a = asihpi->hpi;
+	struct snd_card_asihpi *asihpi;
 
 	WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
 	asihpi = (struct snd_card_asihpi *)a->snd_card->private_data;
@@ -933,15 +923,6 @@ static void snd_card_asihpi_int_task(struct tasklet_struct *t)
 			&asihpi->llmode_streampriv->timer);
 }
 
-static void snd_card_asihpi_isr(struct hpi_adapter *a)
-{
-	struct snd_card_asihpi *asihpi;
-
-	WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
-	asihpi = (struct snd_card_asihpi *)a->snd_card->private_data;
-	tasklet_schedule(&asihpi->t);
-}
-
 /***************************** PLAYBACK OPS ****************/
 static int snd_card_asihpi_playback_prepare(struct snd_pcm_substream *
 					    substream)
@@ -2871,7 +2852,6 @@ static int snd_asihpi_probe(struct pci_dev *pci_dev,
 	if (hpi->interrupt_mode) {
 		asihpi->pcm_start = snd_card_asihpi_pcm_int_start;
 		asihpi->pcm_stop = snd_card_asihpi_pcm_int_stop;
-		tasklet_setup(&asihpi->t, snd_card_asihpi_int_task);
 		hpi->interrupt_callback = snd_card_asihpi_isr;
 	} else {
 		asihpi->pcm_start = snd_card_asihpi_pcm_timer_start;
@@ -2960,14 +2940,12 @@ static int snd_asihpi_probe(struct pci_dev *pci_dev,
 static void snd_asihpi_remove(struct pci_dev *pci_dev)
 {
 	struct hpi_adapter *hpi = pci_get_drvdata(pci_dev);
-	struct snd_card_asihpi *asihpi = hpi->snd_card->private_data;
 
 	/* Stop interrupts */
 	if (hpi->interrupt_mode) {
 		hpi->interrupt_callback = NULL;
 		hpi_handle_error(hpi_adapter_set_property(hpi->adapter->index,
 			HPI_ADAPTER_PROPERTY_IRQ_RATE, 0, 0));
-		tasklet_kill(&asihpi->t);
 	}
 
 	snd_card_free(hpi->snd_card);
diff --git a/sound/pci/asihpi/hpioctl.c b/sound/pci/asihpi/hpioctl.c
index 496dcde9715d..6cc2b6964bb5 100644
--- a/sound/pci/asihpi/hpioctl.c
+++ b/sound/pci/asihpi/hpioctl.c
@@ -329,11 +329,20 @@ static irqreturn_t asihpi_isr(int irq, void *dev_id)
 	   asihpi_irq_count, a->adapter->type, a->adapter->index); */
 
 	if (a->interrupt_callback)
-		a->interrupt_callback(a);
+		return IRQ_WAKE_THREAD;
 
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t asihpi_isr_thread(int irq, void *dev_id)
+{
+	struct hpi_adapter *a = dev_id;
+
+	if (a->interrupt_callback)
+		a->interrupt_callback(a);
+	return IRQ_HANDLED;
+}
+
 int asihpi_adapter_probe(struct pci_dev *pci_dev,
 			 const struct pci_device_id *pci_id)
 {
@@ -478,8 +487,9 @@ int asihpi_adapter_probe(struct pci_dev *pci_dev,
 		}
 
 		/* Note: request_irq calls asihpi_isr here */
-		if (request_irq(pci_dev->irq, asihpi_isr, IRQF_SHARED,
-				"asihpi", &adapters[adapter_index])) {
+		if (request_threaded_irq(pci_dev->irq, asihpi_isr,
+					 asihpi_isr_thread, IRQF_SHARED,
+					 "asihpi", &adapters[adapter_index])) {
 			dev_err(&pci_dev->dev, "request_irq(%d) failed\n",
 				pci_dev->irq);
 			goto err;
-- 
2.16.4


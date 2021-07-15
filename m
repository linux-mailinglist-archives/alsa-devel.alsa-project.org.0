Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A81523C9A23
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:08:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ED8016CE;
	Thu, 15 Jul 2021 10:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ED8016CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336484;
	bh=nO8aafrM+iykm3A93A9CbIs8145Y1VYuhPzaGfFW2ro=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s3W2v8w27gxFZ/4LY/MZliCBmI+a/s+HvH1cqd6H3RvM24Pv1hWeVYxZalp3YDULW
	 LLc0bMpTeW8x8n9biXgCVxkW6I4fLRgYiRyHykJ2t75cms48i48QfCr43hlcwNmvmC
	 +kH+hNG0MRJ16I0O5UwfGl14H3rVsriZQQ4lFk0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F27FF805E9;
	Thu, 15 Jul 2021 10:00:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EADCF805B6; Thu, 15 Jul 2021 10:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A484DF804E4
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A484DF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="iMOnTzdO"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="J+OJARKr"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 71E022284C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+zPGj0sNXqSW0ODusYjbeLSfUg6q2ixQyrrHHuNW5s=;
 b=iMOnTzdOIx1g9wtgoR2Xht9j0428qJUnJAwd1iqS1uzrpmGRKr+g2CX5kJurK+ma0Pl/2p
 iZMBB34EeLrhiWUfg/izaspVr2bvhjdUHRC3GEGYpXI5J3yZuZKaCgRc19M+4BnRn8JMf0
 Qft2fUbha/ZSBUxwu3MNDxnbU2yl8FA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+zPGj0sNXqSW0ODusYjbeLSfUg6q2ixQyrrHHuNW5s=;
 b=J+OJARKrBSxEuGfOANxJjyuxt+yV3A7KBfxLwTfx4T7DPbiZfpAi6QiI/9VdYEA+sngwAu
 xjAMpRCAmPSq/PCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6A49CA3B99;
 Thu, 15 Jul 2021 07:59:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 16/79] ALSA: ens137x: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:58:38 +0200
Message-Id: <20210715075941.23332-17-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch converts the resource management in PCI esn137x drivers
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, the devres helper is
used for the DMA buffer page allocations, and the card object release
is managed now via card->private_free instead of a lowlevel
snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ens1370.c | 115 +++++++++++---------------------------------
 1 file changed, 27 insertions(+), 88 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 728b69dad21b..2651f0c64c06 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -414,7 +414,7 @@ struct ensoniq {
 	unsigned int spdif_stream;
 
 #ifdef CHIP1370
-	struct snd_dma_buffer dma_bug;
+	struct snd_dma_buffer *dma_bug;
 #endif
 
 #ifdef SUPPORT_JOYSTICK
@@ -1872,11 +1872,11 @@ static void snd_ensoniq_proc_init(struct ensoniq *ensoniq)
 
  */
 
-static int snd_ensoniq_free(struct ensoniq *ensoniq)
+static void snd_ensoniq_free(struct snd_card *card)
 {
+	struct ensoniq *ensoniq = card->private_data;
+
 	snd_ensoniq_free_gameport(ensoniq);
-	if (ensoniq->irq < 0)
-		goto __hw_end;
 #ifdef CHIP1370
 	outl(ES_1370_SERR_DISABLE, ES_REG(ensoniq, CONTROL));	/* switch everything off */
 	outl(0, ES_REG(ensoniq, SERIAL));	/* clear serial interface */
@@ -1884,24 +1884,6 @@ static int snd_ensoniq_free(struct ensoniq *ensoniq)
 	outl(0, ES_REG(ensoniq, CONTROL));	/* switch everything off */
 	outl(0, ES_REG(ensoniq, SERIAL));	/* clear serial interface */
 #endif
-	pci_set_power_state(ensoniq->pci, PCI_D3hot);
-      __hw_end:
-#ifdef CHIP1370
-	if (ensoniq->dma_bug.area)
-		snd_dma_free_pages(&ensoniq->dma_bug);
-#endif
-	if (ensoniq->irq >= 0)
-		free_irq(ensoniq->irq, ensoniq);
-	pci_release_regions(ensoniq->pci);
-	pci_disable_device(ensoniq->pci);
-	kfree(ensoniq);
-	return 0;
-}
-
-static int snd_ensoniq_dev_free(struct snd_device *device)
-{
-	struct ensoniq *ensoniq = device->device_data;
-	return snd_ensoniq_free(ensoniq);
 }
 
 #ifdef CHIP1371
@@ -1935,7 +1917,7 @@ static void snd_ensoniq_chip_init(struct ensoniq *ensoniq)
 	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
 	outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
 	outl(ES_MEM_PAGEO(ES_PAGE_ADC), ES_REG(ensoniq, MEM_PAGE));
-	outl(ensoniq->dma_bug.addr, ES_REG(ensoniq, PHANTOM_FRAME));
+	outl(ensoniq->dma_bug->addr, ES_REG(ensoniq, PHANTOM_FRAME));
 	outl(0, ES_REG(ensoniq, PHANTOM_COUNT));
 #else
 	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
@@ -2032,51 +2014,35 @@ static SIMPLE_DEV_PM_OPS(snd_ensoniq_pm, snd_ensoniq_suspend, snd_ensoniq_resume
 #endif /* CONFIG_PM_SLEEP */
 
 static int snd_ensoniq_create(struct snd_card *card,
-			      struct pci_dev *pci,
-			      struct ensoniq **rensoniq)
+			      struct pci_dev *pci)
 {
-	struct ensoniq *ensoniq;
+	struct ensoniq *ensoniq = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_ensoniq_dev_free,
-	};
 
-	*rensoniq = NULL;
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
-	ensoniq = kzalloc(sizeof(*ensoniq), GFP_KERNEL);
-	if (ensoniq == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	spin_lock_init(&ensoniq->reg_lock);
 	mutex_init(&ensoniq->src_mutex);
 	ensoniq->card = card;
 	ensoniq->pci = pci;
 	ensoniq->irq = -1;
 	err = pci_request_regions(pci, "Ensoniq AudioPCI");
-	if (err < 0) {
-		kfree(ensoniq);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	ensoniq->port = pci_resource_start(pci, 0);
-	if (request_irq(pci->irq, snd_audiopci_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, ensoniq)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_audiopci_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, ensoniq)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_ensoniq_free(ensoniq);
 		return -EBUSY;
 	}
 	ensoniq->irq = pci->irq;
 	card->sync_irq = ensoniq->irq;
 #ifdef CHIP1370
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				16, &ensoniq->dma_bug) < 0) {
-		dev_err(card->dev, "unable to allocate space for phantom area - dma_bug\n");
-		snd_ensoniq_free(ensoniq);
-		return -EBUSY;
-	}
+	ensoniq->dma_bug =
+		snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV, 16);
+	if (!ensoniq->dma_bug)
+		return -ENOMEM;
 #endif
 	pci_set_master(pci);
 	ensoniq->rev = pci->revision;
@@ -2099,17 +2065,10 @@ static int snd_ensoniq_create(struct snd_card *card,
 		ensoniq->cssr |= ES_1371_ST_AC97_RST;
 #endif
 
+	card->private_free = snd_ensoniq_free;
 	snd_ensoniq_chip_init(ensoniq);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, ensoniq, &ops);
-	if (err < 0) {
-		snd_ensoniq_free(ensoniq);
-		return err;
-	}
-
 	snd_ensoniq_proc_init(ensoniq);
-
-	*rensoniq = ensoniq;
 	return 0;
 }
 
@@ -2360,47 +2319,35 @@ static int snd_audiopci_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*ensoniq), &card);
 	if (err < 0)
 		return err;
+	ensoniq = card->private_data;
 
-	err = snd_ensoniq_create(card, pci, &ensoniq);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_ensoniq_create(card, pci);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = ensoniq;
 
 #ifdef CHIP1370
 	err = snd_ensoniq_1370_mixer(ensoniq);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 #endif
 #ifdef CHIP1371
 	err = snd_ensoniq_1371_mixer(ensoniq, spdif[dev], lineio[dev]);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 #endif
 	err = snd_ensoniq_pcm(ensoniq, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_ensoniq_pcm2(ensoniq, 1);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_ensoniq_midi(ensoniq, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	snd_ensoniq_create_gameport(ensoniq, dev);
 
@@ -2414,26 +2361,18 @@ static int snd_audiopci_probe(struct pci_dev *pci,
 		ensoniq->irq);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
 }
 
-static void snd_audiopci_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver ens137x_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_audiopci_ids,
 	.probe = snd_audiopci_probe,
-	.remove = snd_audiopci_remove,
 	.driver = {
 		.pm = SND_ENSONIQ_PM_OPS,
 	},
-- 
2.26.2


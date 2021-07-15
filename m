Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9D3C9A66
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E75E170A;
	Thu, 15 Jul 2021 10:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E75E170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337180;
	bh=rHsxd+v0mhkecxXBQ+rDzQSZSqPBYuEhskwV0L+lXHc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A7PDKIGjGEfwXC3b569l1eZyAjd9RIYWgOF+RIyuqzR/QJq3dWf7izIO/6KTuLkD8
	 O6g+bjmSDqN9DAUJfMAT/Ltzr3oecfqZafC1qbTro6zPSLNGf0G3gTjkQ3wX9Xe6ZJ
	 qZNl61c8Revf81LQ8cgfEy/dlEI7V1T+fvP9i0d8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D3AF80229;
	Thu, 15 Jul 2021 10:01:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DFC6F80536; Thu, 15 Jul 2021 10:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D298BF80528
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D298BF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tHkD/YS4"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="fEM/I5YV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AA0ED1FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VISn0WVaelPlAIIWemmJVN6fWOaz1Q9xpZNf/RGCWp4=;
 b=tHkD/YS4Gq4HDTsjP1v2oXGoN0TifBDL6O2SEcINMD1QlmJRoV5dCWVjW55Q0lJSyXCyLt
 0LmpDNcwtwkOBVtD5uJqVLlrIJdy8andCgmjKiorN5rLF2atPTpR+V5O4dwB1N9UJ7Lii+
 xY2T2PnwLcn+83+6Oi1rrNEtTzIvNYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VISn0WVaelPlAIIWemmJVN6fWOaz1Q9xpZNf/RGCWp4=;
 b=fEM/I5YVgbQ3EB+o1EomcPDJPAQ1WSRg+2VcbK5DHpshoxncq0JuknPD/M41CCRq09A7S6
 pMRDca0q6MaKbnCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 968FEA3B99;
 Thu, 15 Jul 2021 08:00:11 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 45/79] ALSA: hdsp: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:07 +0200
Message-Id: <20210715075941.23332-46-tiwai@suse.de>
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

This patch converts the resource management in PCI hdsp driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, the page allocations are done
with the devres helper, and the card object release is managed now via
card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c | 89 +++++++++++-----------------------------
 1 file changed, 25 insertions(+), 64 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 8457a4bbc3df..982278f8724d 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -468,8 +468,8 @@ struct hdsp {
 	unsigned char         ss_out_channels;
 	u32                   io_loopback;          /* output loopback channel states*/
 
-	struct snd_dma_buffer capture_dma_buf;
-	struct snd_dma_buffer playback_dma_buf;
+	struct snd_dma_buffer *capture_dma_buf;
+	struct snd_dma_buffer *playback_dma_buf;
 	unsigned char        *capture_buffer;	    /* suitably aligned address */
 	unsigned char        *playback_buffer;	    /* suitably aligned address */
 
@@ -565,18 +565,12 @@ static const char channel_map_H9632_qs[HDSP_MAX_CHANNELS] = {
 	-1, -1
 };
 
-static int snd_hammerfall_get_buffer(struct pci_dev *pci, struct snd_dma_buffer *dmab, size_t size)
+static struct snd_dma_buffer *
+snd_hammerfall_get_buffer(struct pci_dev *pci, size_t size)
 {
-	return snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev, size, dmab);
+	return snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV, size);
 }
 
-static void snd_hammerfall_free_buffer(struct snd_dma_buffer *dmab, struct pci_dev *pci)
-{
-	if (dmab->area)
-		snd_dma_free_pages(dmab);
-}
-
-
 static const struct pci_device_id snd_hdsp_ids[] = {
 	{
 		.vendor = PCI_VENDOR_ID_XILINX,
@@ -3768,20 +3762,15 @@ static void snd_hdsp_proc_init(struct hdsp *hdsp)
 	snd_card_ro_proc_new(hdsp->card, "hdsp", hdsp, snd_hdsp_proc_read);
 }
 
-static void snd_hdsp_free_buffers(struct hdsp *hdsp)
-{
-	snd_hammerfall_free_buffer(&hdsp->capture_dma_buf, hdsp->pci);
-	snd_hammerfall_free_buffer(&hdsp->playback_dma_buf, hdsp->pci);
-}
-
 static int snd_hdsp_initialize_memory(struct hdsp *hdsp)
 {
 	unsigned long pb_bus, cb_bus;
 
-	if (snd_hammerfall_get_buffer(hdsp->pci, &hdsp->capture_dma_buf, HDSP_DMA_AREA_BYTES) < 0 ||
-	    snd_hammerfall_get_buffer(hdsp->pci, &hdsp->playback_dma_buf, HDSP_DMA_AREA_BYTES) < 0) {
-		if (hdsp->capture_dma_buf.area)
-			snd_dma_free_pages(&hdsp->capture_dma_buf);
+	hdsp->capture_dma_buf =
+		snd_hammerfall_get_buffer(hdsp->pci, HDSP_DMA_AREA_BYTES);
+	hdsp->playback_dma_buf =
+		snd_hammerfall_get_buffer(hdsp->pci, HDSP_DMA_AREA_BYTES);
+	if (!hdsp->capture_dma_buf || !hdsp->playback_dma_buf) {
 		dev_err(hdsp->card->dev,
 			"%s: no buffers available\n", hdsp->card_name);
 		return -ENOMEM;
@@ -3789,16 +3778,16 @@ static int snd_hdsp_initialize_memory(struct hdsp *hdsp)
 
 	/* Align to bus-space 64K boundary */
 
-	cb_bus = ALIGN(hdsp->capture_dma_buf.addr, 0x10000ul);
-	pb_bus = ALIGN(hdsp->playback_dma_buf.addr, 0x10000ul);
+	cb_bus = ALIGN(hdsp->capture_dma_buf->addr, 0x10000ul);
+	pb_bus = ALIGN(hdsp->playback_dma_buf->addr, 0x10000ul);
 
 	/* Tell the card where it is */
 
 	hdsp_write(hdsp, HDSP_inputBufferAddress, cb_bus);
 	hdsp_write(hdsp, HDSP_outputBufferAddress, pb_bus);
 
-	hdsp->capture_buffer = hdsp->capture_dma_buf.area + (cb_bus - hdsp->capture_dma_buf.addr);
-	hdsp->playback_buffer = hdsp->playback_dma_buf.area + (pb_bus - hdsp->playback_dma_buf.addr);
+	hdsp->capture_buffer = hdsp->capture_dma_buf->area + (cb_bus - hdsp->capture_dma_buf->addr);
+	hdsp->playback_buffer = hdsp->playback_dma_buf->area + (pb_bus - hdsp->playback_dma_buf->addr);
 
 	return 0;
 }
@@ -5313,7 +5302,7 @@ static int snd_hdsp_create(struct snd_card *card,
 		is_9632 = 1;
 	}
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
@@ -5323,15 +5312,15 @@ static int snd_hdsp_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 	hdsp->port = pci_resource_start(pci, 0);
-	hdsp->iobase = ioremap(hdsp->port, HDSP_IO_EXTENT);
+	hdsp->iobase = devm_ioremap(&pci->dev, hdsp->port, HDSP_IO_EXTENT);
 	if (!hdsp->iobase) {
 		dev_err(hdsp->card->dev, "unable to remap region 0x%lx-0x%lx\n",
 			hdsp->port, hdsp->port + HDSP_IO_EXTENT - 1);
 		return -EBUSY;
 	}
 
-	if (request_irq(pci->irq, snd_hdsp_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, hdsp)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_hdsp_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, hdsp)) {
 		dev_err(hdsp->card->dev, "unable to use IRQ %d\n", pci->irq);
 		return -EBUSY;
 	}
@@ -5411,8 +5400,10 @@ static int snd_hdsp_create(struct snd_card *card,
 	return 0;
 }
 
-static int snd_hdsp_free(struct hdsp *hdsp)
+static void snd_hdsp_card_free(struct snd_card *card)
 {
+	struct hdsp *hdsp = card->private_data;
+
 	if (hdsp->port) {
 		/* stop the audio, and cancel all interrupts */
 		cancel_work_sync(&hdsp->midi_work);
@@ -5420,29 +5411,8 @@ static int snd_hdsp_free(struct hdsp *hdsp)
 		hdsp_write (hdsp, HDSP_controlRegister, hdsp->control_register);
 	}
 
-	if (hdsp->irq >= 0)
-		free_irq(hdsp->irq, (void *)hdsp);
-
-	snd_hdsp_free_buffers(hdsp);
-
 	release_firmware(hdsp->firmware);
 	vfree(hdsp->fw_uploaded);
-	iounmap(hdsp->iobase);
-
-	if (hdsp->port)
-		pci_release_regions(hdsp->pci);
-
-	if (pci_is_enabled(hdsp->pci))
-		pci_disable_device(hdsp->pci);
-	return 0;
-}
-
-static void snd_hdsp_card_free(struct snd_card *card)
-{
-	struct hdsp *hdsp = card->private_data;
-
-	if (hdsp)
-		snd_hdsp_free(hdsp);
 }
 
 static int snd_hdsp_probe(struct pci_dev *pci,
@@ -5460,8 +5430,8 @@ static int snd_hdsp_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct hdsp), &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct hdsp), &card);
 	if (err < 0)
 		return err;
 
@@ -5471,32 +5441,23 @@ static int snd_hdsp_probe(struct pci_dev *pci,
 	hdsp->pci = pci;
 	err = snd_hdsp_create(card, hdsp);
 	if (err)
-		goto free_card;
+		return err;
 
 	strcpy(card->shortname, "Hammerfall DSP");
 	sprintf(card->longname, "%s at 0x%lx, irq %d", hdsp->card_name,
 		hdsp->port, hdsp->irq);
 	err = snd_card_register(card);
-	if (err) {
-free_card:
-		snd_card_free(card);
+	if (err)
 		return err;
-	}
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
 }
 
-static void snd_hdsp_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver hdsp_driver = {
 	.name =     KBUILD_MODNAME,
 	.id_table = snd_hdsp_ids,
 	.probe =    snd_hdsp_probe,
-	.remove = snd_hdsp_remove,
 };
 
 module_pci_driver(hdsp_driver);
-- 
2.26.2


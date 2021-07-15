Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D903C9A4E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E059C1735;
	Thu, 15 Jul 2021 10:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E059C1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336853;
	bh=05AkCagDvbKFCCICvLxDy4stNAkudTaYaLQ2wBjO04M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLC2DR56NByW43FyTph9ZYVWh2jlA2hUh/SXPVX0Sfw8AsPE75T7cambwxHtD+8y/
	 iMESIZ4sWGaNdnjxOxWOH2TCJqPiWQtZVCpzTVUuk5dbk7dBEaYjsZLygUCenKIwB9
	 DdHPj6Rf98dQ/8NSr7MM1HSoB0MWt8N9R+M+7O2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 339BDF80515;
	Thu, 15 Jul 2021 10:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA57CF80620; Thu, 15 Jul 2021 10:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D555F80516
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D555F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Mx8N0Eue"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5X783Ivj"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 16F8A1FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2DCX/QEsG5SGmvCcP2ajlbmbwI490Kx3Vx7ceUZBTA=;
 b=Mx8N0EueF6+uFlgpdd7FaENlsYDYwzrWdQAPXB2KE2utW7TmzANKXq3Lkv5snkxNBT2DBc
 OKNkgAMe1JbH+8ar9zNp5PA+wBZDReUowN42Rs+Id/eh+hYi5Rje1N8XOrLrX/IGmVrwxU
 kJ07ja7AxbdSecDRPUcmFxhS6hUYTwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2DCX/QEsG5SGmvCcP2ajlbmbwI490Kx3Vx7ceUZBTA=;
 b=5X783Ivj8ODKwnqeG560iwibcFE0R6iKunfP2fjlob41rgRJtvxJy7zuC9WvyMahjKugqE
 luVzk+ii2fwX7GDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 04BDAA3B9A;
 Thu, 15 Jul 2021 08:00:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 32/79] ALSA: echoaudio: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:58:54 +0200
Message-Id: <20210715075941.23332-33-tiwai@suse.de>
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

This patch converts the resource management in PCI echoaudio drivers
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, the page allocations
are done with the devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.
The irq handler is still managed manually because it's re-acquired at
PM suspend/resume.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/echoaudio.c | 168 +++++++++-----------------------
 sound/pci/echoaudio/echoaudio.h |   2 +-
 2 files changed, 48 insertions(+), 122 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index a62e5581ad14..25b012ef5c3e 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1882,105 +1882,63 @@ static irqreturn_t snd_echo_interrupt(int irq, void *dev_id)
 	Module construction / destruction
 ******************************************************************************/
 
-static int snd_echo_free(struct echoaudio *chip)
+static void snd_echo_free(struct snd_card *card)
 {
+	struct echoaudio *chip = card->private_data;
+
 	if (chip->comm_page)
 		rest_in_peace(chip);
 
 	if (chip->irq >= 0)
 		free_irq(chip->irq, chip);
 
-	if (chip->comm_page)
-		snd_dma_free_pages(&chip->commpage_dma_buf);
-
-	iounmap(chip->dsp_registers);
-	release_and_free_resource(chip->iores);
-	pci_disable_device(chip->pci);
-
 	/* release chip data */
 	free_firmware_cache(chip);
-	kfree(chip);
-	return 0;
-}
-
-
-
-static int snd_echo_dev_free(struct snd_device *device)
-{
-	struct echoaudio *chip = device->device_data;
-
-	return snd_echo_free(chip);
 }
 
-
-
 /* <--snd_echo_probe() */
 static int snd_echo_create(struct snd_card *card,
-			   struct pci_dev *pci,
-			   struct echoaudio **rchip)
+			   struct pci_dev *pci)
 {
-	struct echoaudio *chip;
+	struct echoaudio *chip = card->private_data;
 	int err;
 	size_t sz;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_echo_dev_free,
-	};
-
-	*rchip = NULL;
 
 	pci_write_config_byte(pci, PCI_LATENCY_TIMER, 0xC0);
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	pci_set_master(pci);
 
 	/* Allocate chip if needed */
-	if (!*rchip) {
-		chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-		if (!chip) {
-			pci_disable_device(pci);
-			return -ENOMEM;
-		}
-		dev_dbg(card->dev, "chip=%p\n", chip);
-		spin_lock_init(&chip->lock);
-		chip->card = card;
-		chip->pci = pci;
-		chip->irq = -1;
-		chip->opencount = 0;
-		mutex_init(&chip->mode_mutex);
-		chip->can_set_rate = 1;
-	} else {
-		/* If this was called from the resume function, chip is
-		 * already allocated and it contains current card settings.
-		 */
-		chip = *rchip;
-	}
+	spin_lock_init(&chip->lock);
+	chip->card = card;
+	chip->pci = pci;
+	chip->irq = -1;
+	chip->opencount = 0;
+	mutex_init(&chip->mode_mutex);
+	chip->can_set_rate = 1;
 
 	/* PCI resource allocation */
+	err = pci_request_regions(pci, ECHOCARD_NAME);
+	if (err < 0)
+		return err;
+
 	chip->dsp_registers_phys = pci_resource_start(pci, 0);
 	sz = pci_resource_len(pci, 0);
 	if (sz > PAGE_SIZE)
 		sz = PAGE_SIZE;		/* We map only the required part */
 
-	chip->iores = request_mem_region(chip->dsp_registers_phys, sz,
-					 ECHOCARD_NAME);
-	if (!chip->iores) {
-		dev_err(chip->card->dev, "cannot get memory region\n");
-		snd_echo_free(chip);
-		return -EBUSY;
-	}
-	chip->dsp_registers = ioremap(chip->dsp_registers_phys, sz);
+	chip->dsp_registers = devm_ioremap(&pci->dev, chip->dsp_registers_phys, sz);
 	if (!chip->dsp_registers) {
 		dev_err(chip->card->dev, "ioremap failed\n");
-		snd_echo_free(chip);
 		return -ENOMEM;
 	}
 
 	if (request_irq(pci->irq, snd_echo_interrupt, IRQF_SHARED,
 			KBUILD_MODNAME, chip)) {
 		dev_err(chip->card->dev, "cannot grab irq\n");
-		snd_echo_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
@@ -1988,39 +1946,29 @@ static int snd_echo_create(struct snd_card *card,
 	dev_dbg(card->dev, "pci=%p irq=%d subdev=%04x Init hardware...\n",
 		chip->pci, chip->irq, chip->pci->subsystem_device);
 
+	card->private_free = snd_echo_free;
+
 	/* Create the DSP comm page - this is the area of memory used for most
 	of the communication with the DSP, which accesses it via bus mastering */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
-				sizeof(struct comm_page),
-				&chip->commpage_dma_buf) < 0) {
-		dev_err(chip->card->dev, "cannot allocate the comm page\n");
-		snd_echo_free(chip);
+	chip->commpage_dma_buf =
+		snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV,
+				     sizeof(struct comm_page));
+	if (!chip->commpage_dma_buf)
 		return -ENOMEM;
-	}
-	chip->comm_page_phys = chip->commpage_dma_buf.addr;
-	chip->comm_page = (struct comm_page *)chip->commpage_dma_buf.area;
+	chip->comm_page_phys = chip->commpage_dma_buf->addr;
+	chip->comm_page = (struct comm_page *)chip->commpage_dma_buf->area;
 
 	err = init_hw(chip, chip->pci->device, chip->pci->subsystem_device);
 	if (err >= 0)
 		err = set_mixer_defaults(chip);
 	if (err < 0) {
 		dev_err(card->dev, "init_hw err=%d\n", err);
-		snd_echo_free(chip);
 		return err;
 	}
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_echo_free(chip);
-		return err;
-	}
-	*rchip = chip;
-	/* Init done ! */
 	return 0;
 }
 
-
-
 /* constructor */
 static int snd_echo_probe(struct pci_dev *pci,
 			  const struct pci_device_id *pci_id)
@@ -2040,17 +1988,15 @@ static int snd_echo_probe(struct pci_dev *pci,
 	}
 
 	i = 0;
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
-	chip = NULL;	/* Tells snd_echo_create to allocate chip */
-	err = snd_echo_create(card, pci, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_echo_create(card, pci);
+	if (err < 0)
 		return err;
-	}
 
 	strcpy(card->driver, "Echo_" ECHOCARD_NAME);
 	strcpy(card->shortname, chip->card_name);
@@ -2066,7 +2012,6 @@ static int snd_echo_probe(struct pci_dev *pci,
 	err = snd_echo_new_pcm(chip);
 	if (err < 0) {
 		dev_err(chip->card->dev, "new pcm error %d\n", err);
-		snd_card_free(card);
 		return err;
 	}
 
@@ -2075,7 +2020,6 @@ static int snd_echo_probe(struct pci_dev *pci,
 		err = snd_echo_midi_create(card, chip);
 		if (err < 0) {
 			dev_err(chip->card->dev, "new midi error %d\n", err);
-			snd_card_free(card);
 			return err;
 		}
 	}
@@ -2085,64 +2029,64 @@ static int snd_echo_probe(struct pci_dev *pci,
 	snd_echo_vmixer.count = num_pipes_out(chip) * num_busses_out(chip);
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vmixer, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #ifdef ECHOCARD_HAS_LINE_OUT_GAIN
 	err = snd_ctl_add(chip->card,
 			  snd_ctl_new1(&snd_echo_line_output_gain, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #endif
 #else /* ECHOCARD_HAS_VMIXER */
 	err = snd_ctl_add(chip->card,
 			  snd_ctl_new1(&snd_echo_pcm_output_gain, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #endif /* ECHOCARD_HAS_VMIXER */
 
 #ifdef ECHOCARD_HAS_INPUT_GAIN
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_line_input_gain, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #endif
 
 #ifdef ECHOCARD_HAS_INPUT_NOMINAL_LEVEL
 	if (!chip->hasnt_input_nominal_level) {
 		err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_intput_nominal_level, chip));
 		if (err < 0)
-			goto ctl_error;
+			return err;
 	}
 #endif
 
 #ifdef ECHOCARD_HAS_OUTPUT_NOMINAL_LEVEL
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_output_nominal_level, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #endif
 
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vumeters_switch, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vumeters, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 
 #ifdef ECHOCARD_HAS_MONITOR
 	snd_echo_monitor_mixer.count = num_busses_in(chip) * num_busses_out(chip);
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_monitor_mixer, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #endif
 
 #ifdef ECHOCARD_HAS_DIGITAL_IN_AUTOMUTE
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_automute_switch, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #endif
 
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_channels_info, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 
 #ifdef ECHOCARD_HAS_DIGITAL_MODE_SWITCH
 	/* Creates a list of available digital modes */
@@ -2153,7 +2097,7 @@ static int snd_echo_probe(struct pci_dev *pci,
 
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_digital_mode_switch, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #endif /* ECHOCARD_HAS_DIGITAL_MODE_SWITCH */
 
 #ifdef ECHOCARD_HAS_EXTERNAL_CLOCK
@@ -2167,37 +2111,32 @@ static int snd_echo_probe(struct pci_dev *pci,
 		chip->clock_src_ctl = snd_ctl_new1(&snd_echo_clock_source_switch, chip);
 		err = snd_ctl_add(chip->card, chip->clock_src_ctl);
 		if (err < 0)
-			goto ctl_error;
+			return err;
 	}
 #endif /* ECHOCARD_HAS_EXTERNAL_CLOCK */
 
 #ifdef ECHOCARD_HAS_DIGITAL_IO
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_spdif_mode_switch, chip));
 	if (err < 0)
-		goto ctl_error;
+		return err;
 #endif
 
 #ifdef ECHOCARD_HAS_PHANTOM_POWER
 	if (chip->has_phantom_power) {
 		err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_phantom_power_switch, chip));
 		if (err < 0)
-			goto ctl_error;
+			return err;
 	}
 #endif
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto ctl_error;
+		return err;
 	dev_info(card->dev, "Card registered: %s\n", card->longname);
 
 	pci_set_drvdata(pci, chip);
 	dev++;
 	return 0;
-
-ctl_error:
-	dev_err(card->dev, "new control error %d\n", err);
-	snd_card_free(card);
-	return err;
 }
 
 
@@ -2299,18 +2238,6 @@ static SIMPLE_DEV_PM_OPS(snd_echo_pm, snd_echo_suspend, snd_echo_resume);
 #define SND_ECHO_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP */
 
-
-static void snd_echo_remove(struct pci_dev *pci)
-{
-	struct echoaudio *chip;
-
-	chip = pci_get_drvdata(pci);
-	if (chip)
-		snd_card_free(chip->card);
-}
-
-
-
 /******************************************************************************
 	Everything starts and ends here
 ******************************************************************************/
@@ -2320,7 +2247,6 @@ static struct pci_driver echo_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_echo_ids,
 	.probe = snd_echo_probe,
-	.remove = snd_echo_remove,
 	.driver = {
 		.pm = SND_ECHO_PM_OPS,
 	},
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index 0afe13f7b6e5..d51de3e4edfa 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -348,7 +348,7 @@ struct echoaudio {
 	struct pci_dev *pci;
 	unsigned long dsp_registers_phys;
 	struct resource *iores;
-	struct snd_dma_buffer commpage_dma_buf;
+	struct snd_dma_buffer *commpage_dma_buf;
 	int irq;
 #ifdef ECHOCARD_HAS_MIDI
 	struct snd_rawmidi *rmidi;
-- 
2.26.2


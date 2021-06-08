Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFEE39F8DB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA6717BB;
	Tue,  8 Jun 2021 16:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA6717BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161982;
	bh=XgW36zS+Ax3ucrJG4XksufFb6ieKppIP/lcHlDLjjdc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kw9k+JiqEclKjcSYsUs8tnBULBtQY4gboupKF5KvEPOnrbER4mnw+cJtAOWX9gJTo
	 S/5gAEQ7Sbyz8cQuMtAJWgblcXm8BluAQXWshoh85y7XQ3uKJtqHuxjKn9IyEZrjR9
	 YD9XM+diO/vLObYRcL21OL7Cm4U3jONESMbU2rr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C139F80610;
	Tue,  8 Jun 2021 16:06:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2106F805F4; Tue,  8 Jun 2021 16:06:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CE64F804E2
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE64F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="jOparCTQ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="AN2o5FS7"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2B60D1FDEE
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHl5uqFLjcmOTxz7KLDIAIDPk/Mw4vfRoaOcCaAPwVI=;
 b=jOparCTQoD53DPKR57QWX2zvX8J/Or7uUk3pUAtJk9E74p9evtD7EHnUUOx3Wg3EBuYujf
 ObErf1cVRFmaG8XgMRCe/Su3ldGx84gRyoMfGM2xQLgn/x9ieclcNlGk89NuaAE23/lkau
 oXIG9b10IA/TlaKxyPHjYXSUhYjYjiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHl5uqFLjcmOTxz7KLDIAIDPk/Mw4vfRoaOcCaAPwVI=;
 b=AN2o5FS7X/sIF8eLNnu0Dw78e/9+U3i2GRjya5J5Y1d1Lbz5ARam4ahKItf9UylQue2M2D
 FytjrcGiSBEbwkDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 195BDA3B84;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 48/66] ALSA: hdsp: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:22 +0200
Message-Id: <20210608140540.17885-49-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

PCI HDSP driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c | 121 ++++++++++++++++++++++++++-------------
 1 file changed, 82 insertions(+), 39 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index c79f13b1fc4e..e3e4fabf4abf 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1318,11 +1318,13 @@ static int snd_hdsp_midi_output_write (struct hdsp_midi *hmidi)
 	spin_lock_irqsave (&hmidi->lock, flags);
 	if (hmidi->output) {
 		if (!snd_rawmidi_transmit_empty (hmidi->output)) {
-			if ((n_pending = snd_hdsp_midi_output_possible (hmidi->hdsp, hmidi->id)) > 0) {
+			n_pending = snd_hdsp_midi_output_possible(hmidi->hdsp, hmidi->id);
+			if (n_pending > 0) {
 				if (n_pending > (int)sizeof (buf))
 					n_pending = sizeof (buf);
 
-				if ((to_write = snd_rawmidi_transmit (hmidi->output, buf, n_pending)) > 0) {
+				to_write = snd_rawmidi_transmit(hmidi->output, buf, n_pending);
+				if (to_write > 0) {
 					for (i = 0; i < to_write; ++i)
 						snd_hdsp_midi_write_byte (hmidi->hdsp, hmidi->id, buf[i]);
 				}
@@ -1341,7 +1343,8 @@ static int snd_hdsp_midi_input_read (struct hdsp_midi *hmidi)
 	int i;
 
 	spin_lock_irqsave (&hmidi->lock, flags);
-	if ((n_pending = snd_hdsp_midi_input_available (hmidi->hdsp, hmidi->id)) > 0) {
+	n_pending = snd_hdsp_midi_input_available(hmidi->hdsp, hmidi->id);
+	if (n_pending > 0) {
 		if (hmidi->input) {
 			if (n_pending > (int)sizeof (buf))
 				n_pending = sizeof (buf);
@@ -3322,7 +3325,9 @@ static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
 	}
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_hdsp_controls); idx++) {
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_hdsp_controls[idx], hdsp))) < 0)
+		kctl = snd_ctl_new1(&snd_hdsp_controls[idx], hdsp);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 		if (idx == 1)	/* IEC958 (S/PDIF) Stream */
 			hdsp->spdif_ctl = kctl;
@@ -3331,12 +3336,16 @@ static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
 	/* ADAT SyncCheck status */
 	snd_hdsp_adat_sync_check.name = "ADAT Lock Status";
 	snd_hdsp_adat_sync_check.index = 1;
-	if ((err = snd_ctl_add (card, kctl = snd_ctl_new1(&snd_hdsp_adat_sync_check, hdsp))))
+	kctl = snd_ctl_new1(&snd_hdsp_adat_sync_check, hdsp);
+	err = snd_ctl_add(card, kctl);
+	if (err < 0)
 		return err;
 	if (hdsp->io_type == Digiface || hdsp->io_type == H9652) {
 		for (idx = 1; idx < 3; ++idx) {
 			snd_hdsp_adat_sync_check.index = idx+1;
-			if ((err = snd_ctl_add (card, kctl = snd_ctl_new1(&snd_hdsp_adat_sync_check, hdsp))))
+			kctl = snd_ctl_new1(&snd_hdsp_adat_sync_check, hdsp);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
 		}
 	}
@@ -3344,7 +3353,9 @@ static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
 	/* DA, AD and Phone gain and XLR breakout cable controls for H9632 cards */
 	if (hdsp->io_type == H9632) {
 		for (idx = 0; idx < ARRAY_SIZE(snd_hdsp_9632_controls); idx++) {
-			if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_hdsp_9632_controls[idx], hdsp))) < 0)
+			kctl = snd_ctl_new1(&snd_hdsp_9632_controls[idx], hdsp);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
 		}
 	}
@@ -3362,8 +3373,10 @@ static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
 
 	/* AEB control for H96xx card */
 	if (hdsp->io_type == H9632 || hdsp->io_type == H9652) {
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_hdsp_96xx_aeb, hdsp))) < 0)
-				return err;
+		kctl = snd_ctl_new1(&snd_hdsp_96xx_aeb, hdsp);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
+			return err;
 	}
 
 	return 0;
@@ -3942,7 +3955,8 @@ static char *hdsp_channel_buffer_location(struct hdsp *hdsp,
         if (snd_BUG_ON(channel < 0 || channel >= hdsp->max_channels))
 		return NULL;
 
-	if ((mapped_channel = hdsp->channel_map[channel]) < 0)
+	mapped_channel = hdsp->channel_map[channel];
+	if (mapped_channel < 0)
 		return NULL;
 
 	if (stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -4114,7 +4128,8 @@ static int snd_hdsp_hw_params(struct snd_pcm_substream *substream,
 
 	spin_lock_irq(&hdsp->lock);
 	if (! hdsp->clock_source_locked) {
-		if ((err = hdsp_set_rate(hdsp, params_rate(params), 0)) < 0) {
+		err = hdsp_set_rate(hdsp, params_rate(params), 0);
+		if (err < 0) {
 			spin_unlock_irq(&hdsp->lock);
 			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
 			return err;
@@ -4122,7 +4137,8 @@ static int snd_hdsp_hw_params(struct snd_pcm_substream *substream,
 	}
 	spin_unlock_irq(&hdsp->lock);
 
-	if ((err = hdsp_set_interrupt_interval(hdsp, params_period_size(params))) < 0) {
+	err = hdsp_set_interrupt_interval(hdsp, params_period_size(params));
+	if (err < 0) {
 		_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
 		return err;
 	}
@@ -4854,13 +4870,15 @@ static int snd_hdsp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file, unsigne
 
 		if (hdsp->io_type == H9652 || hdsp->io_type == H9632) return -EINVAL;
 		if (hdsp->io_type == Undefined) {
-			if ((err = hdsp_get_iobox_version(hdsp)) < 0)
+			err = hdsp_get_iobox_version(hdsp);
+			if (err < 0)
 				return err;
 		}
 		memset(&hdsp_version, 0, sizeof(hdsp_version));
 		hdsp_version.io_type = hdsp->io_type;
 		hdsp_version.firmware_rev = hdsp->firmware_rev;
-		if ((err = copy_to_user(argp, &hdsp_version, sizeof(hdsp_version))))
+		err = copy_to_user(argp, &hdsp_version, sizeof(hdsp_version));
+		if (err < 0)
 		    	return -EFAULT;
 		break;
 	}
@@ -4900,17 +4918,20 @@ static int snd_hdsp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file, unsigne
 
 		hdsp->state |= HDSP_FirmwareCached;
 
-		if ((err = snd_hdsp_load_firmware_from_cache(hdsp)) < 0)
+		err = snd_hdsp_load_firmware_from_cache(hdsp);
+		if (err < 0)
 			return err;
 
 		if (!(hdsp->state & HDSP_InitializationComplete)) {
-			if ((err = snd_hdsp_enable_io(hdsp)) < 0)
+			err = snd_hdsp_enable_io(hdsp);
+			if (err < 0)
 				return err;
 
 			snd_hdsp_initialize_channels(hdsp);
 			snd_hdsp_initialize_midi_flush(hdsp);
 
-			if ((err = snd_hdsp_create_alsa_devices(hdsp->card, hdsp)) < 0) {
+			err = snd_hdsp_create_alsa_devices(hdsp->card, hdsp);
+			if (err < 0) {
 				dev_err(hdsp->card->dev,
 					"error creating alsa devices\n");
 				return err;
@@ -4960,7 +4981,8 @@ static int snd_hdsp_create_hwdep(struct snd_card *card, struct hdsp *hdsp)
 	struct snd_hwdep *hw;
 	int err;
 
-	if ((err = snd_hwdep_new(card, "HDSP hwdep", 0, &hw)) < 0)
+	err = snd_hwdep_new(card, "HDSP hwdep", 0, &hw);
+	if (err < 0)
 		return err;
 
 	hdsp->hwdep = hw;
@@ -4978,7 +5000,8 @@ static int snd_hdsp_create_pcm(struct snd_card *card, struct hdsp *hdsp)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(card, hdsp->card_name, 0, 1, 1, &pcm)) < 0)
+	err = snd_pcm_new(card, hdsp->card_name, 0, 1, 1, &pcm);
+	if (err < 0)
 		return err;
 
 	hdsp->pcm = pcm;
@@ -5084,28 +5107,32 @@ static int snd_hdsp_create_alsa_devices(struct snd_card *card, struct hdsp *hdsp
 {
 	int err;
 
-	if ((err = snd_hdsp_create_pcm(card, hdsp)) < 0) {
+	err = snd_hdsp_create_pcm(card, hdsp);
+	if (err < 0) {
 		dev_err(card->dev,
 			"Error creating pcm interface\n");
 		return err;
 	}
 
 
-	if ((err = snd_hdsp_create_midi(card, hdsp, 0)) < 0) {
+	err = snd_hdsp_create_midi(card, hdsp, 0);
+	if (err < 0) {
 		dev_err(card->dev,
 			"Error creating first midi interface\n");
 		return err;
 	}
 
 	if (hdsp->io_type == Digiface || hdsp->io_type == H9652) {
-		if ((err = snd_hdsp_create_midi(card, hdsp, 1)) < 0) {
+		err = snd_hdsp_create_midi(card, hdsp, 1);
+		if (err < 0) {
 			dev_err(card->dev,
 				"Error creating second midi interface\n");
 			return err;
 		}
 	}
 
-	if ((err = snd_hdsp_create_controls(card, hdsp)) < 0) {
+	err = snd_hdsp_create_controls(card, hdsp);
+	if (err < 0) {
 		dev_err(card->dev,
 			"Error creating ctl interface\n");
 		return err;
@@ -5119,7 +5146,8 @@ static int snd_hdsp_create_alsa_devices(struct snd_card *card, struct hdsp *hdsp
 	hdsp->capture_substream = NULL;
 	hdsp->playback_substream = NULL;
 
-	if ((err = snd_hdsp_set_defaults(hdsp)) < 0) {
+	err = snd_hdsp_set_defaults(hdsp);
+	if (err < 0) {
 		dev_err(card->dev,
 			"Error setting default values\n");
 		return err;
@@ -5130,7 +5158,8 @@ static int snd_hdsp_create_alsa_devices(struct snd_card *card, struct hdsp *hdsp
 		sprintf(card->longname, "%s at 0x%lx, irq %d", hdsp->card_name,
 			hdsp->port, hdsp->irq);
 
-		if ((err = snd_card_register(card)) < 0) {
+		err = snd_card_register(card);
+		if (err < 0) {
 			dev_err(card->dev,
 				"error registering card\n");
 			return err;
@@ -5151,7 +5180,8 @@ static int hdsp_request_fw_loader(struct hdsp *hdsp)
 	if (hdsp->io_type == H9652 || hdsp->io_type == H9632)
 		return 0;
 	if (hdsp->io_type == Undefined) {
-		if ((err = hdsp_get_iobox_version(hdsp)) < 0)
+		err = hdsp_get_iobox_version(hdsp);
+		if (err < 0)
 			return err;
 		if (hdsp->io_type == H9652 || hdsp->io_type == H9632)
 			return 0;
@@ -5197,21 +5227,25 @@ static int hdsp_request_fw_loader(struct hdsp *hdsp)
 
 	hdsp->state |= HDSP_FirmwareCached;
 
-	if ((err = snd_hdsp_load_firmware_from_cache(hdsp)) < 0)
+	err = snd_hdsp_load_firmware_from_cache(hdsp);
+	if (err < 0)
 		return err;
 
 	if (!(hdsp->state & HDSP_InitializationComplete)) {
-		if ((err = snd_hdsp_enable_io(hdsp)) < 0)
+		err = snd_hdsp_enable_io(hdsp);
+		if (err < 0)
 			return err;
 
-		if ((err = snd_hdsp_create_hwdep(hdsp->card, hdsp)) < 0) {
+		err = snd_hdsp_create_hwdep(hdsp->card, hdsp);
+		if (err < 0) {
 			dev_err(hdsp->card->dev,
 				"error creating hwdep device\n");
 			return err;
 		}
 		snd_hdsp_initialize_channels(hdsp);
 		snd_hdsp_initialize_midi_flush(hdsp);
-		if ((err = snd_hdsp_create_alsa_devices(hdsp->card, hdsp)) < 0) {
+		err = snd_hdsp_create_alsa_devices(hdsp->card, hdsp);
+		if (err < 0) {
 			dev_err(hdsp->card->dev,
 				"error creating alsa devices\n");
 			return err;
@@ -5280,15 +5314,18 @@ static int snd_hdsp_create(struct snd_card *card,
 		is_9632 = 1;
 	}
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	pci_set_master(hdsp->pci);
 
-	if ((err = pci_request_regions(pci, "hdsp")) < 0)
+	err = pci_request_regions(pci, "hdsp");
+	if (err < 0)
 		return err;
 	hdsp->port = pci_resource_start(pci, 0);
-	if ((hdsp->iobase = ioremap(hdsp->port, HDSP_IO_EXTENT)) == NULL) {
+	hdsp->iobase = ioremap(hdsp->port, HDSP_IO_EXTENT);
+	if (!hdsp->iobase) {
 		dev_err(hdsp->card->dev, "unable to remap region 0x%lx-0x%lx\n",
 			hdsp->port, hdsp->port + HDSP_IO_EXTENT - 1);
 		return -EBUSY;
@@ -5306,7 +5343,8 @@ static int snd_hdsp_create(struct snd_card *card,
 	hdsp->use_midi_work = 1;
 	hdsp->dds_value = 0;
 
-	if ((err = snd_hdsp_initialize_memory(hdsp)) < 0)
+	err = snd_hdsp_initialize_memory(hdsp);
+	if (err < 0)
 		return err;
 
 	if (!is_9652 && !is_9632) {
@@ -5318,7 +5356,8 @@ static int snd_hdsp_create(struct snd_card *card,
 			return err;
 
 		if ((hdsp_read (hdsp, HDSP_statusRegister) & HDSP_DllError) != 0) {
-			if ((err = hdsp_request_fw_loader(hdsp)) < 0)
+			err = hdsp_request_fw_loader(hdsp);
+			if (err < 0)
 				/* we don't fail as this can happen
 				   if userspace is not ready for
 				   firmware upload
@@ -5331,7 +5370,8 @@ static int snd_hdsp_create(struct snd_card *card,
 			/* we defer initialization */
 			dev_info(hdsp->card->dev,
 				 "card initialization pending : waiting for firmware\n");
-			if ((err = snd_hdsp_create_hwdep(card, hdsp)) < 0)
+			err = snd_hdsp_create_hwdep(card, hdsp);
+			if (err < 0)
 				return err;
 			return 0;
 		} else {
@@ -5346,7 +5386,8 @@ static int snd_hdsp_create(struct snd_card *card,
 		}
 	}
 
-	if ((err = snd_hdsp_enable_io(hdsp)) != 0)
+	err = snd_hdsp_enable_io(hdsp);
+	if (err)
 		return err;
 
 	if (is_9652)
@@ -5355,7 +5396,8 @@ static int snd_hdsp_create(struct snd_card *card,
 	if (is_9632)
 		hdsp->io_type = H9632;
 
-	if ((err = snd_hdsp_create_hwdep(card, hdsp)) < 0)
+	err = snd_hdsp_create_hwdep(card, hdsp);
+	if (err < 0)
 		return err;
 
 	snd_hdsp_initialize_channels(hdsp);
@@ -5363,7 +5405,8 @@ static int snd_hdsp_create(struct snd_card *card,
 
 	hdsp->state |= HDSP_FirmwareLoaded;
 
-	if ((err = snd_hdsp_create_alsa_devices(card, hdsp)) < 0)
+	err = snd_hdsp_create_alsa_devices(card, hdsp);
+	if (err < 0)
 		return err;
 
 	return 0;
-- 
2.26.2


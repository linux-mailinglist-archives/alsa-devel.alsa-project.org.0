Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E512539F92D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:31:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6774418CD;
	Tue,  8 Jun 2021 16:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6774418CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162665;
	bh=63a5fEK7qn5VXjZYsCmlUXHq8uLUTju+tB285qTE9C4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7sVfNpouZ47Z2EBjZYur+MNicjLTTrrLnprPe/zzqzEwqZAgtybOW3shLNIav+9z
	 AWEsOQm0y6ry05HyvW/o82win03xZdubWed97oF84vfZNFht9l/oFzsH3b7IejmraY
	 mFJgTXa3ptsWrRZRihZquiP4x+CgYHXrE8VhDU/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A46E3F80753;
	Tue,  8 Jun 2021 16:07:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13309F80684; Tue,  8 Jun 2021 16:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55CF9F80525
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55CF9F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hM1jrWEH"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="eI4Wr+2a"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B85BB219FA
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z47lp9c+QxLL+q97FHhqJAGNuwxF6Mn2AGaa81WjnuU=;
 b=hM1jrWEHoous4VXM23zsibSBphjFqLPjQI7xCs4ZFJFTYmf+dvlsnsqreeNIPJBclktPEi
 xqlE4/Ec9X0qAj/SbLJl+9IChb8fH6ZHvtobcdVYI2dqhIEuxwVUN1iBWKx/jFeEGlLD0a
 3hGSTHjBBMyWAP3iLo1en5XMQYqb0+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z47lp9c+QxLL+q97FHhqJAGNuwxF6Mn2AGaa81WjnuU=;
 b=eI4Wr+2apddk2yfboXlTnE3ZVPpwIxQQswRctcPmHkEm6JPAnwcfDyzIIQpCmrFegcEze7
 qOtw20/JHaiYIOCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B140BA3B89;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 60/66] ALSA: vx: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:34 +0200
Message-Id: <20210608140540.17885-61-tiwai@suse.de>
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

VX driver helper code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/vx/vx_core.c  | 60 ++++++++++++++++++++++++-------------
 sound/drivers/vx/vx_hwdep.c | 12 +++++---
 sound/drivers/vx/vx_mixer.c | 39 ++++++++++++++++--------
 sound/drivers/vx/vx_pcm.c   | 32 +++++++++++++-------
 4 files changed, 95 insertions(+), 48 deletions(-)

diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index a22e5b1a5458..a10449af5a76 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -110,20 +110,25 @@ static int vx_transfer_end(struct vx_core *chip, int cmd)
 {
 	int err;
 
-	if ((err = vx_reset_chk(chip)) < 0)
+	err = vx_reset_chk(chip);
+	if (err < 0)
 		return err;
 
 	/* irq MESS_READ/WRITE_END */
-	if ((err = vx_send_irq_dsp(chip, cmd)) < 0)
+	err = vx_send_irq_dsp(chip, cmd);
+	if (err < 0)
 		return err;
 
 	/* Wait CHK = 1 */
-	if ((err = vx_wait_isr_bit(chip, ISR_CHK)) < 0)
+	err = vx_wait_isr_bit(chip, ISR_CHK);
+	if (err < 0)
 		return err;
 
 	/* If error, Read RX */
-	if ((err = vx_inb(chip, ISR)) & ISR_ERR) {
-		if ((err = vx_wait_for_rx_full(chip)) < 0) {
+	err = vx_inb(chip, ISR);
+	if (err & ISR_ERR) {
+		err = vx_wait_for_rx_full(chip);
+		if (err < 0) {
 			snd_printd(KERN_DEBUG "transfer_end: error in rx_full\n");
 			return err;
 		}
@@ -232,7 +237,8 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 	if (chip->chip_status & VX_STAT_IS_STALE)
 		return -EBUSY;
 
-	if ((err = vx_reset_chk(chip)) < 0) {
+	err = vx_reset_chk(chip);
+	if (err < 0) {
 		snd_printd(KERN_DEBUG "vx_send_msg: vx_reset_chk error\n");
 		return err;
 	}
@@ -254,7 +260,8 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 		rmh->Cmd[0] &= MASK_1_WORD_COMMAND;
 
 	/* Wait for TX empty */
-	if ((err = vx_wait_isr_bit(chip, ISR_TX_EMPTY)) < 0) {
+	err = vx_wait_isr_bit(chip, ISR_TX_EMPTY);
+	if (err < 0) {
 		snd_printd(KERN_DEBUG "vx_send_msg: wait tx empty error\n");
 		return err;
 	}
@@ -265,18 +272,21 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 	vx_outb(chip, TXL, rmh->Cmd[0] & 0xff);
 
 	/* Trigger irq MESSAGE */
-	if ((err = vx_send_irq_dsp(chip, IRQ_MESSAGE)) < 0) {
+	err = vx_send_irq_dsp(chip, IRQ_MESSAGE);
+	if (err < 0) {
 		snd_printd(KERN_DEBUG "vx_send_msg: send IRQ_MESSAGE error\n");
 		return err;
 	}
 
 	/* Wait for CHK = 1 */
-	if ((err = vx_wait_isr_bit(chip, ISR_CHK)) < 0)
+	err = vx_wait_isr_bit(chip, ISR_CHK);
+	if (err < 0)
 		return err;
 
 	/* If error, get error value from RX */
 	if (vx_inb(chip, ISR) & ISR_ERR) {
-		if ((err = vx_wait_for_rx_full(chip)) < 0) {
+		err = vx_wait_for_rx_full(chip);
+		if (err < 0) {
 			snd_printd(KERN_DEBUG "vx_send_msg: rx_full read error\n");
 			return err;
 		}
@@ -292,7 +302,8 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 	if (rmh->LgCmd > 1) {
 		for (i = 1; i < rmh->LgCmd; i++) {
 			/* Wait for TX ready */
-			if ((err = vx_wait_isr_bit(chip, ISR_TX_READY)) < 0) {
+			err = vx_wait_isr_bit(chip, ISR_TX_READY);
+			if (err < 0) {
 				snd_printd(KERN_DEBUG "vx_send_msg: tx_ready error\n");
 				return err;
 			}
@@ -303,13 +314,15 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 			vx_outb(chip, TXL, rmh->Cmd[i] & 0xff);
 
 			/* Trigger irq MESS_READ_NEXT */
-			if ((err = vx_send_irq_dsp(chip, IRQ_MESS_READ_NEXT)) < 0) {
+			err = vx_send_irq_dsp(chip, IRQ_MESS_READ_NEXT);
+			if (err < 0) {
 				snd_printd(KERN_DEBUG "vx_send_msg: IRQ_READ_NEXT error\n");
 				return err;
 			}
 		}
 		/* Wait for TX empty */
-		if ((err = vx_wait_isr_bit(chip, ISR_TX_READY)) < 0) {
+		err = vx_wait_isr_bit(chip, ISR_TX_READY);
+		if (err < 0) {
 			snd_printd(KERN_DEBUG "vx_send_msg: TX_READY error\n");
 			return err;
 		}
@@ -362,17 +375,21 @@ int vx_send_rih_nolock(struct vx_core *chip, int cmd)
 #if 0
 	printk(KERN_DEBUG "send_rih: cmd = 0x%x\n", cmd);
 #endif
-	if ((err = vx_reset_chk(chip)) < 0)
+	err = vx_reset_chk(chip);
+	if (err < 0)
 		return err;
 	/* send the IRQ */
-	if ((err = vx_send_irq_dsp(chip, cmd)) < 0)
+	err = vx_send_irq_dsp(chip, cmd);
+	if (err < 0)
 		return err;
 	/* Wait CHK = 1 */
-	if ((err = vx_wait_isr_bit(chip, ISR_CHK)) < 0)
+	err = vx_wait_isr_bit(chip, ISR_CHK);
+	if (err < 0)
 		return err;
 	/* If error, read RX */
 	if (vx_inb(chip, ISR) & ISR_ERR) {
-		if ((err = vx_wait_for_rx_full(chip)) < 0)
+		err = vx_wait_for_rx_full(chip);
+		if (err < 0)
 			return err;
 		err = vx_inb(chip, RXH) << 16;
 		err |= vx_inb(chip, RXM) << 8;
@@ -648,7 +665,8 @@ int snd_vx_dsp_boot(struct vx_core *chip, const struct firmware *boot)
 	vx_reset_board(chip, cold_reset);
 	vx_validate_irq(chip, 0);
 
-	if ((err = snd_vx_load_boot_image(chip, boot)) < 0)
+	err = snd_vx_load_boot_image(chip, boot);
+	if (err < 0)
 		return err;
 	msleep(10);
 
@@ -678,7 +696,8 @@ int snd_vx_dsp_load(struct vx_core *chip, const struct firmware *dsp)
 	for (i = 0; i < dsp->size; i += 3) {
 		image = dsp->data + i;
 		/* Wait DSP ready for a new read */
-		if ((err = vx_wait_isr_bit(chip, ISR_TX_EMPTY)) < 0) {
+		err = vx_wait_isr_bit(chip, ISR_TX_EMPTY);
+		if (err < 0) {
 			printk(KERN_ERR
 			       "dsp loading error at position %d\n", i);
 			return err;
@@ -698,7 +717,8 @@ int snd_vx_dsp_load(struct vx_core *chip, const struct firmware *dsp)
 
 	msleep(200);
 
-	if ((err = vx_wait_isr_bit(chip, ISR_CHK)) < 0)
+	err = vx_wait_isr_bit(chip, ISR_CHK);
+	if (err < 0)
 		return err;
 
 	vx_toggle_dac_mute(chip, 0);
diff --git a/sound/drivers/vx/vx_hwdep.c b/sound/drivers/vx/vx_hwdep.c
index 01baa6d872e9..efbb644edba1 100644
--- a/sound/drivers/vx/vx_hwdep.c
+++ b/sound/drivers/vx/vx_hwdep.c
@@ -78,15 +78,19 @@ int snd_vx_setup_firmware(struct vx_core *chip)
 
 	/* ok, we reached to the last one */
 	/* create the devices if not built yet */
-	if ((err = snd_vx_pcm_new(chip)) < 0)
+	err = snd_vx_pcm_new(chip);
+	if (err < 0)
 		return err;
 
-	if ((err = snd_vx_mixer_new(chip)) < 0)
+	err = snd_vx_mixer_new(chip);
+	if (err < 0)
 		return err;
 
-	if (chip->ops->add_controls)
-		if ((err = chip->ops->add_controls(chip)) < 0)
+	if (chip->ops->add_controls) {
+		err = chip->ops->add_controls(chip);
+		if (err < 0)
 			return err;
+	}
 
 	chip->chip_status |= VX_STAT_DEVICE_INIT;
 	chip->chip_status |= VX_STAT_CHIP_INIT;
diff --git a/sound/drivers/vx/vx_mixer.c b/sound/drivers/vx/vx_mixer.c
index 13099f8c84d6..53d78eb13c53 100644
--- a/sound/drivers/vx/vx_mixer.c
+++ b/sound/drivers/vx/vx_mixer.c
@@ -910,7 +910,8 @@ int snd_vx_mixer_new(struct vx_core *chip)
 		temp = vx_control_output_level;
 		temp.index = i;
 		temp.tlv.p = chip->hw->output_level_db_scale;
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 	}
 
@@ -921,22 +922,26 @@ int snd_vx_mixer_new(struct vx_core *chip)
 		temp.index = i;
 		temp.name = "PCM Playback Volume";
 		temp.private_value = val;
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 		temp = vx_control_output_switch;
 		temp.index = i;
 		temp.private_value = val;
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 		temp = vx_control_monitor_gain;
 		temp.index = i;
 		temp.private_value = val;
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 		temp = vx_control_monitor_switch;
 		temp.index = i;
 		temp.private_value = val;
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 	}
 	for (i = 0; i < chip->hw->num_outs; i++) {
@@ -944,20 +949,25 @@ int snd_vx_mixer_new(struct vx_core *chip)
 		temp.index = i;
 		temp.name = "PCM Capture Volume";
 		temp.private_value = (i * 2) | (1 << 8);
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 	}
 
 	/* Audio source */
-	if ((err = snd_ctl_add(card, snd_ctl_new1(&vx_control_audio_src, chip))) < 0)
+	err = snd_ctl_add(card, snd_ctl_new1(&vx_control_audio_src, chip));
+	if (err < 0)
 		return err;
 	/* clock mode */
-	if ((err = snd_ctl_add(card, snd_ctl_new1(&vx_control_clock_mode, chip))) < 0)
+	err = snd_ctl_add(card, snd_ctl_new1(&vx_control_clock_mode, chip));
+	if (err < 0)
 		return err;
 	/* IEC958 controls */
-	if ((err = snd_ctl_add(card, snd_ctl_new1(&vx_control_iec958_mask, chip))) < 0)
+	err = snd_ctl_add(card, snd_ctl_new1(&vx_control_iec958_mask, chip));
+	if (err < 0)
 		return err;
-	if ((err = snd_ctl_add(card, snd_ctl_new1(&vx_control_iec958, chip))) < 0)
+	err = snd_ctl_add(card, snd_ctl_new1(&vx_control_iec958, chip));
+	if (err < 0)
 		return err;
 	/* VU, peak, saturation meters */
 	for (c = 0; c < 2; c++) {
@@ -968,7 +978,8 @@ int snd_vx_mixer_new(struct vx_core *chip)
 				temp = vx_control_saturation;
 				temp.index = i;
 				temp.private_value = val;
-				if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+				err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+				if (err < 0)
 					return err;
 			}
 			sprintf(name, "%s VU Meter", dir[c]);
@@ -976,14 +987,16 @@ int snd_vx_mixer_new(struct vx_core *chip)
 			temp.index = i;
 			temp.name = name;
 			temp.private_value = val;
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+			if (err < 0)
 				return err;
 			sprintf(name, "%s Peak Meter", dir[c]);
 			temp = vx_control_peak_meter;
 			temp.index = i;
 			temp.name = name;
 			temp.private_value = val;
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&temp, chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&temp, chip));
+			if (err < 0)
 				return err;
 		}
 	}
diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index daffda99b4f7..3924f5283745 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -341,10 +341,12 @@ static int vx_toggle_pipe(struct vx_core *chip, struct vx_pipe *pipe, int state)
 		}
 	}
     
-	if ((err = vx_conf_pipe(chip, pipe)) < 0)
+	err = vx_conf_pipe(chip, pipe);
+	if (err < 0)
 		return err;
 
-	if ((err = vx_send_irqa(chip)) < 0)
+	err = vx_send_irqa(chip);
+	if (err < 0)
 		return err;
     
 	/* If it completes successfully, wait for the pipes
@@ -680,8 +682,9 @@ static void vx_pcm_playback_transfer(struct vx_core *chip,
 	if (! pipe->prepared || (chip->chip_status & VX_STAT_IS_STALE))
 		return;
 	for (i = 0; i < nchunks; i++) {
-		if ((err = vx_pcm_playback_transfer_chunk(chip, runtime, pipe,
-							  chip->ibl.size)) < 0)
+		err = vx_pcm_playback_transfer_chunk(chip, runtime, pipe,
+						     chip->ibl.size);
+		if (err < 0)
 			return;
 	}
 }
@@ -698,7 +701,8 @@ static void vx_pcm_playback_update(struct vx_core *chip,
 	struct snd_pcm_runtime *runtime = subs->runtime;
 
 	if (pipe->running && ! (chip->chip_status & VX_STAT_IS_STALE)) {
-		if ((err = vx_update_pipe_position(chip, runtime, pipe)) < 0)
+		err = vx_update_pipe_position(chip, runtime, pipe);
+		if (err < 0)
 			return;
 		if (pipe->transferred >= (int)runtime->period_size) {
 			pipe->transferred %= runtime->period_size;
@@ -747,11 +751,13 @@ static int vx_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
 		pipe->running = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if ((err = vx_toggle_pipe(chip, pipe, 0)) < 0)
+		err = vx_toggle_pipe(chip, pipe, 0);
+		if (err < 0)
 			return err;
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if ((err = vx_toggle_pipe(chip, pipe, 1)) < 0)
+		err = vx_toggle_pipe(chip, pipe, 1);
+		if (err < 0)
 			return err;
 		break;
 	default:
@@ -792,13 +798,15 @@ static int vx_pcm_prepare(struct snd_pcm_substream *subs)
 		snd_printdd(KERN_DEBUG "reopen the pipe with data_mode = %d\n", data_mode);
 		vx_init_rmh(&rmh, CMD_FREE_PIPE);
 		vx_set_pipe_cmd_params(&rmh, 0, pipe->number, 0);
-		if ((err = vx_send_msg(chip, &rmh)) < 0)
+		err = vx_send_msg(chip, &rmh);
+		if (err < 0)
 			return err;
 		vx_init_rmh(&rmh, CMD_RES_PIPE);
 		vx_set_pipe_cmd_params(&rmh, 0, pipe->number, pipe->channels);
 		if (data_mode)
 			rmh.Cmd[0] |= BIT_DATA_MODE;
-		if ((err = vx_send_msg(chip, &rmh)) < 0)
+		err = vx_send_msg(chip, &rmh);
+		if (err < 0)
 			return err;
 		pipe->data_mode = data_mode;
 	}
@@ -810,7 +818,8 @@ static int vx_pcm_prepare(struct snd_pcm_substream *subs)
 	}
 	vx_set_clock(chip, runtime->rate);
 
-	if ((err = vx_set_format(chip, pipe, runtime)) < 0)
+	err = vx_set_format(chip, pipe, runtime);
+	if (err < 0)
 		return err;
 
 	if (vx_is_pcmcia(chip)) {
@@ -1187,7 +1196,8 @@ int snd_vx_pcm_new(struct vx_core *chip)
 	unsigned int i;
 	int err;
 
-	if ((err = vx_init_audio_io(chip)) < 0)
+	err = vx_init_audio_io(chip);
+	if (err < 0)
 		return err;
 
 	for (i = 0; i < chip->hw->num_codecs; i++) {
-- 
2.26.2


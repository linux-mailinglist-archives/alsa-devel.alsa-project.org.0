Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B639F8B6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:14:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D1AB171A;
	Tue,  8 Jun 2021 16:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D1AB171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161673;
	bh=e/kjXKDAZf6C4zOp3AiWXMlBCHkSDqcFv2rFQ675ZSw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U5vx89Vi+JSX1zHEZIdN27IhsDoI409WrupWuQhpjWEQZV6NmJSi0PLdIJTmY4BPz
	 hneL/uIZu7iznG8g/yvRICEa2pUZMwQTUDBrg4f1ak9Kzk3KR0Fbupnx4K0ZjEVwm/
	 ZscHdhnvWHbwUHh+rFXN7QEoNy65CaILSYd/2TxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9FE4F804E1;
	Tue,  8 Jun 2021 16:06:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CFF2F804D6; Tue,  8 Jun 2021 16:06:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0375CF804D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0375CF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="XgasgLrN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qgd5OAWy"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B0C061FD5D
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dyjkCvN+JsoW12iEOzkOaCETkRhgNPUGAI/Tlony50=;
 b=XgasgLrNahJ83L1HcpOuSq83vDFA264nsVHauFjMFKt9Ff2oh0Skznb2S9YwBYNcekBc43
 Zg2PIImsd0xzIukwXH0umk58/YwiaSuVEL6aCQ6zgMsUVn4mrlQZfCF5wmW5y/GKEupx8z
 mCI0095dtWn15y5JEW93DL58jceyleo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dyjkCvN+JsoW12iEOzkOaCETkRhgNPUGAI/Tlony50=;
 b=qgd5OAWynaIrjLZEgPTi6kyE6kOerkER/BFbhUpDwa8S1XZ7tBtY7fzqSQF+09RiGRUKxY
 XwZuQxwVjW90ZkDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A0CDEA3B84;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 22/66] ALSA: cmipci: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:56 +0200
Message-Id: <20210608140540.17885-23-tiwai@suse.de>
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

PCI CMIPCI driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cmipci.c | 83 ++++++++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 28 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 598446348da6..f44f118aacad 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -1225,9 +1225,11 @@ static int setup_spdif_playback(struct cmipci *cm, struct snd_pcm_substream *sub
 
 	rate = subs->runtime->rate;
 
-	if (up && do_ac3)
-		if ((err = save_mixer_state(cm)) < 0)
+	if (up && do_ac3) {
+		err = save_mixer_state(cm);
+		if (err < 0)
 			return err;
+	}
 
 	spin_lock_irq(&cm->reg_lock);
 	cm->spdif_playback_avail = up;
@@ -1276,7 +1278,8 @@ static int snd_cmipci_playback_prepare(struct snd_pcm_substream *substream)
 		    substream->runtime->channels == 2);
 	if (do_spdif && cm->can_ac3_hw) 
 		do_ac3 = cm->dig_pcm_status & IEC958_AES0_NONAUDIO;
-	if ((err = setup_spdif_playback(cm, substream, do_spdif, do_ac3)) < 0)
+	err = setup_spdif_playback(cm, substream, do_spdif, do_ac3);
+	if (err < 0)
 		return err;
 	return snd_cmipci_pcm_prepare(cm, &cm->channel[CM_CH_PLAY], substream);
 }
@@ -1291,7 +1294,8 @@ static int snd_cmipci_playback_spdif_prepare(struct snd_pcm_substream *substream
 		do_ac3 = cm->dig_pcm_status & IEC958_AES0_NONAUDIO;
 	else
 		do_ac3 = 1; /* doesn't matter */
-	if ((err = setup_spdif_playback(cm, substream, 1, do_ac3)) < 0)
+	err = setup_spdif_playback(cm, substream, 1, do_ac3);
+	if (err < 0)
 		return err;
 	return snd_cmipci_pcm_prepare(cm, &cm->channel[CM_CH_PLAY], substream);
 }
@@ -1639,7 +1643,8 @@ static int snd_cmipci_playback_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	if ((err = open_device_check(cm, CM_OPEN_PLAYBACK, substream)) < 0)
+	err = open_device_check(cm, CM_OPEN_PLAYBACK, substream);
+	if (err < 0)
 		return err;
 	runtime->hw = snd_cmipci_playback;
 	if (cm->chip_version == 68) {
@@ -1665,7 +1670,8 @@ static int snd_cmipci_capture_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	if ((err = open_device_check(cm, CM_OPEN_CAPTURE, substream)) < 0)
+	err = open_device_check(cm, CM_OPEN_CAPTURE, substream);
+	if (err < 0)
 		return err;
 	runtime->hw = snd_cmipci_capture;
 	if (cm->chip_version == 68) {	// 8768 only supports 44k/48k recording
@@ -1689,7 +1695,9 @@ static int snd_cmipci_playback2_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	if ((err = open_device_check(cm, CM_OPEN_PLAYBACK2, substream)) < 0) /* use channel B */
+	/* use channel B */
+	err = open_device_check(cm, CM_OPEN_PLAYBACK2, substream);
+	if (err < 0)
 		return err;
 	runtime->hw = snd_cmipci_playback2;
 	mutex_lock(&cm->open_mutex);
@@ -1727,7 +1735,9 @@ static int snd_cmipci_playback_spdif_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	if ((err = open_device_check(cm, CM_OPEN_SPDIF_PLAYBACK, substream)) < 0) /* use channel A */
+	/* use channel A */
+	err = open_device_check(cm, CM_OPEN_SPDIF_PLAYBACK, substream);
+	if (err < 0)
 		return err;
 	if (cm->can_ac3_hw) {
 		runtime->hw = snd_cmipci_playback_spdif;
@@ -1754,7 +1764,9 @@ static int snd_cmipci_capture_spdif_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	if ((err = open_device_check(cm, CM_OPEN_SPDIF_CAPTURE, substream)) < 0) /* use channel B */
+	/* use channel B */
+	err = open_device_check(cm, CM_OPEN_SPDIF_CAPTURE, substream);
+	if (err < 0)
 		return err;
 	runtime->hw = snd_cmipci_capture_spdif;
 	if (cm->can_96k && !(cm->chip_version == 68)) {
@@ -2650,7 +2662,8 @@ static int snd_cmipci_mixer_new(struct cmipci *cm, int pcm_spdif_device)
 				"PCM Playback Volume"))
 				continue;
 		}
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_cmipci_mixers[idx], cm))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_cmipci_mixers[idx], cm));
+		if (err < 0)
 			return err;
 	}
 
@@ -2675,13 +2688,19 @@ static int snd_cmipci_mixer_new(struct cmipci *cm, int pcm_spdif_device)
 				return err;
 		}
 		if (cm->can_ac3_hw) {
-			if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_cmipci_spdif_default, cm))) < 0)
+			kctl = snd_ctl_new1(&snd_cmipci_spdif_default, cm);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
 			kctl->id.device = pcm_spdif_device;
-			if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_cmipci_spdif_mask, cm))) < 0)
+			kctl = snd_ctl_new1(&snd_cmipci_spdif_mask, cm);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
 			kctl->id.device = pcm_spdif_device;
-			if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_cmipci_spdif_stream, cm))) < 0)
+			kctl = snd_ctl_new1(&snd_cmipci_spdif_stream, cm);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
 			kctl->id.device = pcm_spdif_device;
 		}
@@ -2955,7 +2974,8 @@ static int snd_cmipci_create_fm(struct cmipci *cm, long fm_port)
 			goto disable_fm;
 		}
 	}
-	if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
+	err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+	if (err < 0) {
 		dev_err(cm->card->dev, "cannot create OPL3 hwdep\n");
 		return err;
 	}
@@ -2987,7 +3007,8 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 
 	*rcmipci = NULL;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	cm = kzalloc(sizeof(*cm), GFP_KERNEL);
@@ -3006,7 +3027,8 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	cm->channel[1].ch = 1;
 	cm->channel[0].is_dac = cm->channel[1].is_dac = 1; /* dual DAC mode */
 
-	if ((err = pci_request_regions(pci, card->driver)) < 0) {
+	err = pci_request_regions(pci, card->driver);
+	if (err < 0) {
 		kfree(cm);
 		pci_disable_device(pci);
 		return err;
@@ -3120,7 +3142,8 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	sprintf(card->longname, "%s%s at %#lx, irq %i",
 		card->shortname, modelstr, cm->iobase, cm->irq);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, cm, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, cm, &ops);
+	if (err < 0) {
 		snd_cmipci_free(cm);
 		return err;
 	}
@@ -3172,32 +3195,36 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 
 	/* create pcm devices */
 	pcm_index = pcm_spdif_index = 0;
-	if ((err = snd_cmipci_pcm_new(cm, pcm_index)) < 0)
+	err = snd_cmipci_pcm_new(cm, pcm_index);
+	if (err < 0)
 		return err;
 	pcm_index++;
-	if ((err = snd_cmipci_pcm2_new(cm, pcm_index)) < 0)
+	err = snd_cmipci_pcm2_new(cm, pcm_index);
+	if (err < 0)
 		return err;
 	pcm_index++;
 	if (cm->can_ac3_hw || cm->can_ac3_sw) {
 		pcm_spdif_index = pcm_index;
-		if ((err = snd_cmipci_pcm_spdif_new(cm, pcm_index)) < 0)
+		err = snd_cmipci_pcm_spdif_new(cm, pcm_index);
+		if (err < 0)
 			return err;
 	}
 
 	/* create mixer interface & switches */
-	if ((err = snd_cmipci_mixer_new(cm, pcm_spdif_index)) < 0)
+	err = snd_cmipci_mixer_new(cm, pcm_spdif_index);
+	if (err < 0)
 		return err;
 
 	if (iomidi > 0) {
-		if ((err = snd_mpu401_uart_new(card, 0, MPU401_HW_CMIPCI,
-					       iomidi,
-					       (integrated_midi ?
-						MPU401_INFO_INTEGRATED : 0) |
-					       MPU401_INFO_IRQ_HOOK,
-					       -1, &cm->rmidi)) < 0) {
+		err = snd_mpu401_uart_new(card, 0, MPU401_HW_CMIPCI,
+					  iomidi,
+					  (integrated_midi ?
+					   MPU401_INFO_INTEGRATED : 0) |
+					  MPU401_INFO_IRQ_HOOK,
+					  -1, &cm->rmidi);
+		if (err < 0)
 			dev_err(cm->card->dev,
 				"no UART401 device at 0x%lx\n", iomidi);
-		}
 	}
 
 #ifdef USE_VAR48KRATE
-- 
2.26.2


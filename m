Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9D739F935
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9F3B18A2;
	Tue,  8 Jun 2021 16:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9F3B18A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162730;
	bh=MpHqU7KxekfEr1HHcoptAw+LGIQtke2wXYo2nQKdee0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WroNeyaLv7p9mRbRN0IsEm3NZCTWMxPaJNd46a2bQP05ZR3cC3DpWIOjDRdmblZli
	 R1EXOEfI4/EdMqy7HzMuUF2N0xaZZSrRrD1M64SB94XbDANwpZkZX5z6o4OxpewfV/
	 RRCOy0Px4LWlNSLIo1wJfYUwlZ1qfhL/e16rS7mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D793F80769;
	Tue,  8 Jun 2021 16:07:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7A07F80688; Tue,  8 Jun 2021 16:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DB13F8051E
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DB13F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Wy9162Or"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="9t88W6XP"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3529F219E6
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ygfpauNXyCcv3BSyNHTtrakzqgK/d6yg2s6K34gwJEY=;
 b=Wy9162Or++LmihXwgfXVpHKaY2VTQ7xodiZSYcqVbpM8+IyObpgZdTKCKqUOBx1oqMX4qb
 0V8epvitCGPYH9NnONvraNOkRG74t2lBv5MUM8c2kJRmZ6gI37ljkA6EdD2bjnqE0a6Wdv
 qfswScgxrQxisfIo9pP87rs/LubUNmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ygfpauNXyCcv3BSyNHTtrakzqgK/d6yg2s6K34gwJEY=;
 b=9t88W6XPWPLxvuTqxj8LjmwBoTETYevvmIjUivzdUzXop3AGDbOyIyRWFx74+6MSPX1psU
 H/r+bwo/9fhu2YBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 2EC9FA3B88;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 31/66] ALSA: rme96: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:05 +0200
Message-Id: <20210608140540.17885-32-tiwai@suse.de>
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

PCI RME96 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes (only systematic
conversions except for a few rate handling codes), no functional
changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme96.c | 148 +++++++++++++++++++++++++---------------------
 1 file changed, 82 insertions(+), 66 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 66082e9f526d..fc7ac077559c 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -666,12 +666,14 @@ snd_rme96_playback_getrate(struct rme96 *rme96)
 	int rate, dummy;
 
 	if (!(rme96->wcreg & RME96_WCR_MASTER) &&
-            snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG &&
-	    (rate = snd_rme96_capture_getrate(rme96, &dummy)) > 0)
-	{
-	        /* slave clock */
-	        return rate;
+	    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG) {
+		rate = snd_rme96_capture_getrate(rme96, &dummy);
+		if (rate > 0) {
+			/* slave clock */
+			return rate;
+		}
 	}
+
 	rate = ((rme96->wcreg >> RME96_WCR_BITPOS_FREQ_0) & 1) +
 		(((rme96->wcreg >> RME96_WCR_BITPOS_FREQ_1) & 1) << 1);
 	switch (rate) {
@@ -984,10 +986,11 @@ snd_rme96_playback_hw_params(struct snd_pcm_substream *substream,
 	runtime->dma_bytes = RME96_BUFFER_SIZE;
 
 	spin_lock_irq(&rme96->lock);
+	rate = 0;
 	if (!(rme96->wcreg & RME96_WCR_MASTER) &&
-            snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG &&
-	    (rate = snd_rme96_capture_getrate(rme96, &dummy)) > 0)
-	{
+	    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG)
+		rate = snd_rme96_capture_getrate(rme96, &dummy);
+	if (rate > 0) {
                 /* slave clock */
                 if ((int)params_rate(params) != rate) {
 			err = -EIO;
@@ -1046,28 +1049,30 @@ snd_rme96_capture_hw_params(struct snd_pcm_substream *substream,
 	runtime->dma_bytes = RME96_BUFFER_SIZE;
 
 	spin_lock_irq(&rme96->lock);
-	if ((err = snd_rme96_capture_setformat(rme96, params_format(params))) < 0) {
+	err = snd_rme96_capture_setformat(rme96, params_format(params));
+	if (err < 0) {
 		spin_unlock_irq(&rme96->lock);
 		return err;
 	}
 	if (snd_rme96_getinputtype(rme96) == RME96_INPUT_ANALOG) {
-		if ((err = snd_rme96_capture_analog_setrate(rme96,
-							    params_rate(params))) < 0)
-		{
+		err = snd_rme96_capture_analog_setrate(rme96, params_rate(params));
+		if (err < 0) {
 			spin_unlock_irq(&rme96->lock);
 			return err;
 		}
-	} else if ((rate = snd_rme96_capture_getrate(rme96, &isadat)) > 0) {
-                if ((int)params_rate(params) != rate) {
-			spin_unlock_irq(&rme96->lock);
-			return -EIO;                    
-                }
-                if ((isadat && runtime->hw.channels_min == 2) ||
-                    (!isadat && runtime->hw.channels_min == 8))
-                {
-			spin_unlock_irq(&rme96->lock);
-			return -EIO;
-                }
+	} else {
+		rate = snd_rme96_capture_getrate(rme96, &isadat);
+		if (rate > 0) {
+			if ((int)params_rate(params) != rate) {
+				spin_unlock_irq(&rme96->lock);
+				return -EIO;
+			}
+			if ((isadat && runtime->hw.channels_min == 2) ||
+			    (!isadat && runtime->hw.channels_min == 8)) {
+				spin_unlock_irq(&rme96->lock);
+				return -EIO;
+			}
+		}
         }
 	snd_rme96_setframelog(rme96, params_channels(params), 0);
 	if (rme96->playback_periodsize != 0) {
@@ -1160,8 +1165,10 @@ rme96_set_buffer_size_constraint(struct rme96 *rme96,
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				     RME96_BUFFER_SIZE);
-	if ((size = rme96->playback_periodsize) != 0 ||
-	    (size = rme96->capture_periodsize) != 0)
+	size = rme96->playback_periodsize;
+	if (!size)
+		size = rme96->capture_periodsize;
+	if (size)
 		snd_pcm_hw_constraint_single(runtime,
 					     SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 					     size);
@@ -1191,13 +1198,14 @@ snd_rme96_playback_spdif_open(struct snd_pcm_substream *substream)
 
 	runtime->hw = snd_rme96_playback_spdif_info;
 	if (!(rme96->wcreg & RME96_WCR_MASTER) &&
-            snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG &&
-	    (rate = snd_rme96_capture_getrate(rme96, &dummy)) > 0)
-	{
-                /* slave clock */
-                runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
-                runtime->hw.rate_min = rate;
-                runtime->hw.rate_max = rate;
+	    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG) {
+		rate = snd_rme96_capture_getrate(rme96, &dummy);
+		if (rate > 0) {
+			/* slave clock */
+			runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
+			runtime->hw.rate_min = rate;
+			runtime->hw.rate_max = rate;
+		}
 	}        
 	rme96_set_buffer_size_constraint(rme96, runtime);
 
@@ -1217,16 +1225,16 @@ snd_rme96_capture_spdif_open(struct snd_pcm_substream *substream)
 
 	snd_pcm_set_sync(substream);
 	runtime->hw = snd_rme96_capture_spdif_info;
-        if (snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG &&
-            (rate = snd_rme96_capture_getrate(rme96, &isadat)) > 0)
-        {
-                if (isadat) {
-                        return -EIO;
-                }
-                runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
-                runtime->hw.rate_min = rate;
-                runtime->hw.rate_max = rate;
-        }
+	if (snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG) {
+		rate = snd_rme96_capture_getrate(rme96, &isadat);
+		if (rate > 0) {
+			if (isadat)
+				return -EIO;
+			runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
+			runtime->hw.rate_min = rate;
+			runtime->hw.rate_max = rate;
+		}
+	}
         
 	spin_lock_irq(&rme96->lock);
 	if (rme96->capture_substream) {
@@ -1260,14 +1268,16 @@ snd_rme96_playback_adat_open(struct snd_pcm_substream *substream)
 	
 	runtime->hw = snd_rme96_playback_adat_info;
 	if (!(rme96->wcreg & RME96_WCR_MASTER) &&
-            snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG &&
-	    (rate = snd_rme96_capture_getrate(rme96, &dummy)) > 0)
-	{
-                /* slave clock */
-                runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
-                runtime->hw.rate_min = rate;
-                runtime->hw.rate_max = rate;
-	}        
+	    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG) {
+		rate = snd_rme96_capture_getrate(rme96, &dummy);
+		if (rate > 0) {
+			/* slave clock */
+			runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
+			runtime->hw.rate_min = rate;
+			runtime->hw.rate_max = rate;
+		}
+	}
+
 	rme96_set_buffer_size_constraint(rme96, runtime);
 	return 0;
 }
@@ -1286,7 +1296,8 @@ snd_rme96_capture_adat_open(struct snd_pcm_substream *substream)
                    expension cards AEB4/8-I are RME96_INPUT_INTERNAL */
                 return -EIO;
         }
-        if ((rate = snd_rme96_capture_getrate(rme96, &isadat)) > 0) {
+	rate = snd_rme96_capture_getrate(rme96, &isadat);
+	if (rate > 0) {
                 if (!isadat) {
                         return -EIO;
                 }
@@ -1603,10 +1614,12 @@ snd_rme96_create(struct rme96 *rme96)
 	rme96->irq = -1;
 	spin_lock_init(&rme96->lock);
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
-	if ((err = pci_request_regions(pci, "RME96")) < 0)
+	err = pci_request_regions(pci, "RME96");
+	if (err < 0)
 		return err;
 	rme96->port = pci_resource_start(rme96->pci, 0);
 
@@ -1630,11 +1643,11 @@ snd_rme96_create(struct rme96 *rme96)
 	pci_read_config_byte(pci, 8, &rme96->rev);	
 	
 	/* set up ALSA pcm device for S/PDIF */
-	if ((err = snd_pcm_new(rme96->card, "Digi96 IEC958", 0,
-			       1, 1, &rme96->spdif_pcm)) < 0)
-	{
+	err = snd_pcm_new(rme96->card, "Digi96 IEC958", 0,
+			  1, 1, &rme96->spdif_pcm);
+	if (err < 0)
 		return err;
-	}
+
 	rme96->spdif_pcm->private_data = rme96;
 	rme96->spdif_pcm->private_free = snd_rme96_free_spdif_pcm;
 	strcpy(rme96->spdif_pcm->name, "Digi96 IEC958");
@@ -1648,11 +1661,10 @@ snd_rme96_create(struct rme96 *rme96)
 		/* ADAT is not available on the base model */
 		rme96->adat_pcm = NULL;
 	} else {
-		if ((err = snd_pcm_new(rme96->card, "Digi96 ADAT", 1,
-				       1, 1, &rme96->adat_pcm)) < 0)
-		{
+		err = snd_pcm_new(rme96->card, "Digi96 ADAT", 1,
+				  1, 1, &rme96->adat_pcm);
+		if (err < 0)
 			return err;
-		}		
 		rme96->adat_pcm->private_data = rme96;
 		rme96->adat_pcm->private_free = snd_rme96_free_adat_pcm;
 		strcpy(rme96->adat_pcm->name, "Digi96 ADAT");
@@ -1701,9 +1713,9 @@ snd_rme96_create(struct rme96 *rme96)
 	}
 	
 	/* init switch interface */
-	if ((err = snd_rme96_create_switches(rme96->card, rme96)) < 0) {
+	err = snd_rme96_create_switches(rme96->card, rme96);
+	if (err < 0)
 		return err;
-	}
 
         /* init proc interface */
 	snd_rme96_proc_init(rme96);
@@ -2336,16 +2348,20 @@ snd_rme96_create_switches(struct snd_card *card,
 	struct snd_kcontrol *kctl;
 
 	for (idx = 0; idx < 7; idx++) {
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_rme96_controls[idx], rme96))) < 0)
+		kctl = snd_ctl_new1(&snd_rme96_controls[idx], rme96);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 		if (idx == 1)	/* IEC958 (S/PDIF) Stream */
 			rme96->spdif_ctl = kctl;
 	}
 
 	if (RME96_HAS_ANALOG_OUT(rme96)) {
-		for (idx = 7; idx < 10; idx++)
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_rme96_controls[idx], rme96))) < 0)
+		for (idx = 7; idx < 10; idx++) {
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_rme96_controls[idx], rme96));
+			if (err < 0)
 				return err;
+		}
 	}
 	
 	return 0;
-- 
2.26.2


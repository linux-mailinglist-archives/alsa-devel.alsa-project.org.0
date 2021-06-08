Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B64C39F897
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:12:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B16174A;
	Tue,  8 Jun 2021 16:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B16174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161538;
	bh=56lKQAhZC10mtO1kGmqV91Sc0vrvUIV1VcXoukTei4c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DMERE28nPP5GYmdVBZwg+dN5idfNHZULfCuigPCAyjIpPcysp96rzDFWZX977k4EA
	 IcHQ4fM+qpLj+QHUE51uC4ZMBxRC19582TuMHTwL2eD8voVZ0DXEs3Zxcayim1fIbG
	 Go6vsro81Hyo1JffKJz2f6RrNHUtlVpK0/c820mI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74826F804D2;
	Tue,  8 Jun 2021 16:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCCC2F80568; Tue,  8 Jun 2021 16:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3935DF804CC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3935DF804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="fzqNuTgF"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8dfr2JgN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D6CCC219DD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFgdiVvOwqL9CQJiULO3bRQ7HnLstTqFwFD86fz2aTk=;
 b=fzqNuTgFcNc8HE5x4XBG3c6nplBE9SYcTzciC1UvCz6IxmiC+uXT2s/K3IoiD7Fh3Fr5Nj
 3he/iHTMGC2iWYgSCSFoEvffS1cYFO9ANcJq1EMlgOIwEkw6xl3xVTa5w05XLVcs68/P4V
 5DzrHbx+plpsgto9JyMsdfcFzp5Oy78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFgdiVvOwqL9CQJiULO3bRQ7HnLstTqFwFD86fz2aTk=;
 b=8dfr2JgN9kUU9aqoohcyAfOT2aQxWRAtcT4uPKboTVTg8s90XidqtS/g19fLVNZLoW29/1
 s+E72+z2fl2FS3Cw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C6341A3B85;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/66] ALSA: wavefront: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:40 +0200
Message-Id: <20210608140540.17885-7-tiwai@suse.de>
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

ISA WaveFront driver code contains lots of assignments in if
condition, which is a bad coding style that may confuse readers and
occasionally lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wavefront/wavefront.c       |  6 ++-
 sound/isa/wavefront/wavefront_midi.c  | 20 ++++++----
 sound/isa/wavefront/wavefront_synth.c | 56 ++++++++++++++++-----------
 3 files changed, 50 insertions(+), 32 deletions(-)

diff --git a/sound/isa/wavefront/wavefront.c b/sound/isa/wavefront/wavefront.c
index a4437971df2f..dfdeaf7b6bf4 100644
--- a/sound/isa/wavefront/wavefront.c
+++ b/sound/isa/wavefront/wavefront.c
@@ -555,7 +555,8 @@ static int snd_wavefront_isa_probe(struct device *pdev,
 	err = snd_wavefront_card_new(pdev, dev, &card);
 	if (err < 0)
 		return err;
-	if ((err = snd_wavefront_probe(card, dev)) < 0) {
+	err = snd_wavefront_probe(card, dev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -610,7 +611,8 @@ static int snd_wavefront_pnp_detect(struct pnp_card_link *pcard,
 		}
 	}
 
-	if ((res = snd_wavefront_probe(card, dev)) < 0)
+	res = snd_wavefront_probe(card, dev);
+	if (res < 0)
 		return res;
 
 	pnp_set_card_drvdata(pcard, card);
diff --git a/sound/isa/wavefront/wavefront_midi.c b/sound/isa/wavefront/wavefront_midi.c
index a337a86f7a65..72e775ac7ad7 100644
--- a/sound/isa/wavefront/wavefront_midi.c
+++ b/sound/isa/wavefront/wavefront_midi.c
@@ -239,7 +239,8 @@ static int snd_wavefront_midi_input_open(struct snd_rawmidi_substream *substream
 
 	mpu = *((snd_wavefront_mpu_id *) substream->rmidi->private_data);
 
-	if ((midi = get_wavefront_midi (substream)) == NULL)
+	midi = get_wavefront_midi(substream);
+	if (!midi)
 	        return -EIO;
 
 	spin_lock_irqsave (&midi->open, flags);
@@ -263,7 +264,8 @@ static int snd_wavefront_midi_output_open(struct snd_rawmidi_substream *substrea
 
 	mpu = *((snd_wavefront_mpu_id *) substream->rmidi->private_data);
 
-	if ((midi = get_wavefront_midi (substream)) == NULL)
+	midi = get_wavefront_midi(substream);
+	if (!midi)
 	        return -EIO;
 
 	spin_lock_irqsave (&midi->open, flags);
@@ -287,7 +289,8 @@ static int snd_wavefront_midi_input_close(struct snd_rawmidi_substream *substrea
 
 	mpu = *((snd_wavefront_mpu_id *) substream->rmidi->private_data);
 
-	if ((midi = get_wavefront_midi (substream)) == NULL)
+	midi = get_wavefront_midi(substream);
+	if (!midi)
 	        return -EIO;
 
 	spin_lock_irqsave (&midi->open, flags);
@@ -310,7 +313,8 @@ static int snd_wavefront_midi_output_close(struct snd_rawmidi_substream *substre
 
 	mpu = *((snd_wavefront_mpu_id *) substream->rmidi->private_data);
 
-	if ((midi = get_wavefront_midi (substream)) == NULL)
+	midi = get_wavefront_midi(substream);
+	if (!midi)
 	        return -EIO;
 
 	spin_lock_irqsave (&midi->open, flags);
@@ -333,9 +337,9 @@ static void snd_wavefront_midi_input_trigger(struct snd_rawmidi_substream *subst
 
 	mpu = *((snd_wavefront_mpu_id *) substream->rmidi->private_data);
 
-	if ((midi = get_wavefront_midi (substream)) == NULL) {
+	midi = get_wavefront_midi(substream);
+	if (!midi)
 		return;
-	}
 
 	spin_lock_irqsave (&midi->virtual, flags);
 	if (up) {
@@ -372,9 +376,9 @@ static void snd_wavefront_midi_output_trigger(struct snd_rawmidi_substream *subs
 
 	mpu = *((snd_wavefront_mpu_id *) substream->rmidi->private_data);
 
-	if ((midi = get_wavefront_midi (substream)) == NULL) {
+	midi = get_wavefront_midi(substream);
+	if (!midi)
 		return;
-	}
 
 	spin_lock_irqsave (&midi->virtual, flags);
 	if (up) {
diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
index d6420d224d09..69cbc79fbb71 100644
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -339,7 +339,8 @@ snd_wavefront_cmd (snd_wavefront_t *dev,
 	int c;
 	struct wavefront_command *wfcmd;
 
-	if ((wfcmd = wavefront_get_command (cmd)) == NULL) {
+	wfcmd = wavefront_get_command(cmd);
+	if (!wfcmd) {
 		snd_printk ("command 0x%x not supported.\n",
 			cmd);
 		return 1;
@@ -391,7 +392,8 @@ snd_wavefront_cmd (snd_wavefront_t *dev,
 
 		for (i = 0; i < wfcmd->read_cnt; i++) {
 
-			if ((c = wavefront_read (dev)) == -1) {
+			c = wavefront_read(dev);
+			if (c == -1) {
 				DPRINT (WF_DEBUG_IO, "bad read for byte "
 						      "%d of 0x%x [%s].\n",
 						      i, cmd, wfcmd->action);
@@ -401,7 +403,8 @@ snd_wavefront_cmd (snd_wavefront_t *dev,
 			/* Now handle errors. Lots of special cases here */
 	    
 			if (c == 0xff) { 
-				if ((c = wavefront_read (dev)) == -1) {
+				c = wavefront_read(dev);
+				if (c == -1) {
 					DPRINT (WF_DEBUG_IO, "bad read for "
 							      "error byte at "
 							      "read byte %d "
@@ -459,9 +462,9 @@ snd_wavefront_cmd (snd_wavefront_t *dev,
 		   of the standard value.
 		*/
 	    
-		if ((ack = wavefront_read (dev)) == 0) {
+		ack = wavefront_read(dev);
+		if (ack == 0)
 			ack = WF_ACK;
-		}
 	
 		if (ack != WF_ACK) {
 			if (ack == -1) {
@@ -475,7 +478,8 @@ snd_wavefront_cmd (snd_wavefront_t *dev,
 
 				if (ack == 0xff) { /* explicit error */
 		    
-					if ((err = wavefront_read (dev)) == -1) {
+					err = wavefront_read(dev);
+					if (err == -1) {
 						DPRINT (WF_DEBUG_DATA,
 							"cannot read err "
 							"for 0x%x [%s].\n",
@@ -603,9 +607,9 @@ wavefront_delete_sample (snd_wavefront_t *dev, int sample_num)
 	wbuf[0] = sample_num & 0x7f;
 	wbuf[1] = sample_num >> 7;
 
-	if ((x = snd_wavefront_cmd (dev, WFC_DELETE_SAMPLE, NULL, wbuf)) == 0) {
+	x = snd_wavefront_cmd(dev, WFC_DELETE_SAMPLE, NULL, wbuf);
+	if (!x)
 		dev->sample_status[sample_num] = WF_ST_EMPTY;
-	}
 
 	return x;
 }
@@ -691,8 +695,9 @@ wavefront_get_patch_status (snd_wavefront_t *dev)
 		patchnum[0] = i & 0x7f;
 		patchnum[1] = i >> 7;
 
-		if ((x = snd_wavefront_cmd (dev, WFC_UPLOAD_PATCH, patchbuf,
-					patchnum)) == 0) {
+		x = snd_wavefront_cmd(dev, WFC_UPLOAD_PATCH, patchbuf,
+				      patchnum);
+		if (x == 0) {
 
 			dev->patch_status[i] |= WF_SLOT_FILLED;
 			p = (wavefront_patch *) patchbuf;
@@ -738,8 +743,9 @@ wavefront_get_program_status (snd_wavefront_t *dev)
 	for (i = 0; i < WF_MAX_PROGRAM; i++) {
 		prognum = i;
 
-		if ((x = snd_wavefront_cmd (dev, WFC_UPLOAD_PROGRAM, progbuf,
-					&prognum)) == 0) {
+		x = snd_wavefront_cmd(dev, WFC_UPLOAD_PROGRAM, progbuf,
+				      &prognum);
+		if (x == 0) {
 
 			dev->prog_status[i] |= WF_SLOT_USED;
 
@@ -894,9 +900,9 @@ wavefront_send_sample (snd_wavefront_t *dev,
 	if (header->number == WAVEFRONT_FIND_FREE_SAMPLE_SLOT) {
 		int x;
 
-		if ((x = wavefront_find_free_sample (dev)) < 0) {
+		x = wavefront_find_free_sample(dev);
+		if (x < 0)
 			return -ENOMEM;
-		}
 		snd_printk ("unspecified sample => %d\n", x);
 		header->number = x;
 	}
@@ -1137,7 +1143,8 @@ wavefront_send_sample (snd_wavefront_t *dev,
 		   nothing to do with DMA at all.
 		*/
 	
-		if ((dma_ack = wavefront_read (dev)) != WF_DMA_ACK) {
+		dma_ack = wavefront_read(dev);
+		if (dma_ack != WF_DMA_ACK) {
 			if (dma_ack == -1) {
 				snd_printk ("upload sample "
 					    "DMA ack timeout\n");
@@ -1282,14 +1289,16 @@ wavefront_fetch_multisample (snd_wavefront_t *dev,
 		char d[2];
 		int val;
 	
-		if ((val = wavefront_read (dev)) == -1) {
+		val = wavefront_read(dev);
+		if (val == -1) {
 			snd_printk ("upload multisample failed "
 				    "during sample loop.\n");
 			return -EIO;
 		}
 		d[0] = val;
 
-		if ((val = wavefront_read (dev)) == -1) {
+		val = wavefront_read(dev);
+		if (val == -1) {
 			snd_printk ("upload multisample failed "
 				    "during sample loop.\n");
 			return -EIO;
@@ -1910,7 +1919,8 @@ wavefront_reset_to_cleanliness (snd_wavefront_t *dev)
 		goto gone_bad;
 	}
 	
-	if ((hwv[0] = wavefront_read (dev)) == -1) {
+	hwv[0] = wavefront_read(dev);
+	if (hwv[0] == -1) {
 		snd_printk ("board not responding correctly.\n");
 		goto gone_bad;
 	}
@@ -1921,7 +1931,8 @@ wavefront_reset_to_cleanliness (snd_wavefront_t *dev)
 		   and tell us about it either way.
 		*/
 		
-		if ((hwv[0] = wavefront_read (dev)) == -1) {
+		hwv[0] = wavefront_read(dev);
+		if (hwv[0] == -1) {
 			snd_printk ("on-board RAM test failed "
 				    "(bad error code).\n");
 		} else {
@@ -1934,7 +1945,8 @@ wavefront_reset_to_cleanliness (snd_wavefront_t *dev)
 
 	/* We're OK, just get the next byte of the HW version response */
 
-	if ((hwv[1] = wavefront_read (dev)) == -1) {
+	hwv[1] = wavefront_read(dev);
+	if (hwv[1] == -1) {
 		snd_printk ("incorrect h/w response.\n");
 		goto gone_bad;
 	}
@@ -2079,9 +2091,9 @@ wavefront_do_reset (snd_wavefront_t *dev)
 	   about it.
 	*/
 	
-	if ((dev->freemem = wavefront_freemem (dev)) < 0) {
+	dev->freemem = wavefront_freemem(dev);
+	if (dev->freemem < 0)
 		goto gone_bad;
-	}
 		
 	snd_printk ("available DRAM %dk\n", dev->freemem / 1024);
 
-- 
2.26.2


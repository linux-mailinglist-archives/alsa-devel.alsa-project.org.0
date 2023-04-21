Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F50D6EAC86
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0DEEEBC;
	Fri, 21 Apr 2023 16:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0DEEEBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086370;
	bh=VrTEcaMt4emS5VEXFLFWmMOTyaF5AMVubSE/fx2h7Hg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jQRyBBYibq/0Z3l7fFfrO+Zv9liCG7MHGBY0a0YETWVY8ZNEu4e5IfVTJQcyOZBAT
	 JkaiqxW9TI0ahnkrxsmrJB+aH9CNnJuzC1Sh2qi/feZSt5ydQCO4wadxupitH/Hvmn
	 Qn0k3WF6JEP9nh7l0wdFiCOD3IcQ/1UUMsgcszCE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C62C6F80212;
	Fri, 21 Apr 2023 16:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93A5FF8055A; Fri, 21 Apr 2023 16:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26073F804FC
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26073F804FC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9F5262420C;
	Fri, 21 Apr 2023 10:10:06 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-DZn-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ALSA: emu10k1: clean up P16V part somewhat
Date: Fri, 21 Apr 2023 16:10:06 +0200
Message-Id: <20230421141006.1005452-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GGJZZCJKBB2UZGWGZTPCEU4Q3PMTIUKR
X-Message-ID-Hash: GGJZZCJKBB2UZGWGZTPCEU4Q3PMTIUKR
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGJZZCJKBB2UZGWGZTPCEU4Q3PMTIUKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Detach it better from the main PCM driver, which it really doesn't have
much in common with.

In particular, this moves the interrupt handler implementation into
p16v.c, and makes it access the substream runtime status more directly,
so it doesn't need to abuse structs snd_emu10k1_pcm and
snd_emu10k1_voice any more.

We don't need private pcm runtime data at all, as the only thing it was
used for (except the back-link to the substream) was the `running` flag.
So store that directly in runtime->private_data.

This somewhat radical strip-down shows that this driver contains some
complexity that was never actually utilized. I suppose the right way to
fully utilize the hardware in a simple way would be introducing more
substreams. This wouldn't require any of the removed code.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

FIXME: only build-tested. it would require someone with an Audigy 2/4
card to runtime-test it.

i don't mind if this is deferred until someone tests it.
---
 include/sound/emu10k1.h  |   3 +-
 sound/pci/emu10k1/irq.c  |  32 ++---------
 sound/pci/emu10k1/p16v.c | 111 ++++++++++++++++-----------------------
 3 files changed, 50 insertions(+), 96 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 84ea53e9c83f..4b4026dfde5e 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1737,8 +1737,6 @@ struct snd_emu10k1 {
 	spinlock_t i2c_lock; /* serialises access to i2c port */
 
 	struct snd_emu10k1_voice voices[NUM_G];
-	struct snd_emu10k1_voice p16v_voices[4];
-	struct snd_emu10k1_voice p16v_capture_voice;
 	int p16v_device_offset;
 	u32 p16v_capture_source;
 	u32 p16v_capture_channel;
@@ -1758,6 +1756,7 @@ struct snd_emu10k1 {
 	void (*capture_efx_interrupt)(struct snd_emu10k1 *emu, unsigned int status);
 	void (*spdif_interrupt)(struct snd_emu10k1 *emu, unsigned int status);
 	void (*dsp_interrupt)(struct snd_emu10k1 *emu);
+	void (*p16v_interrupt)(struct snd_emu10k1 *emu);
 
 	struct snd_pcm_substream *pcm_capture_substream;
 	struct snd_pcm_substream *pcm_capture_mic_substream;
diff --git a/sound/pci/emu10k1/irq.c b/sound/pci/emu10k1/irq.c
index ebb2275efb6c..dfb44e5e69a7 100644
--- a/sound/pci/emu10k1/irq.c
+++ b/sound/pci/emu10k1/irq.c
@@ -18,7 +18,7 @@
 irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 {
 	struct snd_emu10k1 *emu = dev_id;
-	unsigned int status, status2, orig_status, orig_status2;
+	unsigned int status, orig_status;
 	int handled = 0;
 	int timeout = 0;
 
@@ -139,32 +139,10 @@ irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 			status &= ~IPR_FXDSP;
 		}
 		if (status & IPR_P16V) {
-			while ((status2 = inl(emu->port + IPR2)) != 0) {
-				u32 mask = INTE2_PLAYBACK_CH_0_LOOP;  /* Full Loop */
-				struct snd_emu10k1_voice *pvoice = &(emu->p16v_voices[0]);
-				struct snd_emu10k1_voice *cvoice = &(emu->p16v_capture_voice);
-
-				/* dev_dbg(emu->card->dev, "status2=0x%x\n", status2); */
-				orig_status2 = status2;
-				if(status2 & mask) {
-					if(pvoice->use) {
-						snd_pcm_period_elapsed(pvoice->epcm->substream);
-					} else { 
-						dev_err(emu->card->dev,
-							"p16v: status: 0x%08x, mask=0x%08x, pvoice=%p, use=%d\n",
-							status2, mask, pvoice,
-							pvoice->use);
-					}
-				}
-				if(status2 & 0x110000) {
-					/* dev_info(emu->card->dev, "capture int found\n"); */
-					if(cvoice->use) {
-						/* dev_info(emu->card->dev, "capture period_elapsed\n"); */
-						snd_pcm_period_elapsed(cvoice->epcm->substream);
-					}
-				}
-				outl(orig_status2, emu->port + IPR2); /* ack all */
-			}
+			if (emu->p16v_interrupt)
+				emu->p16v_interrupt(emu);
+			else
+				outl(0, emu->port + INTE2);
 			status &= ~IPR_P16V;
 		}
 
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index f5e0972187a7..ce4d3450959c 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -149,125 +149,69 @@ static const struct snd_pcm_hardware snd_p16v_capture_hw = {
 	.fifo_size =		0,
 };
 
-static void snd_p16v_pcm_free_substream(struct snd_pcm_runtime *runtime)
-{
-	struct snd_emu10k1_pcm *epcm = runtime->private_data;
-
-	kfree(epcm);
-}
-
 /* open_playback callback */
 static int snd_p16v_pcm_open_playback_channel(struct snd_pcm_substream *substream, int channel_id)
 {
-	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
-        struct snd_emu10k1_voice *channel = &(emu->p16v_voices[channel_id]);
-	struct snd_emu10k1_pcm *epcm;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
-	/* dev_dbg(emu->card->dev, "epcm kcalloc: %p\n", epcm); */
-
-	if (epcm == NULL)
-		return -ENOMEM;
-	epcm->emu = emu;
-	epcm->substream = substream;
 	/*
 	dev_dbg(emu->card->dev, "epcm device=%d, channel_id=%d\n",
 		   substream->pcm->device, channel_id);
 	*/
-	runtime->private_data = epcm;
-	runtime->private_free = snd_p16v_pcm_free_substream;
   
 	runtime->hw = snd_p16v_playback_hw;
 
-        channel->number = channel_id;
-
-        channel->use=1;
 #if 0 /* debug */
 	dev_dbg(emu->card->dev,
 		   "p16v: open channel_id=%d, channel=%p, use=0x%x\n",
 		   channel_id, channel, channel->use);
 	dev_dbg(emu->card->dev, "open:channel_id=%d, chip=%p, channel=%p\n",
 	       channel_id, chip, channel);
 #endif /* debug */
 	/* channel->interrupt = snd_p16v_pcm_channel_interrupt; */
-	channel->epcm = epcm;
 	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	if (err < 0)
                 return err;
 
 	runtime->sync.id32[0] = substream->pcm->card->number;
 	runtime->sync.id32[1] = 'P';
 	runtime->sync.id32[2] = 16;
 	runtime->sync.id32[3] = 'V';
 
 	return 0;
 }
+
 /* open_capture callback */
 static int snd_p16v_pcm_open_capture_channel(struct snd_pcm_substream *substream, int channel_id)
 {
-	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
-	struct snd_emu10k1_voice *channel = &(emu->p16v_capture_voice);
-	struct snd_emu10k1_pcm *epcm;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
-	/* dev_dbg(emu->card->dev, "epcm kcalloc: %p\n", epcm); */
-
-	if (epcm == NULL)
-		return -ENOMEM;
-	epcm->emu = emu;
-	epcm->substream = substream;
 	/*
 	dev_dbg(emu->card->dev, "epcm device=%d, channel_id=%d\n",
 		   substream->pcm->device, channel_id);
 	*/
-	runtime->private_data = epcm;
-	runtime->private_free = snd_p16v_pcm_free_substream;
   
 	runtime->hw = snd_p16v_capture_hw;
 
-	channel->number = channel_id;
-
-	channel->use=1;
-#if 0 /* debug */
-	dev_dbg(emu->card->dev,
-		   "p16v: open channel_id=%d, channel=%p, use=0x%x\n",
-		   channel_id, channel, channel->use);
-	dev_dbg(emu->card->dev, "open:channel_id=%d, chip=%p, channel=%p\n",
-	       channel_id, chip, channel);
-#endif /* debug */
-	/* channel->interrupt = snd_p16v_pcm_channel_interrupt; */
-	channel->epcm = epcm;
 	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	if (err < 0)
 		return err;
 
 	return 0;
 }
 
 
 /* close callback */
 static int snd_p16v_pcm_close_playback(struct snd_pcm_substream *substream)
 {
-	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
-	//struct snd_pcm_runtime *runtime = substream->runtime;
-	//struct snd_emu10k1_pcm *epcm = runtime->private_data;
-	emu->p16v_voices[substream->pcm->device - emu->p16v_device_offset].use = 0;
-	/* FIXME: maybe zero others */
 	return 0;
 }
 
 /* close callback */
 static int snd_p16v_pcm_close_capture(struct snd_pcm_substream *substream)
 {
-	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
-	//struct snd_pcm_runtime *runtime = substream->runtime;
-	//struct snd_emu10k1_pcm *epcm = runtime->private_data;
-	emu->p16v_capture_voice.use = 0;
-	/* FIXME: maybe zero others */
 	return 0;
 }
 
@@ -409,13 +353,48 @@ static void snd_p16v_intr_disable(struct snd_emu10k1 *emu, unsigned int intrenb)
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
+static void snd_p16v_interrupt(struct snd_emu10k1 *emu)
+{
+	unsigned int status;
+
+	while ((status = inl(emu->port + IPR2)) != 0) {
+		u32 mask = INTE2_PLAYBACK_CH_0_LOOP;  /* Full Loop */
+
+		/* dev_dbg(emu->card->dev, "p16v status=0x%x\n", status); */
+		if (status & mask) {
+			struct snd_pcm_substream *substream =
+					emu->pcm_p16v->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+			struct snd_pcm_runtime *runtime = substream->runtime;
+
+			if (runtime && runtime->private_data) {
+				snd_pcm_period_elapsed(substream);
+			} else {
+				dev_err(emu->card->dev,
+					"p16v: status: 0x%08x, mask=0x%08x\n",
+					status, mask);
+			}
+		}
+		if (status & 0x110000) {
+			struct snd_pcm_substream *substream =
+					emu->pcm_p16v->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+			struct snd_pcm_runtime *runtime = substream->runtime;
+
+			/* dev_info(emu->card->dev, "capture int found\n"); */
+			if (runtime && runtime->private_data) {
+				/* dev_info(emu->card->dev, "capture period_elapsed\n"); */
+				snd_pcm_period_elapsed(substream);
+			}
+		}
+		outl(status, emu->port + IPR2); /* ack all */
+	}
+}
+
 /* trigger_playback callback */
 static int snd_p16v_pcm_trigger_playback(struct snd_pcm_substream *substream,
 				    int cmd)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime;
-	struct snd_emu10k1_pcm *epcm;
 	int channel;
 	int result = 0;
         struct snd_pcm_substream *s;
@@ -437,10 +416,9 @@ static int snd_p16v_pcm_trigger_playback(struct snd_pcm_substream *substream,
 		    s->stream != SNDRV_PCM_STREAM_PLAYBACK)
 			continue;
 		runtime = s->runtime;
-		epcm = runtime->private_data;
 		channel = substream->pcm->device-emu->p16v_device_offset;
 		/* dev_dbg(emu->card->dev, "p16v channel=%d\n", channel); */
-		epcm->running = running;
+		runtime->private_data = (void *)(ptrdiff_t)running;
 		basic |= (0x1<<channel);
 		inte |= (INTE2_PLAYBACK_CH_0_LOOP<<channel);
                 snd_pcm_trigger_done(s, substream);
@@ -469,22 +447,21 @@ static int snd_p16v_pcm_trigger_capture(struct snd_pcm_substream *substream,
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_emu10k1_pcm *epcm = runtime->private_data;
 	int channel = 0;
 	int result = 0;
 	u32 inte = INTE2_CAPTURE_CH_0_LOOP | INTE2_CAPTURE_CH_0_HALF_LOOP;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		snd_p16v_intr_enable(emu, inte);
 		snd_emu10k1_ptr20_write(emu, BASIC_INTERRUPT, 0, snd_emu10k1_ptr20_read(emu, BASIC_INTERRUPT, 0)|(0x100<<channel));
-		epcm->running = 1;
+		runtime->private_data = (void *)1;
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		snd_emu10k1_ptr20_write(emu, BASIC_INTERRUPT, 0, snd_emu10k1_ptr20_read(emu, BASIC_INTERRUPT, 0) & ~(0x100<<channel));
 		snd_p16v_intr_disable(emu, inte);
 		//snd_emu10k1_ptr20_write(emu, EXTENDED_INT_MASK, 0, snd_emu10k1_ptr20_read(emu, EXTENDED_INT_MASK, 0) & ~(0x110000<<channel));
-		epcm->running = 0;
+		runtime->private_data = NULL;
 		break;
 	default:
 		result = -EINVAL;
@@ -499,10 +476,10 @@ snd_p16v_pcm_pointer_playback(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_emu10k1_pcm *epcm = runtime->private_data;
 	snd_pcm_uframes_t ptr, ptr1, ptr2,ptr3,ptr4 = 0;
 	int channel = substream->pcm->device - emu->p16v_device_offset;
-	if (!epcm->running)
+
+	if (!runtime->private_data)
 		return 0;
 
 	ptr3 = snd_emu10k1_ptr20_read(emu, PLAYBACK_LIST_PTR, channel);
@@ -524,11 +501,10 @@ snd_p16v_pcm_pointer_capture(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_emu10k1_pcm *epcm = runtime->private_data;
 	snd_pcm_uframes_t ptr, ptr1, ptr2 = 0;
 	int channel = 0;
 
-	if (!epcm->running)
+	if (!runtime->private_data)
 		return 0;
 
 	ptr1 = snd_emu10k1_ptr20_read(emu, CAPTURE_POINTER, channel);
@@ -589,6 +565,7 @@ int snd_p16v_pcm(struct snd_emu10k1 *emu, int device)
 	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
 	strcpy(pcm->name, "p16v");
 	emu->pcm_p16v = pcm;
+	emu->p16v_interrupt = snd_p16v_interrupt;
 
 	for(substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; 
 	    substream; 
-- 
2.40.0.152.g15d061e6df


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0E75604C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 12:22:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D84CDEB;
	Mon, 17 Jul 2023 12:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D84CDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689589344;
	bh=qk870tW1Opfvgz4wiWdYRGsF5rENd4kncqSbXfvJlUE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EhODv2bARkv6MlQWgkA62MVjsta8ZDMsJOjFPOpR45/TFoYz50F0i16vxqZ3yNhI/
	 xBeerW5Q+9RkcKDApEjS5+FlAdv4A8NqrMBohl+YrjRyZpbdac88byK4uZXuB5bg8o
	 DAkXx0Y3qtoX+Z5I/K0BfYM2mjVpLe9Nu1qtCl/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F77DF8057B; Mon, 17 Jul 2023 12:21:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27627F80520;
	Mon, 17 Jul 2023 12:21:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E0D6F8057B; Mon, 17 Jul 2023 12:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EC10F80557
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 12:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EC10F80557
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id A6B2E242CD;
	Mon, 17 Jul 2023 06:20:37 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qLLLJ-hBO-00; Mon, 17 Jul 2023 12:20:37 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: emu10k1: do away with extra voices in E-MU D.A.S. mode
Date: Mon, 17 Jul 2023 12:20:37 +0200
Message-Id: <20230717102037.404317-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KQ3JJFRCS4GCQSJ2GEJRE5TA37JQU6NQ
X-Message-ID-Hash: KQ3JJFRCS4GCQSJ2GEJRE5TA37JQU6NQ
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQ3JJFRCS4GCQSJ2GEJRE5TA37JQU6NQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Maybe somewhat unsurprisingly, Creative Inc. learned from the period
interrupt disaster of the EMU10K1, and equipped Audigy with a way to
delay the interrupts by a configurable amount. So make use of that.
This allows us to do away with the extra voices for driving interrupts.

The most salient advantage of that is that we can maximize the number of
playback channels in 24-bit 192 kHz mode, bringing it up to 8.
A minor point is that no bandwidth is wasted on fetching data that is
discarded anyway.

The removal of the extra voices has one disadvantage: the hardware is
limited to two periods, thus increasing the likelihood of underruns.
Therefore, we do this only in D.A.S. mode, which aims at high-quality
low-latency multi-channel recording, and therefore can be expected to be
operated in an optimal environment. Also, prior to a few commits back,
the multi-channel playback was actually limited to two periods anyway
(for no good reason).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---

this is obviously meaningless without the d.a.s. series. i'm posting it
only so it's on record.
---
This patch needs to be applied on top of the patch titled "ALSA:
emu10k1: add high-rate playback in E-MU D.A.S. mode".
---
 include/sound/emu10k1.h          | 11 +++++++
 sound/pci/emu10k1/emu10k1_main.c | 16 ++++++++++
 sound/pci/emu10k1/emupcm.c       | 52 +++++++++++++++++++++++---------
 sound/pci/emu10k1/irq.c          |  8 +++++
 4 files changed, 73 insertions(+), 14 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index fd4cf7d6eb3f..0931b1e65e56 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -838,7 +838,18 @@ SUB_REG(FXIDX, IDX,		0x0000ffff)
 #define A_SPRA			0x6b		/* S/PDIF Host Record Address			*/
 #define A_SPRC			0x6c		/* S/PDIF Host Record Control			*/
 
+// NOTE: 64-bit
+// Voice 0 holds the counter, while voice 1 holds the enable bits.
+// Bits in IPR are set according to incoming IRQs as usual.
+// When a corresponding bit is set in the delay enable register,
+// the counter starts, and the IRQ isn't delivered until timeout.
+// Additional delayed IRQs arriving during the countdown do not
+// retrigger it, so they will be delayed less or not at all.
+// Non-delayed IRQs arriving during the countdown are delivered
+// immediately, while the countdown continues.
 #define A_DICE			0x6d		/* Delayed Interrupt Counter & Enable		*/
+#define A_DICE_DELAY_MASK	0x000003ff	/* Interrupt delay minus 1			*/
+#define A_DICE_COUNTER_MASK	0x03ff0000	/* Counter's current value			*/
 
 #define A_TTB			0x6e		/* Tank Table Base				*/
 #define A_TDOF			0x6f		/* Tank Delay Offset				*/
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 2125925c2d5e..97a4be6eaf7a 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -159,6 +159,8 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 		/* disable channel interrupt */
 		CLIEL, 0,
 		CLIEH, 0,
+		HLIEL, 0,
+		HLIEH, 0,
 
 		/* disable stop on loop end */
 		SOLEL, 0,
@@ -174,6 +176,12 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 				      AC97SLOT_REAR_LEFT);
 	}
 
+	if (emu->das_mode) {
+		// Enable delayed period interrupts
+		snd_emu10k1_ptr_write(emu, A_DICE, 0, 64 - 3 + 1);
+		snd_emu10k1_ptr_write(emu, A_DICE, 1, IPR_CHANNELLOOP);
+	}
+
 	/* init envelope engine */
 	for (ch = 0; ch < NUM_G; ch++)
 		snd_emu10k1_voice_init(emu, ch);
@@ -414,6 +422,12 @@ int snd_emu10k1_done(struct snd_emu10k1 *emu)
 	else
 		snd_emu10k1_ptr_write(emu, DBG, 0, EMU10K1_DBG_SINGLE_STEP);
 
+	if (emu->das_mode) {
+		// Disable delayed period interrupts
+		snd_emu10k1_ptr_write(emu, A_DICE, 0, 0);
+		snd_emu10k1_ptr_write(emu, A_DICE, 1, 0);
+	}
+
 	snd_emu10k1_ptr_write_multiple(emu, 0,
 		/* reset recording buffers */
 		MICBS, 0,
@@ -429,6 +443,8 @@ int snd_emu10k1_done(struct snd_emu10k1 *emu)
 		/* disable channel interrupt */
 		CLIEL, 0,
 		CLIEH, 0,
+		HLIEL, 0,
+		HLIEH, 0,
 		SOLEL, 0,
 		SOLEH, 0,
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index ccb0e13da3dd..b7841076f019 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -96,7 +96,9 @@ static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm *epcm,
 	if (err < 0)
 		return err;
 
-	if (epcm->extra == NULL) {
+	if (epcm->emu->das_mode) {
+		epcm->voices[0]->interrupt = snd_emu10k1_pcm_interrupt;
+	} else if (epcm->extra == NULL) {
 		// The hardware supports only (half-)loop interrupts, so to support an
 		// arbitrary number of periods per buffer, we use an extra voice with a
 		// period-sized loop as the interrupt source. Additionally, the interrupt
@@ -500,13 +502,8 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	epcm->pitch_target = PITCH_48000;
 
 	start_addr = epcm->start_addr >> 1;  // 16-bit voices
-
-	extra_size = runtime->period_size >> shift;
 	channel_size = runtime->buffer_size >> shift;
 
-	snd_emu10k1_pcm_init_extra_voice(emu, epcm->extra, true,
-					 start_addr, start_addr + extra_size);
-
 	if (das_mode) {
 		unsigned count = 1 << shift;
 		start_addr >>= 1;
@@ -520,6 +517,10 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 			}
 		}
 	} else {
+		extra_size = runtime->period_size >> shift;
+		snd_emu10k1_pcm_init_extra_voice(emu, epcm->extra, true,
+						 start_addr, start_addr + extra_size);
+
 		epcm->ccca_start_addr = start_addr;
 		for (i = 0; i < runtime->channels; i++) {
 			snd_emu10k1_pcm_init_voices(emu, epcm->voices[i], true, false,
@@ -547,7 +548,7 @@ static const struct snd_pcm_hardware snd_emu10k1_efx_playback =
 	.buffer_bytes_max =	(128*1024),
 	.period_bytes_max =	(128*1024),
 	.periods_min =		2,
-	.periods_max =		1024,
+	.periods_max =		2,
 	.fifo_size =		0,
 };
 
@@ -698,8 +699,16 @@ static void snd_emu10k1_playback_prepare_voices(struct snd_emu10k1 *emu,
 	// This is why all other (open) drivers for these chips use timer-based
 	// interrupts.
 	//
-	eloop_start += (epcm->resume_pos + eloop_size - 3) % eloop_size;
-	snd_emu10k1_ptr_write(emu, CCCA_CURRADDR, epcm->extra->number, eloop_start);
+	// But then, Audigy introduced delayed interrupt functionality, so we
+	// use it in D.A.S. mode, where we may need all voices. We can't use
+	// it in regular mode due to supporting multiple substreams, which the
+	// delayed IRQs cannot really handle; also, we prefer supporting an
+	// arbitrary number of periods there, for which we need the extra voice.
+	//
+	if (!emu->das_mode) {
+		eloop_start += (epcm->resume_pos + eloop_size - 3) % eloop_size;
+		snd_emu10k1_ptr_write(emu, CCCA_CURRADDR, epcm->extra->number, eloop_start);
+	}
 
 	// It takes a moment until the cache fills complete,
 	// but the unmuting takes long enough for that.
@@ -793,13 +802,25 @@ static void snd_emu10k1_playback_set_running(struct snd_emu10k1 *emu,
 					     struct snd_emu10k1_pcm *epcm)
 {
 	epcm->running = 1;
-	snd_emu10k1_voice_intr_enable(emu, epcm->extra->number);
+	if (emu->das_mode) {
+		unsigned int voice = epcm->voices[0]->number;
+		snd_emu10k1_voice_half_loop_intr_enable(emu, voice);
+		snd_emu10k1_voice_intr_enable(emu, voice);
+	} else {
+		snd_emu10k1_voice_intr_enable(emu, epcm->extra->number);
+	}
 }
 
 static void snd_emu10k1_playback_set_stopped(struct snd_emu10k1 *emu,
 					      struct snd_emu10k1_pcm *epcm)
 {
-	snd_emu10k1_voice_intr_disable(emu, epcm->extra->number);
+	if (emu->das_mode) {
+		unsigned int voice = epcm->voices[0]->number;
+		snd_emu10k1_voice_half_loop_intr_disable(emu, voice);
+		snd_emu10k1_voice_intr_disable(emu, voice);
+	} else {
+		snd_emu10k1_voice_intr_disable(emu, epcm->extra->number);
+	}
 	epcm->running = 0;
 }
 
@@ -1064,7 +1085,8 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 			result = snd_emu10k1_voice_clear_loop_stop_multiple_atomic(emu, mask);
 			if (result == 0) {
 				// The extra voice is allowed to lag a bit
-				snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
+				if (!emu->das_mode)
+					snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
 				goto leave;
 			}
 
@@ -1080,7 +1102,8 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
+		if (!emu->das_mode)
+			snd_emu10k1_playback_stop_voice(emu, epcm->extra);
 		snd_emu10k1_efx_playback_stop_voices(
 				emu, epcm, das_mode, count, runtime->channels);
 
@@ -1428,15 +1451,16 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 					SNDRV_PCM_INFO_RESUME |
 					SNDRV_PCM_INFO_PAUSE;
 				if (shift == 2)
-					runtime->hw.channels_max = 7;  // FIXME: should be 8, but extra voice ...
+					runtime->hw.channels_max = 8;
 				err = snd_pcm_hw_constraint_step(
 						runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 1 << shift);
 				if (err < 0) {
 					kfree(epcm);
 					return err;
 				}
 			}
 			runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
+			runtime->hw.periods_max = 2;  // Not using an extra voice
 		}
 	}
 	err = snd_emu10k1_playback_set_constraints(emu, runtime);
diff --git a/sound/pci/emu10k1/irq.c b/sound/pci/emu10k1/irq.c
index 71aa90b9cc88..be2dbed12e74 100644
--- a/sound/pci/emu10k1/irq.c
+++ b/sound/pci/emu10k1/irq.c
@@ -23,6 +23,14 @@ irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 				 "Suspected sound card removal\n");
 			break;
 		}
+		if ((status & IPR_CHANNELLOOP) && emu->das_mode &&
+		    (snd_emu10k1_ptr_read(emu, A_DICE, 0) & A_DICE_COUNTER_MASK)) {
+			// If another IRQ "punched through" the delay,
+			// we mask away the delayed IRQ.
+			status &= ~(IPR_CHANNELLOOP | IPR_CHANNELNUMBERMASK);
+			if (!status)  // Will usually happen in 2nd iteration
+				break;
+		}
 		if (++timeout == 1000) {
 			dev_info(emu->card->dev, "emu10k1 irq routine failure\n");
 			break;

base-commit: 3c04ccbdf86e7e93e06e68f1915e39eb55afb0d0
prerequisite-patch-id: 45677e4f73ea654bda3258c1143c8027173e4b5c
prerequisite-patch-id: 358302d653684999fa1d7b7c0b9c643d6daf768d
prerequisite-patch-id: e5ad839d4411bacb9ed5d639a0bf151a3b9dfeb1
prerequisite-patch-id: aa2b589f883089a61a979b76897a60865ab2fd8a
prerequisite-patch-id: 86710b3c986270dcdbabbbbad9f0d86ed634a3ad
prerequisite-patch-id: 7d3ce3deda4c9a317868cc13150b3ece13f0096e
prerequisite-patch-id: 3bd887e1980015ed352cc20eea63b69f3cf8a9c2
-- 
2.40.0.152.g15d061e6df


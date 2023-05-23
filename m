Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D370E63D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 22:08:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97BC2822;
	Tue, 23 May 2023 22:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97BC2822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684872538;
	bh=wrEYxApjqxpfBP5MrCSZHiP6z3mK5hP0VY1BF4d5Yh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LXEWVAKnjMnxML61ZW3JhrdSwFC+1tP7GfyEFDM6X3P807FYQIulBItASNdgYG4O7
	 DZrRsLQqIxr34/rqbnPUVdjalUxEWs6uTWSjxI/4MJKmOlyqHAv1eFP+gsBRzr2Eiy
	 VAT5Kel7ad2TDiJUD+QnOhTUV2ggIxo7CUdHGXPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFB7FF80544; Tue, 23 May 2023 22:07:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF9FF80544;
	Tue, 23 May 2023 22:07:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81D24F80549; Tue, 23 May 2023 22:07:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 17BF2F8024E
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 22:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17BF2F8024E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 17BBE24196;
	Tue, 23 May 2023 16:07:10 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q1YHl-zPD-00; Tue, 23 May 2023 22:07:09 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/3] ALSA: emu10k1: add synchronized start of multi-channel
 playback
Date: Tue, 23 May 2023 22:07:08 +0200
Message-Id: <20230523200709.236023-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230523200709.236023-1-oswald.buddenhagen@gmx.de>
References: <20230523200709.236023-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BH5DCVYAMPNWDOHH62VRD5TF3QMKP7XZ
X-Message-ID-Hash: BH5DCVYAMPNWDOHH62VRD5TF3QMKP7XZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BH5DCVYAMPNWDOHH62VRD5TF3QMKP7XZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We use independent voices for the channels, so we need to make an effort
to ensure that they are actually in sync.

The hardware doesn't provide atomicity, so we may need to retry a few
times, due to NMIs, PCI contention, and the wrong phase of the moon.

Solution inspired by kX-project.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h    |  10 +++-
 sound/pci/emu10k1/emupcm.c | 100 ++++++++++++++++++++++++++++++-------
 sound/pci/emu10k1/io.c     |  82 ++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+), 19 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 0780f39f4bb6..164a2374b4c2 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -422,7 +422,8 @@ SUB_REG(HCFG, LOCKTANKCACHE,	0x00000004)	/* 1 = Cancel bustmaster accesses to ta
 #define CPF			0x00		/* Current pitch and fraction register			*/
 SUB_REG(CPF, CURRENTPITCH,	0xffff0000)	/* Current pitch (linear, 0x4000 == unity pitch shift) 	*/
 #define CPF_STEREO_MASK		0x00008000	/* 1 = Even channel interleave, odd channel locked	*/
-#define CPF_STOP_MASK		0x00004000	/* 1 = Current pitch forced to 0			*/
+SUB_REG(CPF, STOP,		0x00004000)	/* 1 = Current pitch forced to 0			*/
+						/* Can be set only while matching bit in SOLEx is 1	*/
 #define CPF_FRACADDRESS_MASK	0x00003fff	/* Linear fractional address of the current channel	*/
 
 #define PTRX			0x01		/* Pitch target and send A/B amounts register		*/
@@ -771,6 +772,9 @@ SUB_REG(PEFE, FILTERAMOUNT,	0x000000ff)	/* Filter envlope amount				*/
 #define CLIPL			0x5a		/* Channel loop interrupt pending low register	*/
 #define CLIPH			0x5b		/* Channel loop interrupt pending high register	*/
 
+// These cause CPF_STOP_MASK to be set shortly after CCCA_CURRADDR passes DSL_LOOPENDADDR.
+// Subsequent changes to the address registers don't resume; clearing the bit here or in CPF does.
+// The registers are NOT synchronized; the next serviced channel picks up immediately.
 #define SOLEL			0x5c		/* Stop on loop enable low register		*/
 #define SOLEH			0x5d		/* Stop on loop enable high register		*/
 
@@ -1476,6 +1480,7 @@ struct snd_emu10k1_pcm {
 	struct snd_emu10k1_voice *extra;
 	unsigned short running;
 	unsigned short first_ptr;
+	snd_pcm_uframes_t resume_pos;
 	struct snd_util_memblk *memblk;
 	unsigned int start_addr;
 	unsigned int ccca_start_addr;
@@ -1820,6 +1825,9 @@ void snd_emu10k1_voice_half_loop_intr_ack(struct snd_emu10k1 *emu, unsigned int
 void snd_emu10k1_voice_set_loop_stop(struct snd_emu10k1 *emu, unsigned int voicenum);
 void snd_emu10k1_voice_clear_loop_stop(struct snd_emu10k1 *emu, unsigned int voicenum);
 #endif
+void snd_emu10k1_voice_set_loop_stop_multiple(struct snd_emu10k1 *emu, u64 voices);
+void snd_emu10k1_voice_clear_loop_stop_multiple(struct snd_emu10k1 *emu, u64 voices);
+int snd_emu10k1_voice_clear_loop_stop_multiple_atomic(struct snd_emu10k1 *emu, u64 voices);
 void snd_emu10k1_wait(struct snd_emu10k1 *emu, unsigned int wait);
 static inline unsigned int snd_emu10k1_wc(struct snd_emu10k1 *emu) { return (inl(emu->port + WC) >> 6) & 0xfffff; }
 unsigned short snd_emu10k1_ac97_read(struct snd_ac97 *ac97, unsigned short reg);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 2764e7867b33..4df6f5285993 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -560,7 +560,7 @@ static void snd_emu10k1_playback_prepare_voices(struct snd_emu10k1 *emu,
 	// we need to compensate for two circumstances:
 	// - The actual position is delayed by the cache size (64 frames)
 	// - The interpolator is centered around the 4th frame
-	loop_start += 64 - 3;
+	loop_start += (epcm->resume_pos + 64 - 3) % loop_size;
 	for (int i = 0; i < channels; i++) {
 		unsigned voice = epcm->voices[i]->number;
 		snd_emu10k1_ptr_write(emu, CCCA_CURRADDR, voice, loop_start);
@@ -584,7 +584,7 @@ static void snd_emu10k1_playback_prepare_voices(struct snd_emu10k1 *emu,
 	// This is why all other (open) drivers for these chips use timer-based
 	// interrupts.
 	//
-	eloop_start += eloop_size - 3;
+	eloop_start += (epcm->resume_pos + eloop_size - 3) % eloop_size;
 	snd_emu10k1_ptr_write(emu, CCCA_CURRADDR, epcm->extra->number, eloop_start);
 
 	// It takes a moment until the cache fills complete,
@@ -844,48 +844,112 @@ static snd_pcm_uframes_t snd_emu10k1_playback_pointer(struct snd_pcm_substream *
 	return ptr;
 }
 
+static u64 snd_emu10k1_efx_playback_voice_mask(struct snd_emu10k1_pcm *epcm,
+					       int channels)
+{
+	u64 mask = 0;
+
+	for (int i = 0; i < channels; i++) {
+		int voice = epcm->voices[i]->number;
+		mask |= 1ULL << voice;
+	}
+	return mask;
+}
+
+static void snd_emu10k1_efx_playback_freeze_voices(struct snd_emu10k1 *emu,
+						   struct snd_emu10k1_pcm *epcm,
+						   int channels)
+{
+	for (int i = 0; i < channels; i++) {
+		int voice = epcm->voices[i]->number;
+		snd_emu10k1_ptr_write(emu, CPF_STOP, voice, 1);
+		snd_emu10k1_playback_commit_pitch(emu, voice, PITCH_48000 << 16);
+	}
+}
+
+static void snd_emu10k1_efx_playback_unmute_voices(struct snd_emu10k1 *emu,
+						   struct snd_emu10k1_pcm *epcm,
+						   int channels)
+{
+	for (int i = 0; i < channels; i++)
+		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[i], false, true,
+						  &emu->efx_pcm_mixer[i]);
+}
+
+static void snd_emu10k1_efx_playback_stop_voices(struct snd_emu10k1 *emu,
+						 struct snd_emu10k1_pcm *epcm,
+						 int channels)
+{
+	for (int i = 0; i < channels; i++)
+		snd_emu10k1_playback_stop_voice(emu, epcm->voices[i]);
+	snd_emu10k1_playback_set_stopped(emu, epcm);
+
+	for (int i = 0; i < channels; i++)
+		snd_emu10k1_playback_mute_voice(emu, epcm->voices[i]);
+}
 
 static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 				        int cmd)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
-	int i;
+	u64 mask;
 	int result = 0;
 
 	spin_lock(&emu->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		snd_emu10k1_playback_prepare_voices(emu, epcm, true, false, NUM_EFX_PLAYBACK);
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		for (i = 0; i < NUM_EFX_PLAYBACK; i++)
-			snd_emu10k1_playback_unmute_voice(emu, epcm->voices[i], false, true,
-							  &emu->efx_pcm_mixer[i]);
+		mask = snd_emu10k1_efx_playback_voice_mask(
+				epcm, NUM_EFX_PLAYBACK);
+		for (int i = 0; i < 10; i++) {
+			// Note that the freeze is not interruptible, so we make no
+			// effort to reset the bits outside the error handling here.
+			snd_emu10k1_voice_set_loop_stop_multiple(emu, mask);
+			snd_emu10k1_efx_playback_freeze_voices(
+					emu, epcm, NUM_EFX_PLAYBACK);
+			snd_emu10k1_playback_prepare_voices(
+					emu, epcm, true, false, NUM_EFX_PLAYBACK);
 
-		snd_emu10k1_playback_set_running(emu, epcm);
-		for (i = 0; i < NUM_EFX_PLAYBACK; i++)
-			snd_emu10k1_playback_trigger_voice(emu, epcm->voices[i]);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
+			// It might seem to make more sense to unmute the voices only after
+			// they have been started, to potentially avoid torturing the speakers
+			// if something goes wrong. However, we cannot unmute atomically,
+			// which means that we'd get some mild artifacts in the regular case.
+			snd_emu10k1_efx_playback_unmute_voices(emu, epcm, NUM_EFX_PLAYBACK);
+
+			snd_emu10k1_playback_set_running(emu, epcm);
+			result = snd_emu10k1_voice_clear_loop_stop_multiple_atomic(emu, mask);
+			if (result == 0) {
+				// The extra voice is allowed to lag a bit
+				snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
+				goto leave;
+			}
+
+			snd_emu10k1_efx_playback_stop_voices(
+					emu, epcm, NUM_EFX_PLAYBACK);
+
+			if (result != -EAGAIN)
+				break;
+			// The sync start can legitimately fail due to NMIs, etc.
+		}
+		snd_emu10k1_voice_clear_loop_stop_multiple(emu, mask);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		for (i = 0; i < NUM_EFX_PLAYBACK; i++) {	
-			snd_emu10k1_playback_stop_voice(emu, epcm->voices[i]);
-		}
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
-		snd_emu10k1_playback_set_stopped(emu, epcm);
+		snd_emu10k1_efx_playback_stop_voices(
+				emu, epcm, NUM_EFX_PLAYBACK);
 
-		for (i = 0; i < NUM_EFX_PLAYBACK; i++)
-			snd_emu10k1_playback_mute_voice(emu, epcm->voices[i]);
+		epcm->resume_pos = snd_emu10k1_playback_pointer(substream);
 		break;
 	default:
 		result = -EINVAL;
 		break;
 	}
+leave:
 	spin_unlock(&emu->reg_lock);
 	return result;
 }
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 6419719c739c..9a839e7d283f 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -505,6 +505,88 @@ void snd_emu10k1_voice_clear_loop_stop(struct snd_emu10k1 *emu, unsigned int voi
 }
 #endif
 
+void snd_emu10k1_voice_set_loop_stop_multiple(struct snd_emu10k1 *emu, u64 voices)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(SOLEL << 16, emu->port + PTR);
+	outl(inl(emu->port + DATA) | (u32)voices, emu->port + DATA);
+	outl(SOLEH << 16, emu->port + PTR);
+	outl(inl(emu->port + DATA) | (u32)(voices >> 32), emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+}
+
+void snd_emu10k1_voice_clear_loop_stop_multiple(struct snd_emu10k1 *emu, u64 voices)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(SOLEL << 16, emu->port + PTR);
+	outl(inl(emu->port + DATA) & (u32)~voices, emu->port + DATA);
+	outl(SOLEH << 16, emu->port + PTR);
+	outl(inl(emu->port + DATA) & (u32)(~voices >> 32), emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+}
+
+int snd_emu10k1_voice_clear_loop_stop_multiple_atomic(struct snd_emu10k1 *emu, u64 voices)
+{
+	unsigned long flags;
+	u32 soll, solh;
+	int ret = -EIO;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+
+	outl(SOLEL << 16, emu->port + PTR);
+	soll = inl(emu->port + DATA);
+	outl(SOLEH << 16, emu->port + PTR);
+	solh = inl(emu->port + DATA);
+
+	soll &= (u32)~voices;
+	solh &= (u32)(~voices >> 32);
+
+	for (int tries = 0; tries < 1000; tries++) {
+		const u32 quart = 1U << (REG_SIZE(WC_CURRENTCHANNEL) - 2);
+		// First we wait for the third quarter of the sample cycle ...
+		u32 wc = inl(emu->port + WC);
+		u32 cc = REG_VAL_GET(WC_CURRENTCHANNEL, wc);
+		if (cc >= quart * 2 && cc < quart * 3) {
+			// ... and release the low voices, while the high ones are serviced.
+			outl(SOLEL << 16, emu->port + PTR);
+			outl(soll, emu->port + DATA);
+			// Then we wait for the first quarter of the next sample cycle ...
+			for (; tries < 1000; tries++) {
+				cc = REG_VAL_GET(WC_CURRENTCHANNEL, inl(emu->port + WC));
+				if (cc < quart)
+					goto good;
+				// We will block for 10+ us with interrupts disabled. This is
+				// not nice at all, but necessary for reasonable reliability.
+				udelay(1);
+			}
+			break;
+		good:
+			// ... and release the high voices, while the low ones are serviced.
+			outl(SOLEH << 16, emu->port + PTR);
+			outl(solh, emu->port + DATA);
+			// Finally we verify that nothing interfered in fact.
+			if (REG_VAL_GET(WC_SAMPLECOUNTER, inl(emu->port + WC)) ==
+			    ((REG_VAL_GET(WC_SAMPLECOUNTER, wc) + 1) & REG_MASK0(WC_SAMPLECOUNTER))) {
+				ret = 0;
+			} else {
+				ret = -EAGAIN;
+			}
+			break;
+		}
+		// Don't block for too long
+		spin_unlock_irqrestore(&emu->emu_lock, flags);
+		udelay(1);
+		spin_lock_irqsave(&emu->emu_lock, flags);
+	}
+
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	return ret;
+}
+
 void snd_emu10k1_wait(struct snd_emu10k1 *emu, unsigned int wait)
 {
 	volatile unsigned count;
-- 
2.40.0.152.g15d061e6df


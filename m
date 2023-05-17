Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF520706FBB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 19:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA1FC207;
	Wed, 17 May 2023 19:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA1FC207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684345496;
	bh=9t8Ii5NQ3tmTBUy7nfUmlO0rhCmyqLufilBoTdGrccM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sYbkwN1hctZjljHCdN4pFhMXi8DeUM9agt9MtTfVnkonn7mgmzycNwyxEPVt4xC/2
	 IEc9wBlR01+2UffGD2VzzdBKshpD2sdUHtR8d2WJ2ceBffJrprq0sPGt5XayujiCZD
	 ir0QxiYY5AK2hAO4zGTY2cEI1ZIcghjPH7ftPaIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE9C2F8056F; Wed, 17 May 2023 19:43:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A640F8055C;
	Wed, 17 May 2023 19:43:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11104F80549; Wed, 17 May 2023 19:43:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3208CF80272
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 19:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3208CF80272
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9E55F24086;
	Wed, 17 May 2023 13:42:56 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzLAu-LND-00; Wed, 17 May 2023 19:42:56 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/9] Revert "ALSA: emu10k1 - delay the PCM interrupts (add
 pcm_irq_delay parameter)"
Date: Wed, 17 May 2023 19:42:49 +0200
Message-Id: <20230517174256.3657060-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230517174256.3657060-1-oswald.buddenhagen@gmx.de>
References: <20230517174256.3657060-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YAQNJGU3UWYNCIHESARH3UHR6V7FSBMI
X-Message-ID-Hash: YAQNJGU3UWYNCIHESARH3UHR6V7FSBMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YAQNJGU3UWYNCIHESARH3UHR6V7FSBMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This workaround fails to address the underlying problem, which is
actually wholly self-made. Subsequent patches will fix it.

This reverts commit 56385a12d9bb9e173751f74b6c430742018cafc0.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h     |  1 -
 sound/core/pcm_native.c     |  4 ----
 sound/pci/emu10k1/emu10k1.c |  4 ----
 sound/pci/emu10k1/emupcm.c  | 25 ++-----------------------
 sound/pci/emu10k1/memory.c  |  4 +---
 5 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 5ad2144fa530..2d64f07e3883 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1670,7 +1670,6 @@ struct snd_emu10k1 {
 	unsigned int address_mode;		/* address mode */
 	unsigned long dma_mask;			/* PCI DMA mask */
 	bool iommu_workaround;			/* IOMMU workaround needed */
-	unsigned int delay_pcm_irq;		/* in samples */
 	int max_cache_pages;			/* max memory size / PAGE_SIZE */
 	struct snd_dma_buffer silent_page;	/* silent page */
 	struct snd_dma_buffer ptb_pages;	/* page table pages */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 39a65d1415ab..95fc56e403b1 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1605,10 +1605,6 @@ static int snd_pcm_do_pause(struct snd_pcm_substream *substream,
 {
 	if (substream->runtime->trigger_master != substream)
 		return 0;
-	/* some drivers might use hw_ptr to recover from the pause -
-	   update the hw_ptr now */
-	if (pause_pushed(state))
-		snd_pcm_update_hw_ptr(substream);
 	/* The jiffies check in snd_pcm_update_hw_ptr*() is done by
 	 * a delta between the current jiffies, this gives a large enough
 	 * delta, effectively to skip the check once.
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 0c97237af922..23adace1b969 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -34,7 +34,6 @@ static int max_synth_voices[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 64};
 static int max_buffer_size[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 128};
 static bool enable_ir[SNDRV_CARDS];
 static uint subsystem[SNDRV_CARDS]; /* Force card subsystem model */
-static uint delay_pcm_irq[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 2};
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for the EMU10K1 soundcard.");
@@ -56,8 +55,6 @@ module_param_array(enable_ir, bool, NULL, 0444);
 MODULE_PARM_DESC(enable_ir, "Enable IR.");
 module_param_array(subsystem, uint, NULL, 0444);
 MODULE_PARM_DESC(subsystem, "Force card subsystem model.");
-module_param_array(delay_pcm_irq, uint, NULL, 0444);
-MODULE_PARM_DESC(delay_pcm_irq, "Delay PCM interrupt by specified number of samples (default 0).");
 /*
  * Class 0401: 1102:0008 (rev 00) Subsystem: 1102:1001 -> Audigy2 Value  Model:SB0400
  */
@@ -103,7 +100,6 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 				 enable_ir[dev], subsystem[dev]);
 	if (err < 0)
 		return err;
-	emu->delay_pcm_irq = delay_pcm_irq[dev] & 0x1f;
 	err = snd_emu10k1_pcm(emu, 0);
 	if (err < 0)
 		return err;
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 9f151a0a7756..27977d03e323 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -290,7 +290,7 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 		evoice->epcm->ccca_start_addr = start_addr + ccis;
 		if (extra) {
 			start_addr += ccis;
-			end_addr += ccis + emu->delay_pcm_irq;
+			end_addr += ccis;
 		}
 	}
 	if (stereo && !extra) {
@@ -315,9 +315,7 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	snd_emu10k1_ptr_write(emu, PTRX, voice, (send_amount[0] << 8) | send_amount[1]);
 	// Stereo slaves don't need to have the addresses set, but it doesn't hurt
 	snd_emu10k1_ptr_write(emu, DSL, voice, end_addr | (send_amount[3] << 24));
-	snd_emu10k1_ptr_write(emu, PSST, voice,
-			(start_addr + (extra ? emu->delay_pcm_irq : 0)) |
-			(send_amount[2] << 24));
+	snd_emu10k1_ptr_write(emu, PSST, voice, start_addr | (send_amount[2] << 24));
 	if (emu->card_capabilities->emu_model)
 		pitch_target = PITCH_48000; /* Disable interpolators on emu1010 card */
 	else 
@@ -647,23 +645,6 @@ static void snd_emu10k1_playback_set_stopped(struct snd_emu10k1 *emu,
 	epcm->running = 0;
 }
 
-static inline void snd_emu10k1_playback_mangle_extra(struct snd_emu10k1 *emu,
-		struct snd_emu10k1_pcm *epcm,
-		struct snd_pcm_substream *substream,
-		struct snd_pcm_runtime *runtime)
-{
-	unsigned int ptr, period_pos;
-
-	/* try to sychronize the current position for the interrupt
-	   source voice */
-	period_pos = runtime->status->hw_ptr - runtime->hw_ptr_interrupt;
-	period_pos %= runtime->period_size;
-	ptr = snd_emu10k1_ptr_read(emu, CCCA, epcm->extra->number);
-	ptr &= ~0x00ffffff;
-	ptr |= epcm->ccca_start_addr + period_pos;
-	snd_emu10k1_ptr_write(emu, CCCA, epcm->extra->number, ptr);
-}
-
 static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 				        int cmd)
 {
@@ -686,8 +667,6 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
-			snd_emu10k1_playback_mangle_extra(emu, epcm, substream, runtime);
 		mix = &emu->pcm_mixer[substream->number];
 		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[0], true, mix);
 		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[1], false, mix);
diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index edb3f1763719..20b07117574b 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -315,10 +315,8 @@ snd_emu10k1_alloc_pages(struct snd_emu10k1 *emu, struct snd_pcm_substream *subst
 	if (snd_BUG_ON(!hdr))
 		return NULL;
 
-	idx = runtime->period_size >= runtime->buffer_size ?
-					(emu->delay_pcm_irq * 2) : 0;
 	mutex_lock(&hdr->block_mutex);
-	blk = search_empty(emu, runtime->dma_bytes + idx);
+	blk = search_empty(emu, runtime->dma_bytes);
 	if (blk == NULL) {
 		mutex_unlock(&hdr->block_mutex);
 		return NULL;
-- 
2.40.0.152.g15d061e6df


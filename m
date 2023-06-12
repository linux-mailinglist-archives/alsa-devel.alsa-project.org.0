Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4972CF32
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273C36C0;
	Mon, 12 Jun 2023 21:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273C36C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597423;
	bh=bhsNJyUWb/Kb2G5nfKSStAiNyy4eL/TvDIRssBuWuKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n1IWHF+3GHlVFztYHkPdoFUHqgB5Ta5bqngl1nj1PXbU/6a8wzQ62M0lxKHFSARmM
	 BR6QV66ObbFUOtGJ7YDjke705qPn70RnhCZ/V4UgjQ4lyZhzV2VmY142+ObLzorBYv
	 vYjOiwpKXsUWFVXqaSMWdRmUXbDdWuVY3Wjvsg8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 594EDF80301; Mon, 12 Jun 2023 21:14:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D9D1F800ED;
	Mon, 12 Jun 2023 21:14:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6752F80149; Mon, 12 Jun 2023 21:14:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D3A68F80301
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A68F80301
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id DEEE6241F9;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WK9-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 4/9] ALSA: emu10k1: fix sample rates for E-MU cards at 44.1
 kHz word clock
Date: Mon, 12 Jun 2023 21:13:20 +0200
Message-Id: <20230612191325.1315854-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IBM7E56R2LQCU34SJSTVGNMYMO3HYIDT
X-Message-ID-Hash: IBM7E56R2LQCU34SJSTVGNMYMO3HYIDT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBM7E56R2LQCU34SJSTVGNMYMO3HYIDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that we know the actual word clock, we can:
- Put the resulting rate into the hardware info
- At 44.1 kHz word clock shift the rate for the pitch calculations,
  which presume a 48 kHz word clock

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h    |   1 +
 sound/pci/emu10k1/emupcm.c | 112 ++++++++++++++++++-------------------
 2 files changed, 56 insertions(+), 57 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index d64cf1697586..386a5f3be3e0 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1495,6 +1495,7 @@ struct snd_emu10k1_pcm {
 	unsigned short first_ptr;
 	snd_pcm_uframes_t resume_pos;
 	struct snd_util_memblk *memblk;
+	unsigned int pitch_target;
 	unsigned int start_addr;
 	unsigned int ccca_start_addr;
 	unsigned int capture_ipr;	/* interrupt acknowledge mask */
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index fab537788587..3ef9130a9577 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -195,6 +195,33 @@ static unsigned int snd_emu10k1_audigy_capture_rate_reg(unsigned int rate)
 	}
 }
 
+static void snd_emu10k1_constrain_capture_rates(struct snd_emu10k1 *emu,
+						struct snd_pcm_runtime *runtime)
+{
+	if (emu->card_capabilities->emu_model &&
+	    emu->emu1010.word_clock == 44100) {
+		// This also sets the rate constraint by deleting SNDRV_PCM_RATE_KNOT
+		runtime->hw.rates = SNDRV_PCM_RATE_11025 | \
+				    SNDRV_PCM_RATE_22050 | \
+				    SNDRV_PCM_RATE_44100;
+		runtime->hw.rate_min = 11025;
+		runtime->hw.rate_max = 44100;
+		return;
+	}
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &hw_constraints_capture_rates);
+}
+
+static void snd_emu1010_constrain_efx_rate(struct snd_emu10k1 *emu,
+					   struct snd_pcm_runtime *runtime)
+{
+	int rate;
+
+	rate = emu->emu1010.word_clock;
+	runtime->hw.rate_min = runtime->hw.rate_max = rate;
+	runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
+}
+
 static unsigned int emu10k1_calc_pitch_target(unsigned int rate)
 {
 	unsigned int pitch_target;
@@ -251,29 +278,22 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 				       const unsigned char *send_routing,
 				       const unsigned char *send_amount)
 {
-	struct snd_pcm_substream *substream = evoice->epcm->substream;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int silent_page;
 	int voice;
-	unsigned int pitch_target;
 
 	voice = evoice->number;
 
-	if (emu->card_capabilities->emu_model)
-		pitch_target = PITCH_48000; /* Disable interpolators on emu1010 card */
-	else
-		pitch_target = emu10k1_calc_pitch_target(runtime->rate);
 	silent_page = ((unsigned int)emu->silent_page.addr << emu->address_mode) |
 		      (emu->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
 	snd_emu10k1_ptr_write_multiple(emu, voice,
 		// Not really necessary for the slave, but it doesn't hurt
 		CPF, stereo ? CPF_STEREO_MASK : 0,
 		// Assumption that PT is already 0 so no harm overwriting
 		PTRX, (send_amount[0] << 8) | send_amount[1],
 		// Stereo slaves don't need to have the addresses set, but it doesn't hurt
 		DSL, end_addr | (send_amount[3] << 24),
 		PSST, start_addr | (send_amount[2] << 24),
-		CCCA, emu10k1_select_interprom(pitch_target) |
+		CCCA, emu10k1_select_interprom(evoice->epcm->pitch_target) |
 		      (w_16 ? 0 : CCCA_8BITSELECT),
 		// Clear filter delay memory
 		Z1, 0,
@@ -419,6 +439,13 @@ static int snd_emu10k1_playback_prepare(struct snd_pcm_substream *substream)
 	bool w_16 = snd_pcm_format_width(runtime->format) == 16;
 	bool stereo = runtime->channels == 2;
 	unsigned int start_addr, end_addr;
+	unsigned int rate;
+
+	rate = runtime->rate;
+	if (emu->card_capabilities->emu_model &&
+	    emu->emu1010.word_clock == 44100)
+		rate = rate * 480 / 441;
+	epcm->pitch_target = emu10k1_calc_pitch_target(rate);
 
 	start_addr = epcm->start_addr >> w_16;
 	end_addr = start_addr + runtime->period_size;
@@ -443,6 +470,8 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	unsigned int extra_size, channel_size;
 	unsigned int i;
 
+	epcm->pitch_target = PITCH_48000;
+
 	start_addr = epcm->start_addr >> 1;  // 16-bit voices
 
 	extra_size = runtime->period_size;
@@ -526,12 +555,16 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 		epcm->capture_bs_val++;
 	}
 	if (epcm->type == CAPTURE_AC97ADC) {
+		unsigned rate = runtime->rate;
+		if (!(runtime->hw.rates & SNDRV_PCM_RATE_48000))
+			rate = rate * 480 / 441;
+
 		epcm->capture_cr_val = emu->audigy ? A_ADCCR_LCHANENABLE : ADCCR_LCHANENABLE;
 		if (runtime->channels > 1)
 			epcm->capture_cr_val |= emu->audigy ? A_ADCCR_RCHANENABLE : ADCCR_RCHANENABLE;
 		epcm->capture_cr_val |= emu->audigy ?
-			snd_emu10k1_audigy_capture_rate_reg(runtime->rate) :
-			snd_emu10k1_capture_rate_reg(runtime->rate);
+			snd_emu10k1_audigy_capture_rate_reg(rate) :
+			snd_emu10k1_capture_rate_reg(rate);
 	}
 	return 0;
 }
@@ -670,19 +703,10 @@ static void snd_emu10k1_playback_commit_pitch(struct snd_emu10k1 *emu,
 static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu,
 					       struct snd_emu10k1_voice *evoice)
 {
-	struct snd_pcm_substream *substream;
-	struct snd_pcm_runtime *runtime;
-	unsigned int voice, pitch_target;
+	unsigned int voice;
 
-	substream = evoice->epcm->substream;
-	runtime = substream->runtime;
 	voice = evoice->number;
-
-	if (emu->card_capabilities->emu_model)
-		pitch_target = PITCH_48000; /* Disable interpolators on emu1010 card */
-	else 
-		pitch_target = emu10k1_calc_pitch_target(runtime->rate);
-	snd_emu10k1_playback_commit_pitch(emu, voice, pitch_target << 16);
+	snd_emu10k1_playback_commit_pitch(emu, voice, evoice->epcm->pitch_target << 16);
 }
 
 static void snd_emu10k1_playback_stop_voice(struct snd_emu10k1 *emu,
@@ -1043,11 +1067,9 @@ static const struct snd_pcm_hardware snd_emu10k1_capture_efx =
 				 SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_MMAP_VALID),
 	.formats =		SNDRV_PCM_FMTBIT_S16_LE,
-	.rates =		SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 | 
-				 SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 | 
-				 SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000,
-	.rate_min =		44100,
-	.rate_max =		192000,
+	.rates =		SNDRV_PCM_RATE_48000,
+	.rate_min =		48000,
+	.rate_max =		48000,
 	.channels_min =		1,
 	.channels_max =		16,
 	.buffer_bytes_max =	(64*1024),
@@ -1144,6 +1166,8 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_efx_playback;
+	if (emu->card_capabilities->emu_model)
+		snd_emu1010_constrain_efx_rate(emu, runtime);
 	err = snd_emu10k1_playback_set_constraints(runtime);
 	if (err < 0) {
 		kfree(epcm);
@@ -1185,8 +1209,8 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
 		kfree(epcm);
 		return err;
 	}
-	if (emu->card_capabilities->emu_model && emu->emu1010.clock_source == 0)
-		sample_rate = 44100;
+	if (emu->card_capabilities->emu_model)
+		sample_rate = emu->emu1010.word_clock;
 	else
 		sample_rate = 48000;
 	err = snd_pcm_hw_rule_noresample(runtime, sample_rate);
@@ -1236,11 +1260,11 @@ static int snd_emu10k1_capture_open(struct snd_pcm_substream *substream)
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture;
+	snd_emu10k1_constrain_capture_rates(emu, runtime);
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				   &hw_constraints_capture_buffer_sizes);
 	emu->capture_interrupt = snd_emu10k1_pcm_ac97adc_interrupt;
 	emu->pcm_capture_substream = substream;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_capture_rates);
 	return 0;
 }
 
@@ -1313,51 +1337,25 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 	substream->runtime->private_data = epcm;
 	substream->runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture_efx;
-	runtime->hw.rates = SNDRV_PCM_RATE_48000;
-	runtime->hw.rate_min = runtime->hw.rate_max = 48000;
 	if (emu->card_capabilities->emu_model) {
-		/* TODO
-		 * SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
-		 * SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |
-		 * SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000
-		 * rate_min = 44100,
-		 * rate_max = 192000,
-		 * Need to add mixer control to fix sample rate
-		 *                 
+		snd_emu1010_constrain_efx_rate(emu, runtime);
+		/*
 		 * There are 32 mono channels of 16bits each.
 		 * 24bit Audio uses 2x channels over 16bit,
 		 * 96kHz uses 2x channels over 48kHz,
 		 * 192kHz uses 4x channels over 48kHz.
 		 * So, for 48kHz 24bit, one has 16 channels,
 		 * for 96kHz 24bit, one has 8 channels,
 		 * for 192kHz 24bit, one has 4 channels.
 		 * 1010rev2 and 1616(m) cards have double that,
 		 * but we don't exceed 16 channels anyway.
 		 */
-#if 1
-		switch (emu->emu1010.clock_source) {
-		case 0:
-			/* For 44.1kHz */
-			runtime->hw.rates = SNDRV_PCM_RATE_44100;
-			runtime->hw.rate_min = runtime->hw.rate_max = 44100;
-			break;
-		case 1:
-			/* For 48kHz */
-			runtime->hw.rates = SNDRV_PCM_RATE_48000;
-			runtime->hw.rate_min = runtime->hw.rate_max = 48000;
-			break;
-		}
-#endif
 #if 0
 		/* For 96kHz */
-		runtime->hw.rates = SNDRV_PCM_RATE_96000;
-		runtime->hw.rate_min = runtime->hw.rate_max = 96000;
 		runtime->hw.channels_min = runtime->hw.channels_max = 4;
 #endif
 #if 0
 		/* For 192kHz */
-		runtime->hw.rates = SNDRV_PCM_RATE_192000;
-		runtime->hw.rate_min = runtime->hw.rate_max = 192000;
 		runtime->hw.channels_min = runtime->hw.channels_max = 2;
 #endif
 		runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
-- 
2.40.0.152.g15d061e6df


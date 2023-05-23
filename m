Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D509570E640
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 22:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA47C847;
	Tue, 23 May 2023 22:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA47C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684872569;
	bh=X4bkstpQFWZc10ZKhTX+tvM2BcKaXU/d1+qzY6vPCww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oe28UEVG+A0EwvPCvmWgj31b96mfZAR3JLH+ZMdey/Gr8AhsNk90+Q2akksdOaV4C
	 GzHn3y2NZIuXGfiI/GX/E4VlE0StF8DqPf2POXbviB3xHkwRCFBef6x++CyTecrYDQ
	 xfBzp/57F5NvXKFFIZ+A2vD0izLe5d/rNfGXcD8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECC9FF805AC; Tue, 23 May 2023 22:07:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F0BFF805A0;
	Tue, 23 May 2023 22:07:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3068F800DF; Tue, 23 May 2023 22:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4655CF80542
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 22:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4655CF80542
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5833724265;
	Tue, 23 May 2023 16:07:10 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q1YHm-zQ0-00; Tue, 23 May 2023 22:07:10 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 4/4] ALSA: emu10k1: fix multi-channel capture config for E-MU
 cards
Date: Tue, 23 May 2023 22:07:09 +0200
Message-Id: <20230523200709.236059-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230523200709.236059-1-oswald.buddenhagen@gmx.de>
References: <20230523200709.236059-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WUK6FGT727AQCHGMUE7F52FWH4CHHWJB
X-Message-ID-Hash: WUK6FGT727AQCHGMUE7F52FWH4CHHWJB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WUK6FGT727AQCHGMUE7F52FWH4CHHWJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On SB cards the number of captured channels is derived from the voice
mask mixer control. But for E-MU cards this wasn't actually "wired up",
so changing the mask would simply mess up the recording.

We could fix that, but the channel routing through the FPGA makes the
masking redundant. So instead we hide the control, and let the user
specify the PCM channel count the traditional way.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 76 ++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 44 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index ac10b53525fd..c7f17b6e7469 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -494,6 +494,12 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 		snd_emu10k1_ptr_write(emu, ADCCR, 0, 0);
 		break;
 	case CAPTURE_EFX:
+		if (emu->card_capabilities->emu_model) {
+			// The upper 32 16-bit capture voices, two for each of the 16 32-bit channels.
+			// The lower voices are occupied by A_EXTOUT_*_CAP*.
+			epcm->capture_cr_val = 0;
+			epcm->capture_cr_val2 = 0xffffffff >> (32 - runtime->channels * 2);
+		}
 		if (emu->audigy) {
 			snd_emu10k1_ptr_write_multiple(emu, 0,
 				A_FXWC1, 0,
@@ -977,8 +983,8 @@ static const struct snd_pcm_hardware snd_emu10k1_capture_efx =
 				 SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000,
 	.rate_min =		44100,
 	.rate_max =		192000,
-	.channels_min =		8,
-	.channels_max =		8,
+	.channels_min =		1,
+	.channels_max =		16,
 	.buffer_bytes_max =	(64*1024),
 	.period_bytes_min =	384,
 	.period_bytes_max =	(64*1024),
@@ -1204,7 +1210,6 @@ static int snd_emu10k1_capture_mic_open(struct snd_pcm_substream *substream)
 	runtime->hw = snd_emu10k1_capture;
 	runtime->hw.rates = SNDRV_PCM_RATE_8000;
 	runtime->hw.rate_min = runtime->hw.rate_max = 8000;
-	runtime->hw.channels_min = 1;
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				   &hw_constraints_capture_buffer_sizes);
 	emu->capture_mic_interrupt = snd_emu10k1_pcm_ac97mic_interrupt;
@@ -1245,16 +1250,13 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 	runtime->hw = snd_emu10k1_capture_efx;
 	runtime->hw.rates = SNDRV_PCM_RATE_48000;
 	runtime->hw.rate_min = runtime->hw.rate_max = 48000;
-	spin_lock_irq(&emu->reg_lock);
 	if (emu->card_capabilities->emu_model) {
 		/* TODO
 		 * SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
 		 * SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |
 		 * SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000
 		 * rate_min = 44100,
 		 * rate_max = 192000,
-		 * channels_min = 16,
-		 * channels_max = 16,
 		 * Need to add mixer control to fix sample rate
 		 *                 
 		 * There are 32 mono channels of 16bits each.
@@ -1273,15 +1275,11 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 			/* For 44.1kHz */
 			runtime->hw.rates = SNDRV_PCM_RATE_44100;
 			runtime->hw.rate_min = runtime->hw.rate_max = 44100;
-			runtime->hw.channels_min =
-				runtime->hw.channels_max = 16;
 			break;
 		case 1:
 			/* For 48kHz */
 			runtime->hw.rates = SNDRV_PCM_RATE_48000;
 			runtime->hw.rate_min = runtime->hw.rate_max = 48000;
-			runtime->hw.channels_min =
-				runtime->hw.channels_max = 16;
 			break;
 		}
 #endif
@@ -1298,21 +1296,19 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 		runtime->hw.channels_min = runtime->hw.channels_max = 2;
 #endif
 		runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
-		/* efx_voices_mask[0] is expected to be zero
- 		 * efx_voices_mask[1] is expected to have 32bits set
-		 */
 	} else {
+		spin_lock_irq(&emu->reg_lock);
 		runtime->hw.channels_min = runtime->hw.channels_max = 0;
 		for (idx = 0; idx < nefx; idx++) {
 			if (emu->efx_voices_mask[idx/32] & (1 << (idx%32))) {
 				runtime->hw.channels_min++;
 				runtime->hw.channels_max++;
 			}
 		}
+		epcm->capture_cr_val = emu->efx_voices_mask[0];
+		epcm->capture_cr_val2 = emu->efx_voices_mask[1];
+		spin_unlock_irq(&emu->reg_lock);
 	}
-	epcm->capture_cr_val = emu->efx_voices_mask[0];
-	epcm->capture_cr_val2 = emu->efx_voices_mask[1];
-	spin_unlock_irq(&emu->reg_lock);
 	err = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 					 &hw_constraints_efx_capture_channels);
 	if (err < 0) {
@@ -1779,37 +1775,29 @@ int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device)
 		strcpy(pcm->name, "Multichannel Capture/PT Playback");
 	emu->pcm_efx = pcm;
 
-	/* EFX capture - record the "FXBUS2" channels, by default we connect the EXTINs 
-	 * to these
-	 */	
-	
-	if (emu->audigy) {
-		emu->efx_voices_mask[0] = 0;
-		if (emu->card_capabilities->emu_model)
-			/* Pavel Hofman - 32 voices will be used for
-			 * capture (write mode) -
-			 * each bit = corresponding voice
-			 */
-			emu->efx_voices_mask[1] = 0xffffffff;
-		else
+	if (!emu->card_capabilities->emu_model) {
+		// On Sound Blasters, the DSP code copies the EXTINs to FXBUS2.
+		// The mask determines which of these and the EXTOUTs the multi-
+		// channel capture actually records (the channel order is fixed).
+		if (emu->audigy) {
+			emu->efx_voices_mask[0] = 0;
 			emu->efx_voices_mask[1] = 0xffff;
+		} else {
+			emu->efx_voices_mask[0] = 0xffff0000;
+			emu->efx_voices_mask[1] = 0;
+		}
+		kctl = snd_ctl_new1(&snd_emu10k1_pcm_efx_voices_mask, emu);
+		if (!kctl)
+			return -ENOMEM;
+		kctl->id.device = device;
+		err = snd_ctl_add(emu->card, kctl);
+		if (err < 0)
+			return err;
 	} else {
-		emu->efx_voices_mask[0] = 0xffff0000;
-		emu->efx_voices_mask[1] = 0;
+		// On E-MU cards, the DSP code copies the P16VINs/EMU32INs to
+		// FXBUS2. These are already selected & routed by the FPGA,
+		// so there is no need to apply additional masking.
 	}
-	/* For emu1010, the control has to set 32 upper bits (voices)
-	 * out of the 64 bits (voices) to true for the 16-channels capture
-	 * to work correctly. Correct A_FXWC2 initial value (0xffffffff)
-	 * is already defined but the snd_emu10k1_pcm_efx_voices_mask
-	 * control can override this register's value.
-	 */
-	kctl = snd_ctl_new1(&snd_emu10k1_pcm_efx_voices_mask, emu);
-	if (!kctl)
-		return -ENOMEM;
-	kctl->id.device = device;
-	err = snd_ctl_add(emu->card, kctl);
-	if (err < 0)
-		return err;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &emu->pci->dev,
 				       64*1024, 64*1024);
-- 
2.40.0.152.g15d061e6df


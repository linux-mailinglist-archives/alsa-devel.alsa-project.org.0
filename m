Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C40370E63F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 22:09:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A7B82B;
	Tue, 23 May 2023 22:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A7B82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684872552;
	bh=YuUTVTX0070PKf/p+zVaYS2hNzUtzBJ87Q3jL1dLtPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cfm8p5t/D40qKd7/GpMZprk1fzawb+Yw3gK6BTDFN1qUpLSVLWf9MtVspTlLi20Cc
	 lf8T/lft4h2rhjeZ85dvqrBCdoJdJnzA4C2GQlmnKO8NXKGuPy4HnpkAKG0RLY4tNo
	 KB3UpbP7rwH+iVV+w87/1YVXBo+d9j1eUmZJ5508=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ABADF80587; Tue, 23 May 2023 22:07:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19988F8057D;
	Tue, 23 May 2023 22:07:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86FF0F8053D; Tue, 23 May 2023 22:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01DB9F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 22:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01DB9F800DF
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1B38E241EF;
	Tue, 23 May 2023 16:07:10 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q1YHl-zPJ-00; Tue, 23 May 2023 22:07:09 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/3] ALSA: emu10k1: make channel count of multi-channel
 playback flexible
Date: Tue, 23 May 2023 22:07:09 +0200
Message-Id: <20230523200709.236023-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230523200709.236023-1-oswald.buddenhagen@gmx.de>
References: <20230523200709.236023-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IL6T56NQBKUX72VMZBNEBACIAYMS2POV
X-Message-ID-Hash: IL6T56NQBKUX72VMZBNEBACIAYMS2POV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IL6T56NQBKUX72VMZBNEBACIAYMS2POV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no reason to nail it to 16 channels.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 4df6f5285993..e34b02e9f890 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -430,18 +430,18 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
 	unsigned int start_addr;
 	unsigned int extra_size, channel_size;
-	int i;
+	unsigned int i;
 
 	start_addr = epcm->start_addr >> 1;  // 16-bit voices
 
 	extra_size = runtime->period_size;
 	channel_size = runtime->buffer_size;
 
 	snd_emu10k1_pcm_init_extra_voice(emu, epcm->extra, true,
 					 start_addr, start_addr + extra_size);
 
 	epcm->ccca_start_addr = start_addr;
-	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
+	for (i = 0; i < runtime->channels; i++) {
 		snd_emu10k1_pcm_init_voices(emu, epcm->voices[i], true, false,
 					    start_addr, start_addr + channel_size,
 					    &emu->efx_pcm_mixer[i]);
@@ -461,7 +461,7 @@ static const struct snd_pcm_hardware snd_emu10k1_efx_playback =
 	.rates =		SNDRV_PCM_RATE_48000,
 	.rate_min =		48000,
 	.rate_max =		48000,
-	.channels_min =		NUM_EFX_PLAYBACK,
+	.channels_min =		1,
 	.channels_max =		NUM_EFX_PLAYBACK,
 	.buffer_bytes_max =	(128*1024),
 	.period_bytes_max =	(128*1024),
@@ -903,32 +903,32 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		mask = snd_emu10k1_efx_playback_voice_mask(
-				epcm, NUM_EFX_PLAYBACK);
+				epcm, runtime->channels);
 		for (int i = 0; i < 10; i++) {
 			// Note that the freeze is not interruptible, so we make no
 			// effort to reset the bits outside the error handling here.
 			snd_emu10k1_voice_set_loop_stop_multiple(emu, mask);
 			snd_emu10k1_efx_playback_freeze_voices(
-					emu, epcm, NUM_EFX_PLAYBACK);
+					emu, epcm, runtime->channels);
 			snd_emu10k1_playback_prepare_voices(
-					emu, epcm, true, false, NUM_EFX_PLAYBACK);
+					emu, epcm, true, false, runtime->channels);
 
 			// It might seem to make more sense to unmute the voices only after
 			// they have been started, to potentially avoid torturing the speakers
 			// if something goes wrong. However, we cannot unmute atomically,
 			// which means that we'd get some mild artifacts in the regular case.
-			snd_emu10k1_efx_playback_unmute_voices(emu, epcm, NUM_EFX_PLAYBACK);
+			snd_emu10k1_efx_playback_unmute_voices(emu, epcm, runtime->channels);
 
 			snd_emu10k1_playback_set_running(emu, epcm);
 			result = snd_emu10k1_voice_clear_loop_stop_multiple_atomic(emu, mask);
 			if (result == 0) {
 				// The extra voice is allowed to lag a bit
 				snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
 				goto leave;
 			}
 
 			snd_emu10k1_efx_playback_stop_voices(
-					emu, epcm, NUM_EFX_PLAYBACK);
+					emu, epcm, runtime->channels);
 
 			if (result != -EAGAIN)
 				break;
@@ -941,7 +941,7 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
 		snd_emu10k1_efx_playback_stop_voices(
-				emu, epcm, NUM_EFX_PLAYBACK);
+				emu, epcm, runtime->channels);
 
 		epcm->resume_pos = snd_emu10k1_playback_pointer(substream);
 		break;
-- 
2.40.0.152.g15d061e6df


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84470DAD2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 12:47:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72650208;
	Tue, 23 May 2023 12:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72650208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684838870;
	bh=TI2Zy09jlQccktzM59HWSLHsvt3YJrL+qpM5wwdd1O0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GcNiA6G2ELarRuaWXXUvMkcNXiE1tdZgpVFa4+b8FcN4LjgTJuSI9kn7Y3GmZfuYp
	 mAIKA4q/SzGDT1Lq78rymy1/Yzl3LkJ2GZVDB6Fm6TzeLvwUqL1IvrmwqRo97u5iD5
	 0npKyM50k5o1p9iwee7GZDC8OPTQes5x7ePtH9ZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3874F80558; Tue, 23 May 2023 12:46:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47920F80549;
	Tue, 23 May 2023 12:46:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDAA1F8024E; Tue, 23 May 2023 12:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13266F8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 12:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13266F8016A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B7A0424152;
	Tue, 23 May 2023 06:46:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q1PWu-pjy-00; Tue, 23 May 2023 12:46:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ALSA: emu10k1: introduce higher-level voice manipulation
 functions
Date: Tue, 23 May 2023 12:46:11 +0200
Message-Id: <20230523104612.198884-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2KP6DBD5G4I3AZMNR5HVQBTH5LGYGDOA
X-Message-ID-Hash: 2KP6DBD5G4I3AZMNR5HVQBTH5LGYGDOA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KP6DBD5G4I3AZMNR5HVQBTH5LGYGDOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds snd_emu10k1_pcm_init_{voices,extra_voice}() and
snd_emu10k1_playback_{un,}mute_voices() to slightly abstract by voice
function and potential stereo property.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 70 +++++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 17 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 0036593cca7c..65af94d08b47 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -312,6 +312,30 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	spin_unlock_irqrestore(&emu->reg_lock, flags);
 }
 
+static void snd_emu10k1_pcm_init_voices(struct snd_emu10k1 *emu,
+					struct snd_emu10k1_voice *evoice,
+					bool w_16, bool stereo,
+					unsigned int start_addr,
+					unsigned int end_addr,
+					struct snd_emu10k1_pcm_mixer *mix)
+{
+	snd_emu10k1_pcm_init_voice(emu, 1, 0, evoice, w_16, stereo,
+				   start_addr, end_addr, mix);
+	if (stereo)
+		snd_emu10k1_pcm_init_voice(emu, 0, 0, evoice + 1, w_16, true,
+					   start_addr, end_addr, mix);
+}
+
+static void snd_emu10k1_pcm_init_extra_voice(struct snd_emu10k1 *emu,
+					     struct snd_emu10k1_voice *evoice,
+					     bool w_16,
+					     unsigned int start_addr,
+					     unsigned int end_addr)
+{
+	snd_emu10k1_pcm_init_voice(emu, 1, 1, evoice, w_16, false,
+				   start_addr, end_addr, NULL);
+}
+
 static int snd_emu10k1_playback_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *hw_params)
 {
@@ -393,18 +417,15 @@ static int snd_emu10k1_playback_prepare(struct snd_pcm_substream *substream)
 
 	start_addr = epcm->start_addr >> w_16;
 	end_addr = start_addr + runtime->period_size;
-	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra, w_16, false,
-				   start_addr, end_addr, NULL);
+	snd_emu10k1_pcm_init_extra_voice(emu, epcm->extra, w_16,
+					 start_addr, end_addr);
 	start_addr >>= stereo;
 	epcm->ccca_start_addr = start_addr;
 	end_addr = start_addr + runtime->buffer_size;
-	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0], w_16, stereo,
-				   start_addr, end_addr,
-				   &emu->pcm_mixer[substream->number]);
-	if (stereo)
-		snd_emu10k1_pcm_init_voice(emu, 0, 0, epcm->voices[0] + 1, w_16, true,
-					   start_addr, end_addr,
-					   &emu->pcm_mixer[substream->number]);
+	snd_emu10k1_pcm_init_voices(emu, epcm->voices[0], w_16, stereo,
+				    start_addr, end_addr,
+				    &emu->pcm_mixer[substream->number]);
+
 	return 0;
 }
 
@@ -421,8 +442,8 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 
 	channel_size = runtime->buffer_size;
 
-	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra, true, false,
-				   start_addr, start_addr + (channel_size / 2), NULL);
+	snd_emu10k1_pcm_init_extra_voice(emu, epcm->extra, true,
+					 start_addr, start_addr + (channel_size / 2));
 
 	epcm->ccca_start_addr = start_addr;
 	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
@@ -598,12 +619,31 @@ static void snd_emu10k1_playback_unmute_voice(struct snd_emu10k1 *emu,
 	snd_emu10k1_playback_commit_volume(emu, evoice, vattn);
 }	
 
+static void snd_emu10k1_playback_unmute_voices(struct snd_emu10k1 *emu,
+					       struct snd_emu10k1_voice *evoice,
+					       bool stereo,
+					       struct snd_emu10k1_pcm_mixer *mix)
+{
+	snd_emu10k1_playback_unmute_voice(emu, evoice, stereo, true, mix);
+	if (stereo)
+		snd_emu10k1_playback_unmute_voice(emu, evoice + 1, true, false, mix);
+}
+
 static void snd_emu10k1_playback_mute_voice(struct snd_emu10k1 *emu,
 					    struct snd_emu10k1_voice *evoice)
 {
 	snd_emu10k1_playback_commit_volume(emu, evoice, 0);
 }
 
+static void snd_emu10k1_playback_mute_voices(struct snd_emu10k1 *emu,
+					     struct snd_emu10k1_voice *evoice,
+					     bool stereo)
+{
+	snd_emu10k1_playback_mute_voice(emu, evoice);
+	if (stereo)
+		snd_emu10k1_playback_mute_voice(emu, evoice + 1);
+}
+
 static void snd_emu10k1_playback_commit_pitch(struct snd_emu10k1 *emu,
 					      u32 voice, u32 pitch_target)
 {
@@ -680,22 +720,18 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		mix = &emu->pcm_mixer[substream->number];
-		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[0], stereo, true, mix);
-		if (stereo)
-			snd_emu10k1_playback_unmute_voice(emu, epcm->voices[0] + 1, true, false, mix);
+		snd_emu10k1_playback_unmute_voices(emu, epcm->voices[0], stereo, mix);
 		snd_emu10k1_playback_set_running(emu, epcm);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0]);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		snd_emu10k1_playback_stop_voice(emu, epcm->voices[0]);
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
 		snd_emu10k1_playback_set_stopped(emu, epcm);
-		snd_emu10k1_playback_mute_voice(emu, epcm->voices[0]);
-		if (stereo)
-			snd_emu10k1_playback_mute_voice(emu, epcm->voices[0] + 1);
+		snd_emu10k1_playback_mute_voices(emu, epcm->voices[0], stereo);
 		break;
 	default:
 		result = -EINVAL;
-- 
2.40.0.152.g15d061e6df


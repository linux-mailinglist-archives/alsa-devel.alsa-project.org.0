Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 112B1706FBD
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 19:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37F451FA;
	Wed, 17 May 2023 19:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37F451FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684345523;
	bh=aGnHnskLlcWca+SxZEU2Ik44jp9UIWQN1NiTrnde0Cc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Xna+jMwz/OxOfnNsl3+XnBu/EPqYi60GykNu8puIBRU2y9AuvE4EdymvLocbPvroz
	 jPrhgx3k1jE7rsyBmt71+zHtdcmrl6gLXtEiY3Ywe8bMywusVQk1AOSciwqzkl9esy
	 5pgMMRzNL4PTn6ZNxEzrh+h1oHSe76u+iSFpfdBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6423DF805A1; Wed, 17 May 2023 19:43:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E7BBF8058C;
	Wed, 17 May 2023 19:43:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE201F80570; Wed, 17 May 2023 19:43:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3967CF802E8
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 19:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3967CF802E8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9C31C23FEE;
	Wed, 17 May 2023 13:42:56 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzLAu-LN7-00; Wed, 17 May 2023 19:42:56 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/9] ALSA: emu10k1: pass frame instead of byte addresses
Date: Wed, 17 May 2023 19:42:48 +0200
Message-Id: <20230517174256.3657060-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TQ4CPPB2BN54U3OZ6ZXEWOUM5POVWNVG
X-Message-ID-Hash: TQ4CPPB2BN54U3OZ6ZXEWOUM5POVWNVG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQ4CPPB2BN54U3OZ6ZXEWOUM5POVWNVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

... to snd_emu10k1_pcm_init_voice(). This makes the code arguably less
convoluted.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index d669f93d8930..9f151a0a7756 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -270,15 +270,6 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	stereo = runtime->channels == 2;
 	w_16 = snd_pcm_format_width(runtime->format) == 16;
 
-	if (!extra && stereo) {
-		start_addr >>= 1;
-		end_addr >>= 1;
-	}
-	if (w_16) {
-		start_addr >>= 1;
-		end_addr >>= 1;
-	}
-
 	spin_lock_irqsave(&emu->reg_lock, flags);
 
 	/* volume parameters */
@@ -424,19 +415,16 @@ static int snd_emu10k1_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
+	bool w_16 = snd_pcm_format_width(runtime->format) == 16;
+	bool stereo = runtime->channels == 2;
 	unsigned int start_addr, end_addr;
 
-	start_addr = epcm->start_addr;
-	end_addr = snd_pcm_lib_period_bytes(substream);
-	if (runtime->channels == 2) {
-		start_addr >>= 1;
-		end_addr >>= 1;
-	}
-	end_addr += start_addr;
+	start_addr = epcm->start_addr >> w_16;
+	end_addr = start_addr + runtime->period_size;
 	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra,
 				   start_addr, end_addr, NULL);
-	start_addr = epcm->start_addr;
-	end_addr = epcm->start_addr + snd_pcm_lib_buffer_bytes(substream);
+	start_addr >>= stereo;
+	end_addr = start_addr + runtime->buffer_size;
 	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0],
 				   start_addr, end_addr,
 				   &emu->pcm_mixer[substream->number]);
@@ -452,14 +440,13 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
-	unsigned int start_addr, end_addr;
+	unsigned int start_addr;
 	unsigned int channel_size;
 	int i;
 
-	start_addr = epcm->start_addr;
-	end_addr = epcm->start_addr + snd_pcm_lib_buffer_bytes(substream);
+	start_addr = epcm->start_addr >> 1;  // 16-bit voices
 
-	channel_size = ( end_addr - start_addr ) / NUM_EFX_PLAYBACK;
+	channel_size = runtime->buffer_size;
 
 	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra,
 				   start_addr, start_addr + (channel_size / 2), NULL);
-- 
2.40.0.152.g15d061e6df


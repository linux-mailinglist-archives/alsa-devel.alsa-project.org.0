Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90195704972
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 259891D9;
	Tue, 16 May 2023 11:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 259891D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684229887;
	bh=yi/yIqwdZRPuP+5zPWX0ay/BH0h/ib7DDytyhm1i530=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HwrdJHtZ5BZcY/01bQXHsUvmVySbwhPLTMQesgYdX41/KCfCubS93ggfkIflUSQvv
	 dh/cjsiNITLa8EBp4scEhpBgl8Duc011AlqszfKQ0eqNyEDbvt8s6dCh1JJA0RjyfB
	 F1+u6OJ1KNe4qFKKbDbo2Hqfbmm/f9rZ1lT2Dvb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 978AEF8057B; Tue, 16 May 2023 11:36:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CF7F80571;
	Tue, 16 May 2023 11:36:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB2AF80563; Tue, 16 May 2023 11:36:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 01384F80272
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01384F80272
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id CDB5D24240;
	Tue, 16 May 2023 05:36:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q04-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/6] ALSA: emu10k1: remove useless resets of stop-on-loop-end
 bits
Date: Tue, 16 May 2023 11:36:09 +0200
Message-Id: <20230516093612.3536451-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LKTT2WQ2ZG5EIOWGE3PTNQPV3X7ZCSHX
X-Message-ID-Hash: LKTT2WQ2ZG5EIOWGE3PTNQPV3X7ZCSHX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKTT2WQ2ZG5EIOWGE3PTNQPV3X7ZCSHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We initialize them at card init and don't touch them later, so there is
no need to reset them again at voice start.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h    | 2 ++
 sound/pci/emu10k1/emupcm.c | 1 -
 sound/pci/emu10k1/io.c     | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 36687195c8f7..a5e935e16651 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1792,8 +1792,10 @@ void snd_emu10k1_voice_intr_ack(struct snd_emu10k1 *emu, unsigned int voicenum);
 void snd_emu10k1_voice_half_loop_intr_enable(struct snd_emu10k1 *emu, unsigned int voicenum);
 void snd_emu10k1_voice_half_loop_intr_disable(struct snd_emu10k1 *emu, unsigned int voicenum);
 void snd_emu10k1_voice_half_loop_intr_ack(struct snd_emu10k1 *emu, unsigned int voicenum);
+#if 0
 void snd_emu10k1_voice_set_loop_stop(struct snd_emu10k1 *emu, unsigned int voicenum);
 void snd_emu10k1_voice_clear_loop_stop(struct snd_emu10k1 *emu, unsigned int voicenum);
+#endif
 void snd_emu10k1_wait(struct snd_emu10k1 *emu, unsigned int wait);
 static inline unsigned int snd_emu10k1_wc(struct snd_emu10k1 *emu) { return (inl(emu->port + WC) >> 6) & 0xfffff; }
 unsigned short snd_emu10k1_ac97_read(struct snd_ac97 *ac97, unsigned short reg);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index d377669a8a94..2b6f5d2bbb3e 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -603,7 +603,6 @@ static void snd_emu10k1_playback_prepare_voice(struct snd_emu10k1 *emu, struct s
 	vattn = mix != NULL ? (mix->attn[tmp] << 16) : 0;
 	snd_emu10k1_ptr_write(emu, VTFT, voice, vattn | VTFT_FILTERTARGET_MASK);
 	snd_emu10k1_ptr_write(emu, CVCF, voice, vattn | CVCF_CURRENTFILTER_MASK);
-	snd_emu10k1_voice_clear_loop_stop(emu, voice);
 }	
 
 static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *evoice, int master, int extra)
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index f50943913a31..36fd6f7a0a2c 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -434,6 +434,7 @@ void snd_emu10k1_voice_half_loop_intr_ack(struct snd_emu10k1 *emu, unsigned int
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
+#if 0
 void snd_emu10k1_voice_set_loop_stop(struct snd_emu10k1 *emu, unsigned int voicenum)
 {
 	unsigned long flags;
@@ -471,6 +472,7 @@ void snd_emu10k1_voice_clear_loop_stop(struct snd_emu10k1 *emu, unsigned int voi
 	outl(sol, emu->port + DATA);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
+#endif
 
 void snd_emu10k1_wait(struct snd_emu10k1 *emu, unsigned int wait)
 {
-- 
2.40.0.152.g15d061e6df


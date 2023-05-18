Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EC708388
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19804741;
	Thu, 18 May 2023 16:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19804741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684418767;
	bh=VAcIEdnwtJRVl2VViaoPESgggaABnw8d2RmzCM6Uc5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Va64pRyTi6bvP4SJmbHL5RhxkP6xxtU3I369VuWqtEoUXP47AHF7943uRcP/3M238
	 x9ohX1P5Hw2Oeof+uMnvPDpwDCh7DNRTdJQjdcVHnyMQtEd2IMjEzbZSFJLPk1MPea
	 0iVf3eOad4wRY7qhDEC/SB7nQjcqbTcZedV4y3yA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DBBAF805AD; Thu, 18 May 2023 16:04:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B72E2F805A8;
	Thu, 18 May 2023 16:04:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A296F80579; Thu, 18 May 2023 16:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB597F802E8
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB597F802E8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 82AA823F5A;
	Thu, 18 May 2023 10:03:39 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeEF-cL2-00; Thu, 18 May 2023 16:03:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ALSA: emu10k1: enable bit-exact playback, part 3: pitch
Date: Thu, 18 May 2023 16:03:38 +0200
Message-Id: <20230518140339.3722279-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140339.3722279-1-oswald.buddenhagen@gmx.de>
References: <20230518140339.3722279-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XKBLRZUHHUEYLTPO6W3W4TVPHK7FQU6O
X-Message-ID-Hash: XKBLRZUHHUEYLTPO6W3W4TVPHK7FQU6O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKBLRZUHHUEYLTPO6W3W4TVPHK7FQU6O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CPF_CURRENTPITCH starts swerving towards PTRX_PITCHTARGET as soon as
that is set. In practice this means that CPF_FRACADDRESS may acquire a
non-zero value before we manage to force CPF_CURRENTPITCH to the final
value, which would prevent bit-for-bit reproduction.

To avoid that this state persists, we now reset CPF_FRACADDRESS when
setting CPF_CURRENTPITCH, and to (mostly) avoid that it progresses too
far in the first place (possibly even reaching CCCA_CURRADDR), we write
PTRX and CPF in one critical section (though NMIs, etc. still make this
unreliable).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 1ca16f0ddbed..0b23ff8d9c3b 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -601,6 +601,17 @@ static void snd_emu10k1_playback_mute_voice(struct snd_emu10k1 *emu,
 	snd_emu10k1_playback_commit_volume(emu, evoice, 0);
 }
 
+static void snd_emu10k1_playback_commit_pitch(struct snd_emu10k1 *emu,
+					      u32 voice, u32 pitch_target)
+{
+	u32 ptrx = snd_emu10k1_ptr_read(emu, PTRX, voice);
+	u32 cpf = snd_emu10k1_ptr_read(emu, CPF, voice);
+	snd_emu10k1_ptr_write_multiple(emu, voice,
+		PTRX, (ptrx & ~PTRX_PITCHTARGET_MASK) | pitch_target,
+		CPF, (cpf & ~(CPF_CURRENTPITCH_MASK | CPF_FRACADDRESS_MASK)) | pitch_target,
+		REGLIST_END);
+}
+
 static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu,
 					       struct snd_emu10k1_voice *evoice)
 {
@@ -616,18 +627,16 @@ static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu,
 		pitch_target = PITCH_48000; /* Disable interpolators on emu1010 card */
 	else 
 		pitch_target = emu10k1_calc_pitch_target(runtime->rate);
-	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, pitch_target);
-	snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, pitch_target);
+	snd_emu10k1_playback_commit_pitch(emu, voice, pitch_target << 16);
 }
 
 static void snd_emu10k1_playback_stop_voice(struct snd_emu10k1 *emu,
 					    struct snd_emu10k1_voice *evoice)
 {
 	unsigned int voice;
 
 	voice = evoice->number;
-	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, 0);
-	snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, 0);
+	snd_emu10k1_playback_commit_pitch(emu, voice, 0);
 }
 
 static void snd_emu10k1_playback_set_running(struct snd_emu10k1 *emu,
-- 
2.40.0.152.g15d061e6df


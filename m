Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD96F7E0C
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 09:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D842BCE;
	Fri,  5 May 2023 09:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D842BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683272442;
	bh=pX9TVGELB608dTydkuG6zsPxrK/u+voxwTLOkaMHsGE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kVImEtyfUQ+1dovK8dxOfW9zOJgicUvCV2e7a18cj1fVuTeKAaKoq4fg7qPEwJREX
	 xQzMzo57eZdoMM5qR4a75DGvt2fFpOdoWdCzWLJUDEu0c+SWo0S0c53jn0qfwpRpEe
	 bOkii0CJ5RFwtSKS/L45BkRK5g/dTROj/SVrvdvI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31821F80558;
	Fri,  5 May 2023 09:38:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4A19F80563; Fri,  5 May 2023 09:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2181F80558
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 09:38:46 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1C0A911E2;
	Fri,  5 May 2023 09:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1C0A911E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683272326; bh=khBaiEbQjYgBsk+V5IP5Uykr5pvU7TMLWyxD0GCkLmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLRijrgn9G4rbutTMkbM2sgdy9xDByPdfxLPpFtaZtiiPfYpciCxMu7J9FRkwsZbT
	 fAn0mFUSgi7vwY9+3s4SCwOYNOzhRKCn2ZMrCPgAYupJ5PfrNG8pOnEEdb5xKKUc0e
	 nqrtj3SvrK6h2ppEn63zRktXYPc7wH23pf9DbUtA=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri,  5 May 2023 09:38:41 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH 3/5] ALSA: pcm: fix playback silence - correct the incremental
 silencing
Date: Fri,  5 May 2023 09:38:11 +0200
Message-Id: <20230505073813.1219175-4-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505073813.1219175-1-perex@perex.cz>
References: <20230505073813.1219175-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P6QILYAD2CIZRECC22G6HIK67ZY7INSK
X-Message-ID-Hash: P6QILYAD2CIZRECC22G6HIK67ZY7INSK
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 Jeff Chua <jeff.chua.linux@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6QILYAD2CIZRECC22G6HIK67ZY7INSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The incremental silencing was broken with the threshold mode. The silenced
area was smaller than expected in some cases. The updated area starts
at runtime->silence_start + runtime->silence_filled position not
only at runtime->silence_start in this mode.

Unify the runtime->silence_start use for all cases (threshold and top-up).

Suggested-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/pcm_lib.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 8a01aeda2213..cfdb4aa5f6fa 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -78,26 +78,24 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 		if (frames > runtime->silence_size)
 			frames = runtime->silence_size;
 	} else {
-		if (new_hw_ptr == ULONG_MAX) {	/* initialization */
+		if (new_hw_ptr == ULONG_MAX) {
+			/* initialization, fill silence to whole unused buffer */
 			snd_pcm_sframes_t avail = snd_pcm_playback_hw_avail(runtime);
 			if (avail > runtime->buffer_size)
 				avail = runtime->buffer_size;
 			runtime->silence_filled = avail > 0 ? avail : 0;
-			runtime->silence_start = (runtime->status->hw_ptr +
-						  runtime->silence_filled) %
-						 runtime->boundary;
+			runtime->silence_start = runtime->status->hw_ptr;
 		} else {
-			ofs = runtime->status->hw_ptr;
-			frames = new_hw_ptr - ofs;
+			/* top-up mode (appl_ptr is not required) */
+			/* silence the played area immediately */
+			frames = new_hw_ptr - runtime->status->hw_ptr;
 			if ((snd_pcm_sframes_t)frames < 0)
 				frames += runtime->boundary;
-			runtime->silence_filled -= frames;
-			if ((snd_pcm_sframes_t)runtime->silence_filled < 0) {
+			if ((snd_pcm_uframes_t)frames < runtime->silence_filled)
+				runtime->silence_filled -= frames;
+			else
 				runtime->silence_filled = 0;
-				runtime->silence_start = new_hw_ptr;
-			} else {
-				runtime->silence_start = ofs;
-			}
+			runtime->silence_start = new_hw_ptr;
 		}
 		frames = runtime->buffer_size - runtime->silence_filled;
 	}
@@ -105,7 +103,7 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 		return;
 	if (frames == 0)
 		return;
-	ofs = runtime->silence_start % runtime->buffer_size;
+	ofs = (runtime->silence_start + runtime->silence_filled) % runtime->buffer_size;
 	while (frames > 0) {
 		transfer = ofs + frames > runtime->buffer_size ? runtime->buffer_size - ofs : frames;
 		err = fill_silence_frames(substream, ofs, transfer);
-- 
2.39.2


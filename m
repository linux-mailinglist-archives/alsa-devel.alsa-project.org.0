Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A67E6F8643
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 17:54:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4DD2D43;
	Fri,  5 May 2023 17:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4DD2D43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683302094;
	bh=VzJy+Ts5i2HgNZ8Gyv41CKFtZmDxA3gy3iqlsan2xPA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NtR3Y2A4EQyZxK9E+8mcr7pWwhzxBNGR/rApLGl8fB8MgXR2WBvbNA8xfZolZiLpC
	 uH9mIyIFqldVjaBLSD0AGxKltre18NxlGRv0k0n25BURcUH1wjWLimq++dmQICXpkz
	 BwkQHbd12JmFU4LDLjkId91243zM4ZNQdXCbwBSg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77A98F8055A;
	Fri,  5 May 2023 17:53:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F051DF80552; Fri,  5 May 2023 17:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91022F80544
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 17:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91022F80544
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5A99924188;
	Fri,  5 May 2023 11:52:45 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puxjh-hWG-00; Fri, 05 May 2023 17:52:45 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 6/7] ALSA: pcm: simplify top-up mode init in
 snd_pcm_playback_silence()
Date: Fri,  5 May 2023 17:52:43 +0200
Message-Id: <20230505155244.2312199-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230505155244.2312199-1-oswald.buddenhagen@gmx.de>
References: <20230505155244.2312199-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q63UTVLHS4LL7CPFZALBX26A3KAMSAIF
X-Message-ID-Hash: Q63UTVLHS4LL7CPFZALBX26A3KAMSAIF
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q63UTVLHS4LL7CPFZALBX26A3KAMSAIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Inline the remaining call of snd_pcm_playback_hw_avail(). This makes
the top-up branch more congruent with the thresholded one, and allows
simplifying the handling of the corner cases.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/core/pcm_lib.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 670572c9a8cc..17fc80a654be 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -90,15 +90,32 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 		 * This filling mode aims at free-running mode (used for example by dmix),
 		 * which doesn't update the application pointer.
 		 */
-		if (new_hw_ptr == ULONG_MAX) {	/* initialization */
-			snd_pcm_sframes_t avail = snd_pcm_playback_hw_avail(runtime);
-			if (avail > runtime->buffer_size)
-				avail = runtime->buffer_size;
-			runtime->silence_filled = avail > 0 ? avail : 0;
-			runtime->silence_start = runtime->status->hw_ptr;
+		snd_pcm_uframes_t hw_ptr = runtime->status->hw_ptr;
+		if (new_hw_ptr == ULONG_MAX) {
+			/*
+			 * Initialization, fill the whole unused buffer with silence.
+			 *
+			 * Usually, this is entered while stopped, before data is queued,
+			 * so both pointers are expected to be zero.
+			 */
+			snd_pcm_sframes_t avail = runtime->control->appl_ptr - hw_ptr;
+			if (avail < 0)
+				avail += runtime->boundary;
+			/*
+			 * In free-running mode, appl_ptr will be zero even while running,
+			 * so we end up with a huge number. There is no useful way to
+			 * handle this, so we just clear the whole buffer.
+			 */
+			runtime->silence_filled = avail > runtime->buffer_size ? 0 : avail;
+			runtime->silence_start = hw_ptr;
 		} else {
-			update_silence_vars(runtime, runtime->status->hw_ptr, new_hw_ptr);
+			/* Silence the just played area immediately */
+			update_silence_vars(runtime, hw_ptr, new_hw_ptr);
 		}
+		/*
+		 * In this mode, silence_filled actually includes the valid
+		 * sample data from the user.
+		 */
 		frames = runtime->buffer_size - runtime->silence_filled;
 	}
 	if (snd_BUG_ON(frames > runtime->buffer_size))
-- 
2.40.0.152.g15d061e6df


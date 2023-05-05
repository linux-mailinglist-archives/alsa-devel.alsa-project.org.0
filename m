Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8356F8644
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 17:55:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FFE12D6B;
	Fri,  5 May 2023 17:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FFE12D6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683302103;
	bh=c3REkVFlo9Bl3OSMGTPE0qe+gE7XqT0DcsHqllG2GmA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CBY9zkG2XXmcA7wvNbiBo44dIENBJZ+V0pANRTxGiqXMQY9SXGlApKBWFMsiY2yep
	 Z6svBoRgP4OoOkB6RQBqFuaqaaJr7m9ZktHt7ojrrh2jejZ13bDAD2IbddrPH7zg18
	 MI2CJwU+ETTUMrDP4XxRxWsYfRb9hYAmzDIY5pro=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9688AF80571;
	Fri,  5 May 2023 17:53:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88501F80558; Fri,  5 May 2023 17:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7CF5F8052E
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 17:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7CF5F8052E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 452E523E9C;
	Fri,  5 May 2023 11:52:45 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puxjh-hVy-00; Fri, 05 May 2023 17:52:45 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/7] ALSA: pcm: fix playback silence - correct incremental
 silencing
Date: Fri,  5 May 2023 17:52:40 +0200
Message-Id: <20230505155244.2312199-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230505155244.2312199-1-oswald.buddenhagen@gmx.de>
References: <20230505155244.2312199-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SEZYZOS52U3HWM6JO2RBHKYGCSUPARZV
X-Message-ID-Hash: SEZYZOS52U3HWM6JO2RBHKYGCSUPARZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEZYZOS52U3HWM6JO2RBHKYGCSUPARZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jaroslav Kysela <perex@perex.cz>

Commit 9a826ddba6e ("[ALSA] pcm core: fix silence_start calculations")
came with exactly the right commit message, but the patch just made
things broken in a different way: We'd fill at a too low address if the
area was already partially zeroed, so we'd under-fill. This affected
both thresholded mode (where it was somewhat less likely) and top-up
mode (where it would be the case consistently).

Co-developed-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
v2:
- rewrote commit message
- postponed the addition of comments to a subsequent patch where it
  makes more sense
- dropped the part which the subsequent refactoring obsoletes.
  this reduces the patch to its essentials, making it easier to
  understand, and reducing churn.
---
 sound/core/pcm_lib.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6ad67e7e740c..5ddb74a12030 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -87,29 +87,25 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 			if (avail > runtime->buffer_size)
 				avail = runtime->buffer_size;
 			runtime->silence_filled = avail > 0 ? avail : 0;
-			runtime->silence_start = (runtime->status->hw_ptr +
-						  runtime->silence_filled) %
-						 runtime->boundary;
+			runtime->silence_start = runtime->status->hw_ptr;
 		} else {
 			ofs = runtime->status->hw_ptr;
 			frames = new_hw_ptr - ofs;
 			if ((snd_pcm_sframes_t)frames < 0)
 				frames += runtime->boundary;
 			runtime->silence_filled -= frames;
 			if ((snd_pcm_sframes_t)runtime->silence_filled < 0) {
 				runtime->silence_filled = 0;
-				runtime->silence_start = new_hw_ptr;
-			} else {
-				runtime->silence_start = ofs;
 			}
+			runtime->silence_start = new_hw_ptr;
 		}
 		frames = runtime->buffer_size - runtime->silence_filled;
 	}
 	if (snd_BUG_ON(frames > runtime->buffer_size))
 		return;
 	if (frames == 0)
 		return;
-	ofs = runtime->silence_start % runtime->buffer_size;
+	ofs = (runtime->silence_start + runtime->silence_filled) % runtime->buffer_size;
 	while (frames > 0) {
 		transfer = ofs + frames > runtime->buffer_size ? runtime->buffer_size - ofs : frames;
 		err = fill_silence_frames(substream, ofs, transfer);
-- 
2.40.0.152.g15d061e6df


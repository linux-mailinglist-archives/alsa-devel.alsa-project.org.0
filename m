Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 819746F80CA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 12:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE91C2C45;
	Fri,  5 May 2023 12:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE91C2C45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683282766;
	bh=ebMg/M1kUY7P03FcEv15IGr4l9Ht5P90OjJmJWdV05E=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZTZ5Kkc53iD9pUrU1i1XSfzXe/3Svoa86qsLMEm1evHTKqEPh74G1x0OQBwO8VZCu
	 YzzPI3gos6fd592O/fJcoIqdaUXPNI5s+gDOWa0bMZ8IAhUYHR0Xh+kDqm+YcPxtke
	 dBdZh6nONh9gpZTyW3/ubeh29OVMRLYpLDVQvWRg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D9DF80534;
	Fri,  5 May 2023 12:31:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44989F80544; Fri,  5 May 2023 12:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52AFBF80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 12:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52AFBF80520
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 491B2240D5;
	Fri,  5 May 2023 06:31:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pusiz-abD-00; Fri, 05 May 2023 12:31:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ALSA: pcm: fix playback silence - use the actual
 new_hw_ptr for the threshold mode
Date: Fri,  5 May 2023 12:31:35 +0200
Message-Id: <20230505103140.2285622-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230505103140.2285622-1-oswald.buddenhagen@gmx.de>
References: <20230505103140.2285622-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZXDS7IXIUTHF6MSQHZLWPALVO7A7TL6C
X-Message-ID-Hash: ZXDS7IXIUTHF6MSQHZLWPALVO7A7TL6C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXDS7IXIUTHF6MSQHZLWPALVO7A7TL6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jaroslav Kysela <perex@perex.cz>

The snd_pcm_playback_hw_avail() function uses runtime->status->hw_ptr.
Unfortunately, in case when we call this function from snd_pcm_update_hw_ptr0(),
this variable contains the previous hardware pointer. Use the new_hw_ptr
argument to calculate hw_avail (filled samples by the user space) to
correct the threshold comparison.

The new_hw_ptr argument may also be set to ULONG_MAX which means the
initialization phase. In this case, use runtime->status->hw_ptr.

Suggested-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/core/pcm_lib.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 3357ffae635f..6ad67e7e740c 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -63,7 +63,15 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 		}
 		if (runtime->silence_filled >= runtime->buffer_size)
 			return;
-		noise_dist = snd_pcm_playback_hw_avail(runtime) + runtime->silence_filled;
+		/* initialization outside pointer updates */
+		if (new_hw_ptr == ULONG_MAX)
+			new_hw_ptr = runtime->status->hw_ptr;
+		/* get hw_avail with the boundary crossing */
+		noise_dist = appl_ptr - new_hw_ptr;
+		if (noise_dist < 0)
+			noise_dist += runtime->boundary;
+		/* total noise distance */
+		noise_dist += runtime->silence_filled;
 		if (noise_dist >= (snd_pcm_sframes_t) runtime->silence_threshold)
 			return;
 		frames = runtime->silence_threshold - noise_dist;
-- 
2.40.0.152.g15d061e6df


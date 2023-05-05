Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EC26F80D5
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 12:34:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7142C44;
	Fri,  5 May 2023 12:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7142C44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683282867;
	bh=XFgXBplisOmEslXwP5lxuknJuTs8258HGFfBJxFSMGA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DJQ5FZvRyFu7m3DfupmK030GdqtyP26bJhypsUk0PzRBAe6wYVuySbV3J6gVPxKJY
	 yyEjP2pOHjkHH8WGg1fAecAaZZFRoF/SrXvUOSWWPP0lzJrqdzmQsIupeJUtf6GXXd
	 xpr203h0/COBJI7MsBJrQzZ/RgEdo9R/0p66eZ+c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13668F8055A;
	Fri,  5 May 2023 12:32:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A583F80551; Fri,  5 May 2023 12:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80E67F8052E
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 12:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E67F8052E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 50B9024188;
	Fri,  5 May 2023 06:31:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pusiz-abV-00; Fri, 05 May 2023 12:31:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ALSA: pcm: playback silence - move silence variable
 updates to separate function
Date: Fri,  5 May 2023 12:31:38 +0200
Message-Id: <20230505103140.2285622-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230505103140.2285622-1-oswald.buddenhagen@gmx.de>
References: <20230505103140.2285622-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CHDK62NWCRFEWYY6ERCZDKV7BVQ6NUHX
X-Message-ID-Hash: CHDK62NWCRFEWYY6ERCZDKV7BVQ6NUHX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHDK62NWCRFEWYY6ERCZDKV7BVQ6NUHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jaroslav Kysela <perex@perex.cz>

The code tracking the added samples in thresholded mode and the code
tracking the just played samples in top-up mode are semantically
identical, so factor it out to a common function to enhance readability.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- nicer function name and variable name
- improved language of commit message
---
 sound/core/pcm_lib.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index a1838130c830..670572c9a8cc 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -33,6 +33,25 @@
 static int fill_silence_frames(struct snd_pcm_substream *substream,
 			       snd_pcm_uframes_t off, snd_pcm_uframes_t frames);
 
+
+static inline void update_silence_vars(struct snd_pcm_runtime *runtime,
+				       snd_pcm_uframes_t ptr,
+				       snd_pcm_uframes_t new_ptr)
+{
+	snd_pcm_sframes_t delta;
+
+	delta = new_ptr - ptr;
+	if (delta == 0)
+		return;
+	if (delta < 0)
+		delta += runtime->boundary;
+	if ((snd_pcm_uframes_t)delta < runtime->silence_filled)
+		runtime->silence_filled -= delta;
+	else
+		runtime->silence_filled = 0;
+	runtime->silence_start = new_ptr;
+}
+
 /*
  * fill ring buffer with silence
  * runtime->silence_start: starting pointer to silence area
@@ -49,18 +68,9 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 	int err;
 
 	if (runtime->silence_size < runtime->boundary) {
-		snd_pcm_sframes_t noise_dist, n;
+		snd_pcm_sframes_t noise_dist;
 		snd_pcm_uframes_t appl_ptr = READ_ONCE(runtime->control->appl_ptr);
-		if (runtime->silence_start != appl_ptr) {
-			n = appl_ptr - runtime->silence_start;
-			if (n < 0)
-				n += runtime->boundary;
-			if ((snd_pcm_uframes_t)n < runtime->silence_filled)
-				runtime->silence_filled -= n;
-			else
-				runtime->silence_filled = 0;
-			runtime->silence_start = appl_ptr;
-		}
+		update_silence_vars(runtime, runtime->silence_start, appl_ptr);
 		/* initialization outside pointer updates */
 		if (new_hw_ptr == ULONG_MAX)
 			new_hw_ptr = runtime->status->hw_ptr;
@@ -87,15 +97,7 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 			runtime->silence_filled = avail > 0 ? avail : 0;
 			runtime->silence_start = runtime->status->hw_ptr;
 		} else {
-			ofs = runtime->status->hw_ptr;
-			frames = new_hw_ptr - ofs;
-			if ((snd_pcm_sframes_t)frames < 0)
-				frames += runtime->boundary;
-			runtime->silence_filled -= frames;
-			if ((snd_pcm_sframes_t)runtime->silence_filled < 0) {
-				runtime->silence_filled = 0;
-			}
-			runtime->silence_start = new_hw_ptr;
+			update_silence_vars(runtime, runtime->status->hw_ptr, new_hw_ptr);
 		}
 		frames = runtime->buffer_size - runtime->silence_filled;
 	}
-- 
2.40.0.152.g15d061e6df


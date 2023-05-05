Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FEE6F7E0E
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 09:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98DBA2BD1;
	Fri,  5 May 2023 09:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98DBA2BD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683272471;
	bh=/t3AQOl3bcfttdZtUZYZuHBFAPWJaA7KrBDtJB1p4gI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JXbMCNCtudxfYQdn8e+GNoOycPvZVbetyJ7mqt2YMH5Tfzo5vpOQGiRd7/qP17YaQ
	 ti9h3K3TXKm3//XfYV0EjvRSRNZcp/IBaWJv7ei5vJXiGjUvnBEdV7TYkYBuQEfK/v
	 K/hkD8YvTl8ZrYS0ka70BT5eFUDBj9WIlH27gL5A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 189EDF80578;
	Fri,  5 May 2023 09:39:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96B5EF80579; Fri,  5 May 2023 09:38:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B5DB9F80570
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 09:38:57 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0C23111E2;
	Fri,  5 May 2023 09:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0C23111E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683272337; bh=JHSZHacJQAS5oo8RIrsJbAK+cQk3HLXFzjg6ru/0zmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RrCl1BX84EYFY/3szQAX9pSp9BaAiOUvs5Fn9aoqHgibUb9lqz6B2HqwLEGr1Jbe0
	 aXzk6ThNynNUtvbr8x0jCAQZE2Av/yBA4R6+dPtKjsS/gjHac3bQ12cVQLJ/zNx6vm
	 MWw/jQCK4l9jCl41RAUCbmJAplCAJGfQ3aYhNwm0=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri,  5 May 2023 09:38:52 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH 5/5] ALSA: pcm: playback silence - move silence variables
 updates to separate function
Date: Fri,  5 May 2023 09:38:13 +0200
Message-Id: <20230505073813.1219175-6-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505073813.1219175-1-perex@perex.cz>
References: <20230505073813.1219175-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7735EI25FZJFMXUHVLBFN7KJYPDT74SP
X-Message-ID-Hash: 7735EI25FZJFMXUHVLBFN7KJYPDT74SP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7735EI25FZJFMXUHVLBFN7KJYPDT74SP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a common code in the threshold and top-up mode tracking
the added (already silenced) samples. Move this code to one place
to enhance the readability.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/pcm_lib.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 952f0d807124..6b0601fec832 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -33,6 +33,25 @@
 static int fill_silence_frames(struct snd_pcm_substream *substream,
 			       snd_pcm_uframes_t off, snd_pcm_uframes_t frames);
 
+
+static inline void silence_update(struct snd_pcm_runtime *runtime,
+				  snd_pcm_uframes_t ptr,
+				  snd_pcm_uframes_t new_ptr)
+{
+	snd_pcm_sframes_t n;
+
+	if (ptr == new_ptr)
+		return;
+	n = new_ptr - ptr;
+	if (n < 0)
+		n += runtime->boundary;
+	if ((snd_pcm_uframes_t)n < runtime->silence_filled)
+		runtime->silence_filled -= n;
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
+		silence_update(runtime, runtime->silence_start, appl_ptr);
 		/* initialization outside pointer updates */
 		if (new_hw_ptr == ULONG_MAX)
 			new_hw_ptr = runtime->status->hw_ptr;
@@ -86,14 +96,7 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 		} else {
 			/* top-up mode (appl_ptr is not required) */
 			/* silence the played area immediately */
-			frames = new_hw_ptr - runtime->status->hw_ptr;
-			if ((snd_pcm_sframes_t)frames < 0)
-				frames += runtime->boundary;
-			if ((snd_pcm_uframes_t)frames < runtime->silence_filled)
-				runtime->silence_filled -= frames;
-			else
-				runtime->silence_filled = 0;
-			runtime->silence_start = new_hw_ptr;
+			silence_update(runtime, runtime->status->hw_ptr, new_hw_ptr);
 		}
 		frames = runtime->buffer_size - runtime->silence_filled;
 	}
-- 
2.39.2


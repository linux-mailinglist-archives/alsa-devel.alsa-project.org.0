Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB77E699679
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:59:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4FC7E9E;
	Thu, 16 Feb 2023 14:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4FC7E9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676555961;
	bh=44H9/Duy6AWAhUV1DCUB5QmPBxaaOwrv0NaQQAJEQd8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uSqffdtprquey5meb8t2Mp+s8cFqi4jH9Kylp+eVYiz9BkYlWgMvyquE1fe3jPnkf
	 Op+jL4PJcWszsrabJaSdZEYNsP3n0Gp18uiO+JNoFQf8ZlBfaJ78YtcuHGoTGZg9WT
	 YOvRYQ1tmF0eECpUkuvbU/wXB3Uj+yo1A9EgBumk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F033CF800E4;
	Thu, 16 Feb 2023 14:58:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C8E1F80171; Thu, 16 Feb 2023 14:58:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4316AF80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 14:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4316AF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dFBid76Q
Received: by mail-wr1-x434.google.com with SMTP id m14so1895524wrg.13
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 05:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrh5pA5EZwJvRJHIXwlRKWCv9rTSdcO4kjwh/+0PhoI=;
        b=dFBid76QJ3Riay/IcehoB3Pwl4Yrb/cZPs8n6Ks+il6qEogRIocW+lXLWkUCJe7YHZ
         RT1ztTI1J//5K17e8gpX9NeHGlLa9HXCbPvzhcJVmkw0E4RtAhmZe8mv4nLObD+AmC3P
         n2clN5rreMu4Kq8b/9b6Q5n0KF5MM70IPGu4dZ9UVhDUYk0xH4A2QiclJi8hFhEZ7yFA
         FbvHfN4vmF9+wta7rP1rdvrUAqxOa8rSsexqJhV23DqrKRcZa8mtkzwzFolgrW2Qd/B8
         dauePjdE4SqW3kDk8hKrGwVd6TVRVi3/uh+g6osxMG2KYYtURT4XE+SHyzcpAqaGU3lx
         tuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zrh5pA5EZwJvRJHIXwlRKWCv9rTSdcO4kjwh/+0PhoI=;
        b=CJpmR9OpzGc7jfs4UkHGnQ2HZquC1zRUQYpGfwYoV7ee0cOiJyEc5jNRC6BBk+8DzH
         R8dTIf4U4Iapdyy5baSX8xK6vwHDij76MdKyuI9Lx24NzVemM4Nr7aZsyvKLDdz3b2lV
         j4lZLXVhPp8NJp44ZGA+K9qslYJbrQ/YB/TIk1gZN39QuAr4Mht6+hyDGYEBn8pqGQ2O
         qe1Fh5PpxpWkdoY8aUn17DY7RnnCFWnsE94Qmia0+gUygjK47qi6nux8ETD/GhkwYS0L
         tCzlg8xEYvdDP7xrCL+xn4JSQJWZB93tnYnRSu7wFNTvAAVLFK41tc+6AbZJxGR6Y9+R
         s9rA==
X-Gm-Message-State: AO0yUKVN1ioEs8dEy5NLwQL6lNuyRd6M3Z3wCPVM5hErrfMOuXFuusuY
	Ow5CkQI7dN/u8wxuEsyh8DZYyXDYORs=
X-Google-Smtp-Source: 
 AK7set9KxxH3avslLG43xYYX0iZm6rfbuR3a8etKh/7C1nveKoIhhtF0LtnE6Ib0KF0WB+XKDnp11A==
X-Received: by 2002:adf:e851:0:b0:2c3:ea92:3494 with SMTP id
 d17-20020adfe851000000b002c3ea923494mr4630161wrn.55.1676555904111;
        Thu, 16 Feb 2023 05:58:24 -0800 (PST)
Received: from localhost.localdomain (awyoung.plus.com. [81.174.138.22])
        by smtp.gmail.com with ESMTPSA id
 d8-20020adfe2c8000000b002c3ea5ebc73sm1569060wrj.101.2023.02.16.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:58:22 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: Change calculation of audio time from frames
Date: Thu, 16 Feb 2023 13:58:06 +0000
Message-Id: <20230216135806.1973959-1-consult.awy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HNW6KVT66KOJLFDOJZREOCWNAF3MQNXT
X-Message-ID-Hash: HNW6KVT66KOJLFDOJZREOCWNAF3MQNXT
X-MailFrom: consult.awy@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com, Alan Young <consult.awy@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNW6KVT66KOJLFDOJZREOCWNAF3MQNXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce snd_pcm_lib_frames_to_timespec64() to replace the calculation

	audio_nsecs = div_u64(audio_frames * 1000000000LL,
				runtime->rate);

which overflows after a playback duration of 4.8 days @ 44100 HZ or 0.56
days @ 384000 Hz.

The implementation of snd_pcm_lib_frames_to_timespec64() extends these
limits, to 1.5 million years (@ 384000 Hz), or the 68 year limit of
struct timespec on 32-bit systems.

Fixes: 3179f6200188 ("ALSA: core: add .get_time_info")
Fixes: 4eeaaeaea1ce ("ALSA: core: add hooks for audio timestamps")
Signed-off-by: consult.awy@gmail.com
---
 sound/core/pcm_lib.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 943f5396fc60..e0a6556d33ee 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -205,12 +205,19 @@ int snd_pcm_update_state(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static inline void snd_pcm_lib_frames_to_timespec64(u64 frames, unsigned int rate, struct timespec64 *audio_tstamp)
+{
+	u32 remainder;
+	audio_tstamp->tv_sec = div_u64_rem(frames, rate, &remainder);
+	audio_tstamp->tv_nsec = div_u64(mul_u32_u32(remainder, NSEC_PER_SEC), rate);
+}
+
 static void update_audio_tstamp(struct snd_pcm_substream *substream,
 				struct timespec64 *curr_tstamp,
 				struct timespec64 *audio_tstamp)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	u64 audio_frames, audio_nsecs;
+	u64 audio_frames;
 	struct timespec64 driver_tstamp;
 
 	if (runtime->tstamp_mode != SNDRV_PCM_TSTAMP_ENABLE)
@@ -233,9 +240,7 @@ static void update_audio_tstamp(struct snd_pcm_substream *substream,
 			else
 				audio_frames +=  runtime->delay;
 		}
-		audio_nsecs = div_u64(audio_frames * 1000000000LL,
-				runtime->rate);
-		*audio_tstamp = ns_to_timespec64(audio_nsecs);
+		snd_pcm_lib_frames_to_timespec64(audio_frames, runtime->rate, audio_tstamp);
 	}
 
 	if (runtime->status->audio_tstamp.tv_sec != audio_tstamp->tv_sec ||
-- 
2.31.1


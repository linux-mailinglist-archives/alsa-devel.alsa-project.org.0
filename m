Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE3918108A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 07:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 510E21655;
	Wed, 11 Mar 2020 07:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 510E21655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583907534;
	bh=CsIaX+FhaKSpnTAEtLkhQ0eMd/xIIIvNfxLWVe/kIR8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g1l50SEEoVUpwUl2ilELz7C5n7R8iLtaH43gGX2d78+WJFYNTQsG/y9qr6Tz9QekO
	 uu7OsvPjp8OVO7W+7WFzxr1tU5GqhN6ZvmwAJ3DXQtFxv9xZNcCJrmZNtZ42yoL6jg
	 zd5YYn6/zxBajZxQWtoDs01HLiVcm82auTJZ/xM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60DF7F802C3;
	Wed, 11 Mar 2020 07:15:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EB9FF801EB; Mon,  9 Mar 2020 21:30:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F16DAF800B5
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 21:29:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F16DAF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fYoBc25Q"
Received: by mail-lf1-x12e.google.com with SMTP id i10so8846527lfg.11
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 13:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=lZ7VYc+U9qdi5/6IVxdI7DvQjjGg+MMMS5WBgLqCxik=;
 b=fYoBc25QEDagbIFEIWETGBrp8j0+tMZNeudI43NXHZ9WZws7eBe1JXXKL1NmuD0+CW
 /W9W4qhWrj0BMV5gKqPuMStJwbN9RIsIxskpXJrbpnWNvHX8MP2kPrr7LZP4kK0zYSNB
 JX4iYXyuqLstE6e0gWLKCLmbBLIOjvHY1l4aTJpvXj97kmQtNExKuP9X+/CO/B4yBR64
 MGX9UJCbo9kBL5w9N7S6l578sYk04Lg8QjFu+EpdFI+yeP5olkG2cmUtUvK49L0pcTbu
 VK46ZetzO2nLJHhKYEIo4+7q14AKg9SDwQqablZrfEoO3MY+5yTwiiugvjwEBdVqrNGc
 XiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=lZ7VYc+U9qdi5/6IVxdI7DvQjjGg+MMMS5WBgLqCxik=;
 b=TS4OQN1j8ZdaJE3zf/ZNLDUIR2jHaJP77QmWfoC7XT0GCdecHKnpsgOuV6z7NFKO1D
 HuOdd2IqLpACVNCCkE38hneLbhnxT2WLz1GY3LhJC54KTzqYOzHl6BdqgfuC25yk3OPE
 lowz07Uu0BdU7dwH/Dc9kspFDmSZzoAQ0tW8RvNePq4OE+/r1iCSeIFyQZu+zbdnvFSF
 ZLhKcHtFX0mQQTOxEYxAh84agVvY3u6andn1JjyRAmbYxW3Zh6YejXe3oboC14UqzUJR
 DI+SfQA8aHyLgxM3K/mT+YQWlrCSW8sxFKsb1fbFuge8L5ElSG0uujDdhVXiZqOp9McU
 0tRA==
X-Gm-Message-State: ANhLgQ2cp/Cxh9Zm3kYwWQuh5mPEkWNvHDvzbvqKHPJwZHMt8R/COaWt
 SisVTqPhD1KcmKlv3od2FrI=
X-Google-Smtp-Source: ADFU+vvJwzJaxbQdKbaOArYQIAETc76gNC7ue3iCj3bF8bvRUhDyhG6OnHU1xd1wBzOOop8Q0TstGA==
X-Received: by 2002:a19:48d5:: with SMTP id
 v204mr10528996lfa.153.1583785797541; 
 Mon, 09 Mar 2020 13:29:57 -0700 (PDT)
Received: from localhost ([185.35.9.167])
 by smtp.gmail.com with ESMTPSA id f26sm5571362lfl.43.2020.03.09.13.29.55
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 13:29:56 -0700 (PDT)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: perex@perex.cz,
	alsa-devel@alsa-project.org
Subject: [PATCH] alsaloop: reduce cumulative error caused by non-atomic
 samples calculation
Date: Mon,  9 Mar 2020 22:29:54 +0200
Message-Id: <1583785794-5173-1-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 11 Mar 2020 07:14:41 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When doing loopback between two audio card with
same sampling frequency, I noticed slow increase
of pitch_diff.

When I changed order of get_queued_playback_samples()
vs get_queued_capture_samples(), I noticed same drift
of pitch_diff but if was decreasing this time.

This seems to be caused by non-atomic consecutive
snd_pcm_delay() invocation for playback then for
capture. snd_pcm_delay() measures delay between
read/write call and actual ADC/DAC operation.

So while we get this value for playback path in
get_queued_playback_samples(), next call to
get_queued_capture_samples() will happen a little
bit later so snd_pcm_delay() may return incorrect
value.

Be interleaving get_queued_{playback,capture}_samples()
order, we divide this small error between playback
and capture paths. I do not see any issues anymore
with one-way drift of pitch_diff.

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 alsaloop/pcmjob.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index b252486..1b7925a 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -1951,8 +1951,16 @@ int pcmjob_pollfds_handle(struct loopback *loop, struct pollfd *fds)
 	}
 	if (loop->sync != SYNC_TYPE_NONE) {
 		snd_pcm_sframes_t pqueued, cqueued;
-		pqueued = get_queued_playback_samples(loop);
-		cqueued = get_queued_capture_samples(loop);
+
+		/* Reduce cumulative error by interleaving playback vs capture reading order */
+		if (loop->total_queued_count & 1) {
+			pqueued = get_queued_playback_samples(loop);
+			cqueued = get_queued_capture_samples(loop);
+		} else {
+			cqueued = get_queued_capture_samples(loop);
+			pqueued = get_queued_playback_samples(loop);
+		}
+
 		if (verbose > 4)
 			snd_output_printf(loop->output, "%s: queued %li/%li samples\n", loop->id, pqueued, cqueued);
 		if (pqueued > 0)
-- 
1.9.1


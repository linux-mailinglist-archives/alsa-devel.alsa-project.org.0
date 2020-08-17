Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192A24633E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8B3816B3;
	Mon, 17 Aug 2020 11:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8B3816B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656300;
	bh=Ww8ayp56ep+Fdjk2Lu2oWsor5MLAgIof9wImoY6aTok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OV7L6H0Rv97bkwGiV4iL0Zx1QQ5MTyT54+vGky68ZiaWHq0rHW8ImaNQVNtAZOdLb
	 KfK7w0wj0zYoeyo9KfdYvflQ3xw+STRFvoBf3UjLMQTkB7/MTGfj3DQJJ1FqXEl0+/
	 YKUPhIBGxuvfkVMYPaNgoBjGQdgal7OyHt305nQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14759F80317;
	Mon, 17 Aug 2020 11:17:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE85AF80255; Mon, 17 Aug 2020 10:58:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67461F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67461F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ihyd3IRT"
Received: by mail-pl1-x644.google.com with SMTP id y10so5610835plr.11
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=82iyXT6DzTJGk80q+wM5oW6Nfvht/wMpYLWFiVAtXjo=;
 b=ihyd3IRTDQ2sNWvyGa48ej4ZTH5YFMTLLhjYx2kl5gFT+X/RNcDRvczG7Fv0Yt5XHd
 UhXaxJXJB3ZwAtjFDicTsBpasCmOZ4lxSVTDx42l2+qz4bLXhj8i3joztKz0oOR7nMox
 ZKMKH5IooVM1s0wcKgvBIiLNW+5PCSTlFwDhhO1fU2kc/1q9iYoK5H7FXvoRYquf1U+Q
 4csT4c+hEqMna877Fuo9FwQk6fO63aqWNuqPBXv4TFMQKMcz9MGV193UZpnv6g74OuMd
 5Nl1Pp/E0yAr9yIJzUVzt01sDnj3BXgxXNZ+wrNOqUqNixAAvQdzJBCNNwvDcg9e4s24
 qB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=82iyXT6DzTJGk80q+wM5oW6Nfvht/wMpYLWFiVAtXjo=;
 b=UeGNZpiGoDJBYNibS67NJvZGzZMpSPU8BixmTm8MtbwL0huXQeC/5rKMamiPyGaNCW
 f2usO7I7gAYgjUTkykCm9OxW4hGBSMH3BfhRv670ro2kM5Ray6Z1l4eZ5TMbjROTX43N
 BP+4CxMLwy9zWycj+ZjVwCiR6urMmT3e1GbVSky0Rv9tt4SJSRL2Q3n9LLkQ0j2XgWw7
 mN/EQ5phuNU/4zT/i3sT7WpnXRSt/LZTob1WAAYoUfCLFB8lFaOvlA3SPAVx3zf5oIw4
 AckKLDBrfOAPSpDJ4PSWRAAgtcCDZww/LBJNuMruczX3F3ibncX2IOdn4YJSujITuPmx
 7phg==
X-Gm-Message-State: AOAM533Ia7bRo+2yramRlkFAt+josrrv2/9TAOqN4pQ53I+eXeSPB176
 L0E2Pw0WK3a1prXilZO/w5w=
X-Google-Smtp-Source: ABdhPJwmOQdDa+LVIgCsVYsGqUOJh7huV7BDongW+Nmhyb70or57kdsFY11/0oKkwXHZEeyX/z3a4g==
X-Received: by 2002:a17:90a:c28d:: with SMTP id
 f13mr8357466pjt.124.1597654692036; 
 Mon, 17 Aug 2020 01:58:12 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:58:11 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 10/10] sound: ua101: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:27:03 +0530
Message-Id: <20200817085703.25732-11-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085703.25732-1-allen.cryptic@gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 11:17:21 +0200
Cc: alsa-devel@alsa-project.org, keescook@chromium.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 sound/usb/misc/ua101.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 884e740a785c..3b2dce1043f5 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -247,9 +247,9 @@ static inline void add_with_wraparound(struct ua101 *ua,
 		*value -= ua->playback.queue_length;
 }
 
-static void playback_tasklet(unsigned long data)
+static void playback_tasklet(struct tasklet_struct *t)
 {
-	struct ua101 *ua = (void *)data;
+	struct ua101 *ua = from_tasklet(ua, t, playback_tasklet);
 	unsigned long flags;
 	unsigned int frames;
 	struct ua101_urb *urb;
@@ -1218,8 +1218,7 @@ static int ua101_probe(struct usb_interface *interface,
 	spin_lock_init(&ua->lock);
 	mutex_init(&ua->mutex);
 	INIT_LIST_HEAD(&ua->ready_playback_urbs);
-	tasklet_init(&ua->playback_tasklet,
-		     playback_tasklet, (unsigned long)ua);
+	tasklet_setup(&ua->playback_tasklet, playback_tasklet);
 	init_waitqueue_head(&ua->alsa_capture_wait);
 	init_waitqueue_head(&ua->rate_feedback_wait);
 	init_waitqueue_head(&ua->alsa_playback_wait);
-- 
2.17.1


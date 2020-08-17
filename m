Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E70624633B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C70B21695;
	Mon, 17 Aug 2020 11:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C70B21695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656276;
	bh=/FaDgzSY/CPcabZMm/pyFSPS1b4zioKREWum67Uxt+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jou60i1h0X8pVSwsMzt8cblo/JVN2ZxDT9pyirHG2FbJzJ/0/TYV4IR7OVLE7W71r
	 it1r5U1oUbSVbhP1OeFz8YJZHlWZZ36St6sIHuLaI9zGt58XmAX6eYXuFrPFNUrlrH
	 +vaoHHCKTrIj6qoHhVuW+/brALj0Opsivmzlmoh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DEAEF80316;
	Mon, 17 Aug 2020 11:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C96DF80255; Mon, 17 Aug 2020 10:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9528EF80218
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9528EF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M37L93SC"
Received: by mail-pj1-x1044.google.com with SMTP id e4so7503029pjd.0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KccEtbXa6IlqeauaaaE7AIR0JNzfFLmA4P8zWKeg1Pc=;
 b=M37L93SCLVOuNTd2R9Itm92ayKxRQN2wHX1NMFvm06ygZB2w44PlvNXwkJzimpR6iB
 2lXAZrOUVBZYUTzHKKHB25qNW2hykUMYhRfnT7q8KV7f7t8YxEzhRmbvf4l81mXIx4dw
 EPs6ufn++tfqVIgFjil8lKLw0yMOuqogI6PkT+GeHwVipcgtTdeVKXuM1PzVWiWcrfyL
 6zWKzlQDXSZDv347qZKC4pSOvNznLe5RkWVehvvaP0bFYCd2H02PiYftk+J6+iY3wrEa
 vfgyjW7cXLAdOZUKrSj2k0LyCFiN4QXhoyxES3u+AwweLjEaKnkftQ99c8vxeyjYjdEK
 609w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KccEtbXa6IlqeauaaaE7AIR0JNzfFLmA4P8zWKeg1Pc=;
 b=SJ+nzvG/Gq25KhKIUT9fLZGCyBXm/hziy8IHfy2i3voR1KMKrgducpCobQmr6T25F9
 C/BlE0b2Cga7xqc9m5gyua9+K11oI91annoooVC+F5RdtQMYu6dj7NjKU3Itr0aR5qld
 kDFVmC44f+5Y9okXTjfwvz2+ANoCZcWaCwWM8Z/QbcS9UFqThoKmKr9YaIA3fg19LQ4c
 wDWZ27JZ0ue3FTB11e0LlVgRwD/6ZWOryQVT2EBXI0k5vP7Jn/O0ThVQSkBDEipSb3WK
 IUfU6QT5ey5wE20J4QFGxNH3CdkiqstcZ8i49yMuhUwAxQ8RbE3a2t3LrRAgnXcqJMx2
 F44Q==
X-Gm-Message-State: AOAM533qJ0dbmi0Xbnl4OdPSCDOqO0/HvBA9AWozSUTHaSj13Ed60v+u
 cGVNIRMkAYnEh2c736W7tq8=
X-Google-Smtp-Source: ABdhPJzg9Sul/hHo2S3e13LeNtREGnuHKJS0d3HSemC0SzTDZO8mUsRC3gx5jqtsol6tC19JN8YCqA==
X-Received: by 2002:a17:90b:1949:: with SMTP id
 nk9mr11123870pjb.185.1597654687567; 
 Mon, 17 Aug 2020 01:58:07 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:58:07 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 09/10] sound: midi: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:27:02 +0530
Message-Id: <20200817085703.25732-10-allen.cryptic@gmail.com>
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
 sound/usb/midi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index df639fe03118..e8287a05e36b 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -344,10 +344,9 @@ static void snd_usbmidi_do_output(struct snd_usb_midi_out_endpoint *ep)
 	spin_unlock_irqrestore(&ep->buffer_lock, flags);
 }
 
-static void snd_usbmidi_out_tasklet(unsigned long data)
+static void snd_usbmidi_out_tasklet(struct tasklet_struct *t)
 {
-	struct snd_usb_midi_out_endpoint *ep =
-		(struct snd_usb_midi_out_endpoint *) data;
+	struct snd_usb_midi_out_endpoint *ep = from_tasklet(ep, t, tasklet);
 
 	snd_usbmidi_do_output(ep);
 }
@@ -1441,7 +1440,7 @@ static int snd_usbmidi_out_endpoint_create(struct snd_usb_midi *umidi,
 	}
 
 	spin_lock_init(&ep->buffer_lock);
-	tasklet_init(&ep->tasklet, snd_usbmidi_out_tasklet, (unsigned long)ep);
+	tasklet_setup(&ep->tasklet, snd_usbmidi_out_tasklet);
 	init_waitqueue_head(&ep->drain_wait);
 
 	for (i = 0; i < 0x10; ++i)
-- 
2.17.1


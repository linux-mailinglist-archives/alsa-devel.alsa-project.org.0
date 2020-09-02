Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40F25A446
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 06:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002A51807;
	Wed,  2 Sep 2020 06:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002A51807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599019735;
	bh=sB4NO32u3k0ksbHkvfEXfRVGTLjus4aikpZLdNJ4coc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BaXDp3iDbPiaTRDNlBElWyqePGQ/6AChkap+3MwxBjiJW7c5NAU0SZYv6HR1qhcCt
	 rQfenyqrtIYxyzAaWtztyS9968D2OAYEGqSbx40QG67XwRWP/QXDwwNv+m/XVFTiG7
	 Aq+1ETk7LW0R45sqZr18+89EYwPJnrtM9Em+lDic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D15CFF80328;
	Wed,  2 Sep 2020 06:03:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C7DDF80323; Wed,  2 Sep 2020 06:03:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB65BF802FD
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 06:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB65BF802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PjOlHgMd"
Received: by mail-pl1-x644.google.com with SMTP id t11so1659880plr.5
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 21:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37ef/2uHWpmUjX7q9CvN/aYbv90bI+l+bajno0icC74=;
 b=PjOlHgMdqr5JnRZzQ8R2aSfPnemuiPgBJHcY83QXluFCNgFjwLcvwaFnNuF77bOjjg
 femft+gOb6Yg5hF4Cq9s5q8JZsKH7e6O82fVx9hXzU6vvqWcn7ivp1zZSm4mLXYzB9j0
 Imh89aI6w4sNCGtswrDYRFkgWkdVktYzfgeuPtr6js5TtYFuIk5oulgL0nKejnIEi+kG
 gplnY/E8g9b1uqmoifHzCVKhTK4wgmch/uI5q1CUM8XQdCrz4GIuByL9ni83ffCLCcH3
 e8F3x76eorp+Evo0dhHy0esJFCNKTu9S2VapSoX6KncA9RSxMAID4klrynUy5dVyYI8P
 gRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37ef/2uHWpmUjX7q9CvN/aYbv90bI+l+bajno0icC74=;
 b=HjK4JYdO+kAb8OrD4gTyu1lkYB3zpFrTDMHp3ycR5TE+s2vsoNL82a+qrmqUyvA+iH
 EHvdv9+ZuGBGSM2PqYj3Yob1B9VcQbz7HxaEgyNkEHtPBFIFm0aNjrR9ZFCfJhJ6Snd4
 6A7EztpTahaaF3rYroEmlvkgrDg/TX91AVrcdlZ6uunio1jCsIXo4l+INiHdgcWrpsb5
 TSeDUTn0ih5RthI6tCvw+NQR8wg6iFttVpCI7Mirn0BtxUTs68Qy9bCqTPAmpGMpKRVR
 Uqy+qpZHYXDyAlrc9DvAQ63daA4Jdjqg+iF7EhEdABbeuex+c4KU96ETFQMyDoagWbGa
 2V7A==
X-Gm-Message-State: AOAM5325hpPmG/tCPP2QHtw6uRk1I2emnL1eFrkWGckIqGzPtO14sWrG
 2Vk6emXvTIuKXbt/pZqpoOE=
X-Google-Smtp-Source: ABdhPJwAYV/167xS5B100VG67zPvENskXjTL72WyXmoJIo9on3Xu6AnqJTtaGISaatOt6deBM9R5pA==
X-Received: by 2002:a17:90a:19d1:: with SMTP id 17mr454997pjj.93.1599019385261; 
 Tue, 01 Sep 2020 21:03:05 -0700 (PDT)
Received: from localhost.localdomain ([49.207.196.170])
 by smtp.gmail.com with ESMTPSA id q71sm3058350pjq.7.2020.09.01.21.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 21:03:04 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Subject: [PATCH v2 09/10] ALSA: usb-audio: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  2 Sep 2020 09:32:20 +0530
Message-Id: <20200902040221.354941-10-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902040221.354941-1-allen.lkml@gmail.com>
References: <20200902040221.354941-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 clemens@ladisch.de, Allen Pais <allen.lkml@gmail.com>, nicoleotsuka@gmail.com,
 Romain Perier <romain.perier@gmail.com>
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
2.25.1


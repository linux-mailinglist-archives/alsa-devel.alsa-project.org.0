Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF484466
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 08:17:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BFF1165E;
	Wed,  7 Aug 2019 08:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BFF1165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565158667;
	bh=NQ3X6s5tJ/XHOELwlkmi2gShV16k0qYuN20YPVHvg/A=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XWr0qYi0kpp2qKGSGw4t1lfrRtVzkteCd83lV/wDBYDKiAJQDHyvdoJBP88rY2LLs
	 Ib8u2/JEjL/CCM5jWTjpS5vvEG9HxI68zQhB8jAByb9coDHxdQctCDozXPCJdEA2Nh
	 48yJsBNhZmXXXxGImt0pDx4PtxQ5cdudnO/VLKBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3706DF80290;
	Wed,  7 Aug 2019 08:16:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9CA5F80290; Wed,  7 Aug 2019 08:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ajax.cs.uga.edu (ajax.cs.uga.edu [128.192.4.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2C0CF800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 08:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C0CF800E4
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50]) (authenticated bits=0)
 by ajax.cs.uga.edu (8.14.4/8.14.4) with ESMTP id x776Fsjr059916
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <alsa-devel@alsa-project.org>; Wed, 7 Aug 2019 02:15:55 -0400
Received: by mail-lf1-f50.google.com with SMTP id b29so55880584lfq.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 23:15:55 -0700 (PDT)
X-Gm-Message-State: APjAAAVL7zR7aDjdam80JjLgR9ghMAdMLTOBCrxgex8JamFyC/vcxha1
 x+dnwpCmAwiBwWyOLXeIvqtSAhc8apkG6S9Fi/I=
X-Google-Smtp-Source: APXvYqy4XMRsGmpJdQ8mDa5OGjnpO7xdZnCatFepXfm3Gwb+MVnr3/vNwfV36DaNYOTUYvY941x7Lpslz9YDzUCxxBU=
X-Received: by 2002:ac2:418f:: with SMTP id z15mr4688367lfh.177.1565158553796; 
 Tue, 06 Aug 2019 23:15:53 -0700 (PDT)
MIME-Version: 1.0
From: Wenwen Wang <wenwen@cs.uga.edu>
Date: Wed, 7 Aug 2019 02:15:17 -0400
X-Gmail-Original-Message-ID: <CAAa=b7ffFNc4zuQfXEwsS363=kX_ZOx0+jhg4WM3JQ-d7n-LMA@mail.gmail.com>
Message-ID: <CAAa=b7ffFNc4zuQfXEwsS363=kX_ZOx0+jhg4WM3JQ-d7n-LMA@mail.gmail.com>
To: Wenwen Wang <wenwen@cs.uga.edu>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH] ALSA: pcm: fix a memory leak bug
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In hiface_pcm_init(), 'rt' is firstly allocated through kzalloc(). Later
on, hiface_pcm_init_urb() is invoked to initialize 'rt->out_urbs[i]'.
However, if the initialization fails, 'rt' is not deallocated, leading to a
memory leak bug.

To fix the above issue, free 'rt' before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/usb/hiface/pcm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index 14fc1e1..5dbcd0d 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -599,8 +599,10 @@ int hiface_pcm_init(struct hiface_chip *chip, u8
extra_freq)
        for (i = 0; i < PCM_N_URBS; i++) {
                ret = hiface_pcm_init_urb(&rt->out_urbs[i], chip, OUT_EP,
                                    hiface_pcm_out_urb_handler);
-               if (ret < 0)
+               if (ret < 0) {
+                       kfree(rt);
                        return ret;
+               }
        }

        ret = snd_pcm_new(chip->card, "USB-SPDIF Audio", 0, 1, 0, &pcm);
-- 
2.7.4
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

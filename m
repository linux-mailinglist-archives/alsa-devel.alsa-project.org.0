Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19784493
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 08:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A526A166B;
	Wed,  7 Aug 2019 08:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A526A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565159897;
	bh=D8XCxN70N4SW4bSyRcdDb/xArQHCzMAqg2kTp1N/MQ8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZiMq1G2fBTlj6M8YXBmf48Fcj66u31oSec1XjMjpkWR0mGVz2fnCvgtyUdD2LqFEf
	 m+rkxQD42DiSdFfqOUFpykpAZ6VHKGyZcVS23e7GK3xXOmDqJxS4pvEFKKWQtpSip4
	 UNX12xyEgVvHrUORMNqKqJ958KzPzWj6W3dMm1E8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F9DF804CA;
	Wed,  7 Aug 2019 08:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7946F80290; Wed,  7 Aug 2019 08:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ajax.cs.uga.edu (ajax.cs.uga.edu [128.192.4.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF855F800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 08:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF855F800F3
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43]) (authenticated bits=0)
 by ajax.cs.uga.edu (8.14.4/8.14.4) with ESMTP id x776aPin060233
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <alsa-devel@alsa-project.org>; Wed, 7 Aug 2019 02:36:26 -0400
Received: by mail-lf1-f43.google.com with SMTP id p197so63115932lfa.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 23:36:26 -0700 (PDT)
X-Gm-Message-State: APjAAAXCGXt7J3HBd7C1LuYNMmo7c4PUW4YMEd7Ok8jYlgKUXOAYdDKd
 Qo1YuvwWHXAmI55PaDFHHH9rsRdqIocv3jJKZ1Q=
X-Google-Smtp-Source: APXvYqxi4dKptE+0uRVH3LQnwgbIkzKfmoRHAjVF058miJuQSfE8z+Z7mv+uM58P9AeypODBnMZmdkM1bad3jfBXvB8=
X-Received: by 2002:a19:4aca:: with SMTP id x193mr4878607lfa.146.1565159785183; 
 Tue, 06 Aug 2019 23:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAa=b7ffFNc4zuQfXEwsS363=kX_ZOx0+jhg4WM3JQ-d7n-LMA@mail.gmail.com>
 <s5h8ss5o569.wl-tiwai@suse.de>
In-Reply-To: <s5h8ss5o569.wl-tiwai@suse.de>
From: Wenwen Wang <wenwen@cs.uga.edu>
Date: Wed, 7 Aug 2019 02:35:49 -0400
X-Gmail-Original-Message-ID: <CAAa=b7fRWjusR8y8DZze7NOW+P4w0O-HLK+5fcpZV8mcTeV37w@mail.gmail.com>
Message-ID: <CAAa=b7fRWjusR8y8DZze7NOW+P4w0O-HLK+5fcpZV8mcTeV37w@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Wenwen Wang <wenwen@cs.uga.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: fix a memory leak bug
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

On Wed, Aug 7, 2019 at 2:33 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 07 Aug 2019 08:15:17 +0200,
> Wenwen Wang wrote:
> >
> > In hiface_pcm_init(), 'rt' is firstly allocated through kzalloc(). Later
> > on, hiface_pcm_init_urb() is invoked to initialize 'rt->out_urbs[i]'.
> > However, if the initialization fails, 'rt' is not deallocated, leading to a
> > memory leak bug.
> >
> > To fix the above issue, free 'rt' before returning the error.
> >
> > Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
> > ---
> >  sound/usb/hiface/pcm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
> > index 14fc1e1..5dbcd0d 100644
> > --- a/sound/usb/hiface/pcm.c
> > +++ b/sound/usb/hiface/pcm.c
> > @@ -599,8 +599,10 @@ int hiface_pcm_init(struct hiface_chip *chip, u8
> > extra_freq)
> >         for (i = 0; i < PCM_N_URBS; i++) {
> >                 ret = hiface_pcm_init_urb(&rt->out_urbs[i], chip, OUT_EP,
> >                                     hiface_pcm_out_urb_handler);
> > -               if (ret < 0)
> > +               if (ret < 0) {
> > +                       kfree(rt);
> >                         return ret;
> > +               }
>
> Unfortunately this still leaves some memory.  We need to release
> rt->out_urbs[], too.  The relevant code is already in
> hiface_pcm_destroy(), so factor out the looped kfree() there and call
> it from both places.
>
> Care to resubmit with more fixes?

Thanks for your comments! I also found this issue, and am working on
another patch to fix it.

Wenwen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

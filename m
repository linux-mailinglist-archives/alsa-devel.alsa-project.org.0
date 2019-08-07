Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF6845B1
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8DE165D;
	Wed,  7 Aug 2019 09:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8DE165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565162798;
	bh=wMwOC+cQ2JuowzuITO0h+NHUY+oPnpHrDDrWKgcLKqo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7gMe+I8bdFd9YuCC5MfILruJNnR874YyA0e0vFsfc4D6nu3WEkevxrIV4hC1zTtT
	 xSAhldcPwZ2s7/2oH9F82jXTObYX5GC9HhnMlQ8Wbl/7gdw5FytdyfU+L7U3DC02+1
	 NrzcYl/WaSQTC30G4cE9nAdMd+DNC1R8qTzPlzyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F89F804CA;
	Wed,  7 Aug 2019 09:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC5E4F80290; Wed,  7 Aug 2019 09:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ajax.cs.uga.edu (ajax.cs.uga.edu [128.192.4.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6FD7F800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 09:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6FD7F800F3
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177]) (authenticated bits=0)
 by ajax.cs.uga.edu (8.14.4/8.14.4) with ESMTP id x777OjXH061259
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <alsa-devel@alsa-project.org>; Wed, 7 Aug 2019 03:24:47 -0400
Received: by mail-lj1-f177.google.com with SMTP id z28so30272774ljn.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Aug 2019 00:24:46 -0700 (PDT)
X-Gm-Message-State: APjAAAU8iX7agX+QmiSGYyioWvj4qvYCy2oCkdVURWL+qQnzG02Cwh07
 dUT7hH/mugA40QZ5n5O303iQZiu/3fo3esPttKw=
X-Google-Smtp-Source: APXvYqw7AV1qOIRFM5iroGqqZTGmVstTMrMRgRdOkFFNBa3998VR/3ohCw6xMvC1v7NGHLy2SsiLweoN5rphQWModk4=
X-Received: by 2002:a2e:8999:: with SMTP id c25mr3962559lji.169.1565162685345; 
 Wed, 07 Aug 2019 00:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAAa=b7dkPm4JqF4_cPwJo_6_aoobr6OyezCb2A9-aAFHNWffeQ@mail.gmail.com>
 <s5hv9v9moir.wl-tiwai@suse.de>
In-Reply-To: <s5hv9v9moir.wl-tiwai@suse.de>
From: Wenwen Wang <wenwen@cs.uga.edu>
Date: Wed, 7 Aug 2019 03:24:08 -0400
X-Gmail-Original-Message-ID: <CAAa=b7d-vxsrzk=B+Qcg1Fp6JgUJ1FOAXbJLU-SL_v-+nKVzaQ@mail.gmail.com>
Message-ID: <CAAa=b7d-vxsrzk=B+Qcg1Fp6JgUJ1FOAXbJLU-SL_v-+nKVzaQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Wenwen Wang <wenwen@cs.uga.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH v2] ALSA: pcm: fix multiple memory leak bugs
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

On Wed, Aug 7, 2019 at 3:18 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 07 Aug 2019 09:09:59 +0200,
> Wenwen Wang wrote:
> >
> > In hiface_pcm_init(), 'rt' is firstly allocated through kzalloc(). Later
> > on, hiface_pcm_init_urb() is invoked to initialize 'rt->out_urbs[i]'. In
> > hiface_pcm_init_urb(), 'rt->out_urbs[i].buffer' is allocated through
> > kzalloc().  However, if hiface_pcm_init_urb() fails, both 'rt' and
> > 'rt->out_urbs[i].buffer' are not deallocated, leading to memory leak bugs.
> > Also, 'rt->out_urbs[i].buffer' is not deallocated if snd_pcm_new() fails.
> >
> > To fix the above issues, free 'rt' and 'rt->out_urbs[i].buffer'.
> >
> > Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
> > ---
> >  sound/usb/hiface/pcm.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
> > index 14fc1e1..9b132aa 100644
> > --- a/sound/usb/hiface/pcm.c
> > +++ b/sound/usb/hiface/pcm.c
> > @@ -599,12 +599,18 @@ int hiface_pcm_init(struct hiface_chip *chip, u8
> > extra_freq)
> >         for (i = 0; i < PCM_N_URBS; i++) {
> >                 ret = hiface_pcm_init_urb(&rt->out_urbs[i], chip, OUT_EP,
> >                                     hiface_pcm_out_urb_handler);
> > -               if (ret < 0)
> > +               if (ret < 0) {
> > +                       for (; i >= 0; i--)
> > +                               kfree(rt->out_urbs[i].buffer);
> > +                       kfree(rt);
> >                         return ret;
> > +               }
> >         }
> >
> >         ret = snd_pcm_new(chip->card, "USB-SPDIF Audio", 0, 1, 0, &pcm);
> >         if (ret < 0) {
> > +               for (i = 0; i < PCM_N_URBS; i++)
> > +                       kfree(rt->out_urbs[i].buffer);
> >                 kfree(rt);
> >                 dev_err(&chip->dev->dev, "Cannot create pcm instance\n");
> >                 return ret;
>
> The fixes look correct, but since we can unconditionally call kfree()
> for NULL, both error paths can be unified as:
>
>         for (i = 0; i < PCM_N_URBS; i++)
>                 kfree(rt->out_urbs[i].buffer);
>         kfree(rt);
>
> and this would be better to be put in the common path at the end and
> do "goto error" or such from both places.

I will rework the patch and revise the subject line.

> BTW, your patch doesn't seem cleanly applicable in anyway because the
> tabs are converted to spaces.  Please check the mail setup.
>
> Also, please try to make the subject line more unique.  This is about
> hiface driver, so "ALSA: hiface: xxx" should be more appropriate.

I will also check my mail setup. Thanks!

Wenwen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

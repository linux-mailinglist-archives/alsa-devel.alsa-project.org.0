Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71093E7615
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 17:27:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF7F2018;
	Mon, 28 Oct 2019 17:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF7F2018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572280068;
	bh=MoQWQOn46znK9GUNnGQBlFxNDHmRDhaJdoipArvfZeY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBwo+mylqiPmiE1lM1RgAE4r4OtSBwaE2lefW/UPIhYaG+AG9SAdcYi1tVjx1K4tZ
	 qq/d65PfMzwjhjTX/oSKQBAHRoqcidq1nWNcTS1zcPOCK8dtio7VJ4cp1crkaF3JZt
	 3lTMPRZ+J6iI6lC3lZ7Ki0ihp6f/GDYcq9c1qW/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A042F802BD;
	Mon, 28 Oct 2019 17:26:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAFE0F80361; Mon, 28 Oct 2019 17:25:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB7C7F8011D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 17:25:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB7C7F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BiJaA4se"
Received: by mail-io1-xd43.google.com with SMTP id p6so11383670iod.7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=62aOCZujaPjLMXmFPiRB6XzKNfXNdqecHfS0A2Hu8ko=;
 b=BiJaA4seBZsQTPq9zw4g+A57lDEvtNeQoxuyhvCo9FUNmQt567u2xluFLm8yVUzwSO
 6JEuOH2ywUCSy8dF3elfmXyQW5ot8j4Hn+6ochXaNSLdWo41jgWxs/zdVbzR3cbNLn/n
 fJ4etMLzxmTHiqRfLDwJP2Yr2YkCxC/A3qpmPQjhSpnRLaK7BY7seX/ymv6oZLYJqtb3
 kDgCSl5H7SSeiz9Kd+AIDyMsWD58VLxPUIsyZ7fIaWr5gzomnLEQXtWCsDBVH0Ak6DB2
 I4aMXOZ/0Vi8m8tXpwmJSCTf0xk1E2yyjjZwSgtL7xGeAzyD7y/5Bodz5xHaFFONnDZD
 x1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=62aOCZujaPjLMXmFPiRB6XzKNfXNdqecHfS0A2Hu8ko=;
 b=UU/MovvJu1ggSH5HN7QNAzNlmIlLNjyuOob/oFlcElyeIVrAl9WzQXppnqVjjn/hSp
 Nw4sjNXJPdv6iv1rHxOE4/iKAlD6V5TcVv2uSzONBqQEwdqZHNsPJdnfXNV0+02maXru
 jKR56rm6edPmXciZ7Z/luAmfKONLKMNZfNuIVAKqtSVbOzPFCNpxOlg1nAm3pqBAIvBa
 CqFSoq0+1xGzurVGI7kAKaPSKWLidmMtQlzPbLPLGNTk3QrHU8ldGKoejkBF+flVUQUX
 l6NzkMiRSmktH9X/V/xQEcNMScN0+bJKxBJuFGkMnj6p+MHYsdS++IsunMR+TpyiUo2Z
 Ejow==
X-Gm-Message-State: APjAAAVmeiUdVqTP9V04W2UCl3Z7NdrWu95BpLE0MM5Z+YdVfR2nhMKv
 Z2uOHenwu5ddhUnQhCmzQmlwtEFlqH7VNNk5Y6Q=
X-Google-Smtp-Source: APXvYqxS+8kiAL+Wcxn+fmYc+Yioqr8WfBBuzznOXGTcdWpC3bS3vjFRwgW6Rto0lmGXcotfSYpCifNGe71zuO2R4lw=
X-Received: by 2002:a5e:9706:: with SMTP id w6mr18017287ioj.252.1572279952857; 
 Mon, 28 Oct 2019 09:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191027221007.14317-1-navid.emamdoost@gmail.com>
 <s5hpnihmlk3.wl-tiwai@suse.de>
In-Reply-To: <s5hpnihmlk3.wl-tiwai@suse.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 28 Oct 2019 11:25:41 -0500
Message-ID: <CAEkB2ESwKEQYQx75BnaHf4aUQHObx4jf0hreQx_KTeZ+QCjL4g@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Kangjie Lu <kjlu@umn.edu>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix memory leak in
	__snd_usbmidi_create
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

Thanks for the explanation,

On Mon, Oct 28, 2019 at 1:27 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 27 Oct 2019 23:10:06 +0100,
> Navid Emamdoost wrote:
> >
> > In the implementation of __snd_usbmidi_create() there is a memory leak
> > caused by incorrect goto destination. Go to free_midi if
> > snd_usbmidi_create_endpoints_midiman() or snd_usbmidi_create_endpoints()
> > fail.
>
> No, this will lead to double-free.  After registering the rawmidi
> interface at snd_usbmidi_create_rawmidi(), the common destructor will
> be called via rawmidi private_free callback, and this will release the
> all resources already.
Now I can see how rawmidi private_free is set up to release the
resources, but what concerns me is that at the moment of endpoint/port
creation umidi is not yet added to the midi_list.
In other words, what I see is that we still have just one local
pointer to umidi if any of snd_usbmidi_create_endpoint* fail.
Am I missing something?


>
>
> thanks,
>
> Takashi
>
> >
> > Fixes: 731209cc0417 ("ALSA: usb-midi: Use common error handling code in __snd_usbmidi_create()")
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> >  sound/usb/midi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> > index b737f0ec77d0..22db37fbfbbd 100644
> > --- a/sound/usb/midi.c
> > +++ b/sound/usb/midi.c
> > @@ -2476,7 +2476,7 @@ int __snd_usbmidi_create(struct snd_card *card,
> >       else
> >               err = snd_usbmidi_create_endpoints(umidi, endpoints);
> >       if (err < 0)
> > -             goto exit;
> > +             goto free_midi;
> >
> >       usb_autopm_get_interface_no_resume(umidi->iface);
> >
> > --
> > 2.17.1
> >



-- 
Navid.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

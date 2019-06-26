Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0F572A3
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 22:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D8E16AB;
	Wed, 26 Jun 2019 22:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D8E16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561581418;
	bh=PV3/OfzViQ/kUQQnbRLmvIWYeZUKHhiZj4i8KQd0F40=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3195RQNgKD3ic2U8UNw9eSjqnDJRFFfDBSYqR0K86wTCZhLuQKRy2CgxPbaAcbCI
	 Wg9mB5nCPNj1fvKl+B8yHPVTTo0QMzDI/B9JYfFbi+V1YQxurx6XlIp2XCEew0hMrT
	 kW6/Lik7d4s91X1o54fjvyOVXjoOrZVdaLHD8/qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41263F896B9;
	Wed, 26 Jun 2019 22:35:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E90E5F896B9; Wed, 26 Jun 2019 22:35:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12995F806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 22:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12995F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kyg5STNu"
Received: by mail-lf1-x141.google.com with SMTP id d11so29895lfb.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LTRf588K19VR3uE4xJO4Ojwc8tEPausRnAboL2Ui+lU=;
 b=kyg5STNuNn7xfncn6wo2Yv/G5ZEt6xObU+gLxf5bai1e0LwHH3HnqqpmBIDfCmVxlS
 qz+z5g81bjwQWPsYzAdU9I4U77GW33GYOGebiIVAVbGpBrcTkwORPHT2q7vcucoNZwg8
 ePNS9c2+vF0OyA0BDj2kyQSCfD65z6LrU8Zzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LTRf588K19VR3uE4xJO4Ojwc8tEPausRnAboL2Ui+lU=;
 b=t/ptTewSlTAKCwaekqKI/IhVNeH/dOkKOK8KYQG24cx/lAwXiEqq9OVEdeAuj8kSlL
 O21KpKVhxaNCAundOYxopZApUSQIGdVWLfArrbSWy4zuQ5SJtJToj9n6im7G41DXCICN
 Nf8UymqP9PxWITjqeBHla3iqgR6ne+sn9QtqryNOroc6g9/0qZYhsUZv84JFolrkIfLA
 8jOGVx5cGFuCihH52KumvTfGatIBJvFp68NAs5lBzRKGuquxgL+soncJgbxwEHuwWRhC
 MD2Av602BQZHUpSH6VSHKefUFY0RLZ/iB6eZjCT54C4Dc0oERSeidYLh1k4EjaZIqsgk
 0WeA==
X-Gm-Message-State: APjAAAVzKZ183SObMwggfM3RVx+nsuVAZjwdo0XJkr3O3AoeZIcpQsIK
 QjRKzQiWQRfuEefQ4//PC9cAnuVlBNU=
X-Google-Smtp-Source: APXvYqyZEdCENCcjHfZFwDVU1GssFfLPPmihDKXMJ0tL9NVuif0n3OnVDC0Fm16NqklchpS8wB7j3A==
X-Received: by 2002:ac2:5922:: with SMTP id v2mr46579lfi.180.1561581306378;
 Wed, 26 Jun 2019 13:35:06 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id l25sm2963052lja.76.2019.06.26.13.35.05
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 13:35:05 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id r9so3577531ljg.5
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:35:05 -0700 (PDT)
X-Received: by 2002:a2e:9c41:: with SMTP id t1mr142105ljj.6.1561581304868;
 Wed, 26 Jun 2019 13:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190625215418.17548-1-evgreen@chromium.org>
 <s5himsssqe8.wl-tiwai@suse.de>
In-Reply-To: <s5himsssqe8.wl-tiwai@suse.de>
From: Evan Green <evgreen@chromium.org>
Date: Wed, 26 Jun 2019 13:34:28 -0700
X-Gmail-Original-Message-ID: <CAE=gft62iv=V=auOhocRRfPV2Tuc2WiRYJOH5_M+HkM0qH-Jhw@mail.gmail.com>
Message-ID: <CAE=gft62iv=V=auOhocRRfPV2Tuc2WiRYJOH5_M+HkM0qH-Jhw@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Amadeusz S*awi*ski <amadeuszx.slawinski@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Use correct start/count for
	sysfs init
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

On Wed, Jun 26, 2019 at 1:27 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 25 Jun 2019 23:54:18 +0200,
> Evan Green wrote:
> >
> > The normal flow through the widget sysfs codepath is that
> > snd_hdac_refresh_widgets() is called once without the sysfs bool set
> > to set up codec->num_nodes and friends, then another time with the
> > bool set to actually allocate all the sysfs widgets. However, during
> > the first time allocation, hda_widget_sysfs_reinit() ignores the new
> > num_nodes passed in via parameter and just calls hda_widget_sysfs_init(),
> > using whatever was in codec->num_nodes before the update. This is not
> > correct in cases where num_nodes changes. Here's an example:
> >
> > Sometime earlier:
> > snd_hdac_refresh_widgets(hdac, false)
> >   sets codec->num_nodes to 2, widgets is still not allocated
> >
> > Now:
> > snd_hdac_refresh_widgets(hdac, true)
> >   hda_widget_sysfs_reinit(num_nodes=7)
> >     hda_widget_sysfs_init()
> >       widget_tree_create()
> >         alloc(codec->num_nodes) // this is still 2
> >   codec->num_nodes = 7
> >
> > Pass num_nodes and start_nid down into widget_tree_create() so that
> > the right number of nodes are allocated in all cases.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
>
> Thanks for the patch.  That's indeed a problem, but I guess a simpler
> approach is just to return if sysfs didn't exist.  If the sysfs
> entries aren't present at the second call with sysfs=true, it implies
> that the codec object will be exposed anyway later, and the sysfs will
> be created there.  So, something like below would work instead?

Hi Takashi,
Thanks for taking a look. I'm not sure you'd want to do that because
then you end up returning from sysfs_reinit without having allocated
any of the sysfs widgets. You'd be relying on the implicit behavior
that another call to init is coming later (despite having updated
num_nodes and start node), which is difficult to follow and easy to
break. In my opinion the slight bit of extra diffs is well worth the
clarity of having widget_tree_create always allocate the correct
start/count.

Actually, in looking at the widget lock patch, I don't think it's
sufficient either. It adds a lock around sysfs_reinit, but the setting
of codec->num_nodes and codec->start_nid is unprotected by the lock.
So you could have the two threads politely serialize through
sysfs_reinit, but then get reordered before setting codec->num_nodes,
landing you with an array whose length doesn't match num_nodes.

Let me craft up an additional patch to fix the locking.
-Evan

>
>
> thanks,
>
> Takashi
>
> --- a/sound/hda/hdac_sysfs.c
> +++ b/sound/hda/hdac_sysfs.c
> @@ -428,7 +428,7 @@ int hda_widget_sysfs_reinit(struct hdac_device *codec,
>         int i;
>
>         if (!codec->widgets)
> -               return hda_widget_sysfs_init(codec);
> +               return 0;
>
>         tree = kmemdup(codec->widgets, sizeof(*tree), GFP_KERNEL);
>         if (!tree)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

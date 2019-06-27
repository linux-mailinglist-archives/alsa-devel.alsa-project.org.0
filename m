Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A63588DB
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 19:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB23166F;
	Thu, 27 Jun 2019 19:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB23166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561657331;
	bh=bjVUQR45qTWpPx+1xMYrlDt18K6EioMJtSsSuC7hNqk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4NzfQYfClfZu9dZ9+i8Pe6WfX6CLrUoN4yD8yrDjZugBLmxuRsrTElJtAZJtklqV
	 IoLhJVpEs38b/AWas0sOY/1bEiDk/akneGAejzn1Q/aiE/Hs06nD1Yp3TNpaxa+GFc
	 3+bfBAuP2gRqcZkgnRP5mZUOrp6kEwjqHB1C/FSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C61F896F6;
	Thu, 27 Jun 2019 19:40:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E722F896F6; Thu, 27 Jun 2019 19:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 411A4F89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 19:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 411A4F89678
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XqezNkIH"
Received: by mail-lf1-x142.google.com with SMTP id d11so2160467lfb.4
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 10:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8j1QjZTpzcDpoHtThwoBK+4AhD1xmnZXVKPIZKGYs6Y=;
 b=XqezNkIHrxp2hUtfKeEP6QYT1lYxM3J5/abFijXihmmjxdiuFoYJsK5lryYdIrv8Lx
 oT5iKZYc8KSSLPbjKRMPAGVI5ISGSEf7Dwm5g2gd9qKO2Cj8sEwTdSzUSYgSqGtYxWv4
 RFFTcga+A0cUcf161WnkrwrhBWrc29YGEvj/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8j1QjZTpzcDpoHtThwoBK+4AhD1xmnZXVKPIZKGYs6Y=;
 b=guD4XTWpLR/TH1QmOGdRl7OlOYI4nyhC86uCA4RZsO6kFyEYWjqoZtMsikISfx47cQ
 ynpJn+8wteHIdp/SadEVrnO/BKCxxlSIePLAb1j2Z3Gd1e7wz3wd5YGr5BrHNwkldESg
 4mjj4pVYJEBlZo+UH0oGfMEdhWhgWd4L1OWwotnSP5YhiLjp9ezVwL0YA82wfGhO7e+D
 1xcSDdg5xvK/fP20MCpEmgrDBgmUfrlsHeKKRVlcY54hkUrG+JW5xTQk/N8NPeW0pXSf
 qBMhs68pi7KQX0IH07JovnWr6Bkk7Co/8TRfMFW08P+1aK+5PmY1Iq/bw54bLMb3oCmR
 30Dw==
X-Gm-Message-State: APjAAAV2XmTHhA97Sc9JNNJTD2k6LUzq1vPhBFuiDnZixWaKl/eDvmSC
 uz9ctJheyOVBuLm3MUSEdy4uZ9vZpO4=
X-Google-Smtp-Source: APXvYqyxhlqDriei3FQozk9nfD8XpQV9TkAJ8ycQ6Nl/smYGxHx7bnMDdmuOGQj6QzMGuKyavkjgUw==
X-Received: by 2002:a19:490d:: with SMTP id w13mr2650127lfa.58.1561657217110; 
 Thu, 27 Jun 2019 10:40:17 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id t3sm464008lfk.59.2019.06.27.10.40.14
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:40:14 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id q26so2161484lfc.3
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 10:40:14 -0700 (PDT)
X-Received: by 2002:ac2:4990:: with SMTP id f16mr2622052lfl.93.1561657213233; 
 Thu, 27 Jun 2019 10:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190625215418.17548-1-evgreen@chromium.org>
 <s5himsssqe8.wl-tiwai@suse.de>
 <CAE=gft62iv=V=auOhocRRfPV2Tuc2WiRYJOH5_M+HkM0qH-Jhw@mail.gmail.com>
 <s5hy31oqc8a.wl-tiwai@suse.de>
 <CAE=gft664LfHU58Hm+Xtu-OYqiZT0Xsp3X2=U-Q+ApTsgj7z+g@mail.gmail.com>
 <s5htvcbr42p.wl-tiwai@suse.de>
In-Reply-To: <s5htvcbr42p.wl-tiwai@suse.de>
From: Evan Green <evgreen@chromium.org>
Date: Thu, 27 Jun 2019 10:39:36 -0700
X-Gmail-Original-Message-ID: <CAE=gft711769H--+WxQCZPOMu-+a3qpSuqoLw8qOqBVQ+0_8ZQ@mail.gmail.com>
Message-ID: <CAE=gft711769H--+WxQCZPOMu-+a3qpSuqoLw8qOqBVQ+0_8ZQ@mail.gmail.com>
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

On Wed, Jun 26, 2019 at 10:26 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 26 Jun 2019 23:59:33 +0200,
> Evan Green wrote:
> >
> > On Wed, Jun 26, 2019 at 2:16 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Wed, 26 Jun 2019 22:34:28 +0200,
> > > Evan Green wrote:
> > > >
> > > > On Wed, Jun 26, 2019 at 1:27 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > > >
> > > > > On Tue, 25 Jun 2019 23:54:18 +0200,
> > > > > Evan Green wrote:
> > > > > >
> > > > > > The normal flow through the widget sysfs codepath is that
> > > > > > snd_hdac_refresh_widgets() is called once without the sysfs bool set
> > > > > > to set up codec->num_nodes and friends, then another time with the
> > > > > > bool set to actually allocate all the sysfs widgets. However, during
> > > > > > the first time allocation, hda_widget_sysfs_reinit() ignores the new
> > > > > > num_nodes passed in via parameter and just calls hda_widget_sysfs_init(),
> > > > > > using whatever was in codec->num_nodes before the update. This is not
> > > > > > correct in cases where num_nodes changes. Here's an example:
> > > > > >
> > > > > > Sometime earlier:
> > > > > > snd_hdac_refresh_widgets(hdac, false)
> > > > > >   sets codec->num_nodes to 2, widgets is still not allocated
> > > > > >
> > > > > > Now:
> > > > > > snd_hdac_refresh_widgets(hdac, true)
> > > > > >   hda_widget_sysfs_reinit(num_nodes=7)
> > > > > >     hda_widget_sysfs_init()
> > > > > >       widget_tree_create()
> > > > > >         alloc(codec->num_nodes) // this is still 2
> > > > > >   codec->num_nodes = 7
> > > > > >
> > > > > > Pass num_nodes and start_nid down into widget_tree_create() so that
> > > > > > the right number of nodes are allocated in all cases.
> > > > > >
> > > > > > Signed-off-by: Evan Green <evgreen@chromium.org>
> > > > >
> > > > > Thanks for the patch.  That's indeed a problem, but I guess a simpler
> > > > > approach is just to return if sysfs didn't exist.  If the sysfs
> > > > > entries aren't present at the second call with sysfs=true, it implies
> > > > > that the codec object will be exposed anyway later, and the sysfs will
> > > > > be created there.  So, something like below would work instead?
> > > >
> > > > Hi Takashi,
> > > > Thanks for taking a look. I'm not sure you'd want to do that because
> > > > then you end up returning from sysfs_reinit without having allocated
> > > > any of the sysfs widgets. You'd be relying on the implicit behavior
> > > > that another call to init is coming later (despite having updated
> > > > num_nodes and start node), which is difficult to follow and easy to
> > > > break. In my opinion the slight bit of extra diffs is well worth the
> > > > clarity of having widget_tree_create always allocate the correct
> > > > start/count.
> > >
> > > Well, skipping is the right behavior, actually.  The whole need of the
> > > refresh function is just to refresh the widget list, and the current
> > > behavior to create a sysfs is rather superfluous.  This action has
> > > never been used, so better to get removed for avoiding misuse.
> >
> > Whoops, I sent out a v2 before seeing this. Sorry to jump the gun like that.
> >
> > I don't quite follow what you mean by "current behavior to create a
> > sysfs is rather superfluous". Do you think we could delete this
> > conditional in re-init altogether? I wasn't totally sure, but it
> > seemed like if the conditional could possibly be activated, then the
> > behavior was also incorrect.
> >
> > Actually, couldn't this happen if something goes through
> > widget_tree_free(), then something else goes through a reinit()? If
> > the reinit call doesn't have the same number of widgets as before,
> > then you'd need my patch to avoid initing with the wrong array size.
>
> I meant that hda_widget_sysfs_reinit() creates sysfs files if they
> weren't present. hda_widget_sysfs_reinit() should do nothing if the
> sysfs wasn't created beforehand -- like my suggested patch does.
>
> After that change, "bool sysfs" argument can be de even dropped from
> snd_hdac_refresh_widgets().  The very first call of this function is
> with sysfs=false, but at this point, codec->widgets=NULL, so reinit()
> would just skip.  All later calls are with sysfs=true.

Hi Takashi,
I think I understand. That might work, but it would definitely require
my other patch in v2. The contributing factors to that are:
1. The count of widgets coming out of snd_hdac_get_sub_nodes() can change.
2. hda_widget_sysfs_init() races with at least one (and in my head I
just make it multiple) calls to snd_hdac_refresh_widgets().
3. codec->{num_nodes, start_nid, widgets} are all essentially one data
structure that needs to be protected.

Without my other patch in v2 [1], num_nodes and start_nid are not
updated at the same time as the widgets array.

The patch you suggest may work as long as the lock surrounds all of 1)
the read in snd_hdac_get_sub_nodes(), 2) the updating of widgets
array, and 3) updating start_nid, num_nodes.

However, by doing it the way you suggest we're effectively saying "if
codec->widgets doesn't exist, then reinit does nothing". I worry that
a future caller might try to do something that requires the widgets to
have actually been refreshed after calling refresh_widgets(), but end
up crashing because they had won the race against sysfs_init(), and
refresh_widgets() did nothing except set codec->num_nodes. Which seems
weird, you'd expect a function named refresh_widgets() would keep the
whole data structure consistent, and that sysfs_reinit() would return
having actually re-initialized sysfs. I was trying to preserve those
semantics with my patch, rather than introduce an implicit ordering
dependency between refresh_widgets() and sysfs_init().

>
>
> > > > Actually, in looking at the widget lock patch, I don't think it's
> > > > sufficient either. It adds a lock around sysfs_reinit, but the setting
> > > > of codec->num_nodes and codec->start_nid is unprotected by the lock.
> > > > So you could have the two threads politely serialize through
> > > > sysfs_reinit, but then get reordered before setting codec->num_nodes,
> > > > landing you with an array whose length doesn't match num_nodes.
> > >
> > > The usage of snd_hdac_refresh_widgets() is supposed to be done only at
> > > the codec probe phase, hence there is no lock done in the core code;
> > > IOW, any concurrent access has to be protected in the caller side in
> > > general.
> > >
> > > Have you actually seen such concurrent accesses?  If yes, that's a
> > > problem in the usage.
> >
> > I got into staring at this code while trying to debug a KASAN
> > use-after-free in this code. I found the issue in this patch by
> > inspection, so I'm not 100% sure if it could ever happen. My
> > use-after-free appears to be fixed by the new widget_lock (I didn't
> > have that at the time), but I think at least my other patch in v2 is
> > necessary to make the widget_lock work correctly.
> >
> > I'll document my use-after-free here in case it helps. The cleaned up
> > stacks racing to mess with sysfs look like this:
> (snip)
>
> OK, this information helps a lot for understanding the problem.
> The parallel initialization hasn't been considered much, so far.
> Let me check that in detail later.  I'll postspone your v2 patch for a
> while.

Ok. Please do consider the other patch in that series [1], as I
believe it is needed no matter which way we do this patch.

[1] https://lore.kernel.org/lkml/20190626212220.239897-2-evgreen@chromium.org/

-Evan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

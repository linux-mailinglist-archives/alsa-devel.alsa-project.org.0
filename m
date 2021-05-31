Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E939595C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 13:01:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B51850;
	Mon, 31 May 2021 13:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B51850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622458884;
	bh=cMwTdyLdl0nUY1unPCYgEaGh1k5QqfBNm4mpliSAsNA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sEVSpe6+/Rg9ddPJtHJK/H0sMhMxEk1wYZlwEpA2QGPz1fUv3quyYUOTUrG+6Y8Qy
	 GqfVD8MYuEvhcyvI0DF6+QRQgRmyGMRzTOkvMHFuQ8BIttly4wlZLOSA+63HjyYtRg
	 rb8LmY4AIkZSB2jIHUKauHjk149K9AuSzalJeK6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70ED4F80424;
	Mon, 31 May 2021 12:59:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FAD0F802E2; Mon, 31 May 2021 12:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63598F80088
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 12:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63598F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OK30sQzc"
Received: by mail-ed1-x531.google.com with SMTP id o5so13024241edc.5
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HP3WcUIToXbjBzYIVWAC3coIFADZFvRroLmM7ZEJD08=;
 b=OK30sQzcv7pOlKyf/wTJbiuM9Y3pJy8KSrHmIJveIlwbmMVAu+SEutZlB9W9OlNAii
 hxFVX1GQ5CFwKfYD+SpKm8jGiW51KypPo5ksWidt1m7oiQfrhJdtDTdZjJZl3eZ6Lire
 ghJsV6ODsZsCjUOxOBAQhGVxBEU2UDEg1xUVMZZIhUZOI/pVSFf4kxZkSfa1wAWFwkxj
 ZfvqtAjfuG4JDUq1USZYNcQGGdh6hbBuA/qrVUAXd9eqwwDUnRg0uLi0VHNzNLNsKb1Q
 24vBLGWOL5mGWH7D4/aSUA+WhgE5vJFHTtgLCEi7oEoO+1Odp+6m4euccHa4zsiwY8Lc
 svKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HP3WcUIToXbjBzYIVWAC3coIFADZFvRroLmM7ZEJD08=;
 b=liyomaDE2PkTi05O/pSmugeDeLanWB/zkH/xHjv7lEfQwbbJsuqKH4TXhKTQhHzS78
 nAkuJeNixPUwMWV6DRu94Ih/tj/+Sl2xZPHLmmSv2pr5zpbEDqjNGnSBpCqfGGhP4272
 UpBOvpBMtEaoIsOp5pfsuMnmU9BpEdfRx+1SSwRRXBr3nb2KTpcrqR++dDcUyLALcLWq
 aA8inRdCJ1iOrW/M1qjl/P92YYWvWG2H1z26ncaMLCO1qhhAaBqL7+/++C8cRyLUti6P
 vQ7FtYjp/qyM5jJIqS2R6ZnxJ2HGYSMb++RCLFLk5fUl9Y3M3N9DbMVsWiLamBlDmlhV
 +UxQ==
X-Gm-Message-State: AOAM533hM22UJv1hZypBboMnuEV/FOAwniOYVcODxhaztD9m6FzbxTc5
 NY2vzSfUsmnH5kVbSMDGmGlwfugihRE+F7+mYyg=
X-Google-Smtp-Source: ABdhPJw7wMDeOrH18o7Kh7wDlmDSk58NKBskCqUTNl8wB3HMaLUJjk1vxKZXE8eeAs/qvf8qnpr5V61G5gkN3DKW2Io=
X-Received: by 2002:a05:6402:22f9:: with SMTP id
 dn25mr176682edb.241.1622458785176; 
 Mon, 31 May 2021 03:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QVjhDDJxRnNrDzwt05BNijr1o11nE8xjvq8GrakEJ8EuQ@mail.gmail.com>
 <20210531044022.GU24442@kadam>
 <CAD-N9QWBBP6_Wwi4z3e4yJM-tS54=1=CcvAA+2__Qj8NsTLq9g@mail.gmail.com>
 <20210531070337.GV24442@kadam>
 <CAD-N9QU-uqFr=b1hMi1h1ytq2Uf2XKL44f9OHBRhM70zhkiO7w@mail.gmail.com>
 <CAD-N9QW5C2ssA7H_U+eiM=SbsPj29Ooo6Sk=r4d1qELbZQjuPA@mail.gmail.com>
 <20210531084613.GX24442@kadam>
 <CAD-N9QVAdaitDcM6BGfwvNR=gMf7G6DK00n0Ev6ucXc6xNFFpw@mail.gmail.com>
 <20210531093817.GY24442@kadam>
 <CAD-N9QUTZ49CvrhW76pTUDOp8y=29JXxR45Z_W53qVz0PJHVLw@mail.gmail.com>
 <20210531104355.GZ24442@kadam>
In-Reply-To: <20210531104355.GZ24442@kadam>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 31 May 2021 18:59:18 +0800
Message-ID: <CAD-N9QXAq73E5DrzkK6gULaBAQ4FrO5_OCndWZpOmSgPTAiqrw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

On Mon, May 31, 2021 at 6:44 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, May 31, 2021 at 06:35:33PM +0800, Dongliang Mu wrote:
> > On Mon, May 31, 2021 at 5:38 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Mon, May 31, 2021 at 05:10:49PM +0800, Dongliang Mu wrote:
> > > > Hi Dan,
> > > >
> > > > I wonder if we shall split the current patch into two patches, one
> > > > patch for each memory leak. It is better to satisfy the rule - "one
> > > > patch only fixes one issue".
> > > >
> > > > We should absolutely fix all these memory leaks. But one patch for two
> > > > different bugs with different objects and different paths is not very
> > > > suitable.
> > > >
> > >
> > > I would just send one patch, because I only see it as one bug.  But you
> > > do what you think is best.
> >
> > If you think they are the same bug, that's great. Just send and apply
> > only one patch as it is. I will not send version v2.
>
> Sorry for the miscommunication.  That's not what I meant at all.
>
> Your patch only introduces one put_device().  We need all five to fix
> the bug, and we'll have to change the kfree(link_whatever).  Use
> device_unregister() instead put_device().  Include a Reported-by with
> the correct syzkaller information.
>
> >
> > BTW, could you please show me the syzbot link for the bug you tried to
> > resolve? If it is not from syzbot dashboard, can you please show the
> > bug report?
>
> What are you talking about?  I'm not trying to fix a syzkaller bug.  I'm
> just reviewing your patch.

It seems we truly have some miscommunication. Your message makes me
think you are fixing another bug report that shares the same root
cause with this bug.

Now let's sync and get on the same page.

You are trying to give me some suggestions to fix this bug. I need to
listen to your advice and send another version v2 to you developers.
Right?

>
> regards,
> dan carpenter

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DEC23DBEB
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 18:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EBAC836;
	Thu,  6 Aug 2020 18:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EBAC836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596731911;
	bh=XiXoc6nWAw5lDp5v1JU3tYA5tiPzfOi2m1pAStzfaO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k/flJHH46/UNRYJI6HGkgV5d9NnIAe9ObCM3wpLNcconsG6FwksZGjyGIzw06ylWX
	 JBD9zGoMl0BQQaOKlcqMZwj/BqgNic+hEFes2WTen6599XRsdzRQXDyLSl8+04OWho
	 1g6Zftd9XBUWjHlpEiYT7Pqb7iVJULaShBG7p3BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ABCFF80124;
	Thu,  6 Aug 2020 18:36:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63F14F800B7; Mon,  3 Aug 2020 10:46:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C7F7F80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 10:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C7F7F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WpMWmZ08"
Received: by mail-ot1-x341.google.com with SMTP id x24so3240287otp.3
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ldpq9lUOsWhKwe/FZyOZtBINOPkrHNfkHnfcPwlRPCU=;
 b=WpMWmZ08n26KnNJ8Kee1MYAG1Jm/zPcTsurcm70Oz6QCv5oFfJJeXvq3VcoC9Bqmp3
 ZwUe+YLsT+FIs/9kGKQtxteKlRXHSSQ+XStDVRPK0FJ9rDWqULujkoduvfNvMAyy0GOg
 NoXxh8OaGSL/tRiXvcDRUH0pjdIKGIrcWXdgMqadI1W4uKjz2xIadtm/umq1TPcJ2dwv
 x921GXZ22H8R3fB7B0gACzntSyHHPZ4Uep08cGKEx1pE00WBaNIlW5skBV0VR9xSPFsw
 +/MQUrW8/mEWr+pwjxhIKc3bVJJhFwBIXZ+8+jfHudxJdG2f4k8YUNGYS662utnJkUBW
 AW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ldpq9lUOsWhKwe/FZyOZtBINOPkrHNfkHnfcPwlRPCU=;
 b=tCz3Yc0C7WVqpz5EhdgEuQknDdX61yFnBIj7XlI1YYzBA3Iiug6bhO7cnHEGpzy7K9
 0yPCxx/iWnzxBsneL69O8zsmvNc4ksXvtXyZtObAOYMTdy3GONwK8sHjCDsuQGTzBL4Y
 2So+JE6PBhEkU2005XdR9HIUbtLmm3if+B9yzuIqL5oDlVLjBsTLh81ouVVyLb/BjxJ7
 xBXYPonX+RYCZMomVeZeKwtbbQxrBmIxRT7F6x6/6oYZreKyV8w4REwzgE/CV5QxuKt4
 RdCWQny6RNPLxnPiu8P6nwzpl8m/94KqxSM5oKsQMv8+9YIOHlRdAVKDkRh5Q+PMD2G8
 mWIw==
X-Gm-Message-State: AOAM533jcnI+lFFc3CYgNS6TdUb/6oAgeanKpNdJDGqfAJ0jQYke84za
 xRLNpKqcs8D/L7uDd+rJkbO8Xv+PZtEuHM02eh4=
X-Google-Smtp-Source: ABdhPJywEIvpuyitAoDTtD0/wC6yQxi+TGZF6FmBDXPPZy9GwNZrNEeGyjiIoXvh3WcLO7UKIwA2uajhqG5WgWac/6c=
X-Received: by 2002:a05:6830:1c65:: with SMTP id
 s5mr12486238otg.264.1596444390081; 
 Mon, 03 Aug 2020 01:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200716030847.1564131-1-keescook@chromium.org>
 <87h7tpa3hg.fsf@nanos.tec.linutronix.de> <202007301113.45D24C9D@keescook>
In-Reply-To: <202007301113.45D24C9D@keescook>
From: Allen <allen.lkml@gmail.com>
Date: Mon, 3 Aug 2020 14:16:15 +0530
Message-ID: <CAOMdWSJQKHAWY1P297b9koOLd8sVtezEYEyWGtymN1YeY27M6A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 06 Aug 2020 18:36:48 +0200
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 alsa-devel@alsa-project.org, Oscar Carter <oscar.carter@gmx.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-input@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Romain Perier <romain.perier@gmail.com>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

Kees,

>
> [heavily trimmed CC list because I think lkml is ignoring this
> thread...]
>
> On Thu, Jul 30, 2020 at 09:03:55AM +0200, Thomas Gleixner wrote:
> > Kees,
> >
> > Kees Cook <keescook@chromium.org> writes:
> > > This is the infrastructure changes to prepare the tasklet API for
> > > conversion to passing the tasklet struct as the callback argument instead
> > > of an arbitrary unsigned long. The first patch details why this is useful
> > > (it's the same rationale as the timer_struct changes from a bit ago:
> > > less abuse during memory corruption attacks, more in line with existing
> > > ways of doing things in the kernel, save a little space in struct,
> > > etc). Notably, the existing tasklet API use is much less messy, so there
> > > is less to clean up.
> > >
> > > It's not clear to me which tree this should go through... Greg since it
> > > starts with a USB clean-up, -tip for timer or interrupt, or if I should
> > > just carry it. I'm open to suggestions, but if I don't hear otherwise,
> > > I'll just carry it.
> > >
> > > My goal is to have this merged for v5.9-rc1 so that during the v5.10
> > > development cycle the new API will be available. The entire tree of
> > > changes is here[1] currently, but to split it up by maintainer the
> > > infrastructure changes need to be landed first.
> > >
> > > Review and Acks appreciated! :)
> >
> > I'd rather see tasklets vanish from the planet completely, but that's
> > going to be a daring feat. So, grudgingly:
>
> Understood! I will update the comments near the tasklet API.
>
> > Acked-by: Thomas Gleixner <tglx@linutronix.de>
>

Here's the series re-based on top of 5.8
https://github.com/allenpais/tasklets/tree/V3

Let me know how you would want these to be reviewed.

Also, I was thinking if removing tasklets completely could be a task
on KSPP wiki. If yes, I did like to take ownership of that task. I have a
couple of ideas in mind, which could be discussed in a separate email.

Thanks.

-- 
       - Allen

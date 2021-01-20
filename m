Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30B22FDB4E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 22:19:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6922617EA;
	Wed, 20 Jan 2021 22:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6922617EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611177572;
	bh=h870dOnY0nmaUHjgYfOHn5UInNE3DZqxXIt6yf/D4Ms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7lWFsf623PWfgvVG4aDhSDLWQ44pW1BI1AwzNR6WPu+A5fnnoBJHC/AOa8vYHohT
	 nQ+t9PGxLoU7OrxMgWvcp62xrO7QuMVcAcproyt0tRUNEvY3N8g9DEcsUcdkEtid3w
	 RyO1yNWkuRXD962xefUWLAQ89IumHKIma72mnxbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC043F8019B;
	Wed, 20 Jan 2021 22:17:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6536FF8016E; Wed, 20 Jan 2021 22:17:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE0FFF80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 22:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE0FFF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="ZOvI72OM"
Received: by mail-yb1-xb34.google.com with SMTP id x6so37618ybr.1
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 13:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IBjwGH28dTZFZ+0OPl+TZ2IqlpdR5VzAH0qANZWWi+M=;
 b=ZOvI72OM8rNwZK4BEp0xE4a4saeuRVR1EoDXC2vtVNCyvy3MR3GZnWE49ZK7E+QaHx
 r8OKTG/P6iQGIBzxaNYzrYFECbeARnd2pD7JeDRHsetxQ6n3hURSwLAHUnCpr9QeRhxU
 mfW0RA+2woTY9bAddGl9vaVDxrvv5vzXbEd26dWDjhM3SupmqXepxP2zB6oWZQX+9zrv
 L9yaz3CyIJMzxSQU5hikK4ezWYHPBJpB8ZEEAK19FoWi67oBgaRPNGfBoRw8mnrhsLQO
 iezlYb4C72CEiyQ1Ho9HAZj8VP3HyPm7ztDjJLbu6zaNwBhgF5j8WmLOby49RLOLLNk2
 2u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IBjwGH28dTZFZ+0OPl+TZ2IqlpdR5VzAH0qANZWWi+M=;
 b=hlSyOvjVrR9upIS6i3mzD1IVbi0+KbfeCRfTUGZdfDegPrF7Z6s4Vvf776Z5IZaO5B
 JRWEy55gwTllpws2ey10VZmr3eQK30XHsOMkLu9wz+abZJbitQnzVFkZqbwy9Ay4yG8M
 /QXUvNwZfgPnwgKACRbonfmYIQuEYlQVDaN3GWzaIZgmvQx8Y322R0ZAgiufS27sNf6q
 oVI5GJNSoGqVoxhdOI7v9Erv50HaMMwRfodCLLaSxpNOeDagWFGsfVV9YkVOIASbagm7
 7cFARXujG44Jg9gQWpbZmehygqdcS6ibkVKOJM5frMZzS276xQn75xlCbjlf/Q77wTAY
 edHw==
X-Gm-Message-State: AOAM533l1NYXGCvjIyOfBrHRHS3Qp3A5Bqe+t/Dsb62xxk2Mmh1AmBVc
 LvOWIDzFHnJDqKrcVmOqMLzl/779jxYTpqmhAcoWMg==
X-Google-Smtp-Source: ABdhPJxb7TKV9mTIdVB+asWdgjy6hAI9Xpzqegb77nfD5o7zbzgJwVXBAsYs88DFSqjvn9AxtSFuNcZByWCXHWfwJZs=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr16736389ybp.314.1611177466739; 
 Wed, 20 Jan 2021 13:17:46 -0800 (PST)
MIME-Version: 1.0
References: <CAHXb3bdk71ivJUp9HBRccDvd8SD2F1uFdsC_FxUjhh5zpcQobQ@mail.gmail.com>
 <s5hr1mik7vu.wl-tiwai@suse.de>
 <CAHXb3bdt6mgUcZ0+MH1i7QeYF03MSwx=kad-YBBNeVjqoH=KhA@mail.gmail.com>
 <CAHXb3bcFM0BswbuTe=6vP6JRd=TOf94Gu0FPAZmXT6634bCiAQ@mail.gmail.com>
 <s5hr1migiie.wl-tiwai@suse.de>
 <CAHXb3be9EpEtaEc0iH06wmLMhyizkV7arvgxsT2bWK=aJHKVLA@mail.gmail.com>
 <s5him7thpoz.wl-tiwai@suse.de>
 <CAHXb3bd8zHFmHxDp=4dNKa90eAT568yCwTWo_5L0Zry1EY45UA@mail.gmail.com>
 <s5hczy1guto.wl-tiwai@suse.de>
 <CAHXb3bfUv7QzvgOmtV3LxJXaY=Uk+pKhWZmU0M+YkgB0kNrXmA@mail.gmail.com>
 <s5ha6t3el07.wl-tiwai@suse.de>
In-Reply-To: <s5ha6t3el07.wl-tiwai@suse.de>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 20 Jan 2021 13:17:35 -0800
Message-ID: <CAHXb3bcucvF63itp6+R8aC6hByBJs4AorQg5KAa1YkunCB89tw@mail.gmail.com>
Subject: Re: Support for NUX MG-300 USB interface
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

I spent a fair bit of time debugging the code setting/getting mixer control
values, and I can't see anything that seems to be operating incorrectly.

Unless you have any other suggestions, I'm going to admit defeat and return
the audio interface.

It is probably worth committing the clock selector patch - it at least made
capture work, and it may help with other audio interfaces.

Thanks for your help,

Mike



On Wed, Jan 20, 2021 at 6:33 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Tue, 19 Jan 2021 18:40:04 +0100,
> Mike Oliphant wrote:
> >
> > Your mixer.c patch does get rid of the RANGE errors. No change to
> behavior,
> > though.
> >
> > I'd already tried setting "implicit_fb=1" even though I didn't expect it
> to
> > work, since there is a separate feedback endpoint. I just tried it again
> - it
> > doesn't seem to hurt anything, but it doesn't help either.
> >
> > Capture seems to be working perfectly with the clock patch - I'm not
> sure why
> > I was initially getting noisy input.
> >
> > I checked "/proc/asound/card*/pcm*/sub*/status" during playback, and the
> > pointer seems to be moving forward as it should. All indications are
> that the
> > system thinks playback is working fine.
> >
> > One interesting piece of information - alsamixer shows two stereo outputs
> > ("pcm" and "pcm1"). Not sure why there are two - maybe output is going
> to the
> > wrong one?
>
> You might need to unmute and increase both.  The first one should be a
> master volume/switch while the second one is for the stereo channels.
>
> Naming the mixer elements properly for USB-audio is a really tough
> task.  Many firmware don't set the right strings and a guess work
> doesn't fit to all.  But certainly there are some rooms for
> improvements there.
>
>
> Takashi
>

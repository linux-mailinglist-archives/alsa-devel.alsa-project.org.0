Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D65A1398D59
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 16:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 558A016F4;
	Wed,  2 Jun 2021 16:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 558A016F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622645087;
	bh=X5auVTS94vBfB1clkIIudubRgJ6nlTwf8s+YDqaanLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sd1WXHSpbv0Hm5AbbyPc7x2TtOYbIhjVr0Wqi0TYLE/o/9EJ/tv0IufhrpqX6FoLp
	 XV+cbP/8SbOXADhIcQbM6MJn5XIh0NMY5hfsoX1GaC/RmnJCQV2HVExVDZxqKKlhwk
	 M2IdtyqvGx4fx6z/AHOamzc4GNh0Dzfezi5FLOZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F33F80425;
	Wed,  2 Jun 2021 16:43:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58696F80424; Wed,  2 Jun 2021 16:43:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED8BAF80273
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 16:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED8BAF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HlWzmkBv"
Received: by mail-ej1-x62d.google.com with SMTP id g20so4333189ejt.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Jun 2021 07:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=asmhKT8Xu8vvlH7hmjEtXyIqg+xK/DCROaP6WgVKpIE=;
 b=HlWzmkBvNTpIJ/E0bwSNmoRzaZ4JpQE53kJHVe2dw2SzExR/f4wHbtPQEWjtca1/Sh
 OnJ6B1FL+/iN0Hmh+kQa9x8iGGxYeLqIan/2hAzD8i9V9EpMtjuSUnN7NAwaOuxmlpA7
 V4H+aGoBGbmw1O3ajPUDuglVqoY3LPZ1PJJSpU1mZK8P6CKfN7B3NSupo1ID0i89OC2z
 Fv08NM0nDAT03osPC/pfSOKJnMYxV3TInye321avjb31qjrEWK/mYEbDvIQc3HeaNBb8
 aHEsS4gGEM8shnWfqjjnSoYuXGQZ1vrGPjpY/wTgsS1lLkc/Insei9J0tk61h4p1DUcK
 b9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=asmhKT8Xu8vvlH7hmjEtXyIqg+xK/DCROaP6WgVKpIE=;
 b=E552APSN70R5jyup+WxDCRRqGlJPSUdHNUwnCy7Lce0vMzJZR3rYcsjCToMDEm7VlS
 03h0K3Z1ft/rKjYwi3UENM+8t5YB1ZpA+YCkpEtL0o0mb4Gx/nsV0vGgE2dZ08pEVokU
 kblEj1sBUlD8ZWjZhaqWKOnBgSI7omWmDiyBdQAatXu5zEkFN1L+QBW3JJjwVN/JhMQc
 rJ1jrCBEKqC8SRXdVFV1sKsHrEZpwp3fXnn4XSIomJZhJO6gKtYqlmvb51RZewkV/b21
 RWOJz6R/RKHFGUv27L0dHsQwa2VZ0EXfrLrpdsiH/PEk8esZV+wntQhtBgk6lAzX9z4S
 Mk2g==
X-Gm-Message-State: AOAM533foOH7zn9OW0bBeeF6im3XBe3R/irGXzsdoy44QnpoVRbwDjeh
 kGnPCQaM0xAQYzgWeTkXoig1llYmWeztWVNlGHQ=
X-Google-Smtp-Source: ABdhPJx5CM+Gpez16wZqwedSTYQ2NSEG7h7QE4YR6YTYLeJx9k2NA5IHHabZAYskx25lp+LPCZ4ZHKZ2Yt9MFtQtmlk=
X-Received: by 2002:a17:906:35ca:: with SMTP id
 p10mr411541ejb.535.1622644981795; 
 Wed, 02 Jun 2021 07:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QUDYbzkZXnDzf2P4b4Qk_kBQ_9ZVL3B4jhe9Xf2rgtpGA@mail.gmail.com>
 <5c3fbdf8-bfa3-a50e-edb9-81fbce84d9cb@perex.cz>
In-Reply-To: <5c3fbdf8-bfa3-a50e-edb9-81fbce84d9cb@perex.cz>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 2 Jun 2021 22:42:35 +0800
Message-ID: <CAD-N9QVRgzbWUc+SM2-XX5-vwCiZrOE9MgAEKCO8Czo-15P_yA@mail.gmail.com>
Subject: Re: [syzbot] UBSAN: shift-out-of-bounds in snd_timer_user_ccallback
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 pierre-louis.bossart@linux.intel.com, allen.lkml@gmail.com,
 Joe Perches <joe@perches.com>, romain.perier@gmail.com
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

On Wed, Jun 2, 2021 at 10:19 PM Jaroslav Kysela <perex@perex.cz> wrote:
>
> On 02. 06. 21 15:18, Dongliang Mu wrote:
> >> Hello,
> >>
> >> syzbot found the following issue on:
> >>
> >> HEAD commit: 5ff2756a Merge tag 'nfs-for-5.13-2' of git://git.linux-nfs..
> >> git tree: upstream
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=17872d5bd00000
> >> kernel config: https://syzkaller.appspot.com/x/.config?x=770708ea7cfd4916
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=d102fa5b35335a7e544e
> >>
> >> Unfortunately, I don't have any reproducer for this issue yet.
> >>
> >> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >> Reported-by: syzbot+d102fa...@syzkaller.appspotmail.com
> >>
> >> ================================================================================
> >> UBSAN: shift-out-of-bounds in sound/core/timer.c:1376:23
> >> shift exponent 105 is too large for 32-bit type 'int'
> >> CPU: 1 PID: 10368 Comm: syz-executor.1 Not tainted 5.13.0-rc3-syzkaller #0
> >> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> >> Call Trace:
> >> __dump_stack lib/dump_stack.c:79 [inline]
> >> dump_stack+0x141/0x1d7 lib/dump_stack.c:120
> >> ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
> >> __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:327
> >> snd_timer_user_ccallback.cold+0x19/0x1e sound/core/timer.c:1376
> >>
> >> snd_timer_notify1+0x243/0x3b0 sound/core/timer.c:525
> >
> > The root cause of this bug is in the snd_timer_notify1 [1]. At the end
> > of this function, it calls "ts->ccallback(ts, event + 100, &tstamp,
> > resolution)".
> >
> > Here the variable event is 5. It adds 100 and is passed as 2nd
> > argument of snd_timer_user_ccallback.
> >
> >>From the variable naming, the 2nd argument should an event, and in the
> > range of event enumeration. In fact, 105 (event + 100) is out of this
> > range. I don't quite understand the meaning of adding 100. Any thought
> > here?
>
> It seems that the original intent was to move the event to the M... events:
>
>      SNDRV_TIMER_EVENT_MSTART = SNDRV_TIMER_EVENT_START + 10,
>
> So the added value should be 10 which should not break the shift range (8
> /resume/ + 10 = 18).

It seems you are right. Then event should be between
SNDRV_TIMER_EVENT_MSTART and SNDRV_TIMER_EVENT_MPAUSE.

I double check all the ccallback site, only snd_timer_notify1 invokes
ccallback with event + 100, others seem ok.

1 timer.c snd_timer_notify1        515 if (ti->ccallback)
2 timer.c snd_timer_notify1        516 ti->ccallback(ti, event,
&tstamp, resolution);
3 timer.c snd_timer_notify1        524 if (ts->ccallback)
4 timer.c snd_timer_notify1        525 ts->ccallback(ts, event + 100,
&tstamp, resolution);
5 timer.c snd_timer_notify        1092 if (ti->ccallback)
6 timer.c snd_timer_notify        1093 ti->ccallback(ti, event,
tstamp, resolution);
7 timer.c snd_timer_notify        1095 if (ts->ccallback)
8 timer.c snd_timer_notify        1096 ts->ccallback(ts, event,
tstamp, resolution);
9 timer.c snd_timer_user_tselect  1782 tu->timeri->ccallback =
snd_timer_user_ccallback;
a aloop.c loopback_snd_timer_open 1137 timeri->ccallback =
loopback_snd_timer_event;



>
>                                         Jaroslav
>
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/core/timer.c?id=5ff2756afde08b266fbb673849899fec694f39f1#n497
> >
> > --
> > My best regards to you.
> >
> >      No System Is Safe!
> >      Dongliang Mu
> >
>
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

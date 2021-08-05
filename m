Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075C3E206C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 03:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 636111716;
	Fri,  6 Aug 2021 03:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 636111716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628211924;
	bh=Zdjxi4Fa3+ypzllJ/AyX6+tXVRJghFv1IfDBReY0s4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RAxQFQlRKKqwuCZmASAOyimtWpffasGW8ZvsKCwj3ilrv+/jA+g2bGoZGTh5AVmgJ
	 uK0Orx7/hZ+lmINSPrqxGy6M2j2SySlr6PjtsW+8if/+AAt+OEWe+e9uw6z5zKq6H9
	 eAd6CCT9xL6hiJSAr3/Sl9xNitnad6inC1dMauVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCB77F802E8;
	Fri,  6 Aug 2021 03:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2597F8027C; Fri,  6 Aug 2021 03:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62F19F80169
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 03:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F19F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MjDYXRch"
Received: by mail-qt1-x82a.google.com with SMTP id e15so2637211qtx.1
 for <alsa-devel@alsa-project.org>; Thu, 05 Aug 2021 18:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zdjxi4Fa3+ypzllJ/AyX6+tXVRJghFv1IfDBReY0s4E=;
 b=MjDYXRchkMHR1K5FB/rmmwE8O1/Ig0ZpF2+r6THxJtWckbXWrh8lBX57SAvayQHw/X
 P84k1I9/gj+P+RSPgR/1FmAPof0p1wPjgKcWI34IJFAVrGO7V5ozPkk7vfPUqWi0yoO6
 IS1uJtTDqV1jipDSFiGGs3hmV/khlOtPZGReZsrRiqrK78uWc8Ve46v5qGkAka8R+rD0
 0Xv8SirP0FGqBBDgr8CibvMdH/jCVQn65oStCqnGImutvKiu1l4VN+BwWWpumB7nONy4
 lTpyew+8vYjn3VHcPR/PFegdxeKwHbyEhuCpEEg5OiZMhqUE/NZx1MB/9Jdb56zjLcGR
 +w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zdjxi4Fa3+ypzllJ/AyX6+tXVRJghFv1IfDBReY0s4E=;
 b=SJoHGWOK5sEa1tvsZBnu4hYxeDGjDgVHd5WqmeCRrN3A/LfHq1xL0aNHm8ycg9k9Pt
 QUoKN6UXOiGeE/V2g3x8bup58Rh8Tew1g+ngQgs3iFH+vj3E9x0MkIbY3Us5ODu7MzWW
 J8PKGxwoavz8A9a+T2bBy2QPTkSZI3S9GPD/OCKubKYqybKP5bW7jxLD6M6eKehGbQ4t
 M+ijgtLi4eDNT/kt7MBkRPiriIF4GaTG64S0IipfGhNtbKg/btGJB0oPLeNf2K6QtBpf
 L9BquU0GSrgPp/kXgSN4pb1sObxbh4bn4wTzxNHeO7uNF+kff40v5+MNtWvyhfvrBmGI
 HMkw==
X-Gm-Message-State: AOAM531Ynq2cXEaayPGmfSt0JpwIzypGQPBr1JjQvM0/gFSCiqZhZ7QS
 AOrDtGomwUWweCQBmQsLnMMvq4tHPkVgoasQDGc=
X-Google-Smtp-Source: ABdhPJzYF7AHiMBuo/3+tXUl+VEji15oVKcEHzNU1d9kup9ThZgSbEolru+V7969gCh8x5het/lQclWXFd1jwExT/Ok=
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr6804098qtc.229.1628211828611; 
 Thu, 05 Aug 2021 18:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
 <20210805075401.21170-1-chihhao.chen@mediatek.com>
 <CAEsQvcsvbJdgvAOxkv_kbLohGi676Zrgz4XSFW2o3CWU3Q68Dg@mail.gmail.com>
 <CAEsQvcvJeAXoVE9FE9vsKNvXMaQYgHZBoPyKfZLT=UA-4BMe_Q@mail.gmail.com>
In-Reply-To: <CAEsQvcvJeAXoVE9FE9vsKNvXMaQYgHZBoPyKfZLT=UA-4BMe_Q@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 5 Aug 2021 22:03:39 +0000
Message-ID: <CAEsQvcvArDwA9aeAm-FN6f9-G0HM0tNDRxXvX9roFQ1koqQKrg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 Takashi Iwai <tiwai@suse.de>, damien@zamaudio.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

Chihhao Chen,

Since you're the one with the hardware I believe the bug report for
Samsung should be done by your side.

Maybe Takashi Iwai has somebody in mind that develops audio code for
Samsung and has already contributed to ALSA?

It's best if Takashi Iwai helps you out, and you take the shortcut to
the corporate structure, otherwise the importance of our findings may
be underestimated.

Chihhao Chen, please include the following link in your bug report to
Samsung: https://lore.kernel.org/patchwork/patch/1466711/

I'd politely remind them that the headset requires a very specific
quirk to work with recent Linux, that the patch has entered Linux-Next
however it's a workaround because the headset is apparently breaking
UAC compliance when it sets both Clock Selectors at the same time,
regardless of what Clock Selector we tell it to set via USB Control
Message.

But you're free to do as you wish. I'm sure you'll be fine.

Good luck,
Geraldo Nascimento

On Thu, Aug 5, 2021 at 11:31 PM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Em Qui, 5 de ago de 2021 12:50, Geraldo Nascimento <geraldogabriel@gmail.com> escreveu:
>>
>> > There is no noise and I think this should be a firmware bug.
>
>
> The fact that there's no noise during the echo test itself doesn't mean it's not a firmware bug.
>
> It may just mean the MIC is able to support both 48KHz and 96KHz.
>
> Because from the log we see both Clock Selectors end up selected to pin 1.
>
> Thank you,
> Geraldo Nascimento

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF8B2FF3C3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:06:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D91C21917;
	Thu, 21 Jan 2021 20:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D91C21917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611255960;
	bh=dM1pb+hMbhwKUZYUYqCjtWKXmtN9QxxVtoGu6P5MJv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtAnOcyQq/Y5vPj9cIyN4huOaxwXN14WGyDpzBiGhCzJnc5xcXNRFFVf8OA4BJiBc
	 vBqaOZJW/AtaWzt+X8V71+vtFOMD/jWGQs5VG2D72H6lkhalxHL6KfARpLh7guEs8A
	 A7+WHED+PL9ucw3QAb7qXWTEap3408p8pITGFd5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BFFFF80125;
	Thu, 21 Jan 2021 20:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E107AF80257; Thu, 21 Jan 2021 20:04:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 395A4F80164
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 20:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 395A4F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="p+QJx1MU"
Received: by mail-yb1-xb2d.google.com with SMTP id y4so3098580ybn.3
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VzMbmvBVtAxJ7cAWgSDzIW95eBIABf1FC/pR6q198XE=;
 b=p+QJx1MUTo12CD1SjAI2u4qnxzRu6mgeJKPqOCzan8AoZyCN5TfncKLEYP0LE1Gq9m
 mTv9NyrwlYgJMP5W8Bg2WRhEl92yCr+Gtme5a1yrQnield20jRes6CZ/nagS2oNQcKUf
 TBqX/AxJ2SBC2eER1Zjbtjdw40TnhNlkWwfSJraYgd79pJLqzqmu50jscdY74tI52HBL
 3eYMtyNO7GQfrt2iQrdTdi9G3BTjk7Nn3EM/sM8Maqa5BWDJ/GETXryE83FWU+w59yda
 fpfQF8hYa7/g1Gft8Pyjqk4dJSQvTUzirC6W9HClvECsqcfAImi+oF0hVBtD81Q6zxyV
 wZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VzMbmvBVtAxJ7cAWgSDzIW95eBIABf1FC/pR6q198XE=;
 b=oXK2lFuGd7RrKccraqJjKuBcoR+/k5iz0bq/7bdKTX5ZxmCFVKk3c1kz2WQh1TPYHj
 H/YMrZFHTGiTLQ0Yim8OWNqeH1+uJq27Xk7QxonbTSzuQ6KuZ4UDslcSVQEYEyZqxMLh
 QZ4LLZc2UNVVJPUuyG8HdiR3OfCZ5DJNTJgntFBza6WL9t7rJpZf2lEGFIKshNTuKZUa
 LuZz21nELVEoSaTDIynZHWU88s8D8hr+Ars0FCCz1doEdEh/Slo6Er0WlxyRxapfvFOQ
 apJg8qHFlIlWagJ1O0sSK9lTOLeAYpqsZfXa2VmHgqsdh1A1PychIme9mBaOVDz/zNY/
 N72w==
X-Gm-Message-State: AOAM532mpTSpm++Hx8JEj9w02t1kkuTodEMIQ3JzKts5wXmcGsgfbKGG
 Qvy9xtfN4jQGGkiZxwZP6EbCKAJxDYAZBdlaUfeju+1JHNzQ2g==
X-Google-Smtp-Source: ABdhPJyEo2KfsbxKNTYuRv/70ALQ46BLGxQihHVE7reKunTPWGAn7XJVAHuTCL0SkM7NXPR6295rXU3djQ0g+emau98=
X-Received: by 2002:a25:1002:: with SMTP id 2mr1133055ybq.410.1611255858086;
 Thu, 21 Jan 2021 11:04:18 -0800 (PST)
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
 <CAHXb3bcucvF63itp6+R8aC6hByBJs4AorQg5KAa1YkunCB89tw@mail.gmail.com>
 <s5h4kjbcmql.wl-tiwai@suse.de>
 <CAHXb3be5Va8_K9YmObjTg+KGH3HZO9y_L4YrXvprbMY5J4fpsw@mail.gmail.com>
In-Reply-To: <CAHXb3be5Va8_K9YmObjTg+KGH3HZO9y_L4YrXvprbMY5J4fpsw@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Thu, 21 Jan 2021 11:04:07 -0800
Message-ID: <CAHXb3beukZJ=r6dDS3fxd8MBtkFqt=qEFwHwRPhVgAJZXTzMrA@mail.gmail.com>
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

As a last ditch effort before returning the device, I tried the clock patch
on a Raspberry Pi 4 running an older kernel, and... it works.

The kernel version is "Linux raspberrypi 4.19.89-v7l+" and is from late
February 2020.

Maybe a change between then and now broke something? I know there have been
a *lot* of changes since then, though...

Mike

On Wed, Jan 20, 2021 at 1:47 PM Mike Oliphant <oliphant@nostatic.org> wrote:

> Yeah, I tried every possible permutation of mute/volumes on the mixer
> controls.
>
> Thanks for submitting the patches. Maybe someone else will have better
> luck down the road.
>
> Mike
>
> On Wed, Jan 20, 2021 at 1:38 PM Takashi Iwai <tiwai@suse.de> wrote:
>
>> On Wed, 20 Jan 2021 22:17:35 +0100,
>> Mike Oliphant wrote:
>> >
>> > I spent a fair bit of time debugging the code setting/getting mixer
>> control
>> > values, and I can't see anything that seems to be operating incorrectly.
>>
>> So, even if you unmute and raise both mixers, it didn't help, right?
>> I took a look at the lsusb output, but I couldn't find anything else
>> suspicious.
>>
>> > Unless you have any other suggestions, I'm going to admit defeat and
>> return
>> > the audio interface.
>> >
>> > It is probably worth committing the clock selector patch - it at least
>> made
>> > capture work, and it may help with other audio interfaces.
>>
>> OK, I'll submit two fix patches.
>>
>>
>> thanks,
>>
>> Takashi
>>
>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F82FF5B5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 21:20:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D87C6192F;
	Thu, 21 Jan 2021 21:19:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D87C6192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611260434;
	bh=uCD9A9OtYpK536FA726NOs2BTV5vnt2Ii/0/T8Kmws8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nEq3JAGb9iu7POE0BP5UkmQswwFdCzYiKf2um/0MkEF/PC5EE6l3quQfv52/ESQlQ
	 PNaZOLK8UyQguOPkryJEOvB8hCXZdgWhEiEeZvNZf5D1TZKMRwDHKYbBdC0L6CBstf
	 lmk29kjQJb1vcFAMBvzX/yatX7757DqbI9Gw4Eiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6655AF80255;
	Thu, 21 Jan 2021 21:19:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 421EBF80257; Thu, 21 Jan 2021 21:19:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8BC0F80164
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 21:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8BC0F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="zS5Ouq6d"
Received: by mail-yb1-xb30.google.com with SMTP id z1so3295479ybr.4
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 12:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9bycxjG9sbNJWV6i2hBE3g/Zn3eE2n25TNxu1BmJieE=;
 b=zS5Ouq6dp+NFHug6PRuszyTT07+1lHXULLCZau0tAfI51aNe9SYeGaxVyfg6TGRVzU
 ggJ3g2bYyFiXWlVaA2hS+948aFu4qMCSRGcahatxOJ2unlWC88UlbDjh7UB52UYaybPb
 W3Zbe8Rp6Lg0OG0ECOqOB/X10IQLD1EHRJ7Cplu91F2eTvf6ElEvlVe894POgb+gTrpy
 ojFZSZ5MMPLj0gTCvpp5AiURo70Kfg2oUwvhwy+sVkoVRSdQxlm2hN+wD4Y19pPVikzw
 Zcm39EZy/r6yf+U//FuEU6odNNniTLB6UOKH7mBN8EzL9jn0p9zU8WOpqTBTQheNkJfh
 8m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9bycxjG9sbNJWV6i2hBE3g/Zn3eE2n25TNxu1BmJieE=;
 b=EMja8mEOHFkmgYz0MMhKBsVDLuXcUKigvWCnj+jAyZ0o0Jhnu/2XuGW7jvZOUTU8A3
 5EQpKj2y4qGi6szSjEuF17b4i7CPH+M2LLtVAxdCUymfOdXaN3ZvQqUZ6pg3dGk6OOCT
 VsSG26JLA8MWpspoI/Jpuh8jLNpzkhbOgKBdnkrM+oBoNYGyzfRL5gOm87VV8j2V5I1F
 aNA+pJCrm+0OIKp4rCHQlrZztpK17yqFMURe0+cxrcodwk6Lgcma7SD6CipuA+NfJyp0
 lXX7ioPSQG9RpHbFEp4oeqygBtGyQHUrOMXWEY3B370udVCcPRqaFy1RayVBi3Joh5rL
 XlWg==
X-Gm-Message-State: AOAM531dIt+ujjo8ZMUmc6Dtyark9p1S4PPKcRD4aQVnDlE92gDEO13B
 grV4AFUVRMMcpisvLcc4tXI+dMH7TmscnOtL4pg+zw==
X-Google-Smtp-Source: ABdhPJy3oEpqYUxmsqmSXzb9iPQKZbaHJZdKb83x3a4cGdUt7VflVQeVR1G5wxS/1YiViSoV5oeu5bNP/4BAnknl1f8=
X-Received: by 2002:a25:e64c:: with SMTP id d73mr1675191ybh.160.1611260329089; 
 Thu, 21 Jan 2021 12:18:49 -0800 (PST)
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
 <CAHXb3beukZJ=r6dDS3fxd8MBtkFqt=qEFwHwRPhVgAJZXTzMrA@mail.gmail.com>
In-Reply-To: <CAHXb3beukZJ=r6dDS3fxd8MBtkFqt=qEFwHwRPhVgAJZXTzMrA@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Thu, 21 Jan 2021 12:18:38 -0800
Message-ID: <CAHXb3bd3VUH0pJB+tQjD96ePFHUEFBOa_3ameJ=dC-g8M5bf4g@mail.gmail.com>
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

After some more testing, it seems to be working inconsistently on my
Raspberry Pi. Sometimes it works perfectly, sometimes only capture works,
and sometimes only playback works.

The behavior seems reminiscent of some of the problems with implicit
feedback devices which have now been fixed.

Mike

On Thu, Jan 21, 2021 at 11:04 AM Mike Oliphant <oliphant@nostatic.org>
wrote:

> As a last ditch effort before returning the device, I tried the clock
> patch on a Raspberry Pi 4 running an older kernel, and... it works.
>
> The kernel version is "Linux raspberrypi 4.19.89-v7l+" and is from late
> February 2020.
>
> Maybe a change between then and now broke something? I know there have
> been a *lot* of changes since then, though...
>
> Mike
>
> On Wed, Jan 20, 2021 at 1:47 PM Mike Oliphant <oliphant@nostatic.org>
> wrote:
>
>> Yeah, I tried every possible permutation of mute/volumes on the mixer
>> controls.
>>
>> Thanks for submitting the patches. Maybe someone else will have better
>> luck down the road.
>>
>> Mike
>>
>> On Wed, Jan 20, 2021 at 1:38 PM Takashi Iwai <tiwai@suse.de> wrote:
>>
>>> On Wed, 20 Jan 2021 22:17:35 +0100,
>>> Mike Oliphant wrote:
>>> >
>>> > I spent a fair bit of time debugging the code setting/getting mixer
>>> control
>>> > values, and I can't see anything that seems to be operating
>>> incorrectly.
>>>
>>> So, even if you unmute and raise both mixers, it didn't help, right?
>>> I took a look at the lsusb output, but I couldn't find anything else
>>> suspicious.
>>>
>>> > Unless you have any other suggestions, I'm going to admit defeat and
>>> return
>>> > the audio interface.
>>> >
>>> > It is probably worth committing the clock selector patch - it at least
>>> made
>>> > capture work, and it may help with other audio interfaces.
>>>
>>> OK, I'll submit two fix patches.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>

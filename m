Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B44252FDC0D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 22:49:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4709617F9;
	Wed, 20 Jan 2021 22:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4709617F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611179390;
	bh=ojHWopJcjYilzS8B+Ta4P8ErngFG3wusl2vlqyPzOLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EXpHgh5hoYGEdUErIYwpYcmugfd3hGEck0iizc2b6M2YyzcAOh+0Ul4OcJXY0lOjH
	 Cf4hlNA35bNYBEGxTh8WU/28DYP6Zmtu5XN2s9bKHndKyb593wVXImzq5Mb8hlo6z8
	 jpJbNLO/VfR63auENlqdVvSqrRKonFhzGZY9kyHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC27F8019B;
	Wed, 20 Jan 2021 22:48:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3AE0F8012C; Wed, 20 Jan 2021 22:48:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 846A2F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 22:48:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 846A2F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="h2V3gMe4"
Received: by mail-yb1-xb2f.google.com with SMTP id b11so63073ybj.9
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 13:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gu+e6+Bcq3f9l/61UEZ0DuRBwRxOWeBI9gnHzb+uhhI=;
 b=h2V3gMe4wL7NzosITl/HJYhsruDWb4z0NSbhAzyfH0hyVrWhXsrfXA0LjTOPTOMhYI
 pm3K11Re3vAtW+0lHSYJiaXHb/xrH6JRhEF0nYBK9RcNrn3o20UBo8MUo/kFJhPRXbJl
 RrurZ6ta3GINEkRbTRVZ7RKQdbusIsSqGvlAlabK7pb4PY4l2cP2bm48wm10lDQwHqnk
 GRJUZEh52qy0HyOwO8rJiaNcvOr0+PTeLaNWvlxpsb3bnhScI2b7acnYXJZqbAMl5WS3
 BwOV0mlmfRW7pAE+6MVVNzSsR5x+opIlcSUEOdopB6Kizk/Qgg+qVliFmSTg6IleJp4R
 xCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gu+e6+Bcq3f9l/61UEZ0DuRBwRxOWeBI9gnHzb+uhhI=;
 b=RVcJ2avBxmNuxMhEapVGFfVCtxrprXHEsNPCA9pEP0rcHbir6bRs89A/QwmBhgh4WH
 yoYzJJPevQ0TYSC9Gbl9xu/EDNjdlAydJFY21KW7rYMhSDUFcULjxAYa6ingQ++gNBVD
 w1BR6CUtT3jOqDJHBQr+rjkl8Dt6DjbBQKhJlaTnQlaFzzmjiCYS2YVpqjAiEPBPSTKb
 0xH5RkIOXp2D1qh3DXGV7IaEUv4cmorx4IYLzX7wUi9qL7ViAmuHrNVZJ0V9jK953mR1
 z1FeiY0hx2FaL5A2LhSOPeM9y7zHy1WFQczDJ3c4xbSxdwk4MPwiwAbcsH4MaQlZinTb
 YYxw==
X-Gm-Message-State: AOAM531FxF6UjKZGcVLlsnMVKvEXC+BC29RSBfuUi0IOR0fsz15xfH2K
 Z7zf9ZBLyPqxXjiNgRaDK1Hv+S8yZIqLtlTrXor6ZA==
X-Google-Smtp-Source: ABdhPJzPa8yK3auQyR/TBNcfESjnPGmafZoH5ZHNSdy0oSQi/2J8Xd0/tjy7TM01q+vTCKXWt7AUkXEXiDS2DyrLkHs=
X-Received: by 2002:a25:2a56:: with SMTP id q83mr16726302ybq.144.1611179284363; 
 Wed, 20 Jan 2021 13:48:04 -0800 (PST)
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
In-Reply-To: <s5h4kjbcmql.wl-tiwai@suse.de>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 20 Jan 2021 13:47:53 -0800
Message-ID: <CAHXb3be5Va8_K9YmObjTg+KGH3HZO9y_L4YrXvprbMY5J4fpsw@mail.gmail.com>
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

Yeah, I tried every possible permutation of mute/volumes on the mixer
controls.

Thanks for submitting the patches. Maybe someone else will have better luck
down the road.

Mike

On Wed, Jan 20, 2021 at 1:38 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 20 Jan 2021 22:17:35 +0100,
> Mike Oliphant wrote:
> >
> > I spent a fair bit of time debugging the code setting/getting mixer
> control
> > values, and I can't see anything that seems to be operating incorrectly.
>
> So, even if you unmute and raise both mixers, it didn't help, right?
> I took a look at the lsusb output, but I couldn't find anything else
> suspicious.
>
> > Unless you have any other suggestions, I'm going to admit defeat and
> return
> > the audio interface.
> >
> > It is probably worth committing the clock selector patch - it at least
> made
> > capture work, and it may help with other audio interfaces.
>
> OK, I'll submit two fix patches.
>
>
> thanks,
>
> Takashi
>

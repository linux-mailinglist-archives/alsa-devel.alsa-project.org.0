Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D36342193E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC214166A;
	Mon,  4 Oct 2021 23:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC214166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633382775;
	bh=QWd+8f+EJvv9dAmehsUxw/qocktDJu/mZ3LZdW1r/CE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eUBPcAl6icqkMDXP+piAtGsxzLLC9R9j/skhDc1wDg4Sim49baDPB1RhANomQYNQj
	 I9HcgvHzCYuPQE4/h2B3s64gLitv01O1jSD+T3x6AwrTckJuDHpZ3BkB/9fhWPYtjh
	 Cuf6hNluZINciFoguEEKxijciBA9ZnRQHN92qZKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6710DF80249;
	Mon,  4 Oct 2021 23:24:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E73F80240; Mon,  4 Oct 2021 23:24:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0AF5F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0AF5F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XeKdDYey"
Received: by mail-vs1-xe2e.google.com with SMTP id o124so21320312vsc.6
 for <alsa-devel@alsa-project.org>; Mon, 04 Oct 2021 14:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D9WOH7fNPsnwUlDbqjOlG5MZnjj/cAEIIuiZLgSOMx8=;
 b=XeKdDYeyo4OKUK3Yc2FXU2XiJtApv+GN8Wlo6HGqlM5unY6eR4IwDN7Y7szfWwhtcT
 XbGP0seeGZE7fpwJu4wAx9VSFEW7MvATJK8yGrqMprSwT+RliPgH8OpGvpBHNaz2AUQc
 CU3N7hSzmf/LNe+Y5pRTig5TNUT0PXFwtOfeMIOEoVDWIpCG+nrDWHKdAkCQrD4g7goi
 X+AqeSi0k8L5LIU40OSxVodH135jhnU1vJvlaJ+dlxn7czqVieSmulg+kkYNL6aHjhlz
 Ir7aRitQ/bd8JzXLWdzqr4lg2m38QrQCvJj/u54WbGVlmmLo6l3eUvGGa+g/ivvfer+w
 lt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D9WOH7fNPsnwUlDbqjOlG5MZnjj/cAEIIuiZLgSOMx8=;
 b=3cTIQNIsp0y2MSPWrtoq8STzRXdmDohzRgurDa9v4s462MiDLZM/1ZT3bOS57WK6oU
 xpKbkKJLbgtiQaG8fReF9IFzSJ5YKtBbgA3nJPdXfDpeemqiE9lHzy9/5XB0QbYUltuV
 lJZ1tSeyRsBP5J+nlGpqbNYYTruH8ngeiRwaIbOgPHurhgorkm1r+iCKPQbqYtTXq0LE
 3OBzInZ0RPa4JjFotVLOQMHBURnt8+FuS9ebX9Al/C5+vPoh3PT95nDWKv1MU37s6RUA
 gBKStDuklU2aQjw8zgC2iC/Ef3tEzEfJ0UOV63SdPfsAghLlV9dYH5l4OFEAgwMzcIxT
 OiCg==
X-Gm-Message-State: AOAM530j6X9k9mS4VHXssCQwSoiikiWcRjIKZwS46LFPnfwEnTUxOTvX
 GCik3GxwSw33VteXnxNdb3c=
X-Google-Smtp-Source: ABdhPJxVgl9bahNDH4aHjlm7RvjNG3kIQzYUi8cjcJa2azUvjNRVFTbqwdwuqwNBoacNjFzUWmUO+A==
X-Received: by 2002:a67:c81c:: with SMTP id u28mr15539326vsk.36.1633382688769; 
 Mon, 04 Oct 2021 14:24:48 -0700 (PDT)
Received: from geday ([2804:7f2:8280:9a0f:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id r11sm8301997uad.7.2021.10.04.14.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 14:24:48 -0700 (PDT)
Date: Mon, 4 Oct 2021 18:24:47 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Zhang Boyang <zhangboyang.id@gmail.com>
Subject: Re: [BUG?] Setting (start_threshold > stop_threshold) makes
 snd_pcm_writei(a_small_buffer) XRUN immediately
Message-ID: <YVtxH4b3iBYX4juF@geday>
References: <0b00ad37-41a3-f078-6600-d3580ad903a1@gmail.com>
 <YVeawIksIf1wKa2s@geday> <YVevasDJYHjIxwjg@geday>
 <YVfj7SA4uhYKWTH6@geday>
 <9bd7f88a-d2a3-b064-2ca7-7305012ef679@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bd7f88a-d2a3-b064-2ca7-7305012ef679@gmail.com>
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

On Mon, Oct 04, 2021 at 05:48:49PM +0800, Zhang Boyang wrote:
> On 2021/10/2 12:45, Geraldo Nascimento wrote:
> > On Fri, Oct 01, 2021 at 10:01:34PM -0300, Geraldo Nascimento wrote:
> >> On Fri, Oct 01, 2021 at 08:33:23PM -0300, Geraldo Nascimento wrote:
> >>> On Sat, Oct 02, 2021 at 01:31:12AM +0800, Zhang Boyang wrote:
> >>>> Hello,
> >>>
> >>> Hello, Zhang!
> >>>
> >>>>
> >>>>     I'm using ALSA to develop an audio-streaming application. I try to
> >>>> use start_threshold and stop_threshold in combination with small
> >>>> buffers. However, I think I probably found a bug about this.
> >>>>     I'm setting start_threshold=100 and stop_threshold=50. I'm also using
> >>>> a buffer of 44 frames. When I call
> >>>> snd_pcm_writei(the_small_44_frames_buffer), pcm state came to XRUN from
> >>>> PREPARED directly. I think this is a bug because the stream hasn't
> >>>> started. It's hard to say a xrun occurred while stream not started.
> >>>>     I'm wondering if this is a ALSA-bug or a misuse of ALSA. A simple bug
> >>>> test program is attached.
> >>>
> >>> No, I don't think it's a bug. You're bound to run into problems with a
> >>> period size of only 44 frames.
> >>>
> >>> Moreover, working with the code you provided, I was able to get a RUNNING
> >>> state without XRUNs with a period size of 4410 frames (100 milliseconds of
> >>> audio) but I had to comment out snd_pcm_sw_params_set_stop_threshold() for
> >>> it to work or I'd have those instant XRUNs.
> >>>
> >>> That's how snd_pcm_sw_params_set_stop_threshold() is supposed to work by
> >>> the way. It creates a XRUN once the threshold is hit.
> >>
> >> Oh, and snd_pcm_sw_params_set_stop_threshold() is a little
> >> counter-intuitive. The threshold you give the function is compared to
> >> the available free space in the ring buffer, not the filled space.
> >>
> >> That's why lowering the stop threshold makes XRUNs more likely...
> >>
> >> Thanks,
> >> Geraldo Nascimento
> > 
> > Zhang,
> > 
> > I was able to make your code work in the end, even with 44 frames
> > writes, which is unadvisable since it eats too much CPU specially if
> > they are low-end like the ARM64 box I'm writing you from.
> > 
> > The trick was to use high values such as 500000. Lower values such as
> > 250000 were enough to trigger XRUNs in my machine. Of course you can set
> > it to -1 and it will ignore XRUNs but that's a bit like setting it to
> > 16777216 or 4096 * 4096 which is a hardcoded limit in alsa-lib, I
> > believe.
> > 
> > And plainly ignoring XRUNs may sound bad under load, believe me.
> > 
> > Thank you,
> > Geraldo Nascimento
> > 
> > 
> 
> Hi,

Hey there, Zhang,

> 
> Thank you for your reply.

It was my pleasure.

> 
> I realized my mistake about the meaning of stop_threshold. The 
> stop_threshold should be (bufsz-50), where (bufsz = alsa buffer size). I 
> fixed my code and new code is attached.
> 
> However, the problem still exists. I'm trying to minimize audio latency, 
> so I must use a small buffer. In fact, the problem is not related to the 
> absoulte size of buffer, but the relationship between the size of 
> start_threshold, stop_threshold and the buffer. The problem still exists 
> even using manual start mode (i.e. start_threshold>bufsz).

Sure it's the relationship.

If you insist on using (bufsz-50) you will get those instant XRUNs
forever.

Try using ((bufsz - frames) + 1) and enlarge your start_threshold
to at least 264. Your original code works for me with such values but
your mileage may vary. If you get XRUNs, play with the threshold values,
enlarging stop threshold and/or enlarging start threshold.

> 
> Currently, I'm using a workaround. After PREPARED or XRUN'd, I manually 
> buffer incoming audio frames, and when (n_buffered_frames >= 
> start_threshold && n_buffered_frames >= bufsz-stop_threshold), I write 
> them in a single write() call. Note that the write must in whole, any 
> short write may result in immediate XRUN.

Clever. Reminds me of the workings of the new low latency mode recently
introduced for snd-usb-audio. I haven't been able to test your revised
code but that's certainly something you'd like to keep in your codebase,
to deal nicely with eventual XRUNs.

Thank you,
Geraldo Nascimento

> 
> Anyway, Thank you for your advice. Have a nice day. :)
> 
> Zhang Boyang


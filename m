Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBC3BA75E
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Jul 2021 07:21:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA3E816B6;
	Sat,  3 Jul 2021 07:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA3E816B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625289704;
	bh=TMrCfQzf63WP+2SYXqo81DyFNmpQqmeg8EW+3eKqf/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=klb9rf/N9kNVGLs/JEjaz0gF+dup/0rOczu7feUh436IKKJvIdzS1N5QEcA2jnWG0
	 cQWsQYxTxuS7oVkLSXbtIqx55/FEyqZvU8ligpkY+l0hGItcLfIcQgQ/15o+sJlDiZ
	 w4XpJ684sj2bebHL4BMwCQblQHn08wB/z8XnpGEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E10CF800E3;
	Sat,  3 Jul 2021 07:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 301F0F802D2; Sat,  3 Jul 2021 07:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8950CF8003A
 for <alsa-devel@alsa-project.org>; Sat,  3 Jul 2021 07:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8950CF8003A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="IbgKjuAU"
Received: by mail-lf1-x129.google.com with SMTP id bq39so9490849lfb.12
 for <alsa-devel@alsa-project.org>; Fri, 02 Jul 2021 22:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KkfFTkzroMO8Y2mqblgJTM4E3vzwDhk0iOI4E+0+OLc=;
 b=IbgKjuAUouHslaagWFyCZqxDjb97ZR8kFEGVsb1bHBBCGtieQxou5HnOJZku7amyPh
 1NOiHSsfWhVdoWvC3lxP2nxpHbNV3xPKUrpPYdH3lF/qxB9RSvo7IprypXYET+ET1voC
 HDH9KD4zv3pg6Fm7Tpke4Ugz87TYGfmELTjnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkfFTkzroMO8Y2mqblgJTM4E3vzwDhk0iOI4E+0+OLc=;
 b=ZNZOGYwHcFpWgPu+ixE7ED1bUbF5iCtQyql8a/w6NaXMZbLfkvxj8j4iXTOZma8kUa
 pwAOJw3ipIbO9Wiw58qIIG6svon6uC+BYCjyXJq3AEsfI+6Bj8K/l8F2LZpLoNySlcqI
 od3I21ry52ciraNTHQywnsRh0FYOrX5I1M6k32DjkOFA6dcKSZxRxxHOf9oB/BXB0b0p
 jo2llO2pTepcGCaTCriOO+/fCSjHZUbQBbaJHa+CcizEEYe9Z7aPH/nR7xV4cAoQfnBW
 l3c0yHhsfEQml0KxbYU0LWKufaCOcBUGoiCmv9GsD/Z34VUDmpLLO9BK3xeVVDe3Bn/U
 sfLQ==
X-Gm-Message-State: AOAM531RytX87r1S0XzksxZ06kHiQ69Z64dUo6qcfTjtkEe0LGDyNQdL
 h6aL7vHxf5vWfGdTJN3P2Fqg9EBG5RELXIpAlLk=
X-Google-Smtp-Source: ABdhPJxOKyana0gjkWkKqXIdTdepGp9B/+bvkcWc0O+nmuuCM2OiUat6dEsBMRtLpLk9dVQEk+T1Zg==
X-Received: by 2002:ac2:57cd:: with SMTP id k13mr2400534lfo.260.1625289603475; 
 Fri, 02 Jul 2021 22:20:03 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id b3sm452095lff.138.2021.07.02.22.20.02
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 22:20:03 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id r16so16379950ljk.9
 for <alsa-devel@alsa-project.org>; Fri, 02 Jul 2021 22:20:02 -0700 (PDT)
X-Received: by 2002:a2e:2201:: with SMTP id i1mr2239632lji.61.1625289602554;
 Fri, 02 Jul 2021 22:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <s5hbl7li0fe.wl-tiwai@suse.de>
 <CAHk-=wiTwX5mzzEcw3jk3QdW600Hntt=Ehgoyz8K-VU8zbEmBg@mail.gmail.com>
 <CAHk-=whhDWDsVz12mhKtnS6DG-GzVWxBk2XjoOp=gwNJ7T0bTw@mail.gmail.com>
In-Reply-To: <CAHk-=whhDWDsVz12mhKtnS6DG-GzVWxBk2XjoOp=gwNJ7T0bTw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 Jul 2021 22:19:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wisOVeVpH42f6i5qW1gxtYxbRJQXvpt=mdVx+8p=w-yMg@mail.gmail.com>
Message-ID: <CAHk-=wisOVeVpH42f6i5qW1gxtYxbRJQXvpt=mdVx+8p=w-yMg@mail.gmail.com>
Subject: Re: [GIT PULL] sound updates for 5.14-rc1
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Fri, Jul 2, 2021 at 9:37 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But I thought I'd report this as a likely candidate.

Confirmed. The watchdog hang bisects right down to commit 9ce650a75a3b
("ALSA: usb-audio: Reduce latency at playback start").

And reverting it on top of my tree also fixes the hang, so it's not
some bisection fluke.

I have no idea what is actually wrong with that commit, but it most
definitely is the problem, and I have reverted it in my tree so that I
can continue merging stuff tomorrow.

                 Linus

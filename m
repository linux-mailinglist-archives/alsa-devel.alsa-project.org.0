Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACB14243FE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:23:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86F8C844;
	Wed,  6 Oct 2021 19:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86F8C844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633540986;
	bh=SCRjV6Xq8dnBHMnH3Cb3M1o6GrflW6Wh6FrN8DhFfUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HROf1/XxNGRBIyCXuXs9mmmYAtQnvyKy1P5lvGx5rZON9o012QKvmtSUVab4nhnlY
	 7iD+xMjQXrN5EOU+Uz/Vu0y0UZdpPxkWfU2iI52bk5Ri0ppZVii2kPFHigmrf+Y9bD
	 w+iwsYIq3K4guZQmHTTA/KL3ryGxSQBJlW7PxqBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E674AF80249;
	Wed,  6 Oct 2021 19:21:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F8D0F80240; Wed,  6 Oct 2021 19:21:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6633EF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6633EF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lx/Kw0cF"
Received: by mail-ed1-x534.google.com with SMTP id d8so12596904edx.9
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 10:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zf0GDu47Yzju5hihM5KzzImrVAe/BDCIuU/sDOojTik=;
 b=lx/Kw0cFW+j/UR9z5BxYuuPMKm4IGT3+2GSY5P8Ycar4BSc99Vmgh+tritVrAbqHZV
 2ysVdsgmAcBwIA3G9az19hp0GSADLiRm8SsMXJ+nQopmhByRPs8W+H0MrXJMeNbNLtyB
 QeWpO6idxuEq+EPtbss9LT4QrhV6RIadomM1VnE7MVl1gaodiNL1U2pRqJGQABJN4I1s
 QJgAY7CHVfi67tIX1YC+JbAC+KebrCo4tcP8H4PHrlJJ7E0qUbTS1hjWdQ7fEqv0UdOP
 kd68BLAz4ibkDCHbdPlbVAiYnMSEm2+ayHGktlKBuXFjKaUOeCEKXAGb3jWSPJpeD/m4
 OwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zf0GDu47Yzju5hihM5KzzImrVAe/BDCIuU/sDOojTik=;
 b=utgVaAFjzeFQ5zMipgPipkX9i0eU3hW7Y8LHI4c3BouYpizU0p57U9YyW7SgZl7Jrs
 /8wCtIkoF3mLk2PkGhVCQnAj1EGH7jkyM3/IfZF5UYKKoSsMypJ3Wkf7xrlFpu/qPHgb
 I11c/DfuIL2MFEfO9/gTAgf6OGhbk7vQaKZnslif5e3OekKaRR5oYAAj9nGHsTWEWx92
 6OITXIfvEQB8BjYASJnxFhw1iP3B6/DQSTdy+YQVudEr5I2jVpmDTp703hBJApkAP8M4
 jKpmioBqBQGRTf/ET9fEBlYminfLNxj1VZRW8Gez6kTvYNJG0tfdGna0p8rqPYR8BjZ4
 6thg==
X-Gm-Message-State: AOAM530RbrGDdhz1tH6VWht8nVLNSkvW9cXU+1YpabxXdrCsyJmqdf4I
 OBtvnhyo5eVR9JPxnTg15ZRuW0HIFMWmMPX4NIw=
X-Google-Smtp-Source: ABdhPJwSCgZPxAWtHp+De7FxfRYpZ0D/pJg2sBTp8/KWM0NcXeFmgFcjBYvMULeP8eBDQwNkaFZ1cezotHEaO5aqsv8=
X-Received: by 2002:a05:6402:358a:: with SMTP id
 y10mr34846711edc.238.1633540902830; 
 Wed, 06 Oct 2021 10:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
 <20211006150451.16561-3-andriy.shevchenko@linux.intel.com>
 <2d190513-7ac4-731c-7c9a-1f60a98f6345@linux.intel.com>
 <YV3NZnb6mg43nUC1@smile.fi.intel.com>
 <015e084e-70ed-7b5c-b103-8426ef0842d4@linux.intel.com>
 <999a1046-864e-2b47-6f44-6e8e42528b18@redhat.com>
In-Reply-To: <999a1046-864e-2b47-6f44-6e8e42528b18@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 6 Oct 2021 20:21:06 +0300
Message-ID: <CAHp75VfYZgXb-h-smW5hMGSkw5RBmv6mTYnoszhY+0Zqqk6z-Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5651: use
 devm_clk_get_optional() for mclk
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Wed, Oct 6, 2021 at 8:12 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/6/21 6:37 PM, Pierre-Louis Bossart wrote:
> > On 10/6/21 11:23 AM, Andy Shevchenko wrote:
> >> On Wed, Oct 06, 2021 at 10:51:52AM -0500, Pierre-Louis Bossart wrote:
> >>> On 10/6/21 10:04 AM, Andy Shevchenko wrote:

...

> >>> I don't get why you removed the test on the BYT_RT5651_MCLK_EN quirk,
> >>> see below it was designed as a fall-back mode. We don't want to return
> >>> an error when we know the clock is not present/desired.
> >>
> >> Why should we do a unneeded test? When we switch to the optional, there
> >> will be no error from these CCF APIs. Besides that it drops indentation
> >> level and makes code neat.
> >
> > By looking at this code only one cannot really visualize that it's a
> > no-op. I personally prefer to see explicit intent rather than have to
> > dig hundreds of lines below what this clock is optional.
> >
> > I am also not even sure that in real products this clock is actually
> > optional, the default is to make use of it:
> >
> > #define BYT_RT5651_DEFAULT_QUIRKS     (BYT_RT5651_MCLK_EN | \
> >
> > and the only platform without this clock is "Minnowboard Max B3" -
> > probably not used by anyone. I fried mine a long time ago.
> >
> > We'd need to Hans to comment on this since he's really the only one
> > maintaining this code.
>
> So as Mark wrote in his later reply:
>
> "AIUI with the clock API the idiomatic thing is that any optionality is
> handled at the point where the clock is acquired - if the clock is
> optional you end up with NULL which in the clock API is a dummy clock
> and ignored.  The rest of the code then doesn't need to worry about any
> of this stuff and the handling can only be in one place."
>
> Combined with there pretty much always actually being an mclk I believe
> that this patch from Andy results in a nice cleanup so I'm in favor with
> this. And the other cleanups also look sensible to me

Thanks!

> I would like to run a small smoke-test with both the series to make
> sure nothing regresses (should be fine but better safe then sorry).

Thanks ahead!

> Andy I believe that there is going to be a v2 to address a couple
> of nitpicks, right ?

Right.

> Note for testing I would prefer a full v2 series, even if some
> patches don't change. And I assume the same applies to Mark for
> applying this.
>
> Sending partial series with only changed patches on the v2
> send turns things into a puzzle, which is not ideal IMHO.

I'll do it tomorrow.


-- 
With Best Regards,
Andy Shevchenko

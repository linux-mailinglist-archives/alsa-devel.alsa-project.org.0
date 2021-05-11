Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F155937A9CF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CF2717B9;
	Tue, 11 May 2021 16:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CF2717B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620744347;
	bh=UWwQwTEMq5cerS85HmH8GzaI4Qq3kmAejLUwXt0MoGc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzeKe6SYkuS73GeO0FbW6YDrYj8pX0fINM+619a8e6httypBr6dpLuWcZsm+DIZ0G
	 jZSiGSYaPZ0vhJlGWX38rSnzX8J4Yh5P2yeHszQmJ5afdu63jWYH7DUFu6wWL9F0s0
	 Oc3BtyRL1hUQbxjsgGXLVG1uPolgM9o0oSYgeYB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D07DDF800E9;
	Tue, 11 May 2021 16:44:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18064F80129; Tue, 11 May 2021 16:44:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A94E1F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A94E1F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pikvPPb3"
Received: by mail-pl1-x633.google.com with SMTP id b21so10965890plz.0
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBC2p5ihKeMf1HGjAdHfxw7d7sie0dBHM2U88fiva74=;
 b=pikvPPb3zc241TwPQBu/ftn/nF90SMkMFXM9Yfn0ed2jvmIQ1ZSQeLXrtv1lg4j/NS
 AhVaAsCzk9FpYmzDGDh/Ma2ZlzTWSqJTqmYj+QFQX9/Kur0QszpOupXkwfm4sQ9Msp3f
 Ds+SFJngqaBD+QHFmcFUbGWxqNqmEyQzd4YQMmHN2Td5CPwfyM2pBXyXVsyZmc9a7R7f
 CLt1aaAKqj7DkfFu95ygHRx67Uqaqi3xjjcxhMffjl4T1HpW8LBhKK6Or1L9ZFjMPVHB
 vmbsHKmeVBwaPg5vsrvlB4kQjNnghoFBs5TpS7VJ5g+hNog6Z/dod7mWHlDE8O+qzr7Y
 TFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBC2p5ihKeMf1HGjAdHfxw7d7sie0dBHM2U88fiva74=;
 b=rDgWOlnq4e7mV03vQcb2y7rSa7UWiD2RfsxHBHDz2b1sko3NF05xqhb0oEQdJypDF2
 7jW6FQv4rzVHf3Xsd8Q1tv+XUA+PolFWu7QmLvzGpszddfbx8VwHZraBPWXCa0mXg7pT
 NbfUr8yz58zdTASpYznc1i8n/S0ioXNjyuAlJeriFvkjgvg9d1pa8vBWjMG97fGrbFNw
 wcdoZe4MxKW26l7Dce+IYZOVKlMsoiefOrrnyAymwa2vQ2xGYy1PF5HM1p3frF2mPioM
 SooCjfyFGGvcjfn5oHD68BVCpEXWEI4LUhrMlei/HPfrKfr4QUcM2X8iXGq6hwlLyGUw
 ypRg==
X-Gm-Message-State: AOAM530zGJVz+RcoumbRFZX3sEQqhZDHKajpk5K0IS1a5hrl/AWPbqiA
 PWNo8WCbMeD8YmVRStkNXNq3o4prk9Umh1RxyOo=
X-Google-Smtp-Source: ABdhPJw7BO8Pi8gIIgCJtYQyji5hMrwwNMo4n4xlVAAFcT7KACAbMMyAsgd0gFbLpFA7N5JXdn9mTIhUuJVgSRzbKsU=
X-Received: by 2002:a17:902:b20a:b029:ef:463:365a with SMTP id
 t10-20020a170902b20ab02900ef0463365amr24194656plr.17.1620744253449; Tue, 11
 May 2021 07:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
 <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
 <20210511134706.GI4496@sirena.org.uk>
 <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
 <CAHp75Vca2KT4kd9zw3ECqym1rRDSg2NNbwRRVVA1L7vyD3VCJQ@mail.gmail.com>
 <YJqRBIdTlvnsCYsn@smile.fi.intel.com> <20210511142433.GK4496@sirena.org.uk>
 <CAHp75Vfh4AViMMSm6MKAGP7s_ANOSyHVDj5qG=j5YrLPjH+Y8w@mail.gmail.com>
 <20210511143807.GL4496@sirena.org.uk>
In-Reply-To: <20210511143807.GL4496@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 May 2021 17:43:57 +0300
Message-ID: <CAHp75Vc1E2ahkR6zKDT9BT6O5TH6fQPLZHKLTN7M_qqfD=EubA@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

On Tue, May 11, 2021 at 5:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, May 11, 2021 at 05:28:13PM +0300, Andy Shevchenko wrote:
> > On Tue, May 11, 2021 at 5:25 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > Please stop.
>
> > Okay, what should I do?
>
> Nothing.  Just stop sending this out until I've had a chance to handle
> the current version.

Thanks, and sorry for the mess.
v4 I have sent before had a chance to read your previous email(s).

No more versions this week for sure, and sorry again.

-- 
With Best Regards,
Andy Shevchenko

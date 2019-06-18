Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE064AAE4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 21:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 450E016C0;
	Tue, 18 Jun 2019 21:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 450E016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560885132;
	bh=uS02HBoRhCr+8I+d7tNGJHAPxa6oJPnMMdErpEhrJEw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iI0yj6cP8tM1Ppr0dYC60exvrPJgZg/ClGuNoY0RlvVsIJBpGajsulupD2v7siWEr
	 PDnsPm/UCrmqenWdA9yYwaUNttp7WSJiFz2PVLVibFpEOXJPm8syp0Rtc5jR/aGmJ3
	 tRn0BtHLtF67JZ8u2Yd5/Gx+oaAPjy3gA57LPEMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0441F8971C;
	Tue, 18 Jun 2019 21:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D3CEF896F4; Tue, 18 Jun 2019 21:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB0A0F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 21:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB0A0F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NmHlXE54"
Received: by mail-lj1-x242.google.com with SMTP id t28so643317lje.9
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 12:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u69+nLXPtFpbs6TaePvjeaTV79sjBn+0kMLOo8QV9dQ=;
 b=NmHlXE549XG+CtzrGl8FRRUnyJMBn0Ba3aS5JivNDC+A5JPz2Yu7wHyIBXn4Xp8E6V
 +tknKiyvaCuv7ze4AXJHR1qp5i7fvOJbOcw0iJuAu8/91zOGW2QYkqYeW/ZI+k12mSww
 yEB2J+NHetS/6lLWvIHXYEa6iGpBEbKM3+uhjB+46CZxoFqr6MT/QQKwf/g+FPF8/EVX
 O/C88+IQ8Ukt0L/7G3GXgQizQAp2VJqMnGDnMDKs1x3n7CHM9tmtaSJw+YQPD5aUGWei
 chsoQnxg+awKflDM5STp2/1scSzQmrXB9sZ15ScrhAFF2S0zvQ0N6eAS+i1ovwkGolRH
 5sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u69+nLXPtFpbs6TaePvjeaTV79sjBn+0kMLOo8QV9dQ=;
 b=QHXMZXnp4Q0VommK0YDQnPoKnBY52vV1GCGaaOo0LXttHfrJrHMuDEh7eHyaOPN6X3
 OhiBgmbYitmnmveAGBhPuan4PQfC/RhwmXKmrHxdK+k0LJ/YMlXWco64qYUHYNdbJhGV
 5oqXe5UOduOEWcLd7icTJytOMql+o6Z6/5EtwW6z8cJfSDzjDvexUrnzaMhkheDiK9Wa
 bGbz9avSY4eifhztqHQzQMmtQFE+7wPcHYOUnQdF48Tjx2i1dOYvbdhptrD7DDJJc7bl
 w8htSMbNFX2Ml+Xakhd9VZSO7iNcgSj+R8n288aIFSq0y2C3yb9075VECbxK7d64Q8XL
 qlsA==
X-Gm-Message-State: APjAAAWnKxdnZCWWZLzXIXMO84/kdw+JIdO2Fx8owwOBMbBHji2k1hO3
 3sVq/VbKLybSFoYoYJf25DnWabqHkWrqTbu6bYGDdg==
X-Google-Smtp-Source: APXvYqwLkpvNF/wVs3KqDx5UiSroFjYcsfziiGdNbJ6lJvw8dk/WsNpJ1kNCKjRCMErTB4agKCXbrCz8Hl94x0zS+io=
X-Received: by 2002:a2e:4a1a:: with SMTP id x26mr47206359lja.207.1560885021249; 
 Tue, 18 Jun 2019 12:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190614194854.208436-1-fletcherw@chromium.org>
 <20190614194854.208436-4-fletcherw@chromium.org>
 <4e560e12-4c20-8d5d-b3f9-587a55da279d@intel.com>
 <CAN-6NYZzMqwDaw2oDyms4P9uKFPJvuQOtGbqMWLtFV3kDyQHJQ@mail.gmail.com>
 <CAOReqxhETC9xAojXyDWLMOJ3W22Zn4GNGry44=XC=t_k7SCHqA@mail.gmail.com>
 <20190618184710.GP5316@sirena.org.uk>
In-Reply-To: <20190618184710.GP5316@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 18 Jun 2019 12:10:10 -0700
Message-ID: <CAOReqxj+9WH70P5oDN12KdDqkX8Kp18NBdTswOZSC8u=AwS_LQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ross Zwisler <zwisler@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v7 3/4] ASoC: rt5677: clear interrupts by
	polarity flip
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jun 18, 2019 at 11:47 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jun 18, 2019 at 11:12:58AM -0700, Curtis Malainey wrote:
> > On Tue, Jun 18, 2019 at 11:01 AM Fletcher Woodruff
> > > On Sun, Jun 16, 2019 at 10:56 AM Cezary Rojewski
> > > > On 2019-06-14 21:48, Fletcher Woodruff wrote:
>
> > > > > +     ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
> > > > > +     if (ret) {
> > > > > +             pr_err("rt5677: failed reading IRQ status: %d\n", ret);
>
> > > > The entire rt5677 makes use of dev_XXX with the exception of.. this very
> > > > function. Consider reusing "component" field which is already part of
> > > > struct rt5677_priv and removing pr_XXX.
>
> > > I was using dev_XXX, but I believe Curtis found that 'component' was
> > > sometimes uninitialized when this function was called, so I switched
> > > back to pr_XXX. I may be misremembering though, so I'll let Curtis
> > > comment as well.
>
> > The issue here is that the IRQ is setup in the i2c probe and the
> > component is setup in the codec probe. In theory if the hardware is in
>
> The component is not needed for a struct device, you must have a struct
> device if you have a regmap or have probed at all.
Ah yes, we could modify the struct and store the i2c device and get
the device out of that as well. That will likely be simpler. Ok lets
do that.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

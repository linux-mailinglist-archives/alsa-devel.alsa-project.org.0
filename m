Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C228B072
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 10:39:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2391673;
	Mon, 12 Oct 2020 10:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2391673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602491995;
	bh=XQa+ZKetpKNyqsXxHknqzWjiajoAzgNjasTwE2NcQhc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SP4TyVhr3HtTS9JW8EXvBTKi8kzDo0hl+WqfEeC1tqY6pijUR+KTv7LzlHYWPmuot
	 K7Grc8JCQ7nB9mIZjml3UmZQk+wlogA2ItAn+WqnR4mSsYltgBeYI/AV9u9lvtgxe7
	 LGPr68sYqqs1hKOyxfFNmi44CVbl9Nz5hX0CRf30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6923FF800D8;
	Mon, 12 Oct 2020 10:38:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10D3EF80225; Mon, 12 Oct 2020 10:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D663F800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 10:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D663F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xd3X92ep"
Received: by mail-il1-x144.google.com with SMTP id j13so11282476ilc.4
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 01:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XQa+ZKetpKNyqsXxHknqzWjiajoAzgNjasTwE2NcQhc=;
 b=Xd3X92epyOz/n6HosS67yuotOqdvqwAc0DyQgUZXzVM29qb2YmQGklwskftAbMI1WB
 V0xSeNyJWkcuWE4xwZneWuMpur+HwE8lCzXDVuu/38YY+8qa6EmJZoqKgqigW8uBuGhz
 FBV8QucPg/s0i45oRA5DLwWv1XsS6BpKYYcTOvqoJHnYqaeIF7ime7MPVOWn3bwr6y7G
 q5+eaKWbd/CKiffJdnXvRUsXnpKosjOoIWdmflfjjw+PaNfUXAl3t0YUuFHNh1K51B2g
 IAA1KHhl0LxG0InOKvqgZyJWMsZuh98fJPKGe9Ecd+FA3C62Q/lK6/f4UsDGNxT8eHE3
 vdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XQa+ZKetpKNyqsXxHknqzWjiajoAzgNjasTwE2NcQhc=;
 b=MQ2D8pYgwG8NZo3E/rGnfy/3pw0GPNmOwNxM2B/PWeiIP7Y8eIObtc162UNqreAhVu
 9ykhnhfRW4NxxdQYyNkHQFXzrWM0kTDG8zLu4rPH6k0RWIvDWgdL7EJF07WDTZrQ8NzW
 DigPg1MQQvMLLumMwdV4VDJrUkAFwn96g50rfKWWCDJSNuZvR7zihvhTHbTUKqodd8Zf
 ZugZkW+J5uqaHkvZqsNcOhmyRNYrQnkPqHd1fRzmNeS4U7iHyh5HbEqdY+j51436soMy
 B6LRJQeQTHS3wOkqhqX0TwrI4wIWk7Y8TARm99H/w3IDGw1Q8x514AGl2pFP7tsxz3NI
 RPWA==
X-Gm-Message-State: AOAM530g70a7GIHOYv3VZUowkEi2yZmMXdOsrEAZwS+g7sxfWA+6tX7F
 QRReLwDtQ+AfFRwjMzQv8bUv3ctPh8Ia6qvjbEI=
X-Google-Smtp-Source: ABdhPJwf2I6ZksAa5l2K0+Z5/QUgq9GSXoy+3KeP8yiBDlA9gK740Ri5QtRU0Oj/kCVKSoSHeGlLW2YFT1dEdVoTc1w=
X-Received: by 2002:a92:a80f:: with SMTP id o15mr18950865ilh.118.1602491876324; 
 Mon, 12 Oct 2020 01:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201011211543.155561-1-peron.clem@gmail.com>
 <20201012075013.yrpknpbrzl5f5eah@gilmour.lan>
In-Reply-To: <20201012075013.yrpknpbrzl5f5eah@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 12 Oct 2020 10:37:45 +0200
Message-ID: <CAJiuCcdg67ZN5xd58y9DmM3Ei28NPe5DSPpSgt2NY1j3rSEUVg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: sound: sun8i-a33-codec: Add Allwinner A64
 codec compatible fallback
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Maxime and all,

On Mon, 12 Oct 2020 at 09:50, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi!
>
> On Sun, Oct 11, 2020 at 11:15:42PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > make dtbs_check report a warning because the documentation
> > for the A64 codec compatible is missing.
> >
> > The A64 codec compatible is actually a simple fallback to the A33.
> >
> > Reflect this in the dt-bindings Documentation.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> This patch is already in the ASoC tree and linux-next:

I was indeed on top of sunxi/for-next and not linux-next/master

I will test on top of linux-next for the next ones.

Sorry for the duplicate patch and the noise :(.
Clement

>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/=
Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml?id=
=3Dcef305d4eb0733f25215793ed30b056a7db9bb62
>
> Maxime

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3488A1E77E3
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 10:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC70017BC;
	Fri, 29 May 2020 10:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC70017BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590739707;
	bh=qtbvRgQ992/6DwUv85jCmgMKyL1TTshvKHnzn3SRoxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z8DKgT0ALz71lR6Lc4KppRtc8Ixl00tdhneZOdYPjbbw5wVnzgjm61PnCzPRi31/Y
	 r2dhrjSYEGNSF31aHJwU9Pabv+X7k8Sy3um6Ze66QM9H9Lb1uDaEc6nh1HqC7f+bG8
	 LtPxsq0x9sgKlRO5tS91z4v+StGd/kSdAJrgKZZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2132FF8021E;
	Fri, 29 May 2020 10:06:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63A5FF8016F; Fri, 29 May 2020 10:06:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE07FF80125
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 10:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE07FF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ARuHTCHv"
Received: by mail-lf1-x144.google.com with SMTP id u16so751515lfl.8
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 01:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sOxRbojjekNIVLIANuIbdPZ8vuRLDilJnBU5D6z6Gc0=;
 b=ARuHTCHvzl5pI1r2ksiKnlv/XQf2ZuP2puBHRogWZpZ+JSDk6spsZ6+Mi0HStWbjXp
 RwKrapD/bAonIza1jawgeaHmEp75nantmy/WX1mK7jeJZz6C56ATAKBtO11qN7BECv7Z
 D0rYzXDzvdn8VtHfMOuCM8Wyun1eLSue6t6iIBOvoh6D+6PifhHsutIgZ9GyWHfHcZL/
 ZsM9igl7Uohtzye+ZVK+DQr9vz/lSscpBm3Q+fPjhFde3yFgzTtQLjWyEn0ZQr/E/Dt+
 5QRGtr2efv0o59DkZlGinPFhE2tiD4eTO6cAOT07rMGXA8a+2uMjgRXCX2Aeyfmg3j8G
 2DPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sOxRbojjekNIVLIANuIbdPZ8vuRLDilJnBU5D6z6Gc0=;
 b=LB1Deltg+ZF6L6qnMqA1Qbl4ubgZsTRaWjM22IfAfV1PA8+0Nm8LvLgMlUX2wW+nU2
 aIthGsd39F/2V4r7tPsNMv6i6DcmPSlypjvvXjAxCRHPR64d46IUIQd0WkE2HL3r+6qg
 4jpb47e16Il2a7TzUY2ACidGzm1TaIvN2liulXNLPmuFf5jANAUiZKKIjwPaS8sewXXj
 TGTVRm979qs/vhfw+xH5x4XK9y0tgGNAt0Xd123a30HuC7IHp0aivZmDqABh8u7vMz9e
 kz/yG2KdLZqalkkUBn1OYcmBqwIH/zJLP2oiCPbRgNlEWYdffplm0idJtX5Tx6Nbzu8d
 WpZw==
X-Gm-Message-State: AOAM530CtnB0svqUw0f3R8E+jS418fV+Bqoc4uu/K28lWJFf7SmgK1W6
 j2hBqpfpn6uYpknjo9fP9S6n1SsbyDRcf37zpSs=
X-Google-Smtp-Source: ABdhPJwNGmSiyiqlfKOfqM6p+BHUruML1hsN7pjim5eRRpQvgIZUZhgXAjo9nWuTkMHvfN6OZzHb0HtACLwONLoR4Lg=
X-Received: by 2002:a19:6a09:: with SMTP id u9mr3726110lfu.65.1590739596512;
 Fri, 29 May 2020 01:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200528103755.17381-1-steves.lee@maximintegrated.com>
 <20200528141542.GA4186430@bogus>
In-Reply-To: <20200528141542.GA4186430@bogus>
From: Steve Lee <steves.lee.maxim@gmail.com>
Date: Fri, 29 May 2020 17:06:24 +0900
Message-ID: <CABff4NRCfxo7MFvk72bOjPN5iJg5HaQk_U1nFpdPrJZ9nm5Jhw@mail.gmail.com>
Subject: Re: [V6 PATCH 1/2] dt-bindings: Added device tree binding for max98390
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, Steve Lee <steves.lee@maximintegrated.com>,
 ryans.lee@maximintegrated.com, Liam Girdwood <lgirdwood@gmail.com>,
 robh+dt@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Thu, May 28, 2020 at 11:15 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 28 May 2020 19:37:55 +0900, Steve Lee wrote:
> > Add DT binding of max98390 amplifier driver.
> >
> > Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
> > ---
> > Changed since V5:
> >       * Change txt to yaml and fix up the examples.
> > Changed since V4:
> >       * No changes.
> > Changed since V3:
> >       * No changes.
> > Changed since V2:
> >       * No changes.
> > Changed since V1:
> >       * Modified sample text in example
> >
> >  .../bindings/sound/maxim,max98390.yaml        | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Documentation/devicetree/bindings/sound/maxim,max98390.yaml:  mapping values are not allowed in this context
>   in "<unicode string>", line 22, column 97
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/sound/maxim,max98390.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/sound/maxim,max98390.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/maxim,max98390.yaml: ignoring, error parsing file
> warning: no schema found in file: ./Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/maxim,max98390.yaml: ignoring, error parsing file
> warning: no schema found in file: ./Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> Makefile:1300: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1299651
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> Please check and re-submit.
>
 Thanks for feedback. I re-submit with after dt binding check again.

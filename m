Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27122243158
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 01:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD61166B;
	Thu, 13 Aug 2020 01:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD61166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597273633;
	bh=6kwxpshrOlbOHxWnmXC6+dWtt2L5X/Drj58h8rpdMCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHLEePcsh38GQJUAanXN6Vy3ljY1puuOfSx0+D5HS4/izlq2gu1zux/JTXEhYVQlH
	 s7rilwZJ7vtlC6NxywqWz4uF7wKcNbGHGLxMIoJ6zX0yk+XbbDO/sVhRgszm9UyERL
	 +17x2yQRVxfSr+T0dZy+z0SF90m6MOZYB5kXEhKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B33F801DB;
	Thu, 13 Aug 2020 01:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF26F8022B; Thu, 13 Aug 2020 01:05:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3F56F80147
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 01:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F56F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pXDZRt76"
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97DB32076B
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597273520;
 bh=6kwxpshrOlbOHxWnmXC6+dWtt2L5X/Drj58h8rpdMCA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pXDZRt76CPWxVlpilBeAf66pO/Ch1+UOaSOgdUpIGMcw2xAS2mFHBEgkKJVucyrd/
 hFrdQmO7EEU0DOv8a5XHHMAntvFEpH8ijK+mCysryubzOS2R2XGypW54K9swm6SsIs
 b7zU39V5JMU64Uhe2oipgDLWWHGgSe5VXnIpigps=
Received: by mail-oi1-f169.google.com with SMTP id u24so2245588oic.7
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 16:05:20 -0700 (PDT)
X-Gm-Message-State: AOAM530IcHND624hEL8PaaQzOjYpu7Cl/S4u39N/ImRSQw+FP169Cr49
 A3y0X6tAQxa0/QPvjTovE4S84ZntX04I6T9sYQ==
X-Google-Smtp-Source: ABdhPJx2qQebZiNBPQzgE1fpdypeYG9ycnPVX3JxYluiX5nbkNkxeZlpxpCsMAonDMWnL7JIOVI286FePABwvHucHl8=
X-Received: by 2002:aca:bb82:: with SMTP id l124mr1235268oif.106.1597273520003; 
 Wed, 12 Aug 2020 16:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200812203618.2656699-1-robh@kernel.org>
 <f5dedf2d8d8057de3eaa2f9126f44cebb0653b09.camel@perches.com>
In-Reply-To: <f5dedf2d8d8057de3eaa2f9126f44cebb0653b09.camel@perches.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Aug 2020 17:05:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKBzqMHMMRwBJUjomxOpZAop_+TXBjLCb6ntwZzNMy=3Q@mail.gmail.com>
Message-ID: <CAL_JsqKBzqMHMMRwBJUjomxOpZAop_+TXBjLCb6ntwZzNMy=3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
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

On Wed, Aug 12, 2020 at 4:32 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-08-12 at 14:36 -0600, Rob Herring wrote:
> > Clean-up incorrect indentation, extra spaces, long lines, and missing
> > EOF newline in schema files. Most of the clean-ups are for list
> > indentation which should always be 2 spaces more than the preceding
>                                      ^
> > keyword.

keyword is the key part...

> []
> > diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> > index 192ded470e32..f0daf990e077 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> > @@ -67,9 +67,9 @@ patternProperties:
> >        compatible:
> >          items:
> >            - enum:
> > -            - arm,integrator-ap-syscon
> > -            - arm,integrator-cp-syscon
> > -            - arm,integrator-sp-syscon
> > +              - arm,integrator-ap-syscon
> > +              - arm,integrator-cp-syscon
> > +              - arm,integrator-sp-syscon
>
> Confused a bit here.
>           - enum:
>         10 spaces to dash
> old line:
>             - arm,integrator-ap-syscon
>         12 spaces to dash
> new line:
>               - arm,integrator-ap-syscon
>         14 spaces to dash
>
> Is it supposed to be 2 spaces more than the preceding line
> or 4 more?

If the preceding line is a list entry (i.e. starts with '-'), then
it's 4 more spaces. It's always 2 more spaces than the preceding
keyword start (aka json-schema vocabulary).

Arguably, this style is a bit inconsistent in that the '-' counts
toward as indentation of the current line, but not the preceding line.
However, I think this style is a bit less error prone and easier to
review. With the other style (always N more spaces) it's harder to
distinguish lists vs. dicts. For example, you can have something like
this:

- key:
  - foo
  - bar

- key:
    foo
    bar

- key:
  - foo
    bar

All 3 of these could be valid. Which one was intended? (Can't really
tell here, but you can with actual DT schema.)

Rob

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6274C244B74
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 16:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D5F166D;
	Fri, 14 Aug 2020 16:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D5F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597416814;
	bh=2azDCJAW0WmwzjFoNP1+Xf1baXp64Ykp/VUpBlKju0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFDmtjRvR7MG0RyzKLDgBcRPTd3yr3pOKBVX/EiU35TSrMjyBpCzlqcfVesyiLJA2
	 P1cfqiDI9EVafxk5jDSZSMLqw/RtFQysWhu29eZD7nxHDWMAyuyL9aW5Nw2Cc3QVlA
	 DA+9a5egMIHHM9/XiRkX5wCY6jNAoDEEn7Gt9LOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 307ABF801DB;
	Fri, 14 Aug 2020 16:51:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A254FF8022B; Fri, 14 Aug 2020 16:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_135,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33702F80146
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 16:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33702F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bjfRL+mB"
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA1D620866
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597416697;
 bh=2azDCJAW0WmwzjFoNP1+Xf1baXp64Ykp/VUpBlKju0s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bjfRL+mBKQdeXNIPuXX+sib3fYs2/XZWJHPOjPd4x196xwXtWkEnxkwGCGKCP+vXy
 CxGeqKP68MgYI300g+hNTJd4uQCvZb/zOsnBdJ/cEKlyynKbLGyhuMbkA+R9Y9MLDY
 rajai6Sqx8HGb8L035zTD4t0BSpxCLooD+BQeHTA=
Received: by mail-ot1-f53.google.com with SMTP id 93so7770353otx.2
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 07:51:36 -0700 (PDT)
X-Gm-Message-State: AOAM530A5fH84+GDNZDqZeMfsw1Qnudi022zX2ZQe+cuv40j0PeExAlY
 RnXj7tBoHiRzirS+M1RHGb06AHfFj8RB+HRjgw==
X-Google-Smtp-Source: ABdhPJzAQOVgwIRLTeJz+4kS8jI7uSM4yy2bV/QUkiEz2152JH8sgfiQxJMSY+wk4abg95jsoFr6h5Ymz6ZJoeFhB2g=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr1995774ote.107.1597416696235; 
 Fri, 14 Aug 2020 07:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200812203618.2656699-1-robh@kernel.org>
 <d5808e9c-07fe-1c28-b9a6-a16abe9df458@lucaceresoli.net>
In-Reply-To: <d5808e9c-07fe-1c28-b9a6-a16abe9df458@lucaceresoli.net>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Aug 2020 08:51:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKekx0VO4NROwLrgrU8+L584HaLHM9i3kCZvU+g5myeGw@mail.gmail.com>
Message-ID: <CAL_JsqKekx0VO4NROwLrgrU8+L584HaLHM9i3kCZvU+g5myeGw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Luca Ceresoli <luca@lucaceresoli.net>
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

On Thu, Aug 13, 2020 at 4:31 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Hi Rob,
>
> On 12/08/20 22:36, Rob Herring wrote:
> > Clean-up incorrect indentation, extra spaces, long lines, and missing
> > EOF newline in schema files. Most of the clean-ups are for list
> > indentation which should always be 2 spaces more than the preceding
> > keyword.
> >
> > Found with yamllint (which I plan to integrate into the checks).
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > index 3d4e1685cc55..28c6461b9a9a 100644
> > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > @@ -95,10 +95,10 @@ allOf:
> >        # Devices without builtin crystal
> >        properties:
> >          clock-names:
> > -            minItems: 1
> > -            maxItems: 2
> > -            items:
> > -              enum: [ xin, clkin ]
> > +          minItems: 1
> > +          maxItems: 2
> > +          items:
> > +            enum: [ xin, clkin ]
> >          clocks:
> >            minItems: 1
> >            maxItems: 2
>
> Thanks for noticing, LGTM.
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > index d7dac16a3960..36dc7b56a453 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > @@ -33,8 +33,8 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >
> >    touchscreen-min-pressure:
> > -    description: minimum pressure on the touchscreen to be achieved in order for the
> > -                 touchscreen driver to report a touch event.
> > +    description: minimum pressure on the touchscreen to be achieved in order
> > +      for the touchscreen driver to report a touch event.
>
> Out of personal taste, I find the original layout more pleasant and
> readable. This third option is also good, especially for long descriptions:
>
>   description:
>     minimum pressure on the touchscreen to be achieved in order for the
>     touchscreen driver to report a touch event.
>
> At first glance yamllint seems to support exactly these two by default:
>
> > With indentation: {spaces: 4, check-multi-line-strings: true}

Turning on check-multi-line-strings results in 10K+ warnings, so no.

The other issue is the style ruamel.yaml wants to write out is as the
patch does above. This matters when doing some scripted
transformations where we read in the files and write them back out. I
can somewhat work around that by first doing a pass with no changes
and then another pass with the actual changes, but that's completely
scriptable. Hopefully, ruamel learns to preserve the style better.

Rob

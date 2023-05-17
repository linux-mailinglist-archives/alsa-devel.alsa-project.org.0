Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB2706A6F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:01:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8E51F4;
	Wed, 17 May 2023 16:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8E51F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684332101;
	bh=QSLvyHDFbuTCOMWabgg4p1boZD4SUQXeyN7f5N6tsjc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IhELCEmyPIPLPe3jZtJ4y0Hxc9c4IgAi1tqNIqJk7AMDHaTRxidWaWa8W4erD8Gt0
	 FmV+DUh/j4XsqWQt7NQhvlzmCI0HREBDTUx6lbhbxuotI36jxCVDTJS1q/IrYcg82q
	 rnRUo5sHpOkDvLJvFqcWHUOaTLsckiOJUKIEq/No=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30347F80272; Wed, 17 May 2023 16:00:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C964CF8025A;
	Wed, 17 May 2023 16:00:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7488FF80272; Wed, 17 May 2023 16:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D41A3F8024E
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D41A3F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=f79+NO3W
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6238386eb9cso6545306d6.1
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684332028; x=1686924028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF/bfVMkR2h3+gHlTD2VrM3fzaZfhgR5R+8jewhi4kQ=;
        b=f79+NO3WafffxprPEUX+MpIWRo6r4PqFlcXxubPrc5PoTBP656Fn9Mcm7a2mwB5G7C
         w5UPPUw1EMxkhtW6Zv4TXzVfEg5MZrMiduqd66tOriGLtyCimkn9S3lGxNBnKtYQM3+G
         +pwFiCW5l91dJjXzmS0TzXb2KtnyyCo685VDetUFEshUciT7yPMPbB68DIrs3wtHC3VG
         3wG3jdPdkaBHkOdGh7NDRnIsj4vwiuqnHYsMfDz++4ij673rakRNl8aEW4I9PSMiTuUD
         5l/IqeFpNgqz7FYStFzg/tpoDw+DOHF0/ExUT2Fn/t9nV0oF9qRRSmsogt3yNtf+S7/o
         M0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684332028; x=1686924028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kF/bfVMkR2h3+gHlTD2VrM3fzaZfhgR5R+8jewhi4kQ=;
        b=SjyFO8WdRJGY6gkqW9EMF+kd4jwDJYkfMgjokBizQ+8N2Q3Iaqr/Q8gFyKJcevhwiN
         CQY3kxaCKciG70yrj6AJBFjgJiEnLpiOPwZKbC2cDHBbdpWuQOG5Q/c6jov55bMT+t3J
         oGg9dog7fgLPqdH4npTFm00aXdKBYTiFczzLCcMWuf1ESyMbw8LETGMQWnCZM/0Up9yS
         tbrTdgVQ1HyF/56JPAdv5EoH3RSj4zHpxn4FLGjBHlxwfVIhpWpbigklqZVVnIVWAc3N
         fdPAMsDUUcgMmn8DFkgEQ+i+eVahZrAeoQu8t0URmOj+wWIqYl89y2wAT60tkcinb8bK
         IWFg==
X-Gm-Message-State: AC+VfDyXUQY9QO6duGz9PFrZ7Q7pl0hyU3ns8/yms7BIhK+ECQ/bZOfs
	oiC7rs3XmhlxBV+2SCNDaz7MS0bftAW80vc/mGs=
X-Google-Smtp-Source: 
 ACHHUZ5dgDWb+fDdj9ateE9Q5/4olnyjZM5M0pe72NMZbgcEFxb1cJTJVSxAul4O+5JAir2aZNO7h0ejLa3/duMEZP8=
X-Received: by 2002:a05:6214:d03:b0:623:46d8:535 with SMTP id
 3-20020a0562140d0300b0062346d80535mr24128643qvh.34.1684332026063; Wed, 17 May
 2023 07:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
 <ZF6RMqElYZVMpWRt@surfacebook>
 <20230515101350.GS68926@ediswmail.ad.cirrus.com>
 <CAHp75Vcizrucc-2KFdFNeHNrxCzz4GwX1OzZYyjPH7P9RgnKYQ@mail.gmail.com>
 <20230517101301.GV68926@ediswmail.ad.cirrus.com>
In-Reply-To: <20230517101301.GV68926@ediswmail.ad.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 17 May 2023 16:59:50 +0300
Message-ID: 
 <CAHp75VchpbiYcd2yaP1WTjX17P0hg3qON5JGAXu08aDVw6Ydkw@mail.gmail.com>
Subject: Re: [PATCH 08/10] pinctrl: cs42l43: Add support for the cs42l43
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de,
	maz@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
	lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KPJTBGQEE2VEQH2QG7RCJWI3Y64CY5CZ
X-Message-ID-Hash: KPJTBGQEE2VEQH2QG7RCJWI3Y64CY5CZ
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPJTBGQEE2VEQH2QG7RCJWI3Y64CY5CZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 17, 2023 at 1:13=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Tue, May 16, 2023 at 10:03:45PM +0300, Andy Shevchenko wrote:
> > On Mon, May 15, 2023 at 1:13=E2=80=AFPM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > > On Fri, May 12, 2023 at 10:19:14PM +0300, andy.shevchenko@gmail.com w=
rote:
> > > > Fri, May 12, 2023 at 01:28:36PM +0100, Charles Keepax kirjoitti:
> > > > > +   if (!of_property_read_bool(dev_of_node(cs42l43->dev), "gpio-r=
anges")) {
> > > > > +           ret =3D gpiochip_add_pin_range(&priv->gpio_chip, priv=
->gpio_chip.label,
> > > > > +                                        0, 0, CS42L43_NUM_GPIOS)=
;
> > > > > +           if (ret) {
> > > > > +                   dev_err(priv->dev, "Failed to add GPIO pin ra=
nge: %d\n", ret);
> > > > > +                   goto err_pm;
> > > > > +           }
> > > > > +   }
> > > >
> > > > Besides the fact that we have a callback for this, why GPIO library=
 can't
> > > > handle this for you already?
> > >
> > > Apologies but I am not quite sure I follow you, in the device
> > > tree case this will be handled by the GPIO library. But for ACPI
> > > this information does not exist so has to be called manually, the
> > > library does not necessarily know which values to call with,
> > > although admittedly our case is trivial but not all are.
> >
> > Why can't the firmware provide this information? _DSD() is a part of
> > ACPI v5.1 IIRC.
>
> I am very very far from confident we can guarantee that will be
> present in the ACPI. The ACPI is typically made for and by the
> Windows side.

Why? You may insist firmware vendors / OEMs to use that as a
requirement to the platforms that would like to use your chip. The
_DSD() is part of the specification, I don't see how the above can be
an argument.

The times when ACPI =3D=3D Windows are quite behind.

> > Although it might require moving some code from gpiolib-of.c to
> > gpiolib.c with replacing OF APIs with agnostic ones.
>
> I really think if we want to start doing things that way on ACPI
> platforms someone with a little more clout than us needs to start
> doing it first. If Intel or someone was doing it that way it
> might give us a little more levelage to push it as being the
> "correct" way to do it.

So, we have the meta-acpi [1] project which contains dozens of
examples on how ACPI DSD is being used for real devices, besides some
documentation in the Linux kernel.

> I will switch to the callback, but really don't think we can rely
> on this being in DSD yet.

Why not?

...

> > > I had missed there are now devm_pm_runtime calls,

Btw, even if there is no such API one can always call
devm_add_action() / devm_add_action_or_reset() to open code such a
call.

> > > I will switch
> > > to that. But I would like to understand the wrong order, remove
> > > will be called before the devm bits are destroyed and it seems
> > > reasonable to disable the pm_runtime before destroying the
> > > pinctrl device. What exactly would run in the wrong order here?
> >
> > At the ->remove() stage after this call an IRQ can be fired (or on SMP
> > systems any other APIs can be called), for example. So, would it be a
> > problem to service it with PM disabled?
> >
> > But in any case the shuffling ordering like this is prone to subtle
> > bugs. I prefer to have strict ordering if there is nothing preventing
> > from doing that way.
>
> Yeah happy enough to use devm_ here, just didn't know it existed
> and wanted to better understand your concerns as I was having
> difficulty seeing the issue.

Ah, you are welcome!

...

[1]: https://github.com/westeri/meta-acpi/tree/master/recipes-bsp/acpi-tabl=
es/samples
(mostly under edison/ folder)

--=20
With Best Regards,
Andy Shevchenko

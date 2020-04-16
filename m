Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118241AD9D6
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BE4C1673;
	Fri, 17 Apr 2020 11:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BE4C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587115619;
	bh=lAG6zzq1Sqen9mJhj5pG0jXwK1qfgmptfKCYtqRavfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CUYnqlCLrWAEduCCxC1M93jmbkBWQO5XyKJ3PWzvppr3RkyBcJy/w5Qy/tTf8GSJb
	 7SiZfIAaXG0goptVZOehJrykvrrS1jAf43QvaOFY62oQgIEhzY5D1Xs8/xYY8Qud2Q
	 eGrx4f8VwlGbOroMeL9vzbMA9Pl5vNWCQVnOQ0mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 392CFF80332;
	Fri, 17 Apr 2020 11:16:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9257FF8012E; Thu, 16 Apr 2020 15:55:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 529E3F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 15:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 529E3F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OJtBap6g"
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E3B322247
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587045334;
 bh=lAG6zzq1Sqen9mJhj5pG0jXwK1qfgmptfKCYtqRavfc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OJtBap6gxkn7B64p6YI3gTyfG+37GXhLma2wex7puLnTvEPVIckcw2EWyHIlGxpbU
 axCPq/uLuHBCHTtrTyk9e9F01ZRfk1h5UwSfOVyg7KnEYG4Mh0g9CUMFFZUUhlg6Dn
 cKIhtKmwFJOdPx1PSLWhEzhafdvl/OQ5lWzBbqUw=
Received: by mail-qv1-f45.google.com with SMTP id fb4so2009615qvb.7
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 06:55:34 -0700 (PDT)
X-Gm-Message-State: AGi0Pub4HRZQg/dpL/JmwQ7XT1y6boaZ/i/IoQIAPA3Y04hKmJS/dAuu
 RqnldxyHgsPfLL4gMaXdvJ4HRBDnXBdLdICqdA==
X-Google-Smtp-Source: APiQypJP5/uECHnZPqCD8aDFNOvB3C1OTKaRvvNdGUWUD6LvJ9HnhAL59x+YqONzfmAtrwzd6yqnrOF4qnSJIJfw8nM=
X-Received: by 2002:a05:6214:a8a:: with SMTP id
 ev10mr9484527qvb.20.1587045333124; 
 Thu, 16 Apr 2020 06:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
 <d93f90bbcc99967ed5ba458ba99d7e73de12e3b2.camel@perches.com>
In-Reply-To: <d93f90bbcc99967ed5ba458ba99d7e73de12e3b2.camel@perches.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Apr 2020 08:55:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcJrFow_+-o2CxoPRCv4U-ELb2FHSbUgG=Mzt8PFn_CA@mail.gmail.com>
Message-ID: <CAL_JsqLcJrFow_+-o2CxoPRCv4U-ELb2FHSbUgG=Mzt8PFn_CA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 17 Apr 2020 11:15:49 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Linux PWM List <linux-pwm@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Maxime Ripard <mripard@kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 netdev <netdev@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On Thu, Apr 16, 2020 at 1:52 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-04-15 at 19:55 -0500, Rob Herring wrote:
> > json-schema versions draft7 and earlier have a weird behavior in that
> > any keywords combined with a '$ref' are ignored (silently). The correct
> > form was to put a '$ref' under an 'allOf'. This behavior is now changed
> > in the 2019-09 json-schema spec and '$ref' can be mixed with other
> > keywords. The json-schema library doesn't yet support this, but the
> > tooling now does a fixup for this and either way works.
> >
> > This has been a constant source of review comments, so let's change this
> > treewide so everyone copies the simpler syntax.
>
> This is a large change.
>
> Was this done manually or by some script?

Scripted with python ruamel yaml, but then I had to filter out all the
re-formatting (hence the first patch to cut down some of that).

> If it was done manually, how likely is it there are defects
> in the conversion?

Either way, the schemas still have to pass the meta-schema checks.

Rob

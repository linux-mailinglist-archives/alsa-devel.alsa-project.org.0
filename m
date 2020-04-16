Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0520B1AD9D7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B39167A;
	Fri, 17 Apr 2020 11:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B39167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587115649;
	bh=MMYlJuOL0lJfSjjO9OZrF5NfvXGQobqN9Rg04mTNFAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iC80R9B0qGOWvQtwoJU8en+BkBUEzno4COKu9R+eSIavRv4OlKqu0MtdmR87jz0bB
	 ej7loWCKgyULfNGuoAJulnq+7ffyB6a9pFy8nX6xggkWSHb/2ZRYlFVm2mca9odmbs
	 3qqkbEeARmZpqUPCa+WARr6CmbNIBlZH/CC+OHvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B807F80334;
	Fri, 17 Apr 2020 11:16:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1D8FF8014E; Thu, 16 Apr 2020 16:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92F1BF8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 16:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92F1BF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UpLjGQfN"
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFEAE2224F
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587047883;
 bh=MMYlJuOL0lJfSjjO9OZrF5NfvXGQobqN9Rg04mTNFAM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UpLjGQfNJ7AhEjZREeHuVboKWCCQCByhNFkhI3WqLPo8Mlcf5oIw7jZd/2OdH9yBT
 aIZAbAKEnJu3xdtXVBzL/qPq3GoSs/S1q0m4B9Y5XFUKpQPqq24X4l78b+Pj+tLnJg
 NtrdiAaH0zhwyAYQB4MpxL0IotfCh/UB+NTCxFbM=
Received: by mail-qt1-f175.google.com with SMTP id o10so16505026qtr.6
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 07:38:03 -0700 (PDT)
X-Gm-Message-State: AGi0PuZrtl5sB39nOSdZFN6VadRYr/Q6LqLIdtrIE6QHBW8EXqXowID+
 zCeSMjaLZJZE69RiRyzXi/8rdMA4Gl7I153ODQ==
X-Google-Smtp-Source: APiQypKfVD+tFYP8p52n1yv1KvQa1nwC0OwG10Vnv04PQ+j0umFoj6sJCylT4GddENC8rGvDyZyW05FDoL7hFDARgK8=
X-Received: by 2002:ac8:39e5:: with SMTP id v92mr26657152qte.224.1587047882719; 
 Thu, 16 Apr 2020 07:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416124359.GB5785@ravnborg.org>
In-Reply-To: <20200416124359.GB5785@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Apr 2020 09:37:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKYTRh-cgMQSD=DHS2aud9TnLjKepqd9z0F9Wj2oe=jDg@mail.gmail.com>
Message-ID: <CAL_JsqKYTRh-cgMQSD=DHS2aud9TnLjKepqd9z0F9Wj2oe=jDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
To: Sam Ravnborg <sam@ravnborg.org>
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
 Fabio Estevam <festevam@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Lee Jones <lee.jones@linaro.org>,
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Thu, Apr 16, 2020 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Wed, Apr 15, 2020 at 07:55:48PM -0500, Rob Herring wrote:
> > Fix various inconsistencies in schema indentation. Most of these are
> > list indentation which should be 2 spaces more than the start of the
> > enclosing keyword. This doesn't matter functionally, but affects running
> > scripts which do transforms on the schema files.
>
> Are there any plans to improve the tooling so we get warnigns for this?

I've been experimenting with yamllint some. I haven't figured out how
to best integrate it in. Probably need to start with something minimal
and warning free for the tree and then add to it.

There's also yaml-format in the dtschema repo which just reads in and
writes out a yaml file using ruamel round trip yaml parser. That's
what I used here.

> Otherwise I am afraid we will see a lot of patches that gets this wrong.
>
> As a follow-up patch it would be good if example-schema.yaml
> could gain some comments about the correct indentions.

Sure, I can do that.

>
> Some comments in the following.
>
> > diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> > index 49e0362ddc11..b388c5aa7984 100644
> > --- a/Documentation/devicetree/bindings/arm/altera.yaml
> > +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> > @@ -13,8 +13,8 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > -        - altr,socfpga-cyclone5
> > -        - altr,socfpga-arria5
> > -        - altr,socfpga-arria10
> > +          - altr,socfpga-cyclone5
> > +          - altr,socfpga-arria5
> > +          - altr,socfpga-arria10
> >        - const: altr,socfpga
>
> So here "- enum" do not need the extra indent.
> Is it because this is not a list?

Right. Indentation is 2 more spaces than the parent keyword ignoring
any hyphen in the parent.

> > diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> > index 66213bd95e6e..6cc74523ebfd 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> > @@ -25,7 +25,7 @@ select:
> >
> >  properties:
> >    compatible:
> > -   items:
> > +    items:
> >        - const: amlogic,meson-gx-ao-secure
> >        - const: syscon
>
> This is something I had expected the tooling to notice.
> I had expected the two "- const" to be indented with 4 spaces, not two.
> So there is something I do not understand.

As above, correct indenting is 2 spaces from the parent not counting
any '-' in the parent, but the '-' counts for indenting the children.

Arguably, this style is inconsistent that sometimes the '-' counts and
sometimes it doesn't. However, I think this style is better because it
distinguishes lists vs. dicts more clearly. It's easy to miss the '-'
when the indentation is the same:

- foo:
  - bar
  - baz

- foo:
    bar
    baz

Or worse:

- foo:
  - bar
    baz

Both styles are valid. It's just a tabs vs. spaces debate, and I just
picked one.


> > diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > index 07f39d3eee7e..f7f024910e71 100644
> > --- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > +++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > @@ -17,9 +17,8 @@ properties:
> >            - nxp,lpc3230
> >            - nxp,lpc3240
> >        - items:
> > -        - enum:
> > -            - ea,ea3250
> > -            - phytec,phy3250
> > -        - const: nxp,lpc3250
> > -
> > +          - enum:
> > +              - ea,ea3250
> > +              - phytec,phy3250
> > +          - const: nxp,lpc3250
> >  ...
>
> And here "- enum" receive extra indent.
>
> I trust you know what you are doing - but I do not get it.
>
> Some pointers or examples for the correct indention would be great.

With this patch, the tree is all correct examples. :)

> I cannot review this patch as long as I do not know the rules.
>
> My request to update example-schema.yaml was one way to teach me.
> (Some people will say that is difficult/impossible to teach me,
> but thats another story:-) ).
>
>         Sam

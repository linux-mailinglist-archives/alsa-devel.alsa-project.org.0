Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C215445A176
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 12:28:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9201677;
	Tue, 23 Nov 2021 12:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9201677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637666888;
	bh=ciLkM1WglrYUBKFGM9sJq3kTZXB8JDNU2K3MbL0gHlg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pv4YrwilvmGzDEio5l0bQFHK9K0UEfJPQR1pkR4tw3MkTIzR3Rh8CFSyIhCELWbfm
	 8IKu/rjEvdN02UlV9E/+LL5yE6XW6WV3Jq4LKSMFFAIhC/vzSkQgHC66dvjnUQewzt
	 wRwu6dlCIXuVcT6CnVGrXrTlDOs2ftn41Y4cBpMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20439F80087;
	Tue, 23 Nov 2021 12:26:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B77F8049E; Tue, 23 Nov 2021 09:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F01D9F80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 09:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F01D9F80154
Received: by mail-oi1-f171.google.com with SMTP id bj13so43345762oib.4
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YD9+CLUS5Xv902/pEfqOtiLcZyXas3B/t1a2ZRr+mI0=;
 b=DLuIfWgj0gs5uAHHd/qwLenmXFN+v76W6vsP4V/9qN376amj6tI7/HjAUB5pdwybi8
 aozbVr1L9LGRrQM1/a6ah6FhBXfWd7774v7yG7R1T7dML09TE6vWBxJEEb6O958pXBhB
 zuKU+OndeIzwoWGsc4lSFTNJRPigxW1SEb04a9uVqfCrW9Zqk6h366aY/VhOPHiO/8va
 Ib2SDPciUNlczBBm/d0mv5gHX6gj/5h0ajg9vfSQuNBUH3NGxmyZp5cP0ANXN159Htor
 kTSHY8mnG65vrU8abM3xgIukX3OZ0EPQJS31N7PuovgP5A4O2Td/b3wC3PTYaEm37Vmt
 pMwg==
X-Gm-Message-State: AOAM533Dpm2fEEvUDGZmwJtdKmxFAaGl02yqVXQ5CfdQrdW7cuFHsW46
 crntewVSEaHFsczca2RBJQBckwCSUDZhjA==
X-Google-Smtp-Source: ABdhPJwSY7sJsxzhg4BSXDYOP25Ncs0KtGHtYMlUC34ZtcbmQ5Dh7G8+XTuYRGiXHEEl4s2JNoRnMw==
X-Received: by 2002:a05:6808:228a:: with SMTP id
 bo10mr641608oib.72.1637656753998; 
 Tue, 23 Nov 2021 00:39:13 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48])
 by smtp.gmail.com with ESMTPSA id s9sm2139536otg.42.2021.11.23.00.39.13
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:39:13 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so14273099otv.9
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:39:13 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr6012282uaq.114.1637656742896; 
 Tue, 23 Nov 2021 00:39:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <5936f811-fa48-33e9-2a1a-66c68f74aa5e@ieee.org>
In-Reply-To: <5936f811-fa48-33e9-2a1a-66c68f74aa5e@ieee.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 09:38:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4C0EgkGXR=MwSuBOFoj7O9xx8xwH5dP8rWzN1ckejQA@mail.gmail.com>
Message-ID: <CAMuHMdX4C0EgkGXR=MwSuBOFoj7O9xx8xwH5dP8rWzN1ckejQA@mail.gmail.com>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,
 get}() helpers
To: Alex Elder <elder@ieee.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 23 Nov 2021 12:25:58 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Eduardo Valentin <edubezval@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Rajendra Nayak <rnayak@codeaurora.org>,
 Tero Kristo <kristo@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Keerthy <j-keerthy@ti.com>, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

Hi Alex,

On Tue, Nov 23, 2021 at 2:52 AM Alex Elder <elder@ieee.org> wrote:
> On 11/22/21 10:32 AM, Johannes Berg wrote:
> > On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
> >> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> >> constants.  However, it is very common to prepare or extract bitfield
> >> elements where the bitfield mask is not a compile-time constant.
> >
> > I'm not sure it's really a good idea to add a third API here?
> >
> > We have the upper-case (constant) versions, and already
> > {u32,...}_get_bits()/etc.
>
> I've used these a lot (and personally prefer the lower-case ones).
>
> Your new macros don't do anything to ensure the field mask is
> of the right form, which is basically:  (2 ^ width - 1) << shift

> I really like the property that the field mask must be constant.

That's correct. How to enforce that in the non-const case?
BUG()/WARN() is not an option ;-)

> That being said, I've had to use some strange coding patterns
> in order to adhere to the "const only" rule in a few cases.
> So if you can come up with a satisfactory naming scheme I'm
> all for it.

There are plenty of drivers that handle masks stored in a data
structure, so it would be good if they can use a suitable helper,
as open-coding is prone to errors.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

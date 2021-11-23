Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100B45B508
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:12:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEC1E174A;
	Wed, 24 Nov 2021 08:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEC1E174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737929;
	bh=6MNdNQ9eKKu8i6TIhz2Gu/lq3dZxYmOh1N/P0irb708=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLQXjEshyIyoMt5WnhWHCauNVebmA+DyNvct5e8bGrZApGMtGo+7VQOWwLCunWLZv
	 Q+SL35MgJUQLhnwCs3vMxEVZDSWeqjzrtqWmtoUxOMtvp+MFj4LM/7GlnT/HBkr5KW
	 JjXu94fhfa4rCPxESXtSNTa6m+6mKyWE64OEtGqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49E4CF80579;
	Wed, 24 Nov 2021 08:06:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F48F80511; Tue, 23 Nov 2021 17:32:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91A92F80507
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A92F80507
Received: by mail-oi1-f176.google.com with SMTP id m6so45686399oim.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 08:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V9TIRszl8dgvuwgR6nhL0A0nOi/JDggQAeXQjF3xH3Y=;
 b=JolWKgto2uK0gk6jijQxZkqxQqICLqqolbTNYc+x/5w25J1Ky+PcfXniGbXdRigSpN
 C1ENZ9fhAc442hR6ckTjaB8CYuIvfcl4vWV9Yb5N/S2qvKAmTGkI7+b/Ci5c8pzQOt2F
 Olmra/CuTTcX06Bt7dbbDwzw3rBrS1d86+49pOvZjfJ8MDg4avTf1uQsI6obfSPj/RzD
 lzX4bKzV4RfpgEfJOFcB0Y/qiYTuepPplRgX0eHh658hHGqMAcrXFSEfJP7rLKgo52xF
 7ydNRdpvwt70FpBiTctJvg+ZmzJFKb5mV894DkiMQTF7tlYrJW192XqkYUX9NBjS8wq0
 0mCg==
X-Gm-Message-State: AOAM533Rp2YvA+IA4+mK+C55Ba23eXPbwgGW63g1yZT0ld4bqb2jXLEv
 rHxo45u1mTkSbDMjtmzhDKX1JacEwzgFAed0
X-Google-Smtp-Source: ABdhPJyvVWTA7FJVLeRrt3Hyrysj/cXISWJ4fLWvQhY2g468rsvnkQwdra/DTSSviWosD2V5v+qvSg==
X-Received: by 2002:aca:100f:: with SMTP id 15mr3658949oiq.82.1637685137087;
 Tue, 23 Nov 2021 08:32:17 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
 [209.85.210.42])
 by smtp.gmail.com with ESMTPSA id r5sm2635009oiw.20.2021.11.23.08.32.16
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 08:32:16 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso34619852otj.1
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 08:32:16 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr10338972uai.89.1637685125903; 
 Tue, 23 Nov 2021 08:32:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <CAMuHMdUnBgFpqhgjf5AA0LH9MZOFALeC=YinZ4Tv_V+Y9hkRSg@mail.gmail.com>
 <12825803045d1cec0df968f72a9ef2724a2548fb.camel@sipsolutions.net>
In-Reply-To: <12825803045d1cec0df968f72a9ef2724a2548fb.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 17:31:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwhO30gy42tfGSsEgJAjDOAkQ_cUXMMiSBjMsUj0nqaA@mail.gmail.com>
Message-ID: <CAMuHMdXwhO30gy42tfGSsEgJAjDOAkQ_cUXMMiSBjMsUj0nqaA@mail.gmail.com>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,
 get}() helpers
To: Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-clk <linux-clk@vger.kernel.org>, Ping-Ke Shih <pkshih@realtek.com>,
 Lars-Peter Clausen <lars@metafoo.de>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-iio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Benoit Parrot <bparrot@ti.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Eduardo Valentin <edubezval@gmail.com>, Paul Walmsley <paul@pwsan.com>,
 Rajendra Nayak <rnayak@codeaurora.org>, Tero Kristo <kristo@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Keerthy <j-keerthy@ti.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, netdev <netdev@vger.kernel.org>,
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

Hi Johannes,

On Tue, Nov 23, 2021 at 5:21 PM Johannes Berg <johannes@sipsolutions.net> wrote:
> On Tue, 2021-11-23 at 09:30 +0100, Geert Uytterhoeven wrote:
> > > We have the upper-case (constant) versions, and already
> > > {u32,...}_get_bits()/etc.
> >
> > These don't work for non-const masks.
>
> Obviously, I know that. Still, just saying.
>
> I'm actually in the opposite camp to you I guess - I much prefer the
> typed versions (u32_get_bits() and friends) over the FIELD_GET() macros
> that are more magic.
>
> Mostly though that's because the typed ones also have le32_/be32_/...
> variants, which are tremendously useful, and so I prefer to use them all
> across. In fact, I have considered in the past to just remove the upper-
> case macros entirely but ... no time I guess.

OK, I have to think a bit about this.
FTR, initially I didn't like the FIELD_{GET,PREP}() macros neither ;-)

> In fact, you have e.g. code in drivers/usb/chipidea/udc.c that does
> things like cpu_to_le32(mul << __ffs(...)) - though in those cases it's
> actually constant today, so you could already write it as
> le32_encode_bits(...).

Yeah, there are lots of opportunities for improvement for
drivers/usb/chipidea/.  I didn't include a conversion patch for that
driver, as it led me too deep into the rabbit hole, and I wanted to
get something posted rather sooner than later...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

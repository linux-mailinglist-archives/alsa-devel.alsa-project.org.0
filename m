Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2D45A174
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 12:27:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE3E1679;
	Tue, 23 Nov 2021 12:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE3E1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637666838;
	bh=q6J6orLIRAarOhQrcA4NW9YR1SrkQ8oo3gpfsx+gE1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHMRpIsIkFh2XtfSkO1YfxBV8wr8uNJTd0kD80wGg5v41A+3SeB/fPyNuj6X3rgRe
	 bfC8oBCo7PyNM5RvOBGFcCzUCZ3qJdRYOzoGz9bL3zNWaPouVnqZmI5l7x9lkTHC/z
	 9IhSFRcbWL8WdQdircdbitl/6MP5UsqU0NdHcuuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED181F800E7;
	Tue, 23 Nov 2021 12:25:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B81CDF804DF; Tue, 23 Nov 2021 09:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E4B0F804AC
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 09:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E4B0F804AC
Received: by mail-pg1-f181.google.com with SMTP id g28so17680600pgg.3
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcMJT0SWmBGQBJ3SmOjoPLUb8FZNAvYeGhtoSVPIc5Y=;
 b=Ed9usoDpV9KOUKkf8glnVneJqOifGMgrmZJmpipD0GnQ446YJyGmf7S54ivqa0xmq+
 +DiW2I1DRBzmFI3X3qZOlh/U4o4b/5mxGUAAjrV98W80b7Ihy4S4qlhxmaiUHp8HI4J+
 BwP0J3DhV7EwlUrVntGiScdRw43QxQ17S7KR1+qf/5SoxhOSgcUA4E2MPmPJu6mJK5LS
 bqaVR6IH0c3NluXcwV4Px8As84O4IDFMTfH8pPcxzw+ulJWMQ7UVhywjEP9uDJXekhMD
 bdlOPtI3e/S4u7u91E8dzSiubcKBRX5SMRDogmK2WTeAMnXEhyYDiFcjuXb5VFDT6wPj
 SSig==
X-Gm-Message-State: AOAM5316DXmohtXS0KwoT9erNXhWTkqL34VH4LA1h3bGyJ3KBIzNPYCm
 CkLPXXfgLPQVjhRJdzinU/ZdmzjdZx9cZw==
X-Google-Smtp-Source: ABdhPJxCBRXMRQBYiemIzI/R16KhYfEcwgHwxezjPg94iLDna4d9iTuQni8bsjtAmwiLb7it74190w==
X-Received: by 2002:a63:a50a:: with SMTP id n10mr2514679pgf.310.1637656236988; 
 Tue, 23 Nov 2021 00:30:36 -0800 (PST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com.
 [209.85.210.174])
 by smtp.gmail.com with ESMTPSA id na15sm577748pjb.31.2021.11.23.00.30.36
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:30:36 -0800 (PST)
Received: by mail-pf1-f174.google.com with SMTP id 8so18737945pfo.4
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:30:36 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr5521182vsl.35.1637656225413; 
 Tue, 23 Nov 2021 00:30:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
In-Reply-To: <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 09:30:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUnBgFpqhgjf5AA0LH9MZOFALeC=YinZ4Tv_V+Y9hkRSg@mail.gmail.com>
Message-ID: <CAMuHMdUnBgFpqhgjf5AA0LH9MZOFALeC=YinZ4Tv_V+Y9hkRSg@mail.gmail.com>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,
 get}() helpers
To: Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 23 Nov 2021 12:25:57 +0100
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

On Mon, Nov 22, 2021 at 5:33 PM Johannes Berg <johannes@sipsolutions.net> wrote:
> On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> >
>
> I'm not sure it's really a good idea to add a third API here?
>
> We have the upper-case (constant) versions, and already
> {u32,...}_get_bits()/etc.

These don't work for non-const masks.

> Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
> architectures (afaict), so that seems a bit awkward.

That's a valid comment. Can be fixed by using a wrapper macro
that checks if typeof(mask) == u64, and uses an __ffs64() version when
needed.

> Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
> if it is indeed a constant? The __field_overflow() usage is already only
> done if __builtin_constant_p(v), so I guess we can do the same with
> __bad_mask()?

Are all compilers smart enough to replace the division by
field_multiplier(field) by a shift?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

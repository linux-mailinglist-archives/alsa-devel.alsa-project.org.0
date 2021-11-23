Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F545A175
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 12:27:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B17167B;
	Tue, 23 Nov 2021 12:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B17167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637666861;
	bh=IZ4vbypeQaQB/dQbC+hGbiiZiQHP8gB++uk8Yn2XNAY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xg25vBbrFZ3Q44E2G5jGOkoqvYA1P8nWrUaOQCzJ8naPfE7HWCeWBGwPP9WOB+CJX
	 fNsyZDlO38vb1IN8K8oEFOpTcHxl2qWEgYf0fqUYSSQr6qut+bxKFWhIeUE5uBd0KC
	 o9NJeciTNCpfFTAdtcbc4nfvuwwPVdiL5s7EkzyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89AC3F804DF;
	Tue, 23 Nov 2021 12:26:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E37EFF8049E; Tue, 23 Nov 2021 09:36:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41187F80087
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 09:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41187F80087
Received: by mail-qk1-f173.google.com with SMTP id m192so16660583qke.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FgjXJ8P5x6753ZmnEdNgxnrYu2hwLrUsYessbs9ojVo=;
 b=jH67CYKNLGn7J7NV6jbkEhz8dktBlKWxCdplz5h/C3IDKobm9ImDAfQZpHv4Y4JrLk
 o2FPQePb8X3achOrEtLoRgUfV/GxdTd4LMYLNNTBlMoVXfs3I6/y06V+2Atw6Mf9b/rf
 pHHz4BIV0EUDF4Rf4FPwx7kjqNHU84jcjw/y9NhtAB675WH8OZSQ8sI4rcmp5BWj7PBv
 VU5hunUz41aNW2SuGEFYJr9PHmNs3eEDlBEGv3Jdsvx1yuECfp0cuaJ8C+ssSzGy+L/M
 +DuiiTkCFbQteBDtvOa669kgOAko1OePD/INCLfxG2clt9QEdGsgPeLqjqtol6zboqCT
 Q1KQ==
X-Gm-Message-State: AOAM531kPN5NroWoUxRB8aRZKEMvuzDqFBrlTfmW2lDjRTq/1l43Mw0f
 eQFxj9TI83P+4TqdvKZILZh4q2cOilJ8Mw==
X-Google-Smtp-Source: ABdhPJzgeCHXjhZwkk5kWISqARnJL/tkaNuLaUAPa186BSnoz5l8cQ+7ZWkZZjhQBnzNfmcjkrbWGw==
X-Received: by 2002:a05:620a:1a9d:: with SMTP id
 bl29mr3032156qkb.55.1637656604348; 
 Tue, 23 Nov 2021 00:36:44 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com.
 [209.85.219.54])
 by smtp.gmail.com with ESMTPSA id b5sm5617471qka.51.2021.11.23.00.36.44
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:36:44 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id u16so14448928qvk.4
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:36:44 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr6604777vsj.50.1637656593105; 
 Tue, 23 Nov 2021 00:36:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 09:36:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
Message-ID: <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,
 get}() helpers
To: Jakub Kicinski <kuba@kernel.org>
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
 Joel Stanley <joel@jms.id.au>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
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

Hi Jakub,

On Tue, Nov 23, 2021 at 2:17 AM Jakub Kicinski <kuba@kernel.org> wrote:
> On Mon, 22 Nov 2021 17:32:43 +0100 Johannes Berg wrote:
> > On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> >
> > I'm not sure it's really a good idea to add a third API here?
>
> +1

Yeah, a smaller API is better.

> > We have the upper-case (constant) versions, and already
> > {u32,...}_get_bits()/etc.

TBH, I don't like the *_get_bits() API: in general, u32_get_bits() does
the same as FIELD_GET(), but the order of the parameters is different?
(*_replace_bits() seems to be useful, though)

That's why I picked field_{get,prep}().

> > Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
> > architectures (afaict), so that seems a bit awkward.
> >
> > Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
> > if it is indeed a constant? The __field_overflow() usage is already only
> > done if __builtin_constant_p(v), so I guess we can do the same with
> > __bad_mask()?
>
> Either that or add decomposition macros. Are compilers still really bad
> at passing small structs by value?

Sorry, I don't get what you mean by adding decomposition macros.
Can you please elaborate?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

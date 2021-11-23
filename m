Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E9459ED4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 10:05:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 116761686;
	Tue, 23 Nov 2021 10:04:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 116761686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637658303;
	bh=h98rL4dhUtB6qNqwMAP1oZsptqxsodAOucKvqEUUwlI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eOPBzfcdIBveZbCKusfTlHBX8avRmS+Po89bObuX83OxsKK+jT73pIh1MbKlTEYIL
	 tWIhyzzJTfhDafc2k4wWyFT3Lm+oEqveRMIL8FlIOgifbjJa5bUoQlA3Si2VSIMC3b
	 TYXxteFzhnqrxoQ+aipSISggd7bgUV49EEyf0ouY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78C1BF80430;
	Tue, 23 Nov 2021 10:03:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8549F804EB; Tue, 23 Nov 2021 09:20:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B27E2F804E6
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 09:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B27E2F804E6
Received: by mail-qt1-f170.google.com with SMTP id a2so19107584qtx.11
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EqDPz0+moIASV8/u18qtwgFpVhcXgwVMGWtajI5MBd0=;
 b=7lnNqgwsY06/y8dwcCJTWG2wyXcV1IXA/3KeJYp+7eZe94jgr44mJu4Rmf5wy4rGm2
 P4krC5oQ9OL/QDV3L9b44gw1NCE0TB/N46thdV+Tng/RKim3ZprBuCmOyMxL5otmCzD+
 v4iOIcfGa9ajtmkL4/UiKwzfPcnD9V/85ufYru8C5xt1BlND2qyNZezf70bu4o6GCE/V
 UyWtSh90nAKoFrF09cJySGmzyw7eeag7yDGCAou7O8+8SYoGY3bMKra7ggYIAbDSh5RH
 mhq9wRYlOdm2pZoK8OsjXDEJuro4/Qo8aN09Y/ZVM3ZJbckMZ+P++auQ3AlJCdSu9UC+
 hcXg==
X-Gm-Message-State: AOAM530QPbN14hCrMHIASdmASoC9ZJxOrOqMTfFTnH6gkE8+FvHdTtt0
 97ZDCPDQKgK6xrLjSRBngi3JV+KtjL8o0A==
X-Google-Smtp-Source: ABdhPJyBIZWJPDEq6AYNnRrxqO+jao36IiE4eAFMCp2C6tcc7DnAczMj57TMwWll1PCQUT4d4CA57Q==
X-Received: by 2002:a05:622a:1002:: with SMTP id
 d2mr4119312qte.322.1637655645970; 
 Tue, 23 Nov 2021 00:20:45 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id p1sm3616885qke.109.2021.11.23.00.20.45
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:20:45 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id x32so21145350ybi.12
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:20:45 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr5954157uar.14.1637655634916;
 Tue, 23 Nov 2021 00:20:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <YZvYW1ElW7ZYZNTC@piout.net>
In-Reply-To: <YZvYW1ElW7ZYZNTC@piout.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 09:20:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKHoBWm2XQmKwB0q8Ya8KzpCgA29D0igXJrGY8=3e8_A@mail.gmail.com>
Message-ID: <CAMuHMdWKHoBWm2XQmKwB0q8Ya8KzpCgA29D0igXJrGY8=3e8_A@mail.gmail.com>
Subject: Re: [PATCH 00/17] Non-const bitfield helper conversions
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 23 Nov 2021 10:03:22 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
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

Hi Alexandre,

On Mon, Nov 22, 2021 at 6:50 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 22/11/2021 16:53:53+0100, Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> > To avoid this limitation, the AT91 clock driver already has its own
> > field_{prep,get}() macros.
>
> My understanding was that this (being compile time only) was actually
> done on purpose. Did I misunderstand?

Yes, it was done on purpose, to maximize type safety.

However, this imposes a severe limitation: we cannot use them in case
the mask is non-const (i.e. stored in some data structure).  This
is a quite common use-case, given the examples I found and converted,
and given you added field_{get,prep}() to the AT91 clock driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

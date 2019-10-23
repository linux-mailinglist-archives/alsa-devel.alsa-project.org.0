Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1972E1DD5
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 16:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9EF1666;
	Wed, 23 Oct 2019 16:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9EF1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571840056;
	bh=NaZeH6FG3a+rpmZCXlvCTpMGS5I4hPmxHewAcrruqNU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1b2UTv4QDzQW/SqwOScpjkSV/GJet1A1XwmMez1Z0h8ZMdN3uTa8b9ta0klzEHSE
	 AV6IKsKHC70SXKZfz2XyWA9qIwR3mb+WIwMTQgNaNRRQAA9Wb9S8dSGNtf/rTbqIHX
	 bnEEIyPXnTmu05j2ORRt1nErQHzWMpJ4S3ZwOz+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2EC2F80393;
	Wed, 23 Oct 2019 16:12:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B26E3F80368; Wed, 23 Oct 2019 16:12:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9683CF802DF
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 16:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9683CF802DF
Received: by mail-ed1-f66.google.com with SMTP id q24so9896043edr.10
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 07:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rcTMyT1DxjA7fFrS2w24JzXu+0SnoZwJUx+ToqxoQbY=;
 b=XPzf37/aB31AgLnS5XuzItTV+t6df81s917fLzC47mcbFKWLoqlEHsAmuQPJcd8Fio
 GBc8aZGCNEakETP6fhPsZVDtSi3PvTkFeJsWjqMYuvmLu4dc+EhAxf0hT+QrM8uOk4XT
 AHIQhb0LTYRNz5PTI1xghlEaXAGeA1wiytpPyxtMrc7F02hMzdjBAPH32Skjk18f6gSt
 t6QupY/wuFg5c3qw6SmzJD+TT3pQ1yB6lffWn9ju9WRiLMbDF9hAni/nOfQdnJFV9SUh
 VbBaOHIMHSdwxRVQPe8SngP5iLYCd9xrn0xyrOvqgrlVk61G/+8lBV2NF0dji1pGcCAA
 HfDQ==
X-Gm-Message-State: APjAAAXwaSzj0qSKwlsW/SNeoNxAViv34O9TGdUJIx69uGtd2eCAncRL
 /y4696vmA7FFZD2IIkaB/9w=
X-Google-Smtp-Source: APXvYqxkd9DwWDZi/qHKDFHlMK0H8AlyVBKbEwPxz7lMmEqyzeKCvZ18JbP/k1gOjozG9nkYwgwxAA==
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr25391791edr.285.1571839945480; 
 Wed, 23 Oct 2019 07:12:25 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
 by smtp.googlemail.com with ESMTPSA id p9sm60974edx.4.2019.10.23.07.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 07:12:24 -0700 (PDT)
Date: Wed, 23 Oct 2019 16:12:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191023141221.GA11575@pi3>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-11-arnd@arndb.de>
 <20191023121458.GB11048@pi3>
 <CAK8P3a3ktdA12vpi6zrTXs7-03efk2Ke_0_mQ9X40MLNcZnEqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3ktdA12vpi6zrTXs7-03efk2Ke_0_mQ9X40MLNcZnEqA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Kukjin Kim <kgene@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jiri Slaby <jslaby@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Faiz Abbas <faiz_abbas@ti.com>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [alsa-devel] [PATCH 11/36] ARM: s5pv210: split from plat-samsung
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Oct 23, 2019 at 03:17:35PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 23, 2019 at 2:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Thu, Oct 10, 2019 at 10:29:55PM +0200, Arnd Bergmann wrote:
> > > These can be build completely independently, so split
> > > the two Kconfig symbols.
> > >       config DEBUG_S3C_UART0
> > > -             depends on PLAT_SAMSUNG || ARCH_EXYNOS
> > > +             depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
> >
> > How are you going to select DEBUG_S5PV210_UART now?
> 
> I don't see a problem here, the patch should not change the behavior at all.
> 
> The whole entry now looks like:
> 
>         config DEBUG_S3C_UART0
>                 depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
>                 select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>                 select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>                 select DEBUG_S3C64XX_UART if ARCH_S3C64XX
>                 select DEBUG_S5PV210_UART if ARCH_S5PV210
>                 bool "Use Samsung S3C UART 0 for low-level debug"
> 
> so this will work as before with any of ARCH_EXYNOS, ARCH_S3C24XX,
> ARCH_S3C64XX and ARCH_S5PV210.
> 
> What am I missing?

Ah, everything is OK, I mixed up removed with added line so it looked
reversed (removal of ARCH_S5PV210).

Looks good.

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

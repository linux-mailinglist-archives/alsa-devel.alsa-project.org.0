Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18827554F83
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:39:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98DB244A;
	Wed, 22 Jun 2022 17:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98DB244A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912345;
	bh=gd+t/oroUC7mPdGiXBHPfPR0Z6CjYYHU9dLMSdStQc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NkbJVWXm5zbPiRIdsYCgLC9lCJx6A0xKjFGQ3Rx5Mq3Nm/bVWiyM+SGKW43dWEwsq
	 aBzm6BTp1jLiB84HuDzUBa7lXTCk5Hfs6G81Zvf3aLx6FGmaIYftVDUV1A6VRgnQuh
	 zWm1Kq7oBOn85FRe8C5j96ld8KoYbIKD79G8edpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 280DBF806F8;
	Wed, 22 Jun 2022 17:24:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A06BF800E3; Tue, 21 Jun 2022 11:26:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F0FAF800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F0FAF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U4TmMXAV"
Received: by mail-ej1-x62d.google.com with SMTP id o7so26183948eja.1
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NOMsJgOH3MiCNjts6Vy2cOyGVGYl5lD+qutJwwCIfsM=;
 b=U4TmMXAVNZeGSibLS1ghJJrIiOQVgWj4Qhzr2zXpZ+UjaA8vQDXSqrB0mhffAZ6Y9d
 XaJxAG/q3qhi8lBbjSlIe4BCARpAkrbeLvmp7yJ8wuR7IahJDrPRtLyghlHUZlUs4nWB
 FZTWmbA6jN6Dl+1dTCiUI5xSy7dHbNcZ9mHyH7xWZpPiLD4CjNeKT3bkajbgNmUNGssT
 58FkgHEVrYlyPbFS9MvU+nFY1iGFJ3jlS3X3KFvPTYe8GBn4g2yDEArJsar8PRNVwU3S
 TIAQj0k8aL5a3We6gBozjvqbKtUmm2XGgOixTPoPN+2bY4+KThPsVwTq4sbr78gBo2r6
 edBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NOMsJgOH3MiCNjts6Vy2cOyGVGYl5lD+qutJwwCIfsM=;
 b=jww/jqxeGC7xEcgBN2LJsgp/GY3MkwOzAkjm0wWK2EYT+hhhDpWgwRgbKEEwzS9f3b
 sqggO3C+98InsX5XN6kmkSPguyBbNEDzogiONuxwkvNCn5+pzom0h9F7iHIB0Ez1hdXe
 3oh98UEvZ1MvTW7es/sdvHftIW+PKpLE5owt6m5SnrKi425O/rOGFbJLuWHgieu50bkx
 ZHuEd7JnfG2v5VSM4+8MkMfEFJGLk3ZNW69y27hyQ3XqCTQ3rB1YRVeVo244JMRolsmb
 Z5Y4Q8IVEPYJpuIcVu2BZHmTmahkx24ekJB7nvua3Y4nVEZFKCDMffqsXS4TuAq+bXnR
 BTig==
X-Gm-Message-State: AJIora+KlEy3OueWbWGi3BifVrkBK/R+QEHgveuTZKWohYPzforNJWkH
 IYXCRfsQrRw0eZXcN4nwc0LdpVgoM9hAmw5SW4U=
X-Google-Smtp-Source: AGRyM1se8Q5QQtyQhqZ276ze+sQZWIHL5X2Uisw4LahZgr/oEQb+koeaLdBeR+uqRMsLqk/klYDHMQOlZMtTnGjBf6c=
X-Received: by 2002:a17:907:72c7:b0:722:e5af:f666 with SMTP id
 du7-20020a17090772c700b00722e5aff666mr1241803ejc.44.1655803552679; Tue, 21
 Jun 2022 02:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:25:16 +0200
Message-ID: <CAHp75VcQ5xZV2eoC93zu3qA2TcE3LyMgZLMX=r0ibzQ1Fg6U0Q@mail.gmail.com>
Subject: Re: [PATCH 00/49] regmap-irq cleanups and refactoring
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, tharvey@gateworks.com,
 linux-actions@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 rjones@gateworks.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Walle <michael@walle.cc>, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 Matti Vaittinen <mazziesaccount@gmail.com>
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

On Mon, Jun 20, 2022 at 10:07 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> Hi Mark,
>
> Here's a bunch of cleanups for regmap-irq focused on simplifying the API
> and generalizing it a bit. It's broken up into three refactors, focusing
> on one area at a time.
>
> * Patches 01 and 02 are straightforward bugfixes, independent of the
>   rest of the series. Neither of the bugs are triggered by in-tree
>   drivers but they might be worth picking up early anyhow.
>
> * Patches 03-13 clean up everything related to configuring IRQ types.
>
> * Patches 14-45 deal with mask/unmask registers. First, make unmask
>   registers behave more intuitively and usefully, and get rid of the
>   mask_invert flag in favor of describing inverted mask registers as
>   unmask registers. Second, make the mask_writeonly flag more useful
>   and enable it for two chips where it makes sense.
>
> * Patches 46-49 refactor sub_irq_reg() as a get_irq_reg() callback,
>   and use that to eliminate the not_fixed_stride flag.
>
> The approach I used when refactoring is pretty simple: (1) introduce new
> functionality in regmap-irq, (2) convert the drivers, and (3) remove any
> old code. Nothing should break in the middle.
>
> The patches can be re-ordered to some extent if that's preferable, but
> it's best to add get_irq_reg() last to avoid having to think about how
> it interacts with features that'll be removed anyway.
>
> I can't test most of the devices affected by this series so a lot of the
> code is only build tested. I've tested on real hardware with my AXP192
> patchset[1], although it only provides limited code coverage.
>
> qcom-pm8008 in particular deserves careful testing - it used all of the
> features touched by the refactors and required the most changes. Other
> drivers only required trivial changes but there are three of them worth
> mentioning: wcd943x, wcd9335, and wcd938x. They have suspicious looking
> IRQ type definitions and I'm pretty sure aren't working properly, but
> I can't fix them myself. The refactor shouldn't affect their behavior
> so how / when / if they get fixed shouldn't be much of an issue.
>
> Oh, and I added the 'mask_writeonly' flag and volatile ranges to the
> stpmic1 driver based on its datasheet[2] as a small optimization. It's
> probably fine but testing would be a good idea.
>
> [1]: https://lore.kernel.org/linux-iio/20220618214009.2178567-1-aidanmacdonald.0x0@gmailcom/
> [2]: https://www.st.com/resource/en/datasheet/stpmic1.pdf

Cool series, thanks for cleaning this up!

-- 
With Best Regards,
Andy Shevchenko

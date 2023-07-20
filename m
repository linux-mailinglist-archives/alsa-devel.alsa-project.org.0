Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920775C245
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9292E92;
	Fri, 21 Jul 2023 10:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9292E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929902;
	bh=vFEmJg6GtGtB99XKroFr6qbNAdsiwLhebBMTdG/uqzI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dQOOctXqGkEAC6dxhK5Yg7dkQYOI7ZbbDPzToS2qI6hN78Cl1uUEdIcRcEJBH9Xn4
	 ky/VBvOTvZnV1f6DBfCf2ZNxULXH4ZwRpI+jY04g8o/iLobkaJ5NMo+T4qN8DGz3B9
	 /oVEIln0vcZXDENDaIratUWNac87d4ylb4czDfXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF26BF80617; Fri, 21 Jul 2023 10:54:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 131B5F80527;
	Fri, 21 Jul 2023 10:54:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 638D4F8047D; Thu, 20 Jul 2023 16:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E77DEF800D2
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 16:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77DEF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20221208.gappssmtp.com
 header.i=@bgdev-pl.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=VHsv4k0q
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-483ad06a37aso1376457e0c.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jul 2023 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864607;
 x=1690469407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44I4QTXSdpRlGQNX01aNu7Q8jYmgKrsVdvaz0FbrT9w=;
        b=VHsv4k0q2otI210G2fx8UlqZVBouT1yhHPQeX4/iYKRduLbBfujemaFd84GC3ZVtWX
         jIbCktQqByAp5iqMc/vfuiwpcDzR/b7VidjqvAa00eAxbSRDadKzFL7ftVkL0wpM8mY4
         3nANvQf6LnRvO72e3X3PIZq6dwVKEuHJlUuToqWh59bGJFqRqqo0SosmrUxvzzRd1bBC
         FBz8bvcUB7PznBNwhuRezNy3z5i/4TW+ggCxtW15DP+i0Lj50o4B9jSN9WUDe5Vyw8rc
         EUeWyncBdaKXPsUBWXs360RXDU8t4kC/iicYJ16kjPZL2O0Kgs5iYg9GIm/a1AZfdPvo
         1iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864607; x=1690469407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44I4QTXSdpRlGQNX01aNu7Q8jYmgKrsVdvaz0FbrT9w=;
        b=cgHgAyvFy4JnEvUijzpk1B8AZjJlQ+qaBft4G6yIDnqb2FNhRxnIVUr0jwH+G9VJZ6
         CbX/IYbcvKmTRyvzT1D6P7cTuOxv0npn41P+/jmR+EswvkZ8c+Xve/nHZuCTAvfsciuC
         zgRlwJkddKSUVgr4yfivB+VHv+U/ipMS8mkO/MLGnH+sxAaiLe2jzI1azyntvN/16L/O
         IB2fMwFMLGomSK1bfUBXq/9/kgKkjIzMcMuRm1/+ekyBfUnHD0mKoi0DK47v+TwB7vj/
         42zy30DvS0RUdNrR+y1Pt9Vfhbw6OC9FDEOpmUuyJGWupMRFh7b0ajJtiL/XIRhemYWy
         mUCA==
X-Gm-Message-State: ABy/qLYh+BbFFYxMI2gt824aKDL+goy1Vue3Sus/OI4jKdpKIAqH9Xg6
	ksz3DmDwnh1hiXQRfJD8G4rpLCjCrpheAj1WNN8y8g==
X-Google-Smtp-Source: 
 APBJJlHcVbVjnQaUrT7V7jD6HpKLdUNhc+KcBHJVAgkGL82QQnDc268rPznkIAv5GUoMxsi+qdzT6lIi9u/QnbbIPgk=
X-Received: by 2002:a05:6122:929:b0:481:5132:48c7 with SMTP id
 j41-20020a056122092900b00481513248c7mr2136264vka.1.1689864607273; Thu, 20 Jul
 2023 07:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-33-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-33-3d63a5f1103e@maquefel.me>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jul 2023 16:49:56 +0200
Message-ID: 
 <CAMRc=McbD1w47GsfvY6p==jDiTQrwg96jFvVKO-9bPhNOBmapw@mail.gmail.com>
Subject: Re: [PATCH v3 33/42] gpio: ep93xx: add DT support for gpio-ep93xx
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
 Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andy@kernel.org>, Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: TODHF6A7VER7U7CDUVIJPTCT5AOV4QRS
X-Message-ID-Hash: TODHF6A7VER7U7CDUVIJPTCT5AOV4QRS
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TODHF6A7VER7U7CDUVIJPTCT5AOV4QRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 20, 2023 at 10:30=E2=80=AFAM Nikita Shubin via B4 Relay
<devnull+nikita.shubin.maquefel.me@kernel.org> wrote:
>
> From: Nikita Shubin <nikita.shubin@maquefel.me>
>
> Add OF ID match table.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/gpio/gpio-ep93xx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 9a25bb0caf17..c4e272a8773d 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -360,9 +360,15 @@ static int ep93xx_gpio_probe(struct platform_device =
*pdev)
>         return devm_gpiochip_add_data(&pdev->dev, gc, egc);
>  }
>
> +static const struct of_device_id ep93xx_gpio_match[] =3D {
> +       { .compatible =3D "cirrus,ep9301-gpio" },
> +       { /* sentinel */ }
> +};
> +
>  static struct platform_driver ep93xx_gpio_driver =3D {
>         .driver         =3D {
>                 .name   =3D "gpio-ep93xx",
> +               .of_match_table =3D ep93xx_gpio_match,
>         },
>         .probe          =3D ep93xx_gpio_probe,
>  };
>
> --
> 2.39.2
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F949F645
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 10:27:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1452B1630;
	Fri, 28 Jan 2022 10:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1452B1630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643362028;
	bh=7LCaeAFdk7EXv4o1Gb//VOHTS5tdrCMMkg1h/O28VHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lYrGlSSHlj+qWoEGjbMvowX2P2pzTT2j+XQL1angge0Fw/a1sgT+p8DOJa5dxvGGH
	 MVQ7GRNEr/v+/ug4Z8Oeu6IFDy0XkpVutt/8ubSv6pKD9C2xQQTdgWV0EeK1vkBSwB
	 59iY70O7atluNY0jgenIOTUioEYadBHTW1r87rG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46EB9F8051A;
	Fri, 28 Jan 2022 10:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D0E8F804C3; Tue, 25 Jan 2022 10:31:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D12AF800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 10:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D12AF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kCmCEgQ+"
Received: by mail-ua1-x933.google.com with SMTP id m90so36322490uam.2
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1mm7+Qmz3LImo4aFwbhXIFkzVEgm/HAOzd6fbdAVMrg=;
 b=kCmCEgQ+xOVJqgvY6mIiDwGpng9RE64Ri/x5bVEJVgfKmrbder8yB0SJa9j3j/iO6u
 VSlwxJi1GtMfRaX9rz0Fi8V70QZmpTm/yg+yqKEhFTP/kvAigM6NlkG016BHxBuEGBud
 aKKG3vXyGKhkWECz7g02ij5pN8RBjRbfSAGJhF2s+s/E8Wzq61/RmUZzmkHINs6y38kj
 8W/C1tUsfkR71I5xYVxyEgRhxjIz/FmTGO/CwLqL3papla/+aWUpb3kyrOT/GpbDGqeC
 c1kCPdzAMoEjl9Ka3L/ozlubTR502/GpTZoRLS5kuqKqPkl9NQ2lJSPzTzJVIDppuhpp
 EfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1mm7+Qmz3LImo4aFwbhXIFkzVEgm/HAOzd6fbdAVMrg=;
 b=neFqqpBxAlQb9Afxa8Ke87QmuPlBVUpfAJA9EKQWY0VeZzALvhv9aKd6Pe0gOgx5a4
 xtvwH8g+HqGOlANiBfDx0613Vm9DOFeYm1I2q+BmSkKwTYFpGXoQ5rtCm+K75pYWn/R1
 keGZ7zREdf85/F33KoIkt9uaEU1fbjyQfSXoVrnXYNI31FJGJ+i/D3Jva7fEXD7NdH9G
 DeFkW/lv+wUE9BeVWMz9K2DgkUysXUA/UlAXrrucP7k6zIlN9+h1r0BRGqwzoh93JpUL
 QG8geWHLZ8SWcRf9b7/6IEPliHpuErmSSmxPfwPb/NV9bKF3sFBrXDqdCvDmO7mUooPj
 WyQw==
X-Gm-Message-State: AOAM532RiSY6EGo8kqh/BCNPvJ3bTRzp+fxVL5sar7XexCnqO/6gaN6I
 PRwyU+ghQh7Y3hgYDzUjvvKt2t3YiHWoMGrd23uV3A==
X-Google-Smtp-Source: ABdhPJwHGGkAwOnsd7qe0zHQAqHAUzi5PBqvJQ90yr1sdZ5zdG5wkLeKm2Z8HhNpFMDsTHL1nOGUCrWQS9pCXlyV9Y0=
X-Received: by 2002:a67:8c2:: with SMTP id 185mr712613vsi.19.1643103053912;
 Tue, 25 Jan 2022 01:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 25 Jan 2022 09:30:43 +0000
Message-ID: <CAF2Aj3g0uxj7=m+USWz9QvmQ511DN83e9WsVDW-484aEdix4hg@mail.gmail.com>
Subject: Re: [PATCH 0/5] spi: make remove callback a void function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Jan 2022 10:24:41 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Gwendal Grignou <gwendal@chromium.org>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Claudius Heine <ch@denx.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nanyong Sun <sunnanyong@huawei.com>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Pavel Machek <pavel@ucw.cz>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Christian Lamparter <chunkeey@googlemail.com>,
 Ajay Singh <ajay.kathat@microchip.com>, linux-clk@vger.kernel.org,
 Stefan Schmidt <stefan@datenfreihafen.org>, Sidong Yang <realwakka@gmail.com>,
 libertas-dev@lists.infradead.org, linux-omap@vger.kernel.org,
 Antti Palosaari <crope@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 James Schulman <james.schulman@cirrus.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Qilong <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Jingoo Han <jingoohan1@gmail.com>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Markuss Broks <markuss.broks@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 linux-wireless@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 David Rhodes <david.rhodes@cirrus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Solomon Peachy <pizza@shaftnet.org>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Jiri Slaby <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jon Hunter <jonathanh@nvidia.com>,
 dingsenjie <dingsenjie@yulong.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>, Matt Kline <matt@bitbashing.io>,
 Woojung Huh <woojung.huh@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Davidlohr Bueso <dbueso@suse.de>, UNGLinuxDriver@microchip.com,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-integrity@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-staging@lists.linux.dev,
 linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 netdev@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 linux-rtc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Guenter Roeck <groeck@google.com>,
 Aditya Srivastava <yashsri421@gmail.com>,
 Varka Bhadram <varkabhadram@gmail.com>, wengjianfeng <wengjianfeng@yulong.com>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Mark Greer <mgreer@animalcreek.com>, Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>,
 =?UTF-8?Q?Stefan_M=C3=A4tje?= <stefan.maetje@esd.eu>,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Julia Lawall <julia.lawall@inria.fr>,
 Yang Li <yang.lee@linux.alibaba.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 patches@opensource.cirrus.com,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Kent Gustavsson <kent@minoris.se>, "David S. Miller" <davem@davemloft.net>,
 Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
 Alexander Aring <alex.aring@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Huewe <peterhuewe@gmx.de>,
 Torin Cooper-Bennun <torin@maxiluxsystems.com>, linux-leds@vger.kernel.org,
 Eric Piel <eric.piel@tremplin-utc.net>, Stephan Gerhold <stephan@gerhold.net>,
 Noralf Tronnes <notro@tronnes.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas Kopp <thomas.kopp@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, platform-driver-x86@vger.kernel.org,
 Stefan Wahren <stefan.wahren@i2se.com>, Xue Liu <liuxuenetmail@gmail.com>,
 David Lechner <david@lechnology.com>, Will Deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Harry Morris <h.morris@cascoda.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Alessandro Zummo <a.zummo@towertech.it>, Yang Shen <shenyang39@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Cai Huoqing <caihuoqing@baidu.com>, Daniel Mack <daniel@zonque.org>,
 Daniel Vetter <daniel@ffwll.ch>, Colin Ian King <colin.king@intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alan Ott <alan@signal11.us>
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

My usual mailer won't let me reply to this many people, so I'm using Gmail.

No idea what chaos this will cause, but here goes ...

> The value returned by an spi driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

[...]

>  drivers/mfd/arizona-spi.c                             |  4 +---
>  drivers/mfd/da9052-spi.c                             |  3 +--
>  drivers/mfd/ezx-pcap.c                                |  4 +---
>  drivers/mfd/madera-spi.c                             |  4 +---
>  drivers/mfd/mc13xxx-spi.c                           |  3 +--
>  drivers/mfd/rsmu_spi.c                                |  4 +---
>  drivers/mfd/stmpe-spi.c                               |  4 +---
>  drivers/mfd/tps65912-spi.c                          |  4 +---

>  drivers/video/backlight/ams369fg06.c         |  3 +--
>  drivers/video/backlight/corgi_lcd.c               |  3 +--
>  drivers/video/backlight/ili922x.c                    |  3 +--
>  drivers/video/backlight/l4f00242t03.c           |  3 +--
>  drivers/video/backlight/lms501kf03.c            |  3 +--
>  drivers/video/backlight/ltv350qv.c                 |  3 +--
>  drivers/video/backlight/tdo24m.c                  |  3 +--
>  drivers/video/backlight/tosa_lcd.c                |  4 +---
>  drivers/video/backlight/vgg2432a4.c            |  4 +---

If it's okay with Mark, it's okay with me.

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Principle Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

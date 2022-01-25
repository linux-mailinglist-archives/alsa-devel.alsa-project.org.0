Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0B49F649
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 10:27:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D161674;
	Fri, 28 Jan 2022 10:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D161674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643362062;
	bh=nb2FbfJCL0BtZS+UkLQdNLYgciuvI9Yw5LJaGsuLsAg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BocLmeVqrYbUrLoBg4nyqQ2OHZmrKgqIKBkXEYRzac2TLhoTYthg0quoAdiwhNEte
	 WtIZQ2MXMo76vYWbpjxvRSzFQoMfHuBiy1XkwG9VZE24nfppanjxe1lvOddFn9yArN
	 7Eq3T3sRjFKgf/KJuHB1fj/MxFrBgkWZPkWs/tZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49B83F80525;
	Fri, 28 Jan 2022 10:24:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55243F804C3; Tue, 25 Jan 2022 10:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C072F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 10:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C072F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=datenfreihafen.org
 header.i=@datenfreihafen.org header.b="sGVaqmb8"
Received: from [IPV6:2003:e9:d71e:a9f7:7a7b:6f31:a637:f96b]
 (p200300e9d71ea9f77a7b6f31a637f96b.dip0.t-ipconnect.de
 [IPv6:2003:e9:d71e:a9f7:7a7b:6f31:a637:f96b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: stefan@datenfreihafen.org)
 by proxima.lasnet.de (Postfix) with ESMTPSA id F07DEC038E;
 Tue, 25 Jan 2022 10:44:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
 s=2021; t=1643103874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GoIG+75u1/C8Q0IQMWQkza+f14Geqz2ci3clcv5LbbA=;
 b=sGVaqmb8ajP7SMAimYbwmLeoz3qwgAKJtXKJhVBI6LVnprU3zcENtw8CSuIVtlDP12Ftcg
 omtJC4WBLS9wYTTYBNtwuVwIpt9p+QXLrBu2J5mSbkoUdwkk6Q2U+dEAkWJcH84zrQEyei
 x733CU2siv1QufCl/+nKqBu3Gb9hr+Y2jwgbd/nGY+h+cGoJ1aMrkQ/Xr04xLClVQrb7Zb
 TfJLM6l+udOvFgWOaiKtuRju9kT+LL2mscfBK+X4SZcr+cFkeecEEkxb8wgAwr3nuwM406
 TQmICGSC57YvMB7lqOtVDQPqzsvnI2bxJ1XBFEpgEaxjDEmWG5ZeH7Hj87MfNg==
Message-ID: <c82b8cc0-ef82-9e8a-525c-8d811376bfae@datenfreihafen.org>
Date: Tue, 25 Jan 2022 10:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] spi: make remove callback a void function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Sidong Yang <realwakka@gmail.com>, libertas-dev@lists.infradead.org,
 linux-omap@vger.kernel.org, Antti Palosaari <crope@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 James Schulman <james.schulman@cirrus.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Zhang Qilong <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Markuss Broks <markuss.broks@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 linux-wireless@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 David Rhodes <david.rhodes@cirrus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Solomon Peachy <pizza@shaftnet.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Jiri Slaby <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jon Hunter <jonathanh@nvidia.com>,
 dingsenjie <dingsenjie@yulong.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>, Matt Kline <matt@bitbashing.io>,
 Woojung Huh <woojung.huh@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>,
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
 alsa-devel@alsa-project.org, =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 netdev@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 linux-rtc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>,
 Varka Bhadram <varkabhadram@gmail.com>, wengjianfeng <wengjianfeng@yulong.com>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Mark Greer <mgreer@animalcreek.com>, Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-fbdev@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 =?UTF-8?Q?Stefan_M=c3=a4tje?= <stefan.maetje@esd.eu>,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 Yang Li <yang.lee@linux.alibaba.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 patches@opensource.cirrus.com, Kent Gustavsson <kent@minoris.se>,
 "David S. Miller" <davem@davemloft.net>,
 Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
 Alexander Aring <alex.aring@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>, Peter Huewe <peterhuewe@gmx.de>,
 Torin Cooper-Bennun <torin@maxiluxsystems.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Eric Piel <eric.piel@tremplin-utc.net>, Stephan Gerhold <stephan@gerhold.net>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Kopp <thomas.kopp@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 platform-driver-x86@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 Xue Liu <liuxuenetmail@gmail.com>, David Lechner <david@lechnology.com>,
 Will Deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Harry Morris <h.morris@cascoda.com>,
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


Hello.

On 23.01.22 18:52, Uwe Kleine-König wrote:
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
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

[...]

>   drivers/net/ieee802154/adf7242.c                      |  4 +---
>   drivers/net/ieee802154/at86rf230.c                    |  4 +---
>   drivers/net/ieee802154/ca8210.c                       |  6 ++----
>   drivers/net/ieee802154/cc2520.c                       |  4 +---
>   drivers/net/ieee802154/mcr20a.c                       |  4 +---
>   drivers/net/ieee802154/mrf24j40.c                     |  4 +---

[...]

For the ieee802154 drivers:

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt

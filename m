Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50445769195
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:22:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935A1BC0;
	Mon, 31 Jul 2023 11:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935A1BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795377;
	bh=cfwdULmhdj5HnKfJog6GzYforlxDOx20oH6nqKw/Dl0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rGBkWHyMHPkEyD1M9JRNMurJbHDypgQ7hknTDFbwZapNGMfOR2CPSXLM6SCphx/j4
	 asA6loGDJBzyEVoCZHT4G+OQ8UBMqxRW52ugFkX5bA1dialW/76uUjcmI50ti/8NIy
	 +vQRzcV+C8tds/7TWxztmDitqvHS+vbwX2M0FmY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E32BDF80631; Mon, 31 Jul 2023 11:18:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF997F8061A;
	Mon, 31 Jul 2023 11:18:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03213F8019B; Fri, 28 Jul 2023 18:05:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6969DF800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 18:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6969DF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ljouRWt1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47AE9FF802;
	Fri, 28 Jul 2023 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690560303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOwouwDm/Kasz+cImp4ZpLSYmghBWaSXArlXLO1rpH0=;
	b=ljouRWt14CzNxKdUZLfGcvVcD/MG5DdymZazb90A1RiBoJhkZfx33QMCamA/nq64KgQViJ
	5j94ziGUbCxvMyciw8LIg6YwFQkSf7yHDnrs3zIfxUjdSzdBKykEKG0kWvz/aV8i05xP78
	mqj89PddP7bz5a6JA8nBI8sawR22k7xKkRbiJMjIfLhDef/HPbnKzJyS+UFodCJ+DT53ZN
	A4VJB+/3Z1hacM8uhegA536VPmo5HTtstM9AcUBZ8j7k+5ooOrDw8+C3Kc1ufE3I2crSNT
	VFHW+ZQvhNQgc6+HqrnlnydP17EiBNygti/FGEhzRdi0EfCxPi4SUnCrthjHlQ==
Date: Fri, 28 Jul 2023 18:04:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Varshini Rajendran
 <varshini.rajendran@microchip.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 andi.shyti@kernel.org, tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
 ulf.hansson@linaro.org, tudor.ambarus@linaro.org, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, sre@kernel.org, p.zabel@pengutronix.de,
 olivia@selenic.com, a.zummo@towertech.it, radu_nicolae.pirea@upb.ro,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
 linux@armlinux.org.uk, durai.manickamkr@microchip.com, andrew@lunn.ch,
 jerry.ray@microchip.com, andre.przywara@arm.com, mani@kernel.org,
 alexandre.torgue@st.com, gregory.clement@bootlin.com, arnd@arndb.de,
 rientjes@google.com, deller@gmx.de, 42.hyeyoo@gmail.com, vbabka@suse.cz,
 mripard@kernel.org, mihai.sain@microchip.com,
 codrin.ciubotariu@microchip.com, eugen.hristev@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
Message-ID: <20230728180443.55363550@xps-13>
In-Reply-To: <20230728-floss-stark-889158f968ea@spud>
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
	<c0792cfd-db4f-7153-0775-824912277908@linaro.org>
	<20230728-floss-stark-889158f968ea@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-MailFrom: miquel.raynal@bootlin.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 23CC764WCYPGWJD5BLEGHOOAAKCHTWZM
X-Message-ID-Hash: 23CC764WCYPGWJD5BLEGHOOAAKCHTWZM
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:18:35 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Conor,

conor@kernel.org wrote on Fri, 28 Jul 2023 16:50:24 +0100:

> On Fri, Jul 28, 2023 at 01:32:12PM +0200, Krzysztof Kozlowski wrote:
> > On 28/07/2023 12:22, Varshini Rajendran wrote: =20
> > > This patch series adds support for the new SoC family - sam9x7.
> > >  - The device tree, configs and drivers are added
> > >  - Clock driver for sam9x7 is added
> > >  - Support for basic peripherals is added
> > >  - Target board SAM9X75 Curiosity is added
> > >  =20
> >=20
> > Your threading is absolutely broken making it difficult to review and a=
pply. =20
>=20
> I had a chat with Varshini today, they were trying to avoid sending the
> patches to a massive CC list, but didn't set any in-reply-to header.
> For the next submission whole series could be sent to the binding &
> platform maintainers and the individual patches additionally to their
> respective lists/maintainers. Does that sound okay to you, or do you
> think it should be broken up?

I usually prefer receiving the dt-bindings *and* the driver changes, so
I can give my feedback on the description side, as well as looking at
the implementation and see if that really matches what was discussed
with you :)

Thanks,
Miqu=C3=A8l

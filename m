Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E69677AA7
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 13:19:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB5041FB;
	Mon, 23 Jan 2023 13:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB5041FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674476340;
	bh=gpKQRGZw8jDinmfqA00+ZXuNq6arpZGThUUNUl1njO4=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vqx5fRadT84jPAKwzOkNct966u9T7473LG/BFI9lvYDeOfj1n7spuDMlkC9FyqLG7
	 W2VaqdsNte8Kp3PUQ6CU7WN1hCYrm67gdaT9/6JDtl5a2FeIK9eSnWleRWS5hNQzhI
	 wBoJcRUcUgJwvg1soAD4kYa5o+7DAgpqPrSVSyZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C69AEF801D5;
	Mon, 23 Jan 2023 13:18:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6CB0F804C2; Mon, 23 Jan 2023 13:18:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3645F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 13:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3645F80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZUpvTT/3
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3049E6000D;
 Mon, 23 Jan 2023 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1674476278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSrbZZvovpWvlJHm56TjukjpU0bsgrOflMKyVZ5eOVU=;
 b=ZUpvTT/3DPBE39G475z/z5eC8dHh8fjFkfRsufenoyMfstAS1QlsDlP5CT7iV5uJMu7wTO
 BEBr7iXCJBRFNpOI4TNrN3zAzXR4gMuwa4xgg6xpf/n7z51tAQSVwHQiQW1EPZTVhqZGF6
 QUAaDSOaLVwOD5iWrv7hgFQIjKYfW9xUaYWS21lhFoVQlHS14rpSVrp2nE+7DtorSijkTR
 QAdh4mVKt4CUAKavRYZp/dMiudCY9guBu7MgoYN5/q/1wbnm4GDlrxGFRPWF420y0kcYG+
 jlIuARTLmRcX4/T8v/PehW8FfjViib6KecXH6P/yn0mmrFGrfXaUt+7avtmc/Q==
Date: Mon, 23 Jan 2023 13:17:55 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: Add support for the Renesas
 IDT821034 codec
Message-ID: <20230123131755.1f5702be@bootlin.com>
In-Reply-To: <eb20dc66-f564-ed7e-8873-65621e5970de@csgroup.eu>
References: <20230120095036.514639-1-herve.codina@bootlin.com>
 <20230120095036.514639-3-herve.codina@bootlin.com>
 <d51b826b-e71f-393c-586b-6a1ca953f26f@csgroup.eu>
 <20230123095631.4aba35d6@bootlin.com>
 <eb20dc66-f564-ed7e-8873-65621e5970de@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Christophe,

On Mon, 23 Jan 2023 11:13:23 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Hi Herv=C3=A9,
>=20
> Le 23/01/2023 =C3=A0 09:56, Herve Codina a =C3=A9crit=C2=A0:
> >=20
> > gpiochip_get_data() is defined only when CONFIG_GPIOLIB is set.
> > That's why the #if section is used. =20
>=20
> gpiochip_get_data() is still declared when CONFIG_GPIOLIB is not set, so=
=20
> it is not a problem, the call to it will be eliminated at buildtime.
>=20
> By the way, at the time being I get the following warnings:
>=20
>    CC      sound/soc/codecs/idt821034.o
> sound/soc/codecs/idt821034.c:310:12: warning: 'idt821034_read_slic_raw'=20
> defined but not used [-Wunused-function]
>    310 | static int idt821034_read_slic_raw(struct idt821034 *idt821034,=
=20
> u8 ch, u8 *slic_raw)
>        |            ^~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/codecs/idt821034.c:305:11: warning:=20
> 'idt821034_get_written_slic_raw' defined but not used [-Wunused-function]
>    305 | static u8 idt821034_get_written_slic_raw(struct idt821034=20
> *idt821034, u8 ch)
>        |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/codecs/idt821034.c:276:12: warning: 'idt821034_write_slic_raw'=
=20
> defined but not used [-Wunused-function]
>    276 | static int idt821034_write_slic_raw(struct idt821034=20
> *idt821034, u8 ch, u8 slic_raw)
>        |            ^~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/codecs/idt821034.c:271:11: warning: 'idt821034_get_slic_conf'=20
> defined but not used [-Wunused-function]
>    271 | static u8 idt821034_get_slic_conf(struct idt821034 *idt821034,=20
> u8 ch)
>        |           ^~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/codecs/idt821034.c:250:12: warning: 'idt821034_set_slic_conf'=20
> defined but not used [-Wunused-function]
>    250 | static int idt821034_set_slic_conf(struct idt821034 *idt821034,=
=20
> u8 ch, u8 slic_dir)
>        |            ^~~~~~~~~~~~~~~~~~~~~~~
>=20
>=20
> With the following changes I have no warning and an objdump -x on=20
> idt821034.o shows no reference to gpiochip_get_data()
>=20
> diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
> index 5eb93fec6042..8b75388e22ce 100644
> --- a/sound/soc/codecs/idt821034.c
> +++ b/sound/soc/codecs/idt821034.c
> @@ -968,7 +968,6 @@ static const struct snd_soc_component_driver=20
> idt821034_component_driver =3D {
>   	.endianness		=3D 1,
>   };
>=20
> -#if IS_ENABLED(CONFIG_GPIOLIB)
>   #define IDT821034_GPIO_OFFSET_TO_SLIC_CHANNEL(_offset) (((_offset) /=20
> 5) % 4)
>   #define IDT821034_GPIO_OFFSET_TO_SLIC_MASK(_offset)    BIT((_offset) % =
5)
>=20
> @@ -1133,12 +1132,6 @@ static int idt821034_gpio_init(struct idt821034=20
> *idt821034)
>   	return devm_gpiochip_add_data(&idt821034->spi->dev,=20
> &idt821034->gpio_chip,
>   				      idt821034);
>   }
> -#else /* IS_ENABLED(CONFIG_GPIOLIB) */
> -static int idt821034_gpio_init(struct idt821034 *idt821034)
> -{
> -	return 0;
> -}
> -#endif
>=20
>   static int idt821034_spi_probe(struct spi_device *spi)
>   {
> @@ -1165,6 +1158,9 @@ static int idt821034_spi_probe(struct spi_device *s=
pi)
>   	if (ret)
>   		return ret;
>=20
> +	if (!IS_ENABLED(CONFIG_GPIOLIB))
> +		return 0;
> +
>   	ret =3D idt821034_gpio_init(idt821034);
>   	if (ret)
>   		return ret;
>=20
>=20
> Christophe

Right, I did the test too and indeed, I can remove the #if section.

I will use (I think is clearer) at idt821034_spi_probe():
	if (!IS_ENABLED(CONFIG_GPIOLIB)) {
   		ret =3D idt821034_gpio_init(idt821034);
		if (ret)
   			return ret;
	}

Is that ok for you ?

Thanks,
Herv=C3=A9
--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

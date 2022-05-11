Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0815232A3
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 14:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7348C18B1;
	Wed, 11 May 2022 14:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7348C18B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652270838;
	bh=j+SZT1/756FCJSOH/SWqGVaW5SakBqAL99hxm7pxi3g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBq2xFNKmVP4Sm5Y+QvpIuGLEcXEr6MamtpW4JjwbCLTe4Ujd4rIt2fKrIh40X0XT
	 TLdo8JeU6RJFavR5W1o8nDlVFkTMVIGMsKgQQxFh5uFWHtqTVAOh/mZU8dxSSqtESL
	 dcu7yKuWpvxrSXGRTSq+u+TypunQnTfLnJf1HN8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C539CF80212;
	Wed, 11 May 2022 14:06:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC703F8015B; Wed, 11 May 2022 14:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72442F800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 14:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72442F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="envSBHOj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F54661972;
 Wed, 11 May 2022 12:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3443CC34112;
 Wed, 11 May 2022 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652270771;
 bh=j+SZT1/756FCJSOH/SWqGVaW5SakBqAL99hxm7pxi3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=envSBHOjKbIr0rKczLGiBRqfDL78Sma3TLybp44DVJuTLIaZYtNApvReFU9U06O9v
 3xWNB92V4Auz9luxglol+DuNCsdzS/4IOAZzhsH4r7K/1qhf8Da9UxH4nnYbqnx3bi
 X7XtwTiOUgYAA2K0EfrMcIvP5trUSMbRD62bOPrG9C3gvdZ15dVNLAWZUDSwX9DIo9
 InXC0vmpN5eU4chLnavg+yxST5A7ekd4hW1gs68udySrsn6i3HvTh/KkAHBITw1JZ/
 F582nQUqMy0xXryp2aDLcd3uwHcA9Yro9GicbHNlMk0bIyoLfhdYzels8U8SX5q47X
 JteycUYF4C4OA==
Date: Wed, 11 May 2022 13:06:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Hui Tang <tanghui20@huawei.com>
Subject: Re: [PATCH -next 1/2] ASoC: max98396: Fix build error for implicit
 function declaration
Message-ID: <YnumrRUSkVCPONdl@sirena.org.uk>
References: <20220511012348.94288-1-tanghui20@huawei.com>
 <20220511012348.94288-2-tanghui20@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3Eq9i/WIkpo74bQR"
Content-Disposition: inline
In-Reply-To: <20220511012348.94288-2-tanghui20@huawei.com>
X-Cookie: Look ere ye leap.
Cc: alsa-devel@alsa-project.org, steve@sk2.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, ricardw@axis.com,
 ryan.lee.analog@gmail.com
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


--3Eq9i/WIkpo74bQR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 09:23:47AM +0800, Hui Tang wrote:

>                          devm_regulator_get_optional
> sound/soc/codecs/max98396.c:1556:23: error: =E2=80=98GPIOD_OUT_HIGH=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98GPIOF_IN=
IT_HIGH=E2=80=99?
>               "reset", GPIOD_OUT_HIGH);
>                        ^~~~~~~~~~~~~~
>                        GPIOF_INIT_HIGH
> sound/soc/codecs/max98396.c:1556:23: note: each undeclared identifier is =
reported only once for each function it appears in
> sound/soc/codecs/max98396.c:1565:3: error: implicit declaration of functi=
on =E2=80=98gpiod_set_value_cansleep=E2=80=99; did you mean =E2=80=98gpio_s=
et_value_cansleep=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    gpiod_set_value_cansleep(max98396->reset_gpio, 0);
>    ^~~~~~~~~~~~~~~~~~~~~~~~
>    gpio_set_value_cansleep
> cc1: all warnings being treated as errors
>=20
> Add depend on GPIOLIB for 'config SND_SOC_MAX98396'

No, these issues are missing headers not dependencies.  In general
gpiolib stubs out so drivers can optionally use GPIO functionality.

--3Eq9i/WIkpo74bQR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ7pqwACgkQJNaLcl1U
h9B0kgf8CXSZlR2n9HkIGn6ZvtvMYK62TBjP2DAICSADC+/7mIu2RtE2eQSLbIUJ
xaxEvMealU9daTphvXFlWHhVlVQow897uyOrsuAmaNdbx7hi1PhJyr1vs89iS+uY
Ss5lPUjN8OsdyweQkaQWO91ug+mSb3q3X3Qr0KBaCqMSgVXA7cUoEtHrFkWKn8qQ
QRJoTxHmC7Xed5N0zEhE7d7quXBLgiGL9FZfKoQpJQ2IBDTB486XblaUhl2TVXDu
sP4c1FHQvKT3qnDg0eLyvu8st/jPGe+pAjpKLh9rzvY36UFBrOu9bwzti1L/oZXW
VJ24AXxfw3iFzrOkEF42aVToPho6hQ==
=SyXL
-----END PGP SIGNATURE-----

--3Eq9i/WIkpo74bQR--

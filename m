Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666683053B0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 07:57:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6EC41778;
	Wed, 27 Jan 2021 07:56:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6EC41778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611730657;
	bh=SMf/sTVmFizoaTCRhZKOzJIDd9pG2drSndbHjehSYHI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AZKGv1zm59DKgJ1eR2BcFhrreZBijqPL/2R+PRPC6B0VbNwBZrQmvXdXWsHg2D/Se
	 6mzfz7xvmKRWJCNh2K9CjDuHZtuPtMy1A18mKO5PiNR46A73CHph1OYJaALAaWTGHG
	 4ulV26vFBY8bAZLhkw1adWZnl/MJqdFBV3r/Yq68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E49CAF8051B;
	Wed, 27 Jan 2021 07:52:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F32A9F80259; Wed, 27 Jan 2021 07:47:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B13BCF800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 07:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B13BCF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eIxDYowE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EB692072C;
 Wed, 27 Jan 2021 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611730042;
 bh=SMf/sTVmFizoaTCRhZKOzJIDd9pG2drSndbHjehSYHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eIxDYowELLXJdzjiGwaNPG2hkaUmupGzw2zEemwVvQomvLqzMvseCF/SkUiqZIduO
 Gvf8oKij0ja051ihFnNxn1vEEmr2V7Rezxly/hz1a2DfgLLDiHYVnu7ywJbmKoZ/1n
 jTjUvD1r6r/xOuNkE/io5HVCc6JZfMxpD46Zw0pDJW3S6qcXerAxfVIO9YzZfcx8BZ
 7abmVKMgGR50oOPfV4GFaWENi4Ss/oJanPtz4wNs5YcT6fz7mNssNUbap4x9DqDp7k
 94/V6xmo4VOiVFFF3CTluEAGGxMwLkYC3YD81tj+qqyC0M53/29Mjt0KM9D41YabCf
 I2bnFL90rxHIw==
Date: Wed, 27 Jan 2021 07:47:15 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 4/5] amba: Make the remove callback return void
Message-ID: <20210127064715.GA981@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Vinod Koul <vkoul@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Wed, 27 Jan 2021 07:52:20 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-watchdog@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
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


--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 05:58:34PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> All amba drivers return 0 in their remove callback. Together with the
> driver core ignoring the return value anyhow, it doesn't make sense to
> return a value here.
>=20
> Change the remove prototype to return void, which makes it explicit that
> returning an error value doesn't work as expected. This simplifies changi=
ng
> the core remove callback to return void, too.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org> # for drivers/memory
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmARDG8ACgkQFA3kzBSg
KbZUgg/+MkBwxjwkME0XbCPEYMUsJ9F6QLP4gXXTqGleAgxMVqSLG5XG/rJgCfPv
BB3X116hBgVOZZBTz+uWxpOSy90WrhLh3HrOb/SGB6hmKn/a0fYdB2/YXhVOXKyN
OlhKbYBl0Ev0PM+m8xV4sr0sQYOn1wOs0NMHoMvmK+TlnCX1GDxHBVuElpNWo8Wj
/nFLnpq9eUGt+i4eAsKoTj/1l8Ak4cOihHe2cRWxVUC3NDRTJBL9HgZwD38wVl5v
u/iwGQG5Zram49KLbGoBFpd60hrifA1X3Cwx2qhwZ+cm/ks3n+NwIQPvpoRyJ8Ny
gK5+QKowfQvOtSP8PFC1QE/u+oLVpYJ4rVT3DmXddPj89l3Peo17VAS08AoPk3hO
McIAFelbN1FmcjCpZ0ELpjCo/G6S1pKx9uAtFLbbMf80CoREU5ucCPzzWbf9unQv
5xhIdK1xkszSC1kGjHABw1zBy/ZAEoy+x3yktPjX2nU1L8Ni/vKjR6+w27G7pspU
WZwk2lkCFEnt8gFnRI4MFhjGagpiyiEfq0QeD1O452zgZimiPvfKjMLnWArfWzF0
25EngNXoizDEZMYZX46drnzfUfIDKBVkCbj1CWcQLFivpp4pj7+7n4D5lJlgwNvE
kqhQNlLLFbibwI0LNt/LqCbC/SggaYOUfYQ8XefoTe0Z6dH/+J0=
=FyXm
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

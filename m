Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 975EB7FC68C
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 21:59:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0C3A4D;
	Tue, 28 Nov 2023 21:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0C3A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701205198;
	bh=XFNgKWR3IH7MGWbzX9aPWGhwHVOfoXbpzEd0eLnZQf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NAb3z0tu6bizgyhZkOrqOzr4Qghqfl+6KxeR0oSWThbIunvMFhUzG9/4uzKYQC7jF
	 oOwg9CI8iiWCxebW8lDIwg9/5KRa+wH4Fp68YP35MHOwVmdt32Dd7+oRv6MOePhyzt
	 hyM6Jelivymg7BCGLEzx+FUMyLwg3fCHAa3mm040=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6E87F80236; Tue, 28 Nov 2023 21:59:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CDD3F8055A;
	Tue, 28 Nov 2023 21:59:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF019F8016E; Tue, 28 Nov 2023 21:59:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED6D8F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 21:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED6D8F800F5
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r85AN-0006nV-7B; Tue, 28 Nov 2023 21:58:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r85AI-00CFt4-DE; Tue, 28 Nov 2023 21:58:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r85AI-00AOAR-2T; Tue, 28 Nov 2023 21:58:42 +0100
Date: Tue, 28 Nov 2023 21:58:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific
 compatibles for existing SoC
Message-ID: <20231128205841.al23ra5s34rn3muj@pengutronix.de>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <170119374454.445690.515311393756577368.b4-ty@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bibczb2zawwhoawf"
Content-Disposition: inline
In-Reply-To: <170119374454.445690.515311393756577368.b4-ty@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: UVXGZIMXXIMAOEMSI6I7ABLAIC4XSOAD
X-Message-ID-Hash: UVXGZIMXXIMAOEMSI6I7ABLAIC4XSOAD
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVXGZIMXXIMAOEMSI6I7ABLAIC4XSOAD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bibczb2zawwhoawf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 06:49:23PM +0100, Thierry Reding wrote:
>=20
> On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> > Merging
> > =3D=3D=3D=3D=3D=3D=3D
> > I propose to take entire patchset through my tree (Samsung SoC), becaus=
e:
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> > 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAutov=
920), so
> >    they will touch the same lines in some of the DT bindings (not all, =
though).
> >    It is reasonable for me to take the bindings for the new SoCs, to ha=
ve clean
> >    `make dtbs_check` on the new DTS.
> > 2. Having it together helps me to have clean `make dtbs_check` within m=
y tree
> >    on the existing DTS.
> > 3. No drivers are affected by this change.
> > 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus expe=
ct
> >    follow up patchsets.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [12/17] dt-bindings: pwm: samsung: add specific compatibles for existing =
SoC
>         commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f

You didn't honor (or even comment) Krzysztof's proposal to take the
whole patchset via his tree (marked above). Was there some off-list
agreement?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bibczb2zawwhoawf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVmVIAACgkQj4D7WH0S
/k4mPQgAuzfJsEw0Nil25KsPJwyY53qFjfCGd8WTObzTDFpeIlzV2EL87bWT2Gtd
vEFgfX2Uj+RoOLX5CNnyuEfwH5e+O5oVYF9gfpsdqtRTJ3zyPV3dUiFCaIh2KNqZ
aaY1tsb4vECeh7dmEL/y2VUWoO2bAa08sZe6EpJXOkeUWN54VdTCMBwncH1utjgh
Tb/pHhjkfvdcbXuvxsFY4gL86pT8BER5EjIRZZaPN0kHDrGTBR+ZqjFvMVWTrFbq
IUK1gAMX+BOooJDwVFE4SeRta6p/lfClW73PbWk1++SyLPA2KbTp8jTul4qgXWKT
IbIJY8Qwg5trzJ0LHDMX3a02COS9hg==
=P7ML
-----END PGP SIGNATURE-----

--bibczb2zawwhoawf--

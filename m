Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A81A6901A4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 08:53:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B433383B;
	Thu,  9 Feb 2023 08:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B433383B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675929201;
	bh=L5iioHHS0gKTD0Av+w/hVt1wrWY7TbGOTrb8YYz2gfQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cNhQRvGDQXQLRX6/DxIcOYj1qTZbR61W1w6nncez4FrCcKtpRHvHRmWsPMCyakFcM
	 UIYy3BQmZJv6WJQowqbBavWQJAZ5RZ0Fa0NQ18Zt8zTkjyK91lNzTeYkPO/N3AM9qK
	 AuQmJ1N8exeCFcCOhoxx4QLJsFWBDUZwVesB3TjU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05639F800B8;
	Thu,  9 Feb 2023 08:52:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16CC3F800E4; Thu,  9 Feb 2023 08:52:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33FA8F80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 08:52:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33FA8F80027
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pQ1ie-0005N9-MB; Thu, 09 Feb 2023 08:51:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pQ1ia-003gys-PY; Thu, 09 Feb 2023 08:51:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pQ1ia-00240p-Vh; Thu, 09 Feb 2023 08:51:44 +0100
Date: Thu, 9 Feb 2023 08:51:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v3 5/6] ARM: dts: stm32: add ETZPC as a system bus for
 STM32MP15x boards
Message-ID: <20230209075144.cuw3xsxa6qgbttgq@pengutronix.de>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-6-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rrndckfqklirsafz"
Content-Disposition: inline
In-Reply-To: <20230127164040.1047583-6-gatien.chevallier@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 4PUDXJA5MBMW2CI5VOX3GDTDRAFUA5HA
X-Message-ID-Hash: 4PUDXJA5MBMW2CI5VOX3GDTDRAFUA5HA
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com,
 vkoul@kernel.org, jic23@kernel.org, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
 fabrice.gasnier@foss.st.com, ulf.hansson@linaro.org, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PUDXJA5MBMW2CI5VOX3GDTDRAFUA5HA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rrndckfqklirsafz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jan 27, 2023 at 05:40:39PM +0100, Gatien Chevallier wrote:
> The STM32 System Bus is an internal bus on which devices are connected.
> ETZPC is a peripheral overseeing the firewall bus that configures
> and control access to the peripherals connected on it.
>=20
> For more information on which peripheral is securable, please read
> the STM32MP15 reference manual.

it might be naive, but I somehow expected that when showing at the
resulting commit with git show -b that the patch gets quite small.

Is it really intended that &etzpc (which has reg =3D <0x5c007000 0x400>;)
is the parent bus of the devices with feature-domains =3D <&etzpc XX>; even
though their addresses are out of &etzpc's range? Doesn't a bus usually
have a ranges property and a base address that matches its contained
devices?

Looking at imx6qdl.dtsi there is:

	aips1: bus@2000000 { /* AIPS1 */
		...
		reg =3D <0x02000000 0x100000>;
		ranges;

		spba-bus@2000000 {
			...
			reg =3D <0x02000000 0x40000>;
			...
		};

		...

		sdma: dma-controller@20ec000 {
			...
			reg =3D <0x020ec000 0x4000>;
			...
		};
	};

and the registers configuring the aips1 bus are (I think) in

                        aipstz@207c000 { /* AIPSTZ1 */
                                reg =3D <0x0207c000 0x4000>;
                        };

Maybe this change could be made less intrusive by using a similar setup
here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rrndckfqklirsafz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPkpg0ACgkQwfwUeK3K
7AksRQf9F2+KOgguGN2yi9XyRsBKfGbuiPgheWhbrhFSDynHAiY9Vv7o2H4D4McR
pltFJO2P6dZafbgaKfqXJfojGBSHGhddpq//TudL3GZJ5SCmvPH6Hwpj+KObv8fl
vr3Yr2Z6m1sM5BR8Wx+m2Ev6K3OiZ49XhPZTwS+T1Jw6FH0Qm1DI638WfGa82www
XPFPQ68rp5Bh+oubZp+j4V/wFfOP9w7ABboCF3mAu7Gll5s/u+4GX0E9oUOKfn+3
94L3SE5TRfyJhOWLT4Ey1lQjHMfBKq63QJNgEzxbDO6Qc7lh632SfVzMkJvYlw7N
AprqHfYbaB04DMpwuVGIzEGqeIhJ5Q==
=Fi/Q
-----END PGP SIGNATURE-----

--rrndckfqklirsafz--

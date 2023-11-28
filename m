Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBAB7FBE77
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 16:48:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06EDBA4D;
	Tue, 28 Nov 2023 16:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06EDBA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701186504;
	bh=7WZkg7vMGVLcFYXYfZaYAUsciatK6YcDCyfh1v0oMQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uzQda/R2ZILv4zD5ncLW3LoEM1FfApK5zFCJUQIpCWxF96R1NQPIUo9RQhO/dnxbJ
	 goyrmSH2mSoPcN7mE4mlClIAn2sBBKkh81S37Phn/Y/Be8QgNiz1e/wdEga8n4ag7u
	 O296AT9/bFGnbAsD2b69ngPuDKS3hTat5HNGnzyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 644D7F80236; Tue, 28 Nov 2023 16:48:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC8ECF8056F;
	Tue, 28 Nov 2023 16:48:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B58E6F8016E; Tue, 28 Nov 2023 16:47:57 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ACF33F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 16:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACF33F80114
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1r80J7-0000VM-9w; Tue, 28 Nov 2023 16:47:29 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1r80J6-00CD5U-6M; Tue, 28 Nov 2023 16:47:28 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id DC2DE255303;
	Tue, 28 Nov 2023 15:47:27 +0000 (UTC)
Date: Tue, 28 Nov 2023 16:47:27 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: tlv320aic3x: Failed to init class D
Message-ID: <20231128-untouched-flakily-1d7d56559286-mkl@pengutronix.de>
References: <20231128-frail-parted-f6e66c217965-mkl@pengutronix.de>
 <374f0221-9853-4eee-984c-05af01732582@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lowuocoarxi43hop"
Content-Disposition: inline
In-Reply-To: <374f0221-9853-4eee-984c-05af01732582@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: XICNWPOFR7ZYN2LE5XHPJD5GOVYBTEMI
X-Message-ID-Hash: XICNWPOFR7ZYN2LE5XHPJD5GOVYBTEMI
X-MailFrom: mkl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XICNWPOFR7ZYN2LE5XHPJD5GOVYBTEMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lowuocoarxi43hop
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 28.11.2023 15:06:43, Mark Brown wrote:
> On Tue, Nov 28, 2023 at 11:55:25AM +0100, Marc Kleine-Budde wrote:
>=20
> > we are using an I2C connected ti,tlv320aic3007. During probe,
> > regmap_register_patch() returns -6, which leads to the error message:
> > "tlv320aic3x 2-0018: Failed to init class D: -6". I think this is
> > because the codec is still in reset and does not respond to the I2C
>=20
> > How to get rid of the error message? Power on the codec, just to write
> > the register sequence or don't print the error message on "-6"?
>=20
> Yes, power on the CODEC - if you're applying a patch the expectation is
> that it should actually be applied to the device, otherwise things might
> get confused later.

I think you're right in general, but as far as I understand the driver
takes care of this.

In probe() it wants to write to the regcache only, and then calls
regmap_register_patch(). During probe the chip is unpowered and in
reset:

| aic3x_probe()
|         regcache_cache_only(true);
|         regmap_register_patch();

In aic3x_set_power() the sequence is, power on device, get out of reset,
regcache_cache_only(false) and then regcache_sync():

| aic3x_set_power()
|       regulator_bulk_enable();
|       gpiod_set_value(aic3x->gpio_reset, 0);
| 	regcache_cache_only(false);
| 	regcache_sync();

If I only power on the codec in probe() for the regmap_register_patch(),
I'll shut it down after the regmap_register_patch() anyways. So the
register values are lost in any case.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--lowuocoarxi43hop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmVmC4wACgkQvlAcSiqK
BOg5RAgApqmoZiRWG6zN0qBXzw7c3nhG8rcOl8jesxvIJgm0fW60KuWW21bLZYrd
5r7TwzPNbx2c/CuZbnobCnLGI35D4eY+xL8Or8GyHL7XrdrvczNx4jbFHOmizM4N
2hiLGA5Nn2fGC/QzwlDp3csulpJYB+7ey1H1vsAZKVQS57bUkRzwp3/mQiDdMGb6
pVt95nIV1HhD98JyoYiJagpTnUFX74CQkyUw/9hWWdBSfbe/MdPalD8l0XfurIfZ
hgy+twN1IeMX8TbgPQOi9tjRIiaCR5JkBPbftsM3zYSdyA3TdcwCT6/AaxYj2RRy
oaQGHAE/6ssmqMusYqqDgcJ1FBCdJA==
=+7fl
-----END PGP SIGNATURE-----

--lowuocoarxi43hop--

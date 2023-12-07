Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA330808D59
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 17:24:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFC13857;
	Thu,  7 Dec 2023 17:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFC13857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701966268;
	bh=MBl8jX+CYsWd6FZCSkh8ink0zxCjpM93rbZyvHRV2R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pMYN8ZiiVKKZ0bJCT1QfkBrYIyHHehCF2FY9KWIdRirWm+eTxPGz5/lrShPY1ZTvg
	 gmMxy8pIdOndsfKk1VKhDEqX1pvZA9CgxPjcwIwMoo04l8IHF2LiGbeymKztreqFAJ
	 gFTPWJRAwEjY/bJvxv/4hOmJbLcAHlsmBTd9cynk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35E59F80578; Thu,  7 Dec 2023 17:23:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF374F80570;
	Thu,  7 Dec 2023 17:23:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F14EEF8024E; Thu,  7 Dec 2023 17:21:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A8F0F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 17:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A8F0F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OaX+Amr4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F0F09B826B5;
	Thu,  7 Dec 2023 16:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE46FC433B9;
	Thu,  7 Dec 2023 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701966052;
	bh=MBl8jX+CYsWd6FZCSkh8ink0zxCjpM93rbZyvHRV2R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaX+Amr4+2De3B69b6K4i/wdD/KlCz19NtGb/HlW2OyVVH6jkUYW99P33NutAtN4J
	 A0nJKfpdTQgOybcd97ybL7zLpQcpAoIfs08y/yLVszKPYo/p+7aHgn5ouMxal5zYoQ
	 neQnIF9I8uOtFo2BAuAC+cNRUgo3VlEwViQgAwkE3Y6L8ngIELWn0jYiUvgC0Tfw/T
	 15nM8TDyTLAx6xgL9Dl9eBYcgSLXtLh34DH8JSLBQEIAB6zRSvv4ifzuKJxcwR84Qo
	 O6eqsr+covJ2qISwOFeGcu9CXz+wIGANUWkPYIT3T2/5srMqIVYD9zUL5gKYmw2wNS
	 ougPA1Q+aQ0Jw==
Date: Thu, 7 Dec 2023 16:20:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
	tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [GIT PULL] Immutable branch between MFD and SPI due for the v6.8
 merge window
Message-ID: <d12da7b2-f18c-4b56-85be-6d98b62d6ddd@sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
 <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
 <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
 <20231207133849.GB8867@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H1tMbLV73SdOkctb"
Content-Disposition: inline
In-Reply-To: <20231207133849.GB8867@google.com>
X-Cookie: Two is company, three is an orgy.
Message-ID-Hash: JU2RQFAAIO5XYWF5VX6XXGHXAV6VWETT
X-Message-ID-Hash: JU2RQFAAIO5XYWF5VX6XXGHXAV6VWETT
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JU2RQFAAIO5XYWF5VX6XXGHXAV6VWETT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--H1tMbLV73SdOkctb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 01:38:49PM +0000, Lee Jones wrote:
> Good afternoon Mark,
>=20
> > Is there a signed tag available for this - without this change the
> > subsequent SPI changes introduce a build breakage.
>=20
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>=20
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-spi-v6=
=2E8
>=20
> for you to fetch changes up to 4ae08845db4c1f759b8382bc7527ab8249230e7f:
>=20
>   mfd: tps6594: Use spi_get_chipselect() API to access spi->chip_select (=
2023-12-07 13:36:29 +0000)

Thanks!

--H1tMbLV73SdOkctb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVx8NoACgkQJNaLcl1U
h9BXiwf+NG+nYvE91fSSJn6y9dB1oLiMaR2BUDYVTOuWkwmRWLtbTbJgJwxJfBqH
itW5Xs7GuEJ8Rq82sl4K6ITes+jLCB1ljYdbbH4QTqo7Sm5MjdRwGQczHbe8FONG
FTu5Oa7WGJfTQa7tTu7TOJU16Dd1YPVT4QO8Zg2D6Fvltfdh5y0vTJO9LxdA99cE
11d/pzJGFKEojADXl3V7RFLAiJJAFpri7C730ZOZ30WRt42f18MTl7omglIGAQOE
6YvN9sSZ57FEQuWaoIKp8IGnOukM4eqEwuwx8CqUNGfD7ag9ffo17PpytPgQosoX
6xPrq5I2cgrNMJzC71jsMobrBpQF1w==
=4OmM
-----END PGP SIGNATURE-----

--H1tMbLV73SdOkctb--

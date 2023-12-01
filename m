Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F5B801329
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 19:51:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E33A8DEB;
	Fri,  1 Dec 2023 19:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E33A8DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701456678;
	bh=nlNo7xM9XoRlNYHh2JQaIekxrQZHPuEHEh20xUWik9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hM+JaftTqsq++Tn926XMqVYPe22clW7+ojLcdLHQA97B5I7xjONNsUF/q2XC0vCzg
	 CknOom0gNAZf2I4RgMC2xwGeiDMzKSqVMhqKaSmrgv3CCajYVJhSEnYWFY2Wj8S48C
	 /2fQCu6qhgJSZHr5PGPxNwtwi0F3yjBkWtOKPLqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46B54F8057C; Fri,  1 Dec 2023 19:50:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A302EF80579;
	Fri,  1 Dec 2023 19:50:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64901F8016E; Fri,  1 Dec 2023 19:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75516F80104
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 19:50:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75516F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eix0RHOr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0035BCE275D;
	Fri,  1 Dec 2023 18:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A377C433C7;
	Fri,  1 Dec 2023 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701456626;
	bh=nlNo7xM9XoRlNYHh2JQaIekxrQZHPuEHEh20xUWik9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eix0RHOryZ9fBUgKkiP3QDCZYWkQfGj0qw7PH2nt9Ij/gX120ikLc9r3jpDtMy6sf
	 rgmZGHvqQNVhKOxcLmZ161yUAiZn4s78Y23brUdPGdPhTAhFC+i6FJz3XugCzxHlRp
	 Ig+ududz0DuZtxihAgmEp4sXjkOSrBRJ2O122FhozAoQ+kb7GVueZW2LgPNs0rW5Bf
	 YXy8lQVXxIuYYtN19fcnKuN4Ec5bSzGzd23rAds2gzKmFGQo1LsE0NIgp0s2eRVuGk
	 VkpLlgLZlFsGR+b2Yk+9FKc8ZtqR2/HbOqP+o8Mbd+pizyhKM6IIQ+t/Dcj9TftAw6
	 NXhpQFInUQ95w==
Date: Fri, 1 Dec 2023 18:50:15 +0000
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
Subject: Re: (subset) [PATCH v11 01/10] mfd: tps6594: Use set/get APIs to
 access spi->chip_select
Message-ID: <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
 <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uaQ9X2fe+EqjZHC4"
Content-Disposition: inline
In-Reply-To: <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
X-Cookie: The early worm gets the late bird.
Message-ID-Hash: PTNBTZLT3GOUEJEFOAG6X6NA37XLIW2D
X-Message-ID-Hash: PTNBTZLT3GOUEJEFOAG6X6NA37XLIW2D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTNBTZLT3GOUEJEFOAG6X6NA37XLIW2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--uaQ9X2fe+EqjZHC4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 01, 2023 at 09:57:36AM +0000, Lee Jones wrote:
> On Sat, 25 Nov 2023 14:51:28 +0530, Amit Kumar Mahapatra wrote:
> > In preparation for adding multiple CS support for a device, set/get
> > functions were introduces accessing spi->chip_select in
> > 'commit 303feb3cc06a ("spi: Add APIs in spi core to set/get
> > spi->chip_select and spi->cs_gpiod")'.
> > Replace spi->chip_select with spi_get_chipselect() API.

> Applied, thanks!

> [01/10] mfd: tps6594: Use set/get APIs to access spi->chip_select
>         commit: dd636638446c87c95c5beddcd367d95ac6764c6c

Is there a signed tag available for this - without this change the
subsequent SPI changes introduce a build breakage.

--uaQ9X2fe+EqjZHC4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVqKuYACgkQJNaLcl1U
h9APAwf+KLPqe9oVMKPnVoC0/RKtAWqn22qR/OisWnbE+SjMxYnOliwWr1Uy1gfO
VQpQx3O/7kKmZ5aYGt82J0rykYY+6IFwHvgwUu67iYpCzQgmhVbnbh1B94YeZIkV
SUkOiN7HUoTbbExTLVa5Jn+5+LKRmMkbjYXVdpb41Jz/fyGNAidXizOnpqct/Qp1
dMNggC1eWI/kqsOjSr9obsJHhIcyM7u1pwaicJzWGG7SwNM0PSramv3lCHpaKH5W
UbyLbyZ+G0Z2JIwwnq1hFEyklQ1RVInt+3p4rfYhIInMDF+5cQPUjBTcS4k8ho1J
FDPG03/Neeonh9yIf8+TSmQ4tVxszQ==
=/wO/
-----END PGP SIGNATURE-----

--uaQ9X2fe+EqjZHC4--

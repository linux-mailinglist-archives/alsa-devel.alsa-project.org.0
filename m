Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60254835410
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 02:05:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19334844;
	Sun, 21 Jan 2024 02:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19334844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705799123;
	bh=d3XsdJmOrPceBBoewmuW2GJNC71GNXagT5eGFvKkFyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lkDnRbdfk+sXItSdKPGcVo+24ABbyTMQEKbwgC7bJn3khcA8Tt0ieVz98GNAPantg
	 bYPd2Fz63hH2g/JlvSJgtWN5kqOgmmiNawthgWj+ZVHSMrDr3IkCoboKBZoLDeZL3R
	 9jBLstx7Vo9+hd6x9WQv6kM6f65SyeevuWa8foWk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DCEBF8057D; Sun, 21 Jan 2024 02:04:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53E42F804F1;
	Sun, 21 Jan 2024 02:04:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A729AF8025F; Sun, 21 Jan 2024 02:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31C4AF8003A
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 02:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C4AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WVURKBzj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B3C860C69;
	Sun, 21 Jan 2024 01:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A34BC433C7;
	Sun, 21 Jan 2024 01:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705799069;
	bh=d3XsdJmOrPceBBoewmuW2GJNC71GNXagT5eGFvKkFyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVURKBzj+xJyBsvL4Hp5ZEf4Y1BburBTkn3HSSonkiyqUYQw910DdugQjvjVjupRr
	 QU2eExc7ZrjXtcVYPC3PyDhpVdfbub8Hat2hoZhtfeaSP8lALrVlVBs7BMR4uELmoC
	 mqsIPPcuon3uEX5ePlDtmPAU+jPi7v1EOIXLfbb85B/VKF5pNE/fD8kaKI69IyNUZQ
	 dkj5qxFhfvr5XbTT0MjEDVhtbqoptR73v7Bgz40vSEdtL1+PtzKzS1jIG0WdBXGMDK
	 jR+BUcv3NfWbVSkxP6jUV8FdsO1Lj87T9cIRYcsU9ql1TfdZ9bpTs6F4/8/EIZYlgJ
	 bekzpo8TMkTWA==
Date: Sun, 21 Jan 2024 01:04:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, lee@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Message-ID: <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gbj27IA6g3j5b4VB"
Content-Disposition: inline
In-Reply-To: <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
X-Cookie: You might have mail.
Message-ID-Hash: ODFYYBE7Z766JFBJRG6UU5YNL6556AK5
X-Message-ID-Hash: ODFYYBE7Z766JFBJRG6UU5YNL6556AK5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODFYYBE7Z766JFBJRG6UU5YNL6556AK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gbj27IA6g3j5b4VB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 20, 2024 at 09:05:43AM -0800, Guenter Roeck wrote:

> FWIW, the problem is due to

> +#define SPI_CS_CNT_MAX 4

> in the offending patch, but apeed2400 FMC supports up to 5 SPI chip selec=
ts.
>=20
>  static const struct aspeed_spi_data ast2400_fmc_data =3D {
>         .max_cs        =3D 5,
> 	^^^^^^^^^^^^^^^^^^^
>         .hastype       =3D true,

> Limiting .max_cs to 4 or increasing SPI_CS_CNT_MAX to 5 fixes the problem,
> though of course I don't know if increasing SPI_CS_CNT_MAX has other side
> effects.

Yeah, I was coming to a similar conclusion myself - the limit is just
too low.  I can't see any problem with increasing it.

--gbj27IA6g3j5b4VB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWsbY8ACgkQJNaLcl1U
h9Cd8Af/avJ6OwNEUdXRf7+Y/ez1nlW4KmF435+5Krs7iC0gW1bASAqTgK1wW/vH
Qn1dkyXEXhJr6D0AXzIaOBKg3k6gmKJ9AL0kbeMeIMsxj5f/2BYI62z0B8nx7dZC
Y3fMiOxEqHxwU0eWCD2HuzN/GxHD7mrLi5VEFCE572HROza7PRt0jFfRyy7GAfaM
BIfHMtCRiq5SMmya80D0iKJ9aZgeI0bf/DmzRVDOQnjo6sG7uCSyzPp4Rg1Z6wk1
kottzJ+R1VHbzCngl404KHzG8SBHAXxYOVxf1HqiBzSgJ2/aa/asAsV0mHnoccn9
5wKmraNTPzlncfC6l1dz4k3QPdXH7g==
=vqew
-----END PGP SIGNATURE-----

--gbj27IA6g3j5b4VB--

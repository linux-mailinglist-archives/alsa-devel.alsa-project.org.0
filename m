Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DBF77913F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 16:02:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AD52822;
	Fri, 11 Aug 2023 16:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AD52822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691762563;
	bh=r1OL1xOaDTJW8Cq/tuXNgO+CZev883XVsFSAo/bOUn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LnUlKQmUTmRJi6X5nNdJS2R8qWwS3BpwDMwtXme/E+ZasIHn/j2XdkT3MVdqvBzpp
	 8sxiOaVBeK+obiOIXkXSMdAUxUGVboxD0FpaIvLCvD4ccbqNPB/BI9bWFiQ9HL1s31
	 u4NhRkVP9BUMVn/JxL0wI4BNfrrWP7eVfggAfl1A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FF02F80134; Fri, 11 Aug 2023 16:01:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8210CF80134;
	Fri, 11 Aug 2023 16:01:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4B93F80166; Fri, 11 Aug 2023 16:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D50DF80016
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 16:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D50DF80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vnouo9gA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E8C167338;
	Fri, 11 Aug 2023 14:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C4DC433C8;
	Fri, 11 Aug 2023 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691762500;
	bh=r1OL1xOaDTJW8Cq/tuXNgO+CZev883XVsFSAo/bOUn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vnouo9gAj/nxKh8FeFcS7z4/iDN+1qVgA6Grl1jjvYa0XzmFqs+nDOwqkDGDXVBYY
	 D5gz9md9NUswiXc9+xv2L4mTI77X6O3qirUxKoJ4rT8ikiP2Ef7mKZs+m133dr9giU
	 LeoOc63h+g20VZoSdmL3CXkDqoqh5XAuXbEpNpLb78/pkk9nXMrIb0A96R6EcwYLU9
	 r7y27QxXzE4hdM3NuKvU2PpYAkLqIULbAXel/Kz9qb6Mnffudd9VtT9IxkT9lc4lQO
	 8AqZw5OTyQS/ZloHjnXXWmwQM6mGC8EzifsETwniz/VtA6YwkAjYTB+RZX4m3lpl0W
	 X0l/WUvUytQqw==
Date: Fri, 11 Aug 2023 14:59:35 +0100
From: Mark Brown <broonie@kernel.org>
To: John Watts <contact@jookia.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: wlf,wm8782: Add max-rate property
Message-ID: <ZNY+x/R8/T5ysPhy@finisterre.sirena.org.uk>
References: <20230810224930.3216717-1-contact@jookia.org>
 <20230810224930.3216717-4-contact@jookia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ci7ZGSM7XW5/wTO"
Content-Disposition: inline
In-Reply-To: <20230810224930.3216717-4-contact@jookia.org>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: OGSWDBIIX6CV4ZY3EGGTGINPICHCZLDV
X-Message-ID-Hash: OGSWDBIIX6CV4ZY3EGGTGINPICHCZLDV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGSWDBIIX6CV4ZY3EGGTGINPICHCZLDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1ci7ZGSM7XW5/wTO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 11, 2023 at 08:49:30AM +1000, John Watts wrote:

> + - max-rate    : max supported audio rate configured by FSAMPEN pin, defaults to 48000

This seems like a cumbersome and error prone way to configure this - why
not just have the binding specify the state of the pin?  That's just a
boolean high/low whereas this requires getting the rate right and then
having the driver validate it.

--1ci7ZGSM7XW5/wTO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTWPsYACgkQJNaLcl1U
h9C6BAf+JXfLV2AFtuDMuVZ4qlpwsOcaBZOaV8+3FqM7MeR3V0Em8PVKmAfSX95w
7SrCD5KYBxKmVf3EJMVAoslW0AnBytEF3xwzRQAFG73fCCMFbfpyC4FeSpV54yNH
F3Xw6cK75zsHdklYTVmYgrzLEEHUImr9gh5LLeOwJpK12oqi9MzpyrDSC29873df
eL3FmrHdBCHvMyVcn3b9iC5OHrltt3EYiUPP/7IXoFL96K9+y/bD9D20WefdUZYA
psf5N2WvyK7BGDi35w9Rk4dnI4WhXIRAwrGGMpPAz/1T+qr84PQ5HkTAWqN/5Plm
Up3LlXn3AZj3WOh3xdfhk0XOXVvZQQ==
=cmnz
-----END PGP SIGNATURE-----

--1ci7ZGSM7XW5/wTO--

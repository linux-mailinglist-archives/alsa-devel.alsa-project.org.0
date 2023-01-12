Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E9A667AC3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 17:28:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 346A69403;
	Thu, 12 Jan 2023 17:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 346A69403
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673540884;
	bh=6B18eQK7F29TeAZAl4w4ZRa5vzYBaXl0zGGzZeMr0jA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lb0yRxE0zSga+0dkhYdvwEVwEGYEJNUZ2IDDVkZZDKHo+eDXRiKw64pTkV1YYMxIM
	 S6kL02575XQXbAWEzD1+Gy8wTN8ZWqii0KWGYgyXOU+x5NpMXpi8XPTSiapJQYPacs
	 VLw9pPlkQRsq+9hSTTIGIvklAMxd8tgiLL7pMLkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CF6F8016E;
	Thu, 12 Jan 2023 17:27:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41B77F8019B; Thu, 12 Jan 2023 17:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47CD7F804BD
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 17:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CD7F804BD
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d9E2tVfE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9B26B81ECA;
 Thu, 12 Jan 2023 16:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E331CC433EF;
 Thu, 12 Jan 2023 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673540820;
 bh=6B18eQK7F29TeAZAl4w4ZRa5vzYBaXl0zGGzZeMr0jA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d9E2tVfE55rLfk0/DL67Ga5vqStFqbGyZXHBHVjPf+gcyh8FD3DrLmPIhAb2JJwEA
 5FAIhCH2YQeV7ZqR2DXB94jZGQr5YH8wbfDcBuLSgV20GWBNiz14/6pb96tcUm1DLo
 rbMEEFfjftvd2x1JclwugCBQBxDVozvVZe4pxppVX8foAhY+fRSzQCABKShuhdJ1t6
 cnPzMqOlWjlWWbZsg1uV2TTqjb1AKBPkk+l4BnSY/dtapSnn9Tzw1pBfsfPLz9/Qi+
 6EXYTkLUPV/FEKqLUlKlBkyO82sAGKFHUqn+OV23octZ7luUq+lOyGOnOxAwGwBeI1
 bf/fmgVWnsNmQ==
Date: Thu, 12 Jan 2023 16:26:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm.c: Introduce a count to record the times
 of setting DAIs parameters
Message-ID: <Y8A0z1L0xUyhlxT2@sirena.org.uk>
References: <20230112065834.580192-1-chancel.liu@nxp.com>
 <d83615ae-10d9-ca5b-26aa-522b3f10b43f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Aw7vIz3sK1rpMdsF"
Content-Disposition: inline
In-Reply-To: <d83615ae-10d9-ca5b-26aa-522b3f10b43f@linux.intel.com>
X-Cookie: A watched clock never boils.
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Chancel Liu <chancel.liu@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Aw7vIz3sK1rpMdsF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 12, 2023 at 08:19:40AM -0600, Pierre-Louis Bossart wrote:

> IIRC it's also valid to call hw_params multiple times without calling
> hw_free every time.

Yes, you can call hw_params() as often as you like, the OSS emulation
does that all the time due to a fun mismatch between how OSS and ALSA
work.

--Aw7vIz3sK1rpMdsF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPANM4ACgkQJNaLcl1U
h9Cxbgf/cIVKEmivx4GVL63S/XlJ/ajGggtAf9VfYwdW13CwMWZifUnINlG35ly/
gDf4bqx01WM70f0L0tGSdte7xs5L6+BdH7p41n62Hf033IpwNCaF0W4j+x4qkx9G
XuNqvI58LoEkU4u6i8+oKfCQ7sW7tKFNyliVMuLvBy5nMOkr9Xj3Xs4Elz48FiDZ
54YO//QDi3ZPytuuzLa02/Z3G0MRJkuBg3UZHF3hPG8/2DUZP/778brweyMIPQD0
8CzxqmHt09n6khLTNHTGjoGjwU2kN9ZfFR20dSjlRRyrHvvdUv+jfTqAZfwP5lo2
ezfPh8egJYcd4wtkCD4L7C+jnttGTA==
=Hz1I
-----END PGP SIGNATURE-----

--Aw7vIz3sK1rpMdsF--

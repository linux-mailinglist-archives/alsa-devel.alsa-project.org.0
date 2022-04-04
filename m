Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653FA4F15D0
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 15:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0840716D1;
	Mon,  4 Apr 2022 15:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0840716D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649078692;
	bh=tCSYa1fuEtZIBfVWvKo6VO6FlHRCRYIuc3x6jjBJ5jo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TuyHE56S00x1K5iEVTwDK4R5mmBk70dwO4voE3M2nCZQ2MaA7hcNwWfE9yQHL3oUf
	 rurma7e6+loEB6SaExutn5fR68N6XVgxHAoIQ4GSM9aWMCPrXM4CKpX527C/ZqOw9g
	 q9RoGCYo3rWVzex2knnE0HSdZcGldMX3Hh25Rna4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 606EDF801F7;
	Mon,  4 Apr 2022 15:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B4FF80162; Mon,  4 Apr 2022 15:23:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12A1EF800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 15:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A1EF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d4+6mBOA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A6A561232;
 Mon,  4 Apr 2022 13:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE81DC2BBE4;
 Mon,  4 Apr 2022 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649078618;
 bh=tCSYa1fuEtZIBfVWvKo6VO6FlHRCRYIuc3x6jjBJ5jo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4+6mBOAJwMGXVvCpi7WBjdQjwPgNjtJ9ApqxbeX9Qn/z1zzwclRtckRhXXh7dpxZ
 tc9+DbDEFSZXlYQcjU+hdO4Jra82n3wizNIruKCWOWQadJlOJZ8HqUZkCGvgnMm2zt
 RkNCeE2BqbeOAXirUaQHQ5Ab2FSh7FCTnWgjgQmEDc3+9qyZj81b6niJV/ZwY7ud02
 bqrVTP21rdlFsICY2SIEWoDfW5OQ71lnulol5ZFEl9ahupLPR23iOBNoDQf/SdgPQ1
 8puJPglmp2LkNzysDT8IznqzMe9wjSvHxOCANfKDFR8dyt6LNCyXX+RU8IdWOPV9DM
 ccLwyQ5HV6Gqg==
Date: Mon, 4 Apr 2022 14:23:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v1 2/3] ASoC: atmel: Fix error handling in at91samg20ek
 probe()
Message-ID: <YkrxVpO8vQxHjuUY@sirena.org.uk>
References: <20220325154241.1600757-1-broonie@kernel.org>
 <20220325154241.1600757-3-broonie@kernel.org>
 <cc73b6ab-9b76-6359-5c2c-7199ed5a3166@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="62cxRDxb1oiRs2UF"
Content-Disposition: inline
In-Reply-To: <cc73b6ab-9b76-6359-5c2c-7199ed5a3166@microchip.com>
X-Cookie: Did I say I was a sardine?  Or a bus???
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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


--62cxRDxb1oiRs2UF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2022 at 12:47:27PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:
> On 25.03.2022 17:42, Mark Brown wrote:
> > The error handling in the AT91SAM9G20-EK machine driver probe did not
> > consistently free the SSC in error paths, sometimes immediately returni=
ng
> > an error rather than doing cleanup. Fix this.
> >=20
> > Signed-off-by: Mark Brown <broonie@kernel.org>
>=20
> Should we have a 'Fixes' tag here?

I'm not sure those code paths are ever executing, I really don't think
it's worth the effort or noise checking.

--62cxRDxb1oiRs2UF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJK8VUACgkQJNaLcl1U
h9DhxAf/doLG2EvvT0Glnf/kahhfQDQMbucF/mEz4FlJ0o3zwIRqXgRGObW0dYOv
6SAcbVO9T4ZnZxr/Bu+d6bIf4b0NrfBx185qpa8j1waWC009c2XmQJedKyons+Rh
Dpi5WroiAzV8H52oeMplbu42j4n31kJ4yjP3Whxquln/GVijnzxmYF0xbHkIG/QU
dFIyi3R5GWNyP9z3dhBYwlRqtjp/G5CScE4IokbEaHOMOX77wLt4IwjWQuALgkIg
Tl9F/Hv89t26ZHNT8oISfbQ5HgtTZP8ZaRsesE7OnPRln7k6nJmflh0l4wJrkO3L
t4bYFEH89o89PWODuOFgOLDJ5EW5vw==
=VRNB
-----END PGP SIGNATURE-----

--62cxRDxb1oiRs2UF--

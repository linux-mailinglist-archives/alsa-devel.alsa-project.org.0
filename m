Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597DE1AAD4C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 18:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F07261675;
	Wed, 15 Apr 2020 18:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F07261675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586967968;
	bh=AYPtS0WYn7H0E9PHyEfI6x2/DOj+Yai+eeorng2znKI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PBm1MvfTU1NyUDB0pUeUXvFNIzIc6ViJfgevmkkfsmf3W36xmAXWmtYWlSMtQpJaC
	 F4oUbJUxWBxMhvS0N66f+TWnDoZ9+/4KAFlxcTw7meRM44u2RGrPi4mD9xIlp17VcI
	 9PzoWzvBM4lgnVbZ5EHoZJ1SwndDp6U+e+ygkVzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59382F80264;
	Wed, 15 Apr 2020 18:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E132F8025F; Wed, 15 Apr 2020 18:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66910F80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 18:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66910F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kLk1w3Tm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F0A2206F9;
 Wed, 15 Apr 2020 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586967909;
 bh=AYPtS0WYn7H0E9PHyEfI6x2/DOj+Yai+eeorng2znKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kLk1w3TmchJiUPIe10WuPbeSkMldK/0Wq18qjxpzYBAl3uQY4SqrCC/8Bv7D4tVvD
 TEmkSlnhTOw0Rokgd9YNTV78Ne4d/VRzuLuE4soUhGi9hUm3yKoNoL9rLi1XdgRaH4
 sMqE69DntHmURf7FN2A7K9yihVim0wjoENhwK1Mo=
Date: Wed, 15 Apr 2020 17:25:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 8/9] ASoC: rt5645: Switch DMI table match to a test of
 variable
Message-ID: <20200415162507.GG5265@sirena.org.uk>
References: <20200415145524.31745-1-andriy.shevchenko@linux.intel.com>
 <20200415145524.31745-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline
In-Reply-To: <20200415145524.31745-9-andriy.shevchenko@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
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


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 05:55:23PM +0300, Andy Shevchenko wrote:
> Since we have a common x86 quirk that provides an exported variable,
> use it instead of local DMI table match.
>=20
> Note, arch/x86/kernel/quirks.c::early_platform_detect_quirk() prints
> the detected platform.

> @@ -3674,13 +3675,6 @@ static const struct dmi_system_id dmi_platform_dat=
a[] =3D {
>  		},
>  		.driver_data =3D (void *)&intel_braswell_platform_data,
>  	},
> -	{
> -		.ident =3D "Microsoft Surface 3",
> -		.matches =3D {
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
> -		},
> -		.driver_data =3D (void *)&intel_braswell_platform_data,
> -	},
>  	{

Are we going to convert all the other platforms to using a variable too?

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XNWIACgkQJNaLcl1U
h9CV0wf/em9G/ERwnZy11DLRg2vrxZxULM/L8dpShtUtkEt3v/SYJ85NTVR9CAJD
vjbPS3J/WeRpLmdCalBk8O/QTApngJnK/q4xz0v+/qaYTWQYwlE+NXvsHa1l70Fb
v5H1hEMwq+2ZeDv3TwU0yAuDK2HlC/IDlppdWDGT5k5tQDAaCVzbs8sMm8fbCa2b
avEyI1dX3f9ovT6qZUiFEhudRVXLKrb56f7pecBIXtP/jalNrZ8MtKGxNHgDzDzf
tpXHfW9UH+7cvEn2ZShxvm6O++ye1gmRlzfnHLtf0Y7qlGN1dTVlVgJ2Vw1DubvW
9SJPbBT5dfSidGq/aedmAqzpVbddKQ==
=HWhC
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--

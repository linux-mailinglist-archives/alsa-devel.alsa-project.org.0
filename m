Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B01595CE7
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 15:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27A69823;
	Tue, 16 Aug 2022 15:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27A69823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660655552;
	bh=cUGEuewQr5T7ATDFFgHEkcWJr88Db68A+qQ8umP3pxk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=koPNENrqiK4KmLg5sL6xQrQda13pDq0jotxSW7+7qSiDvfgf5reSz5fGXYmfDMHDn
	 Gynfsx3vIIlnGKo2QvSSzIzWjCY4EiNlztMYi85NDqeiwzu2Jwckx/Mb4g3hzPwTep
	 1L51O5SvdEyWVD8yX/RAzFg3P4bRKDz0hYmrE59Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC5C8F80424;
	Tue, 16 Aug 2022 15:11:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5216BF80118; Tue, 16 Aug 2022 15:11:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 303CAF80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 15:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303CAF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LSRmVmG/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FE5661360;
 Tue, 16 Aug 2022 13:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047DBC433D7;
 Tue, 16 Aug 2022 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660655484;
 bh=cUGEuewQr5T7ATDFFgHEkcWJr88Db68A+qQ8umP3pxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LSRmVmG/RDAf3hAE56TVECQ9fQBWE8/8G/8OeWFgn3JPVs2wF3TmZPQzQmBZeNf2y
 SIcZSlKS4XIHJDgrhJo26dtisPn0yelTRPor7MJNCFP+kA5z/pbUuxzSQGOi0TWjO7
 t1NlzB+88tq0kNe+hX2stMx/gKtdm5jovCD5ER8Yh78OCht/n+VBaQ36gm9O+D21g6
 Ev+Pff+bOsqrUiJRLAYt1lW4qWKVnqRtuAlW4JurLeSqeE7cZrIuTDGo0t3LX1sjaZ
 Z2rWr8HqiORnkixP4d8f+muGETiaAmYIq+VAjVaHGaiWClbFaslKXhLbCIn/vsY5/2
 itFBOGv+xLB5Q==
Date: Tue, 16 Aug 2022 14:11:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: ASoC: snd_soc_info_volsw and platfrom_max
Message-ID: <YvuXeJ+/TnB0kojz@sirena.org.uk>
References: <b5c31f8e-9401-6ec1-cfbf-3b0977df6fc2@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1ELEUEm1T2hW+jPY"
Content-Disposition: inline
In-Reply-To: <b5c31f8e-9401-6ec1-cfbf-3b0977df6fc2@linaro.org>
X-Cookie: A bachelor is an unaltared male.
Cc: alsa-devel <alsa-devel@alsa-project.org>
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


--1ELEUEm1T2hW+jPY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 10:22:37AM +0100, Srinivas Kandagatla wrote:

> before this patch the controls max value was calculated considering the m=
in
> value, but with this patch this calculation has changed resulting in low
> volume on most of the codecs that are using SOC_SINGLE_S8_TLV.

Right, the whole situation is unclear.  At various points the code
hasn't agreed with itself ragarding what the platform_max is relative
to, if it's taken into account and all both within individual control
types and also between control types.

> snd_soc_put_volsw does the right thing by considering mc->min, but
> info_volsw does it differently.

> Below change fixes the issue for me, but I am bit confused with the first
> line of this function that calculates max value as max =3D mc->max - mc->=
min
> and then limits it to platform_max.

The issue is that it's not clear if the platform_max value should be a
value for the register or a value for the control.  For some reason
(which frankly is the source of a lot of the problems here) the controls
adjust the user visible range to be zero based even though the ABI would
be totally fine with any range.  There were out of tree patches that
changed things for some of the control types too.

> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index bd88de056358..49fb34609202 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -196,7 +196,7 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,
>=20
>  	uinfo->count =3D snd_soc_volsw_is_stereo(mc) ? 2 : 1;
>  	uinfo->value.integer.min =3D 0;
> -	uinfo->value.integer.max =3D max;
> +	uinfo->value.integer.max =3D max  - mc->min;

That'll then break anything that doesn't set platform_max since we'll
apply mc->min twice, you'd need to do the adjustment at the point where
we apply the platform_max override.  Keeping platform_max a register
value is *probably* the least bad thing here.

>  	return 0;
>  }
>=20
>=20
> Or should we fix the macro to set platform_max to be max - min.

We shouldn't be changing the static data at all, that's one of the
problems.

--1ELEUEm1T2hW+jPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7l3gACgkQJNaLcl1U
h9DC2Af+LbM3EQ+8jEIpBpGVKKm2Dm8aV6tBXZ+Np4zN+jAnWMiCTSZLGo6GKQz+
iBncXP1PSGYpvsCZdJjcH4W/h1UEoEMndVeN5Eg3yDOlK+vX5hjy5U8IuilqVZkH
WPOk61EGilILs7LORpr+pQWAdksOmYtKWlENDabp2BNbl1mJVhhA1EfVizLJnkyy
Ta6wyggpKwKkXwGEseTnM6oNKnuDK4gXnuJTiZp3MMsMahzzmm435HYQ+GIUDwXH
hxetWcWWkQsNJDbrR8NhqfXO7c5umIKhreJsYxri6RG9X+3BKsGNmSIyUFiF+3Zd
wUdBLxtp3zYNfVGTLG0FtaUruGa1+w==
=rrvw
-----END PGP SIGNATURE-----

--1ELEUEm1T2hW+jPY--

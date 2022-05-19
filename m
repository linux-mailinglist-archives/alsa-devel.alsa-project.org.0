Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2252DB50
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 19:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536531750;
	Thu, 19 May 2022 19:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536531750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652981438;
	bh=pAMdh9/R3I7a/8+4GVZ2KD6esehSzWVgjc9kd7I5PqU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iO1HEMrNq7XszYuQfPC3v2R+PVlVwYFsnKnfn2GoaDk0AC0kHrt53/H8xGVbzq7cN
	 /UIo/dnRze5Kbi9IEHrW5g3aT0hubBc2WF/u0NhGr5vrjblOu9d+L6OaGTPHEGr4Y/
	 49mPdrvO6nkOKvPXJiB4J04DZ609DBnbUpHplSeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0DEDF80109;
	Thu, 19 May 2022 19:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E45F8025D; Thu, 19 May 2022 19:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13E9F80109
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 19:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13E9F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VHrPdJdb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EE766181A;
 Thu, 19 May 2022 17:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74195C385AA;
 Thu, 19 May 2022 17:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652981371;
 bh=pAMdh9/R3I7a/8+4GVZ2KD6esehSzWVgjc9kd7I5PqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VHrPdJdbdIZO3JP5Q3lP0hUqu40Hg2ms4yr+tw4ezT/HzL5HljDMDohamaVFnHmW3
 4aeolGM02T04HW4Op7oAM7PhXbduMT1PBnN5IuDVjWGcHtauNHdLCM4l3KkRVdEAVG
 sX7QhlFbzzS2qIIwLBM52tXJwIhMohlU+NB9p5rgaJ5au1imsNrM1Fixpwn8/l0CFF
 5/4GV4xmfc5KBq/9k1ijtY3J0ZJNMbdGgLipWdioD7yUYzdpUaO0E45Dlvb7E0KMIC
 U8cCmcTZI/FKtzZJgl8xWth3hzks0+XA+vApne++BQJcyRmDion/oWoIwrSZ0GVAuo
 kHUf7UGaEz+tA==
Date: Thu, 19 May 2022 18:29:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: Re: [PATCH] ASoC: max98090: Remove unneeded check in
 max98090_put_enab_tlv()
Message-ID: <YoZ+dmprwb5Ohto3@sirena.org.uk>
References: <1652980212-21473-1-git-send-email-khoroshilov@ispras.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ppdkrA27TUG4wtEx"
Content-Disposition: inline
In-Reply-To: <1652980212-21473-1-git-send-email-khoroshilov@ispras.ru>
X-Cookie: Some restrictions may apply.
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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


--ppdkrA27TUG4wtEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 08:10:12PM +0300, Alexey Khoroshilov wrote:
> Variable sel is of unsigned int type, so sel < 0 is not required.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

>  	val =3D (val >> mc->shift) & mask;
> =20
> -	if (sel < 0 || sel > mc->max)
> +	if (sel > mc->max)

The check needs to be moved, not removed.  The userspace ABI allows
passing in of negative values.

--ppdkrA27TUG4wtEx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKGfnUACgkQJNaLcl1U
h9At4Qf+Klf++o6ghreVouOuu6V81GODduKtt5M/lMTy6+q3iCORLhZxKFplkCVh
6bQ88I9fwm4GRJXG6SsVKqyRG/HEAJKM2batDPlkZHi2KjX0u48WfFY67vMIzNpc
MFkOkI2L94dm2PdkcVWXKROeEWdJHRl55Oz3NZNfM9ggYd2H0P1ddwtGIe82xAQW
pwVuJWEkstrqvilKcwp2HcQzEko4tm3u6MoN8/H+TZsc7c/zEvSY3OxAv9wFnoD1
1geFeHG8YlycJcnTc0zEEGFhaRDBvoqYTWqQLevlnxJx9GPMmNI1zlm4JsPhqZiE
Z4AhXYOoxW8ySeRdopqDlftSHTrqEA==
=HHuh
-----END PGP SIGNATURE-----

--ppdkrA27TUG4wtEx--

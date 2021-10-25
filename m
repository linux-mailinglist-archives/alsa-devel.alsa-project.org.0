Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8774395D9
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 14:17:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E18816D1;
	Mon, 25 Oct 2021 14:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E18816D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635164238;
	bh=c20Y+CBVP1rQ3q8ZreYoK6aSKZoxnVw1Pl+dYFfGyI8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sSnaVegkO7gdac3oFSEFsAuUXfofhYiopUULSHI7dXTCD/uwXJnY/81GTHMbDomWz
	 dR6Vnent4qp0p2s/iRfOToTEA4XGMD6sfhrRsy1s+2xsDjK+vvOmekDk/MxRBmOtYH
	 OauNEJRDrh4mvK7z+iLm6wo5JmlcGWW4yl/OWgKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D24F80271;
	Mon, 25 Oct 2021 14:16:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C340AF8025A; Mon, 25 Oct 2021 14:15:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0C99F8010A
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 14:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C99F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AgYEfspL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C53F960FDA;
 Mon, 25 Oct 2021 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635164147;
 bh=c20Y+CBVP1rQ3q8ZreYoK6aSKZoxnVw1Pl+dYFfGyI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AgYEfspLjhU5wHqVSWk4XHgkr9RIWttYase0BwKdwZm/S6EtipiEIqPj0kck11s1b
 /hlXYuydR2V655dcrr3vN1YBfl4U0FYbfadkfPJXmwSWIJFZz5mt7U5fTzYWUlV/PY
 qD+eLmuXEeUMApLNp5PGLbpD/5bRunCKJBzejrlYN/eyWjC9ZRTHBeGsP81vAxRCzp
 IeJGLQ8/YgtbJCpIHM7tUlN+1Tgp8Sm3DaPjGzZhyxXOsS2w0fKsiHrctX61V0wdqW
 sR+1UmjkPWoWCtqRx0E9yA9XWM9H78wf+ZhPPZahJelxPdVyUwFY4w2FtWfydyjIen
 Khbw8DQsNM5eA==
Date: Mon, 25 Oct 2021 13:15:44 +0100
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: nau8825: add set_jack coponment support
Message-ID: <YXaf8GGVtH0S9oAe@sirena.org.uk>
References: <20211025113857.3860951-1-CTLIN0@nuvoton.com>
 <20211025113857.3860951-2-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iZzbKOFQQ2wp/57I"
Content-Disposition: inline
In-Reply-To: <20211025113857.3860951-2-CTLIN0@nuvoton.com>
X-Cookie: From concentrate.
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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


--iZzbKOFQQ2wp/57I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 07:38:57PM +0800, David Lin wrote:
> Use set_jack ops to set jack for new machine drivers. Meanwhile,
> the old machine drivers can still call previous export function
> "nau8825_enable_jack_detect".
>=20
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
>  sound/soc/codecs/nau8825.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
> index 67de0e49ccf4..e7a6bd918be3 100644
> --- a/sound/soc/codecs/nau8825.c
> +++ b/sound/soc/codecs/nau8825.c
> @@ -1434,6 +1434,12 @@ int nau8825_enable_jack_detect(struct snd_soc_comp=
onent *component,
> =20
>  	nau8825->jack =3D jack;
> =20
> +	if (!nau8825->jack) {
> +		regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
> +				   NAU8825_HSD_AUTO_MODE | NAU8825_SPKR_DWN1R |
> +				   NAU8825_SPKR_DWN1L, 0);

This looks like a separate change to support disabling jack detect which
should be in a separate commit.

> +		return 0;
> +	}
>  	/* Ground HP Outputs[1:0], needed for headset auto detection

Should really be a blank line here.

--iZzbKOFQQ2wp/57I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF2n+8ACgkQJNaLcl1U
h9BRswgAgunSlEDrFtpQ17tteZgjhyzOntQeNGNh132EScXSDHNDpPYaK8aWEA47
UezsFkan8LC1H0UsRbX7szsokNjlVfwck55IuXXhWGQxYzjU/IjROikrdfC9bH7J
ZA2oQMA8sj7tVqGiKmwUy4ujTf42b0nZOC/8u9eMIH5vshu9IszBIRFjTz+CJjAQ
ctNJmvkddM5X0NUc3QjigA6WNdjf/65qIjCGDKLwKhZadRCgQ7TuQix98/EBnKyZ
Wb5M3hqdNxDZc2h4O1Rw2IsBKFLssPBhYiBS+WPvJdG8g8MuM6tMNfrYB4FZlSjr
rFBKvigP4FVIDiJXgI7LsTTw+su4kw==
=l5Ee
-----END PGP SIGNATURE-----

--iZzbKOFQQ2wp/57I--

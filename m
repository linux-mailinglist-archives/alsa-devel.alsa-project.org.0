Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3EC3BC325
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 21:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8226916CF;
	Mon,  5 Jul 2021 21:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8226916CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625513484;
	bh=q3ZTByD/UPcR9TQOFBpdTkGaFvLeAfYpSg0koE0aWN0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIas2L6AU+ZZMp7nJZ6xY0uAJyzQg8qLy4m/qzIzf4IEbHnASs0ov43+uf2Sa/UbG
	 p3mcfFqOfQmdqFxlI6TZ6caREL57rc5/Ee9bRd9eHZIkuz7rt3GWZgs8GLarySYjk7
	 0jvKoW3qbbR/CXb+VHo40waKxlu7rlBt8lnHpvOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D823DF80124;
	Mon,  5 Jul 2021 21:29:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6980DF80224; Mon,  5 Jul 2021 21:29:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BF65F80134
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 21:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF65F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hOutMW62"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B43B4613C9;
 Mon,  5 Jul 2021 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625513348;
 bh=q3ZTByD/UPcR9TQOFBpdTkGaFvLeAfYpSg0koE0aWN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hOutMW62HwviynA8QRiX7JsUDmzA4MGC6TXLa0ljCz5flVdv8k3rY4v+UhkWHEPAm
 InZTgcjru6U0qSR36iO9RVdd7ZPevMTnlTbyVPHNg2YROeLQzQXZDeXSTlcMBesDub
 NyH5L6nPhp82rxh94v6IjsW761ly/c7TXikzQD2CMBRYI1ZEWlZtxgtEhlOmTfasza
 bGeFDENm/8wbbwpINpH3XgeRFSBDd5r2n/AxKbhMin4/pErWRoIaxUfKG3Ab0K1h9M
 FL06PjvJDoCouul8O9JPcsGXg5t92kRW53lLJZGEh7YOeK/QZBH8kh9+d/bVKU9AqB
 atuOuaw8JLpqQ==
Date: Mon, 5 Jul 2021 20:28:37 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v3 2/2] ASoC: cs35l41: Add bindings for CS35L41
Message-ID: <20210705192837.GH4574@sirena.org.uk>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-3-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Rn7IEEq3VEzCw+ji"
Content-Disposition: inline
In-Reply-To: <20210702205127.1400539-3-drhodes@opensource.cirrus.com>
X-Cookie: Star Trek Lives!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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


--Rn7IEEq3VEzCw+ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 02, 2021 at 03:51:27PM -0500, David Rhodes wrote:

> +  cirrus,hw-noise-gate-select:
> +    description: Hardware Noise Gate feature. Each bit selects
> +      a different block for detection.
> +      000000 - All noise gating functionality disabled
> +      xxxxx1 - Amplifier noise gating detection enabled
> +      xxxx1x - Boost converter DCM detection enabled
> +      xxx1xx - VMON low power mode detection enabled
> +      xx1xxx - IMON low power mode detection enabled
> +      x1xxxx - VP brownout prevention detection enabled
> +      1xxxxx - VBST brownout prevention detection enabled
> +    type: boolean

That description doesn't appear to be for a boolean field, either this
should be a number of properties or it's not a boolean.  It's also not
clear to me that we shouldn't be able to control these features at
runtime.

> +  cirrus,invert-pcm:
> +    description:
> +      Inverts the polarity of the audio signal output from
> +      the Class-D amplifier.
> +    type: boolean

Given the potential confusion with the audio interface it might be
better to call this invert-class-d or something.

--Rn7IEEq3VEzCw+ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDjXWQACgkQJNaLcl1U
h9D/sAf/ccV0v6/q4CQGzoHbbWh4RFtbyl9Mpegbx9nap3S/8ygpR6uWeLndLFVu
TJ/pn9B/SZrWmGipxK1oRT2lrPjCt3RzvIhhxgELgp56nu1Tq1iVvDLyV7aB0Y18
MJwWAo/wJy68vrIYGAOgp/TxxjYhu/j4ZZmC5SLRoJ/sMkQpbha4Zo+mn7/y1xc7
VTw4SuNF2fkLWBltkuPg4MeCizjPZhlml6DUCDz6Lil19olX7CHUs8Msqz/NBKkf
3TuYcYvaeEHawvoFk3AnPOlDVIq5GpsuaLrxkEYSREM/N60yvjJw7+Eo7yX71sW8
5MrIIFvZGq6f07B5JgGBOAGXhzE2Aw==
=7b7u
-----END PGP SIGNATURE-----

--Rn7IEEq3VEzCw+ji--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6322E3E3B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 15:26:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E670A1729;
	Mon, 28 Dec 2020 15:25:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E670A1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609165560;
	bh=lGErfxxzbn0Ii22/b/IifQuVSKKVZl6XKfYzpme7JKE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVfwVOsuttxGLN6uma8goe9XZ28Vj5ddcMnfqK93nHC65+cI/bTNDg3TDl+eTSIA5
	 +lfV0tF2TjMlkYQ2D/heUo9u1QpKp3/Vf8yNx+Pb/c3jV0hdpprGP8lYWWCSTKgk8O
	 b75F5lcQibp0i673hwCEmarRGC218J5OQZNU4iUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2109FF80143;
	Mon, 28 Dec 2020 15:24:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3307F801F5; Mon, 28 Dec 2020 15:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD947F80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 15:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD947F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PBWNGIQ/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63C7C2245C;
 Mon, 28 Dec 2020 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609165456;
 bh=lGErfxxzbn0Ii22/b/IifQuVSKKVZl6XKfYzpme7JKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PBWNGIQ/Uf7HYu1pEA4q1cF9tk4BNI2PqOhpxdUcz9TQMwwLWNQbSK6HGaSd9iX5y
 U/cWh+38+hDCYzFfwvzuVdIOLY40ku+xpUPcCIvgK92Ca8ZqS7xyZNRCMt5gjjuowW
 BxviIqdvj7fIB7XKIgd9ddfIfPHCgfa81K5djKj+5CY0Wt9OWi1g3Yx7TZFktS1kg6
 DyPwMBxBBmlKLJLoX0S+lLPDWg5uobQvnQpGiwhE1gQkbCbNLQbAlkBP/hDGkRfz93
 VECbrzuqqTzhJIkIYhLJBUt9MLdN+Vc6gDQ/nqp36f5kFN2Fi1Nd17ytlMAXn2fkLC
 hugI2glMZgF5Q==
Date: Mon, 28 Dec 2020 14:23:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad
 X395
Message-ID: <20201228142355.GC5352@sirena.org.uk>
References: <20201227164109.269973-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline
In-Reply-To: <20201227164109.269973-1-perex@perex.cz>
X-Cookie: To see you is to sympathize.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>, stable@kernel.org
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


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 27, 2020 at 05:41:09PM +0100, Jaroslav Kysela wrote:

>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "20T6CTO1WW"),
>  		}
>  	},
> +	{
> +		/* Lenovo ThinkPad X395 */
> +		.matches = {

This has a context dependency on your previous patch so the two patches
should've been a series, git can't figure out how to apply it
independently.

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/p6noACgkQJNaLcl1U
h9DB3Qf/TKaKRV7U8je6M8LAxfXgue68OLqci/ti4Vk9BSiNkq6k2T21nEW2/MW3
7vJ+z7ygP5+3OW2JxVc38rZktgg6Xw1VicksBCqqCTXx9smeTSfRcLqJy+WUeLRO
4zoYPK9q88WWhATKvx/X0CIb/0wZ+lMPN8jyUz8hBtNoAnZYXfHedp1RG+vFEgD/
ZQSqbw581FqCgEmUCghTEjX8RBldJjL7Cm13q/Y2Vk67v8q1sk+tDcEGwnHOPSis
3uB9zrv2bKWAr2g/9PIUig/YriaJdIMgrQZRPNlnBksPVw+Xtnv9GkZ/5UeQcPSh
p66xHkG7TF7wYR6X59YGiZyB9IFR5w==
=tRuP
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--

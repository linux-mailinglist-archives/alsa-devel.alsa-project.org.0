Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66A3EA367
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 13:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 268191A97;
	Thu, 12 Aug 2021 13:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 268191A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628767266;
	bh=XUJXqSUb66yuP6/NI70YfEAOmfUm+IOZzKo48swWWnk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=De5zif9pBj9sTD02+aHOfDQAywR+31aPuJIcwUjBj6TeWfGc06s2KwwJ/4rwtc/wx
	 3ytZSv1k5mDfehQLx8gtEcL0LeIHW6SPKgaVCfiOWR4N3DN5/6GTSJtEoNKCFejqbW
	 zs/2w+0hPBswOl6eQ3Vvu2raSg4vUHqcF5lktjkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F5D8F80279;
	Thu, 12 Aug 2021 13:19:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA11EF8025D; Thu, 12 Aug 2021 13:19:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6511BF800AF
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 13:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6511BF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oB4TSJYW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7F9060F91;
 Thu, 12 Aug 2021 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628767164;
 bh=XUJXqSUb66yuP6/NI70YfEAOmfUm+IOZzKo48swWWnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oB4TSJYW2WQPfeXEzqZrb/gC7rmb19YCeeuat2IURQN7oI9nrnWlLQZVHQ2v7cff4
 0q9HjFJOcDf0zxvYW0ekgI0CazEJU+H2GiuWkK8j67v3HfUc+LFVb0XPRcglEYQgrD
 a79raoqYiT0mHoQMDIcsUX3bEk5nQvfcvkyP87DbaalV6a90nYms/3pGY/RahjClW4
 AIYb9C/VDeLZuLea4Y9yxj5+Tol2MKP215VQ0wRzJpuLYz5rYyoOvQNbUJoCxlnFAI
 ywKVSulUdy8MtKtjmK9RpSvzrjoNKE9Rc9q64LHM9S8kY4gc/dqZ3bZwRd8hEEuq4Q
 WmoffIHP7DY5A==
Date: Thu, 12 Aug 2021 12:19:04 +0100
From: Mark Brown <broonie@kernel.org>
To: "derek.fang@realtek.com" <derek.fang@realtek.com>
Subject: Re: [PATCH 2/2] ASoC: rt5682: Fix the vol+ button detection issue
Message-ID: <20210812111904.GA55607@sirena.org.uk>
References: <20210811083750.26680-1-derek.fang@realtek.com>
 <20210811083750.26680-2-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20210811083750.26680-2-derek.fang@realtek.com>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 04:37:50PM +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
>=20
> Fix the wrong button vol+ detection issue with some brand headsets
> by fine tuning the threshold of button vol+ and SAR ADC button accuracy.

This doesn't apply against current code, please check and resend.

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEVA6cACgkQJNaLcl1U
h9CiTgf/Vo7b3UwlOsjKPdzq3zqy0a6mkp0u8Gwqo6tJlTl8bJvdEFl5vhb7zJ70
aVxkxk1J8ft6cykV91I1OTPP3ijP/jqc/c6M3lAlcDrTK7eDLDzfi6uPptmngfPS
LPqtu1401mcKo7tWwBXWyoue8B2s6Efoj1Qqu+Je/Q631tUqkPV8aRi/xVVics0Q
itpIWiYFjTi4+6noWXZvpMDPM/DS46+G8eccSmiPr47/rCmTQgkQSL9zJGtX5D0R
PNX9ViGt0ok85HDLyy3vvPAcrfRoAw3NoTjGqJGwNtEA5SXvqGOgJ2MgA/0tArSH
lUpwmyGrnd8mubmpKMKHHb+PB8Jvig==
=3e+9
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

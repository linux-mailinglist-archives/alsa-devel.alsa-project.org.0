Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B403A85BF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 17:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D36839;
	Tue, 15 Jun 2021 17:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D36839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623772681;
	bh=36idZgnOU3LKGeU+scOXXaBT5XE7CPa302LIYn4vuLg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7fdz+QO+7A/h6NhN7kJIj8fvvrc0HWBgSpcBTs4uMFVa67g5XbP7EPJKhN2ftqyn
	 gmk/KuHe13MPbAvRqp1LrtaadEziSQfnu1qC+ZIxYo2SAEER1xu4XJO+nmujZ7Vxwo
	 6PgA85jS42/R2kn/vi4U3t2KYZOdzkIYEV1ckQmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C40AF8025A;
	Tue, 15 Jun 2021 17:56:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11F46F80171; Tue, 15 Jun 2021 17:56:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF7A2F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 17:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF7A2F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YNJ1uYZI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2309960FE9;
 Tue, 15 Jun 2021 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772586;
 bh=36idZgnOU3LKGeU+scOXXaBT5XE7CPa302LIYn4vuLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YNJ1uYZI5GYbGSmN9mprHggkI/XDSzE4kQJuo+7pYNKgu89u3GMYX5PUtbKLzJ5G0
 7AknviIQIsOPwkvZ0hvA3iq442Q+e+xpvZ/CPWCnPqHG+Xj51YEm2g35HS9l5YlTLc
 ohao2fGgMVj7gM5TYI1bZOsVK/ihgb3e8bEO14y+o79dh26hfI4XyVQTNH3L3gKhDq
 6wVGXT1ZtCCP5JizIQMgDksKkJlgJNjyNu1g1gDNqtBOEl1zyswI7e6vg4/zzG3Hf3
 a8ls1SadEdOhPkryC7xQ9E2NLC/Efh/W5rq/uBY4L+sF+ij39cVgfi6KG+iY16U+sU
 +VHl32eSFsiMQ==
Date: Tue, 15 Jun 2021 16:56:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.12 11/33] ASoC: AMD Renoir - add DMI entry for
 Lenovo 2020 AMD platforms
Message-ID: <20210615155607.GN5149@sirena.org.uk>
References: <20210615154824.62044-1-sashal@kernel.org>
 <20210615154824.62044-11-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o+ZCuNqY+dEAKBWl"
Content-Disposition: inline
In-Reply-To: <20210615154824.62044-11-sashal@kernel.org>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Pearson <markpearson@lenovo.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Gabriel Craciunescu <nix.or.die@gmail.com>
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


--o+ZCuNqY+dEAKBWl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 11:48:02AM -0400, Sasha Levin wrote:
> From: Mark Pearson <markpearson@lenovo.com>
>=20
> [ Upstream commit 19a0aa9b04c5ab9a063b6ceaf7211ee7d9a9d24d ]
>=20
> More laptops identified where the AMD ACP bridge needs to be blocked
> or the microphone will not work when connected to HDMI.
>=20
> Use DMI to block the microphone PCM device for these platforms.

You've backported the fix that reverts this a couple of patches later in
the series but might be as well to just not backport either, the end
result is the same.

--o+ZCuNqY+dEAKBWl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDIzZcACgkQJNaLcl1U
h9Cg4wf/aWyS88Xn4pMmrZ6M1yoelx3k+LJ18g9k0vMcKIcHIpvfo9Gz3XQnpC8A
nhGd5vzUq/xVErjPt7hPaumSo8agpyXr0aj/j/XgniJ6/ZevbRbghnvR9IYIn53V
PW1UFOMbU5kRENPWePjhak7qh1Ifo2IajDiB0qe9go9lLAQe14eusHRL3NBGG8DF
CpHFzKfXx9nbXQ+I3nz2RgU9+LO1P0MH3qMNR3zcv+Rx0qy3vVWl8gHxwrm3h1y6
v54l26h1bDxlVg9RRqpwZvnyrY1bPEuB5yxwY6p23e6+GE7diiElGR7tMfd8jxwS
6vDy2xs893Ao/HWy17RcWnZIpjqNSg==
=15cD
-----END PGP SIGNATURE-----

--o+ZCuNqY+dEAKBWl--

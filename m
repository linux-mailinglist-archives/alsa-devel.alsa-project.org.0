Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1061736C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 10:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB2D18B4;
	Wed,  8 May 2019 10:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB2D18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557303280;
	bh=qavAAJxBhHF4gNiQmbMnEquk574n2csA/KKuMPqJQjU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHQxdsmRAcgzep4DMlbw2RUJB5tUr0pOkfT/+Lqz+bfRVNalE1kLbNHT24N+KeZ0G
	 e6iJ5BEO9v4CPTzAPCxnYLYqzH2aT47bTCsd5O3erNZq1SbFRZx90Snh/T00Oc3tiC
	 +rWg2SMNVnOsgOroedhTLrKhnIwf+vr6I80WSRmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4426BF896FD;
	Wed,  8 May 2019 10:12:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C471F896F0; Wed,  8 May 2019 10:12:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74489F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 10:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74489F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hE7eLT+9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pkLrRM8WwERKArH5Dv/+tMtKVp5mCK9iWIXDavXWmDQ=; b=hE7eLT+9OnW9jXDsqOAzlbnaq
 UxB75RtNBP5JXBawrzP51jpflo7rSj2vVrhYlBF3OQZVoQ3UulYCHI/qAgA0TEaF0dvLk+AAMZKr9
 WICI1mezyowfhM6Bwwaj6my6T8djibMVhareRgZ1LKmY45IvORgSOt4fj9n2ZLBSoUBWc=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOHh1-0007RG-IF; Wed, 08 May 2019 08:12:48 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6ECD7440034; Wed,  8 May 2019 09:12:40 +0100 (BST)
Date: Wed, 8 May 2019 17:12:40 +0900
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190508081240.GA14916@sirena.org.uk>
References: <1556534756-15630-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1556534756-15630-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: cs42xx8: Add reset gpio handling
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
Content-Type: multipart/mixed; boundary="===============2556016506069326699=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2556016506069326699==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H6fQM4Loq/u8aogQ"
Content-Disposition: inline


--H6fQM4Loq/u8aogQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 10:46:03AM +0000, S.j. Wang wrote:

> +	cs42xx8->gpio_reset =3D of_get_named_gpio(dev->of_node, "gpio-reset", 0=
);
> +	if (gpio_is_valid(cs42xx8->gpio_reset)) {
> +		ret =3D devm_gpio_request_one(dev, cs42xx8->gpio_reset,
> +				GPIOF_OUT_INIT_LOW, "cs42xx8 reset");

You should just be able to request the GPIO by name without going
through of_get_named_gpio() using devm_gpio_get().

> @@ -559,6 +577,7 @@ static int cs42xx8_runtime_resume(struct device *dev)
> =20
>  	regcache_cache_only(cs42xx8->regmap, false);
> =20
> +	regcache_mark_dirty(cs42xx8->regmap);
>  	ret =3D regcache_sync(cs42xx8->regmap);
>  	if (ret) {
>  		dev_err(dev, "failed to sync regmap: %d\n", ret);

This looks like an unrelated bugfix.

--H6fQM4Loq/u8aogQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSj3cACgkQJNaLcl1U
h9DXlAf+NZvbXIKXu1i3ZnsLWQy9duLtWvd5Tqm52AG4yzPuCM4MW7+jUxPLDQz/
TX/C3cXHNDXdERXQbOBIUli6xRFu/4Nom56dXbLPbWiA77RNwAC5LuX+BEJJc5xa
mEUtDpoXFU3/+V5y9iSYRTwWW0JVq06LI/lFfhC0DfB8aHVzBJAVzWGMMt4uh1fA
IZxiKXGNU53fqM9SMtb1FJ8t5lZHwqRK1Ra/2fe0yivHq3+m71ZQXkCfy5DYDlnX
m3iew6+A0bDr+z0cdJmA8jgIAGyy6Po/+iYIASerYPGH3kJoFMytubH+fB+uVieP
QZCtbRlG+JJtBuBBHjivJk2UQvyWlQ==
=nWb3
-----END PGP SIGNATURE-----

--H6fQM4Loq/u8aogQ--

--===============2556016506069326699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2556016506069326699==--

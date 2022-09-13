Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B55B6C20
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 13:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348891738;
	Tue, 13 Sep 2022 12:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348891738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663066828;
	bh=F4BJY+Kxkpvktn6E6y/lEXX38MJ8/G0TYOUnjy7Afa4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0hOtqAicnz+gdVEubX8kguImou+17jjWYuuLqEZQ4EiKyt8qTYVNII3rLBd2y9oD
	 Bs8KrOCYkwrDGZikdWACqKJtXpkgygyOyDzD6pYY4a9eu7ilYoBWcbI+q/7RyTJobo
	 je/RL+LULi7NKt1ywatgr/fLU6MyU7OtXo5fgXdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A46E9F80154;
	Tue, 13 Sep 2022 12:59:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7063F80224; Tue, 13 Sep 2022 12:59:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B09E1F80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 12:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B09E1F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GdCaLTIe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 740E9B80E5F;
 Tue, 13 Sep 2022 10:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FEEC433C1;
 Tue, 13 Sep 2022 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663066762;
 bh=F4BJY+Kxkpvktn6E6y/lEXX38MJ8/G0TYOUnjy7Afa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdCaLTIeFRrkxukFM/KdYmFVc47TDeP2UljXuQG6Ns/imFhT1dF8hulzpd8j4sexF
 uVSo2EPxtsKIxj4OA+3V/YT+B9bL6cTsZ+XEpYArqsfpEt0zJXaTbhmDHIJ3uDVob8
 TQ1SXQw0MhKE6FQBRyRwCPGmuuKaK+lmNaHS8jNQNGj6tlIbMzwvRfJxaUhMbTkMZB
 YHnRSyNgvXgSOBIzX2Sm77H+3xqdSPtshEcNIibeWwFiGe4yED2NoxxczIwqqyp+c6
 XLpXhDCLB2TUXwoAHGjKUpCI986Douhdj4sQFeSL5Rbm3TydmCOEtsn27kL9gtR7OD
 1ntmwLQjTC9nw==
Date: Tue, 13 Sep 2022 11:59:19 +0100
From: Mark Brown <broonie@kernel.org>
To: AS50 CTLin0 <ctlin0@nuvoton.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: nau8825: Add ADCOUT IO drive
 strength control
Message-ID: <YyBih2PfrNbHpRag@sirena.org.uk>
References: <20220912115427.710417-1-CTLIN0@nuvoton.com>
 <20220912115427.710417-2-CTLIN0@nuvoton.com>
 <Yx8gm2iIsr04r5Fm@sirena.org.uk>
 <764fb482-743d-ade9-ea8d-8a05be297cf3@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gq18q9Ns247R3LcL"
Content-Disposition: inline
In-Reply-To: <764fb482-743d-ade9-ea8d-8a05be297cf3@nuvoton.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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


--gq18q9Ns247R3LcL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 13, 2022 at 03:25:39PM +0800, AS50 CTLin0 wrote:

> OK, maybe I should change property name to "adcout-drive-strong" and the
> description to "make the drive strength of ADCOUT IO PIN strong if set.
> Otherwise, the drive keeps normal strength.".

That sounds good.

> > Perhaps adding something like "strong" would be good - with the
> > name I'd expected the property to be a numerical strength rather
> > than a boolean.

> From our design, the register just have one bit for this feature, so
> the strength just have normal or stronger. Therefore, I use boolean
> property for it.

Using a boolean property is fine, it just feels weird that it
doesn't say specifically what "stronger" means here.  I was just
thinking adding a note in the description but either way it's not
essential.

--gq18q9Ns247R3LcL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMgYnwACgkQJNaLcl1U
h9Acbgf+O0zD7JPr0bc8pXjhWRbJBYYCnfwUsQniBVGETiMo3vWvzCa7EObF2QNh
sqhS6iwpMln7fAAM2y+1rkdX8wkbyjwvMuRFY6tK63qLDcD/3IDG1yUIbjj3HbHc
CWklvpzdfRIHS0NL54kr2tFVj3LNAp8WJ9Bo48GLJHvocaumFKWZLjsIpvjFHSHT
XapT4HFt5OHiRciT0c10Q1Dn8eZXrpfOLMo58i9b8+aYjtjBV+9grZC3BS3fg+wO
vby+MOHuiwAWu6LGFjZ3vXSv7X1SUjT5IJBYLsKjl3Nn+KX+KazPwF2T7JySabDS
vxfI8O4FHsRfdK55asczBdHuw61taQ==
=Ur+Q
-----END PGP SIGNATURE-----

--gq18q9Ns247R3LcL--

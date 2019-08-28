Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C1A1E02
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:54:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 283E6169C;
	Thu, 29 Aug 2019 16:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 283E6169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090493;
	bh=ky8uqrf95NE77epIcF5k2/j+55QWse0EtnN46/otU/g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uoLH6hQ7lr9J1bdEU/Ak83FGOnxx9FKMJ2DnC0Gl/MNATd+P9nLmBBQX1F8oq1utb
	 rHyocop4aQG2dosHXfDjpZzaX6xBpCH0e5xy8O36LIVy0Osv/h/4GyJLEjLP4qmHO0
	 iV6RB5HpsH9+eF7lq2NCpbny+aAlNYldLRbKyJr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0AAAF897AF;
	Wed, 28 Aug 2019 15:21:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA74F897AD; Wed, 28 Aug 2019 15:21:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BCF4F89799
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 15:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BCF4F89799
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iLe3L1gH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i2v9ZfjI/24aB0/nnkl9rXYDssmNkhsz6Gzw27HE2Pk=; b=iLe3L1gH9h6XDQqZ3eucASA8c
 5v/ejmTLJWnqcVniSLBjfiKnpxNA0tEoDwmSIHNML/KUR3Fth793joX3yi+FvWAbo7VO4nBad+UV/
 jXkGB9+hF/JJLRZDka/EYxEF4c8ZuC3U5hyFwt154WKjyfROifYehOQXENXSBEc6Pc4Ws=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i2xsf-0004Jy-6q; Wed, 28 Aug 2019 13:20:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9CE362742B61; Wed, 28 Aug 2019 14:20:55 +0100 (BST)
Date: Wed, 28 Aug 2019 14:20:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Message-ID: <20190828132055.GJ4298@sirena.co.uk>
References: <20190826090120.1937-1-shumingf@realtek.com>
 <20190828104938.GF4298@sirena.co.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BE5727@RTITMBSVM07.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <10317AB43303BA4884D7AF9C2EBCFF4002BE5727@RTITMBSVM07.realtek.com.tw>
X-Cookie: Oatmeal raisin.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "cychiang@google.com" <cychiang@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: rt1011: ADCDAT pin config
	modification
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
Content-Type: multipart/mixed; boundary="===============2860059883289927343=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2860059883289927343==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z8yxTSU1mh2gsre7"
Content-Disposition: inline


--Z8yxTSU1mh2gsre7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 11:01:21AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> > > ADCDAT pin config sets to output mode in default.
> > > And the driver creates the kcontrol to control ADCDAT pin configurati=
on.

> > Why would this change at runtime?  I'd expect this to be controlled by =
the
> > machine driver or a DT property.

> It will not change at runtime in the normal case.=20
> I think we may use it to test the feedback signal in factory mode.

So really this is setting up a loopback for testing?

--Z8yxTSU1mh2gsre7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mf7YACgkQJNaLcl1U
h9AAUQgAg5xHDGKt0DtfDS8tjGMoAByXdpxEe61RBJPMNK98EIXTfiwKCU/Wdc3N
YFuhedwoV7rztRcJ/uPLoQPzxbMGOqNeEYf4NQDTSl4i23m9WwXxqd4wW9alD35k
AZRup6xUJ4rgle7hstf2EmyQgxCoyZdX9xsY1gg6oAwUddp3RfO9X5ARWKJ0l302
iP4TWnpQOUkigIwEgTBqvDSQRF3hwsW+C6elmVfzH17wf3sjGxctqosIGAaqWlhK
u4Qu8z1roX5xI4vxi3XSDoJipu2+gOn4zTmJP2aEIGSvsnuV9I7d62gqnVe/BV3Z
GPcKEuWPOtGnuGbijBcI2h2upr0Fsg==
=mpI1
-----END PGP SIGNATURE-----

--Z8yxTSU1mh2gsre7--

--===============2860059883289927343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2860059883289927343==--

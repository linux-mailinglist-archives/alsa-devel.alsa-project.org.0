Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E054189C74
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 13:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59D801670;
	Mon, 12 Aug 2019 13:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59D801670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565608525;
	bh=v4mJ82w4kSScc565UoLMxOrLl8Np8inaXl8rP0Cin0Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pwo2axL4OkDRWuAWNpnceheXf0zSuEZgP5iwEQfxZgW/EObH25VUxI4v3QYGte+Rd
	 oKqqFzMD2Ahpn0oygNUK+/k079ZPTMd3YW+iu6oqoBOT4AAqDROSAP0A2dZ+INDSId
	 35bt+gi51xsnK66LGOo+Gd0IvI0lmtYqvfYZY8ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 874ECF80213;
	Mon, 12 Aug 2019 13:13:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41A67F80213; Mon, 12 Aug 2019 13:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D140F8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 13:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D140F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sT1TDcwt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d/8AoSVqcK7UIGwjpxsWhp8fIUlfqSOa2JstbFFkqiI=; b=sT1TDcwtuYedUvj4PScP8jGa4
 QQjJNY2FUVamCHlcFboVjbfJtRmFzIFpewcFRwyUJYIE307D5TYDKWbokzoTagS8QwhknSAaNHnTX
 VZfpUZE5pxDPzY9HIC4ymjSvlavQFl5bqHmyN33dvHOYBemESwpUJpnYgC7GrfWiP6McY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hx8Gc-00013n-88; Mon, 12 Aug 2019 11:13:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0FFC92743076; Mon, 12 Aug 2019 12:13:33 +0100 (BST)
Date: Mon, 12 Aug 2019 12:13:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20190812111332.GH4592@sirena.co.uk>
References: <20190812095304.19030-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190812095304.19030-1-peter.ujfalusi@ti.com>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jsarha@ti.com,
 misael.lopez@ti.com
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Protect hw_params
 callback against race
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
Content-Type: multipart/mixed; boundary="===============3775704410407984283=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3775704410407984283==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SdvjNjn6lL3tIsv0"
Content-Disposition: inline


--SdvjNjn6lL3tIsv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 12:53:04PM +0300, Peter Ujfalusi wrote:
> If the playback and capture of the same McASP is connected to different
> dai link (non duplex PCM links, like with pcm3168a codec) then there is
> a high probability of race between the two direction leaving McASP in a
> confused state.
>=20
> Protect the hw_params() with a mutex to make sure that this is not
> happening.

This feels like something we might want to consider moving up to the
core, though not every device is going to need it I guess it should be
safe to do there.

--SdvjNjn6lL3tIsv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RSdwACgkQJNaLcl1U
h9DA+gf/bMC64Dq2nCK79Dd1Sy4iBc3VB10pEy2bk+IuXac7Cvy6M+Mm5p1Vj2FE
yNhh1y/8K2RUHgahrXqC1zXAHqpQ9r+HAaqIwJEStE5aaDmWEUdkCYe7ACxe3i7g
ZqMdzX5jlM30+uaKNceo/GuzZlsqFUv/1Kgo6zm5AiDZWDf72DSGePMFu0QY9Vtn
tffPUx+lDzo6fRGZYHVVoCwChtw4td0GJ7VclATNFh2nJfT636Y/WKSnuiEXUM09
f2JEp14d0k0kG3WjCtcvHiEPGsD1phd75widA7AzR1PIa6jR9FJGCR4UckbFd+Lo
S9RcHHOied+m6iy7QMMxdau0TnTuKQ==
=yHpV
-----END PGP SIGNATURE-----

--SdvjNjn6lL3tIsv0--

--===============3775704410407984283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3775704410407984283==--

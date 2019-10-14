Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D1D61CF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 13:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F36501615;
	Mon, 14 Oct 2019 13:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F36501615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571054308;
	bh=xkf4raLf3LOsmtEyNrcB6Zvdw1xBVWKLrH1w+XjvvH8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/fIKKh7yf44Z8pmUXG3KC0StIfLYVIjAh0NHtJ2fBrcZrYU0WHoUX6W4DO2PDVt9
	 M1UJRcEaHyRpUYAVerKYoSgx2/5QyYi9mlA7ZfvomVOcmbp8E2pRCmlPbWdqbG3MMF
	 +yomVko+h/UZU4fTrMYKHsFM/AbLrIG/n3blYgvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A13D0F8036C;
	Mon, 14 Oct 2019 13:56:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68A56F80362; Mon, 14 Oct 2019 13:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D859F80212
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 13:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D859F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VUryfWb7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jIj/NmY+eyECv3y+bNn8jTjJhywyBUZaIyrJ62db62Y=; b=VUryfWb7iW/HUzgEfXisB6nFM
 8Nd1kC1Yz7pcGsfKBvwBfL4mcWp+8hirqhUrBmCrEToeay24b9nXEsxPLIIxfT2eokan9Q4P2rMNz
 hiGsI6fp4sKiAyloGyJN/7oRf0FOfl9Q9KJ5P5SK3lFQ9ujfJauD6Q7joVxcxHbXwEaMQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iJyxo-0007VP-0K; Mon, 14 Oct 2019 11:56:36 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3C3552741EED; Mon, 14 Oct 2019 12:56:35 +0100 (BST)
Date: Mon, 14 Oct 2019 12:56:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20191014115635.GB4826@sirena.co.uk>
References: <20191013190014.32138-1-daniel.baluta@nxp.com>
 <20191013190014.32138-3-daniel.baluta@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20191013190014.32138-3-daniel.baluta@nxp.com>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org, linux-imx@nxp.com
Subject: Re: [alsa-devel] [RFC PATCH 2/2] ASoC: simple-card: Add
 documentation for force-dpcm property
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
Content-Type: multipart/mixed; boundary="===============5741194454647482213=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5741194454647482213==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 13, 2019 at 10:00:14PM +0300, Daniel Baluta wrote:

> This property can be global in which case all links created will be DPCM
> or present in certian dai-link subnode in which case only that specific
> link is forced to be DPCM.

> +- force-dpcm				: Indicates dai-link is always DPCM.

DPCM is an implementation detail of Linux (and one that we want to phase
out going forwards too), we shouldn't be putting it in the DT bindings
where it becomes an ABI.

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2kYnIACgkQJNaLcl1U
h9AJzAf+L30WoNHHnOrkkpLMsmM6uZcu7czOKRKOJyZ35878jKwHbjZap1z9TOLG
ivJDyoiRoLYg4twQJcl7Rt/I7WytvqTEkhzju5+LWpRuB+fFtdBjwK0p0rXZbj1E
6wWWkfnGi5NgxPGa0FSCwLUkIwPtrsd3Rwxbwk6n+kekbJxEYK9UzkGOydcIIgez
ie6lZRh515nxc2sohfBhM3//verg1jHxxG6sA0cMQ+hHwdzgIzfXzsHXlYw9M/pm
Z9KNu7+EiJ0gefb6XXCbqfJQ+B37sibpl+10EeiUIHIW2bjOl1w+LJgRJzb6nFK8
j60W+/cODoUMQWboKCkQ+oTUEHuDXg==
=SivO
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--

--===============5741194454647482213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5741194454647482213==--

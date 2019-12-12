Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E096311D265
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 17:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3EF1706;
	Thu, 12 Dec 2019 17:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3EF1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576168512;
	bh=NggzBJHakpXS3ziO/oBEyKWZeypvnk2t8caUMnE+hRo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LOS1cfPslb1WEbDNrxkFGzFUXMaC2hsJ5fMbd/Iz/xvoj/dLz399FER6QGLaSWHDN
	 JL8r9aD/0Tv4XJFepprniGpdsxYZGAA93sUtQlqkJCGX5TzzFjKwiTf5vc6YvSjMFz
	 fuPgYu+fUDd+MJr3GeBUH3rNRxAF0rTUvh6hzDhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6971F8020C;
	Thu, 12 Dec 2019 17:33:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0542F8020C; Thu, 12 Dec 2019 17:33:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by alsa1.perex.cz (Postfix) with ESMTP id 5D143F80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 17:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D143F80139
Received: from localhost (p54B331D1.dip0.t-ipconnect.de [84.179.49.209])
 by pokefinder.org (Postfix) with ESMTPSA id 7C6252C04D8;
 Thu, 12 Dec 2019 17:33:23 +0100 (CET)
Date: Thu, 12 Dec 2019 17:33:15 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <20191212163315.GA3932@kunai>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-9-daniel@zonque.org>
 <64adf5d7-754a-f1da-aa9b-11579c5a2780@lucaceresoli.net>
MIME-Version: 1.0
In-Reply-To: <64adf5d7-754a-f1da-aa9b-11579c5a2780@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-i2c@vger.kernel.org, pascal.huerst@gmail.com, lee.jones@linaro.org,
 linux-clk@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Subject: Re: [alsa-devel] [PATCH 07/10] i2c: Add driver for AD242x bus
	controller
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
Content-Type: multipart/mixed; boundary="===============6330739092897047890=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6330739092897047890==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luca,

thanks for the review!

> good, but I think there's a problem in this function. A "normal"
> master_xfer function issues a repeated start between one msg and the
> next one, at least in the typical case where all msgs have the same
> slave address. Your implementation breaks repeated start. At first sight
> we might need more complex code here to coalesce all consecutive msgs
> with the same address into a single i2c_transfer() call.

Note that it is by far the standard case that all messages in a transfer
have the same client address (99,999%?). But technically, this is not a
requirement and the repeated start on the bus is totally independent of
the addresses used. It is just a master wanting to send without being
interrupted by another master.

   Wolfram


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3ya8cACgkQFA3kzBSg
KbZBdQ/6ApPjJEPmloupECtcOPxRdHIBMJSbDi9HpBk6QSvFwtknvv6ybcJHJ3Dc
2GkbUK4EAcDvvDx4mTqhw7t8JPay3Bu3O13a/wXP5PDb7DeHJ5xDaBsEYVLC9id2
E1I5aEfdrrxsL1HFUZn86BmmthMuupvelZAyfL7pXDT3AU5oNkPipfKzoiC0EiBP
MPu2HN8BIX7l1ECvOL9j0pZYCfz00UHA4PtWHwz7zjiCG7RmY3qlm6xw5l6XFeq3
wbcmTXcLr8OIG/8sw0PMJjJFqHfH9Vlj8aYcRrsgjDEHQbSTKAQ/RTDw9rcmAktW
/1u6RUea0ckwX6rhKWZSXVktPzCV5LWaywD6lsMGXxhF/0T2tvKRqV6+xIngUY3n
8KnzpK2i3gvLmP9BYYxa/BM8qiuR4SimZi35lmofttUzXUs/5fgJwxFg2UuJqpPD
Ex/lyLc1AUbRRp8mDsSMsGg7Ku6WUt5T7OxmVjzvIYPLJ84GlTvZLA4WIskzWFVw
aZ2+E4YZq35snfMfawdrDmTOOmNOEPfVuT5Cm2ul1HVTprAgF/DVkQHVWPzNtOo9
xxwPgX9lrN0I+Ek2F1kSJguphMzVjIFRvFCl77TJUQ7qvBEWYDLQs1hBdmXieBxA
bNZoxeVI6DmFF5qTxkQ3Qh9NUGWkPKuslRF2Fh7dWQIoS9FauJo=
=Gmcp
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

--===============6330739092897047890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6330739092897047890==--

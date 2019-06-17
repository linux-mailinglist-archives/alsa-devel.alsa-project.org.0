Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12E486C7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899FC1714;
	Mon, 17 Jun 2019 17:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899FC1714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560784525;
	bh=90UWJzWg92FO3z2fytCFBis0BA2yi0dOqQLIHroqaHs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEvB150pe1Hphc6NL/8jyxSmL4hxvjyrb4VEAbYNogk1DSe/uvHnAe4TtuFJfLwuH
	 iV6OOxWpDR3fNcIXsj05NyZu7s91n8xxBZfCNdGXkpB2B3jdHxnGKXFD1h7kdmEku5
	 OAlCF06Ny1lEyNS/ZwU3jUIltVAVjdarV+AdVWy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CCF4F896C7;
	Mon, 17 Jun 2019 17:13:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9159F896C7; Mon, 17 Jun 2019 17:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD62EF89682
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD62EF89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="D9Zlq71E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZhD88dZhIwAEFMHCQHv+WMw+ImhJWgcbe2rvZ4ePTmI=; b=D9Zlq71E+PS5ixfuK6IQ2ycb8
 qh6kZtw2+dp3SKUPqRbx7aNNre1mQPZlD3d21tS46XVKuNFHVcIFY1wOw2OAKfJLS4OO1e761Xnly
 cCsFzECWSjNt3/90AD313x3Mhv+3pvL8/b4wGQxkp2906MgiwA/2/FoKyyIsu/8FruToc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hctKC-0001vG-0m; Mon, 17 Jun 2019 15:13:36 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8E4BB440046; Mon, 17 Jun 2019 16:13:35 +0100 (BST)
Date: Mon, 17 Jun 2019 16:13:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20190617151335.GW5316@sirena.org.uk>
References: <20190617144048.5450-1-geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <20190617144048.5450-1-geert+renesas@glider.be>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Add missing newline at end of file
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
Content-Type: multipart/mixed; boundary="===============4329945322679452329=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4329945322679452329==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jr/gb2Ce1GM9KKZD"
Content-Disposition: inline


--jr/gb2Ce1GM9KKZD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2019 at 04:40:48PM +0200, Geert Uytterhoeven wrote:

>  sound/usb/bcd2000/Makefile         | 2 +-

This isn't ASoC but I'm just going to go ahead and apply it on the basis
that it's trivial and more trouble than it's worth to split or anything
like that.

--jr/gb2Ce1GM9KKZD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Hrh4ACgkQJNaLcl1U
h9BlLAf/XkqJNB8j8P2Zh31fJzq0kGKURYcvPZFZnRkSysg+6PhbGDmOa2Yr5cQa
MOumNRRlLtWxS4fi11CwnRS+XKO2b2hB2N0HpEKnm0JYcHt2TZzcLGhmf8wS00cQ
AaKaOoPKf8wBq1jYc+8HWXe9NwakA5zYqfvhld1VZ1MbMi9da1KePzIb8JMapGMI
PC+Xr2ZVgMkgWRrPVuHcy+719VBcJr7pvR6mKxTu4niPl5AFE773e2C9wTKW6PGZ
Ht8YDB8p/MwbLDHVLE6hnKUwCLyaRUvagHhMNwNRl9kfbhKGQ5wLqzcfnIb6WKTC
UvrcNo1YNmcLlssETzEuTPpGVkKv3A==
=CRUr
-----END PGP SIGNATURE-----

--jr/gb2Ce1GM9KKZD--

--===============4329945322679452329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4329945322679452329==--

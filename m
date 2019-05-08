Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC3F17297
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 09:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E26D1813;
	Wed,  8 May 2019 09:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E26D1813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557300646;
	bh=pCEDWF5KYlIobMKq5yAcIGkmG1SzrKW8SEn2qtUcZF0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hTlWWJD7LWdyy6Jk+MJr3WwaFtWbPHu5DA/oQPHTy+PTtktwl3hu9FdEYEY7uMnZP
	 oRxO1oYZsM3i2C4z5Iy03WFXWlUyDkWt4YjAtQaLTw9i7wyfhSQJ7pGT0H0pPS03x+
	 ofUVIfz1+gngturmxef6tdHa/Qx00p/ILTPFy5p8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23FEDF8075E;
	Wed,  8 May 2019 09:29:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A866F89705; Wed,  8 May 2019 09:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BB79F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 09:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB79F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CTehFDYv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DOa23I4UKBHZ1W38uU+fjqv/wzB43+8sCcMuITglHe0=; b=CTehFDYv97sYYAFGFVlNog7IH
 9cXlHMjG+fKKPjitK0eaxCy0iAdLsEBfQlyN5bsgiRxL99XTliEzX1CkGyDqaMUOBxSwouljdqQhy
 Kx7/Xx18u9qAmBgsY8YTwlL+eXxUAv8mlOYc1+vIlt6Gq/QAV1xMVhnraoU+1qPvkn2BM=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOH0d-0007Jj-63; Wed, 08 May 2019 07:28:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id BCDAB440010; Wed,  8 May 2019 07:50:16 +0100 (BST)
Date: Wed, 8 May 2019 15:50:16 +0900
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20190508065016.GP14916@sirena.org.uk>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
 <20190506095815.24578-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190506095815.24578-2-jbrunet@baylibre.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/4] ASoC: hdmi-codec: remove function
 name debug traces
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
Content-Type: multipart/mixed; boundary="===============6831494448084037691=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6831494448084037691==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n02m2kg9dRU2PhYI"
Content-Disposition: inline


--n02m2kg9dRU2PhYI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2019 at 11:58:12AM +0200, Jerome Brunet wrote:
> Remove the debug traces only showing the function name on entry.
> The same can be obtained using ftrace.

This is not a bug fix and so shouldn't be the first patch in the series
in order to avoid dependencies from it on anything later in the series
that is actually a fix.

--n02m2kg9dRU2PhYI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSfCcACgkQJNaLcl1U
h9Bw1gf9EiD4X5wN34SmEnGb2xWc86eupYpTqZNCNgAwqJjCRLZcuhCDZA1TI9PU
xowIZkIHkls3NAK5Dd7B3amCe7gLoi6a+SqDDc6rUOLBh31xb4TOUjV1dWU5XpNZ
h6frDMTNAcFeLzRzGYPQwlJLsEXiyA1AxbkMWaqNcElsgWLyXX/wzLErByMf+YB3
ZtkamXUgEXbl2cg0SkOYY2jDX7n9K/lsyB4Lg+DEPBWg3CaeT3BaKfdZtMU69xwQ
LfYL1et4cDwIS9+HpmFWOo9YffqBkgl7gwUFxZ61pc9ud3Xg4pT9XgkU7gcOMQtL
hiqbJbWz4GYqbHE/kQTxbOGNYG02nQ==
=xAAv
-----END PGP SIGNATURE-----

--n02m2kg9dRU2PhYI--

--===============6831494448084037691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6831494448084037691==--

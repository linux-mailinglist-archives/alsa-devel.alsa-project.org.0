Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A2E0947
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DEAD1680;
	Tue, 22 Oct 2019 18:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DEAD1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571762392;
	bh=e2pwLwhEjxn9g4VRJXVcaD7+pdqJHHCvgNrrSf7+tlc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QJfJTg4DLSYy6wZaE8yqCbCapfu5gBJRxOflTpecdmAFXgdFEtoX+BZ7wHt66N+Ea
	 ay9ER9rbZjsHSsLUl21VC4O3V/n1Vdp8CcUvKhdulqvJfkIjLq3xeRMQgR54Nl12CF
	 l0ruBn0gvToE+3FgmitnJoLbtO2BdZ7TKvuqwdZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38A6DF80600;
	Tue, 22 Oct 2019 18:37:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55EDEF805FE; Tue, 22 Oct 2019 18:37:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5717F800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5717F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="H9dCVn5k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XYt01QDASLshwcD8BBPmTNrzoEd6n2RKiXKjRc1xWes=; b=H9dCVn5kIoroBfx4/ITB1seZy
 d4GIPI7LIHFIBX/ucd8uhgvPIR85r3jG0a4vQSWd+kLm8IunlcioGHFqgDNz68Su7N/Z9lLWbQQSH
 MsLukhbB2LFCrLxgIvGoCaAyEW1gGTMDHAa7mv1UAzabfa+OhDZNiH1G68xUFd9RBURFg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMxA0-00073H-Go; Tue, 22 Oct 2019 16:37:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E9FE32743259; Tue, 22 Oct 2019 17:37:27 +0100 (BST)
Date: Tue, 22 Oct 2019 17:37:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191022163727.GP5554@sirena.co.uk>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-18-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-18-arnd@arndb.de>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 18/46] ARM: pxa: corgi: use gpio
	descriptors for audio
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
Content-Type: multipart/mixed; boundary="===============7887179576078141947=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7887179576078141947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K8zN2sh9fO5jmbe4"
Content-Disposition: inline


--K8zN2sh9fO5jmbe4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2019 at 05:41:33PM +0200, Arnd Bergmann wrote:
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.

Acked-by: Mark Brown <broonie@kernel.org>

--K8zN2sh9fO5jmbe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vMEcACgkQJNaLcl1U
h9BniAf+KxW3zK8aAq/5sBBVj52dQLINMW2dy7ThgwVMqgnrNu7aNXa+NJSIiOe5
WZREVSA3+M+rZ8BYonxgB8EZVVtYTSFR+gyMjAHQe1UsQMgWlkKYHdvB87nh1LNu
jn+zAuwNuQK6XfMfGFEFbQ07eyytgl9VRO5OaRmO6d6U+37vn6CSqz7NJ/SCfMSS
fT2cyd1E83ep6e7qlaKOXC4iRfkzq0q4GhZ6+30RRzUcFViguzVbAW1oz3YvVr2c
4dwRH4yZJmPkGPn9jAOARCd62eFUdpoU55MIyoVYo0gd4NWDOG8VspiKawN/6Rz6
PPyqtPs0cIO8zRSX6y9WQg1dZRS7hg==
=noRN
-----END PGP SIGNATURE-----

--K8zN2sh9fO5jmbe4--

--===============7887179576078141947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7887179576078141947==--

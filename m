Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DB124FB6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 18:52:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49F17166A;
	Wed, 18 Dec 2019 18:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49F17166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576691543;
	bh=CspLSdIJTeb8zd/Q8HCvPMhC82dFXZLY2UJhb0X/fgQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QP34EB5zdyQqegB0vbGeokjEIk9Pet8s70Og6FYYBg09+CNJ6MPb1obMEW7Re1X9x
	 0r+yOEF9YqzKhFbY3XofjJaMUaPEBU/IU5qVvnxx2FSB0EOW8pqQs/Z2Lnayerty5O
	 6ae2K4ICgL2ZAWUGM3ARv1hoF2K3V/IEx3Njwep8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E7BBF8014C;
	Wed, 18 Dec 2019 18:50:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 716A1F8022C; Wed, 18 Dec 2019 18:50:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F0320F80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 18:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0320F80096
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1309B1FB;
 Wed, 18 Dec 2019 09:50:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 856C13F67D;
 Wed, 18 Dec 2019 09:50:33 -0800 (PST)
Date: Wed, 18 Dec 2019 17:50:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20191218175031.GM3219@sirena.org.uk>
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
 <20191218172420.1199117-3-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20191218172420.1199117-3-jbrunet@baylibre.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/4] ASoC: meson: axg-fifo: add fifo depth
 to the bindings documentation
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
Content-Type: multipart/mixed; boundary="===============9147555744479039174=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9147555744479039174==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KSyhVCl2eeZHT0Rn"
Content-Disposition: inline


--KSyhVCl2eeZHT0Rn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2019 at 06:24:18PM +0100, Jerome Brunet wrote:

> Add a new property with the depth of the fifo in bytes. This is useful
> since some instance of the fifo, even on the same SoC, may have different
> depth. The depth is useful is set some parameters of the fifo.

Can't we figure this out from the compatible strings?  They look SoC
specific (which is good).  That means we don't need to add new
properties for each quirk that separates the variants.

--KSyhVCl2eeZHT0Rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36ZucACgkQJNaLcl1U
h9DwRAf/XO9oHDzn1VThOJNKz5nrgTjAgtf51hmSYc2qC4bFBEPQmKXHTQJwgxhC
7Q+4EV0qC+zkHdnDBl9RM5HgwVFirK2Bq106WvVMJizoEWf0D5B2C8vp8vMhCOXA
yquL9sijTzs79Z2+/wM05/OaaQ+nrKBZpBv6IOGYYkgZ+z4x7Jp8HQ9EhPW25EsU
am8nea9rtuvWkEDskXQ541gQw38hPicim+pS37hD/BzhTstwLpU7LqnyyFq6O+OE
ZtatzXOFXvOohYrOK4yGFUnT74rg6wE6shFbq3E4NNwnRtwh9TCCpUjS43JrNOZT
DJ6vG/tnjzlofd9ok9LwVvNZ2d4xQg==
=9adF
-----END PGP SIGNATURE-----

--KSyhVCl2eeZHT0Rn--

--===============9147555744479039174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9147555744479039174==--

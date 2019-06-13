Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 008CE43576
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 13:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75BAA1806;
	Thu, 13 Jun 2019 13:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75BAA1806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560424958;
	bh=rbRJkuIY+2jR+svnt4O1MNkfyvo8ujt9xD3NEzXViNg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r3AJVwVccWQK5LW4Mg65nx71vCk2/IxE/0dTkxx0qD03Imf5KXEFozPukb76ssU9H
	 1SLh/4Wp0bBXy7DYutzjMTkwz2MXCDdPprwrTxU0ibdDgFY0uP4i2Y+UEG6Yo5kL32
	 kwlVRYFCEm7iIii5mWYTepWOYstGuwXn+Vqwl+yY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF2F6F896F1;
	Thu, 13 Jun 2019 13:20:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15A52F89703; Thu, 13 Jun 2019 13:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FF1DF80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 13:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FF1DF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="he3S8JaW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eIHgfBJlbK9FwcvaP6T9TaD/ipuA6s2QoSklhh3hLCo=; b=he3S8JaWx+2Fpu56yFYvyrwJY
 rGWv6yPWwblRKDmSS01ZlZPPSfiUNDWDJnDFi9o5K0hWfWL489VxIMoWdVDy9D/22isuIL9OpJ8qg
 L2Yx8k272yMFuAa9pN60TKK1cJeQYJ35YUq+ykZyge6YdsSAzQXkRZQ6qOA+fYFe2R5AY=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbNmd-0004sN-GB; Thu, 13 Jun 2019 11:20:43 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id F030B440046; Thu, 13 Jun 2019 12:20:42 +0100 (BST)
Date: Thu, 13 Jun 2019 12:20:42 +0100
From: Mark Brown <broonie@kernel.org>
To: John Hsu <KCHSU0@nuvoton.com>
Message-ID: <20190613112042.GJ5316@sirena.org.uk>
References: <20190610024029.12193-1-KCHSU0@nuvoton.com>
 <20190610034040.12629-1-KCHSU0@nuvoton.com>
MIME-Version: 1.0
In-Reply-To: <20190610034040.12629-1-KCHSU0@nuvoton.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, cychiang@google.com, WTLI@nuvoton.com,
 lgirdwood@gmail.com, yuhsuan@google.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, Cheng-Yi Chiang <cychiang@chromium.org>, mhkuo@nuvoton.com
Subject: Re: [alsa-devel] [PATCH] ASoC: nau8825: fix fake interruption when
	booting
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
Content-Type: multipart/mixed; boundary="===============3410610475068703505=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3410610475068703505==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KjX7LgAomYr70Ka9"
Content-Disposition: inline


--KjX7LgAomYr70Ka9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 10, 2019 at 11:40:40AM +0800, John Hsu wrote:
> There is no pull-up resistor at IRQ line where it connects from
> the codec to SoC. When booting, the signal of IRQ pin will keep low

On some specific system?

Please don't send new patches in the middle of old threads, it makes it
hard to spot them and work out what the current version is.

--KjX7LgAomYr70Ka9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CMYoACgkQJNaLcl1U
h9BCTAf+Mjb6YCp4CTitdaG9w5US+Xpm8f5gKjJxQYAlSzwm721Yd8d6uEYHUvJe
jwZmsPyWSyVD8BgnElrfqzW+8i8JjwWgBjbuUMy5nMvT+5aldnWUvFaUvVT9eBuh
Ce8oQPd3OtRkjGlSeOhTbBLmNb4qnWJ1I0G2uXnEnTWKdZ7P+may3cZXCP0S/2DD
VS7E6oSF948Ny3dxI/eFzwPIBvOqdUQdUHau/f99DfuyrGnwjSmLTBmte5smq44b
2Aja3m8do+SL1Z6MjZbHgB2gU3BJGWLmbvngkrUT78Oc0KeQ3AdPGbxVuIKEbiOe
PECljUe44PsQ1hcVA3TD76nG1k7Z9A==
=CDGm
-----END PGP SIGNATURE-----

--KjX7LgAomYr70Ka9--

--===============3410610475068703505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3410610475068703505==--

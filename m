Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FEE162F59
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 20:05:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE541699;
	Tue, 18 Feb 2020 20:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE541699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582052704;
	bh=AOzSoobEDE7EhEFICl1pLxHiCCZDR6d7DRTiE1UV2SM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4tTxHbZSonbSa2YFkKURuNClbs0imcs+x3otvTftsSdmEOmPG3n/j59kPqCJkmET
	 PkA+JHHAnGFeLC6QVsQqhSNsaY0MYMG2GCIsozlCTvIFpa11eDOZCopWy+1qbZ0PB2
	 GZKhAj6mzWcu2ZMutf/KIdT21FlOhUonWitbSTVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC477F8014A;
	Tue, 18 Feb 2020 20:03:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B4CFF80148; Tue, 18 Feb 2020 20:03:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 74733F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 20:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74733F800C4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8442831B;
 Tue, 18 Feb 2020 11:03:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07DEC3F703;
 Tue, 18 Feb 2020 11:03:15 -0800 (PST)
Date: Tue, 18 Feb 2020 19:03:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: Applied "ASoC: core: ensure component names are unique" to the
 asoc tree
Message-ID: <20200218190314.GM4232@sirena.org.uk>
References: <20200214134704.342501-1-jbrunet@baylibre.com>
 <applied-20200214134704.342501-1-jbrunet@baylibre.com>
 <1jblpvraho.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DXTueXWT3Da08pik"
Content-Disposition: inline
In-Reply-To: <1jblpvraho.fsf@starbuckisacylon.baylibre.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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


--DXTueXWT3Da08pik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 07:55:31PM +0100, Jerome Brunet wrote:

> 1) Multiple components :
> I found out that in fact it is common for linux devices to register
> multiple components. For most, it is a combination of the dmaengine
> generic and the actual device component, but other register more
> component. Ex:
> - vc4-hdmi
> - atmel-classd
> - atmel-pdmic
> - cros-ec-codec
> - mtXXXX-afe-pcm
> I suspect these trigger the debugfs warning
> Even dummy register two components :D

I hadn't realized we have so many - I'd have expected the debugfs
complaints would've been noticable to people, I was hoping based on the
initial discussion that it was just a couple of quick fixed needed.
Guess not :/

Anyway, I agree that a revert is probably sensible for the time being
and getting this done is more involved - can you send patches doing the
revert with a changelog explaining the rationale please?

--DXTueXWT3Da08pik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5MNPEACgkQJNaLcl1U
h9BjvAf+Pmlt7fyU83FfsWzxULYtc7fHXyMM3Gf12+JrIrwu/PfdPt3ip6EdC8Zl
qK6l8aX76eSj3zVwp8XZtQzqNflip6GgTbIT6eO1JslOAGWXRPbKFs0XAuu5jOMf
LfNEZoaFYp7FTrgltQsZ9viQyk8oO8/WWFwcomy717MTimKsBCiU8A0itn+0zQj7
wobZKZ03lqgIaEgwhUdmGhCBZzKNbpAlgN+tFIsYZtm+d3oPHQHO/MG8m1YBjlzs
UlhBrFJPUp4Wovahwd/OI7frBmGOLX6QhZSm7A0aoVs8c9I+icM73/sbqKSmsqq7
crR5zlLSQuqvMLLIuX47uaEEcFXSOg==
=GtzH
-----END PGP SIGNATURE-----

--DXTueXWT3Da08pik--

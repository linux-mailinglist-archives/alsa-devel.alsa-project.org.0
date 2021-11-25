Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E245D98A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 12:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3864F1897;
	Thu, 25 Nov 2021 12:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3864F1897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637840925;
	bh=3No3aHhaKBIBbI6sfTp5IL0mJhrT1nQJUx5S4ytzxhM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BGNvT2aHjXQyJofF5Yxh/P1OjI6P5Y7ky0uAgDCoXt+0rQE3Gq0q49oJuat+BX85U
	 ZQZe5iu5B5n2P+exE8Uo4cH4tkJf9hAaeduaXbAECiP+HBEiJsk67qqsATMZu4o0fL
	 n7JWv6grlVPpUGvwQrdOJ7ijZ+ebgDivlRb0IlY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E0BAF8007E;
	Thu, 25 Nov 2021 12:47:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 687FAF8049E; Thu, 25 Nov 2021 12:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6D5AF8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 12:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D5AF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j9FeHPom"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63A2D60FBF;
 Thu, 25 Nov 2021 11:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637840837;
 bh=3No3aHhaKBIBbI6sfTp5IL0mJhrT1nQJUx5S4ytzxhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j9FeHPomai+swTgZZk5vF1XaFl9raK+axoQM2ZQr14qBBqBFicD93VkFgVGzpHWQD
 NAAHTNW7AEdE+scl4FkXZeW685kZez0M/6iHkahTEDzwEgGrTKHWwhCTCtIJb2GNEl
 o9s60MTGzVwvIqRzwAV92Obejm20uqxa6hOztfLsUlLNkDNSMgi+0kTaH3d3oaPDVv
 +jck6L670WadupE9i7yx4868ewYEGGeO+Qgzbqmyg60LSdGXz5/ELM0pWTUDcBJkNf
 p4OEOKL85ToLgAifseHWYbSnrBZ0j777hwct35j31qj6nZGOSpv/THWLtOpq1Zw9K4
 R8Q3hZYC3UaPA==
Date: Thu, 25 Nov 2021 11:47:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: convert McASP bindings
 to yaml schema
Message-ID: <YZ93wOWfHdLUC6bG@sirena.org.uk>
References: <20211122091525.2290-1-j-choudhary@ti.com>
 <1637685269.740254.3442929.nullmailer@robh.at.kernel.org>
 <d72bac88-8f56-35cd-a953-270a1ed4d34b@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Dh/qz3bmpLmon4Sl"
Content-Disposition: inline
In-Reply-To: <d72bac88-8f56-35cd-a953-270a1ed4d34b@ti.com>
X-Cookie: This bag is recyclable.
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, kishon@ti.com
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


--Dh/qz3bmpLmon4Sl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 03:37:36PM +0530, Jayesh Choudhary wrote:
>=20
>=20
> On 23/11/21 10:04 pm, Rob Herring wrote:
> > On Mon, 22 Nov 2021 14:45:25 +0530, Jayesh Choudhary wrote:
> > > Convert the bindings for McASP controllers for TI SOCs
> > > from txt to YAML schema.
> > >=20
> > > Adds additional properties 'clocks', 'clock-names', 'power-domains'

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--Dh/qz3bmpLmon4Sl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfd78ACgkQJNaLcl1U
h9CAdQf/Zccr8jpu9GYJ1s1e6SIPLaOTHQ7T/GvnYZZWTgn++xolnkLc/bEPn1Q2
afzCXD85nhCGUqT1mqoF+FMq1LKR/SBzBebIPpHPh5D2Qj1IeNcyhBf+e5sEaLa1
H/8tN5igeAPxp/QOtoWhJMrcSLVk7M3kXbza1tfUvZOWud2/gE4IczPzphdhIv7M
Upu/x6p9wibHL5Qi12J5uRZyVgyaE+3KB7vWMlhHlTW+BTxYx+a9+xJMF49Dja75
RK9avILPAvpkKfOGXYuB/43AJNVuZswPM5Xf5W28DHk4NkbiwT7NysGI59v7I3pr
b+VSayQk/BMdqGFX2S317GBUtwBGlA==
=1ZPR
-----END PGP SIGNATURE-----

--Dh/qz3bmpLmon4Sl--

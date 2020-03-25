Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA95192700
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 12:22:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B81C81665;
	Wed, 25 Mar 2020 12:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B81C81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585135357;
	bh=dujAf1AHniGnn5gyoLeMUzISPxPcIczMaL2nhA0Knno=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ank+zRXnJ+aRMizHBdU4J1gA2A1pnr8N/95o1biXhz+2RCKGOHUp3LHcUFSANuAwu
	 JZZaUvXCirCIQXlOGgDR/7vlOIE7xLacUC6nZli3SgNEWnnbKkkFM1sT8H/RnQWqQo
	 xUQi7py5E2jMWKdF8WpQ8rXoNYjjF8XSF0F151Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3A59F80095;
	Wed, 25 Mar 2020 12:20:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26840F80158; Wed, 25 Mar 2020 12:20:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 03752F8011E;
 Wed, 25 Mar 2020 12:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03752F8011E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9927531B;
 Wed, 25 Mar 2020 04:20:47 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C1BE3F71F;
 Wed, 25 Mar 2020 04:20:46 -0700 (PDT)
Date: Wed, 25 Mar 2020 11:20:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: initialise work immediately
Message-ID: <20200325112045.GB4346@sirena.org.uk>
References: <20200324122921.29582-1-guennadi.liakhovetski@linux.intel.com>
 <20200324133042.GB7039@sirena.org.uk>
 <20200325111012.GA7131@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <20200325111012.GA7131@ubuntu>
X-Cookie: Many are called, few volunteer.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 sound-open-firmware@alsa-project.org
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


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 12:10:12PM +0100, Guennadi Liakhovetski wrote:
> On Tue, Mar 24, 2020 at 01:30:42PM +0000, Mark Brown wrote:

> > As documented in submitting-patches.rst please send patches to the=20
> > maintainers for the code you would like to change.  The normal kernel
> > workflow is that people apply patches from their inboxes, if they aren't
> > copied they are likely to not see the patch at all and it is much more
> > difficult to apply patches.

> An update: these patches got merged into the SOF tree, so, no need to=20
> merge them to ASoC directly.

OK, for reference it's not normal to submit things to both SOF and to
upstream - one or the other is more normal.

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl57PowACgkQJNaLcl1U
h9BU9Qf/R830CV48dU4bfCbl05gGmO1PECxGfxoL53WUWPXr1xvSBee8CsuNmxpf
2uEQaKKuDJtYQTEoqFsp/tnse/dWr6QTDY43IyobFtijFZJ/fhmMB4eYfOxrsR/P
817uNfzP1xGurslCMugqADVDbEq62T+fJ+4VEt8Z71qbIpnyjJTuIj/gbi+0hbWb
c5rbaeBX46kOlEDr0NgbhrBc9mUgqxnoecgIBKOyU60VStuJWROmmKJGBe9YpGel
d9qMfWUbniL9wZMrZVhdOMIpQMb69qwsezgB6s9kEMxv1dGDtlR+YJLSO5xIqmzE
z6Leljgi8xBAEJNxKGm8nQDR3zRC0Q==
=sCV3
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7BD191390
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 15:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780631661;
	Tue, 24 Mar 2020 15:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780631661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585061414;
	bh=rCqKL8WIHB/3Q1CGY/FoTTgvE7k/4AsIVHJOCfWiZ4w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JnISFPtSlzUA8k7qkFWPZQQk73FiMhUnXIXMmYqdL14Vw0PszSdqr6c2BdntQvHPs
	 4bDe5Zh745nBJeovSdmxQ+8pXB34T18mzPhIGj6d2x4iSQf7WO6AxL90mM0UUIjHC3
	 HwNw0iCeiDt5D+1C9Crdr6SCDd5XzxYVzVsC68ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D31F801F8;
	Tue, 24 Mar 2020 15:48:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78BF4F801F9; Tue, 24 Mar 2020 15:48:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EBF74F80095;
 Tue, 24 Mar 2020 15:48:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBF74F80095
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 558381FB;
 Tue, 24 Mar 2020 07:48:24 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8BEB3F52E;
 Tue, 24 Mar 2020 07:48:23 -0700 (PDT)
Date: Tue, 24 Mar 2020 14:48:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: initialise work immediately
Message-ID: <20200324144822.GG7039@sirena.org.uk>
References: <20200324122921.29582-1-guennadi.liakhovetski@linux.intel.com>
 <20200324133042.GB7039@sirena.org.uk>
 <20200324135856.GA29623@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="S5HS5MvDw4DmbRmb"
Content-Disposition: inline
In-Reply-To: <20200324135856.GA29623@ubuntu>
X-Cookie: I feel ... JUGULAR ...
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


--S5HS5MvDw4DmbRmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 02:58:56PM +0100, Guennadi Liakhovetski wrote:
> On Tue, Mar 24, 2020 at 01:30:42PM +0000, Mark Brown wrote:

> > As documented in submitting-patches.rst please send patches to the=20
> > maintainers for the code you would like to change.  The normal kernel
> > workflow is that people apply patches from their inboxes, if they aren't
> > copied they are likely to not see the patch at all and it is much more
> > difficult to apply patches.

> I know that different maintainers have different preferences. For example=
=20
> in the subsysteem, where I'd worked for about 10 years the maintainer=20
> preferred not to be CCed on patches, he preferred to pick up patches from=
=20
> his mailing list folders, or whatever arrangement his mail filters=20
> provided for. I learned already that in ALSA / ASoC it's usual to CC=20
> maintainers. But I wasn't sure whether that also holds for larger patch=
=20
> series. E.g. my main patch series now consists of 14 patches, so, I=20
> thought, that maybe you would rather not receive multiple copies of the=
=20
> entire seriees for each new version both directly in your inbox and in=20
> the mailing list folder. Or is it indeed your preference to always be=20
> CCed on all patches? I apologise for re-iterating a question, that=20
> probably had been addressed multiple times before, maybe it's worth=20
> documenting this somewhere on ALSA web?

Yes, copy me on patches.  This is, as covered in what I wrote above, the
standard and documented approach for the kernel - unless you explicitly
know that there is some unusual approach for a specific subsystem you
should assume that if you want people to see your patches you need to
send the patches to them.

--S5HS5MvDw4DmbRmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl56HbUACgkQJNaLcl1U
h9DwYQf/fnkH96IDpMV4ok2U6VKZFbMgaEmrhxxcZgKhFRLIRv76Rm4pHrlZcsMn
OtmNRN5u23DCHrL/Spm+6VLUiw84gYgzhWaKd9qbNnPrpRDRHhd85yTR/bfyxJI4
8Tj4LHz2OpBQ/XvwHCM08vh5wyIWjLbspucAmFlEyILxzMw9u6pKQg6OPNiQLlq3
qCiAhzjA2rKp/M8sIIE8M00/C+wiqaKu72IefyCYNq1RyXL8A43Q7JQQjvcfnd/9
PBLP8arXGOLHz7Iyt5GrFgww1io4moPWRrIaR3cHgjReZBuzg3SPkfgIt1xHE1O5
K9JYEAUH+MzwJe+sZsHlUQLJtx6BOg==
=OBQ8
-----END PGP SIGNATURE-----

--S5HS5MvDw4DmbRmb--

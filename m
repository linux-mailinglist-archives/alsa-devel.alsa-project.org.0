Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5F28B6DE
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 15:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08242169D;
	Mon, 12 Oct 2020 15:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08242169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602509979;
	bh=qa0rmCwWWpzkCixnI6a8dXkJHeLA0TQStUrNaDLmhsw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t8+IATqNP7iAcFLVR3f9/wCvbJNCNp/3nOyGhqvkfgvZ/fBacwCNAmdJYdGn2MGod
	 YRd2nzwSy+UCRLaXG1wSwuStuHtFprEmWYrHaCvnembWoqQuY7I1fLICCloRzhMEzp
	 qKKBVIRfsJEKjpYcnSBsz2LR0R8XB2h3h1MHGSKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7558BF800D8;
	Mon, 12 Oct 2020 15:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0796FF80217; Mon, 12 Oct 2020 15:37:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34CF9F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 15:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CF9F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dl6tnEl8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4658222202;
 Mon, 12 Oct 2020 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602509869;
 bh=qa0rmCwWWpzkCixnI6a8dXkJHeLA0TQStUrNaDLmhsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dl6tnEl8muExrrf2om5PVJKBXoJymmeWgpooSdxD33QIzmd64r1cqhHUvP9OZaEcb
 A2Y0inBDsyxxMIoxwcRw306hzVgWuU2eBGLLdFLO67BlMFUNDOD2lAKfonIhADePUd
 XpUnG7+dPk76TiOufQAhEFC2RjBMtonwBaNh/ZDg=
Date: Mon, 12 Oct 2020 14:37:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] ASoC: dmaengine: Document support for TX only or RX only
 streams
Message-ID: <20201012133745.GD4332@sirena.org.uk>
References: <20201008161105.21804-1-broonie@kernel.org>
 <20201009102751.GS4077@smile.fi.intel.com>
 <20201009103124.GT4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline
In-Reply-To: <20201009103124.GT4077@smile.fi.intel.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Michael Wei Hong Sit <michael.wei.hong.sit@intel.com>
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


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 09, 2020 at 01:31:24PM +0300, Andy Shevchenko wrote:

> What is the best way for individual ASoC drivers to be sure that at load time
> they have or have not DMA resources available?

> Now, seems the approach is to check dma-names property present and thus, try to
> switch to DMA mode, otherwise PIO. But this seems to me a bit fragile. Why ASoC
> core can't simple recognize DMA resources as optional (for the drivers that
> want to know if they available or not)?

I'm not sure what you mean by "recognize DMA resources as optional"
here?  At present drivers that think something might not have appeared
should go through the resources and check them individually, anything
that hard errored won't be there.

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+EXCgACgkQJNaLcl1U
h9C/lAf9FljatJRz8J1HhmW2p3yTzgw92zsNn9jREXvyoNnoP0yYfFS3Je1tqUuM
BcHNEdNjjPPTNe6jVMqLWLz14ZO6FJZm8DA8VIujr5jmcmENeKAiE8nQ3OR/3/m6
/JgKZP2V218t0tR5KIqAS71sU+I+XKUeBl+srZMITTsIOFyBf3Y8G6CiFm818C7u
z0S5s3X3yGmjDzXA0SquQtOM0S+rPA7HLefHCgVk7HJL4p/VRmSRKL+Ug05HS54e
M8kyM/51aJd5Jw410VI7i3lHNwV/UkZFeGT6n9WiHv4dRHcRJnaX7jtVCYIJoxJU
wXCmp02Tynhed17Mn3Ee2Ta8Q9AX7A==
=skC1
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7867C203E97
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 19:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6671711;
	Mon, 22 Jun 2020 19:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6671711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592848758;
	bh=Lt1P6AdsHmbhP2XV63ccQ6jG8uBCvmShpdyEWEYmjI8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RiWdSghvWuzv0XWBSw9RcLZB6ubWkfGQ46C20VPecPJEp16SWfOSKfCPqD28Nej8n
	 ju5s7h7G0MByVzw099zKE+WyW9deWKKxQbS1lsCUmWVmZh9iIgeOAPMlAYx5Oz641E
	 4kLhn+T11i3X9BibnbDOQfQAa61/HlvtLWRs1lZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 717A9F8010E;
	Mon, 22 Jun 2020 19:57:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B15A1F8015B; Mon, 22 Jun 2020 19:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F267FF8010D
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 19:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F267FF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wYyb/N05"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0D7D2075A;
 Mon, 22 Jun 2020 17:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592848649;
 bh=Lt1P6AdsHmbhP2XV63ccQ6jG8uBCvmShpdyEWEYmjI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wYyb/N05uI8WHgJV1KE7C0JnHCvn8PQh/8jSeAnsF3wIXS0NFdG+HIvSMbEQntwyc
 m0VTgK20TYgLFCjQGJvgv1fwj38lNGON955q7nVUEKiyWYTE/VT/FjL2ToS69m/h0v
 KhEzV90KgXeSAL2ZgjrVRwu5NVwWO4/x27gjwhV0=
Date: Mon, 22 Jun 2020 18:57:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Message-ID: <20200622175727.GP4560@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
 <20200618143930.GI5789@sirena.org.uk>
 <20200621233352.GA1931@sasha-vm>
 <20200622112321.GB4560@sirena.org.uk>
 <20200622123118.GF1931@sasha-vm>
 <20200622132757.GG4560@sirena.org.uk>
 <20200622144402.GH1931@sasha-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WOTjKnJ88wpJKlWH"
Content-Disposition: inline
In-Reply-To: <20200622144402.GH1931@sasha-vm>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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


--WOTjKnJ88wpJKlWH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 22, 2020 at 10:44:02AM -0400, Sasha Levin wrote:
> On Mon, Jun 22, 2020 at 02:27:57PM +0100, Mark Brown wrote:
> > On Mon, Jun 22, 2020 at 08:31:18AM -0400, Sasha Levin wrote:

> > > How come? This is one of the things stable rules explicitly call for:
> > > "New device IDs and quirks are also accepted".

> > I would expect that to be data only additions, I would not expect that
> > to be adding new code.

> These come hand in hand. Take a look at the more complex cases such as
> sound/pci/hda/patch_*

There are more complex cases, I'm just not sure how good an idea
backporting them.

> > It would be much better to not have to watch stable constantly like we
> > currently do - we're seeing people report breakage often enough to be a
> > concern as things are, we don't need to be trying to pile extra stuff in
> > there because there's some keywords in a changelog or whatever.  The
> > testing coverage for drivers is weak, increasing the change rate puts
> > more stress on that.

> Shouldn't we instead improve testing here? nvidia for example already
> provides Tegra testing for stable releases, if the coverage isn't
> sufficient then let's work on making it better.

Obviously it'd be good to improve the test coverage, but I think that's
something that needs doing before backporting loads of stuff rather than
after.  For this automated stuff I'd much rather see positive
confirmation that the change had been tested on relevant systems (not
just something with a similar SoC), especially on the edges where we're
getting to board specific things.

--WOTjKnJ88wpJKlWH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7w8QYACgkQJNaLcl1U
h9DC6wf/TsaPFLd+NPMuG4vVND70Z7iQQxL5/z/PyV7fUPbBpUUTkNGsq2Zuue1U
aWOE4ExbeVUHmEoMtMCfYzkuigz2/cIm2zXvQC82I8EoUMLj2aG4vBhXhxNVv3Fi
l4aBCgJTHyK3+mbu1lvaGykxUFLe3tjWj1I45GNV6mVX2jwNeyNRtwIgYtvvFw2J
S9RzsRjKgm8GW9/JzJsY18MwkcxalIZIpsmzBkuQw/79/XjtbzC0aI3fbt2KCkha
Cfu8PWJdRx276cbDQbGrCMJUZP36TA3Bve09TUx6OdB2nvxiODjAp0xn7VstW/xn
m52d3uSB3K57NZFW0BuFGabvwFrHmw==
=8po3
-----END PGP SIGNATURE-----

--WOTjKnJ88wpJKlWH--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F4930C6C8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:02:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0279F177C;
	Tue,  2 Feb 2021 18:01:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0279F177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612285360;
	bh=2fSQyZ1WwQMOhHMDn+OXb0hQdFVNjom2QI2jlsjZH+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1oR5Y4nELXkvAJhGUdtrKr1N6L+phWZ6HOSe6XRzEshR4lr3KC1E0qIWeH0jk9kb
	 bFc4jC+2wXxzlBVfcq60gS98Vy7O44v6bJgk814EQcLPVD1HKLUoQItZBRPPa/BX2T
	 C8H0dr1e+Ua8uo35Ra6grD684GBbFmOOB5Bdz48E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D82CF8023B;
	Tue,  2 Feb 2021 18:01:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88C45F8021C; Tue,  2 Feb 2021 18:01:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE4F6F801F7
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:01:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE4F6F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hBnSneqP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 920B464E08;
 Tue,  2 Feb 2021 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285297;
 bh=2fSQyZ1WwQMOhHMDn+OXb0hQdFVNjom2QI2jlsjZH+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBnSneqPCbcn4MDYUjXnlwCTeaC/3qf7ky/i9cIkSa2sLWIm9llZQeOlDCOjtvew1
 uz+qMMCmkOpFnamO0juf94Lm4quU+vhWHoOJ4r6CN3z0A9RrRFcovtAzWXWLjOPqh0
 /s7VHQmP61+1iinWR+nN07sVuP4nyxEq3daoUQ7POdgIfTUx4CSspCN2l5Y6NGBK2V
 UrCOLGGlKA/HXW4Uetqk4wuZ1jB/jDisIp4trWiXLXzK+RjF4SLQt2SZ+9kIW11J6C
 GV1moa9zw0lW5M1oI0yfkzkQTJjPNP+yQbkt8H/OcdFjZt0Mg1eChqehOsqmnvetYf
 n4bVXEPOsApRg==
Date: Tue, 2 Feb 2021 17:00:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
Message-ID: <20210202170049.GE5154@sirena.org.uk>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
 <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
 <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
 <51571ec9-780b-ba71-c81d-dd01ebcefbb8@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline
In-Reply-To: <51571ec9-780b-ba71-c81d-dd01ebcefbb8@nvidia.com>
X-Cookie: Only God can make random selections.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephen Warren <swarren@nvidia.com>, Ion Agorria <AG0RRIA@yahoo.com>,
 linux-kernel@vger.kernel.org, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
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


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 02, 2021 at 04:24:31PM +0000, Jon Hunter wrote:
> On 02/02/2021 15:25, Dmitry Osipenko wrote:

> > These codecs require individual configurations and those
> > "../codecs/rt5631.h" and  "../codecs/rt5677.h" aren't compatible at a
> > quick glance.

> Right but not all of that is needed. What is actually needed from the
> header files?

Right, and if it's just a case of having a different hw_params() or
something then the majority of the driver could be shared with just a
few bits being handled differently.

> > The tegra_rt5677 also uses outdated GPIO API and etc. Hence the new
> > driver should be a better base anyways.

> Sounds like a good time to update it :-)

Yeah.

> > Overall it shouldn't worth time and effort trying to squeeze these
> > drivers into a single one, IMO.

> Not sure I agree when these drivers appear to be 90% the same.

It's certainly worth considering - given that it's the same silicon
vendor working with the same SoC vendor's reference designs it seems
likely that things will look pretty similar at the system integration
level.  It's possible that it's more trouble than it's worth but it'd be
good to have a more concrete understanding of why.

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAZhUAACgkQJNaLcl1U
h9Br/AgAhxDJhXD92Ou/rbXrbVCd+giU1RLOL08mfRERugF5Ne5z4JmWhbHxgh17
iNAtHsuofQ+vFiHBD+gyGdKDpcJPI1PBoVFmU480078igsYqvZnPaZ6zwdhoRKOf
D9Sp1czdSfnNiIR+Ug8y5yjnsTUt/c4qCfjZWa/vvGuw8VQ6hALooYvAnkrZoFZi
VEKHvYgNgUOqRnIOqdPg5NVqX0dEndIpIQcN+3kV5Yu0xwdi9EFv2dSXp29kye8w
PPdeIP3YTwr9g/AuTKRuSABzvWjVIacsMBfN1osWjX4PflCz96f0lBtqvhJi4qEV
4OE3cy3Aen4lJJXG13rcFEESBokpzA==
=6RSX
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--

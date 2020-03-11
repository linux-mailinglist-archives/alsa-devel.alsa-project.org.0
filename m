Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D28BE1817F5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 13:27:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43217886;
	Wed, 11 Mar 2020 13:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43217886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583929642;
	bh=24aKGf8USad68wemz4fQ5WB73MfTPuqcHaKOlGTQcbQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWe2wCzeXXb/41jryFAp/iP7xq4969yhgLsCmlRIcMo+HrXm65nChL0TYYpOYu+31
	 tX77q2NiL+qZ3XVLpqxiUYtKv4GOx4cE7VK7HSDLmVoCAD2tyC+CvRJi/aW0gtuEV8
	 aaOUoOC6mjTH+uI2DPKbuDkXVEq2/qw1Ipkn61Zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CBE4F801F7;
	Wed, 11 Mar 2020 13:25:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 603BFF801EB; Wed, 11 Mar 2020 13:25:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B9FDFF80141;
 Wed, 11 Mar 2020 13:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9FDFF80141
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18D2F7FA;
 Wed, 11 Mar 2020 05:25:33 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9101F3F6CF;
 Wed, 11 Mar 2020 05:25:32 -0700 (PDT)
Date: Wed, 11 Mar 2020 12:25:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: add function parameters to enable forced path
 pruning
Message-ID: <20200311122531.GD5411@sirena.org.uk>
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
 <20200309170749.32313-3-guennadi.liakhovetski@linux.intel.com>
 <20200310124544.GE4106@sirena.org.uk>
 <20200311074126.GA4149@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline
In-Reply-To: <20200311074126.GA4149@ubuntu>
X-Cookie: I'm a Lisp variable -- bind me!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
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


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 08:41:27AM +0100, Guennadi Liakhovetski wrote:
> On Tue, Mar 10, 2020 at 12:45:44PM +0000, Mark Brown wrote:

> > So why doesn't DPCM recognize that the path is inactive and why is it
> > better to do this than fix whatever the issue is there?

> Of course that would be better abd I'd much prefer that. Unfortunately I=
=20
> haven't been able to find a single scenario in which those paths would be=
=20
> exercised. As far as I understand path pruning should take place e.g.=20
> when a mixer modifies audio routing and as a result disables a certain=20
> pipeline, which is then pruned. If I could reproduce such a scenario I=20
> would be able to first check whether it's working, then see exactly how=
=20
> it is working and then see how best to add my use case to it. Since I=20
> wasn't able to find such a scenario, my only option was to preserve=20
> the current state and add my own path "on top." I'd be happy to try the=
=20
> other path too, I just need a use case, that I can reproduce.

It's still not clear to me what the issue is here.  If something is
making a modification to the graph which needs a recheck or update I'd
expect that these things happen along with that modification.  I don't
understand what you're saying about not being able to reproduce
scenarios or adding things "on top".

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5o2LoACgkQJNaLcl1U
h9BTGgf+MS1O47tGNEZsXfJiMsPQE0g8rVtwACcygj9mziHRQ4tTFGISdOfsj5Mp
G4TyuslyA02Zz3pF4XVuM73gqosDApPd8lj16Y7bMCucftP+TcqynUz/ZuWG7Ov4
Izp8f49YoOD1piIDQkZQPPVtdg1SaNPwUiTfoi1Q3sP3Ypcu6RB+MZjYoV8qASSp
pquhI+AnXCqFd2UeU5aKEPt1EIhsDwg79uSE/9KPKI5FERGWHQqo+kkOV6VWTSrQ
lxQIxdT5eRxZa2E7+0gNhS/fhBcJ0nhaDfSwkQm3zkGO1U8z/Cd1H62E7ZjMROTm
6u+jIOI7jJ4UxHGIsOxsuMHFv0aDyQ==
=tDB1
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--

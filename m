Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FBA32B9CC
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 19:22:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA71718E6;
	Wed,  3 Mar 2021 19:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA71718E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614795755;
	bh=TT24nwGNZgC4yx5dE/NurY4umNAoWfh8TUgL0EKTgnI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ve1EzFLudZ2mcmpRKGKClCTcdvH4eLE+kD4rVFlzMtpNNswoh+ROWh6+wM+O+GRXp
	 Cm8bSKQr6Rb4t0i7RSSBm4hezfp93ULCQfg4LMWu4f8qjO8AKeqWAzpUEX2mkWLICy
	 W+CZz+MAPcCEC5fy788J2/dMXjCK406xLH8+sKPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAC74F8026A;
	Wed,  3 Mar 2021 19:21:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EA30F8025E; Wed,  3 Mar 2021 19:21:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3EC2F800B2
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 19:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3EC2F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hlgbCEiN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D38E64EEC;
 Wed,  3 Mar 2021 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614795657;
 bh=TT24nwGNZgC4yx5dE/NurY4umNAoWfh8TUgL0EKTgnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hlgbCEiNAmZ5FapoOX3T1Xp+T/tXnFSB2MV2DS77KiqK916rv2VeRsNlwOtIdY9JK
 ns4BVnHfEZueloCUB7yKUi8nFjCHyaSA3wYhIdtwNNdD+GKLX0Z8mgtlWr94v6j38V
 bDufj61w6yvGRQPnCPoWja1/esaIN0bNAlmhsA/hm6Q20o48NJ4Kru3dD1uRgH+bgG
 naOlaLNtKADw0y0DJaJVcRDm8s1q2IiGj4GJ7aNrABEDtq7GnV48mgNLbhyDHqEctz
 87Jh2ww/8fqxC9r3Aq0FPWjOG42DsDRrJ6UgKS8bF+HHMvShMBoGMVcTNk4S5axQ7N
 xUpXA+os8j1cA==
Date: Wed, 3 Mar 2021 18:19:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: broadwell: fix mutual exclusion with
 catpt driver
Message-ID: <20210303181949.GB5027@sirena.org.uk>
References: <20210303181616.16751-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <20210303181616.16751-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Results are not typical.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, David Ward <david.ward@ll.mit.edu>,
 stable@kernel.org
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


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 12:16:16PM -0600, Pierre-Louis Bossart wrote:
> In v5.10, the "haswell" driver was replaced by the "catpt" driver, but
> the mutual exclusion with the SOF driver was not updated. This leads
> to errors with card names and UCM profiles not being loaded by
> PulseAudio.
>=20
> This fix should only be applied on v5.10-stable, the mutual exclusion
> was removed in 5.11.

Acked-by: Mark Brown <broonie@kernel.org>

This will need to be sent directly to the stable maintainers.

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA/00QACgkQJNaLcl1U
h9BKSQf/XFlCTw8rPTZPVQyqpaXy+EOiyNIjJohpMX9pBjySafx+xAwPGCWqtgzR
CE4mbLkw3PA7zoj9x2DFrHZy003/2km82AyldljiznSbDIPdL0OCO2RbtNlcoNBV
u+SBaSjAqh9ZiA2jQffX5TT5+QGNSluG4aZGtakWPwQEhHYqS7SkZ2V3GwbUZ2Zy
rR6WKTfHLiHd64XxVJg+31qOtb0BJNPgbH4qSQm7qJQegXw/XL6aFf5CdpU200E2
5RzfMyjRikcFZJ6t+2MA0Zkug5hhkk44XdJ+gabIMDqjbsj2H7EVbFG0HzqrvUvv
pVhHDLmqeSsMax4z4BLghtbCj1ExmQ==
=JqI0
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--

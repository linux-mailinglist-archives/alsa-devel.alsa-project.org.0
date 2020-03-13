Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321B0184ED0
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 19:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B0B185D;
	Fri, 13 Mar 2020 19:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B0B185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584124868;
	bh=MUIqtlM88VBe5x2tzHrPx5WWByO10VfT47z1v80+PD0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gyEjLWRRKVgAWdQ6zCyWJwkF+ol8uhTP4ribsydK3iZFOzjC6w6/H4V1I7aoMl3oz
	 NkWxlK3Kq8xP7mW8+Jipuxp7Y8JI6VSMdDshM6hPZQLbvIxx/8eCAWvLHNwEkGZLwk
	 BOjRjrKda/oSz8YQgXuGFxx9pqk+ttcNZIQ8iZn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9668FF801EB;
	Fri, 13 Mar 2020 19:39:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A65CDF8013E; Fri, 13 Mar 2020 19:39:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CED77F80090;
 Fri, 13 Mar 2020 19:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED77F80090
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FED131B;
 Fri, 13 Mar 2020 11:39:12 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FBB03F534;
 Fri, 13 Mar 2020 11:39:11 -0700 (PDT)
Date: Fri, 13 Mar 2020 18:39:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 12/14] ASoC: SOF: VirtIO: check guest component IDs
Message-ID: <20200313183910.GL5528@sirena.org.uk>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
 <20200312144429.17959-13-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Content-Disposition: inline
In-Reply-To: <20200312144429.17959-13-guennadi.liakhovetski@linux.intel.com>
X-Cookie: This page intentionally left blank.
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


--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2020 at 03:44:27PM +0100, Guennadi Liakhovetski wrote:
> Each VirtIO SOF guest has a component ID range, assigned to it. Add a
> check to make sure, that guests stay within their ranges.

Just squash this into the change introducing the code being fixed.

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5r000ACgkQJNaLcl1U
h9DMCgf+IsIc7L/AQ6l0Ywx9ZyTkDKg3BxDEVNsahpHbqcVKu/iVyjrHZ6NpH67b
TEMDy2nwKCLTzHbNmIOWDTqaLfnEaPJk+DN6sXBjANfrKF7M2xt24V7IQf0mCjPZ
yhKq2Qe/uyg/c8GSoCtWLzlePw4Mt6T/5USc9shB58/ZzQCnGlKB2ECTdyLxc4UB
vPwxYPyGoXXeCFWVmkoUSCc1aoLGrX7o7C306KMNkZ7vOarBiOehc1RpGgZclbUZ
jrWlvLhwZu7q8W5eBeF/d8fdZfQT2wNSxjF+qxLb6t+EwQLAV/U6K5OGeoWTnSxp
MGWsq1qTYim92DdvLkwsfy/Q3HRbaQ==
=EfI9
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--

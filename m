Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD101703E4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 17:13:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F72A1685;
	Wed, 26 Feb 2020 17:13:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F72A1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582733636;
	bh=zD95C8jXvKeA2Lkq8Qa1pNu3GAc/DOkXqzcvvDopkzw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTB3bwLqoOmFUmltidQLHjr7Uc5Yw8LAY70RgEoIQ5Wo5GfsyyHy2PSu3BVOnpe6y
	 XzNn5xh5fC3VDGiAGtKcixSJPCG2aLMQnK3GlHf+eC/xE/r1jxqGfNscGKIeOC3ju5
	 +W5agfGWzcaOh0YnXyWpjcfrsHjC/O1ZG9IWUilY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C1EDF800E8;
	Wed, 26 Feb 2020 17:12:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2124F80171; Wed, 26 Feb 2020 17:12:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 04415F800E8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 17:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04415F800E8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7A630E;
 Wed, 26 Feb 2020 08:12:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58AC83F819;
 Wed, 26 Feb 2020 08:12:06 -0800 (PST)
Date: Wed, 26 Feb 2020 16:12:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH for-next 3/3] ASoC: tas2562: Fix sample rate error message
Message-ID: <20200226161204.GG4136@sirena.org.uk>
References: <20200226130305.12043-1-dmurphy@ti.com>
 <20200226130305.12043-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Content-Disposition: inline
In-Reply-To: <20200226130305.12043-3-dmurphy@ti.com>
X-Cookie: May all your PUSHes be POPped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2020 at 07:03:05AM -0600, Dan Murphy wrote:
> Fix error message for setting the sample rate.  It says bitwidth but
> should say sample rate.

Fixes should always go at the start of a series so they can be applied
as such without any dependency on any new features or cleanups.

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5WmNMACgkQJNaLcl1U
h9B0awf9ESCiHU9RD3/A8kZRztiJ/i6v+mqv3grUXiccDepGBvBCBSTt4rAbsR8Z
1huZ8Sx5uf3xiPy6MxjDtWEoBbr2X/jNM7MRgHc8NLCcGGpv3wvjuvyMcdE38ADg
SfBT4DHipWUcZ9AxU8ke4DvtiK72PmEzNaQeKxIi59HgfJCBW3y8Fzr48oDSYbkX
kvGxYLxWaItvEtEHL08jo40+yGaoKHpsG+EGw9qVghTBmhyp8TYdbw6T+RFKGgSa
U21PS0RePP40e7ypLrueU2wTE2b30z2ti0D/qv2aQ8D0PoM/KOrQ89Vh8r/pzp5m
vcGYefDoOJxBKpi8S0q3+MWLtGBClw==
=K3NC
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--

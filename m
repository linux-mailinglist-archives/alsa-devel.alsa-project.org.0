Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BEB1B45C6
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 15:03:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D72C916BD;
	Wed, 22 Apr 2020 15:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D72C916BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587560598;
	bh=13ANSaSuGzDCKVoAnMURTwuRPCGPukKVEkZeKHNQ+QQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=naTjpTA7XMZCzqc7WjEtSYVmQhQQ78RtHsbq903iKZBkLnG0KHmZakD68Ta+jZRwk
	 aeZVvSg81/Az6HQPdZnYvpRqQUOQPu+qcWGOp+pMbo6cDHxJrjAsiiSKy5VuPvpoyb
	 xDT70ZBm9KrN6/K9Xcc2OCa6eZYzh0olMY8b7otw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22876F8020C;
	Wed, 22 Apr 2020 15:01:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2D76F801D9; Wed, 22 Apr 2020 15:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43FCFF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 15:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FCFF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FbN0DdU5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28EEA206EC;
 Wed, 22 Apr 2020 13:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587560491;
 bh=13ANSaSuGzDCKVoAnMURTwuRPCGPukKVEkZeKHNQ+QQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FbN0DdU5hXPZaWSJE7aHEC5jOm2eS4uFCH+zGGUPB3LKHQFHv7rGlV8GsX54p2Mwm
 0LFjEp+N0ubzYStWYluutnd9BDQtgRx/2Ngq04OnrABl7qZVnvvAWSQtecAaQ4HP7L
 /RgRlyXml9vzHgfNTkLogGzPmMM4FwF0dCSXCXFM=
Date: Wed, 22 Apr 2020 14:01:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Fix build
Message-ID: <20200422130128.GF4898@sirena.org.uk>
References: <20200422112602.13109-1-broonie@kernel.org>
 <2c307fac-077e-6692-a57a-2c2084a4742f@linux.intel.com>
 <20200422125145.GE4898@sirena.org.uk>
 <276595db-6a14-d4c4-8490-33a0b06b241b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline
In-Reply-To: <276595db-6a14-d4c4-8490-33a0b06b241b@linux.intel.com>
X-Cookie: A stitch in time saves nine.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2020 at 07:59:37AM -0500, Pierre-Louis Bossart wrote:
> On 4/22/20 7:51 AM, Mark Brown wrote:

> > As the above and Stephen's report said it shows up in allmodconfig,
> > that's the one I tested.  I'm guessing it should show up in most
> > configurations where that code gets built.

> Gah, yes, I missed this report. I still don't get how this error went
> undetected for weeks on the SOF side, will look into this.
> We'll resubmit the whole thing.

It smells like there's a missing patch that got dropped during
upstreaming.

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6gQCgACgkQJNaLcl1U
h9DPgwf/U26QKEhOD2myN8kFO9OVBdqL8K3DqgcQblHm0A4C+sLGSUiXheS3Tup9
zTiX99coA9hEJK4zKO99Tx9da8JMeElbaju5cB75QlJno210TnfSBWmLT2Ougu6m
JPnS3/IO9aZHyeGMaJYQxzzyPEMkWl06wIiEtI9AR4nFuV4vl+aUrxzjHSza1BGq
r73FY6eLY5evXqAmSxln0ItV0xn4DEXgmdocUNpO7JNC69X84jGQlTMY/gsLofsq
1ExADjZGZ4dN6X5X0vqGsLgALj+JrfP1R6qzEh/N7lS4Q9HPsYQHFpK/dEdOUxEb
4CgvW2sJ1l5rTFy740PJ51NxQUkH4A==
=20Hw
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--

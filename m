Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C73181E82
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 17:58:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80960166D;
	Wed, 11 Mar 2020 17:57:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80960166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583945894;
	bh=GZ+NHBvSfta/cDCx+ROE4C0ykE/JIGiC5lCW5bNSjoY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cyo5yiq2Inhjf3EP0fy/dtPjHI0FEHA8i0ugDOC+HyA2auWRYsicIjN5oPbnuzzoc
	 ABBpH7unLD+F3NcGKujUMBgeHE6Bx+HwBg48qaKGjOfeihdzsufkPwH837211p8ovd
	 2RaDXdCu+RKqBKE8vmmr5nhRA1I2Jj5iAinNqFiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FCF0F801F7;
	Wed, 11 Mar 2020 17:56:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB0E2F801EB; Wed, 11 Mar 2020 17:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AE8E8F80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 17:56:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE8E8F80141
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AB961FB;
 Wed, 11 Mar 2020 09:56:26 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8181C3F6CF;
 Wed, 11 Mar 2020 09:56:25 -0700 (PDT)
Date: Wed, 11 Mar 2020 16:56:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: Skylake: Fix HDaudio and Dmic
Message-ID: <20200311165623.GH5411@sirena.org.uk>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <9d53337b-b02b-efd7-790e-c3db18562346@linux.intel.com>
 <20200309113844.GA4101@sirena.org.uk>
 <e50a52eb-ea7a-4528-cfdb-1dd9210b5779@intel.com>
 <20200309165413.GH4101@sirena.org.uk>
 <cbcdd4bd-6981-0dda-c8e9-bbe5c8128afc@linux.intel.com>
 <2dc38392-760b-a5fc-fa00-98530729f2d3@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SdvjNjn6lL3tIsv0"
Content-Disposition: inline
In-Reply-To: <2dc38392-760b-a5fc-fa00-98530729f2d3@intel.com>
X-Cookie: I'm a Lisp variable -- bind me!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, vkoul@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com
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


--SdvjNjn6lL3tIsv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2020 at 04:49:41PM +0100, Cezary Rojewski wrote:

> Not very familiar with the cherry-pick mechanism for stable kernels, but is
> it possible for patches that ain't flagged with 'Fixes' tag to get
> backported? Having all of these at least on 5.4 is in my opinion desirable.

The document I pointed you at for the stable process includes
information on how to submit patches for stable via e-mail.

--SdvjNjn6lL3tIsv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5pGDcACgkQJNaLcl1U
h9DtXgf/S6atD1s2mZbH7ZJMq5/gcw8AWhg3eawUjwLajbWfA3077+fEF7Ejet2f
xq8TGbC3U7bMTjH67UZ7uCum76q4aqgj55nHBUc8z7FAd+QvTlDXGPvxOlaHcwaf
HpEONuegjIzPlRxAdy9EM9TcUp3gbLmlIfmelPzFZLdGlz31u+I1te/Z/bydG0MG
Xc2sxyZAGumWdNz0y9uejpvpjIDEOgXmjvBqkIX7zsTohuozepd5+MdkZigv+BqI
6d0M5XBqrjszJzud7PchlItbEeuzMiA6mqZV+dppdalM/y+V7xbVI7QpiWpwIr0k
ErDycfTO0r0w2ZCKS8+scUQA5EDqWw==
=mz4i
-----END PGP SIGNATURE-----

--SdvjNjn6lL3tIsv0--

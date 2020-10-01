Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60DD28002D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:30:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A0471873;
	Thu,  1 Oct 2020 15:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A0471873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601559035;
	bh=nvbuJCPx83pE7ndEe4+ksCvMCJ2S56k7vfTdDPeJets=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CARAip2mHC83+kMiSeGoNESgidF8xPTWW3zipEPDshnpHrzg1O3BLxpByBE1iMAk1
	 vrB4Wq90Mfj1945cVNe4NJ1C3YYm51zEKsQll6YsvjKf5rrMV8Xd21krWCKat/xIFp
	 bPKs4OHo/fA9mH8dWxEBSpSH6p3pL/DxosHkJpzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8179F802DD;
	Thu,  1 Oct 2020 15:28:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45A08F802D2; Thu,  1 Oct 2020 15:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C225F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 15:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C225F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DlLkSHbn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2241920754;
 Thu,  1 Oct 2020 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601558888;
 bh=nvbuJCPx83pE7ndEe4+ksCvMCJ2S56k7vfTdDPeJets=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DlLkSHbn/qgKv4PDG/uD9L+LgKG373h2D9xFff9JxcQC7A6WIqeeR0YQ1SAvGKAbw
 7dOGPm7CKteJwAY3TCrCK0csJgzq3G0UooBguSq4mcOtaTQe4jZKIwotAtdzsrYlij
 AbaDeIkT4vLR+bKzRp/DVS5DW7eyHJax+B1qSbCo=
Date: Thu, 1 Oct 2020 14:27:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001132709.GG6715@sirena.org.uk>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hK8Uo4Yp55NZU70L"
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-2-david.m.ertman@intel.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, parav@nvidia.com, jgg@nvidia.com,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Parav Pandit <parav@mellanox.com>
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


--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2020 at 03:50:46PM -0700, Dave Ertman wrote:

>  Documentation/driver-api/ancillary_bus.rst | 230 +++++++++++++++++++++
>  Documentation/driver-api/index.rst         |   1 +

It would probably be useful to have the documentation in a separate
patch, it's a huge proportion of the patch and would make it much more
approachable.

> +are controlled by DT/ACPI. The same argument applies for not using MFD in this
> +scenario as MFD relies on individual function devices being physical devices
> +that are DT enumerated.

See my commments on the cover letter about MFD, this is just not true.

> +An example for this kind of requirement is the audio subsystem where a single
> +IP is handling multiple entities such as HDMI, Soundwire, local devices such as
> +mics/speakers etc. The split for the core's functionality can be arbitrary or

This is not a requirement of the audio subsystem, this is to do with how
the Intel audio hardware has been implemented on their modern SoCs.

> +int ancillary_device_initialize(struct ancillary_device *ancildev)
> +{

> +int __ancillary_device_add(struct ancillary_device *ancildev, const char *modname)
> +{

It can be useful to have this split but there's also going to be plenty
of cases where people just need to register a device based on the struct
ancilliary_device straight away so it would be good to at least have a
standard ancilliary_device_new() (or whatever) that does both steps in
one.  As Greg said in his review this split model is a bit more fiddly
to use and frequently leads to error handling problems in drivers.

--hK8Uo4Yp55NZU70L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl912SwACgkQJNaLcl1U
h9DvcQf/Sphve8mdhn3UFbvbhCK4cib3j+Ittrlo2xPuot13fLVmquU4v6iFoL1F
Nfq5FiEHMrrhX1Z0ttbBpEMiGSn/mksuQUhc3qJtT+1fnBr7YxPfS+PY6+/Jb0JS
FpCRY/Tt1o0x+5Od8C8P9KsXlfzXSx3nxRTS28xPYM14Pm4Ix8911TJtFgWCIipY
h+NuED+nLyeNaDsnw4XnxOEk7STg49Z1QFSu3DXesFoJghpUlbD/dT0dLO0oPLc5
TAjv0LOpghENQ97C4l84RVGeFTqemEpeBAmrp/++zF0gAQ/V4Z0m1I9wUa7KjUnH
2j0uI0jc+oQ0Bpc5WvilXkFouqMuMg==
=XrlR
-----END PGP SIGNATURE-----

--hK8Uo4Yp55NZU70L--

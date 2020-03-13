Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF04184965
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 15:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07051813;
	Fri, 13 Mar 2020 15:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07051813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584110019;
	bh=x8GGQ1ulMYXe3kWEbWWEenVnUQikdkrRgnbGKRGISR4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxY8eG3gyglRshDPwbvcxldojMpjl/0Ley4u5/9udDfHZmDXk/qXykSmXASsQvLw0
	 Cq0GwzAbCjgNw1Igd5M7sRJ+Q3CEE4mqhLK29UY3+k2zeOviFfsVgWc9wGA8Mp0ogL
	 t5fKB7/FcO+nziRqCCDNPZj8HTMBXC4Ue/MqBL8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E02F8013E;
	Fri, 13 Mar 2020 15:31:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8674F80086; Fri, 13 Mar 2020 15:31:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AD0D4F80086;
 Fri, 13 Mar 2020 15:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0D4F80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71D3230E;
 Fri, 13 Mar 2020 07:31:23 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9693F67D;
 Fri, 13 Mar 2020 07:31:22 -0700 (PDT)
Date: Fri, 13 Mar 2020 14:31:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 00/14] ASoC: SOF DSP virtualisation
Message-ID: <20200313143121.GI5528@sirena.org.uk>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline
In-Reply-To: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
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


--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2020 at 03:44:15PM +0100, Guennadi Liakhovetski wrote:
> This patch series extends the SOF driver to add support for DSP
> virtualisation to ASoC. It is built on top of VirtIO, contains a
> guest driver and a vhost in-kernel guest driver. This version

Is there a spec for this?

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5rmTgACgkQJNaLcl1U
h9AFjQf9GAsVkvJADM4k1Rp2gmWANvzxSTw/QLf0L6rbACWr28/0B1WR8gT7OdLn
XBvwCIbMe+vcPNaon22cp/mSowr5P8jJw9wIGAtiQDGqbD6czpagzz30WFuNaTPz
vQsVuoPfB8lCRAkEpWyQZwh6VFB9FLDbjwVSdO3/yAU+Z0Mle5UdR/jP9isPUh+F
y39jelF0OsCrxEBbEt8VC92ZJJGgDiEeKCbLZrzLjYCxhWJsR0KLdmFGPiyW/+zv
CAe4MvvO6sGz0CuxlNnFeR+rti+yl4+F6AsKnnEofw+vDRN29lVZ6ZQR59rQHvG3
CizUHPlF+p3yggBuZEAWnFhPppIdPw==
=lJ/I
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--

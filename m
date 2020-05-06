Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE01C76E9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 18:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8013178C;
	Wed,  6 May 2020 18:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8013178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588783550;
	bh=3cZBUG6VZPPPNMh4ZWavq77fq1Z5gNPzJurCz2ymcWA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9Iq6wws+rPD4k5cpJUxryFgJDj1nZDVVI+YBkJBZVELR9hoiJu+p6hPj+RQnHNzb
	 h1A8NAr72S1As10MxWeYw0aM5dp3ctgrPGGBRuVbBr50sx0tHvkTps9nTSJhIWtFMX
	 0FRxyP6MSb8kuHD0EXRPC2bHpUDqlzwHv2/IvOSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD410F80253;
	Wed,  6 May 2020 18:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41AA7F80249; Wed,  6 May 2020 18:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8134BF800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 18:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8134BF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qs+Y2zD0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2833C206D5;
 Wed,  6 May 2020 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588783427;
 bh=3cZBUG6VZPPPNMh4ZWavq77fq1Z5gNPzJurCz2ymcWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qs+Y2zD0BBeZv0oak9Pp0df7HAfR4vWZ19IWvu+CppsSLgVb32nS3gy9mVu8kIALw
 B2zuY3SuXk0SDteEKIoiONWNIEhA1okAq+0c2JoR4PIEeINhBSsN2obSxTN93TzQQ9
 kxIaV22ZuYLzzaZTXV7+BT3F8A/9D405ZM2AyaFk=
Date: Wed, 6 May 2020 17:43:45 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Message-ID: <20200506164345.GI5299@sirena.org.uk>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
 <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
 <20200506162656.GH5299@sirena.org.uk>
 <DM6PR12MB2633B92B19B337A72B64D0B397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uJWb33pM2TcUAXIl"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB2633B92B19B337A72B64D0B397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
X-Cookie: Not recommended for children.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alex Deucher <alexdeucher@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
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


--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2020 at 04:33:00PM +0000, Mukunda, Vijendar wrote:

> > > > +config SND_SOC_AMD_RENOIR_MACH
> > > > +	tristate "AMD Renoir support for DMIC"
> > > > +	select SND_SOC_DMIC

> > > there could be a missing dependency if GPIOLIB is not selected
> > (SND_SOC_DMIC
> > > depends on it).

> > That dependency is wrong, DMICs don't need GPIOs so while a given system
> > might need DMIC the code should be fine with the stub gpiolib
> > implementation.  It will mean it won't work on some boards though.

> For our current implementation, we don't have any GPIOLIB dependency.
> We just need a generic DMIC driver which should provide codec dai for
> sound card registration.

What you've got should be fine then, you should test with a !GPIOLIB
build just to be sure though and ideally submit a patch fixing the
SND_SOC_DMIC Kconfig.

--uJWb33pM2TcUAXIl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6y6UAACgkQJNaLcl1U
h9DcvAf/bnasHKlldhtV+nXbHagV2AwD7xR1a+bsfFmVaxvcv0GXPBTqVLVbsXRd
8+vEDUPODISgmyXxBYBCr/vNuo4/4+ZHKZXomT0mAynjjr4xzsu6T0WX2nRjttp9
FX+kvLTqQmVS+CTmETdsciGEOq77CqfDSU4hi4GLSgWrBUsZKsBjZwalKtuaGUYR
6JvBqzx2yWZ9WaSYADRCuyF31nggU0YXVXIQ+Z88spdYjcwfTCpt2Quq9p+/9+LA
RX3uhyU3yfLFpmgGrgjLHX4SZEPHny58co+wy9DblfDIesyj4axSKm8Wc7X5W3+Q
SNqddNjrZ3Ny/L7JC6OR/WZuSkWm9Q==
=W6ye
-----END PGP SIGNATURE-----

--uJWb33pM2TcUAXIl--

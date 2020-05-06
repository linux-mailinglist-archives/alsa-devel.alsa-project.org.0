Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77C1C763D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 18:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBE391787;
	Wed,  6 May 2020 18:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBE391787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588782530;
	bh=gBcAALoNWFbN1OZIxWS9i2NDKgTpJvc1EOSNGincAbM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ivFVeyUSCEYWRy73jtv6V1ecAQvko9EVra1ccwVJ0dSIHagpGbL1+nJ+/acstNOX/
	 K46zeQrhG1k3ITIeAwqnQUrqDPXAC8paoAANjp08feuJ7NhvK9Lz5EWFCKD4KvQxe1
	 pbVX/+/mj/5VjY/HIk4IFVxjoQ+y13QKYvdMeGiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE8CAF800AD;
	Wed,  6 May 2020 18:27:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FAE5F80249; Wed,  6 May 2020 18:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CAA3F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 18:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CAA3F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SBUsU+m0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BF922145D;
 Wed,  6 May 2020 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588782419;
 bh=gBcAALoNWFbN1OZIxWS9i2NDKgTpJvc1EOSNGincAbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SBUsU+m09Y0oI8uOb0JDXtrabPUgmfXumf+a5f6KWvXqJO0mC9awtXRlynQl8AjUB
 4nD4+jLa5VwY8Lou9Hk3e7aOXkZxfGTbF87wPHzRdwsX9wp7qiOf1tR5nNj8EkK5dD
 k1YM36UgxzQoJIZ9wuuuTXaFAFkUOOeBEAKQsGKk=
Date: Wed, 6 May 2020 17:26:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Message-ID: <20200506162656.GH5299@sirena.org.uk>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
 <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
Content-Disposition: inline
In-Reply-To: <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
X-Cookie: Not recommended for children.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alex Deucher <alexdeucher@gmail.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, Alex Deucher <alexander.deucher@amd.com>,
 vijendar.mukunda@amd.com
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


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 05, 2020 at 04:39:37PM -0500, Pierre-Louis Bossart wrote:

> > +config SND_SOC_AMD_RENOIR_MACH
> > +	tristate "AMD Renoir support for DMIC"
> > +	select SND_SOC_DMIC

> there could be a missing dependency if GPIOLIB is not selected (SND_SOC_DMIC
> depends on it).

That dependency is wrong, DMICs don't need GPIOs so while a given system
might need DMIC the code should be fine with the stub gpiolib
implementation.  It will mean it won't work on some boards though.

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6y5U8ACgkQJNaLcl1U
h9CNNAf9GjeIpQMY8UoYNAFT5CsuY1lcficAmg1XO+vn4jmZiDupQ98RTTDp+APO
Ep8qA0m4lzdpzojqljRanAtE16EmZhlSHoqQoFKtrWUTBgt+muqCwPMeMtCOgxmj
fg0NmNS3GSGELuMs+IArN7AJ3cNY/hxBIiiTqC/ihGIX/9IKm6dRNr1YN4qJYrg+
M5yi8OaOh62iHcxienqa04mtZJkDe0TU8Rm3nkQmZWLl9IZt1Y4OhCa6IW8Ljqnb
DnvvdY9XvLZTc7nVYJemkMhcX3go2qrsOLFGbcmLFcKf8DCpo289oeRgxEUWJiEE
hIEMZD1N0V9/X/gqYN3DDQmsw9IHRQ==
=1WQ4
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--

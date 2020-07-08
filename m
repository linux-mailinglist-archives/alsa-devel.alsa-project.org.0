Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4EA218A52
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 16:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91AC1665;
	Wed,  8 Jul 2020 16:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91AC1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594219477;
	bh=Sjzz9oln1Cql5t3IpU6mKZpecmWEWwre+xiOBQ9kKvg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tbWjYOP0Mre38c8SOfyEfj9SWh7EHrTwwgniX5yK+U3XWXsXJEWkqoI19gA3vsKgG
	 s4vsJoDXgMBxSqQvGZy0JgfZXvwhPyx6R42BzqRx7MWRk0kIgZ4wU1BHJ+fFBUVzcB
	 SEeM5+f0EczyM0aTIRjF+NHAXSNRAndRiYlSqKks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE8DF80115;
	Wed,  8 Jul 2020 16:42:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BDA4F8015A; Wed,  8 Jul 2020 16:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63EDEF8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 16:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63EDEF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y6Voee1t"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A31D020786;
 Wed,  8 Jul 2020 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594219363;
 bh=Sjzz9oln1Cql5t3IpU6mKZpecmWEWwre+xiOBQ9kKvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y6Voee1tSrUKjWJWfglhv5+6y8OTcm1GHKqv1WPeRrZqYkKWKdhJqJ/iF1aR4ZfIf
 tRp3riRBYZy75HC/CDKPJtwwYKNk6bgCptWD9OU3LuGXlHrbeT6tVAKBJK8JMxYvkc
 dUKZf8xJsRwoDLhsEdDP+dAX55slc/1hD2SvfoLs=
Date: Wed, 8 Jul 2020 15:42:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 00/10] ASoC: =?utf-8?Q?Clean?=
 =?utf-8?Q?-up_W=3D1_build_warnings=E2=80=8B?= - part2
Message-ID: <20200708144237.GS4655@sirena.org.uk>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
 <20200708063900.GJ3500@dell>
 <93b7fb31-7a00-2c68-5096-6a3c81df881a@linux.intel.com>
 <20200708130606.GW3500@dell> <20200708133833.GQ4655@sirena.org.uk>
 <20200708135016.GX3500@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/Ocr+Jy+jPJR1APa"
Content-Disposition: inline
In-Reply-To: <20200708135016.GX3500@dell>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--/Ocr+Jy+jPJR1APa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2020 at 02:50:16PM +0100, Lee Jones wrote:
> On Wed, 08 Jul 2020, Mark Brown wrote:

> > Note that all these patches have unique subjects due to the prefixes
> > saying what they're modifying, this is a common pattern for these sorts
> > of repetitive serieses doing broad cleanups.

> Yes, they're unique within *this* set.  The fun starts when you
> conduct another pass a few months/years down the line and have the
> same lack of imagination. :)

If you're doing that sort of tracking over any period of time,
especially with this kind of shut up the warnings stuff, you're going to
run into issues.

--/Ocr+Jy+jPJR1APa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8F210ACgkQJNaLcl1U
h9CGTAf+MNI/Ze3/BzZtlYhOxIlVJ/wlryePf86bzSwOoxnOIe3bEljdeFAWFAA4
zgQm0RUktFr6XAC9PE4Ly9/VkxmiqIILXGuUlnTdhoxYfVmqEQL12z2JWQBQDUBq
Z8JeWuSIqFRovtmEr/r4PCYshduw429JfLioGk6yGhNsht3bcdKbTyUquiGPyART
s0xAF3inPZMnaQ/46JJI/solmkkYiik41UK65CNkNFGOc4q1ktezHhrNO4Tvk4Vv
M6HtTQ969WpH+Pln6OWD8Tj2YAbfUYyf0AZot3jPl1Z8jk/bVvDQ3v18R4mV3+Pu
QfA7mwGVgQwsBTJh/u+fx1dQNdheXA==
=O3uW
-----END PGP SIGNATURE-----

--/Ocr+Jy+jPJR1APa--

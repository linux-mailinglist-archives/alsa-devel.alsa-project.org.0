Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF923B9F7
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 13:52:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C488D1668;
	Tue,  4 Aug 2020 13:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C488D1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596541956;
	bh=erKjDfsyWHFse4lDcnfJJfQ34faBG+4muG9hErhPl5A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/jY7s7EA8oHNLHlN21d/1A53R/EBYYy4/kN0pMd8/gpxSflUWa/YSc4HjTgwCvdS
	 UzeBXpQZWZFGHJVAsqFg8ImaWCAvMcbohnJ/rNZDkO7lebY1bX4/Y5PPUevTyg/2FJ
	 ZbAWCiEmZDk0+RObd+b76j7+p73avt9OYrsoRrHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D655F800B7;
	Tue,  4 Aug 2020 13:50:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28DC3F80150; Tue,  4 Aug 2020 13:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29C2EF800B7
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 13:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29C2EF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n8BSTkCW"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF07E2086A;
 Tue,  4 Aug 2020 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596541841;
 bh=erKjDfsyWHFse4lDcnfJJfQ34faBG+4muG9hErhPl5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n8BSTkCWnzkGly3EX+k5/5Mdj3y4c15PE3Zvz63K4IP8PLULgbDwSpWxMhXN/H5wg
 neqdQjCanKrZyK+pPMh4AFiVZlX30KSlJWVHbj2FS+MshPIKsMCvP27PwR/uXFQtZw
 4q2aorUsta7l5JnGV081BNbgUq5KP+mWh5I8Ajjk=
Date: Tue, 4 Aug 2020 12:50:19 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Message-ID: <20200804115019.GA5249@sirena.org.uk>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
 <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
 <20200730112948.GB5055@sirena.org.uk>
 <BYAPR11MB3046DD82FAC2B5C672FC85B29D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200803104917.GB4502@sirena.org.uk>
 <BYAPR11MB3046E41085E470BFB11D710B9D4A0@BYAPR11MB3046.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3046E41085E470BFB11D710B9D4A0@BYAPR11MB3046.namprd11.prod.outlook.com>
X-Cookie: Every solution breeds new problems.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>
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


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2020 at 01:57:23AM +0000, Sit, Michael Wei Hong wrote:

> > > The platform also has 2 different interfaces which have different
> > supported max-channels.
> > > Using this value in the device-tree to determine the maximum
> > supported channel of the interface.

> > These should have different compatible strings, there are likely
> > further differences between them (even if they are not currently
> > documented).

> The 2 different I2S ports are from the same SoC which supports different
> number of channels, do we need different compatible strings for this?
> Considering the only difference is the maximum supported channels is 8 and 2?

Are you *sure* that's the only difference, or is that just the only
difference you know about right now?

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8pS3gACgkQJNaLcl1U
h9A+rwf8D5WYj5TvTjpmdksdW5qpD5mSbP+JWLV42nXt+JtdG/0YDBwiflNwZQRy
3fEMl2SzsmmI+/79vwQNXozVR/YT6qu41v4d6h8JRdZUcjkqv3Emxsasl+dX7d2/
HpIY3vhnmGhfbzW9U1h7w1YFVPvZsb1q9QhQKxXPrkHiCtAlvF5GMGYMFEBdvacI
N6vImZCSLgDfeerEr3mRrlfyjCENeVY5P+fBZNMUoWIpDLnnD/+n/9op5NDh82ZE
bmS1K1REsZbrsFzwcUxx99eT2kfHVr85TY9167IkYEkTu7GAkliNVYW5UUsuAlIW
136mzQPprRhnlqfNWz37qx2ECis3ug==
=sxCb
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--

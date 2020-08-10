Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8AC2405E0
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 14:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 284801662;
	Mon, 10 Aug 2020 14:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 284801662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597062556;
	bh=fAzGxISyDEjMGCtkfLt1+CJMQ5uk/fNZTJrOFEp7b6I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0xtCIV6VR2sAwH/QMZRMuGtIScjC5RmdBzViYy0urTH6ayjcFcLQwQzexxpCyY3C
	 8bCY/UKQbiHRI4tsrSGEbTyL7869b/zNe3MZrpY2e+tnvJlR9tC5SouH19RIStSA7m
	 lu7KavKTrZ62FMjeOOVWJ4ONlKDuXba96885lIp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 400E5F801DB;
	Mon, 10 Aug 2020 14:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB0FF8022B; Mon, 10 Aug 2020 14:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66718F800CE
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 14:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66718F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C8JELqrA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A74E32073A;
 Mon, 10 Aug 2020 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597062440;
 bh=fAzGxISyDEjMGCtkfLt1+CJMQ5uk/fNZTJrOFEp7b6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C8JELqrATh/LXoINBb3ZlVQ6mETLYfQwzRj4KpDYO61kBAgXtQYCa5fOHC/AQ8+J9
 mRTizTJF1oC+y6YtTQlc2vye7NVm7yTES6MWcQUMQpw6y6+rafXwbb4uzMFZTrblhz
 ienw0GAsd3G6HF/aABTQGgHsB9iyX8mcrgelM6Vo=
Date: Mon, 10 Aug 2020 13:26:53 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Message-ID: <20200810122653.GB6438@sirena.org.uk>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
 <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
 <20200730112948.GB5055@sirena.org.uk>
 <BYAPR11MB3046DD82FAC2B5C672FC85B29D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200803104917.GB4502@sirena.org.uk>
 <BYAPR11MB3046E41085E470BFB11D710B9D4A0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200804115019.GA5249@sirena.org.uk>
 <BYAPR11MB3046BCAFC8335E7841DE8EAA9D4B0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200807143101.GL5435@sirena.org.uk>
 <BYAPR11MB304699F4BE93C6DDB9620EFD9D440@BYAPR11MB3046.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB304699F4BE93C6DDB9620EFD9D440@BYAPR11MB3046.namprd11.prod.outlook.com>
X-Cookie: Walk softly and carry a megawatt laser.
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


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 10, 2020 at 09:47:15AM +0000, Sit, Michael Wei Hong wrote:

> Since part of the patch series has already been merged, do I send in the new
> patch as a new review or on top of these patch series?

Only send the patch that hasn't been applied yet, it should be based on
top of the current code (including the patches that have already been
applied) but no need to resend anything that was already applied.

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8xPQwACgkQJNaLcl1U
h9C37Qf/QeTQNLkGprQT09kmPWRBdJlwf6AxjAfuFd6mqnrmyXbA5hUDTIuS/ieu
GWK/nlPnCQfNRIgbVZWgwShF7wLmczznsTUTfXT8SJFxKlUbqN2z0FPYAUvc49X4
VdxWVToXwclPQPvsN6lWxd3rzJFLk01W8WlTjAyZ8IVu0kxHPaTL7fJSFgLwNX6y
h4FWcygbitXlYnyY1wVGD9C2XAEh2gON5LdFN50nhLP1VACPFZBZwEr1eoIdkck6
CV9TAv+GMcsiHlHfpycmmin2vIDa5ddlgHRYbUZ0h1EUycjsamvPT16tu+bxoDvE
GiFY0oiSKif++dW6g2XTTpCoBP4/qw==
=JDyc
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--

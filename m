Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E023EF14
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 16:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F9421607;
	Fri,  7 Aug 2020 16:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F9421607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596810803;
	bh=46Q+0+jZwF0wfJ5v40XvJY3v1uf1QkAJYn5NMafKPLE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qk9QdpcfNPEjoDSS9K5RZwOYNnfEC+E+G5VWZW6vz7fBfPg/8nSdmmw8J7aBYk9iI
	 OpPnkFh2nZNd+4PMVpjescdcbf6tflgBRbU7inqBfnJsOUijQGHvweCODKqRDJv52C
	 EkESE0mMTbEXWgkOzunCQMikY89ipiqsA3HP5FZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33765F80234;
	Fri,  7 Aug 2020 16:31:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B1F1F80218; Fri,  7 Aug 2020 16:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 720C4F800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 16:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 720C4F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j0ZHWYAW"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92CD9221E2;
 Fri,  7 Aug 2020 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596810686;
 bh=46Q+0+jZwF0wfJ5v40XvJY3v1uf1QkAJYn5NMafKPLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j0ZHWYAW91IQbQriKpJIXGat/sFckD/PfMek+xcKJ6Pmz1RwmIQCYYAweWimL0GM4
 VnW090s9T+pK65MNy3DTvh0LNXwq7uDJFvIKGZVCpkuVqKrHGJCHWQ0obkkEC/c+RJ
 k54ZoqYxwa2XPpdJ5WQ+tjYj/0aAq9++gsMYRYgM=
Date: Fri, 7 Aug 2020 15:31:01 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Message-ID: <20200807143101.GL5435@sirena.org.uk>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
 <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
 <20200730112948.GB5055@sirena.org.uk>
 <BYAPR11MB3046DD82FAC2B5C672FC85B29D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200803104917.GB4502@sirena.org.uk>
 <BYAPR11MB3046E41085E470BFB11D710B9D4A0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200804115019.GA5249@sirena.org.uk>
 <BYAPR11MB3046BCAFC8335E7841DE8EAA9D4B0@BYAPR11MB3046.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8SdtHY/0P4yzaavF"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3046BCAFC8335E7841DE8EAA9D4B0@BYAPR11MB3046.namprd11.prod.outlook.com>
X-Cookie: Disposable, use only once.
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


--8SdtHY/0P4yzaavF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2020 at 06:21:14AM +0000, Sit, Michael Wei Hong wrote:

> > Are you *sure* that's the only difference, or is that just the only
> > difference you know about right now?

> Yes, I am fairy sure that is the only difference according to the design, as per the platform use case.

It would still be safer to have a separate compatible, it wouldn't be
the first time that additional changes that the hardware people had
failed to communicate were discovered.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--8SdtHY/0P4yzaavF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tZaQACgkQJNaLcl1U
h9CI6Qf+NWrfyvrDCxBzOaQ5PNVZO0sowhT2nHBp4vMvoTNOIu14rGMTv1iHbI8P
9xGacSTERvHgOC2GfgLwycaYs5JEDCg9MU0Hgwxq9wTmqlVliOWPPD8S0oxcL+Lz
wtgFZ1qN5L6RX/K81Enxuj2D3MFBxAvNlu9lsXW/IYaLTX4m8dlvflTK6thJk6vN
6DTTDI95ronTQH9yJx8IlXID1aHfqnhOdBL1iokrdCivq3e7hEQQWWv2vcpEjtx2
O9/kezY3dbwnqQW6GqyKQg64dp0Ys1CLQSHJUoQT9ImSARUloKHlgjIHWXIS5Ftb
aDH2n/V4SRuJ6X3dXA6LVwXIpHITEA==
=kYXN
-----END PGP SIGNATURE-----

--8SdtHY/0P4yzaavF--

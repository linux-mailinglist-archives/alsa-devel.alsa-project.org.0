Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF091E4387
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 15:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7301417BB;
	Wed, 27 May 2020 15:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7301417BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590585913;
	bh=HTwhXfCMFXRQJx3sGwmc8wVUoLpjSIG7kiRwOoTOZ6w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rl9P3mF70gcBkNmo0wF3XGG97R8Jfn+arITCjcrUcGRXFTX3Jk35aQ340NDBuAHS7
	 KEgxPMkRj6tG+9iz31Sfa3LQLY3iApEftpLqXM1no2zh6SEJj2Opb5nqicT/YoXa/S
	 q+70mvPUHIIaM7nl0yhSq/9IsuBp/7bj0+4deWc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87F56F8014E;
	Wed, 27 May 2020 15:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B378DF8014E; Wed, 27 May 2020 15:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5310BF800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 15:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5310BF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q+Bu48wl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94CAA20899;
 Wed, 27 May 2020 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590585800;
 bh=HTwhXfCMFXRQJx3sGwmc8wVUoLpjSIG7kiRwOoTOZ6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+Bu48wlsO6us0kDYckt3NrNWwd6fe6Vbm6349bNegsg5XNjCRkf3OopCpjxeQ+1x
 hNh7eAo0bUAeQulHHzOlKWH7NfokqZrpM1Yt2RYT9wadWp1LwnnIYwR3lhwDvAAaPk
 xBmVXt6va3O88ypIR6Otmzm3gccgXPRaT/xy/yEc=
Date: Wed, 27 May 2020 14:23:17 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sia, Jee Heng" <jee.heng.sia@intel.com>
Subject: Re: [PATCH v2 1/4] ASoC: Intel: Add KeemBay platform driver
Message-ID: <20200527132317.GG5308@sirena.org.uk>
References: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
 <1589768242-4594-2-git-send-email-jee.heng.sia@intel.com>
 <20200518170647.GA28178@sirena.org.uk>
 <BN6PR11MB19539E4C24D163FB66434D02DAB10@BN6PR11MB1953.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline
In-Reply-To: <BN6PR11MB19539E4C24D163FB66434D02DAB10@BN6PR11MB1953.namprd11.prod.outlook.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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


--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 01:20:41PM +0000, Sia, Jee Heng wrote:
> On Mon, May 18, 2020 at 10:17:19AM +0800, Sia Jee Heng wrote:

> > +++ b/sound/soc/intel/keembay/kmb_platform.c
> > @@ -0,0 +1,746 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + *  Intel KeemBay Platform driver
> > + *
> > + *  Copyright (C) 2020 Intel Corporation.

> Please keep the entire header C++ style so things look more consistent.
> [>>]  Will below format meet the C++ style?
> [>>] // SPDX-License-Identifier: GPL-2.0-only
> [>>] //  Copyright (C) 2020 Intel Corporation.
> [>>] /*
> [>>]   *  Intel KeemBay Platform driver
> [>>]   */

The *entire* comment please.

--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OacQACgkQJNaLcl1U
h9A8ZQf8Cvh7NMwWJBauqySRGjgFOXWH3qKTslwrZLbnxR2UTVJ9xLRDr411tb3K
PqiTRXZA5FhfoX6zkMgL2B8K7JXftfDLP8UJtn+Eal/25Rn2ztl0NRGpzieGUQ6J
sgik3R67IR+iysFq562fgTMvquhoYUHUFd1UUxnEHBJix3I78MSqsiJSLvNEWUIL
A2cVSfDDX6m0JXW9H9h1rx1DffILBs8YiIvmKBWg9gAxb8vp1SjY7d7xrDFsI7X8
5ZchA1E/oLRBWai7VsCE9Kszh2aE2sffyjLlNsenVvuBp5lG6ErEZ1m3Up9lOM0a
KRwXl8M9gmxtNQeJkzpsRjXyT5HFbA==
=9zes
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--

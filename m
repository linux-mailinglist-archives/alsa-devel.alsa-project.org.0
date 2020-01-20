Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2317142A3A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 13:11:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81E0E1672;
	Mon, 20 Jan 2020 13:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81E0E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579522288;
	bh=j8cylT2kRkVLnajER0JIZxWr7JsmlU5MkiSCUIHE+2M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jSkRN5zwJK/oheA+T2FROOhj2oUHeAdidXF2qCF2Wu0Xqis3nnA9v7dHiUHgQmL/J
	 EGqOSMaDPTikHAZQdZWHKkY+3w2+yIhrG5JzPBrJajJhVyCnjAqc+Am6T+j9t1anJC
	 c8DFX/0bsVm+MpXaCWNy8wbFlnO7Xt6Y00nzbDIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0B5F8020C;
	Mon, 20 Jan 2020 13:09:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECCC8F8020C; Mon, 20 Jan 2020 13:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E1E2BF800C6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 13:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1E2BF800C6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCA2B30E;
 Mon, 20 Jan 2020 04:09:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B87A3F68E;
 Mon, 20 Jan 2020 04:09:35 -0800 (PST)
Date: Mon, 20 Jan 2020 12:09:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20200120120933.GB6852@sirena.org.uk>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
 <20200117175626.56358-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200117175626.56358-5-andriy.shevchenko@linux.intel.com>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Guilherme G . Piccoli" <gpiccoli@canonical.com>, alsa-devel@alsa-project.org,
 Cezary Rojewski <cezary.rojewski@intel.com>, x86@kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH v1 5/8] x86/quirks: Add a DMI quirk for
 Microsoft Surface 3
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
Content-Type: multipart/mixed; boundary="===============1036219121887471511=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1036219121887471511==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 17, 2020 at 07:56:23PM +0200, Andy Shevchenko wrote:
> Add a DMI quirk for Microsoft Surface 3 which will be utilized by few drivers.

I have patches 5 and 7 with no other context, what's going on with
dependencies here?

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4lmH0ACgkQJNaLcl1U
h9BbAwf/WLuPHY9q8Tq7jRti9DUHNRsH7Ys+k7oM/sAMiV6OmaYgbYVCm7DwbKMV
vZxXGwtIcBxeSc7ZmLpDYLz/xu8V/22A8c4t/ERKcN3HwbMMaewV5C/PAP91HdOw
LjXZnjDD0ac6JJceAEHBzB1NmAeOAS1W8mcckBSrgDSObHQorWNPdgYXLuRLJq7t
aHosto1MOnkOZaz3Gm+eKhi28ZrVNb4ZGrLKuOWyypGuYd5PzUPgsTT0c4hkNk8y
DECEYWSRugoGdnOwEUuU1ctSjq/DkLCta51CaMRn2Z0QyiSmjsL/xAl/1bvFa+oo
63d3fqxqXjR+PcwwUgz4Pzf57hg2Ag==
=2r1u
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--

--===============1036219121887471511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1036219121887471511==--

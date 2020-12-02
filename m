Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 701882CBD06
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 13:30:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF5C17D7;
	Wed,  2 Dec 2020 13:29:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF5C17D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606912243;
	bh=I3OHg8mnnc5iQCobQvP21M7Ashds3CHUIF1IGGWiIuQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WfX+hs3hNOjP7sWpoY76++waFyBcfrHBUmDE/GJetvZsgZbtNKwxqAqenf4HSkCTy
	 lfJJXNI1RdtOaVtJqWpB4ons5IIJcPGjG+hquJ9HFXVYlLGYNEal6UKMiZ9xeJTPMF
	 r5Tn052pd/Pp/Yg4CnxStahFyHKRAZlAFQoenYO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47FB4F80158;
	Wed,  2 Dec 2020 13:29:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5B17F8026B; Wed,  2 Dec 2020 13:29:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1EEDF80158
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 13:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1EEDF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xrDmkokz"
Date: Wed, 2 Dec 2020 12:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606912136;
 bh=I3OHg8mnnc5iQCobQvP21M7Ashds3CHUIF1IGGWiIuQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=xrDmkokzjmeFguNyxFErMeCaESOXcOF8MCiNvH0TlGkMWzxT10moxLOWbWZPqa3RF
 i20cZ7fDK+vMT5KMYtN3SWguV+oUm3sPOJr2J4R3EZzMTm2AkJnkGeRmNRTRoW3AG8
 kKVOwv7KO2ewv7PX5hm7QqK9PD/Wr1GmXU1Rq1+g=
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] ASoC: Intel: catpt: Replace open coded variant of
 resource_intersection()
Message-ID: <20201202122826.GB5560@sirena.org.uk>
References: <20201124095628.54373-1-andriy.shevchenko@linux.intel.com>
 <160683107676.35139.9521964646147921378.b4-ty@kernel.org>
 <20201201183329.GI4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline
In-Reply-To: <20201201183329.GI4077@smile.fi.intel.com>
X-Cookie: Sauron is alive in Argentina!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, linux-acpi@vger.kernel.org
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


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 01, 2020 at 08:33:29PM +0200, Andy Shevchenko wrote:

> As I mentioned in the comment (after --- line) the patch relies on the stuff in
> linux-pm tree. Do you have any immutable branch pulled? Otherwise Rafael
> already took it where it won't break compilation.

b4 had a bug which caused it to send thanks for every patch I'd ever
downloaded but not applied, the "no commit info" means there wasn't an
actual matching commit.  I'd been going to review it but then it got
applied anyway.

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/HiGkACgkQJNaLcl1U
h9A0Lgf/RtfnAWSqpPMQ8VebIf7JcBYx+dO+jtAR7nuQOCBgNRrimSJoRjeqPnT1
v7hruI6gaNlj3EdJJl/zxWcr6Y9Ummxr1IXo9XWGKHYT9T6jGEiZQxWI5/iJa9J6
sCK355KibYX1+ZPGdIl3svUfRQdTPO2ayo3ySSuw+O3fvWwq1F+ZZ4kKNjLKsi45
dealsPDDXvcOcn1Egtx4I++LOz+R57bgRoHDJJaXB/Ww9m/2ZRqXvLlxC9LUCPu0
tM1+dEZl3lWEGKhp61BJH1p3l3kdtxE5b3ha7HBrKHkZWcwkO6VhNUG5riphTDvF
TiL7/9LFFJA/SBH9KgS7lQKkTjvcjw==
=ywMl
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--

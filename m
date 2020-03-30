Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A542D197AFC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 13:41:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BFF71654;
	Mon, 30 Mar 2020 13:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BFF71654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585568478;
	bh=OFQ9c5MHRq45REPEIsT+s90t0Wzn/ttCQWwUH5pLhZ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KcTuoBqxpKJ40dV15G8Gev5hk5awbG/x1otmANvXoPKlu7qaZY+Xe6Mds9OcAQfsO
	 JWFK2tns/mXtbnXVvRMax+rlWorjkCfZ76mkbPuY7WS7Xo8VMD0GrhsgOoPPi0C6fQ
	 Mg53z2Qb/Cr9fFOyAqEjsoDqHYxeUdX6769QQlGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F71FF800AA;
	Mon, 30 Mar 2020 13:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E262FF80148; Mon, 30 Mar 2020 13:39:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4D18BF800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 13:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D18BF800AA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DE0731B;
 Mon, 30 Mar 2020 04:39:31 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2D623F52E;
 Mon, 30 Mar 2020 04:39:30 -0700 (PDT)
Date: Mon, 30 Mar 2020 12:39:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200330113929.GF4792@sirena.org.uk>
References: <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <20200330102356.GA16588@light.dominikbrodowski.net>
 <43c098c9-005e-b9f4-2132-ed6e4a65feee@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hK8Uo4Yp55NZU70L"
Content-Disposition: inline
In-Reply-To: <43c098c9-005e-b9f4-2132-ed6e4a65feee@intel.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, tiwai@suse.com, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com
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


--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2020 at 01:10:34PM +0200, Cezary Rojewski wrote:
> On 2020-03-30 12:23, Dominik Brodowski wrote:

> > Seems this patch didn't make it into v5.6 (and neither did the other ones
> > you sent relating to the "dummy" components). Can these patches therefore be
> > marked for stable, please?

I sent my pull request already sorry - once it hits Linus' tree I'd send
a request to stable.

> While one of the series was accepted and merged, there is a delay caused by
> Google/ SOF folks in merging the second one.

> Idk why rt286 aka "broadwell" machine board patch has not been merged yet.
> It's not like we have to merge all (rt5650 + rt5650 + rt286) patches at
> once. Google guys can keep verifying Buddy or whatnot while guys with Dell
> XPS can enjoy smooth audio experience.

My scripting is set up to merge things sent to me as a patch series and
we didn't get positive review from Pierre on any of it with the review
on that one patch seeming to suggest it might also be waiting go go
through a test farm.  TBH I also wasn't expecting it to take quite so
long to get reviewed when it came in, it's been over 2 weeks now...

--hK8Uo4Yp55NZU70L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6B2nAACgkQJNaLcl1U
h9CV2wf/Q5xQ8+z3m3nsFtxyh6rxzmzREsyl9PalMKFUiuKtDDMbT8NcdK8MVX9R
GNOLRjEY6NNV27jQ0mEB+d7VjaDSxUNAkGKx+iQfv2jP/dME2rbqz57GgnFrmNzw
Jj/aGwNhgdHvTVUkSYagDpPOWsV16VcyTDwCdUMjYV5zDmB4S8JRL9uJ0ykoje21
BEaeWvkTfQeEUr7WruNF7cq2jCE0eu/ytauoesMGhQ03uD9QzbszphpZLAhxvUpI
CjCcu4UjmqqXNCtH8m2choviIIbmEJzImaZXKJnMZCObQm4ajxOyoyupL6B+QD2y
ELkwygc8I8AWRlpoOkqtFYDwVm/oGQ==
=wpkO
-----END PGP SIGNATURE-----

--hK8Uo4Yp55NZU70L--

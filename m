Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29E10C94D
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 14:15:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADFD816E6;
	Thu, 28 Nov 2019 14:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADFD816E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574946934;
	bh=pk54otFlIXzVD5b3vhiTCbCHPLmOSxvRQ8DihdP7Dgc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKj4JBE5upNSxiI3E+2u0ofLHuRHiA+WodSDqjEtMFtr0ANJDCULalKt1ts0egyh7
	 L+VguOUJf30YEpV+ON/K2miNGFwfNzhxTFaUfX+/IWylpkVkUDR0IhH6GzRfFj9Aba
	 ayBZse1uyIwgmdhThGecvJBSyTW9TmdZNaxjnT0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07929F80149;
	Thu, 28 Nov 2019 14:13:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C37ABF80149; Thu, 28 Nov 2019 14:13:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 09445F800CE
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 14:13:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09445F800CE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F23EF30E;
 Thu, 28 Nov 2019 05:13:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FCA03F52E;
 Thu, 28 Nov 2019 05:13:43 -0800 (PST)
Date: Thu, 28 Nov 2019 13:13:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20191128131341.GD4210@sirena.org.uk>
References: <20191126170841.GC4205@sirena.org.uk>
 <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126175040.GD4205@sirena.org.uk>
 <AM5PR1001MB09940CF764711F1F13A6B37E80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127123317.GA4879@sirena.org.uk>
 <AM5PR1001MB0994D842A2D7051F81A7765B80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127154030.GD4879@sirena.org.uk>
 <AM5PR1001MB099467ACADA4F7B6DDA5087480440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127164116.GE4879@sirena.org.uk>
 <AM5PR1001MB099446A50351CC49478893D780440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB099446A50351CC49478893D780440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock
	handling
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
Content-Type: multipart/mixed; boundary="===============2718556264782818635=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2718556264782818635==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2019 at 06:10:00PM +0000, Adam Thomson wrote:
> On 27 November 2019 16:41, Mark Brown wrote:

> > The PLL configuration specifies both input and output clock rates (as
> > well as an input clock source) so if it's got to configure the MCLK I'd
> > expect the driver to figure that out without needing the caller to
> > separately set the MCLK rate.

> Yes it does but the name of the function implies it's setting the codec's PLL,
> not the system clock, whereas the other function implies setting the system
> clock and not the PLL. Also generally you're only setting the sysclk once
> whereas you may want to configure and enable/disable the PLL more dynamically,
> at least for devices which do have a built-in PLL. Of course that could still be
> handled through the single PLL function call.

I wouldn't be so sure about only setting the SYSCLK once - if you've got
an input clock you can configure then you might for example want to
switch between 44.1kHz and 48kHz bases, and disable it or run it at very
low frequency when idle.  In some systems it's as dynamic as a PLL is.

> Just as an informational, what's the future for these two functions if
> essentially one is only really required and the other deemed redundant? I would
> just like to be clear so I'm not falling over things like this in the future,
> and wasting your time as well. Seems that the PLL call isn't part of simple
> generic card code so would the be deemed surplus to requirements some point down
> the line?

Things like simple-card are good for 90% of systems but I'm fairly sure
we'll never be able to handle more complex setups entirely
automatically.  What we *should* be doing over time is transitioning all
this clock stuff into the actual clock framework but that's a big, long
term thing which nobody is currently actually working on.

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3fyAUACgkQJNaLcl1U
h9BbLwf/ZISsJtwJ0CU1vhbk43SAwt2M4uHor1sY0rCDrh6SnqvRGe6TMWOHvjHz
9huuR+na9acBHQ5yOOiQn6fA9JGClPZNKN2HjgUOfZ28J1Qur+pNddbtTuy70xi4
oOayq16CdAMqXwa7IPIjo3lL+LIJfBJun2XGUQlKByrLpON/y+9LRT+r8twRpFhu
Ko0M4akmUEXodGJfWRPsoHXVDXRV9LMvKB8m5v9MwVSH4XHfzZCuf4XtlUIigztX
MnlSv4fnVyoHpRUbjShEsq0TIvOOIgf01NIGNqhsBLUd4OUlRMX64/FHDOSuObEn
n05/fdBhdXaCJRclImqdOUtFGdqHLA==
=Y+sk
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--

--===============2718556264782818635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2718556264782818635==--

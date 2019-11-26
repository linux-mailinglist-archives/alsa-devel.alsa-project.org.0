Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB710A396
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 18:52:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F142884A;
	Tue, 26 Nov 2019 18:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F142884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574790753;
	bh=l8OlAHi2MzisZbweK6O64lpXzNiqJkupWB1GVxxDa6Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C4Z0JJL0wuoH7kmWPE4kzMNkfgFePXY4TiX89hi0an+R71Ssg27me7MPV6hDIY5pu
	 s6zMqaSvu5yVUHi9UBxmwcdC3IpaJGPUnn8USvEcfv3GBcJL68aUVybtw7uf/0Qzfp
	 GzjxUsPRVrAoCzYoCkr5Jrx7JnqIWROgLpuoj6ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DB09F801F2;
	Tue, 26 Nov 2019 18:50:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D17F80159; Tue, 26 Nov 2019 18:50:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E6D7DF80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 18:50:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D7DF80109
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74AB30E;
 Tue, 26 Nov 2019 09:50:42 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CC813F52E;
 Tue, 26 Nov 2019 09:50:42 -0800 (PST)
Date: Tue, 26 Nov 2019 17:50:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20191126175040.GD4205@sirena.org.uk>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126170841.GC4205@sirena.org.uk>
 <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Cookie: Where's SANDY DUNCAN?
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
Content-Type: multipart/mixed; boundary="===============8472831650288292419=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8472831650288292419==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2019 at 05:39:45PM +0000, Adam Thomson wrote:
> On 26 November 2019 17:09, Mark Brown wrote:

> > If we're special casing simple-card we're doing it wrong - there's
> > nothing stopping any other machine driver behaving in the same way.

> Ok, what's being proposed here is for the codec to automatically control =
the PLL
> rather than leaving it to the machine driver as is the case right now. In=
 the
> possible scenario where this is done using a card level widget to enable/=
disable

Wasn't the proposal to add a new mode where the machine driver *could*
choose to delgate PLL selection to the CODEC driver rather than do so
unconditionally? =20

> the PLL we will conflict with that using the current suggested approach f=
or the
> da7213 driver, albeit with no real consequence other than configuring the=
 PLL
> twice the first time a stream is started. It's a case of how to determine=
 who's
> in control of the PLL here; machine driver or codec?

The patch looked like the idea was that as soon as the machine driver
configures the PLL the CODEC driver will stop touching it which looked
like a reasonable way of doing it, you could also do it with an explicit
SYSCLK value (which would have to be 0 for generic machine drivers to
pick it up) but this works just as well and may even be better.  Perhaps
I misread it though.

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3dZfAACgkQJNaLcl1U
h9CwfAf/YV/EIozE9EzDMFY5bhh24HCl54wOPeRj11gAdUc9Dgos5WcUBUp1OKGF
fMWwffNUQQ6pttjnObQRNpgbEYALQbgmriiDqKa6l7m/jBgm0vaXtF+rdbyHEt7Z
VGEZcUDDUYjL3lYLHpmCMIxuON1NceLHNn6UjNWc3ukHuKOZTDVKANSoAiskfvuH
dpcZX/A6I71lUtLq54+uVGh28k7/5cOL2sE/syHjQyA25LcH71hjFVhaByUcx8EC
AjV8phIVnDYDzwAQhrz0MfXCySpsaq0oPNWHkr9S4d4RZvVaqI5DFVVRGxUivZOM
auolGphSGFR7UvpNFLu9qItUxlTZxA==
=SdHM
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--

--===============8472831650288292419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8472831650288292419==--

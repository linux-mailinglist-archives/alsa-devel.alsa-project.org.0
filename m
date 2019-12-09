Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2C117184
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 17:26:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A591655;
	Mon,  9 Dec 2019 17:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A591655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575908770;
	bh=YlcbcuImJcHuggXOEV5fjJP2UZxg9yqdQ60dE/vDZvw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=td4hSXIEv8xQur9IKtMsHuly8IF1zqwbFLIW71W25H/gQ4U4K9VMRJjYh5RqkDdIC
	 AR8afStE9vphOVXaNddsfB0wDm9osaN8OzYxv78oHySNAiRE4shyZsK9mwa4sJ07D+
	 qgxCvM43t2WG4Y9R2snktkZqohheYPs4u/+xY1Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42477F801F4;
	Mon,  9 Dec 2019 17:24:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B838F80234; Mon,  9 Dec 2019 17:24:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1CF0AF8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 17:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CF0AF8011E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 188571FB;
 Mon,  9 Dec 2019 08:24:20 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AFA53F718;
 Mon,  9 Dec 2019 08:24:19 -0800 (PST)
Date: Mon, 9 Dec 2019 16:24:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20191209162417.GD5483@sirena.org.uk>
References: <20191206075209.18068-1-hslester96@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191206075209.18068-1-hslester96@gmail.com>
X-Cookie: We read to say that we have read.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: cs42l42: add missed
 regulator_bulk_disable in remove and fix probe failure
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
Content-Type: multipart/mixed; boundary="===============7709762418748053099=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7709762418748053099==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 03:52:09PM +0800, Chuhong Yuan wrote:
> The driver forgets to call regulator_bulk_disable() in remove like that
> in probe failure.
> Besides, some failed branches in probe do not handle failure correctly.
> Add the missed call and revise wrong direct returns to fix it.

Same issue with runtime PM here. =20

Also please submit one patch per change, each with a clear changelog, as
covered in SubmittingPatches.  This makes it much easier to review
things since it's easier to tell if the patch does what it was intended
to do.  When splitting patches up git gui can be helpful, you can stage
and unstage individual lines by right clicking on them.

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3udTEACgkQJNaLcl1U
h9Bqbgf9GTYhOs7Nn3KkyBrYfs9NAQYMhCp8xOVquBih5sU9TwD7H0AG8fXJH2Eu
p8jFyERHbkF5DMeHKeP/hzl67ozizN+Iy4JS1DeBMlskvgX1Bu3B465+/MVFREbA
ivJEXS9KlF8BXHjFiy512SvsxYjtcdq8sYsO6SNi+yGDd1dGxYfXefVolMkapckR
FbJ/hWFj+xJl7x9fEcoi1JeowSVu6Pg03UmoyA2B00pLA1DUR8nxbHCV/oHfK8GV
631fB7i6WCh9OdI2pZqE9xVgHPjnbctVoV5S9K5B0nqabr+2gA5yLHHBY5bqz4DH
otFYGNuL1eFWPBSiNsVG8Q6Ex7tEfA==
=ZgZ0
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--

--===============7709762418748053099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7709762418748053099==--

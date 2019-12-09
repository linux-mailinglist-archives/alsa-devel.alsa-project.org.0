Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87363117256
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 18:02:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014781655;
	Mon,  9 Dec 2019 18:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014781655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575910944;
	bh=w0Ja1cHy9A4QOycX5u/Hkl33//m0WM119Cha1AQj8RA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rktwWND+6+C9Zzy1STDQ4P+1uzu8Wfss04h/3xsqDiEWWjQ6Uxrxk3ld9rud/te3S
	 DtGjiuBiB1c28hk8PxAqg26N2pH8lqGkBbXuLfSWzrzDfIVzbLFqDiaPraNyhhvsls
	 hLGxwOPjIbRP0Kd6zQqSoJJjXMumZJD/kXFHkqfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D536F80234;
	Mon,  9 Dec 2019 18:00:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C609F80234; Mon,  9 Dec 2019 18:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 79E4CF800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 18:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E4CF800C4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418FA1FB;
 Mon,  9 Dec 2019 09:00:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B39F33F6CF;
 Mon,  9 Dec 2019 09:00:31 -0800 (PST)
Date: Mon, 9 Dec 2019 17:00:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20191209170030.GH5483@sirena.org.uk>
References: <20191206075209.18068-1-hslester96@gmail.com>
 <20191209162417.GD5483@sirena.org.uk>
 <CANhBUQ0zwQG-=C12v02cf5kfvJba=5_=0JkZA45DDhxOzTBY6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANhBUQ0zwQG-=C12v02cf5kfvJba=5_=0JkZA45DDhxOzTBY6A@mail.gmail.com>
X-Cookie: We read to say that we have read.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
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
Content-Type: multipart/mixed; boundary="===============7200643387463310536=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7200643387463310536==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WIIRZ1HQ6FgrlPgb"
Content-Disposition: inline


--WIIRZ1HQ6FgrlPgb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2019 at 12:52:30AM +0800, Chuhong Yuan wrote:

> I have a question that what if CONFIG_PM is not defined?
> Since I have met runtime PM before in the patch
> a31eda65ba21 ("net: fec: fix clock count mis-match").
> I learned there that in some cases CONFIG_PM is not defined so runtime PM
> cannot take effect.
> Therefore, undo operations should still exist in remove functions.

There's also the case where runtime PM is there and the device is active
at suspend - it's not that there isn't a problem, it's that we can't
unconditionally do a disable because we don't know if there was a
matching enable.  It'll need to be conditional on the runtime PM state.

--WIIRZ1HQ6FgrlPgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3ufa0ACgkQJNaLcl1U
h9BFrgf+KMBI9l2Ruzln5WCg+/ELdsLj2dDgAlFZSOigICoPdgNnXzqk8gYIZxsb
5y5Q4mUcWncbjNq7PuWG/ddIonFPKyPhKb/h/xrdgbTPfqqEekryLHW93SS+sAiG
mLktyFWuPyvZOifDWfaFwYc1jzwsslgOweJOEoOw+fofsPlxe/3R8oom4zfpwdDV
KUUxIC5hEKjUfPTpOVdw+7Ud7JpFm7uR1qtd6LptcIOb+UO7FPm6EQhrkl0thiGd
fKGcPx/t3f/Xjn23+Nw3WmV+gSUX9t6wqsouwWB83Capsb4N3SMw7HFOPcy0S5vV
rB45x3AzVSeKCCSIKs1IywlYcsUO7w==
=feWL
-----END PGP SIGNATURE-----

--WIIRZ1HQ6FgrlPgb--

--===============7200643387463310536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7200643387463310536==--

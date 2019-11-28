Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2C10CE35
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 19:01:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 418D816E5;
	Thu, 28 Nov 2019 19:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 418D816E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574964110;
	bh=o4FCXLaDcRW8loVG68SHj1m2xdqXWZ5VJMllnBnPP+Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hxRpBikVV8VWmccM3ygVdMoOtzKSUB91EAgd4l9apOgtAirn0aW/CaLCIgI7wpdQa
	 5mflweEluh7cs9nmCRQwaeCM+ReoTxsmuEZwLbZp22c6kaqOGUmGbd+NvhPSAbk32U
	 fzhlsN/vMETd2OHFidJ3hG0GZds8kKLWI6OSIHm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B06EFF80149;
	Thu, 28 Nov 2019 19:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 544AAF80149; Thu, 28 Nov 2019 19:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1CB84F800CE
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 19:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CB84F800CE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D3F61FB;
 Thu, 28 Nov 2019 09:59:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EC423F6C4;
 Thu, 28 Nov 2019 09:59:58 -0800 (PST)
Date: Thu, 28 Nov 2019 17:59:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20191128175957.GG4210@sirena.org.uk>
References: <20191126103404.29534-1-perex@perex.cz>
 <dd238740-f154-a660-2a80-0ada80183dd2@linux.intel.com>
 <32edec86-ec1c-1809-2278-fecac09ac321@perex.cz>
 <20191126162935.GB4205@sirena.org.uk>
 <48159775-bd7b-b473-7e02-3116ca8dee73@perex.cz>
MIME-Version: 1.0
In-Reply-To: <48159775-bd7b-b473-7e02-3116ca8dee73@perex.cz>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: intel/skl/hda - export number of
 digital microphones via control components
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
Content-Type: multipart/mixed; boundary="===============5062518070866482296=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5062518070866482296==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Content-Disposition: inline


--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 03:28:19PM +0100, Jaroslav Kysela wrote:
> Dne 26. 11. 19 v 17:29 Mark Brown napsal(a):

> > You've missed the merge window already - it was open before this patch
> > was sent.

> So, what now? Rebase on top of Pierre patches? You added another patches =
to
> your for-5.5 branch today.

Since Pierre seems happy with it even if he didn't ack it explicitly
I'll guess I'll apply it.  If git can figure out applying it after the
merge window and it doesn't get negative reviews there's no need to
resend.  If it can't and it doesn't turn up in a bigger series before
then I'll let you know. =20

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3gCxwACgkQJNaLcl1U
h9D3fQf+O20Yvyqc2hj6MkRyx8eqXOgRGQ12FwF8c9n2ftjwyyXjPDKqsQZWilRZ
JaluyE0mwACAVCJgUr3XrpJ2XnTyGTgtEV7qfQBUbOtByLhexzozV/IQd+3NxF1e
CB1kCmUWRPctLkA8x1pdKsHQ9z9fFWaZ5DHahhbZpxRJccE+MgQxCofF+JrWvTDz
i+utoPAAl9Mwe4fwbE28+QbcOzuZANeZ+SeJ3Y91LOm0S+S5gQbsC7uuxeS4nIjl
0EHQM3k0C0QxHiqf2BVch6dCSlXTLtlx/0i1AyMkOTPiwJFZ/t15QMkBQ4bXOrX7
7DE0YCE0+HRL0ThrLfDZy2oqTKO8oQ==
=Bcq8
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--

--===============5062518070866482296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5062518070866482296==--

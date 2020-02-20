Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D125A16675A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 20:42:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E2016BA;
	Thu, 20 Feb 2020 20:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E2016BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582227758;
	bh=ZF+yF3yQPqplRh3NGkt9AfosvVB37x7typbIEstBhrk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sf7anQt8Ji1HhZrDWN4Q9Kf/Qva4aAXBMbflgWjPbfPXdsAK/DcgavQSCVnBhfzlc
	 aPxv0cLA+TIbXFx+LJoW+ai4JLsxhRc0pPZf69Hj3l+mk1zbziOB38HsepWCjd4ng/
	 rfMbiaKH19ArHtq9gpJVleRldKpSNCh6YOHQma3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5A22F8014A;
	Thu, 20 Feb 2020 20:40:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15484F8014A; Thu, 20 Feb 2020 20:40:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 306E5F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 20:40:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 306E5F80101
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C38530E;
 Thu, 20 Feb 2020 11:40:50 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5DB73F6CF;
 Thu, 20 Feb 2020 11:40:49 -0800 (PST)
Date: Thu, 20 Feb 2020 19:40:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tas2562: Add support for digital volume control
Message-ID: <20200220194048.GI3926@sirena.org.uk>
References: <20200220172721.10547-1-dmurphy@ti.com>
 <20200220184507.GF3926@sirena.org.uk>
 <de0e8a5b-8c2a-ee04-856f-f0d678a3c66b@ti.com>
 <20200220191803.GH3926@sirena.org.uk>
 <6f3ff810-5e75-cb33-10d6-198a7c5cd202@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Op27XXJsWz80g3oF"
Content-Disposition: inline
In-Reply-To: <6f3ff810-5e75-cb33-10d6-198a7c5cd202@ti.com>
X-Cookie: You are number 6!  Who is number one?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--Op27XXJsWz80g3oF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 01:22:34PM -0600, Dan Murphy wrote:
> On 2/20/20 1:18 PM, Mark Brown wrote:

> > decisions causing changes in the driver.  The system may have an
> > external amplifier they prefer to use for hardware volume control, may
> > prefer to do entirely soft volume control in their sound server or
> > something like that.

> But this is an amplifier.=A0 Not sure why the system designer would design
> cascading amplifiers.

> And if that was the case wouldn't you want the output to be low so you do=
n't
> overdrive the ext amplifier front end?

The point is that we don't know what people are doing and should try to
keep the kernel out of policy decisions unless there's something that's
clearly just unconditionaly right for all systems.  It's a lot easier to
just have a clear rule that we defer to the wisdom of the silicon vendor
than try to get into defaults, and it's a lot easier to just do this as
consistently as we can rather than debating individual configuration
changes.

> I was considering safety in that the device is on at full blast (not sure
> why the HW is defaulted that way but it is).

I bet there's been issues with people turning things on and not
realising they need register writes to hear anything, and the volume
control here is a bit complex as well.

> But if volume is adjusted prior to playback then this is not an issue.=A0=
 But
> if volume is not adjusted then it plays full blast.

Wouldn't be the first time.  See all the dual purpose headphone/line
outputs that people build, sensible defaults for headphones and line
outputs are rather different.

--Op27XXJsWz80g3oF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5O4L8ACgkQJNaLcl1U
h9A7ywf/a70pEqcaoFyz44HUYWAA/C7/HptVOyj9BF7YOHzPCROQheZtAOnK/irB
NQ/wVoUly0UK4lakCGKSiAOvpqJIQ0XTEWP8KYt/SnA8jTsehWTlJaOlDuotsnOw
e3hQkhBz03kXfyuNO0VdGEbmIivWqb5rgzVykCYo0wS1qSYKFITdIKyK6uvLfDnX
g0l/AQmep2hERqDbM0g+zi8vOtgabdblq2/q93zTwEJidA2C7dpJBs/BpelKxzT1
I3sDvPo3XXCCKdLjiMi6Bp6e9tlZ4qcly412+bMUfCJjCKOYOgH3jsGdG4M87UR+
wvOv3ovPVjWTsSaVrlzJjFPabYYauQ==
=NqJ2
-----END PGP SIGNATURE-----

--Op27XXJsWz80g3oF--

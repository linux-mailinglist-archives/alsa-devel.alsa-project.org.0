Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B945611BA3D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:26:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CA9716AE;
	Wed, 11 Dec 2019 18:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CA9716AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576085170;
	bh=9fufB00D2BPyRDR3Lim1hUp8lfSu6hlLdrySr4BefOA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQTZ99OabHgUWCWbPs57chHU+6OxtsAdbQeREJY8Xy56W6ua/f77ByNu6J+eIXhoN
	 9vpgbCIs7PrNYQntdU1yVkEVEbo/yImFUXR9wLEemtjndMB6PD/FY5nt4FTiGx4SjF
	 qzPh10zRSPvwrOzTRUGbpPhhv2TgAoESKFxlMB00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87095F80258;
	Wed, 11 Dec 2019 17:57:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E72F8025A; Wed, 11 Dec 2019 17:57:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 48917F80256
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48917F80256
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5387F31B;
 Wed, 11 Dec 2019 08:57:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5F4C3F52E;
 Wed, 11 Dec 2019 08:57:39 -0800 (PST)
Date: Wed, 11 Dec 2019 16:57:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191211165738.GG3870@sirena.org.uk>
References: <20191210145406.21419-1-tiwai@suse.de>
 <20191210145406.21419-15-tiwai@suse.de>
 <20191211163418.GE3870@sirena.org.uk>
 <s5ha77yiz4i.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5ha77yiz4i.wl-tiwai@suse.de>
X-Cookie: NOBODY EXPECTS THE SPANISH INQUISITION!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH for-5.6 14/23] ASoC: sh: Drop superfluous
	ioctl PCM ops
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
Content-Type: multipart/mixed; boundary="===============2341895289813063892=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2341895289813063892==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KR/qxknboQ7+Tpez"
Content-Disposition: inline


--KR/qxknboQ7+Tpez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2019 at 05:51:57PM +0100, Takashi Iwai wrote:

> Sigh, I had to wait rc1 release so that everything can get synced for
> this kind of large API changes, and then one day after the window
> close, it's already too late... :-<

People send stuff through the merge window, and if everyone waits for
the end before submitting you end up with conflicts still.

> OK, will submit all patches again.  But at the next time I won't split
> to two series but in a single queue.  Be prepared.

I've applied most of it - there's only a couple that didn't end up
applying at all (IIRC these ones actually got fixed up).

--KR/qxknboQ7+Tpez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3xIAEACgkQJNaLcl1U
h9BF3Qf+OAqatZ3w1QC0hPhv/X/e3AsWPp0sgVJAba7684I9zWlO3rDxuy56Sh4m
azXTj4jx1c63PvZqkiu9tyG2hOa8kKT2az4lPxrXg512TL0iPDDTxmOdYz6T2N5T
IMahgQkAMBUfFUtMC4gKPd8EN6YQnajVQZVbDJJqgZOdVe7LUG37M3ShBK9HGOoN
u6mQbL4mtvUO5ySAf/61bfUIYjl0dTDk9T9UBEa+zOsdxFtWCa3S6Npvx78DCjsN
X22R0o0UhpahzODQ3XC3c+rWh9bnAyh/sfGWSbPrnARXuRmWQFw5hl0sDnfrZR9E
nD4tyFW72IBT7g4F18yHivF6Ht0scQ==
=BUa0
-----END PGP SIGNATURE-----

--KR/qxknboQ7+Tpez--

--===============2341895289813063892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2341895289813063892==--

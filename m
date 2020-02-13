Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC315BDCA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 12:38:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD8D1673;
	Thu, 13 Feb 2020 12:38:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD8D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581593932;
	bh=4/dLsar1ImurAnff+PephmmGnwBJZPCq68HBBdKUfQ4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s+jd0E1It3NiUO4dgvBbOR5GYctK6T+WO2L5nd0tWo48iatxIS9PbyyvF8oSzTm3w
	 p2zJwu3nBMb4yghwALhtY0NW5zJSUpMdQOxdNYcr7rAKDq/760Iehh6lwF7QkCMx6Q
	 dRy6ATu47cMSTuNKCpAkg7/xlh1mQX6Zp6sRbztg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77312F800F0;
	Thu, 13 Feb 2020 12:37:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B91F80145; Thu, 13 Feb 2020 12:37:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C66FBF80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 12:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C66FBF80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B9201FB;
 Thu, 13 Feb 2020 03:37:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4F8C3F6CF;
 Thu, 13 Feb 2020 03:37:02 -0800 (PST)
Date: Thu, 13 Feb 2020 11:37:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20200213113701.GA4333@sirena.org.uk>
References: <20200213061147.29386-1-samuel@sholland.org>
 <20200213061147.29386-2-samuel@sholland.org>
 <1jr1yyannl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jr1yyannl.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: codec2codec: avoid
 invalid/double-free of pcm runtime
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
Content-Type: multipart/mixed; boundary="===============2057564296364419008=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2057564296364419008==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 09:37:18AM +0100, Jerome Brunet wrote:

> This brings another question/problem:
> A link which has failed in PMU, could try in PMD to hw_free/shutdown a
> dai which has not gone through startup/hw_params, right ?

I think so, yes.

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5FNNoACgkQJNaLcl1U
h9Anuwf/SQT6ubriSIEq1TwGCzPNYCbx2WjOhRIjTbtNwtmezyCgzCOThrEEuRZh
VjvYkn7VqZBgoHsh43+vqiwtI3eLXwrX02o4izW1srdqfh2ZDAMmHH37qf8zfYmv
S7bC9gDSY8sFOjSevEKgk6MC/3h60PKK0Q7FWc/A1B8Fqo5ZaoeuYrMqw0x2yQVI
1DRTlhVoOKIQ+tjKIPmRwTt1KyJi9FlhN5oW2hEpIpMOK34jnVyKBMHESopGF6tT
fFPPHWKfZlxP8SkwtcYsH1xxrZC5LwlPA8haNBQAtniDaVG+PlndvoN69UfBudPw
s7tJfn+2MEXC0NEJzXukYpwwHkuu1A==
=r51Q
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--

--===============2057564296364419008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2057564296364419008==--

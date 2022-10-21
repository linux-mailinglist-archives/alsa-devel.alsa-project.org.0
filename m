Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27924607626
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 13:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1DD69CEF;
	Fri, 21 Oct 2022 13:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1DD69CEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666351785;
	bh=6Y2xIVxhrKas92gcF9byjX/E2GMQjZnVvLcdlRdIOiE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUHmh91kjcZbIJugMMayKX1bN7sxn9jIIvPxsGjU53XZAFs40sAMhrS8CqiiB+gm4
	 xi+k7ny/152yctKUs4yo53kQDPIQbEzX7DrcbfQoYOIavSf8HlucAy1Ium+2stWTil
	 xEViIzSDcCYrmUXv53myvm2+hEcR4EelRb7yuzyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A798F800B5;
	Fri, 21 Oct 2022 13:28:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC65AF800B5; Fri, 21 Oct 2022 13:28:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A462CF800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 13:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A462CF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HlJ38uHP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F0E3B8111A;
 Fri, 21 Oct 2022 11:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4256C433D6;
 Fri, 21 Oct 2022 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666351724;
 bh=6Y2xIVxhrKas92gcF9byjX/E2GMQjZnVvLcdlRdIOiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HlJ38uHPlpsN3hAA2erfVGbQWGQfRgSZwInwYJyZHwHTyEsTn/y0BRhQ40poeoI2y
 +sOE9hOosLx3Eq/3IYGzOtQYaGy/rKwDMEr2EwWpiYLLSnEON936FPlRWcDiseLLsR
 hUjmlsyXnRMPOuTi1CEeHJNSBWF4jszFPPfyIphu65FCkG7CF+Efmwww3u/MxxCz5A
 bTZXSp0GhZzmhNxsBtM21s5vOJt+iaUNZT5LyF3WFGaAlOQ+zghFKW01qMn8Z4VXk4
 +f81xjPD05qbSbVkaBeZAmctDUiK7g26c6dzC0vZzn3QjaExaTokZrb53GOUIPEaBB
 lmTVB7jhLM+Kw==
Date: Fri, 21 Oct 2022 12:28:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/10] ALSA/ASoC: hda: cleanup sound/hda/ext code
Message-ID: <Y1KCaIgZkg6H/hK0@sirena.org.uk>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
 <87tu3y8vj3.wl-tiwai@suse.de>
 <1ed3a5e2-0c09-82b1-9704-3f999794227f@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4Kl9aoDia7i9D7ad"
Content-Disposition: inline
In-Reply-To: <1ed3a5e2-0c09-82b1-9704-3f999794227f@intel.com>
X-Cookie: On the eighth day, God created FORTRAN.
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--4Kl9aoDia7i9D7ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 20, 2022 at 04:05:32PM +0200, Cezary Rojewski wrote:

> I'd very much appreciate if you merged this series into your tree, Mark. As
> Pierre mentioned, recent PCM suspend/resume() series for the avs-driver
> needs to be rebased onto this one to eliminate any conflicts.

Pulled now.

--4Kl9aoDia7i9D7ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNSgmcACgkQJNaLcl1U
h9CQDwf+IJtTXq5WPbhFlLpge1wcMV30uaPOIqwZ2bD5K1GyZ0zhANsQFYYk5NDP
NHtykPl8ruGFOsn50wLFOdSQ07w/8Itqd/vHRHNizM+Wmxr5+45hDHnjrekw8n5z
LGcLjZE5zKJLShVc7sq6dBvePlyoUttQuLomARDinee/SZCcscqUxKAsvZ0xyeHH
G9yjYmY+H318z6EO+uJzkgcVdacp3eJH7OuLZuRLPQ/xYiEFtCZfS9cBY3+aslej
tLPgxjTwmQ5Mry7mzymQo/cQKaWCTLoyoXV6oXE3KfL7NEImDQFO7593twhVnp67
BtOlrEfFEwAA0mZkKCVJRsUTKqhbwQ==
=S2Ct
-----END PGP SIGNATURE-----

--4Kl9aoDia7i9D7ad--

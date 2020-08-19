Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE65249B88
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 13:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4436E17EF;
	Wed, 19 Aug 2020 13:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4436E17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597835909;
	bh=7W9fpcvvq7j01lnjxB+ot2Sjfmr0kSAadp/9/zh9zI8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2UHPvGfhDxrswm5/+3ZSz9ClD46IMY6WpQkGoiA8zDyUKKjIkRILf4Gq3DIWZ3MV
	 rtC5I9D2FTXPycGV5lTdi7FSp39peB6Ty6SaFOcxGcdrqTJhLiRBFz+WY2oxKemOow
	 Sb4ZwimJVjcqa9MajoBI+FvAi8H5WBk8lsf0LNsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63C9EF80255;
	Wed, 19 Aug 2020 13:16:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FE5AF80218; Wed, 19 Aug 2020 13:16:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68D71F80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 13:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D71F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KYFycYPr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5684C206DA;
 Wed, 19 Aug 2020 11:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597835796;
 bh=7W9fpcvvq7j01lnjxB+ot2Sjfmr0kSAadp/9/zh9zI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KYFycYPrBmWJam7NZKlptYCrkATXPMfUZP8OeD/6IsUDDnwM3EZ+M8LtZo3dxa5MM
 o/70hVNLqh/t6/PFzXCYwmcyA3H0CDzXRx746GYHbFq1+Abwss1s56TFmWKJCwjlzU
 AkugyyZ82ocFQMeBShPmU03BW3dtBoaed886yk5U=
Date: Wed, 19 Aug 2020 12:16:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Allen <allen.lkml@gmail.com>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
Message-ID: <20200819111605.GC5441@sirena.org.uk>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hsgckl084.wl-tiwai@suse.de>
 <20200818104432.GB5337@sirena.org.uk>
 <CAOMdWSK79WWsmsxJH9zUMZMfkBNRWXbmEHg-haxNZopHjC1cGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline
In-Reply-To: <CAOMdWSK79WWsmsxJH9zUMZMfkBNRWXbmEHg-haxNZopHjC1cGw@mail.gmail.com>
X-Cookie: I wish you were a Scotch on the rocks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 timur@kernel.org, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, clemens@ladisch.de, tiwai@suse.com,
 nicoleotsuka@gmail.com, Allen Pais <allen.cryptic@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
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


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2020 at 04:21:58PM +0530, Allen wrote:

> > These patches which I wasn't CCed on and which need their subject lines
> > fixing :( .  With the subject lines fixed I guess so so

> Extremely sorry. I thought I had it covered. How would you like it
> worded?

ASoC:

In general you should try to follow the style for the code you're
modifying, this applies to things like commit logs as well as the code
itself.

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl89CfQACgkQJNaLcl1U
h9Cifwf+ImKkN4bcgAsq1FQIuFfGzOK1C2rJvwO1FF9QMBqoSLWbU+XXMm8B+dmp
BUuRn3yv2s26q5SMpU1EvotzyTnEdeAhS8rvA+hpUMw7E+lz9v2qz/2m553Hap6U
R1REKNzVtqstijAyYycjHID0ZsOPK+T5wBISb2fY38cJlgGRMQXh0ZgvHq54sfVK
aLts4u4J72HMFLuxPbgTfiO8CX46MjLoH0eoRzPu7R44dvzqUfzdu5B/7Fp5amcC
Sd6731MDQYarYhge1gBJ84arpbSB6Qsr1LQNh8hh2q0cXEpwNcXjnDMsYKjcoxPl
D2VS/Gxp0eqmBwQXcSE5+AGsdYKdOQ==
=XARi
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--

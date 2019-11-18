Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7372F1008D7
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 17:03:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF8D166C;
	Mon, 18 Nov 2019 17:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF8D166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574092983;
	bh=Z9zx3WEcxF+BR4ch0HGSC/z3Xx/QYxwxNpKKRdgIZ+g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AWA9jO9u1+RCTmHl9oWbxfD9Fc+0J3Y97JEQ50VODkDIoq/ETHqgih/sOtYWjVWYv
	 nUwbktjfRjrf/cIntB0HImLY1V43T4hUH1GuPUhB3KVFGwY1Omrvzr6IdyxRnKhSHz
	 4Ii6+cWCtUO2c7UkNBWG2rbO6gdJxFIiWwfQmnmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A7DF8013B;
	Mon, 18 Nov 2019 17:01:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3B6FF8013B; Mon, 18 Nov 2019 17:01:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 90CB8F800F6
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 17:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90CB8F800F6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14A32DA7;
 Mon, 18 Nov 2019 08:01:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7802F3F703;
 Mon, 18 Nov 2019 08:01:13 -0800 (PST)
Date: Mon, 18 Nov 2019 16:01:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20191118160111.GH9761@sirena.org.uk>
References: <20191113124734.27984-1-peter.ujfalusi@ti.com>
 <20191113124734.27984-2-peter.ujfalusi@ti.com>
 <20191118130855.GE9761@sirena.org.uk>
 <5f824119-9b5b-5ad2-6915-d174f9cca8af@ti.com>
MIME-Version: 1.0
In-Reply-To: <5f824119-9b5b-5ad2-6915-d174f9cca8af@ti.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] bindings: sound: pcm3168a: Document
	optional RST gpio
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
Content-Type: multipart/mixed; boundary="===============7553115247181580796=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7553115247181580796==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Content-Disposition: inline


--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 04:46:26PM +0200, Peter Ujfalusi wrote:
> On 18/11/2019 15.08, Mark Brown wrote:

> > Please submit patches using subject lines reflecting the style for the
> > subsystem, this makes it easier for people to identify relevant patches.
> > Look at what existing commits in the area you're changing are doing and
> > make sure your subject lines visually resemble what they're doing.
> > There's no need to resubmit to fix this alone.

> What would be the appropriate subject line for
> Documentation/devicetree/bindings/sound

> Oops, I have missed the dt- prefix for the bindings for sure.

I prefer ASoC: but yeah, you missed dt-.

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3SwEYACgkQJNaLcl1U
h9CqAQf/TzsDc61IPhX0l9gJTpyxpHP8aQwigm4y1DNpSWUcdHEoR0vSssiPAnLw
Pt2g9bSvrdUGiSEn9IkUGt4yWiCT0RyGUWSTsQ7/k78PCzGyGLrThmRRWnNu7s2b
qE7hGNfTMk6oThsMz03ytkIaZl40PJSopNCJHs5h73hkYkBWTZfSDW0XORUPrgYt
g5hx0bZJtYgwziZi05dFEW3KCpdaVSbyTZgULXAlVSpOhUbfcJpBl2K1rNcp1Opk
2KeKaWTJ59RxiEf9s32kFVxsKv9jXky55sMk6DrW8+Uwu98sZG/78xNrqXPu0T0d
pN4DN87GEqlrihD347osS1BBopRKNQ==
=fktM
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--

--===============7553115247181580796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7553115247181580796==--

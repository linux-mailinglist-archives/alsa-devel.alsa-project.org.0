Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C5C463BF7
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:38:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2240A234A;
	Tue, 30 Nov 2021 17:38:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2240A234A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638290338;
	bh=XZVRKFmSETjefhPpu5bQxSVyU35juJLlT5lRP+0/n+8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPJ03kOs5gF+67T5SEwB5xqq5AiHEyEUnYxolo/xarBj1TN8wtxzykrCB4c155uq4
	 vnPY9M2bYQeGqhYONwXZVNHgWIuV4XnCfrv38LWj9Cz2b3IsZ00ilckoDh37bVTVmO
	 r6/+MnhP0ldVSea+9xWBc4qCTT7VsCk04cQYMPyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AED2F8020D;
	Tue, 30 Nov 2021 17:37:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96779F80290; Tue, 30 Nov 2021 17:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 455D0F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 455D0F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZyNng5jA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B93DB81A1C;
 Tue, 30 Nov 2021 16:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0C2C53FC1;
 Tue, 30 Nov 2021 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638290246;
 bh=XZVRKFmSETjefhPpu5bQxSVyU35juJLlT5lRP+0/n+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZyNng5jAAcHVLsHMvRUbt97yJmdcTtGzDSZ6OXSobePScLVtfysWzDEU/rLBHI51m
 zFf2PoG35hcx5LhGGH3A1XrvdHWrbohq8bsZox//Zk4O8cl9A0W27NTPXemgEHuJ8J
 HFHh7/bms6H9DNyhYs5BG1bNen2QDmACf+rEVmgkB6eHm6WgeEMLJiH5qAYmGxPEyc
 rxzzrq/0s9mukSQGvqXQ5WI2JoUDmzRc8nysmki/FMegVuAfu5m9Wh+IP2H8Qx5Ei0
 FTmKr77lUaKwvIYNIewRHKLqnsePSQPNoBk9Le8P16lsuYtfbSuoPEIqOVNWy6zCLz
 06P9YFx+g2fnw==
Date: Tue, 30 Nov 2021 16:37:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: remove redundant ret variable
Message-ID: <YaZTQVP6YMFZcSVI@sirena.org.uk>
References: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
 <20211130160507.22180-3-srinivas.kandagatla@linaro.org>
 <YaZR56MLanjnQH1p@sirena.org.uk>
 <8279f250-59cc-368d-13aa-b46cc3cb108e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="03VrqDkxPp6THSgC"
Content-Disposition: inline
In-Reply-To: <8279f250-59cc-368d-13aa-b46cc3cb108e@linaro.org>
X-Cookie: Check your local listings.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--03VrqDkxPp6THSgC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 04:33:38PM +0000, Srinivas Kandagatla wrote:
>=20
>=20
> On 30/11/2021 16:31, Mark Brown wrote:
> > On Tue, Nov 30, 2021 at 04:05:05PM +0000, Srinivas Kandagatla wrote:
> > > return value form snd_soc_dapm_put_enum_double() directly instead
> > > of taking this in another redundant variable.

> > Cleanups like this should come after any fixes in a series.

> Noted, do you want me to resend a v2 fixing the order?

It should be fine, I'll let you know if it's needed.

--03VrqDkxPp6THSgC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGmU0AACgkQJNaLcl1U
h9DoyQf9HI5h5I7DW0vLk/TIjjAbCkQDq7F2wZ0ti34lgQtG4+VA6tT1y6ikFvhK
hH59Q6bLC4WNm6KnJURgtbsH+lcsZghttcMVnyUXuBEFpxt9IwqC0XY1jJbQPfVT
p+cP6wIaEQZvEpEm6vN6D4Lk7mFXvi87HVRV9e1FXqWqfcWYNBeF5ydHkIf5s4NC
CRfrYIiLjSWVIOkel3Zkl4H13RpCdx7hJkKjx1JcGdT25CR9q66e3AVkaHWzB3En
9FG/db6hmROhB92dgubXMHk/Oq/X9CT9asmBUGhvnDW2njcq3l+R/mcZKyixH3J8
Zrm6aE3K03y/ZcNwDzMNRBNWVzSnOA==
=4l9I
-----END PGP SIGNATURE-----

--03VrqDkxPp6THSgC--

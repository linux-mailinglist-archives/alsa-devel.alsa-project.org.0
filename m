Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D13498550
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 17:54:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9427528B6;
	Mon, 24 Jan 2022 17:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9427528B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643043245;
	bh=h+LhwKgdLPhp47PqXZJ7Yd5NV1rjTuUf9MiaXfcxWA0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Keb0tyeHjLLN5EninV1+L2BuPQjqps+/aL7Cux2dn2OfL1hmYoGJ36ly3fYm3tmUN
	 KYcP1Au8drGG872k01l7dOZUF7pBU3CxLr9nyRwP/D21tZtH6nDIeHXT1HJXMnEFLg
	 81N/gdrsLtm8VNU7Df86NeV4A3nK1vKM/mddGfx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 007CDF802BE;
	Mon, 24 Jan 2022 17:52:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68045F8027C; Mon, 24 Jan 2022 17:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F08C4F80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F08C4F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iFnItcUz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D0C160FF9;
 Mon, 24 Jan 2022 16:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C3DC340E5;
 Mon, 24 Jan 2022 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643043170;
 bh=h+LhwKgdLPhp47PqXZJ7Yd5NV1rjTuUf9MiaXfcxWA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iFnItcUzt2NS7xoBpcdcRuZmQ1QQ1UZadfArx1JEoC88d9XZSwi7b7dIR6utYBOgy
 PX3qLHBmzz6UjvyGQu7BKbiF21USNPhpv9VOtwGiJHl/nqLgovdbSKrDWnm0ks7156
 N83p4D4NkLQpFB9aCeKpyPJPQjjjvNHsdko+aFMPcHzdyYZv0SDISdi+BLHAee+sbR
 sdEFBws/L90TD9tM2rBePHFYIzG3b7yN9Cj7xS3oH+jCg1dMlD+EQAOw+lMoXVAuKp
 Nx3xy0TdCHbK1t4ljwMrI82crPrgeQgMACrYQNHaxSC/FbQSBQczYOtsq5h0nSj/BB
 1IObDqgkOVRGA==
Date: Mon, 24 Jan 2022 16:52:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v1 0/3] ASoC: Add bounds checking for written values
Message-ID: <Ye7ZXvIK3sVkvzQJ@sirena.org.uk>
References: <20220124153253.3548853-1-broonie@kernel.org>
 <9eecf478-b705-7273-7553-24bafaec5404@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j/TeDbR6KU9Gu0yJ"
Content-Disposition: inline
In-Reply-To: <9eecf478-b705-7273-7553-24bafaec5404@perex.cz>
X-Cookie: The second best policy is dishonesty.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--j/TeDbR6KU9Gu0yJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24, 2022 at 05:29:50PM +0100, Jaroslav Kysela wrote:
> On 24. 01. 22 16:32, Mark Brown wrote:

> > This series adds verification that values written to registers are in
> > bounds for controls since the core doesn't validate for us.

> As discussed, those conditions should be optional to eventually catch the
> wrong applications. I don't see any benefit to report the range error back
> when there is value masking code already. The users will note when the
> unwanted values are written to the hardware, or not?

In general I'd say that silent failures are harder to work with than
returning an error at the point where we notice that there's a problem,
assuming userspace is paying any attention to the error return at all of
course.  We certainly have quite a lot of existing put() methods that do
return errors and it's not like the application isn't invoking undefined
behaviour so I don't see a problem here.

--j/TeDbR6KU9Gu0yJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHu2V0ACgkQJNaLcl1U
h9Cg4Qf+IO3rT8wZ0sleE5pacJ28IPpanHn8AsLoNDuERm5xZoT+2SZGpRWbcWV9
/ZWGaZr8RAYh0dybeNNYWwPAgX+xBiWtBMpwBbg78+YlvNmf5HeGj9MZifSRv6h3
b8a8YyW4Ue/6/5jscf7K82N+szDiDjNPIg+UdWDstpJEN3rTePqAPfcNwNtOBpoe
Fsl8MeUJcg4oh3vv4qQxN5pm4QryTScsRnhCEhEL8xpE99bqNivFrdRNeQGFlri0
/mn/uwPZGM+y9W+EmK+Slqj2M3FcnUGxOdnZ1r0BxjQdUuzxHwVEQo4ghb6dWkOr
TplnaoprlWANUq5pgcyyC01fBSWPsw==
=zqiR
-----END PGP SIGNATURE-----

--j/TeDbR6KU9Gu0yJ--

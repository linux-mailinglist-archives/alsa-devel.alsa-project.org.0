Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D67207933
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 18:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5538A186F;
	Wed, 24 Jun 2020 18:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5538A186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593016274;
	bh=TfdmMZFoMamba9hAZ73wEPB7qlys4If0NBVI+1NG/UU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2x6JFp6azw4seLrLEVVUfFCTEpAWaYdIaBB4FYw5jUDEzgRWk6CEvut5TjhfWQF4
	 X9RMgBCxqrTLq7+Gn1uCmSpkpzVi6f1S779VIPc3/9RnUXulme/XcCtytjnZQ3IGzC
	 ooxOY8pNbn4MjbradyI4neWNjOBsKi/RCyKMyCGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BEFDF80162;
	Wed, 24 Jun 2020 18:29:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75D16F8015B; Wed, 24 Jun 2020 18:29:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7ABFF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 18:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7ABFF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VpzJJgus"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71AEF20836;
 Wed, 24 Jun 2020 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593016160;
 bh=TfdmMZFoMamba9hAZ73wEPB7qlys4If0NBVI+1NG/UU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VpzJJgus9+zyY0l2n1ruLm646dBuDmHvNsXlWYco19nCDNYZBoo/Y2FIsJ8yxZ0yw
 e/kpOYqkVyEmfUOIJ1FREsJxtHZtkYjlj24ce5uRir7ho2s0bU2nB2GHb4jqgFyk0z
 zZ04nY8eZz1feeBtXSteZCyt2CnBll2ZaTigowIs=
Date: Wed, 24 Jun 2020 17:29:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v5 3/7] ASoC: tas2562: Fix format issue for extra space
 before a comma
Message-ID: <20200624162917.GK5472@sirena.org.uk>
References: <20200624161459.19248-1-dmurphy@ti.com>
 <20200624161459.19248-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tKtFalx5NIx0HZ72"
Content-Disposition: inline
In-Reply-To: <20200624161459.19248-4-dmurphy@ti.com>
X-Cookie: So this is it.  We're going to die.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, devicetree@vger.kernel.org
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


--tKtFalx5NIx0HZ72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 11:14:55AM -0500, Dan Murphy wrote:
> Fix the issue found that there is an extra space before a comma in the
> volume control.
>=20
> Fixes: bf726b1c86f2c ("ASoC: tas2562: Add support for digital volume cont=
rol")
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  arch/arm/boot/compressed/fdt.h             |   66 +
>  arch/arm/boot/compressed/libfdt.h          | 2072 ++++++++++++++++++++
>  arch/arm/boot/compressed/libfdt_internal.h |  173 ++
>  sound/soc/codecs/tas2562.c                 |    2 +-

I'm guessing those libfdt changes weren't supposed to be here?

--tKtFalx5NIx0HZ72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zf10ACgkQJNaLcl1U
h9An2Qf6AzD1t9C2zhCAOdLfYVN/RaS8w3Mi6hZd+l5rIvL+gYEHsaqTQDYsy8mv
aeAZNN3FPKsxBnXLssuA63iBaQIhE3M8SI1V3OFPBK1MZEGAQVAe4KYMseQVLEdk
6hj4jLd4u7hGvRfx4boqmYZmVKoCOGUlawS7CcdyS1tFq9LEi3yLSEqdH76eNVcm
mMd4zhO731rZl5kIWeOVGEDxfsVKDfn3BLFQUcTa6BwvW6xd9LKQi9xgjDPql3Qp
GomCINoovcB4wglAXd7EoiNTErfgcW1m5gUCKPF4oxeWURzEKozYFON6csZcWh9+
lsKqk6ykjHMXZfC2OngiLTPe4zE3Rg==
=jWX5
-----END PGP SIGNATURE-----

--tKtFalx5NIx0HZ72--

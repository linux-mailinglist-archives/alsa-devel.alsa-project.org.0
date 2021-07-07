Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E10B3BEC4C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 981D7843;
	Wed,  7 Jul 2021 18:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 981D7843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625675544;
	bh=6q+hWWacieAshKe+FazOGS4+liEhM0sS2Dz2WwbaioM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kklOm+GIYetbSnbc+/4vHMb8xTKoceEtGLhyteAHesyVZbmISABiUwpXBCoMEGSHG
	 nIM8+5ZfayDC5GpaK4F5H26vpC90Y4WmovpbUOD8nQlQG2gHS79Y8kiDMqO7boB5BX
	 ZF4kI0gMWOjd4/vZ9ep5Oq/WWVubugSZBE2PeKz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0132DF8012A;
	Wed,  7 Jul 2021 18:30:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0146EF80224; Wed,  7 Jul 2021 18:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7998AF8012A
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7998AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l6XE8rJ8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 212E761CC5;
 Wed,  7 Jul 2021 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625675450;
 bh=6q+hWWacieAshKe+FazOGS4+liEhM0sS2Dz2WwbaioM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l6XE8rJ8eCIjEuW/OTCcINKwbPPXVtpu1wnpjWfrXvuqb0kQuKtiQNyTRuRVFW2X/
 uLnAP3RX5HV0Wia26RBwkuHUZ3QQ6KfsxbYp61H/6MRs+R4VBUPzhgdWPQwWKcKGmc
 /twuV2LZBQJOnNy0Cd3DjWIa3X8yN9h86d4hcbZoisFFLMqMJ09K2IhG3DMrX/Ox2G
 V6hUjpJPbqVvo91IoYq6Ym8XjI3f9hkxViihmEmg2O/+Gciek/fWIhwpRKkn/8LPZa
 EriIi+C4sXCftiOqtC8gP9HSlEhTAzgNOTaW4O6h5ChjwNkgiMkzoW4LJctP0RGV5R
 a+rP5Xlfv7PdQ==
Date: Wed, 7 Jul 2021 17:30:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>
Subject: Re: [PATCH 07/12] ASoC: amd: add ACP5x pcm dma driver ops
Message-ID: <20210707163018.GH4394@sirena.org.uk>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-8-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dCSxeJc5W8HZXZrD"
Content-Disposition: inline
In-Reply-To: <20210707055623.27371-8-vijendar.mukunda@amd.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com
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


--dCSxeJc5W8HZXZrD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 11:26:18AM +0530, Vijendar Mukunda wrote:

> +	/* Group Enable */
> +	acp_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp5x_base +
> +		   ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
> +	acp_writel(PAGE_SIZE_4K_ENABLE, rtd->acp5x_base +
> +		   ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);

This isn't connected to the kernel page size is it?  If so we might've
configured to 16K or 64K, or possibly even some other options - I know
those two are out there in the wild.

--dCSxeJc5W8HZXZrD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDl1poACgkQJNaLcl1U
h9BiQAf6AtJK2Ffb4vUcYoiF04zy8sKGtW2lCQKie6xHafUl64QvbDcxF977k09V
Bpu700qytonU3CYdFtqWcgiHpOT8XkSubup2Dswx+XkSp4oygFj+tG08oEUyw78I
tNBSG8PYuLBjAQukjrvs59MUieYz2QkGhQLWnJhImCtM8rM0JVWP+Qb1Vd9U3pYH
CDxQz8fKZKJGo88Ng9xJhxzfW+nTyxuxIfJVDgDyAj+8a9vlWz1uV/Q6VS9FdGXj
W+4uFwf96SUfICTOmQxgE5Tcm9cfLZ1ITHSdC4vzFq+6dalxF91u/Rekfh4+xb2v
NGJDu6PyrHM9EzxLM73YYa1f0VSa2w==
=iaY1
-----END PGP SIGNATURE-----

--dCSxeJc5W8HZXZrD--

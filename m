Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8518225EA4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 14:36:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0C01614;
	Mon, 20 Jul 2020 14:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0C01614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595248581;
	bh=hzeVc/gxIpFnmrFKoc8d5uPMWXQwJhcaHk2T74oAuKw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c+NQx8QlhS6iFR2k7brk1SGqe4XbqWtPUXILIf+JH3x+Ml/jRryVpUYyVyCPljrV8
	 Kin8mveBQRy5I7nI/S2Z+vaGyWzsl6OBpYRMvpDni8hQT27lCAfxqO6qzwl1osyn+J
	 iHm47of3V/g12ReQn+X540pf1LbEb9oDP3PE5vEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89260F800BF;
	Mon, 20 Jul 2020 14:34:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9317AF800F5; Mon, 20 Jul 2020 14:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38850F800C1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 14:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38850F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SNIQRNLU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EDEB20729;
 Mon, 20 Jul 2020 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595248465;
 bh=hzeVc/gxIpFnmrFKoc8d5uPMWXQwJhcaHk2T74oAuKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SNIQRNLUeaOm242lCQ//ekAiVmUhx4VAmkq9bfkDhwmtF0S5WvuZ7aj/k/7l0pIYm
 Kl3c32NGAgK1v7AzJwyojQKwjnmuiMusPRlZ6xsKLLu9Z/6QRuS+AgmtiYfue2k4GK
 Uy/0r56WaWZ3EszQWp+HLQodDw9hsf97KxBsOaG0=
Date: Mon, 20 Jul 2020 13:34:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: tegra: Add DT bindings for
 Tegra210
Message-ID: <20200720123412.GD4601@sirena.org.uk>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
 <1595134890-16470-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline
In-Reply-To: <1595134890-16470-2-git-send-email-spujar@nvidia.com>
X-Cookie: Be different: conform.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, nwartikar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 19, 2020 at 10:31:20AM +0530, Sameer Pujar wrote:

>  * DSPK
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
> 	t=1595134894; bh=DX96zRQRNplPikN828HbAfbjGumAn9IgtktrsenKjgk=;
> 	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
> 	 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
> 	 Content-Type;
> 	b=IhfGFjMxsnRHso1Ku2GEGC+mtLCy3AbRKPfgTS56XGqEWquUr/1s8n9tFpriqF7a+
> 	 tJGrTN9mKhRQGrwdey/AHsMY4Tbm4fKEWxIASgAV/lFPCfgP3BnVjEdHclc7FdBaB0
> 	 Qvd3zs8HFsgoIzksLrtHNMrUepkeZajn0/XnC7nghGDRim4+6Hauupr5kj/KVlihsS
> 	 KS1YQ2Zz9TZzLaC5QXALiHj3ATLvBFrmIf6Vj19q7hePt0menTZVzQNy+y3h4xZfLH
> 	 +OvBCsLgHGGhq+iM9rm64D+S5Op2vCslwq3Q/42TnYZ0vDbD7aA9nTAQzfYeI6HK6b
> 	 vi7eYbryzCTSg==

You appear to have a bit of mail header in here.

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8Vj0QACgkQJNaLcl1U
h9Cb+Af+OINXrdCpdw+ER9s3wYRO8uormKGyLZ3qGxOVdkNfbg3pIVwmGiNxWjbo
vjrchHQ4sQKrmvZOHal6nz2Wy3rqifGaSiahI+K4RzmwFWphmnn44nDRVEr2DUfh
fuZkL5bBbAOkg28gsOsxgkQ5PIXvuegd+KCCgf7HyU1G6qLABL0N4fCIf1ozPQuZ
XgLXm9YwnEtl/mi7wTjywScrnkiq60Q9aij06zBPfhzKKnmNmxZPpPwi/ENZEmoZ
rkplukCeIK4k+uXl4mttEzUjt9YcWKRa5t1fS/8SYkG8Z2Fu8ixFTQhC36V9JLQG
VcFXVBJqQJ7bisywwAvne+poBEpP2g==
=2HYu
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--

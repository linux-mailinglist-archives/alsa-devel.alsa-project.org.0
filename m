Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869233ED15B
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 11:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7E60168D;
	Mon, 16 Aug 2021 11:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7E60168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629107791;
	bh=mgidz92eiQNQwUXiKZR8c3wmkt/K1kZHEuU9TtbiZE8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TrvH59RGrtr2sqvyro3NTZP6vHpc4EPkwjOZMuwQLmt/oHtdV2fAGIuBiiCseaaLL
	 /YNkALEAyWmrS0/g/YH/GI/WX91shqfoIPE7EUPyOppd5x8eE3vuVteX8+ybVTJ/XA
	 Dui9j48ofl0fvOrlqV5a7atXAL45MZp+iKrzLxug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 479F9F80154;
	Mon, 16 Aug 2021 11:55:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DBCCF80249; Mon, 16 Aug 2021 11:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B357F800AF
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 11:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B357F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ER9UOjvp"
Received: by mail-wr1-x434.google.com with SMTP id f5so22639318wrm.13
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OVIiXaXt+PNMazqOI2FVcSRJWLlNFOCX48IyWhzo2SE=;
 b=ER9UOjvpcCe8cps+ZwqPAd/L13LCHSWr7ePe+PGIkWBIviTRId6qN5fHuS/1n4X8uY
 s1AR6XqZf/OscRAZ6ZLsuv9MIuhK4qhnu1nXnADnc5UJouIVWNw5urML1iDjWxNaXZoZ
 ksOaN8/cryni9cg0jQDC+qvCJ8YhHhiBO7L9jxJaq1+aJoE2IqxK8PfZUqzcuOR8qrCa
 1+FyUH61P6/BjU/iQrLPki+I5PJ0KjPVrszUgStU3E3B1J2kbG8Yvk/EWgODW2l13pwY
 UiVE5Xc5izntFytlVCDjHTsO/21ohg/akLc6YWWM6OihzctxVYrTezb5iVSDBaoc1h1b
 WnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OVIiXaXt+PNMazqOI2FVcSRJWLlNFOCX48IyWhzo2SE=;
 b=df1BlvmidRjtRAUGnjmQs8kh9jnYR+e5yBhTM0N6owouFzZkl6tVIDt9cbaCO1zl7f
 02xHXDD7oxgCqzAyzGYtNeKXcqxPjKvI4ylWjV4yBi6kF19NLGqwMnhuEaqjzY1lV08o
 D646sMzLqXNXDGmEk6PqnIMVACQIGcwT1tZsOYtRfuQUL+b+kWOXe1rrgAD3+a9vyem2
 mfqLSIHlh8Tl2RHomBKX+E2eMN3Mf3lYUnXt3jR8qmRBvkhwgdJdX0rnjAbkXgwTRl75
 90L1KQTYrEDcBzCV0AF3Uq/5wdySFGnAIrrsdqsT4ptGm8kPPMReZfa1KUELeHtuE7Ot
 r4zQ==
X-Gm-Message-State: AOAM530Bd8K1QSZP+TSZ0Bg6BQDX4d0BN138nAA95cUG1KNZhImce94I
 NfyuDZ0fllmXkkZWm7f/++4=
X-Google-Smtp-Source: ABdhPJyHV1ltLaoofusnP7m6+Sw8yxHlFYo06zYWZCtvRdcTYPXFyoXEh9LCvs0EL6Gnw3bcnXijzg==
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr15957821wrs.216.1629107683797; 
 Mon, 16 Aug 2021 02:54:43 -0700 (PDT)
Received: from localhost (pd9e51807.dip0.t-ipconnect.de. [217.229.24.7])
 by smtp.gmail.com with ESMTPSA id l21sm9692957wmh.31.2021.08.16.02.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 02:54:42 -0700 (PDT)
Date: Mon, 16 Aug 2021 11:54:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <YRo14o5XJpMVUDbH@orome.fritz.box>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/uNhmtWkYfSYaFoo"
Content-Disposition: inline
In-Reply-To: <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--/uNhmtWkYfSYaFoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:
> Prefer `of_device_get_match_data` over `of_match_device`
>=20
> Retrieve OF match data using `of_device_get_match_data`, this is cleaner
> and better expresses intent.
>=20
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--/uNhmtWkYfSYaFoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEaNeEACgkQ3SOs138+
s6FCpw/7BlHGOK9ti9B6aeIIOMkVFHwa6ssji99uO3n8SCquZ3gTqWd4VE4Bnlsz
fI4wit4W8R0dRI896hlaBw6U6b/XkKzajDmA02mo38V27POnqWyTKr3nvUibR7Jo
ILI8fDHs8G9yenX7BoAraShENnlDkJYtslxInAWoxHrcxOAVuj3CS6PsbbP0Tekg
1aeOxRidBOVHihOHOixf87HOMlz4hONSYC/791lO/r9B59PwOJV67qdQncLEPBFm
u6I2thVc1ZIalGW/EUcFGouoEN4IBXXTiLKrp50/5y9+MLnwkBfqYr8PLEZ31CV0
6rmjeAAkVuao1GuA2I/VRuN8j3gz3ra+rbh0qp1wUCUKf6E9k1SW0Lnu9a3O9ctY
5NkfgAF9UQ6p9Bn72yOP4UbPIyJIfPoQ7LBZvSbmMtQ88PRNZscfgMvnj3ku3qg0
2fEY21akncJUbahcEZHwRZamunyQ/UaJIl3nUSXAfjGFccMe3vPGAn8h4BAIlaOV
9hdmVaCxEuAyL9cO21KVfzvJelfeKGLYXsL2YLf1t9KpElFWDK9SpkcrW8hKnYlk
a5vz1WHFryX5JqS7g9C+FLKefkVv1RC8mH6BPmObJIQJQ0XU+KbnTtTmxFZMr8TR
Entg6D805mQuzDE0KdepXexhMklsGGo4HamscCn0mG5SvXVfdzg=
=jhac
-----END PGP SIGNATURE-----

--/uNhmtWkYfSYaFoo--

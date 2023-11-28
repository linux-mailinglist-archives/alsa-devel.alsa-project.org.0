Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E937FBC81
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 15:16:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AD7DE7F;
	Tue, 28 Nov 2023 15:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AD7DE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701180960;
	bh=fpKEocUxMrrYcqELYtVIaj9TqLJFUwmG9ZmXoKkWhZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VCm90xHCLtSrDvnm2wS8KeQJUJjzqveDcosHShnod/zPFTphL8BurhWgjHYdnIcmf
	 N4PEBaVUfE5B56WDW5nmhqGrpZMw/g3waDO9J6iZcynZ/wDQy0ncUHrRbTAl5fmQjX
	 oiCCBEHv7dyVRu7d0grt6BkR76Ymjdh7kw+FafWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C962AF80578; Tue, 28 Nov 2023 15:15:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35611F80254;
	Tue, 28 Nov 2023 15:15:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EC58F8016E; Tue, 28 Nov 2023 15:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BA3BF80114;
	Tue, 28 Nov 2023 15:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA3BF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GlYoUVtZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFC3D616E3;
	Tue, 28 Nov 2023 14:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F04EC433C7;
	Tue, 28 Nov 2023 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701180918;
	bh=fpKEocUxMrrYcqELYtVIaj9TqLJFUwmG9ZmXoKkWhZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlYoUVtZdU7z+1KSGtWb02ZBz3uQMEOVik7A4hKmwM/aLjG87QqnhGQqJooCClAG6
	 vetrqSkfJ+hIIdCNDC27KdjVEQsBj79fBsiCU/7qD5Fvf63l9QaPCuH08Kr8JYOtuZ
	 DCsXaxjjPAQRqV09qUtRBpixROqRnYVXMvIxZOWyMh7jU1nZAitg3NqPrxoSJTMpkH
	 PXN3Jj0hRU6/hu49lsekvJcQQk1JCJuUckwelycWiGDVOmvgpZIMkw+C7+remvLUke
	 pUKGYlyjxyYTLwM0sNLb4oIhBMAn6CoxaSVXY73fluV+NFknXSKHirQmO1yrVbqtCN
	 8BmDHdFNoNCHA==
Date: Tue, 28 Nov 2023 14:15:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Kamil Duljas <kamil.duljas@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: acp: Add prevent against NULL
Message-ID: <bb53b12c-f0e1-4e74-8fab-3bb887d2d1fa@sirena.org.uk>
References: <20231117201606.1955-2-kamil.duljas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ly5f+a4TVh2d6ApJ"
Content-Disposition: inline
In-Reply-To: <20231117201606.1955-2-kamil.duljas@gmail.com>
X-Cookie: Must be over 21.
Message-ID-Hash: HRVDSXVRINY7CIDQR5S3OUJNMMFSUPH6
X-Message-ID-Hash: HRVDSXVRINY7CIDQR5S3OUJNMMFSUPH6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRVDSXVRINY7CIDQR5S3OUJNMMFSUPH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ly5f+a4TVh2d6ApJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 17, 2023 at 09:16:06PM +0100, Kamil Duljas wrote:

>  		adata->fw_code_bin = kasprintf(GFP_KERNEL, "%s/sof-%s-code.bin",
> -					       plat_data->fw_filename_prefix,
> -					       chip->name);
> +							plat_data->fw_filename_prefix,
> +							chip->name);

Plese don't include spurious indentation changes like this, it just
makes the diff much harder to read.

> +		if (!adata->fw_code_bin)
> +			return -ENOMEM;
>  		adata->fw_data_bin = kasprintf(GFP_KERNEL, "%s/sof-%s-data.bin",
> -					       plat_data->fw_filename_prefix,
> -					       chip->name);
> +							plat_data->fw_filename_prefix,
> +							chip->name);
> +		if (!adata->fw_data_bin)
> +			return -ENOMEM;

This now leaks the code binary...

--ly5f+a4TVh2d6ApJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVl9fAACgkQJNaLcl1U
h9DRmgf9FivgR71JdwufFtzF1Yv4mYhxVCkokn2ICbfL5yVE0zuCR2x0DQHdZIDD
rwAGJbGWbrIw9KWThiC3M9P+bbDepiTDVUy21R7iicAKFDw3nvEjbBei5KenF8j5
Dj6+ezNNcTA/tpYw1YL9aTjGBfgu6X/f1lwf+K1tu6dAbXUhJqnDnLDQzdzqMfsh
6jXyGlxWFdgOber5sYmDkLv+fLgXMM/iGarZNX7T0jRw+4jF6boQtCsWY1x6+8HL
WfQxUSLQKRin6/Jy5lhLQOKZ3MoxVwnOpaC78fNjqSN9rBvVJBzfkWNkcodeVRvq
USXhWq/aXvORd1C0SLaIr8aHdNjVEw==
=1Cz9
-----END PGP SIGNATURE-----

--ly5f+a4TVh2d6ApJ--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF856307F
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 11:44:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A693416C1;
	Fri,  1 Jul 2022 11:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A693416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656668679;
	bh=AwvxF6EAZytFEhWRDZzVChNu6O2RS8dZyGJbonSLV2o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V4AwhSqEgSuLVnpVpHn/03h39vsft8EY2qjpyNX1LJlcLbMvrY47MFm0+72cFG8OD
	 d+f+qfcfqZ2rUwKtozGjX9W1AD7bJmfWNmM2dfiy4V+3bmxR6f5Mdilhu94MSlyOhQ
	 zoNDplD+w1RhKVFvmqU2dPoDzTrhQj+ZKJDUNwws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D599F800E8;
	Fri,  1 Jul 2022 11:43:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4D09F80155; Fri,  1 Jul 2022 11:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DE04F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 11:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DE04F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="heXEndUU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 808C36234C;
 Fri,  1 Jul 2022 09:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C613C341C6;
 Fri,  1 Jul 2022 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656668612;
 bh=AwvxF6EAZytFEhWRDZzVChNu6O2RS8dZyGJbonSLV2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=heXEndUUoCf70nuyGXwL6HPEUaVLXTi6YITwS8SB+gDE6nt8GCthfB2+Vc4OHslnf
 YBddI7YskU0EonrbyFQgX+88U1BjHpIwYmv/fk6h9TRPko1zXq4gYYLmhrFYU4m0fX
 QQUw6OsLYTcxBDU/qfjSZj0MFZRbW7DxG+54vrmL5Nm1b5Qu7xipCXc8VQdlSZT+fH
 yzvq3yl/QKEVzkNRq0Rix2UQTVI8ikx9ha6i0jVDE1r+KZW4V7DsKWPh0iYV3j0cqk
 zXm8cPQ78D+dyTHsQ/o+3gNa/Ek1jYAmBtBDpGFhttBXNwf8kCdaTUWtWqhKdjAbDM
 yQXxFC+JqaxGQ==
Date: Fri, 1 Jul 2022 10:43:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH] ASoC: codes: Add support for ES8316 producer mode
Message-ID: <Yr7Bv0q0nEi7WfzM@sirena.org.uk>
References: <20220701020537.970950-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wX6US5MogjSFakn6"
Content-Disposition: inline
In-Reply-To: <20220701020537.970950-1-zhuning0077@gmail.com>
X-Cookie: Who is John Galt?
Cc: alsa-devel@alsa-project.org, vijendar.mukunda@amd.com,
 pierre-louis.bossart@linux.intel.com,
 David Yang <yangxiaohua@everest-semi.com>, tiwai@suse.com
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


--wX6US5MogjSFakn6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 01, 2022 at 10:05:37AM +0800, Zhu Ning wrote:

This looks basically good, a few small things:

> -	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
> -		dev_err(component->dev, "Codec driver only supports consumer mode\n");
> -		return -EINVAL;
> +	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBP_CFP) {
> +		serdata1|=ES8316_SERDATA1_MASTER;
>  	}

There's lots of small coding style things through this - for example
here the { } isn't needed and

> +	lrck_divider = es8316->sysclk/params_rate(params);
> +	bclk_divider = lrck_divider/4;

There's a lot of cases without spaces around /.

>  #define ES8316_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
> -			SNDRV_PCM_FMTBIT_S24_LE)
> +			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)

This is adding S32_LE support which is fine but wasn't mentioned in the
changelog, it should be a separate patch.

--wX6US5MogjSFakn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK+wb8ACgkQJNaLcl1U
h9BaQQf/VPUMD+o7qxj6rL4zuxUrB0sHoN34RJKn1d08sIhGfvb/gLlXcsk65Byu
umUPKlcUFfxvZqRIFtLWmFpmJOxgr24HbwTlj+KMmcESWBeTCv/tI/MYcD1NVFpH
qR/WG57LDVx/VwaFXwk7rOXf6NrdbUUtTOOMrhLwD04X2vULw+xUszjQAcSTDInF
ptBIjw38mo0vKgIvM6f/sXtabBeyoJTdmI7venSBMvU4BtFaPUzXV/60e6iq4Ffy
bPVdkVGiJQLekFkB3Fb4gzfuvXHpOIoNwvMfy2FxXOwiVFizI4TqE57Rj2h71A0F
xqlK76A1NgTgSlJHy/H5XGc595QIGQ==
=JzQt
-----END PGP SIGNATURE-----

--wX6US5MogjSFakn6--

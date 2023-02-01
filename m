Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5805A686897
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:42:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFBB185D;
	Wed,  1 Feb 2023 15:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFBB185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675262541;
	bh=KtS59Ia92JMXEp6HI/ACr8/i5UoMboazeSuRwj5Gwys=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jCkQwgP+P04RXR7Sh57cdM9mh11p5vVlqENvcmlFn0+yuGnSx1itasw47jCte9dcI
	 wY0xIeEhphwY75/YgljGCNN4LAkyVHHjOvvYLTHj3i4jab5u/zjSaMmWO7oeDwieza
	 e4JfGdl0aalWgTY+s8qqLBl6txtlswSaRp3if3Jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F089FF80169;
	Wed,  1 Feb 2023 15:41:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1D9CF80169; Wed,  1 Feb 2023 15:40:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F4A4F80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 15:40:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F4A4F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FeowVP6f
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4787CB8219F;
 Wed,  1 Feb 2023 14:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833F4C4339B;
 Wed,  1 Feb 2023 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675262452;
 bh=KtS59Ia92JMXEp6HI/ACr8/i5UoMboazeSuRwj5Gwys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FeowVP6fl+RQKPyGSsV51OlkN9+Q+MDQD+ZLvW8A+38wZaNYjMd7fc0h5jFnyHUGS
 0fljAB7xQbxdH84e1F9OmIkV0q/HpPU/M0y9wALI6beGsPzoMy+K4K8DKc1Cc+I4Rv
 MxZ0qZx+Ki4Q2S7ij7Gb7+oCpFuGOaPM3hc9Dn5lUQoqOy6l66socywszAfSn1REpD
 ewPCUWkHwkoELT3peEMeREWSS4bU6qsjmyexExo4nY3UrpqFkslKUjIbBKYgIi+4ha
 Su2MJa96XAsAnFUtCE943JTIy2RaRNKeqIbP43L+pd04CazY5DFdoVGLTATTQz6j36
 7uuhpL1OOtyow==
Date: Wed, 1 Feb 2023 14:40:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH 02/14] ASoC: qcom: SC7280: audioreach: Add sc7280
 hardware param fixup callback
Message-ID: <Y9p57qn9+Pig9igE@sirena.org.uk>
References: <20230201134947.1638197-1-quic_mohs@quicinc.com>
 <20230201134947.1638197-3-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="It/vzamgdtamVvYL"
Content-Disposition: inline
In-Reply-To: <20230201134947.1638197-3-quic_mohs@quicinc.com>
X-Cookie: Oh no, not again.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, bgoswami@quicinc.com, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, lgirdwood@gmail.com,
 konrad.dybcio@linaro.org, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, quic_plai@quicinc.com, swboyd@chromium.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--It/vzamgdtamVvYL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 01, 2023 at 07:19:35PM +0530, Mohammad Rafi Shaik wrote:

> +#define DEFAULT_SAMPLE_RATE_48K	48000

Why are we bothering with a define here given that the define also
encodes the value and it's only used in once place?

>  	for_each_card_prelinks(card, i, link) {
>  		link->init = sc7280_init;
>  		link->ops = &sc7280_ops;
> +		if (link->no_pcm == 1)
> +			link->be_hw_params_fixup = sc7280_snd_be_hw_params_fixup;

We only set the fixup in the case where there's no PCM but we removed
the constraint in all cases - isn't the constraint needed otherwise?

--It/vzamgdtamVvYL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPaee0ACgkQJNaLcl1U
h9CiNgf/SDWbO2koQKvCH5xT7veA8uFDK7FX/PmIQ0kAWddbyKY2R+povhqysfIW
wg9TAzbz60wfmDhq+NTTeiHrB4TqbEhpOsRS9E5GyA5+D64d8JEc6iNju+SUhb8x
XjyRIKFntWKqSxgEDiw3ZSPj+unDqfJjsW9JSj06gMzYBM58mvXiDKIUm1PkXwdz
1CjZSKA4Yq1Oy8JXCJulti9SkgzaFI/ylXPK/+zqXR6BjZ/uWY0xicLF4W6nGfkQ
wRoXtjAMfcK9LKLAf2U0i0Lmb6tJdP7waq0qaGQIB/2kT4GDtPGcgCCqROqMjXFT
90ffHxNOpdMnd0EQSrSTUWQBwYTaCg==
=Ge6o
-----END PGP SIGNATURE-----

--It/vzamgdtamVvYL--

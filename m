Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC18902F3
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 16:23:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E18122C88;
	Thu, 28 Mar 2024 16:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E18122C88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711639382;
	bh=vozNlw6gpO1XJWv36UdylIBiUWYDdoPfKk5/j4lfe/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VU4DGqi0sdr1nSscRfrdAgbW8Dcv6iV6N90wv1ubpkJ+KNfjU3TZSsoioNsPsuw0O
	 6eqPixhkv407KmcSzOAolt8v2xmdKAzgcC7MJCDBsnf3PDQ9rNUqbhpGoJCLgwB9XJ
	 TYrf6Ss3+eAIjPl71VTzUpMUF9UXxB5ycrzrpp7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A892FF805BB; Thu, 28 Mar 2024 16:22:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 974EFF80564;
	Thu, 28 Mar 2024 16:22:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C47EF8025F; Thu, 28 Mar 2024 16:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29710F801EB
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 16:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29710F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qK2XdBMn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5489CE2BC2;
	Thu, 28 Mar 2024 15:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88098C433F1;
	Thu, 28 Mar 2024 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711639334;
	bh=vozNlw6gpO1XJWv36UdylIBiUWYDdoPfKk5/j4lfe/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qK2XdBMn83E6sWLnuqy7ufTtf7QtdwBq7TOHEVsVXuj5DlwqaNourPcQKQ7KkNUH7
	 iKb7WcFSeJ5lVoMNpSKFH3eoZQ6N7u2BJdtKEp+iPj+/yfhvzsXcIP18BSzIqoGFRv
	 sDchmBwBpXjAoI9EppNdn1uydU45Nbz+dXqDIfJ75JpuyPoyu5HXpY+oTjaidjUmqV
	 EiInY6rBB+IvT3NSTC1ZDVBRlkukMHY2LocTlJFQS6W0ExtrSFaBry3/otf3xk9apo
	 twLJNjuceeRGH8zrHTbAI0gPC3+sj8IhGE9iIhJOXO8orE6vpe60jIeLLAWjP6/Pu7
	 qxnm0sHCBnKsw==
Date: Thu, 28 Mar 2024 15:22:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v5 2/2] ASoC: nau8325: new driver
Message-ID: <8278611a-a46f-4d5e-9861-67ff1084db50@sirena.org.uk>
References: <20240327075755.3410381-1-wtli@nuvoton.com>
 <20240327075755.3410381-3-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EYfydwHOIW727Hww"
Content-Disposition: inline
In-Reply-To: <20240327075755.3410381-3-wtli@nuvoton.com>
X-Cookie: Yes, but which self do you want to be?
Message-ID-Hash: TKZ6QPPV7FVG27YMGX35KQTAFKVKG22C
X-Message-ID-Hash: TKZ6QPPV7FVG27YMGX35KQTAFKVKG22C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKZ6QPPV7FVG27YMGX35KQTAFKVKG22C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EYfydwHOIW727Hww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 27, 2024 at 03:57:55PM +0800, Seven Lee wrote:

> +static const char * const nau8325_dac_oversampl[] = {
> +	"64", "256", "128", "", "32" };
> +
> +static const struct soc_enum nau8325_dac_oversampl_enum =
> +	SOC_ENUM_SINGLE(NAU8325_R29_DAC_CTRL1, NAU8325_DAC_OVERSAMPLE_SFT,
> +			ARRAY_SIZE(nau8325_dac_oversampl),
> +			nau8325_dac_oversampl);

This should really be a SOC_VALUE_ENUM so you can just hide the fourth
value rather than having the empty (presumably invalid) option.  Please
send an incremental patch doing this.

--EYfydwHOIW727Hww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYFix8ACgkQJNaLcl1U
h9BlSQf9EyTsgJpalcSaLea4nqxS0rWOxqW45DemoZI42X3n4+1V/McyJUdeRp4g
uhtCOzVmY+IpsWRTjh7JkmXeCINHodUMWV9pJ5DNtnkssW0APQ3NTnNCcLfxyZMF
jDAj/Bp6Q+uZSI5lmoEhZ21bzefN0ysYMtrzEym5lT3EA4RCKDuuJEBY248mT/y0
21d/BmZpJfmbwqr5EkLBnYYSItkVtXu4+XRh8bPlL0RVGAv3EYLKLTq45wgsznbQ
UUqTz1+NWfeETQDMV3m2RcEafHiE2DBkb9ZptqtObVuXsx5DUyrnjGpSocfv850C
iPdllwLhZ2RkwVo1Rlaq17ockWjx2g==
=j0PB
-----END PGP SIGNATURE-----

--EYfydwHOIW727Hww--

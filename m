Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB170F5BE
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 13:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB017200;
	Wed, 24 May 2023 13:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB017200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684929499;
	bh=iIH0qE/QN5EsuIOiBySRP5iUYWEHMgTqsDrIgV1fXKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r6K3+CaAVIfcuZGsTimpbWjPkSHtnhAzrs9kMYYQutH4ffUHnzY2Cxyzes0/8LWts
	 du5rRm0ieqvsXzbdA6SEPgQKo6XEwKNtIQ/7dJIuCPLC2qz3jwBeFYgd5+XNndJe53
	 T4glMkWrvgPZfkYSuOMPB3Vwpc28lPvLy7LnXrqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDB7BF80053; Wed, 24 May 2023 13:57:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C3BF8016A;
	Wed, 24 May 2023 13:57:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABFF1F80249; Wed, 24 May 2023 13:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E773F80086
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 13:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E773F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ehkuyuj0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D705A6173B;
	Wed, 24 May 2023 11:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39D7C433D2;
	Wed, 24 May 2023 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684929430;
	bh=iIH0qE/QN5EsuIOiBySRP5iUYWEHMgTqsDrIgV1fXKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ehkuyuj0kVP8pTXI+LO8ZSMqaq8CBRlenOEKbSFp0P6QFaWLZ0z3kMpjkoOxrQu9w
	 5fqn2e9BZI1GDQTVSJinI/A4aRJZTqIU3Fr/7T/D6rHzakhbBWUcSyc4UZcCXFVrZ9
	 Av6x8fFlY34TQ+WCt1BI6uXPPuMIErnKXhQdv6YHWVO8jqicA7XjK3+1Uqt2VIumSB
	 b3RYpz3YrEynTF8Kg2wGKir0/f4b8FkFLaQEDF8XB//EfQTLUIG/tDnVacENi3nMT2
	 rOTMwEPvIt9l/p+ecjhSl+LWR+JkuJqMdhIYcJsW/G7hYJdoDOZIgZKUaQJQH8qp64
	 xSLmcT1kHZp6Q==
Date: Wed, 24 May 2023 12:57:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, zyw@rock-chips.com,
	sebastian.reichel@collabora.com, andyshrk@163.com,
	jagan@amarulasolutions.com, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, heiko@sntech.de, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/6] ASoC: es8328: Enabling support for 12Mhz sysclk
Message-ID: <f5b780ac-e079-4c24-9dfc-05aee52deb9c@sirena.org.uk>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
 <20230523213825.120077-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+rKVKEWVYZn7J9Tb"
Content-Disposition: inline
In-Reply-To: <20230523213825.120077-2-macroalpha82@gmail.com>
X-Cookie: You will be divorced within a year.
Message-ID-Hash: TDRMIM7AYTSWRFUNKN4SGKZHYZCGV36X
X-Message-ID-Hash: TDRMIM7AYTSWRFUNKN4SGKZHYZCGV36X
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDRMIM7AYTSWRFUNKN4SGKZHYZCGV36X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+rKVKEWVYZn7J9Tb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 04:38:20PM -0500, Chris Morgan wrote:

> +static unsigned int ratios_12000[] = {
> +	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
> +	48000, 88235, 96000,
> +};
> +
> +static struct snd_pcm_hw_constraint_list constraints_12000 = {
> +	.count = ARRAY_SIZE(ratios_12000),
> +	.list = ratios_12000,
> +};

...

> +	case 12000000:
> +		es8328->sysclk_constraints = &constraints_12000;
> +		es8328->mclk_ratios = ratios_12000;

The other constraints have separate rates and ratios, with wildly
different values between the two - the ratio (I'm guessing a clock
divider) being written to a 5 bit field which obviously can't contain
the actual sample rate.

--+rKVKEWVYZn7J9Tb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRt+40ACgkQJNaLcl1U
h9Aw1wf7BFOU6DO0NZWHZ9jydC567ScFkTrSAt6wSkPFgkeD7w4S0T2Z3oq/wTue
a8ekwXfod9RDFZQx9jlJTNU4rpEhoY52WPbrSLnXUacpDtVMbmG4KlsVyjMBDXJf
DKgHb2tx6d7ysETphH0A7nqjc2Vn7Av+Gih4f8aVTXVopI5KFe/jqqPZP0u5hcNP
bW2oLU1i/eFxKiAtq+f4Nt3x4IOF/TEP2YhTSYuvfc1X/S0v65Jza5ZjjYG1DQnA
wgZNjZqNC6OoFXvUGgnh8EogEKdhRkbxXmVaYAa3los6gQy2MOCCwYE0SpDMvx43
CNoKmDoevLKi0tK+KksbKcGEzoW/mQ==
=sTV7
-----END PGP SIGNATURE-----

--+rKVKEWVYZn7J9Tb--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C973D9269D8
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 23:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21BBDF53;
	Wed,  3 Jul 2024 23:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21BBDF53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720040606;
	bh=dmmPN7PbNyCuDzjw4nX616fO/kyvAhA6uaaJgw/vC5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RUhR9NNpoe+gjtFe3lG1t3geda5ZFdtjgfFBEq761OKDgVbnmjxx8jTYxSnqQHn02
	 SRafhO1IAcli8PMyT2lSRgKknm46skh9fOJHbXEse8+9sxX1ScjyAQ9QkKFCKAQV9+
	 bhEA76KZCQW3wxbTbeOD+zGcmVo+DP5VgzgNmR+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 659C8F805BA; Wed,  3 Jul 2024 23:02:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E7EF80587;
	Wed,  3 Jul 2024 23:02:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3AA6F8025E; Wed,  3 Jul 2024 23:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D25A6F800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 23:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D25A6F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gGWRsB9H
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53DD2CE2FEB;
	Wed,  3 Jul 2024 21:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B3BC2BD10;
	Wed,  3 Jul 2024 21:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720040550;
	bh=dmmPN7PbNyCuDzjw4nX616fO/kyvAhA6uaaJgw/vC5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGWRsB9H5MXgtDn7xBNW3x8qyw8sNfFGFcrNRO8O/yIwf4qqlSgoIJAMpNG+t7BZX
	 +AKaNMZnSTW4BhxsEDiixqYQXjKtfclgZgjhydQxZMm5TBdoAjiLfsPmtiPKpGEVBH
	 aA0+F2GTdsgouJCp7SjzpViThXocsy3WXNw/Y+KaMkXP+XplJoFUdxgaEfzWOQixUZ
	 bsQZkCrJg+4nGLJsbgVE8NmRAiwVdIjZxxi/tYhpzwa3F6oVqpx356zsR7lFetlzpJ
	 X49nafffoCvVToREvd67r+CMnyPu62/lizDqCqlBh2Z56O17YJk6yCzqZkFQ0dmnAM
	 o0nxREnHvwoVQ==
Date: Wed, 3 Jul 2024 22:02:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 07/10] soc: fsl: cpm1: qmc: Introduce functions to get
 a channel from a phandle list
Message-ID: <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
 <20240701113038.55144-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IXiemNHl5uycVqbr"
Content-Disposition: inline
In-Reply-To: <20240701113038.55144-8-herve.codina@bootlin.com>
X-Cookie: There is a fly on your nose.
Message-ID-Hash: SNOYNA7LX7BCVWMBTSVQSA7OQYUOWHMN
X-Message-ID-Hash: SNOYNA7LX7BCVWMBTSVQSA7OQYUOWHMN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNOYNA7LX7BCVWMBTSVQSA7OQYUOWHMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--IXiemNHl5uycVqbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 01:30:34PM +0200, Herve Codina wrote:
> qmc_chan_get_byphandle() and the resource managed version retrieve a
> channel from a simple phandle.
>=20
> Extend the API and introduce qmc_chan_get_byphandles_index() and the
> resource managed version in order to retrieve a channel from a phandle
> list using the provided index to identify the phandle in the list.

These two PowerPC patches seem trivial enough and have got no response,
unless someone objects I'll go ahead and apply them.

--IXiemNHl5uycVqbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaFvF4ACgkQJNaLcl1U
h9BZVQf/UimpDsgz78MuXcxLPQ7UIFnEeDuapV1kWGaWCmCLoHhTHXeG8B/9AQqI
ttiEWJdBKBzc1NRr0xmsh4BpKIVlCe3zZ3tndxE0umFnliWOKBeo7ZqroZb47asH
lcjxXenwNC733si1/zHRv3cxK8z0zprPshVonONBP4iaKppNz0Kmifj77IglG/h2
C6j9RiJ9CNkG7KTc5XU376/q5G4PXStk+KRrVL0F+x+c93QywoqXinxhXovc/j69
CNNc/7NjfF/7Rs+Y+F4QA+6VA9WjwjEO+WNaI3VtZad+beJ6ERyJBnh6G0tCrWl7
PYG5NWe9uOZQxqsuESvUUBEGB2nJzg==
=qAFL
-----END PGP SIGNATURE-----

--IXiemNHl5uycVqbr--

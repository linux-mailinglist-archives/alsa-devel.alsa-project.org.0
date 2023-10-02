Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1737B5617
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 17:12:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC613845;
	Mon,  2 Oct 2023 17:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC613845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696259528;
	bh=41XksM9CbEPqnvNa0ISp/vSRlLbz+4PKhMb7S1TUSAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pQrYetzlWBgsJtBOtAOs9jjEwNHfelqta/FRdyDCH2itqR/I8ZgAgQlGXs3x7l8xW
	 +WGg7hOjYvE1p8SqOJR9UysBUcNvVF+WDVB5B6Wef48mlcYg2LF2yT5PO4xhReGV0M
	 3tEoYA06WE7czRGQ45Xfa+GCVpVtq1W+HP9blmiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB0B9F801EB; Mon,  2 Oct 2023 17:11:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A3BEF802E8;
	Mon,  2 Oct 2023 17:11:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18C08F80310; Mon,  2 Oct 2023 17:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7053AF801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 17:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7053AF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a43GUsTc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A411CE0E10;
	Mon,  2 Oct 2023 15:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3D6C433CC;
	Mon,  2 Oct 2023 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259465;
	bh=41XksM9CbEPqnvNa0ISp/vSRlLbz+4PKhMb7S1TUSAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a43GUsTcxLVVQlHP1srhc2Ta0b4OZ7SBq6c8jNRGjOA2nNhqTttwcPgjv+EoY/Sk/
	 yuU1euPuMJiWOF6SETfeCcw1cc8r/8avOGUxhhtN4wPRiADHbUQEgR8CxuJfITlA2R
	 ScIpIVFfEEeaf82zyLCD6ASkOPMJxrXYlWhg5QwNGm9kfTgKjsl7rwye31fIXyM09r
	 UzXdWWqnhyyq/Yp1B9TAlMxHZhPtA6mZ2KC7nWk2qlRY8Ino/PI4lwr06wWkOhVdEy
	 mGTzbGJBCBQEsngu82ZsBn2uNQA7gNf5bHCExLim85xh2RZQuNetq3T86ZfIQSr7Lx
	 8J34ttjE2jGWQ==
Date: Mon, 2 Oct 2023 16:10:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v5 00/11] Add audio support in v4l2 framework
Message-ID: <2599f388-51a0-4ecc-9f36-b72d96466dfa@sirena.org.uk>
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XveoJAUVdjo3FpSQ"
Content-Disposition: inline
In-Reply-To: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: SPU24GIE4JLEF6VDROKUGLE5BV6SNEN3
X-Message-ID-Hash: SPU24GIE4JLEF6VDROKUGLE5BV6SNEN3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPU24GIE4JLEF6VDROKUGLE5BV6SNEN3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XveoJAUVdjo3FpSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2023 at 05:00:08PM +0800, Shengjiu Wang wrote:
> Audio signal processing also has the requirement for memory to
> memory similar as Video.

> This asrc memory to memory (memory ->asrc->memory) case is a non
> real time use case.

Other than the naming thing I sent in reply to one of the patches the
ASoC bits look fine.

--XveoJAUVdjo3FpSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUa3YIACgkQJNaLcl1U
h9C9gwf+OHN5aL0Hw/La5WvbqbDYD50xGPRZAiEzHEhxU7t3oB7XRmUGKpAcNp6B
9Gg7xSnez9mmtrqUNNeptqdDTo6KYgdKF0gkoYUMdjA6rwmvBJ4sxs+vv1lRjIT9
8Q2l8jlRl0fFxmRqP6nmKxUPuS6p0m2ZUWU0CbRNiKMdPkGUnHpVpm7jIaXHAy6O
y4J8OrVpC/goCfRANXcrtz7DACV60ihbwMMED6dUZV7xg8ruXAw/cK2kJWqlsTjx
T5bEQxOsCPV3TWM1Gr7BHANCQj/Azzb3XTvMUin+y1PJaHU60qLRROcVDN9V7YaW
qm4fbNobVVMaG1EnsmYguD/bS85naw==
=grt1
-----END PGP SIGNATURE-----

--XveoJAUVdjo3FpSQ--

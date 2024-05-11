Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 634DE8C315C
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2024 14:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E779E68;
	Sat, 11 May 2024 14:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E779E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715431775;
	bh=L6GEnWbRFIUnTLp5ZBj1nZe8npzW7+LcYnKnNImrCg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f0P5/jZojJBhFK4uXCJGpO9LajOXOzhdaBqpbA6sbWjLzRfun0H2uMMrTo9C3Oefi
	 82MPT7w2B4bqAMbJu2qU5IIvkS8555hF9JeeHezx16QI0SHcb9sgNDb4HA/VAuQSiL
	 PU6iR02iKNZJ4UCbfAU+y5slQMdII65w2abQKlyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AB64F805A8; Sat, 11 May 2024 14:49:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44749F805A0;
	Sat, 11 May 2024 14:49:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25A8BF8049C; Sat, 11 May 2024 14:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 963CAF800E2
	for <alsa-devel@alsa-project.org>; Sat, 11 May 2024 14:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 963CAF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vzmo7KOP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 867F1CE075A;
	Sat, 11 May 2024 12:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F7CC2BBFC;
	Sat, 11 May 2024 12:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715431682;
	bh=L6GEnWbRFIUnTLp5ZBj1nZe8npzW7+LcYnKnNImrCg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vzmo7KOP8imYYP9EUREB9SqsQ0mVwP4UlBMEmp4UUI9JrhCFszuETUr+sobW5mIqI
	 cNOFhl6Jr0CCjYfCZ36yW53o4k7WeW3ndW5DxN0JJe+cuW+MKWrBEZu4iVj2wec7Eb
	 Vd3ENik62UjGkZ7q1vX4C/iwqHwMdyW3QeV3PtKHHBtAddUzcU3BBTcO82g6H5GP1O
	 2yjAkBV8ME6uOst13YEmtCMTSrwvl2RCLxCyYq4SYjp02uqr6cFGhpsCzCp1lOvHhx
	 sFTXvHK90OM0SsClnWIOnKbefDJC2G1pIVeNCrriMYfitCiDZX/Iqe0yJUg7JJe601
	 sTr+bFiqVJKMw==
Date: Sat, 11 May 2024 13:47:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: fsl,xcvr: Add two PLL clock
 sources
Message-ID: <20240511-catwalk-ipod-98f3e636360e@spud>
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
 <20240509-repurpose-dumping-156b57c25960@spud>
 <CAA+D8AOkDbj_QsF9VescuAfFjKcB8FnOXqwjXVrrBM1Ck4ut4Q@mail.gmail.com>
 <CAA+D8AOQtwHTLsQcqh_LCvVP5CWXqiHc3-at8jv3B-kA8ORR_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BhobfpOXM1U4v7Qe"
Content-Disposition: inline
In-Reply-To: 
 <CAA+D8AOQtwHTLsQcqh_LCvVP5CWXqiHc3-at8jv3B-kA8ORR_w@mail.gmail.com>
Message-ID-Hash: URYDW2XGHENUGE6BKTWAICGQCWUUFHPP
X-Message-ID-Hash: URYDW2XGHENUGE6BKTWAICGQCWUUFHPP
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URYDW2XGHENUGE6BKTWAICGQCWUUFHPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BhobfpOXM1U4v7Qe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 10:38:30AM +0800, Shengjiu Wang wrote:
> On Fri, May 10, 2024 at 10:27=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gma=
il.com> wrote:
> >
> > On Fri, May 10, 2024 at 1:14=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Thu, May 09, 2024 at 10:57:38AM +0800, Shengjiu Wang wrote:
> > > > Add two PLL clock sources, they are the parent clocks of the root c=
lock
> > > > one is for 8kHz series rates, named as 'pll8k', another one is for
> > > > 11kHz series rates, named as 'pll11k'. They are optional clocks,
> > > > if there are such clocks, then the driver can switch between them to
> > > > support more accurate sample rates.
> > > >
> > > > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> > > > clocks and clock-names properties.
> > >
> > > Despite the detail given here in the commit message, the series this =
is
> > > appearing in and one of the driver patches makes me a bit "suspicious"
> > > of this patch. Are these newly added clocks available on all devices,=
 or
> > > just on the imx95, or?
> >
> > These newly added clocks are only available for the imx95 XCVR.
> >
>=20
> Looks like I should merge patch1 & 2 together, patch 3 & 3 together. righ=
t?

Please, and also add constraints so that the newly added clocks are only
allowed on the imx95.

Thanks,
Conor.

--BhobfpOXM1U4v7Qe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9o/QAKCRB4tDGHoIJi
0hihAQCXLcY+nll7YEK6/Ko2DGZ15ldjwMy8rI2F7y5rjxW/cwD9G3UV60KNhoRE
ivzxxabhzsz8cc1NzjnzrR0RpqNhCgw=
=I79W
-----END PGP SIGNATURE-----

--BhobfpOXM1U4v7Qe--

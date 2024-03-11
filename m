Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F687881E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 19:50:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E38A0218F;
	Mon, 11 Mar 2024 19:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E38A0218F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710183035;
	bh=FAD8J1RUlqaC4G8EsEwHNb448NcJqUS5MI3bQZCirEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BLpZZDseJrJBNcQahiOVwfgm8r1obAcXhvYJsXmkt7zgqIj5CXDbnuMbHafoGnI6D
	 W5UG5tnVULypxyX2kig6zM1/4w0la+KFoqToJOVXeBv+0rQANTg0weLcIbc2rfpwGG
	 MMElTV4sqwv5pOI+2RxDib0950gX1KgglPQREi1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E813F805AE; Mon, 11 Mar 2024 19:50:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B76F8058C;
	Mon, 11 Mar 2024 19:50:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 989DCF8028D; Mon, 11 Mar 2024 19:49:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B8EBF8014B
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 19:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B8EBF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XuG2Pz7H
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C1B3CE0B48;
	Mon, 11 Mar 2024 18:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59482C433F1;
	Mon, 11 Mar 2024 18:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710182991;
	bh=FAD8J1RUlqaC4G8EsEwHNb448NcJqUS5MI3bQZCirEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XuG2Pz7HAXeGCG6GKVk9LY02VzoL32VGGcJe9TE/2XjDIgL0NLROZR8qijW9MXMfL
	 8eXWBhuRqEBK8ott/66W42CTtuA4yP/n+YVkPsxr4aMhBrJFFJeXjpjZdgoRCLFE8m
	 x+LPonrmgKNU4kRqZV1IYHEa1+qHb3a4I7bLTh+1kBILAmSZoGfLM4InXNXDnpZP4k
	 Lp/+HBovl2fNtGMqSULegCChGmRWIKGC3Xch1CEILt+uzV7pVNoM3q5ei+URLkxXKp
	 8JKGBA4TbdEmmqgE74vxXBZ+qmeFb9QeEuohO4eVS5lsd49E5moswdlR6Yrki4ZHkk
	 tCOMUJRWoCV2A==
Date: Mon, 11 Mar 2024 18:49:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] ASoC: makes CPU/Codec channel connection map more
 generic
Message-ID: <e7121fbc-c814-4153-9f17-82ad5de13e64@sirena.org.uk>
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
 <87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eR+iSIT8d181mLfm"
Content-Disposition: inline
In-Reply-To: <87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: boy, n:
Message-ID-Hash: 34Z5KDWR2GVOTSNS67EVWLOMPQJNT5X6
X-Message-ID-Hash: 34Z5KDWR2GVOTSNS67EVWLOMPQJNT5X6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34Z5KDWR2GVOTSNS67EVWLOMPQJNT5X6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--eR+iSIT8d181mLfm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 01:28:27AM +0000, Kuninori Morimoto wrote:
> Current ASoC CPU:Codec =3D N:M connection is using connection mapping ide=
a,
> but it is used for N < M case only. We want to use it for any case.
>=20
> By this patch, not only N:M connection, but all existing connection
> (1:1, 1:N, N:N) will use same connection mapping. Then, because it will
> use default mapping, no conversion patch is needed to exising drivers.

The KernelCI bisection bot has reported that this is breaking boot on
meson-g12a-u200 in -next with a defconfig+debug configuration:

<1>[   39.211516][   T39] Unable to handle kernel paging request at virtual=
 address f999199999999999
<1>[   39.215123][   T39] KASAN: maybe wild-memory-access in range [0xccccc=
cccccccccc8-0xcccccccccccccccf]

=2E..

<4>[   39.498854][   T39] x5 : 1fffe00001b50887 x4 : 0000000000000001 x3 : =
ffff000013f44be8
<4>[   39.506914][   T39] x2 : dfff800000000000 x1 : 1999999999999999 x0 : =
0000000000000007
<4>[   39.514975][   T39] Call trace:
<4>[   39.518356][   T39]  snd_soc_compensate_channel_connection_map+0x210/=
0x578
<4>[   39.525461][   T39]  snd_soc_bind_card+0x368/0x1280
<4>[   39.530575][   T39]  snd_soc_register_card+0x2e8/0x3e0
<4>[   39.535949][   T39]  devm_snd_soc_register_card+0x58/0xd8
<4>[   39.541581][   T39]  meson_card_probe+0x25c/0x388 [snd_soc_meson_card=
_utils]
<4>[   39.548864][   T39]  platform_probe+0xcc/0x240

Full boot log here:

   https://storage.kernelci.org/mainline/master/v6.8-rc7-250-g137e0ec05aeb/=
arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt

with the config here:

   https://storage.kernelci.org/mainline/master/v6.8-rc7-250-g137e0ec05aeb/=
arm64/defconfig+debug/gcc-10/config/

The full bot report is here:

   https://groups.io/g/kernelci-results/message/52435

and everything does look plausible about the failure.

--eR+iSIT8d181mLfm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXvUkkACgkQJNaLcl1U
h9CzFwf+IVjulj8rrjAsSl/s8CHiO4oW5oLannZGrPQY3r75RVxMKynf8v07JLRg
NAHdIM5fr5c/GdwGxRFr9Y/40rtB7hGMtBGPfP569ofLJtKcv8HZUf6q1iBNNq8S
sGQtSbBL1h+m14sTv6uNNnhZnXq8eoeXg3ompC3kAo8Jk6l2y2twKRQ4RtT39kta
ge2sIhJYrfNybrQhEWOm0UhI2MNicn3scOfwKYxBwy086ZHyiB5k58qPyn4+Kqyj
8vvN5MFtQ91V9bbqkU4RdvJoQ/DpYs4owNg7n7zLs86OyoNlQOk6+AbmtzuLSRFB
Ettbkc78XVTJoFF+7CPiyOTDD+ckEw==
=gdVL
-----END PGP SIGNATURE-----

--eR+iSIT8d181mLfm--

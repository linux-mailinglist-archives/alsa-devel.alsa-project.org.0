Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B4C8C5840
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 16:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFD493E;
	Tue, 14 May 2024 16:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFD493E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715697977;
	bh=wzTmRzJutMuitj1ZyyTCjWRU/hDuecvlwjfoxvBzzJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qxeggqcAIA/HZgf1qAEys1f26k+6ASeLyME+mkuwmC8jd8NKFBrJdiIR7VKAe9EpZ
	 2jEi7iRHsT3+2HiVHZFeX4hcbAgdR5Rw8V4mBioZWOAA+iiPZQqBRP4dAXT3/s/+Yt
	 Pyi9iQwAqpHef8jF6M2QzAuGZdV64IKFn0Znntjg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79E5BF8025F; Tue, 14 May 2024 16:45:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A55F801F5;
	Tue, 14 May 2024 16:45:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC1CF80224; Tue, 14 May 2024 16:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 098C4F800F5
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 16:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 098C4F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BGmWHQIi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 541B2CE128C;
	Tue, 14 May 2024 14:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5018FC2BD10;
	Tue, 14 May 2024 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715697930;
	bh=wzTmRzJutMuitj1ZyyTCjWRU/hDuecvlwjfoxvBzzJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGmWHQIieVE2KDMVTUWg2LKGRaVwFMaoi1G3oWxRV58XyoKWK6P9sYUiaEf8PItdk
	 MfMArjQiI7Xd3vhA/Of13m0f19rQbs5R86V+fPdJyquNBgCUxfl9Cvz7lOWctuJksI
	 Sb04bSJ7vLGkIpsBXYJWQyjtwi9reEV3hFOSCofIsJJ5CpbTUo/yVSK1WYAOposC6q
	 lXRrLW9GutUgkf0MnCSG+AHV0Xoa78yw3QfiQJetws8/I1s0fj5/W99zmFRH+iPVwS
	 2vk19i4TliOK8yw6a0egdIqc55cFrjhLWXMPcSqHjH0UASF/pZzQFKOdtBkk9tPSry
	 Q2q4S/wb7sXGA==
Date: Tue, 14 May 2024 15:45:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RFC] ASoC: amlogic: do not use dpcm_playback/capture flags
Message-ID: <46daae9b-10dc-4f49-8a25-c387d03ae87a@sirena.org.uk>
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
 <20240514143116.3824376-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3SR10CprQBp87L0m"
Content-Disposition: inline
In-Reply-To: <20240514143116.3824376-1-jbrunet@baylibre.com>
X-Cookie: In the war of wits, he's unarmed.
Message-ID-Hash: 2XVFKAO72E6Y6OCWZB6YISVXYUQXUVKD
X-Message-ID-Hash: 2XVFKAO72E6Y6OCWZB6YISVXYUQXUVKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XVFKAO72E6Y6OCWZB6YISVXYUQXUVKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3SR10CprQBp87L0m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 04:30:46PM +0200, Jerome Brunet wrote:
> dpcm_playback/capture flags are being deprecated in ASoC.
> Use playback/capture_only flags instead
>=20
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>=20
> Following Kuninori's series, dpcm_playback/capture will be ignored.
> However, properly disabling stream direction is important for Amlogic
> audio drivers.
>=20
> I'm not too sure how this should be applied to avoid breaking bisect,
> before or after Kuninori's series. Maybe it should be merged into it ?

Probably better to integrate it I think?

--3SR10CprQBp87L0m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZDeQUACgkQJNaLcl1U
h9Cj2Qf9HLVOdSH5HaXxIypjX5tfpQwLPzkXCL218MMV73bB2xh2jUSxphoymOOH
g/jtFZsI35zWgGd/xrN/JDW03rRJSbdDd+ZnNU+k8Cgvt7IiRG1dI8ZH7LjhDaw2
ufxmUFtogpQOsuF23t1oWroO7Yrd85fnl/yQp53uTfeOqr+3zWGkRjJUxkl39UA1
4zgESYgpKV6HkvjSak9//kWPz9MlIZN1zjiIg7kA4k2Y1+utiPrkE0ysSt0Q8Vbf
jZyNJbacqoEYv2UeukWrsHiw6gqyrA5f8cGC1w6Jw27AScoSDVB2lviUxOMoifL6
R+0iAdSYEauoEee4GA6jE08l4zyBMQ==
=vfji
-----END PGP SIGNATURE-----

--3SR10CprQBp87L0m--

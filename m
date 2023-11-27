Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4017FA65B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 17:28:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10FC2950;
	Mon, 27 Nov 2023 17:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10FC2950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701102480;
	bh=xEgRq5Xvh2zD3GoLKWpaIWoCkKj2HoP9Qjy3LlUgoSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qg1m7RXFbGWlvlwClt/26B1DJTQVaEQ3CIfOSP5297ld8ioaXcQadH2FRpGZ+8t1s
	 o9DCWJaoagWBvG9zVETaem4BZKQLVYryOVB0UcEILqohQw1rN3h08N5yKqyxnp2aU4
	 +6GNaHbgzMkXAqEJfF7iaH2U9FL/Wv9ADO4a1hac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5D12F80588; Mon, 27 Nov 2023 17:27:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1265BF80579;
	Mon, 27 Nov 2023 17:27:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23BD6F8016E; Mon, 27 Nov 2023 17:27:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EFCA9F8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 17:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFCA9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E+lm4BmG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 628C861085;
	Mon, 27 Nov 2023 16:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38834C433C8;
	Mon, 27 Nov 2023 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701102437;
	bh=xEgRq5Xvh2zD3GoLKWpaIWoCkKj2HoP9Qjy3LlUgoSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+lm4BmGCWHO5Rlyq5Man5wzNSILo3afnLpcRHq/8GpiJUszLuE+gz5Bsxb7YUg1c
	 a7pf5Q0IKsc6xYcNc8+KB7PrWRkober+pZDuoN+NlWEvJhs3JX2qGOkA5XqqduOE0R
	 6la3lk9Qxx97LvY59MtAaSpvkINDXwPBFJSSjI0rbbC9Z25wdL9/fppwOkrFsh1IAj
	 7UUBbyNCPi7IC0HSnUrGX6pi/dG7Yi6jw1JuIMC/1RMmyM9pwALN7OSZ5jKozP+H/n
	 +Ymt9iLVUIkWBdD1EaK2mxisAGF73gFL3lzgjObfy7wWtzAh1FBanvGtL/Hdbtq4Rx
	 YLUxHsb2b2PRA==
Date: Mon, 27 Nov 2023 16:26:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Malcolm Hart <malcolm@5harts.com>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
Message-ID: <ZWTDPklM4wFzJCsb@finisterre.sirena.org.uk>
References: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
 <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
 <87leajgqz1.fsf@5harts.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D7k247d1NH9+CyUL"
Content-Disposition: inline
In-Reply-To: <87leajgqz1.fsf@5harts.com>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: YPA6PAQVU2U4X6O5CDYSIX2BS3KVYXGI
X-Message-ID-Hash: YPA6PAQVU2U4X6O5CDYSIX2BS3KVYXGI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPA6PAQVU2U4X6O5CDYSIX2BS3KVYXGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--D7k247d1NH9+CyUL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 03:23:08PM +0000, Malcolm Hart wrote:
>=20
> From da1e023a39987c1bc2d5b27ecf659d61d9a4724c Mon Sep 17 00:00:00 2001
> From: foolishhart <62256078+foolishhart@users.noreply.github.com>
> Date: Mon, 27 Nov 2023 11:51:04 +0000
> Subject: [PATCH] Update acp6x-mach.c
>=20
> Added 	ASUSTeK COMPUTER INC  "E1504FA" to quirks file to enable microphon=
e array on ASUS Vivobook GO 15.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--D7k247d1NH9+CyUL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVkwz0ACgkQJNaLcl1U
h9CGxwf+IOavXif1GJ54Jz6u3slzMUOM4s3V9+3Nt4BWPEt6DBlPlRJ2dEqsC3+U
Avr6Z8+qUCFdZkRAsXFonInlcjZvcgzDapuxYowQO6e+X1LorTaq4lEXyS0w5wes
C9p7wHJtSMLJHiyFRTPONV/E8oJGp2Xm2uLDo3iKEv3QKZdm+s8q7Ux69YUwnrMG
5M/TaRjHWVoat1UP5xWDEoId9VfFy2ZCFtUEKZ6uiLK1aU/3STSVmiCsNtCF3kZI
7cqzQKbUd3lFyXP4fb0VRBDCdAulsn2aeBzPWMsHmo3qRdIqva9F4BYX4bxpIk+v
Jzk7Mt9Dr2jBCHHMy3b2GAt6jsyHtA==
=K3vO
-----END PGP SIGNATURE-----

--D7k247d1NH9+CyUL--

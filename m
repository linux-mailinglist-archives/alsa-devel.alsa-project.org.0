Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7287F7627
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 15:17:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7CAE10;
	Fri, 24 Nov 2023 15:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7CAE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700835478;
	bh=umb1lq+7x0di4GkTWElfAJiKHuYnyynTpxF8V0VWQ14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aAnz72GDpNNwLauI5IOKqJcBwGFdviqzN87unMVOLSyfR/JXJmdULgcslz933oTLh
	 35vYoCq8rUJDoVY/MtTxbkn77UiUIEem95gXQ85kG8s8mnvQoT1kOjoHzbr98r2j+l
	 +OG6zUVALCGnd/MzGiR+wJnlgkKEIiX4ZJjbIwvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4EAEF80549; Fri, 24 Nov 2023 15:17:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56E7AF8057B;
	Fri, 24 Nov 2023 15:17:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC10DF802E8; Fri, 24 Nov 2023 15:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BECC4F80246
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 15:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BECC4F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rW0B7dko
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95A2D6228C;
	Fri, 24 Nov 2023 14:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5556C433CD;
	Fri, 24 Nov 2023 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700835431;
	bh=umb1lq+7x0di4GkTWElfAJiKHuYnyynTpxF8V0VWQ14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rW0B7dkoDAMXF3C8b51xqQYnjp/0ej9P/oNncvvL07WENujuurblmbxVjJSwx7wmB
	 9KKHcOIYNeCVw4zCJhk5eB9xPYx1FC6SzFhublw39agOIs9ybkipKrUVf8kWaoPQB1
	 5Oz0ulLztmqTP5R8wxPh9L8QI+4CmGvYsrs5ti0tb2QmZes7KUvcsXl0xtptfsqCVP
	 BAGOB7XRL3w0YUYz1YRDr2amdMod2abgiEEgaFMdczTGqoUdW1zB0kkvS+cAK2mjcR
	 fbj52ldJjgY/aKo/vWb0aCc5aaJOuscmUqgjnVk5MCYQih0+KJMbjPQZdsubDy3NQA
	 WKH/df1ixMCvA==
Date: Fri, 24 Nov 2023 14:17:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com, daniel.baluta@gmail.com,
	robh+dt@kernel.org, iuliana.prodan@nxp.com, shengjiu.wang@nxp.com,
	linux-imx@nxp.com
Subject: Re: [PATCH v3 1/2] ASoC: audio-graph-card2: Introduce
 playback-only/capture only DAI link flags
Message-ID: <ZWCwZNzWZNIefNjB@finisterre.sirena.org.uk>
References: <20231123160655.188428-1-daniel.baluta@oss.nxp.com>
 <20231123160655.188428-2-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KPJm13OYvLGl9q7Q"
Content-Disposition: inline
In-Reply-To: <20231123160655.188428-2-daniel.baluta@oss.nxp.com>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: TO7KNLFAPOLJXALAQTIBQUDGZEFOGKEC
X-Message-ID-Hash: TO7KNLFAPOLJXALAQTIBQUDGZEFOGKEC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TO7KNLFAPOLJXALAQTIBQUDGZEFOGKEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KPJm13OYvLGl9q7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 06:06:54PM +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> We need this to signal that DAI link supports only one direction that
> can only be either playback or capture.
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

It'd be good if the changelog explained why we need this.

--KPJm13OYvLGl9q7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVgsGMACgkQJNaLcl1U
h9CQZAf8CQihmPYaPIZSCRjd6wUATVjtfC2gIaucJq69pLgqmWIvLjsCCAnqqJbM
MlwcKVML2trFRWXG+bvNrIdtXLGr7/Hp0MiksG6oPuJsfKLdNPIEyKF17QYKs2iq
gPonNRnz5xePhFu3JWPJGbzeSu/kf2uq4mXOH7iwEBRmZFS35chTGBX5Shvrbvx2
UoNoyzy1nynNEAmplvYuqCvwXa6WD5UiwbgjMoIXy9UeD7tlytbxxUjdhSRPIq0e
cAfvAczOcivL6kSw079o4UGhAEOlU+fvm1YOn2QFoGQvlmQFtyBxhd02KhwKXfXL
7FxvwpPzuNJ2xjWnnIR3bf0Tlk11qw==
=c549
-----END PGP SIGNATURE-----

--KPJm13OYvLGl9q7Q--

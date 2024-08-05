Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB3947C3E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 15:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7F4B5A6A;
	Mon,  5 Aug 2024 15:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7F4B5A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722866020;
	bh=9BMNAe8AQGch6QfXhgjEJH61vOGani0bKSdAc5nQTtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=glYpNJfCqrBI1eW53xDwCcjz0ne63TG8PaCapfeN8d8QMVSzun9Z1t784sM9lDxsL
	 G90I4BqtwYWQciIjaAgz+e7Gmdng5KxmkfB7gGyXkwjpFwQ6MTV4iumiOP8lFK2EIp
	 OOAMo/UifL1LqLIB+ABEzEbBQSKYsXbFWwk8OS40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5649EF805AF; Mon,  5 Aug 2024 15:53:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCAB5F805B3;
	Mon,  5 Aug 2024 15:53:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FC67F800E3; Mon,  5 Aug 2024 12:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 677B4F80448
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 12:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 677B4F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j68zn0ij
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1781DCE09F2;
	Mon,  5 Aug 2024 10:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C512C32782;
	Mon,  5 Aug 2024 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722854588;
	bh=9BMNAe8AQGch6QfXhgjEJH61vOGani0bKSdAc5nQTtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j68zn0ijTzW/PEHDREz6JEnLp1ljRhD1cSR/K+vwZXnTGQ5wsoK29scXrURc60Hxe
	 MGDHqItscaWhN7enOD/mvFxbSSImeeXsHAbnGvYJ5sTOASjMOgFDjEJMtLkGKi1H3Q
	 G+UqsX6tQP7T90DSwHcwIHMFQ52Qq7R5oXaOGEgtBjR5CUtq0umEZsFDgQnFbxPkcu
	 ILDRojuuhZ9mlC78j7bU9AII3N/ZU3X7TiLDRAleKDJ0jIVvovHhIQVYviXG/q1Kn6
	 9Wrv+3eu31FVuxn/oAs/8MlcrVEx03oRjeJQALAnMQAjV3MC9L89ZtzUD0BD+7JokN
	 /rzIu/4/GVF+w==
Date: Mon, 5 Aug 2024 11:43:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
Message-ID: <8a4d449b-0748-45e9-b313-9af0d349a776@sirena.org.uk>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R+fjNSCnhNXUq53X"
Content-Disposition: inline
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Goodbye, cool world.
Message-ID-Hash: FUQMPADFYADSVEHZN54B2Z4AFD45HDB3
X-Message-ID-Hash: FUQMPADFYADSVEHZN54B2Z4AFD45HDB3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUQMPADFYADSVEHZN54B2Z4AFD45HDB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--R+fjNSCnhNXUq53X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 12:33:38AM +0000, Kuninori Morimoto wrote:

> Many drivers are using below code to know the Sound direction.
>=20
> 	if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>=20
> This patch-set add snd_pcm_is_playback/capture() macro to handle it.

Acked-by: Mark Brown <broonie@kernel.org>

--R+fjNSCnhNXUq53X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmawrLcACgkQJNaLcl1U
h9AcgQf9Fn7Ei9EEes+luzQ6AqPvwv4Lu+O5M76EWwCcdI5FZWwjJyaPiyC4gK8v
0sWrOVgmAopHSqmjhvznqNdnGXW6imWz/lGjvVwWpl1FBWocTcjoVbUF7H9y2Kx/
Ie7k1gpkvljD777PPDOo1ZXhcOeiFCPSsQh3H5w5U+qS6n6X7xi9KsPjPeV37TDN
TFzr0Jrv+zgPCmJaii0ruRUiCCWuVK35MdNqYHwpMurA9/0Rb55yTVSGQ3G+XDzd
YPxZ4DfvmHWWbHTtoRFjihjki0maZcwEEWAgk5N81pY+d3ZYaULDxeQACzXloZ3k
4Kw9mDfIWMdHNtaez+0RGqsikTuPgw==
=vRs4
-----END PGP SIGNATURE-----

--R+fjNSCnhNXUq53X--

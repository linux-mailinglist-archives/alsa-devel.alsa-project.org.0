Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E064C9520C1
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 19:13:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B2822AF;
	Wed, 14 Aug 2024 19:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B2822AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723655585;
	bh=0SnaGwuuwdhAmGTBrhF6fl3MkbG/FdzPfWPhS4PDvUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KKRom8INLrKqa4Wq1gqSV7w1arI6CJUyaO9CMpfYT1PVQr2cqearSSfekzWXWPLYa
	 +PUKd2Et6J4+yUu1c/h/qV3sePapE8vNM0mhZvKzeXNBqlA2zpi7BaMasiuXF+1jT0
	 R85bqetJpgJw/Kt6Vp+3ltLRxqeFzey3bGP+Wm4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09B37F8057A; Wed, 14 Aug 2024 19:12:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7711EF805A8;
	Wed, 14 Aug 2024 19:12:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6475CF80423; Wed, 14 Aug 2024 19:12:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CC84F800B0
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 19:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC84F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BR10n7Uz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E321ACE18EA;
	Wed, 14 Aug 2024 17:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E98C116B1;
	Wed, 14 Aug 2024 17:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655540;
	bh=0SnaGwuuwdhAmGTBrhF6fl3MkbG/FdzPfWPhS4PDvUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BR10n7UzYZ/Y/4KBXz8/jl+rwVIYLXmy4wUc9bDvaw/L/m/t3UxRwT9YodWIm+q+y
	 1gtXAPVK0Y7f5tcX4/zRmNPVxcvH8H2K4f4GPoGTHYYpaZduMIAPANZyOaxzVuk0dX
	 mrdrlfJnXv0vXxpQyQKPK2Yg5W2PS+gEWnbQlWDs6Uumte11vpcGseBvUo+UbWjK8k
	 Px2YNGJIQLGrC2XSMtss171VQekqb+mqMR2uBOcTv5PWoHpKwqN8lNBADyRbib0K+c
	 UnVMC5DgXFHqEIjf485UJRmRY/ozTxHIIC73lPJ+BlzQ5fQ5UKXWe6hshObfEBkj9D
	 /xVzBG8ol81yw==
Date: Wed, 14 Aug 2024 18:12:15 +0100
From: Mark Brown <broonie@kernel.org>
To: jau@free.fr
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sti: add missing probe entry for player and reader
Message-ID: <d761c2e4-5b75-4306-b33b-c71b7c132a05@sirena.org.uk>
References: <d85590f2-88b3-4bc2-b7b8-9f96a5d5bb17@sirena.org.uk>
 <1474761635.17820466.1721651484902.JavaMail.root@zimbra60-e10.priv.proxad.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R/+/yIv+8uVKHw9G"
Content-Disposition: inline
In-Reply-To: 
 <1474761635.17820466.1721651484902.JavaMail.root@zimbra60-e10.priv.proxad.net>
X-Cookie: The second best policy is dishonesty.
Message-ID-Hash: FUGL42KDAKLN5UXLASK3DQR64SGMUXCF
X-Message-ID-Hash: FUGL42KDAKLN5UXLASK3DQR64SGMUXCF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUGL42KDAKLN5UXLASK3DQR64SGMUXCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--R/+/yIv+8uVKHw9G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 02:31:24PM +0200, jau@free.fr wrote:
> Thanks for the review!
>=20
> See updated changlog, if ok for you, I will send a V2

Yes, that's fine.

--R/+/yIv+8uVKHw9G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma85W4ACgkQJNaLcl1U
h9BiBQf+LNCJki3pIICvAn44DfIbYhpt5xch7PprJjws3hbz5qlLtHgElYrh0Sc/
A8TjvkmpTO+4AF3WJ7nfqyWBDdjn/g+Keh+jl08EshrcwP9PGexpYAi0xIvAngWV
APLx1czpzGjXj4AAwFVrL509W0BDtAJDWVAw4wFUVh+Sr8oBsJFlyqMfLHnwdXvL
az04rWqTZI/SfFlL7y57Fqr63sgpIvJudIC6L7ahPm1ZbwLKX0TIwEcYCZZWKvrl
/7Ifr+Himsr3DSRvuNm9NtTI1weUaRxXW3HIWS9uosDbmQrbcou9tGoe3l2hIWwg
o8kUoguDJBoM3RyFbKoSHzxDW1DGJw==
=yoSn
-----END PGP SIGNATURE-----

--R/+/yIv+8uVKHw9G--

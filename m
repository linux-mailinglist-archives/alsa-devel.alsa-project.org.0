Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13233831E64
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 18:25:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 807BE203;
	Thu, 18 Jan 2024 18:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 807BE203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705598715;
	bh=fwjbGDSFIjc8qlO4WD/Kh7B3ZcBVJBmaJHRvtZrLsQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KYEUV78BtqaJZd3QgeqxHk4F0quPTgFtXq8ZXOPOHKgRMs3t25DWMxgPeKM6wjOxX
	 11/icuNN+ALZCRyIeIHjPAcCg4aWeTQ/VflRNMUKsGZ32ridiNVCYpyiD6bNM0Ocwe
	 PPMBSGFvbeTwbwRNF3Nb6zLbJD4kanSAVIZkn7A4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E19FF8057E; Thu, 18 Jan 2024 18:24:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5CE4F801F5;
	Thu, 18 Jan 2024 18:24:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E069F801F5; Thu, 18 Jan 2024 18:24:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93FE4F80074
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 18:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93FE4F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U/wR20Ik
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CB53ECE2002;
	Thu, 18 Jan 2024 17:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80269C433C7;
	Thu, 18 Jan 2024 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705598661;
	bh=fwjbGDSFIjc8qlO4WD/Kh7B3ZcBVJBmaJHRvtZrLsQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/wR20IkdFKEa6etry0nq9xG/nHA6/iN+lCrnxbPsqLCqSxt+JloUKnAkZTwEtm2L
	 rN0YE18lsRlwry23wNjsqN3FVeNhPGEdQomhbXJdmfZ2DCDM1cL/S5BmpdFfTr5CCw
	 RCrPu+FA+uyaO9Bg10TPMbr3KJA0TE0l5epsNE7ar1S48lsgm3Q4KkNa6fnXO6G3og
	 4e+JVM7jlBBitrbR52ybBsKc6SICKubRk17Qpr0I0/vnurvxjcvEP5qCbahNA9mMtS
	 VDbsSGBcdxYWOWNhbM64BpzRhCq9rwXmuxiAVEscG6RT8cEdhd8RbMJ2Z1K2iP73eG
	 KZyRGikvIWLLQ==
Date: Thu, 18 Jan 2024 17:24:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/5] ASoC: codecs: wsa883x: fix PA volume control
Message-ID: <a9e1f3b8-9597-454e-b68d-4014e923ee61@sirena.org.uk>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uU07sBcsXDNnOMTd"
Content-Disposition: inline
In-Reply-To: <20240118165811.13672-2-johan+linaro@kernel.org>
X-Cookie: FEELINGS are cascading over me!!!
Message-ID-Hash: EHLUXNUFG2RZ4ITPOW76X4QMHCQBNJDZ
X-Message-ID-Hash: EHLUXNUFG2RZ4ITPOW76X4QMHCQBNJDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHLUXNUFG2RZ4ITPOW76X4QMHCQBNJDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--uU07sBcsXDNnOMTd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 05:58:07PM +0100, Johan Hovold wrote:
> The PA gain can be set in steps of 1.5 dB from -3 dB to 18 dB, that is,
> in fifteen levels.
>=20
> Fix the range of the PA volume control to avoid having the first
> sixteen levels all map to -3 dB.
>=20
> Note that level 0 (-3 dB) does not mute the PA so the mute flag should
> also not be set.
>=20
> Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets an=
d map")
> Cc: stable@vger.kernel.org      # 6.0

This will mean that any configuration saved with alsactl store will
change effect, it might be better to just fix the TLV description and
live with the unfortunate UX...

--uU07sBcsXDNnOMTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWpXr8ACgkQJNaLcl1U
h9Dj7Qf/RUbEhZL9xGzztZhdMbhnvQx3zBa7jW2Du147E9JDgc8KtkPj7Vkk4Uf3
3FmSoDvBaUI0PGj6+Tno9DunZpJatVosXbxfSECDIKQAfq7MMO03jdQSvVM8jW9J
QXu/yx8ZS1JTm3RioGwhZLfrqz2NqiidN75JdRwMHEIMOp+sMjqJMtExzCWxYs2O
QDkeI1nR5sZvFmIajm+FfcvbUVRn6g43gzAodZv7T/jsqjCd/9id10UV0Z48wEzG
Xt968j4d6CJ/D5YZpat/7RuGEmqde4l7ILaDXnrJyjCdvZ7vLVuLYH0T1YpfzCbD
2VmGNoDs1sLPwPR+Og3WQ+PuTozqIQ==
=QGG2
-----END PGP SIGNATURE-----

--uU07sBcsXDNnOMTd--

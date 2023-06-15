Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3AC73169A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 13:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6361822;
	Thu, 15 Jun 2023 13:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6361822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686828701;
	bh=R9F8GfHIz5BzxMyYLOltGUrhmXtWgm9RjW99JiZySp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MG8lAmzL4Jdg3hhG/ZjIuelitp1pFRi8l+5KEUiC1loGO093DxvTDfGagDv7FpHrV
	 WYbub+WIm+gAO+CIp47XVEeniukwKmGQX2p0+QSPDI3C/fwezWEt86NxJV9/fC6Pw2
	 aCmKNFHXrcN3tCcdywGv+X7x174yXNqTcf8wDV18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 352BAF80301; Thu, 15 Jun 2023 13:30:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B86F80130;
	Thu, 15 Jun 2023 13:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B82BFF80149; Thu, 15 Jun 2023 13:30:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AF39F800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 13:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF39F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dB5c/uqn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B15262509;
	Thu, 15 Jun 2023 11:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CE2C433C0;
	Thu, 15 Jun 2023 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686828636;
	bh=R9F8GfHIz5BzxMyYLOltGUrhmXtWgm9RjW99JiZySp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dB5c/uqncj87+C2R9Ni1LUM4gA5CB+rNQVniaQabBj4lth1T4APuNfj+PUMccVgt5
	 OoM3PADiPzcc6z60HlPG6RhGHBHBUwIsZLi1N5ze12FBJjKYbRK3/cI6V35sA444ba
	 hzA/Vj6FIif+sW/IuVrARisqzpCukoTYR+54JaM2GSGGgHOyu21JRBWQN3wUMVidZm
	 GlSWryL3G9Iek14LFKgdURzUd/llaPe1dSKsKQs1rYnWhhEELJ5yoaA8hqsYXFYxhi
	 z9g0egVQgKo70a4eogD6s5NgFMSUtz43i1Kpjah3SrOtF0soUGU13ONJD4fSJRVBGw
	 j8z7E9K6JuMWA==
Date: Thu, 15 Jun 2023 12:30:31 +0100
From: Mark Brown <broonie@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: lgirdwood@gmail.com, krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3 1/3] ASoC: Add support for Loongson I2S controller
Message-ID: <89022514-9f99-4fdc-9eba-d428ad0bcbb6@sirena.org.uk>
References: <20230614122140.3402749-1-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/A+VzvD15DayBDle"
Content-Disposition: inline
In-Reply-To: <20230614122140.3402749-1-mengyingkun@loongson.cn>
X-Cookie: You are false data.
Message-ID-Hash: JLZOXS27A7A76AEESVGCQ6YKIVG6C5MF
X-Message-ID-Hash: JLZOXS27A7A76AEESVGCQ6YKIVG6C5MF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLZOXS27A7A76AEESVGCQ6YKIVG6C5MF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/A+VzvD15DayBDle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 08:21:40PM +0800, YingKun Meng wrote:
> From: Yingkun Meng <mengyingkun@loongson.cn>
>=20
> Loongson I2S controller is found on 7axxx/2kxxx chips from loongson,
> it is a PCI device with two private DMA controllers, one for playback,
> the other for capture.
>=20
> The driver supports the use of DTS or ACPI to describe device resources.

One minor thing which can be done as an incremental patch:

> +/*
> + * DMA registers descriptor.
> + */
> +struct loongson_dma_desc {
> +	u32 order;		/* Next descriptor address register */

This probably needs a __packed to ensure the layout doesn't get changed
by the compiler (eg, with struct randomisation options).

--/A+VzvD15DayBDle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSK9lYACgkQJNaLcl1U
h9DVwwf/XbYLj9C6R6KJf+n6qkH6SmKd8327N8rN5wqMmGk3eGtuKHwLH9j4p2BV
vdvPkbcWbLiULZLXC8bpxg/KeOXTyS873qsvMoiNjqaIKKpGAuLNM1fhNrIRtgpg
dj/OBVVQg90Web2zrDiUia0uqRzU8mY/WRffRuVaiUfDBQmaHkaCEgK3cxbP6o91
WTulyQP9NVE6Vh7dcndWOpLc526CZkmOPgO7pSyGzw/n8D09nTicsP6zNb95GtHl
AxQOuu5Dun7ibJAbWKACf+VeXPYfBsg0EuR6/rIn2SrYodg39sPi5b45KL2kR/mI
JvxjCSIrK8YUePlv7O/iqHuaFsJXTQ==
=yMz1
-----END PGP SIGNATURE-----

--/A+VzvD15DayBDle--

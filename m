Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947F7DE545
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 18:21:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A437F1;
	Wed,  1 Nov 2023 18:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A437F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698859282;
	bh=Bbfv28Qw5IxrYu8cp7NRud2jttpradY7KvDgeTzH/ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YT67QQ4AEdIZh+xWMfoHFMglMvs/zHsRMaMAZj2JgqqopYUwNaheOv4J7E6vUZ5PP
	 DhSlcfg8olbq2LV6VHvreNYHn6aLJJJ197HSZLQKdMqnvWZhDL303LlNIiO7jvfYVZ
	 of9X5MYIVoQKylhLBkx/Sne9Vnn9Tstd/41lutXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 818ABF80425; Wed,  1 Nov 2023 18:20:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 079F9F8020D;
	Wed,  1 Nov 2023 18:20:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94631F80290; Wed,  1 Nov 2023 18:20:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DF37F8016D
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 18:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF37F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rcLNbbEj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9730ACE1020;
	Wed,  1 Nov 2023 17:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1C0C433C8;
	Wed,  1 Nov 2023 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698859214;
	bh=Bbfv28Qw5IxrYu8cp7NRud2jttpradY7KvDgeTzH/ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcLNbbEjHOO2zM5XvLvjp+xt5daCIs/9ghxTNoiUlnnOX2Il6risTJdF5WgaUE3kZ
	 LHO4LL/L0jymm6SN2IegJD8PVeQmkSLuSSXiViXYRMIwq84jUFBz1SMScWoFpsYEgP
	 GPKJxkEZ6XEtYbdPDcl7t2crMQean/kiHV23VvoFB8dRZA4mCFY1mTkRNlqh/6oT3U
	 K60DI9KVW2XYNM4X59RzgfjZaifgk+n3JEYRlJFx5pKzkXCKI0mPMmYsyeC3P6Fa6r
	 GvDgO6RGLAKdn1P9ypRfLSjBr0xzSJMzXU+6tOgQvR8hMktNWonOGo3HlLaZVUpAER
	 PJ8AA7MnPmCEQ==
Date: Wed, 1 Nov 2023 17:20:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682s: Add LDO control for dacref
Message-ID: <65ad7eed-e1cd-442c-9b9c-d1f5b520984a@sirena.org.uk>
References: <496805f7ca084e9dbcf7140cbe83ed4b@realtek.com>
 <ad79bd27-5c1f-48b9-b0b5-bb5c48cbd56c@sirena.org.uk>
 <28cf2cfcd7b047519811e201da2c2f9f@realtek.com>
 <c498a822-cde9-4803-bae5-309b858b2c87@sirena.org.uk>
 <2bc63f6d27454522bff3dd8c70d695a8@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OYvor+XafyltjXtr"
Content-Disposition: inline
In-Reply-To: <2bc63f6d27454522bff3dd8c70d695a8@realtek.com>
X-Cookie: P-K4
Message-ID-Hash: YCDCE5EBDUYO3ZKKCYL3K4VQ7OJ4GJBC
X-Message-ID-Hash: YCDCE5EBDUYO3ZKKCYL3K4VQ7OJ4GJBC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCDCE5EBDUYO3ZKKCYL3K4VQ7OJ4GJBC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OYvor+XafyltjXtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 02:02:07PM +0000, Jack Yu wrote:

> > That sounds like it should come from the firmware then if it's supposed=
 to be fixed for a given system (which is what the above sounds like).

> Yes, maybe it's better to be configured by firmware, but there is no firm=
ware to set this LDO setting in this case,=20
> so we provide this control for customer to do their own setting in UCM.=
=20

When I say "firmware" here I'm talking about DT or ACPI rather than
something running on the device.  If you have existing systems you can
always use quirks like other drivers, though that's obviously not ideal.

--OYvor+XafyltjXtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVCiMYACgkQJNaLcl1U
h9BigAf/RGTsd1qUoRaAT1CJ3fVOjT5k0eFCdz+C9VV2JynVBNGRqfbdHqUZ2st/
y+fTa8ytKy8yZShfOUuamZHFGdmIlq8GXkVFM7hhsRJHNeCWj3gLp7IY5ZkrsTOh
5jBL0UbZL+pJMTcYwGu7STCNsRMrG24iGgoW0iBFvbB8fNHC6eJvkZiGrr2qSHOl
6xbAqKXorY8xqmZ8W8yauVZUlbHLwDQNX1ZMSj8pGnBeVay/vM/YI2ZaLwonh/b6
idZxmtmuZ31S/W0U2V4g+P/VePdSg6IuklqZXnDcEnJkNTE678ZUXRZXGJ99esB5
3BVHmW5AarbLJYvKbZHNquP48rLcOQ==
=5IwH
-----END PGP SIGNATURE-----

--OYvor+XafyltjXtr--

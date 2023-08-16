Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2777E337
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 16:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99313741;
	Wed, 16 Aug 2023 16:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99313741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692194791;
	bh=FGkS4ih0i9IQrsdNdewKD4GHzQlsrdNCp/QxM1kYKQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sUGdefaUufMFgIdYE9xxYlqT4NzlwRubKQUAIW6ze+u4H/wXGsyjO6c6IuJVfMjgI
	 RgH7soK2N8g4qj+seE/gUxmWwkqQrS8khLckvV6s2T+DQIMFYXXcZUvw5IuOIFCIbG
	 rCqH0Mvv1CU6xxktm5FSapvoE/5fCKEHRj0/Dxjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 149AEF80510; Wed, 16 Aug 2023 16:05:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E31F8016A;
	Wed, 16 Aug 2023 16:05:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B89CBF8016D; Wed, 16 Aug 2023 16:05:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13DC1F800EE
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 16:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DC1F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NEjc6mlU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FEAC63D79;
	Wed, 16 Aug 2023 14:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B69C433C9;
	Wed, 16 Aug 2023 14:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692194727;
	bh=FGkS4ih0i9IQrsdNdewKD4GHzQlsrdNCp/QxM1kYKQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEjc6mlUBLa2InyCxlwS9MCJr/+1GBk2EQTI1yn5mWUCPJFRUgnRlPv1EfcDpp9RG
	 +p4kLaIbQ9Ps76p/mBmp7TgPfxnSkKwn/TbUXvrJWXxd8IfUkRdgi3owo9SS8FG+iN
	 gp9nhADVRWebs9rETkdrr2oWoUL7OHBQOA3EHIqARUhu3vHcsCQ4qp9SEgeg9lby5c
	 B2EBG2ry6+bg46kt/VgAF6JqVt0ibZJd0MfxYKJxXuOni1m6sVs8QQS8n7mCQdCiqb
	 5Q/xxBJEvbeSBgCEmZB7fIPYTaJpgOKRhUgXFqqxpEPFsTgnbYVYIxonWCA1twXAMz
	 7hIqS7nWElbMQ==
Date: Wed, 16 Aug 2023 15:05:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 2/2] ASoC: nau8821: Improve AMIC recording performance.
Message-ID: <2f72d241-7617-48c0-a0c9-86bd14c50ac8@sirena.org.uk>
References: <20230816080006.1624342-1-wtli@nuvoton.com>
 <20230816080006.1624342-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7XHR/LbWkR41hupe"
Content-Disposition: inline
In-Reply-To: <20230816080006.1624342-2-wtli@nuvoton.com>
X-Cookie: Old soldiers never die.  Young ones do.
Message-ID-Hash: B4B3QVLDWWOUFBWYFLVEJXFO5SYZV5NG
X-Message-ID-Hash: B4B3QVLDWWOUFBWYFLVEJXFO5SYZV5NG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4B3QVLDWWOUFBWYFLVEJXFO5SYZV5NG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7XHR/LbWkR41hupe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 16, 2023 at 04:00:06PM +0800, Seven Lee wrote:
> Since the hardware may be designed as a single-ended input, the headset mic
> record only supports single-ended input on the left side. This patch
> will enhance microphone recording performance for single-end.

The new property looks fine but you need to fix the build error 0day
reported.

--7XHR/LbWkR41hupe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTc16EACgkQJNaLcl1U
h9AJ9Af/XZxGppLWjNl8VmVBlE8dAbfXi2O59Rlr7fLtOb0uHm040wM3pQjywMze
8kawuRIWKzHB7KYiUvzne/FsfvYg2qHbnCIKkx9BK4n+zjxk7tMEnqpnMWgVCjcm
OzkC0mSsLjIpXMx1UYeu1qiMrRD/Cvn0RK2VOhkw4ZSyjpKwdQI/1B6+t4E3nIug
DEm54Lwkx2zC7See2ogDVuOujuHmMzZhj79GtaR3r9aKXIEaIx24BaJCofAqCMWr
YMm2piEbpMgQqilGJzLyamQWdmcMZzbAQRegTN/vnKJxT7eHkXt/YkNxG4FcrF9c
gZVHE+nrqoidze9w7rGfJUfrtWVTeg==
=jnGm
-----END PGP SIGNATURE-----

--7XHR/LbWkR41hupe--

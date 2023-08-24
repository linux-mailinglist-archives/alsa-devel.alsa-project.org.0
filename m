Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11124787B88
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29841852;
	Fri, 25 Aug 2023 00:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29841852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692916618;
	bh=Anb7sYRDSAXOxGNk2SdpCvi9OjAd0pwYmzKM0OGecf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CbVX6MMFjxOUwI3m+IgKMxQF2SQGbv5c5g3EDhqefYA14gQKZDCSo+sdWsP89XLwp
	 w74ng3mWzHAxDGnDvoVeyulW5D0uf1WEyd73vTrYDtWEHUYSi5VJZgQV8fNR1VlCZD
	 Nq/oIhoqudWYMwkOtWCyd3ZPtxQZUBZoV49Nh32o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EF63F80549; Fri, 25 Aug 2023 00:36:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0CF2F8023B;
	Fri, 25 Aug 2023 00:36:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B843F80537; Fri, 25 Aug 2023 00:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75EE0F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75EE0F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eT956n8F
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B91B360FF9;
	Thu, 24 Aug 2023 22:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B0FC433C7;
	Thu, 24 Aug 2023 22:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692916559;
	bh=Anb7sYRDSAXOxGNk2SdpCvi9OjAd0pwYmzKM0OGecf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eT956n8FaDWKUAssuFGVO+ycMTklOsrKQ6yhTBqrbIaYwq69c/a0wlGjLtrTg4irh
	 XoseSZsYCUH0dMhHGwMDAwUKPmha3P1l6z9N9Yq6YHk+OzsEpuT4Vn1I7jtKKLJVK4
	 Qv+8moIPhF6sTW8JSZ+lJLrbtPBHO6NYKv9N15k4VdAL6OqPK05+2TrY5SEfYLZACK
	 f5fu8T8mUKeP+NGQFx02+vEpGWcIMaJeW9IVEshaj1yO/4707rcLhkRBHu/uedCFm7
	 wmvU8Iu2ZhW213HIdJnOVujJ2ZhSzlUf2SyHg1NX/mMbzNTOXDSc12rcmIFoXuKBGO
	 nRmoy+1NoYM8Q==
Date: Thu, 24 Aug 2023 23:35:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 14/17] ASoC: Intel: avs: Switch to new stream-format
 interface
Message-ID: <ZOfbRvGztJsNlPeW@finisterre.sirena.org.uk>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
 <20230823080546.2224713-15-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/HxBjixn+5ztYA3z"
Content-Disposition: inline
In-Reply-To: <20230823080546.2224713-15-cezary.rojewski@intel.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: IV6GGEEZNRX2GZQUJXTIZLS6DPPGSO7M
X-Message-ID-Hash: IV6GGEEZNRX2GZQUJXTIZLS6DPPGSO7M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IV6GGEEZNRX2GZQUJXTIZLS6DPPGSO7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/HxBjixn+5ztYA3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 10:05:43AM +0200, Cezary Rojewski wrote:
> To provide option for selecting different bit-per-sample than just the
> maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>

--/HxBjixn+5ztYA3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTn20UACgkQJNaLcl1U
h9CLiwgAhIOpASyQcBKm4MptRdcELWKL/yxYRJWtebDq8CjlSSYBMTpRnfBzID7Q
o7AF+XswFGVnS8c9hY7F6ZPJOB7xj4rWI36ut7LANpfpN7nNVcEwJ1Gr1SV2RWBn
Hd52JcWhAt0u4pBkJd/EMepGyaoEzAua4gd6URDV57afmOKNsaZlaw8KTNiTfeSK
8rxG3Zy9OqVHh9/TgGfEYtnOfr61AixN7Rty8kew2E82esShxF8yvCCpwXfKoGrt
mVEwpCcw6gpUhaJPjukBWl8CAv0krYhkkTsgbBJz6Ji/Nv7gpszQNdZrZaxcCaar
dCUCUssQPS66Ml5reagrgaRjiud+XA==
=o8IH
-----END PGP SIGNATURE-----

--/HxBjixn+5ztYA3z--

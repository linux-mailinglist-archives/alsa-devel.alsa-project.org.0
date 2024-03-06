Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1BB873C2A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:24:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E67847;
	Wed,  6 Mar 2024 17:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E67847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709742293;
	bh=k3dnnDtaz/QdFgY9kxCvPf0pAwoj2MB21+fDJtJi8ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i8iItza8jVM4CY5faV3gy8OeTwT4mPcMBvyvRXtl/8jY4YDqT1dBLaS6E1O5MvrYx
	 z0SgSwQNAkHT8lwZHQn6Kw6RezFAtth34xjzqR2Mge7D7iB1qDxNCA/CXGTGPglptq
	 LC+qGL/wo7ypD5NtNToJV0CJ7CYsjdPmPgG+b/C8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B419F805AB; Wed,  6 Mar 2024 17:24:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B69F80563;
	Wed,  6 Mar 2024 17:24:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99D29F8024E; Wed,  6 Mar 2024 17:24:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41C96F80087
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41C96F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PQKKc6fr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 336E0CE2243;
	Wed,  6 Mar 2024 16:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F9AC433C7;
	Wed,  6 Mar 2024 16:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709742250;
	bh=k3dnnDtaz/QdFgY9kxCvPf0pAwoj2MB21+fDJtJi8ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQKKc6frdioHcSh/PgWUDkD/tbmbWbSCycj0XPJkNGgJd+pO/5bG9NpLlOJ6cmedU
	 BnHYEoTHj2dH9rO7cVoTn3x7XOc/dhFtBPGl4avy7lTmvGm1RK8bZ5njKXegy0bVaF
	 ULW6wiYdmj+MwQsE9lWqNXCoS4d6EZhYHK1DclrL8E1twKATZZ8ihweCLPIpG81gRE
	 RlHpK4rV0eekY6Rl078Jsg24ZRHVP6LFUaoxOiBTpDzQhaKd6lldXRLeoLm1ImnacF
	 gPbRqLefCjcIc9Q2jbyTS3moZeKjDlG4pMJIhyDJRp/gKYi5OpFSQrUtFfQWv0dtKQ
	 ISgyLzHcs6AEA==
Date: Wed, 6 Mar 2024 16:24:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Stuart Henderson <stuarth@opensource.cirrus.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/5] ASoC: wm8962: Enable oscillator if selecting
 WM8962_FLL_OSC
Message-ID: <2030336d-76e2-4966-b513-0d1dd6a69f54@sirena.org.uk>
References: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hfrzizu6LrF7Dinl"
Content-Disposition: inline
In-Reply-To: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
X-Cookie: Have at you!
Message-ID-Hash: SOPGMHBJRAPKWTTGWA4Q7ONIMQ4YHYAN
X-Message-ID-Hash: SOPGMHBJRAPKWTTGWA4Q7ONIMQ4YHYAN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOPGMHBJRAPKWTTGWA4Q7ONIMQ4YHYAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Hfrzizu6LrF7Dinl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 06, 2024 at 04:14:35PM +0000, Stuart Henderson wrote:

Why?

> Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>

Please don't send patch serieses without cover letters, having a cover
letter makes it easier to tell why the series is a series and makes it
easier for tooling to work with the series.

--Hfrzizu6LrF7Dinl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXomKQACgkQJNaLcl1U
h9AcVAf8CRujpFgMZEhaTuLhZm6fTeSR/Ns/t7vaRWxay1wCf49pk5MnkxBnQ8Zs
PQA1GzCY+tv4oR2Nchbhr9O+WiE79aWl00qPg5jGrdw9tzrhFHx6IouVyH+bvRJf
uxHSm0u6w0jIrkk0xLHYZedTmvXGp1gOmde9rpdPxWS4WsJ05bMky5l1LpchYG/e
KMH7OQPmlB1cx38gwnCgyrw5oNSZqEfJ3II4dqju+L1GuaufsYOka23zqkJQMG7S
9lGQ3YGvr04tqOdMC08MlFoMHIIfqEEi47C3LFfTOzZ3VbgKPZ+KbMDojVSMUDoq
o6M3eOl2gGZ4H/hIqX97Fp7o3zWnsw==
=epkj
-----END PGP SIGNATURE-----

--Hfrzizu6LrF7Dinl--

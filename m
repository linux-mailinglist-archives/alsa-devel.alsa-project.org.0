Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 769968513C5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 13:46:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8BF8844;
	Mon, 12 Feb 2024 13:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8BF8844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707742012;
	bh=tayDtlPlx5o6p0Re1yK3lCp2UKqcklR8YnRrrnZiHmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gMQcy6hHzYtLg4u0U0VDEBAb5biI2RojsHIsfL/2U9oiLJtd59PbOJQcwK1e8h19r
	 GZlmSl0cPxDMRAa52QfmND7UJoifSFpSd6Z49lNywwW+i8Bvt/SV9LR2U80mGQvyie
	 3LvOXQZH2RFg12kw2eU/iakRXLgX8uMhTbrpjBSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD21F8015B; Mon, 12 Feb 2024 13:46:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 727B3F80568;
	Mon, 12 Feb 2024 13:46:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E81CF80238; Mon, 12 Feb 2024 13:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39A28F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 13:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39A28F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iM92ejlz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2052860F9D;
	Mon, 12 Feb 2024 12:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D09C43394;
	Mon, 12 Feb 2024 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707741951;
	bh=tayDtlPlx5o6p0Re1yK3lCp2UKqcklR8YnRrrnZiHmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iM92ejlzhszCISkJf+x8WRaW92+r0uNWiwo7qZYTcchEJXLqLby6H8yXVhCWcbHH0
	 CtWrp2QHwG/ILgWFr5Hjm7pYnn/8D0i4IUzfFazLGn1KLteJZTi4DU32azYylR2BJo
	 1Ye5UjxGBgFHJu4MP6mOT+iEB3S8YTtbQ3gbKbncCYjR6A1DXI2udpnQO0lmyZnZRS
	 mCSDj3bAIOvrrK/uxKqV86D3WcrmN5gqMUXok2rC5ZWqv6+99uW+QY0+lrowixowUf
	 9Pjh17556hsYyjlRQhBnwdhNRabEJ5R6EXg334z4KRg7YOXuAb34/aDna6jn+0IXWU
	 prMLp5w9mr3Mw==
Date: Mon, 12 Feb 2024 12:45:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
Cc: linux-kernel@vger.kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH] sound: codecs: fix typo 'reguest' to 'request'
Message-ID: <279b1b4f-1487-4519-8208-dca5f2576078@sirena.org.uk>
References: <20240212065014.3696356-1-guoych37@mail2.sysu.edu.cn>
 <20240212101820.18437-1-guoych37@mail2.sysu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YZPcNs4IBbyjVRkh"
Content-Disposition: inline
In-Reply-To: <20240212101820.18437-1-guoych37@mail2.sysu.edu.cn>
X-Cookie: Will stain.
Message-ID-Hash: MNGK2MID2FB5BC5265ZUIPQHTXV6HW3B
X-Message-ID-Hash: MNGK2MID2FB5BC5265ZUIPQHTXV6HW3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNGK2MID2FB5BC5265ZUIPQHTXV6HW3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YZPcNs4IBbyjVRkh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 12, 2024 at 06:18:20PM +0800, Yinchuan Guo wrote:
> This patch corrects a common misspelling of "request" as "reguest" found
> in the log messages across various files within sound/soc/codecs.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--YZPcNs4IBbyjVRkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXKEvoACgkQJNaLcl1U
h9Bl7wf+IHfyDCF21Yc366dRvZpkBp65DHKrxCRC6RKhJjS91F4fgTz+ZQUSdjvg
mA7Nz1Gq5DR0dDAy5zNrFQVb6Qq2cZInJRwJ9Zv+M+6XhTlvVI+sTEa8eLL1Z2LH
wvDy2+K90gSaMWYWNbAMJWT+m3mDG1UVBKMkutSmtGQMnkHAR8RGILhApTr1MFtz
B3s8ZwiHw2LheKvEaviyO+B5zZ6BYyZJ740jFENdWfltHKNRKVCg8ly7drcBEddx
pnMKP4hhr3261pDeQPYsTmkheyxVQt4AdPvEUbdwfqKJuuNpN+mJb2MYgaDc/u+Y
KDDsFV/kjDwcqcIdlzqtpIdeQTv4nA==
=4JNf
-----END PGP SIGNATURE-----

--YZPcNs4IBbyjVRkh--

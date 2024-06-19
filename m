Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4864E90E849
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 12:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93EA3AE8;
	Wed, 19 Jun 2024 12:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93EA3AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718792592;
	bh=GkT3s/gwdbG/kwTeTbglwxWahQeec8onFjax4/+NU7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Er8PO4vhWj2YoAM0v01tT/gLruOvWgAzx120+RmtSjoJe3ojYxj26SK1bGzyDVoDB
	 KFkT9XvE2Zlo4qqu7lktulPrGEfZrTNmtNtTbmV29LQ6uaS8z8Ydet2Af5sOxZLgto
	 Bsa10U6cTc3vVeXqk75iVHQJATVZpqRUm7/xrXF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98E40F805BD; Wed, 19 Jun 2024 12:22:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 195D7F805AF;
	Wed, 19 Jun 2024 12:22:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6B62F8023A; Wed, 19 Jun 2024 12:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D1EAF80154
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 12:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D1EAF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hMOv/kFF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2351C61D06;
	Wed, 19 Jun 2024 10:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D621EC2BBFC;
	Wed, 19 Jun 2024 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718792558;
	bh=GkT3s/gwdbG/kwTeTbglwxWahQeec8onFjax4/+NU7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMOv/kFFX2Q5ThN/f7Cqi6FE3x/0Vt8xHN5dia7vFy0Zrht/2WjOKhTBmOwKT0+D9
	 Gy+xPpcNwGuUTiTnGiuOeoDbDgtOtOtKB1GtlYUMJeb7ed8kDmVDpQT8w/dJ5O5ak+
	 ZY/71wx9o49QUaYc7Lwv0E/OifW5Af1iTktjDYlt76pxqNNra047N+55tdnJoOJ9MY
	 P8t+WeKZPH7138dvPKW3xoyEgWE67X573cOWFDO4IWUKgoc1aylVpkvqJgjoyy1ztB
	 mfiZc95DnW+9gmaDKl5qoIm8IvxMvyGDEm82NNU8x4uxdyOMhyo5lloaWT7ksYCAIJ
	 xEISIpD4atpRg==
Date: Wed, 19 Jun 2024 11:22:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
Message-ID: <941d2b8a-18b5-43ad-9aec-6785f841dfaa@sirena.org.uk>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
 <fe9dd613-8909-4c7d-a7d7-9094b75fe8fb@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n72fWc0xzJrExxCe"
Content-Disposition: inline
In-Reply-To: <fe9dd613-8909-4c7d-a7d7-9094b75fe8fb@opensource.cirrus.com>
X-Cookie: Don't I know you?
Message-ID-Hash: O4PXLRFAK2RWZDMOQHNWXOUPBYSS3QXN
X-Message-ID-Hash: O4PXLRFAK2RWZDMOQHNWXOUPBYSS3QXN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4PXLRFAK2RWZDMOQHNWXOUPBYSS3QXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--n72fWc0xzJrExxCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 10:44:47AM +0100, Richard Fitzgerald wrote:

> Mark, I don't understand what your objection is.
> What is it you want us to do to get this bugfix accepted?

Have patience.

--n72fWc0xzJrExxCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZysWcACgkQJNaLcl1U
h9Dqegf/am6/c0XEVSlqtQ/cQZymlNPQfDPmGNchcXeO/m+u17TuexuuRaXkGuHP
loJ1uNc0Z0Ehe2CLdHuLBF4CjFK7nXtRwMA4hUM1/2minfPuLBHvnxYRQS1BoJFP
VWcZhXxC9kIAUzmf77IoC02URSyoUkXzKlbL+lSOYIh9oszSM8jzuGe4NLf0Fk3o
M63wFoJqKtl54qCwRIt08sxSfXRr93JFBphubMZrxVXK+Euh8CFLw2xl5C7UqbEf
PAExxT6h0whHm8ou1FhPEFvkZum05X5OUN8uKN/ZqpUclswC8Y1uRHuufT/P7Vfn
PTdF1Dwk9xIuHPLxCMqsFS6PXxaooA==
=VmCz
-----END PGP SIGNATURE-----

--n72fWc0xzJrExxCe--

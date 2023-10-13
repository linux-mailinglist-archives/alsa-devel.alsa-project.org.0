Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7637C86AA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 15:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A329986E;
	Fri, 13 Oct 2023 15:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A329986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697203262;
	bh=0j+p4gMhFdIWLnm4zbDZJedU2EzXTXnNAOs/EsZTX0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GjYNiRigyKHWnfLjXkva5Fq00K+lmGyj9Tl3ffON//UGi31eNdx69NQFNj3FKwHOo
	 Jb3EwbSriMY/7eWYx9vMciprRMoQDdkMC+1cK8RmIcXVIB8J4gVHjpJweImXFHLxiA
	 ytnAPSU8rEAc6rIsOzM1K4bMCF+cFIpTgShNLBv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AEBFF8019B; Fri, 13 Oct 2023 15:20:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF4BF802BE;
	Fri, 13 Oct 2023 15:20:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76C25F802BE; Fri, 13 Oct 2023 15:20:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72066F80553
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 15:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72066F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SBbOrhzu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DDB86207B;
	Fri, 13 Oct 2023 13:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB6FC433C8;
	Fri, 13 Oct 2023 13:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203203;
	bh=0j+p4gMhFdIWLnm4zbDZJedU2EzXTXnNAOs/EsZTX0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBbOrhzuNJFXYvdWvr2JLqh2YcVYeqqfsnnGkrOjWFufvvmfYE6wvFJwi8IVuwDiz
	 cnQ2Pc+di2bIiG9H+uYS7aCLBoNHY46IXoWPZN82JdrGCmMmsh1EWhIDHb33A8JXzS
	 GuY227xVrV7SPuIAAughRjQcpONtC5MuPp3z17Ca/OTyq6xhVbJNqckmmkVfLxYtY9
	 9ZJ6C8xLt8Z7V1fVt7XlmenJbS1iJ2wpo5Jf1WJN/irUPCGb9ePlrdxWqgLvmVgF5y
	 PXXq0xbcdhwqGernBkmEd/gkg49VnXZza5ny+JYDvd/b3rj28hOckLTQOpMPEqKZGe
	 dN+Y60iLxEYEA==
Date: Fri, 13 Oct 2023 14:19:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v6 03/11] ASoC: fsl_asrc: move fsl_asrc_common.h to
 include/sound
Message-ID: <ZSlD+vP0+yCWmB0B@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w0UFSr9I7Wnpnjus"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-4-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: Y6UGGQ6ZJPN7WJKWKB2TONLVDI46GIS6
X-Message-ID-Hash: Y6UGGQ6ZJPN7WJKWKB2TONLVDI46GIS6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6UGGQ6ZJPN7WJKWKB2TONLVDI46GIS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--w0UFSr9I7Wnpnjus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 04:30:57PM +0800, Shengjiu Wang wrote:

> Move fsl_asrc_common.h to include/sound that it can be
> included from other drivers.

Acked-by: Mark Brown <broonie@kernel.org>

--w0UFSr9I7Wnpnjus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpQ/kACgkQJNaLcl1U
h9DFGQf9G4UAk1AJO176S6OyBU/9FH3l2Jy9leYRRBkjLWEV2Var2mAPe54QynuS
TBmYeaLGyBINIrPr0lIhRJhIUlR6eVwWSQoKQv6yJpmmcrWw4/NapZgeETcMLkPw
Uil1NJG9PvURiCX+hg1Z+46ctP4pfhD+n6LNyFofy/tmQiHgzy/kdgGCbyg+hiRR
55OhU/8M8R8uTwmPC5ZR2/gEZHzp56V2vX9Gn8jZhduUZNTNZrthPMM5GtjPj2di
A1AEb1vPbwJNllKmRd/wMn3ZsW62dQYQiboRj5jFq+HOBsa0nEsTmjTfKSc2us3m
TMscXvWIRjSEHcy+Hq+nvn+FO5C6eA==
=P3BV
-----END PGP SIGNATURE-----

--w0UFSr9I7Wnpnjus--

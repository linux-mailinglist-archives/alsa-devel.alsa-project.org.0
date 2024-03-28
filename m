Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CA9890942
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 20:29:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748FA2C9F;
	Thu, 28 Mar 2024 20:29:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748FA2C9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711654181;
	bh=Nw7UVEH0a9tRFeHtk6dToEX6iVYCsePji0jVeTefwOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pchFH5hTVn4MQ3aXC3sH7HO0KQqfBz0quXrSdxjJWouXZGcvTwtQhy/pQ5HfNgzmR
	 yvnw+071RM71iDFFlp4Z8w9Thb7Hh/CKXkSnOK4sa5+WFG+o4Eand5yLyOtuvuoPj1
	 Kd7efXlG7zEtSja/FoDj0EpqLiQrRnOYiLLVkpiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52F47F8057C; Thu, 28 Mar 2024 20:29:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE020F805A0;
	Thu, 28 Mar 2024 20:29:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01A38F8025F; Thu, 28 Mar 2024 20:29:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31E9EF801EB
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 20:28:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31E9EF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W5O94yj8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31A9CCE2CBD;
	Thu, 28 Mar 2024 19:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C8EC433C7;
	Thu, 28 Mar 2024 19:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711654129;
	bh=Nw7UVEH0a9tRFeHtk6dToEX6iVYCsePji0jVeTefwOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5O94yj8jgo4OfsZ399hf3ZeVZFmihwlUWFwgqs8GpT4QyL8UeSlb4Z5kzFU6JWzp
	 to2Ukwwl6F/oSvjgjn4jsfCLOFrlGwSVrUjRTMaxOnMNkz2tJL12uavg7zNxkz6CoI
	 m+tq48/mYyYDSwRi0Xgt25Kb4VzEM0W21P/nMzgLAsfPVTrmTLl5batE5Yx1Qe2DHz
	 KA3r4sHbMDKW9DxVQ44PLSVgHa1SHV0F9AHEDCsXnB7WDUZYo/AY19/Q05Xz9hnhLG
	 LhFfy9tZ1xbFJ2IEtfaK0c8RgjFA1+NLhYM8YF+0nFKavBjCsXQ44c/FrcPibW2BTx
	 d772wANjHfR3g==
Date: Thu, 28 Mar 2024 19:28:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Lee <slee08177@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, roman.gushchin@linux.dev,
	dennis@kernel.org
Subject: Re: [PATCH] ASoC: ops: Fix wraparound for mask in snd_soc_get_volsw
Message-ID: <ad9088ab-cd55-4c59-b0af-65e44475124a@sirena.org.uk>
References: <20240326010131.6211-1-slee08177@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fcY7Zu6uSdocuvCO"
Content-Disposition: inline
In-Reply-To: <20240326010131.6211-1-slee08177@gmail.com>
X-Cookie: Yes, but which self do you want to be?
Message-ID-Hash: 6T2C47MX2DYBDV5UHOAI6XDWTY2KMKGZ
X-Message-ID-Hash: 6T2C47MX2DYBDV5UHOAI6XDWTY2KMKGZ
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fcY7Zu6uSdocuvCO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2024 at 06:01:31PM -0700, Stephen Lee wrote:

> This seems to show up in quite a few places in the alsa subsystem,
> should they be addressed altogether?

Probably worth it, yes.

--fcY7Zu6uSdocuvCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYFxOwACgkQJNaLcl1U
h9AMpAf+O5E+hqTgoIg1rWfMJgpCMlfl5IMhAkNW2/BrrNnRk7dJokixpLb2HEIA
PC2lh4j5vfmmGRtwF0SDdIrNuGAkTR5OGwm5wei4orBmS1HAVhBlu/+n85pBhG99
WyQaaqLdzMii5PZ3xLB82bh+mRJF0jlvb/3wLkzDKqF9F3sssPgNOXXihZ2O1K14
+wp5O0xoF0DYqsicJKEgPxTNU6GmW/ONkKuIeVkXGhTXnFQcbHGJ+nQzYzAIaWsC
9b/+Oyn2s/6+qTM17dPiPrLhKvz6AZ5N3zaA3HplS+Nk/Mxq7vHcVfwb2NyBL+CS
S9nQgr9W+PbToigTz3mN6t8tCL2lIg==
=E4V/
-----END PGP SIGNATURE-----

--fcY7Zu6uSdocuvCO--

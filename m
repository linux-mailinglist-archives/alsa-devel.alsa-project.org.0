Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA954750D39
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 17:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE5A8886;
	Wed, 12 Jul 2023 17:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE5A8886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689177330;
	bh=6i7Y4lQ5kM2O35VpIsKle6TMvXVfixvr1cKHxKvRKXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DFNRC6QnphK93zQW82Sqm5X1tVsrYAJrmlC+QQJ55ptN+Sn/lZ36WPQHineYAHpqn
	 PVvZWXx0YZB45qXaOBVnrDrKacie/dqG0I5ktDHCjNnJ1J295lqIY906PmE6LTNyAQ
	 J67GmDUxeOFe6QKKgiyZb78+zpN8pzP2nwDezX8E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91ADAF8024E; Wed, 12 Jul 2023 17:53:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 108EBF80544;
	Wed, 12 Jul 2023 17:53:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32DC2F80249; Wed, 12 Jul 2023 17:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAE1EF80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 17:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAE1EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HyLMdkVD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40DD761873;
	Wed, 12 Jul 2023 15:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A1CC433C7;
	Wed, 12 Jul 2023 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689177223;
	bh=6i7Y4lQ5kM2O35VpIsKle6TMvXVfixvr1cKHxKvRKXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyLMdkVD4F7rnG2PftNw8LtDgCj9djEt4RoA062Zm0ylTmA3goW8U2wX7ja3mzPYk
	 x2suxPH2oKbc9FXrdM7o9Q225rzsjREDDcF9oP14pODw9qeXDHZSwP3nbq2JnTgp3D
	 TloY6w4lO3SCQB7jvcoome1CHVtDSkrapIGdcibHPlqaIFgFhBGg7IvBIAlAbK5bH9
	 qwuC6d7JlmunWaN9Qn+61xy5oo9ycoLvWdFc4gfB3aYlTxr4ZPtF5erYBPzCX7oZJ/
	 YsSvs8nCBvDP25GSOs8Ye5v63fmXY/36lpvEe/+qWJb+rs4Zn0e7HldvRrG0ntzE21
	 UVO5/V6ByRLpg==
Date: Wed, 12 Jul 2023 16:53:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] selftests: ALSA: Fix fclose on an already fclosed
 file pointer
Message-ID: <03293bcf-7193-488f-9897-5d96790db55d@sirena.org.uk>
References: <20230712140122.457206-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVNsGP+PGG+ocxCF"
Content-Disposition: inline
In-Reply-To: <20230712140122.457206-1-colin.i.king@gmail.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
Message-ID-Hash: YH6N3IQM74IEUHTCFFC4SVWET2FP4KTL
X-Message-ID-Hash: YH6N3IQM74IEUHTCFFC4SVWET2FP4KTL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YH6N3IQM74IEUHTCFFC4SVWET2FP4KTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wVNsGP+PGG+ocxCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 12, 2023 at 03:01:22PM +0100, Colin Ian King wrote:
> In the case where a sysfs file cannot be opened the error return path
> fcloses file pointer fpl, however, fpl has already been closed in the
> previous stanza. Fix the double fclose by removing it.

Reviewed-by: Mark Brown <broonie@kernel.org>

--wVNsGP+PGG+ocxCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSuzIEACgkQJNaLcl1U
h9BkeQf+PybKLN8z4YJie7BNQAYU4xABABxmQKw35R+xYMirTAbNdSteSQV3JRql
i2Z6aQ2e3HTAgx3tXQ4bgpNQrL4Lcz48rJAfMda0RBKReuIz1LfTW3d9ZoUIU0Lb
qYpvkL0Vjf0au1c1nRU6n6eb2ahu7VlJHgChwdB6ueOpBTKLbfpucVvt+dy3X5hJ
MbhkO/cs8jcOvyuzHZB6EjPHcPq1vr2zukAsTzmM0xZ5yxGFhewHpS+tPg7RjGwt
iC+4rv6dD85ZakRYIO5hYkdQhzIy9pOiuvE82+FGyaLSjnPOlwNAO444OHsWtiQ5
2CIxOWF/BIbsTJt+m2zSXOWZ3X8Mhw==
=spEy
-----END PGP SIGNATURE-----

--wVNsGP+PGG+ocxCF--

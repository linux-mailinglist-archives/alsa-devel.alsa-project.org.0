Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456A90504B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 12:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE13DEC;
	Wed, 12 Jun 2024 12:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE13DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718187608;
	bh=2pp2Sjb/QpY6CgP8p3SLRpy7RO9RffL4SAxvnbN455c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=syCrP01klm96EtPOSznVkO5GhNBgIexdx2Lcxp9+WrHDGIAu8sJWRvEvTc6JD9y59
	 b2DJzbYGV7WQjI82iRdHE0pBJ1SLzrxBV4erxWfBinAZvF5/anYntBRfyx78GkujE2
	 CWdRnHBSpRBFEKuyDbyNi5ZlN1fwkXHblvS2buJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D3F6F805AF; Wed, 12 Jun 2024 12:19:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F73F805B3;
	Wed, 12 Jun 2024 12:19:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C42F2F80580; Wed, 12 Jun 2024 12:19:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5459AF8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 12:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5459AF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bQaeT1AB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 82DACCE19FD;
	Wed, 12 Jun 2024 10:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E53AC3277B;
	Wed, 12 Jun 2024 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718187542;
	bh=2pp2Sjb/QpY6CgP8p3SLRpy7RO9RffL4SAxvnbN455c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQaeT1AB2uRS3lhsBP8uQkQ4JQbcRrG8FBYSN6WND1PvDdutv63iL/30vjpoarwDA
	 jumJQxTptkCnEY1ju4t5glnKEQ91wbDDM0W5QjmkTocssrmRWfGn+KAlzTvs2R+OCz
	 yfav/WhF1FJvO+aocqJHT66kZu/kThh+LEGgQAt7QyDUXb9ZF/I/eegRjeXOElanr8
	 1HrfocH0E8rg6lsgXqqfXJzLf0mAZH7UMfeUyQbV9JEb3FnGUmPN79VhVj+apzZwdv
	 mifB928AonFd79TrNADuo8gFTvbgpbEF3cSYYw2nIBaqE1Oy1c6zv7Vk5tl3y+OQ24
	 2KtQtCw5zs+Hg==
Date: Wed, 12 Jun 2024 11:19:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI
 is hooked up
Message-ID: <Zml2FfjbO4Vgk0jy@finisterre.sirena.org.uk>
References: <20240611145746.1454663-1-rf@opensource.cirrus.com>
 <Zmh3VmRfGEU6pGps@finisterre.sirena.org.uk>
 <36219997-397b-4a26-96ee-7527fb6eb024@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZyARGDXRBReq3B2w"
Content-Disposition: inline
In-Reply-To: <36219997-397b-4a26-96ee-7527fb6eb024@opensource.cirrus.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: SSF4HIHJBZQ5KNF5ARRST33UWBFJJ37W
X-Message-ID-Hash: SSF4HIHJBZQ5KNF5ARRST33UWBFJJ37W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSF4HIHJBZQ5KNF5ARRST33UWBFJJ37W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZyARGDXRBReq3B2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 10:19:06AM +0100, Richard Fitzgerald wrote:
> On 11/06/2024 17:12, Mark Brown wrote:

> > This doesn't seem particularly different to any other unhelpful chip
> > default, I'm not sure why it'd be so urgent that we'd hard code a

> I'm not sure I understand the objection here. Are you objecting to the
> patch itself, or that I marked it as a Fixes?

Both I guess, but mainly the patch itself - we generally have an
extremely high bar for setting defaults different to the chip defaults
to avoid issues with differing use cases.

--ZyARGDXRBReq3B2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZpdhIACgkQJNaLcl1U
h9Dpngf+J2Jih6an19izkqDx/DWBL+NSyvVWEBmPw/+20KHVMdXPbMmyFH0ncfiI
nVtt2Ojsf3LSykVxbutLUD7GfB3xrSICPfwEbgVuPuW9RQ7bxSz7y3YkIjSl6TpM
69xpoWaTLRbfN8UuXiDT7wcjGFhGLHPAgSlet+K1uJmSaSVZE5eR5ELfhjLrszsv
ic47Dn+txdqx2zfr+XKqBfJPk00mqGfRyOcsm7HMIi8L8tz1jIU32uagmgzEd61r
qVE0RB0DwCREK+AYukDi4+aVsaYHZRhpjLI+R5c/JKpoLRigvlr5UJ0pd9+GtUB6
PHV59zLfLQEvU+SyaON1qUDB+aN/bw==
=+MLc
-----END PGP SIGNATURE-----

--ZyARGDXRBReq3B2w--

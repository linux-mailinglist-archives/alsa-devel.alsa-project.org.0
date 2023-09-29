Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 517107B3299
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 14:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90650A4A;
	Fri, 29 Sep 2023 14:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90650A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695990719;
	bh=k3xWL1SFzzzjKlskAbPdlYIiwuzG0dgQRnQciFliyZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bw28uRZ/aPjypORKc+ZUqt97HY8HbnzWgj31yLqjIVjO8+MECPB0mmaaqP9SDTnlT
	 0jb23qjY97S5nbTUn5W385o6BKKQW3yNPOZ1DMYWOf80SeR9mXKKabz9H9Z+vISUc4
	 31qUOpBzt9sO9CgK2SAPEbieltSMwPoy92SKyA/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15ACDF801D5; Fri, 29 Sep 2023 14:30:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3916AF8016A;
	Fri, 29 Sep 2023 14:30:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A46E9F801D5; Fri, 29 Sep 2023 14:30:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FF2BF8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 14:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FF2BF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UsFiaWZ0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0A930B81F2C;
	Fri, 29 Sep 2023 12:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E140C433CA;
	Fri, 29 Sep 2023 12:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695990622;
	bh=k3xWL1SFzzzjKlskAbPdlYIiwuzG0dgQRnQciFliyZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsFiaWZ01OsYHejI1JkrdrSdiXnrA34eD8/7ewtFU0nwJODMuynMHcdkOjJkzu/Kw
	 wKxCnLIVDoF6BkygQ/KosW0oZck0r4ha6LJ9NGGctYSioHQs0yNvnC30yQq4OnqUqR
	 YTJ3lffhnRDOHTzSBcVgQfD4ZxfLO2RJAdGxILqI0fKB0Kq0uMUbPDZq1GK/AHV07P
	 drywp+ZyiiHKANwtlZgwsmCN9jOxi/NoeqfvNmqmhTsWiuYizPLVQOMpLEJrlq9s6F
	 I5UEqFrfiBdW5zRe0c1NuvTyFxhvAQ+KXMpVIgfZirGoIdQKuOcC5+5tRjcgM10CWe
	 67/0pMjYjH9qQ==
Date: Fri, 29 Sep 2023 14:30:19 +0200
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Weidong Wang <wangweidong.a@awinic.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] ASoC: codecs: aw88261: Remove non-existing reset gpio
Message-ID: <ZRbDW3OiAYyAkWgN@finisterre.sirena.org.uk>
References: <20230929-aw88261-reset-v1-1-fcbce194a823@fairphone.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SD/a1hNMLsiCOH6n"
Content-Disposition: inline
In-Reply-To: <20230929-aw88261-reset-v1-1-fcbce194a823@fairphone.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: Y227SRVLUMTELWIKZ5DACLNLWPV47V4J
X-Message-ID-Hash: Y227SRVLUMTELWIKZ5DACLNLWPV47V4J
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SD/a1hNMLsiCOH6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2023 at 12:28:10PM +0200, Luca Weiss wrote:
> According to the AW88261 datasheet (V1.1) and device schematics I have
> access to, there is no reset gpio present on the AW88261. Remove it.

That looks to be the case according to

   https://doc.awinic.com/doc/20230609wm/c815e155-60b7-40fb-889b-676b02e67d0a.pdf

(which is v1.5 FWIW), Weidong?

> In case this looks okay, also to the driver author at Awinic, the
> binding doc also needs to be updated to include this change and not
> require (or even allow) the reset-gpios anymore.

It would be easier to just send the proper patch to start off with, no
need to resend if the change is confirmed...

--SD/a1hNMLsiCOH6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUWw1sACgkQJNaLcl1U
h9B3awf9Ecjx0vZgr/DmTAk/ErHXnQYhrO7285dekc9QFcjY+deZ/HNdhv98fNQF
POx/4M6ic1tLfZQQBH+DV+zxHESvr5whmSjSfBpFvMMmmjEIvJajDf0jo/Q6nCXq
esnxJDQo+qlpn0MZr4rxwcXiBd5FfJNRrzdCWHMzwLd2IVC7YIpPAw7nSZA3Anss
xUNnH8KLKLJPSTGuqLOZkAMTVo3hcdXKUsNTWxZTCAQ4Z3b/gFuT9vw86zwqScar
CnHuMsbt8UQqEkU3Vt+wREY1chTTtqb0xIYzaXCbQpA0XRDPhmRG1IbFTJxhaQMd
/7nwPkI012VOvqWlWJcuv2pKe7zFQg==
=R6nY
-----END PGP SIGNATURE-----

--SD/a1hNMLsiCOH6n--

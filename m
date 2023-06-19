Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A373575F
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 14:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C4D284B;
	Mon, 19 Jun 2023 14:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C4D284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687179206;
	bh=evzXjqykLJpa/jk7Z11zzGkf5CL0rvp1XIsU1rTXJjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W/SARD+mQeoSCuDULK0PPo2c72/KdNe254torj71VUX/uJEKvVL8zJ1K8N4RSYexU
	 maIchTCGF3XKmVO90CJoyRs2WLC7ISg/9MEW2LnrdXwTxLfPLdY7TywTUFFfq/GTZV
	 OsAufq27mLkXZxC3RFOLnXNPEJPpbKirMOh8phW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4C98F80448; Mon, 19 Jun 2023 14:52:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D23F80130;
	Mon, 19 Jun 2023 14:52:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B5FDF80217; Mon, 19 Jun 2023 14:52:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E70EF80130
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 14:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E70EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=txQF4YOE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3087460B4B;
	Mon, 19 Jun 2023 12:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48B5C433C0;
	Mon, 19 Jun 2023 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687179145;
	bh=evzXjqykLJpa/jk7Z11zzGkf5CL0rvp1XIsU1rTXJjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txQF4YOEd4JA8cRgdtbOCqgWqNqqWoId1BvRMrIRUnBuoVOsPo+zii212o42ejSan
	 /Fj9yITMJZd0RH766sbRT+h9/oFiljopqL4PaUVxPH55yOhfNDPlSiRk9J5b7O0BqB
	 vYelj9D3TysHqM53y2g8I9sK8/cg4ugF5p3w8mGkX4km/LNbmVwJ3ar6eRYj0U/vrC
	 FlAutTHo7QMHPXO5kMpCXoxaXeD1Y7GBh0c6BOkLyxCQ9NToLX9VA5OjDYCtL1tON5
	 fvIfzAyhkOeq3mjkOQ4jw+99sJQ1+AUkosTzIfNJiSt2RQhoJB6Qc/H41pdB3EOjFT
	 2NVqGscQUoZGg==
Date: Mon, 19 Jun 2023 13:52:20 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
	mario.limonciello@amd.com
Subject: Re: [PATCH V4 0/9] ASoC: amd: ps: add SoundWire support
Message-ID: <95fa602a-72fe-4a5c-b31c-714960904acc@sirena.org.uk>
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
 <5a397996-beb6-90ec-979c-22c4bfd7dcf3@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qnEPjZQEnLBbnqB2"
Content-Disposition: inline
In-Reply-To: <5a397996-beb6-90ec-979c-22c4bfd7dcf3@amd.com>
X-Cookie: Prevent forest fires.
Message-ID-Hash: ZEPOYYX63CB53ZHTN4VJ6Q5N5SI743AW
X-Message-ID-Hash: ZEPOYYX63CB53ZHTN4VJ6Q5N5SI743AW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEPOYYX63CB53ZHTN4VJ6Q5N5SI743AW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qnEPjZQEnLBbnqB2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 11:02:52AM +0530, Mukunda,Vijendar wrote:
> On 12/06/23 15:28, Vijendar Mukunda wrote:

> > 	- Fix build error reported in Makefile
> > 	- rename "sdw_dma_stream_instance" structure name as "acp_sdw_dma_stre=
am"
> @Mark: We have provided replies for upstream review comments for V4 patch=
 set.
> We are going to push as supplement patches for minor fixes.
> Should I resend the patch series?

My name doesn't have an @ in it, please don't add one.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--qnEPjZQEnLBbnqB2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSQT4QACgkQJNaLcl1U
h9DtHgf9Elo8fVd0fYjNq1P3EzlGje5Tu3T4l5k1cYduTJkwXc0DaijYZHkr8zVr
2adUwgkiZQywb1bgA61/T88ZsmaY4TO3/g2cNR9pPTRwkROD3lEs6xO+lBXTYuBa
AYdUKX4To0qvZNuNt/EJ+lc9ihnd2XgjAabDIw2005k9r31H28/HXpzQYtX9OQDc
w7V1rwUSRg/LmGUZOERmH+qWPSs+sz0bvVBVjY6EmtB6aggqdidGT2zt9Aw+A3WB
EBJ0igQQxxl5BcHwoAbVeNbxMRv45/9d2iDjZGnp9O1H7HxcKeYag72fhUUQE9Nk
LuQG9T9c+IewIaA5i1PVkL+/sMaotA==
=Thv4
-----END PGP SIGNATURE-----

--qnEPjZQEnLBbnqB2--

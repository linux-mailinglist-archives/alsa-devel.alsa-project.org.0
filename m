Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE19BB476
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 13:17:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC15986E;
	Mon,  4 Nov 2024 13:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC15986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730722638;
	bh=2q5cM5jBgPwB0S1xjxKGbk0Ij/bx8viMdMSL73+1hxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=APnDEmBiQsoOJ7ex2qQmy1nJ2h+/f4yIamviJBX4u7QDTcbl4MJ42tffLtRoAbowq
	 a9jvGfcN5cN8CMT+aEkXmO9KrFqmHykGOuv3ABM0OGWMSk9iJ1ZVUT5KT4utJ1j6eW
	 8D9fhw9yWlQ+cUvSXiLgXCax53/zvus3uhvvOiDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48716F805AF; Mon,  4 Nov 2024 13:16:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B430FF805A8;
	Mon,  4 Nov 2024 13:16:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F099CF8026A; Mon,  4 Nov 2024 13:16:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CD6AF8014C
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 13:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD6AF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ISYXWq50
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D09385C559E;
	Mon,  4 Nov 2024 12:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD52C4CECE;
	Mon,  4 Nov 2024 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730722595;
	bh=2q5cM5jBgPwB0S1xjxKGbk0Ij/bx8viMdMSL73+1hxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISYXWq50pkwY7IaQdLnqnQ6LvPiNyernU2Y9U8ikMDdaBY/QUiNnbnJaAjDHFHbE7
	 2FTHnBZPsWJFGKCeKpc5tiYQjPPxEh8sgbHbSJmJOpl0SNguGBm3ALc4bmaJUkQWoe
	 slpJ5z/q+IRU5Yfof5et6OVUeCw4mAOiMXana6Xz1YOLvt/QLwegp8PWVr8cgNR3YC
	 JbviL7aHu7oMmJsgdV61397zHvO33QupWW8n2/Q+u6As8aPZykV7hwN9T7evw/rldT
	 N0tF1yyvtaf6GTzIDzDiPvA5wraIjCLUKNMA5L+y5gEplnCJF0BKLFDJ2K7Qkd4seK
	 dR1QNONAnfuTw==
Date: Mon, 4 Nov 2024 12:16:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	LKML <linux-kernel@vger.kernel.org>,
	Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Emil Velikov <emil.velikov@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
	syed saba kareem <ssabakar@amd.com>, Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Fix for ACP SOF dmic tplg component load
 failure
Message-ID: <d53810ac-a7f6-47da-aa12-0562ed565008@sirena.org.uk>
References: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
 <e1ac11b3-b746-4564-8daa-3527aa13e348@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kTb8e3B9zP668jr+"
Content-Disposition: inline
In-Reply-To: <e1ac11b3-b746-4564-8daa-3527aa13e348@web.de>
X-Cookie: The meek are contesting the will.
Message-ID-Hash: QSM7EFUV4TCSH2SPKFHOHEPGVFPKFCP2
X-Message-ID-Hash: QSM7EFUV4TCSH2SPKFHOHEPGVFPKFCP2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSM7EFUV4TCSH2SPKFHOHEPGVFPKFCP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kTb8e3B9zP668jr+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 10:35:23AM +0100, Markus Elfring wrote:
> =E2=80=A6
> > As SOF framework assigns dailink->stream name, overriding stream name
> > other than link name causes SOF dmic component load failure.
> =E2=80=A6

> Will another imperative wording be helpful for an improved change descrip=
tion?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.12-rc5#n94

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--kTb8e3B9zP668jr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcouxsACgkQJNaLcl1U
h9BKcAf/TNNGFpwVuNpRbVlSMez8V2eMkz5wyQajdqcAKWhgfpA4LjxqXW/f4A1g
ZEHgOPg7WdSnazsqaI/t/q8JOj/j7S033Cw1z6RGT/pXs/CnYnlbi6NSeSSXaUZ9
vS6ouSn/2qdgqePwSAjcqMUYS5bEHlkI5iBIGcBAugKcBK2W0VI3s679ss+Br83m
+3CHGp4XNiV5LKQyCx948EItuH3d0ncdxTPjgyTUQiPz/WeT9s3xY/TAShRPaB1s
vt+hfxCNCttGrKtq4+iTNc9l63W2B1cxEjrGrc8WO7Jy7QzDu4RN6boru6xJng7o
NVY1DEAQ2MYP+8N76znghsRRZkPYrw==
=9nQZ
-----END PGP SIGNATURE-----

--kTb8e3B9zP668jr+--

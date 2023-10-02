Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BFC7B544D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 15:49:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C71F0E79;
	Mon,  2 Oct 2023 15:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C71F0E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696254569;
	bh=bbYKXZTl9YSdySAEA++jPVV9QQyRDBWMWVktu8dI+gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hMrcZpGyoTFcGhbQfHbzbbhjcWNiqKtLrgcsXgaT/3rUrFo8Gt1s6pmFExf5z3qWJ
	 JXSFUC0TLMo/08Bn8VoH9sV58rlD6ygZ0Hpb08lotxUbnUnaKb77GpuAH5NOLyFVjH
	 j1lvlTmmiqAkXsGQwsFKwnAsD5ewAwcHirBE9EFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 663E4F801EB; Mon,  2 Oct 2023 15:48:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B60F801EB;
	Mon,  2 Oct 2023 15:48:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A419F80552; Mon,  2 Oct 2023 15:48:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CB8DF800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 15:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CB8DF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qDxkhaSi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3163860EE6;
	Mon,  2 Oct 2023 13:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D613C433C7;
	Mon,  2 Oct 2023 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696254479;
	bh=bbYKXZTl9YSdySAEA++jPVV9QQyRDBWMWVktu8dI+gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDxkhaSil/n9GhT+RwXlX5YqDYkw46UgUqPMJIvq+FlwnKpxAFAQ56hCrrVZfaNX1
	 FznHYoFC87kGxr0xhsr96G/aM9IwqjSzCmurcSJ3mbx8Lpb4MMuT9G7D8gXT04VEgN
	 w3oOGTWrA1DxfF2+VXijB9iLu7dhuFI1mwu771sYMKmpib3ewEtfNfFGmYfiKQ3CIW
	 PiIgVRA9akXzzz0oIpcmaaKcZbyTckf6XCWhWK4A0VnxWyuTsMosbwsPKmhZvqWIZ8
	 Uquy4WIbZVCdUye+eFhRJ7/AemMnYXaIKpA82G5/Oltud8ey6Ht1dt8gjslzGyVAll
	 Cgb+dGCruwoFg==
Date: Mon, 2 Oct 2023 14:47:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	mario.limonciello@amd.com, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Message-ID: <37101767-9bca-419c-9ce5-92c4c1360c81@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
 <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
 <4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
 <541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
 <64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
 <65KW1S.A6C8VBV29YCM@gmail.com>
 <89698b5f-a616-4f49-802a-21326a868c7f@sirena.org.uk>
 <9XKW1S.IRRCIDM08XWX1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rV9cXJVA+sC7cXdh"
Content-Disposition: inline
In-Reply-To: <9XKW1S.IRRCIDM08XWX1@gmail.com>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: 6YMDFA6AV45DBJXJQIDPGCTCDF7JQ3WK
X-Message-ID-Hash: 6YMDFA6AV45DBJXJQIDPGCTCDF7JQ3WK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YMDFA6AV45DBJXJQIDPGCTCDF7JQ3WK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rV9cXJVA+sC7cXdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 02, 2023 at 03:17:33PM +0200, Sven Frotscher wrote:

> > We need to know what magic set of quirks makes the thing work.  Are you
> > saying that your patch doesn't actually do that?

> It does.

> Maybe the non-quirk check (ll. 395-403, seems to be using ACPI) is too
> specific? But I'm a bit out of my depth here, so I can't investigate that by
> myself.

Like I say it's all just guesses without someone providing information.

--rV9cXJVA+sC7cXdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUaygkACgkQJNaLcl1U
h9CGmQf/Vc1+y1dKGunpBhuliT2pZe10C87on6X9xclHZuRaeHgIR0yc9BkNFk+c
CYPJbCQnlKHIFMGijfyRVPuxZ31YhpjpDgCPn7i4fUVAvpN5n/AJm2TuDP1mZJk3
TrbnQO5ye2tPA3XPgdRCgtX8B/PrhD5c0mp38mwOqlYRGq2b5/FdGGOpe47snler
L2l2AHSX64vLBi/PxUyHSIIok2M1QpJSCobqdU9sUIYOTMWm3QXpxO9DfLcpFyXi
k55bVdm4PEOPxqOnP1QmmSWEUjjjHTHWEZ9vTHUrB1zb/tCYgHpuEnFPs5zKKp/5
eUFQoE/I/ymdnkka2oDtQmmFjeAZBA==
=MCug
-----END PGP SIGNATURE-----

--rV9cXJVA+sC7cXdh--

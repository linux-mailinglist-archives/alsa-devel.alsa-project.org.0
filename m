Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F031C9DAC8B
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2024 18:34:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 073022BCE;
	Wed, 27 Nov 2024 18:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 073022BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732728841;
	bh=BQh27LKzhiRLJMzOoMEdsd1yUoXl8z0wlylntXevl3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EqEzhxv1Kg1qEV57bZ/QXMRVwdQPdKa8iqONp5mIqaxwgoZogVvD5kBYbj8Nu9nmj
	 CRmODx3pUn6nKaT8kRJqFbX0MlnJDXAr6Ou/kEu/LPgWBUv4Qv9hj1oujQSE+0bPZS
	 oxlnWQ/vf0KHMZYsvzyT/Q4rp3YJESWmkviNBZFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2C08F80588; Wed, 27 Nov 2024 18:33:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EADCDF805BD;
	Wed, 27 Nov 2024 18:33:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30933F80236; Wed, 27 Nov 2024 18:33:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52ED9F80134
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 18:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52ED9F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TxmS0+WO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B98135C58FE;
	Wed, 27 Nov 2024 17:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8B8C4CED4;
	Wed, 27 Nov 2024 17:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732728799;
	bh=BQh27LKzhiRLJMzOoMEdsd1yUoXl8z0wlylntXevl3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxmS0+WOLVHY5eS64570cFiWbtecRgJKcin7yobRxnJX/a580Kqw0Atd/lZmjAJc2
	 YXnJSpvUADMnz38GxD9HTv8ou1DLwPO26w43Q8PPJS+3WL0P1PNjztaRjAo+AOJxza
	 vBPqNIbijVuuLwk+v+hU8XzE44wEQvr/CaB2i4hHCZsYUIeJ2Mc+Gb1WfNlGOjcdqr
	 HcZJpxU69De7uK4o7AzfpwgHVPwZ7Ga6BpP3VgaRuLFGzqi62E8QGk/B8aPb9lffvM
	 tozY/K7Fq85i6mjOl61dPRkM67QXfUmTXksD/K0V7XBTBLCCIqautEtJaH2pWVjmKl
	 C/j6Y1lmxTMOQ==
Date: Wed, 27 Nov 2024 17:33:13 +0000
From: Mark Brown <broonie@kernel.org>
To: potturu venkata prasad <venkataprasad.potturu@amd.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
	mario.limonciello@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tim Crawford <tcrawford@system76.com>,
	Attila =?utf-8?B?VMWRa8Opcw==?= <attitokes@gmail.com>,
	Techno Mooney <techno.mooney@gmail.com>,
	Jeremy Soller <jeremy@system76.com>,
	Malcolm Hart <malcolm@5harts.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD
 entry
Message-ID: <7291d216-59a9-4a99-af74-8789b9426916@sirena.org.uk>
References: <20241127112227.227106-1-venkataprasad.potturu@amd.com>
 <a6036171-2dfd-4296-9fe4-242c306e5449@perex.cz>
 <021436ab-8035-4c56-99d5-c478075e6add@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lQFgnXmO0PqXf7EH"
Content-Disposition: inline
In-Reply-To: <021436ab-8035-4c56-99d5-c478075e6add@amd.com>
X-Cookie: Every path has its puddle.
Message-ID-Hash: 2PCR7UNTEGOUTEYGKUB7HMAE6FPIHUNK
X-Message-ID-Hash: 2PCR7UNTEGOUTEYGKUB7HMAE6FPIHUNK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PCR7UNTEGOUTEYGKUB7HMAE6FPIHUNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lQFgnXmO0PqXf7EH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2024 at 10:34:32PM +0530, potturu venkata prasad wrote:
> On 11/27/24 18:06, Jaroslav Kysela wrote:

> > The logic seems wrong. The overrides code bellow won't be executed when
> > ACPI _WOV data are not set. I think that it may cause regressions for
> > some BIOS versions.

> > Also, the return code should be probably -ENODEV.

> Okay Jaroslav,

> We will correct it and resend v2 patch.

Given that I applied this before Jaroslav's review please send an
incremental patch that fixes the issue.

--lQFgnXmO0PqXf7EH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdHV9gACgkQJNaLcl1U
h9ArZAf+N5l4lAUmsCWhAQ0BxUbpe3RrQEtejxCILmg0QFcir8MVPxlmCMGDbNxX
eoGwEbxjJJcTILesjLHUEYH4lcwvd6qKQLdqQ9lFRcUyaJrjooalfrhoHYt4O+0F
3YgMfWlyMpbPi3E3QsGIj752IcNxEyn5a+s5Y/NMWAVWeVO3dB9nfi6A5FIkmFAQ
Za6VtF3rlmfpxo8MDpbGZvukz9f5ak4XCsfFBsJjDGqJfalYqJqi/R7XV+FsXDvH
hGaq5iSHviLu75d5U/gH+Lq+3mGqpYZbaQPsiYFCgisAn0260Ip+dJs157hs76l4
d8Gw9Yu1kJbKmF06Q4qK6kTVeB0KBQ==
=OBSP
-----END PGP SIGNATURE-----

--lQFgnXmO0PqXf7EH--

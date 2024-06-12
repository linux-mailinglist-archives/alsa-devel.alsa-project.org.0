Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F79050AD
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 12:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1647DFA;
	Wed, 12 Jun 2024 12:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1647DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718189237;
	bh=WOFMFihXVv9KxbsCnwWds020toilnkak1LojX92RAOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T+UlmGiIHpeVDRpD6CV7+hOEKdT6nP5+uPLRx++MOdE4hez1EcaRmxi1cPJidPyED
	 H8bAhjDfCukaxM7IEXnk8Na6WgpgkxwiYkQl9yoaNqYABuBireH3XDsMm9zgU3huih
	 8y5/oCZbDUrSjedwTRsi1zCMIusyYFsYcCyfDWgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CD4EF805B3; Wed, 12 Jun 2024 12:46:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D438F805B0;
	Wed, 12 Jun 2024 12:46:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD9ACF8057A; Wed, 12 Jun 2024 12:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05964F8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 12:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05964F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gkKqrD4z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1294D61307;
	Wed, 12 Jun 2024 10:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C626C3277B;
	Wed, 12 Jun 2024 10:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718189192;
	bh=WOFMFihXVv9KxbsCnwWds020toilnkak1LojX92RAOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkKqrD4zpN6yMzvHKEaL/9kx1szbkzOReGWgSrMjUCc8hr4Zkxz55XKU05RXVCzTz
	 a7qDQVrCnqIiETIFgMXrPh5Q2tCh3l4Hf2EZsh/GMejl+JRCQbtMbSRzWsU1wlsc8O
	 Og6GY1BNOlgdtJg3oFmABMSZ4sgy7NDdQwbaYO2Q2yd5EBy6heZKw2xMCQNd4rfI8Q
	 2tov1EOfoiYBIsZldE/ZS864wNMEXe+8j3ReKJnzsVNsrwOwvrwJbAulWPkVRe6z1W
	 +SLCDEuD364gt5TUECU1I5mH6PPzUHhJsjwl0y0NvxktTnDKrXB9Hd2Cf2xD3LA1zY
	 NJHsGf6eYxZQQ==
Date: Wed, 12 Jun 2024 11:46:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com
Subject: Re: [RESEND PATCH v4] ASoc: tas2781: Enable RCA-based playback
 without DSP firmware download
Message-ID: <Zml8hVjRf-aH3Rif@finisterre.sirena.org.uk>
References: <20240612082332.1407-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iS94sJ3zuV/6KtTn"
Content-Disposition: inline
In-Reply-To: <20240612082332.1407-1-shenghao-ding@ti.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: AL3H73LWWF27OIOWMTAVUCVST7JW7WUY
X-Message-ID-Hash: AL3H73LWWF27OIOWMTAVUCVST7JW7WUY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AL3H73LWWF27OIOWMTAVUCVST7JW7WUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--iS94sJ3zuV/6KtTn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 04:23:30PM +0800, Shenghao Ding wrote:
> In only RCA (Reconfigurable Architecture) binary case, no DSP program will
> be working inside tas2563/tas2781, that is dsp-bypass mode, do not support
> speaker protection, and audio acoustic algorithms in this mode.

Pierre keeps raising issues with this which I've not seen addressed, why
is it being resent?

--iS94sJ3zuV/6KtTn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZpfIUACgkQJNaLcl1U
h9AooQf+Iw5jLH4Gh/aBFIoOYIWjICQbjH8maeOHa5qj92O5m8HHwNMcBxkCFC5c
F9wKm9ezkjaDJjCUHUN0CEkQT+Sr0YjFt3gb553rLUlkIk1zJVRz7xx9DOJpQuKf
5KNwTaxxmk04KlXOid/wQr/UoxtaZhfXnFUi4wgPK4zqjdR9NYOz9/jeEpnejeg+
E9CcglGUWsDJjZSWQ/juh0YQT7/Gizbo3+FYNvJgNptP+u1igGOSygYJ+aK1V5Su
085X8ot2ioS1oFnFZFcAB0Lj/Djo6vTlPmanzAXpy6uWAtkxbm1gQKxgnDB6EBPL
nXqbEBZvUCTo6dhmFRR0X22eQuOJtw==
=E8aj
-----END PGP SIGNATURE-----

--iS94sJ3zuV/6KtTn--

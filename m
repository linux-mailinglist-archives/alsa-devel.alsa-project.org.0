Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C79090AE
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 18:43:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765BB851;
	Fri, 14 Jun 2024 18:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765BB851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718383409;
	bh=Tlh8m401RdiRzFymaSJiodIhjjgTmA5lrOXYAZ9uQPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T5ByBYed8dCe4regpU+UCDd3Y8cZb4avvtSKyHOm3vE02QAGjTcQqPAOEbWvAZG/f
	 L9RWtNQqlW/KsL5oXCjbu0N7reIjhRb457Jsmg/FT6fsS6UusTAWt0eRWmEawFOQuZ
	 xhjgERkkYLH1foKwhlvdJ+G7E3LRU2bCDdjQfqc8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CDA3F805B3; Fri, 14 Jun 2024 18:42:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2308EF805A0;
	Fri, 14 Jun 2024 18:42:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BFD4F80448; Fri, 14 Jun 2024 18:42:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93AEAF800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93AEAF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q0OdEN4a
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4ABB61F13;
	Fri, 14 Jun 2024 16:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE23C2BD10;
	Fri, 14 Jun 2024 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718383361;
	bh=Tlh8m401RdiRzFymaSJiodIhjjgTmA5lrOXYAZ9uQPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0OdEN4aixWpF1EjydlUMQuTgCaVB7opzXf5XtfbWhOWL/5rJkC9DbQy/IKk36npJ
	 VO2xUxaj17Zam0K3yAqd2B4ugztVtF03BnddXJE598GhRC07J8bVsJhbr02YNtIiVP
	 KMuSF9Y1tZqg6uJAAP0R+GkuOZ9BbSCGEMDkA/c7JAilgfuGQEOW96H2GsERoesEA6
	 BNKrYWBlVWNCPUxYjfxJ0Or1bptyOrzsub6cW3goW7BR36i5B0+yNuRlskCPKlaIuh
	 a9qOBXrltofA9kw6ZGdNZIz3c0wsf6nPUk57dFi0WcWFeYZ7O8X3wEAu6Knm8OM4Ja
	 K/hpG7ZnE/b2Q==
Date: Fri, 14 Jun 2024 17:42:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chancel Liu <chancel.liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Message-ID: <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
 <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Dizksk5Fs8IGsJP"
Content-Disposition: inline
In-Reply-To: 
 <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: CFC5IEVS4NG6KJYCSWVCDIF2VAII4ZOC
X-Message-ID-Hash: CFC5IEVS4NG6KJYCSWVCDIF2VAII4ZOC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFC5IEVS4NG6KJYCSWVCDIF2VAII4ZOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0Dizksk5Fs8IGsJP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 06:24:50PM +0200, Piotr Wojtaszczyk wrote:
> On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > On a quick scan I can't see any architecture dependency for build,
> > please add an || COMPILE_TEST for improved coverage.  As for all the
> > other things enabled in this Kconfig file there is no need to explicitly
> > depend on SND_SOC.

> Ok. Later I will add a sound card driver to phytec3250 board which uses
> arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TEST
> won't be needed.

Why would a defconfig affect the Kconfig?

--0Dizksk5Fs8IGsJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZscvoACgkQJNaLcl1U
h9An6Qf/b4JZLW1fJTJNxCgdIhftN7IpeiRX+esOHEeKQtZw3ozptV88AJharZjX
XXZEj/+g1xJK4XcZaoGge+ChSerkFOGA8R47dj26SyDq2YdCKR63s4FxELs8g0Io
uxg/3sS8sltF8LnpH4rEZS8V1yNNAA5WMh8Cxvwf4EX5fJmHPCdpLNtkVOAmvKgU
arRBgU8EHs2YBeDhQZu+HLGFQXKbd4YmIl4ExA+S6xjJoF6nQQA5fuwZKh7H3MgY
/OcHiJ1/7M0NLdLk7tf5uFSwbKUcqnAlVx1OZwg04NmfDdWxxf6u0qO7kg4uO9Td
DHj4z63CGck+G+/Pl0cnpjduUMnsWA==
=kXhB
-----END PGP SIGNATURE-----

--0Dizksk5Fs8IGsJP--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFE7DF662
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 16:28:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8F2684D;
	Thu,  2 Nov 2023 16:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8F2684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698938891;
	bh=CLu2jh9OlzM/sGA794f8ZsBB8L94ScdqfEUVqcrrVuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K/ZjeV78wCPGmga4GLl1bE68yP4GIJGhlgf7UZS3uFfZATMp8pVCgd3toAPr0Z5Ng
	 UlXVW3ycsWgDUdG/SygMU3/z++3laNTZMyRyuD1VqS38G3C073cXNiPV80cyaXEg0i
	 tV4hHU5z3Y5boSTD7fZOkzbfgX28kMD8VovVxoTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9639F80290; Thu,  2 Nov 2023 16:26:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B55DF8020D;
	Thu,  2 Nov 2023 16:26:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71475F80290; Thu,  2 Nov 2023 16:26:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4616CF8014B
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 16:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4616CF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JbwrF7am
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EC55BB81CC8;
	Thu,  2 Nov 2023 15:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B019C433C9;
	Thu,  2 Nov 2023 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698938801;
	bh=CLu2jh9OlzM/sGA794f8ZsBB8L94ScdqfEUVqcrrVuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbwrF7amZPORQN6XEePLyXfiiZ8ycC5AP0VuVxJw9NDsMuXC8LQTkbBxCQY6r90nO
	 Y+anNtIn/BjOUCJOXluLD5XHtZcNHtqL0nMw874GYI/GKuDFAI7dyJCxiTbWIZT09s
	 zVD2KEkoT3mriuzjQCICRHzeKizPqwVcItVs71NcBLXPc6arxXaqfhWRpZyCVQpu6p
	 bKa6n9rCnSVfhhbsmmrah+lRCyKqtmOOHtl1FDHQYv/Z0HBnN6eh+RXyd6Zae1CGfL
	 HUtqS0EpBndyQy1GtXAvccj0WXis8wCarS/oJt9tUVRjxGDRisnaVa9qBoYPTw7Tp1
	 fiNJ8wWO6pmlw==
Date: Thu, 2 Nov 2023 15:26:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Leo Yan <leoy@marvell.com>, Zhangfei Gao <zhangfei.gao@marvell.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <keescook@chromium.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Karel Balej <balejk@matfyz.cz>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 06/10] ASoC: pxa: Suppress SSPA on ARM64
Message-ID: <dc7aaff0-f767-494e-9a3a-40fcacc1674e@sirena.org.uk>
References: <20231102152033.5511-1-duje.mihanovic@skole.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qOq/Mx9vNp7JTaIV"
Content-Disposition: inline
In-Reply-To: <20231102152033.5511-1-duje.mihanovic@skole.hr>
X-Cookie: A is for Apple.
Message-ID-Hash: HPTIQWB6NEFRTAOTK67CLTJFUYSSL6YC
X-Message-ID-Hash: HPTIQWB6NEFRTAOTK67CLTJFUYSSL6YC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPTIQWB6NEFRTAOTK67CLTJFUYSSL6YC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qOq/Mx9vNp7JTaIV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 04:20:29PM +0100, Duje Mihanovi=C4=87 wrote:
> The SSPA driver currently seems to generate ARM32 assembly, which causes
> build errors when building a kernel for an ARM64 ARCH_MMP platform.
>=20
> Fixes: fa375d42f0e5 ("ASoC: mmp: add sspa support")
> Reported-by: kernel test robot <lkp@intel.com>

>  	tristate "SoC Audio via MMP SSPA ports"
> -	depends on ARCH_MMP
> +	depends on ARCH_MMP && ARM

This isn't a fix for the existing code, AFAICT the issue here is that
ARCH_MMP is currently only available for arm and presumably something in
the rest of your series makes it available for arm64.  This would be a
prerequisite for that patch.

Please don't just insert random fixes tags just because you can.

--qOq/Mx9vNp7JTaIV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVDv6YACgkQJNaLcl1U
h9AOwQf/T1o3MmUT/AHCyzC1ybmn9jdutGNuOKe8pi9O3wXGrNVyx5Fkp1SK4nbc
62A11OUzAZ0h9HETpVH8AdVGBkxF2J+yKKBX+JuqvzuzEKm03uXRhUElJmqfU+nK
jDKPeW4JH7ebL94RYoy4P0IFywZIaS+PjdREKi5j5zTTvDKLxEVqppJPz30+UXz7
QRoVMkJmqK4HrvzznNuiuhBuz96tooQLS1dIVzrBmNJ5YEbbjeVpXHcUEv+YanOL
Qd6s2Onh6sZigqrrZlb5F2CIKw+AuHnLNL9XEyT2ZXyDY8ZdCF7ZgZ64acZz+39b
21kilHuZZYaEZTKdul8WvivXsPffgA==
=zsGC
-----END PGP SIGNATURE-----

--qOq/Mx9vNp7JTaIV--

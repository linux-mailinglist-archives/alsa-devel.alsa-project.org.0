Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF2823ECAB
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A3615E2;
	Fri,  7 Aug 2020 13:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A3615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596800268;
	bh=tB44LrcAJ3NxEYYWCxVL/xdN1g4mPUOLKmrBE/LmCZI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TlhxW7ILRjoUnw9ZQ5K87ZvrqqxVmD98xugCJTqWVtVaUU1rj2iRKY0rSDJqF26B7
	 k+Lsnv6yrow/9jyndME7Caa6JEDHpy53wQDIuXpshjDHYQUBYnNY/8rEf0/orgXC4m
	 +N+FE1qQqYlgzfeuYhF18LYeTXv0A6qyvoX/OVMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B487F801F7;
	Fri,  7 Aug 2020 13:36:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9810F80218; Fri,  7 Aug 2020 13:36:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AA4DF800B7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AA4DF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="adPdvx7B"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CE2522C9F;
 Fri,  7 Aug 2020 11:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596800152;
 bh=tB44LrcAJ3NxEYYWCxVL/xdN1g4mPUOLKmrBE/LmCZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=adPdvx7BNkN3vzleYgFgdh5QTP1V3DG3dm6nNmuWVM8gkbIiTTFCE48YedudEmH4P
 X6lzhSZuMMswEMloGb/39wFETPqu1rkcW6m5xnQg/jknYdA3B25xVAZg4N6Mc5/AfX
 fSwa0ZcfFidwfuu3qxrr1xB0vJ7CvrA1LEk8tSfo=
Date: Fri, 7 Aug 2020 12:35:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 18/41] ARM: s5pv210: don't imply CONFIG_PLAT_SAMSUNG
Message-ID: <20200807113528.GE5435@sirena.org.uk>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200806182059.2431-18-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline
In-Reply-To: <20200806182059.2431-18-krzk@kernel.org>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-serial@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-spi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 08:20:35PM +0200, Krzysztof Kozlowski wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The plat-samsung directory and mach-s5pv210 can be build
> completely independently, so split the two Kconfig symbols
> CONFIG_PLAT_SAMSUNG and CONFIG_ARCH_S5PV210.

Acked-by: Mark Brown <broonie@kernel.org>

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tPH8ACgkQJNaLcl1U
h9AKhQf/R7RK8Hp7GiOARjjdjgAtgRwwe6zGtME1BaY4sl5QjQX3lbKLy27zSN8g
oIS4rQz7hiHTbEPAYejiOFvzEWdxiiJCwsb4LoUYmS7z5ZHh1hkymZNMNxkh03k5
OtD206PpuFlkRBy5mQmvNSpCLcAZ933xTyhdUDH00eAg5/09+FEqq4z84afijimH
EDgvn6dXYA8Zqd+w7Kx0fiERDK0Ygo1jl85OEsLKFbPZefjx9wUKqqNlm9Oz+s+k
C6yb2uPrkc2t8FqW0jBc/nR+ky0+VBkW3duO0CCP1Sag3U2HLi5GZ2wdtQrXLXu+
ZDfJfLruyTaIkzFFcfZgPsjk6niMXQ==
=qNw4
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--

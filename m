Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2324180E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 10:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0093D1664;
	Tue, 11 Aug 2020 10:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0093D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597133748;
	bh=EMH/rpG5GgAoo0E4h69GGp2clEh0+xJ/Es2GJrNlakQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCGvn7zDeNByRE8EFYHWNqaRhCaWSyz2Hpw3QjvPh2AVqdLsQJbhWKNUY66Gk/iHw
	 2WouFPmEsdpwt/5pJNYqIKlGaVR1fJKm+b99EwOoUzaEtpCkRaC9TzxAYwFAmuKhSX
	 4w9+5kqaC1EBs3b6kjJ9LLPUGrs3eLZCDulGgFss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23DEBF80161;
	Tue, 11 Aug 2020 10:14:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FD7EF800B7; Fri,  7 Aug 2020 13:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42410F800B7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42410F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uNSXAb21"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76A9221744;
 Fri,  7 Aug 2020 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596800035;
 bh=EMH/rpG5GgAoo0E4h69GGp2clEh0+xJ/Es2GJrNlakQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uNSXAb213aRYOI4p6KThK0R6c0zjIBKU+M9Fbfxrh4AjSmJJow5vIkzwbAMTRug0c
 k6AwZPssxCrsVcDbVNSHkAsvOMjpGb8xJ5BxsSVZPQkya/1D9AsMkBYAi8YO3ElMeo
 I0omKl9CJt/XAdPo35P8mDR1GZcksiUcjZKuBPck=
Date: Fri, 7 Aug 2020 12:33:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 00/41] spi / fbdev / cpufreq / usb / mmc / hwmon /
 ARM: Prepare for multiplatform S3C
Message-ID: <20200807113330.GC5435@sirena.org.uk>
References: <20200806181932.2253-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 11 Aug 2020 10:14:05 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-spi@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Andi Shyti <andi@etezian.org>,
 Jason Cooper <jason@lakedaemon.net>, linux-samsung-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-fbdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mmc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-input@vger.kernel.org, linux-clk@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
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


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2020 at 08:19:32PM +0200, Krzysztof Kozlowski wrote:

> I intend to take it through Samsung SoC tree so all Acks are welcomed.

Any issue with me applying the ASoC bits and sending you a branch?  This
seems like it might run into some of the subsystem wide cleanups we've
got going on.

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tPAoACgkQJNaLcl1U
h9ALrwf+KZAjsQtFvrjZaItEWb3sRhI1J89Qn9P11Ip3UWCcQGbI2gxICttpG+8L
CTgI0cvmg6Gi1qmTb9hBL0NoaHXegLZCYlU8Ihb7C5L5NW1YmPt27OlXPVseR4vY
JzUmPWLTz/WZjKu/cPr3D+57sgeb7UxIyo5WOkAiay6qnqCb5y3zfFVkVx//gJAw
6joeeiegM3L0a4MQwV84WQtD/ygF8cInCx5dALetxU2e5Bh1Gow3dZUKty+5k+o5
cfT3ahiZTNOVmoWOkVkN7K0KSfSv9hcJM7klhFzerGOwX29Zblgo4ruMHHwEx1RU
gsZEtshX07ihXINpTYruaObjgrgpQw==
=wTm8
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--

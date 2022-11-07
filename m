Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468FA623162
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D60F11670;
	Wed,  9 Nov 2022 18:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D60F11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014644;
	bh=TjwC/oCNbbUzKPDP67kFN1hAvayD11aeO+3EJVwBAHE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjjbdonZqghUaqpFGjSZ2ZP2sz6zXn6SVC8obLW/8l+44WA1hggtQNoWl3o6tD0g4
	 rGp+GPwtqVYZFPPLgyRPk/6zBxwmSeQFxORhri25LfKCS2bwSqCERX6MJHQo3lMOSL
	 XgMe3bkmelSVN1h/RiAlI9nIlf60tER4oJP/fRPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDDB8F805FE;
	Wed,  9 Nov 2022 18:16:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1019F8025A; Mon,  7 Nov 2022 13:06:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDCCFF800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 13:06:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDCCFF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uVU4PMxo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2025C60FFB;
 Mon,  7 Nov 2022 12:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DD2C433D6;
 Mon,  7 Nov 2022 12:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667822783;
 bh=TjwC/oCNbbUzKPDP67kFN1hAvayD11aeO+3EJVwBAHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVU4PMxo1R8a3xp/WKHs1dq/6doMgdlOpIsmcirQbv3czoZbcxWJpPwnRrBpNnLaM
 RIaI2ploJwL3I8PSy07X4klDoFGje/zAjmQm0GMafEh6v9eSVzb3H6UHbMJeGYIK/0
 3HkQjVeGkkfj4w3q16A9Jpu8h/eTG5MQNUyBXtMwVQBVCZBvcrvN6PBx8wq4Un2SsG
 waxoneKGslH7u6FU8MFJJQeOVg92oqhsWrP6aKBcVt7eUdvfzyvh8bep0OHaNEym9f
 kwo9TcnG/5EsDXRnkiFTaef9nelMlw97dI2zZnD+Bud8Et09b4EPGmFQOKomMmC6mm
 cuDEys2QhiEog==
Date: Mon, 7 Nov 2022 12:06:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <Y2j0r0wX1XtQBvqO@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
 <20221107084322.gk4j75r52zo5k7xk@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fjklijebr6IM77Hd"
Content-Disposition: inline
In-Reply-To: <20221107084322.gk4j75r52zo5k7xk@houat>
X-Cookie: Minimum charge for booths.
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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


--fjklijebr6IM77Hd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2022 at 09:43:22AM +0100, Maxime Ripard wrote:
> On Fri, Nov 04, 2022 at 03:59:53PM +0000, Mark Brown wrote:

> > Well, hopefully everyone for whom it's an issue currently will be
> > objecting to this version of the change anyway so we'll either know
> > where to set the flag or we'll get the whack-a-mole with the series
> > being merged?

> I'm sorry, I'm not sure what you mean here. The only issue to fix at the
> moment is that determine_rate and set_parent aren't coupled, and it led
> to issues due to oversight.

> I initially added a warning but Stephen wanted to fix all users in that
> case and make that an error instead.

My suggestion is that instead of doing either of these things it'd be
quicker and less error prone to just fix the core to provide the default
implementation if nothing more specific is provided.  Any issues that
causes would already be present with your current series.

> If I filled __clk_mux_determine_rate into clocks that weren't using it
> before, I would change their behavior. With that flag set, on all users
> I add __clk_mux_determine_rate to, the behavior is the same than what we
> previously had, so the risk of regressions is minimal, and everything
> should keep going like it was?

The series does fill in __clk_mux_determine_rate for everything though -
if it was just assumed by default the only thing that'd be needed would
be adding the flag.

--fjklijebr6IM77Hd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNo9K4ACgkQJNaLcl1U
h9CrmQf/bbIS1m2oXUj6n0mwM7QBssq/2mPiYM5zHCkJ5nf48MDZPWSwMuq37myq
q8lR7tDeZBdU/MtjTTpvWo8j/TLyZRrhWhX5rItRjfhZdXtePpp0tci4nHKyvWuD
Lc6+WJkeyUQsy93Y0qyvKl9DZ8o4Dyqs/lM7kkCEy+9eJNaT7QFAFZYhdUN2FJAR
2YiQG2mvchxdE7SyVxMsOfXX/J6haXQKAcKej6M1HpuJukPGEKH2N9WqfKKNUuWY
rMJ0QnheSBUxkPHRzdDOMo2k+xDK6cOSg8RxRtKQ2djWWWXII5JWs6VyVHLeK6Cx
9KTsnJ+fIbHK0GK9Pq3vm90Uk4W3Ng==
=y36Q
-----END PGP SIGNATURE-----

--fjklijebr6IM77Hd--

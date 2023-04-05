Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCDD6D9996
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0D9EA2;
	Thu,  6 Apr 2023 16:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0D9EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791321;
	bh=D4YX5DK0pun7qG4OSMVc8e9vaDN+H7CmPuWpZRhiBTU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r5XFYz/YZ5S8tVVlYgd7uXfBIU7U9c7RbrJtL4EsW0zLt07/2ixnouFOjvH+BvgCn
	 y0hXk0e2jmq/ugTTJlTfHT/5M10bIIRLg/WqWknzBnRuH6wwgvnlHZtVb8OmOVpNrx
	 r9YxqeyT5CBNPj4jomR8ig880XueBMr2AuXGfVfM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F369F8055C;
	Thu,  6 Apr 2023 16:26:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 824C6F8024C; Wed,  5 Apr 2023 17:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82B66F80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 17:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82B66F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H++unxUb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D947E625CB;
	Wed,  5 Apr 2023 15:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41DAC433D2;
	Wed,  5 Apr 2023 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680707447;
	bh=D4YX5DK0pun7qG4OSMVc8e9vaDN+H7CmPuWpZRhiBTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H++unxUb7nt0bWB0cZRIpirjyl6fMUIanjR0IybKKbOFCDZQ7fl3nGRfgXxHBmOTc
	 aLr8pCNoVrScF3nXsYVeVlit6tFVqt3RTHudqPjdJeU4XNb3Fm+L6FyB4ZGRpA8mku
	 uHDprHNH/IIWooGinODcsKEp00ZKOvzTS5e+wLSdqGlH/MPkZGOJVa2hJjKHooD4a0
	 m1oiZgR8OnAyymsDZMT9AjB6JLhQsxqkpcXhI/shb8qZ4C8ggWEHL6au6GNGlms1bf
	 2LcKx7iD5BDrkm8i9BaGwlDiJoOZSwNIUEO5nDNUcLF6Xb9gQmEcDK0dMfWFuHYUX9
	 29DfTcAe3KLQg==
Date: Wed, 5 Apr 2023 16:10:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 64/65] ASoC: tlv320aic32x4: div: Switch to
 determine_rate
Message-ID: <692983f2-4aef-4ab9-9777-43f46b9cb4ba@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-64-9a1358472d52@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Lzv7qB7yUCBJADV"
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v3-64-9a1358472d52@cerno.tech>
X-Cookie: 1 bulls, 3 cows.
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 5ONTNV5TLNHHZKAUQXOFXBR2RRSD34G7
X-Message-ID-Hash: 5ONTNV5TLNHHZKAUQXOFXBR2RRSD34G7
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:02 +0000
CC: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ONTNV5TLNHHZKAUQXOFXBR2RRSD34G7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3Lzv7qB7yUCBJADV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 12:11:54PM +0200, Maxime Ripard wrote:

> The driver does implement round_rate() though, which means that we can
> change the rate of the clock, but we will never get to change the
> parent.

> However, It's hard to tell whether it's been done on purpose or not.

> Since we'll start mandating a determine_rate() implementation, let's
> convert the round_rate() implementation to a determine_rate(), which
> will also make the current behavior explicit. And if it was an
> oversight, the clock behaviour can be adjusted later on.

Similar comments to the other patch, I'm pretty sure this is just
surprising design on the part of the clock API and we should just allow
reparenting.

--3Lzv7qB7yUCBJADV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtj2AACgkQJNaLcl1U
h9C6nwf/eAXWoy2nqSW5TGkiJhKHJv8x94Toi8TRODFF+R/hoCeBiwbDpLoGU2W+
XtYiCa4AsVVTQShMscEuygSt4HqR2Hm7gaw+SoRwfdX/dEpqMCCF1Uzc9IAgRRv/
3aWJLZtx/5Mpyu3eaA6b7ul2tFP8PDE90ePyk1zHCZGUE189FK95s3Xc6zmVnuy2
Es8Td9JeVAZhnxCyLYGLVjoUw8/LsBEXAQWpSr/ayacNPTQa9PlPM3k/HCggwR7g
3NRnovXN1XYJ2pkkaN9RB9yifiB9Doz8KnLhSJVYG2lIaFMyYDSuYFu2zEIa8M/y
YabesVhSGONiNYKoP8QmdjTZqKi2nw==
=i5C8
-----END PGP SIGNATURE-----

--3Lzv7qB7yUCBJADV--

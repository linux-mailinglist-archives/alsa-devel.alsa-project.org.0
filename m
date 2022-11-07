Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91591623169
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:25:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CB1316B6;
	Wed,  9 Nov 2022 18:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CB1316B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014722;
	bh=Q/9M3qSa1bFKeX3VjOKXXNeZQ8B6sH7ewCOsQSJl+z0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYqz+VzmXytPoR7g9PwO2ETwl2JKjJNmuZy46SDVb1HOBUijB1XvQrsmVaCQaRIa4
	 XCr3lXls3uA6H+AnBjuwFHukxn962RC0mgFfwE5R6tccdPht2XxvyDXQgiIhZzE0Xk
	 VJ+T4IknGB3+IDo4Y7UFE6yiLVtqFjOc96NlqK1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBE3F80612;
	Wed,  9 Nov 2022 18:16:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CC27F8025A; Mon,  7 Nov 2022 17:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBC98F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:02:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC98F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XOmgvny4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 17F89CE1712;
 Mon,  7 Nov 2022 16:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F88C433D6;
 Mon,  7 Nov 2022 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667836963;
 bh=Q/9M3qSa1bFKeX3VjOKXXNeZQ8B6sH7ewCOsQSJl+z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XOmgvny4UUp7BZnQahaV6KsWUNhmwIhMxpmcOq3tw9+9teYm6GP3wrPKa3hZGoLnw
 E8JjujtcqktG/KkrpbyyurTKPktTQdPK912YFUTtXWMPkM5Mc8ahGVOnmMw4Uhs9uI
 cTBlpsSY6QMvq4ve9Z36ouACRIQs64gqbTRuCpXHF7tFc/7x4f8H/Qv0fo1LJXDNr9
 JzeHD9nkKpifY1CmMZpd4sb8KMqk3fuEl3XqfTd7Ru1lKOsEk7X40/JP1ugM9/6yCX
 WursSOfQ18hBTkSv25XwIi5vVUTkBzpxlLxQrxg8iYZ3853WT5wCALjP37Nihp0/J3
 NEZKY1McJ+eyw==
Date: Mon, 7 Nov 2022 16:02:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <Y2ksFHGNIEVm1ldF@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
 <20221107084322.gk4j75r52zo5k7xk@houat>
 <Y2j0r0wX1XtQBvqO@sirena.org.uk>
 <20221107152603.57qimyzkinhifx5p@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hTyRvcr/YAY3aApU"
Content-Disposition: inline
In-Reply-To: <20221107152603.57qimyzkinhifx5p@houat>
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


--hTyRvcr/YAY3aApU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2022 at 04:26:03PM +0100, Maxime Ripard wrote:
> On Mon, Nov 07, 2022 at 12:06:07PM +0000, Mark Brown wrote:
> > On Mon, Nov 07, 2022 at 09:43:22AM +0100, Maxime Ripard wrote:

> > The series does fill in __clk_mux_determine_rate for everything though -
> > if it was just assumed by default the only thing that'd be needed would
> > be adding the flag.

> The behavior assumed by default was equivalent to
> __clk_mux_determine_rate + CLK_SET_RATE_NO_REPARENT. We could indeed set
> both if determine_rate is missing in the core, but that's unprecedented
> in the clock framework so I think we'll want Stephen to comment here :)

> It's also replacing one implicit behavior by another. The point of this
> series was to raise awareness on that particular point, so I'm not sure
> it actually fixes things. We'll see what Stephen thinks about it.

We could also just set the operation and still require the flag to be
specified.  I'm a little surprised to learn that it's something you
might want to override, never mind that the API didn't have a default -
it feels like a bit of a landmine that this is the case and is probably
why there's so many cases to fix up.

--hTyRvcr/YAY3aApU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNpLBMACgkQJNaLcl1U
h9BS0gf/chIMp6chtu1p8LwUn+lniQOfOjVm2GoGAQ06qSr9+3KsWgvPO3J4pFNa
l036gwiNNFPM5gXlEj19YU0NgiAQIt2hoh9q92PY1kN8vmSQutr8U6QVxq27pphZ
5T2AVdZG2/L1Za5fy+qtwzx6ji1EENFmdLOF/NRrtc1zJPm/bT9E14uqwH7vmK0f
Jh1uBONY+x2wM44EMNgt3p4HTS/37ARwT9njBao9UUdt1uFWnUx05o0lerkyk4Xg
QlkvyC2hU+mXML3s6FVEbx0TQImsJItRx7Fk4E0Pij30qxWDtd0uybSJOzuWo16R
emQv+2HsLgl0L3qkctPVJREpPwCQuQ==
=mfv5
-----END PGP SIGNATURE-----

--hTyRvcr/YAY3aApU--

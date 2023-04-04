Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D439D6D75AC
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE6CE9E;
	Wed,  5 Apr 2023 09:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE6CE9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680680040;
	bh=S5RX+65IdJoFD1RV6kPG02G0jupKJXUIf9T04GMrChI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U9YU+Qi9QNa/wrtvh9o3qjuuj1CYzuRA61BffUTb/GPuzEgW0r3Tj9UhYK3SmC5Pu
	 f1E6mj4hOmt7CoHIbNA6qel8hE6eu5HLx6PFBqwNEku0Yu0OCLXHYWV3Hc9HJVL8kt
	 xSBQYzd/ezG/FLhbiwudkc6GxoUZmf653ScuRhoI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE4FF8067A;
	Wed,  5 Apr 2023 09:21:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52A3BF8024C; Tue,  4 Apr 2023 17:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EFC3F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 17:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EFC3F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=juLKZrGe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E2866351D;
	Tue,  4 Apr 2023 15:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166DCC4339B;
	Tue,  4 Apr 2023 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680621994;
	bh=S5RX+65IdJoFD1RV6kPG02G0jupKJXUIf9T04GMrChI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juLKZrGeWUX9d0oOR/CCL+88qbCAb/xWCfYJOewm4RggCItQtMsffW8KgmQJXRJdf
	 wIGDohsQC49Uu+Ack+4kjWMLAjsoMV3eb751vy96HTaqKD91T/UUKbpSlW86M8yyWU
	 kzibdkPn/HM0qi9cV+Pg+vpi80+5XFQ+v5x9mDGc2lQrl4NnUSCzI4lyIjnRln2nSD
	 O5kE/0LQwnVa4MaO8VpBvXstlEflZ23NPK1LSMQlUuVw1QtKT/IAOLsLs/T1N/El4F
	 IlKMU2toIuXW4dsXuO5nqayGgzbPTQ/Kz+zZdF9SFWy3SohdZ+M+0IoBj9mTyg+9sZ
	 lTrq/E6gLN+BQ==
Date: Tue, 4 Apr 2023 16:26:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <01f32440-8dd2-4030-9006-a3123be55845@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-43-9a1358472d52@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pRxU5n1hMJtSd1CQ"
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v3-43-9a1358472d52@cerno.tech>
X-Cookie: Being ugly isn't illegal.  Yet.
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LXEGGOSREFA43MCH35BJXERWI4IV6WZF
X-Message-ID-Hash: LXEGGOSREFA43MCH35BJXERWI4IV6WZF
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:19:13 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXEGGOSREFA43MCH35BJXERWI4IV6WZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pRxU5n1hMJtSd1CQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 12:11:33PM +0200, Maxime Ripard wrote:
> The tlv320aic32x4 clkin clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.

> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.

> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.

It could be configured from device tree as well couldn't it?

> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

Historically clk_set_rate() wouldn't reparent IIRC.

> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.

> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.

To be honest it's surprising that we'd have to manually specify this, I
would expect to be able to reparent.  I suspect it'd be better to go the
other way here and allow reparenting.

--pRxU5n1hMJtSd1CQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQsQZoACgkQJNaLcl1U
h9C4KAf9FbCqTcQH5npaqJcyqXkbkD2B/+L43dup6TDsW3MJ6KnGh7YONz0DFQtI
yTePWQzrTp7lltc9dQ8/QOvh4Xj3HSYJ30m5Ok0oX7lCLwy3LjEHtJiou/laIivq
v+hAN2lVJPs0oOLwI+1tyi2p+UjtHzWUJcD37bHzIsY4esaL/B/Bp7m6z1JNpyoj
rIleJHkETKjUABBzN/UR62y6TPaPPm/hSUcy0eudfmZZhPOWkuX/iBrFcXcUgc+c
XOAtB0+uAsDUhULdGhXZSInCoKu0mdVwLr1QoZOB7q7J3Tl83t/8Mxuk8Dr+XEWh
JBFDNPB3HM8uQvBR5j9pbnSLt/7E/A==
=Jkqi
-----END PGP SIGNATURE-----

--pRxU5n1hMJtSd1CQ--

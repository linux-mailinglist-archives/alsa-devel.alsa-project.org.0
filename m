Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D065623163
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:24:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45FFF16B6;
	Wed,  9 Nov 2022 18:23:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45FFF16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014662;
	bh=B05aDEGhPxOz9qxjqo1oM6WpXvxfjmgCQJwzLTnqx7o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sBJG753yQViq36wyfR91Inhyr9XGO69yy3BWMbvQfenjciC701Gr2HNBTsmw3PMlx
	 CE/li7TDJCXDKAsIbQiW2qmmN4V/jtaMw6LAXK3BG8BPAgpcAGJwNEjIIlqpD4ZTUl
	 RdPTaBuE2Gd6XsjQ8n9JgjdVS2o2U3QtJ1zdE1+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1031F80605;
	Wed,  9 Nov 2022 18:16:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 853BDF8024C; Mon,  7 Nov 2022 13:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66FE7F8025A
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 13:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66FE7F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="c4zx5wLH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uf/zn+bV"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 1008B2B066C1;
 Mon,  7 Nov 2022 07:06:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 07:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667822776; x=1667829976; bh=B05aDEGhPx
 Oz9qxjqo1oM6WpXvxfjmgCQJwzLTnqx7o=; b=c4zx5wLHNyF7xm2AkdGG3OUdCb
 RO+l5I2vtO9DaajfBbNfka/dBUIMlboYQcCfJquVMcsj2o9/zEXEI+l2hSRokeuQ
 aqNSYIxr3Y0epBEAgaNnOXQEU50pT5NaDa4fjXvmfNBKbpt4a25wAzOIuLNEMx/j
 a0NvDSHSwrN80f0eXo5zTMav2ja+eJjpbZgEWPnOAm5hx3UlDuHHMYVNOnwUKcFK
 JhVZU1uK1lCqT7Xt4pPHgtY46Pm/9MWSSmC1SBPYRRzq2x1wtOtWfJwfe6msiD2s
 4ftE1AIcyhD+AKlWVDWP4DZo5gxXIpFxRJOhKEGEM1+6Kwb5JLctiyuKQ9Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667822776; x=1667829976; bh=B05aDEGhPxOz9qxjqo1oM6WpXvxf
 jmgCQJwzLTnqx7o=; b=uf/zn+bV9iXr/LMxeg8+E1bMrkdm7AISotuw6SbdRTQ/
 bmzu2ZkuuQ5Jzt9xaNZorZoCwetVElpGMEulW+HJm7DFbhBqjRt+oBvI0saqW6ha
 tgMnQ7xcD7FkrucW5A6s2F1c65udztNZ8ZiWPc7xzXIrky/pP6cidenYwLXJ/N/a
 tM/RVYNM/OYKZDXwL9GL4OfR1g5xTlYcDOpTl2Vwv69y82DJ0f0qvqbgBPSIigA4
 pqPSSpx1zgZLtTapbWIl0Ddl7gEq0y+oCYBzSYLsR+EeoYvAAknIs3WM8s/Nx/5b
 jpyc8SaYuZkTPLAbmrS6XMc+jTmbPIH0iOmo3sv8bg==
X-ME-Sender: <xms:tvRoY3PFGlEb7RJaNxEM6Ugu14yWdBktiA3qTs6-BrcOTKxv9PtG0w>
 <xme:tvRoYx-AxZ1WQ5KPyQzG4GSF9nOnWeHRYhvJyXfy3N24GhiD2xu75K_OjpfjagZWV
 y90fJJ-e5lUpDTgDzY>
X-ME-Received: <xmr:tvRoY2S_J5RFPZf-4wkcmwOCc_x7XeD76M1-byAnNeAtf22t62skzxbyLnsciOlkPyG3wB15U761HZLZq9yhVcKMElIgfcsK48JM6SyhT4FcOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tvRoY7vB8zdfJRUWlKeCfXorc4DFpIxrb30X2e71xu4KD0Npw-oSFw>
 <xmx:tvRoY_dCf9FHlSc7kwHzI7umAVLs1tZN4BwIBGyAX4-0zxT4lWdE_w>
 <xmx:tvRoY30J9PfIrSDM30MzXkeEfxvgGhpJ0dFzuHYby7zDzSEEdQesmg>
 <xmx:uPRoYzkpBG9adcnPxB-xonp3ewdKFqQr6dIQjDA-sX9kYmvTYh0sZ_NCjqM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 07:06:13 -0500 (EST)
Date: Mon, 7 Nov 2022 13:06:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 21/65] clk: davinci: da8xx-cfgchip: Add a
 determine_rate hook
Message-ID: <20221107120611.vutsgpgpcorsgzwp@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-21-f6736dec138e@cerno.tech>
 <187e61cd-7d02-2453-acf1-30180559d42f@lechnology.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nc45elwfwbnglqoe"
Content-Disposition: inline
In-Reply-To: <187e61cd-7d02-2453-acf1-30180559d42f@lechnology.com>
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
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
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
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
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


--nc45elwfwbnglqoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Nov 04, 2022 at 11:45:17AM -0500, David Lechner wrote:
> On 11/4/22 8:17 AM, Maxime Ripard wrote:
> > The Davinci DA8xxx cfgchip mux clock implements a mux with a set_parent
> > hook, but doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
> >=20
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call to
> > clk_set_parent().
>=20
>=20
> The parent is defined in the device tree and is not expected to change
> at runtime, so if I am understanding the patch correctly, setting the
> CLK_SET_RATE_NO_REPARENT flag seems correct.

Is that an acked-by/reviewed-by?

Thanks!
Maxime

--nc45elwfwbnglqoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2j0swAKCRDj7w1vZxhR
xQMwAQCrPeeZ2S11jlGiajn8sRupqFc/kS+IENFSoo8u57CVDQEA8P8p1AEYl25u
k96e3hU7z8K+yJbTwZo5iph4D4IHFww=
=Sagk
-----END PGP SIGNATURE-----

--nc45elwfwbnglqoe--

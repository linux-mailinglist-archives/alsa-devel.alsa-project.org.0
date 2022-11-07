Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 014D7623167
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:24:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FEB16B8;
	Wed,  9 Nov 2022 18:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FEB16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014691;
	bh=jTKbAfSVEW6LBkSgIWrp6uLXxiu9JP422nJFGPXjTu0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arjmfrWWaFelKf5oDp3EppWS3us6Xge0LTe0sVUVpuFSQtU/jxe/HOkDJghVcLKtV
	 viz9wTr0KcvSRjAvh9GUGOcxrwnKaabTb9rKF899v6tmK87a05YbzdjodJOGFRvRfo
	 ywh4AEIwsWv6mtDQjQDj1kD/L8vzoz+8BW8hvwqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9073DF8060D;
	Wed,  9 Nov 2022 18:16:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36499F800EC; Mon,  7 Nov 2022 16:26:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCF52F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 16:26:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF52F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Yz8C45fu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="we3Y+H0V"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id DEA372B05E77;
 Mon,  7 Nov 2022 10:26:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 10:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667834768; x=1667841968; bh=IIy8QXUDWn
 lcncLyNQJNbxMRRWumgUmyAMyd+aDiO3o=; b=Yz8C45furNQhVL2oz7HXZgGnHH
 TvCIbx3oIXxLgbEPnABUHdZn1FjTlBXO/L1HUin7nlSwmgzBZEAHQXtqUueLWNNB
 OwfmyOlg36y4QZvHUbl/IFeKRrua5v3nbs+lI8yzO8mXx4IT19hD5T6x7SIXqH7E
 cc2GzTsHAmmLjTDm7nLKE9rJj7tzh9QXh/pmM/gmbKHm8u4yCEDXIt2H8iqZARt9
 QsECam1RG4/cnzrlWYrmdX95jbKBthE1SCw52xWcjKgvNrC/w9eFBvNcqPdoP0VC
 kgyueznhPVmNlxZMotlGuMS8QDMwTbcA/aTq9dkJ4NLHTQ8GcN7cr6b1QC9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667834768; x=1667841968; bh=IIy8QXUDWnlcncLyNQJNbxMRRWum
 gUmyAMyd+aDiO3o=; b=we3Y+H0VECymbGK0VaXTFHbsW346wsLVjErpCLgJ45+g
 scHpf9eiainU1JBqntlua0SrTwXrGABBVlunf276/GfhfNOd/1vGEf1lUcHwrvm5
 zbWxzN3W7Zenf9Aa8Y0lcDOZ0gM54P8lT8lwFBUPN/ByfauorTjW7d7RXbvSlkJT
 k7v9evp6jVencFixQzMQhtO2nt3yGpBePuWO6Pu5QWJ2wKtmD8tFnyhZw/c9eN/k
 XmLHoh4bXi0sW22vHo0bm88oijG5yx4MWoMqBaBgxLapeXxyjGYt3QLy+aQKy4Ug
 w/V1K5ZGWlq/bSa4sSDWF1/AjvqtR9hsVVTIILV+1w==
X-ME-Sender: <xms:jiNpY8OMxnFFt5PbqqvqZSEoKfqq7taLlfkj3szUIQCjdWFIeQL24w>
 <xme:jiNpYy89u_mQTLvZGrbcNIjZbLYu9wV4EYfNRlktfKZUm38GG6xC_Qlt2hrpbO_df
 BSGxlyk5s8vknO0ZFg>
X-ME-Received: <xmr:jiNpYzSfZa6atc_eqwJFct1WjeHK-hLh2fplSb5wr1nE_LAD9arud3e8hqAHxwKU5wiR6hkEVdXqGN4RgoEjwLXSB8uMLCObkZqNF9IY6V2NlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jiNpY0vtIK-PZdgej79mMr_MApM6wLdfXscqntkFAEOkhGYrOU0MCQ>
 <xmx:jiNpY0cvni03g0uv0yl-yo399Y_hbctd4rNagD2H1NT2_Xs_g9EWBQ>
 <xmx:jiNpY42HLjMSaphod3lQyPY5KzbEAeoKRXRXEDPctlkn3XY9SKEjVg>
 <xmx:kCNpY4m1DCnGwZRgh_rsYFaEzCSCv9LG7n_fC4ovY1-GZspzYu6x7s6Mw5U>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 10:26:05 -0500 (EST)
Date: Mon, 7 Nov 2022 16:26:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <20221107152603.57qimyzkinhifx5p@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
 <20221107084322.gk4j75r52zo5k7xk@houat>
 <Y2j0r0wX1XtQBvqO@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6jvzxow5645ldbud"
Content-Disposition: inline
In-Reply-To: <Y2j0r0wX1XtQBvqO@sirena.org.uk>
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
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
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


--6jvzxow5645ldbud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 12:06:07PM +0000, Mark Brown wrote:
> On Mon, Nov 07, 2022 at 09:43:22AM +0100, Maxime Ripard wrote:
> > On Fri, Nov 04, 2022 at 03:59:53PM +0000, Mark Brown wrote:
>=20
> > > Well, hopefully everyone for whom it's an issue currently will be
> > > objecting to this version of the change anyway so we'll either know
> > > where to set the flag or we'll get the whack-a-mole with the series
> > > being merged?
>=20
> > I'm sorry, I'm not sure what you mean here. The only issue to fix at the
> > moment is that determine_rate and set_parent aren't coupled, and it led
> > to issues due to oversight.
>=20
> > I initially added a warning but Stephen wanted to fix all users in that
> > case and make that an error instead.
>=20
> My suggestion is that instead of doing either of these things it'd be
> quicker and less error prone to just fix the core to provide the default
> implementation if nothing more specific is provided.  Any issues that
> causes would already be present with your current series.
>=20
> > If I filled __clk_mux_determine_rate into clocks that weren't using it
> > before, I would change their behavior. With that flag set, on all users
> > I add __clk_mux_determine_rate to, the behavior is the same than what we
> > previously had, so the risk of regressions is minimal, and everything
> > should keep going like it was?
>=20
> The series does fill in __clk_mux_determine_rate for everything though -
> if it was just assumed by default the only thing that'd be needed would
> be adding the flag.

The behavior assumed by default was equivalent to
__clk_mux_determine_rate + CLK_SET_RATE_NO_REPARENT. We could indeed set
both if determine_rate is missing in the core, but that's unprecedented
in the clock framework so I think we'll want Stephen to comment here :)

It's also replacing one implicit behavior by another. The point of this
series was to raise awareness on that particular point, so I'm not sure
it actually fixes things. We'll see what Stephen thinks about it.

Maxime

--6jvzxow5645ldbud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2kjiwAKCRDj7w1vZxhR
xbC4AQCzinBg5fORSxUmh/ryaaQ1U50ULCO44lpcoTcfgR8NCQEArCtBTBrB8cDz
ZaXsPn80Mh//XhAP83gNXiHtZW4aJwQ=
=1n6i
-----END PGP SIGNATURE-----

--6jvzxow5645ldbud--

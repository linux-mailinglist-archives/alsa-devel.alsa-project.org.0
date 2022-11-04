Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E7961D867
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:23:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A711DB;
	Sat,  5 Nov 2022 08:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A711DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632993;
	bh=b6qTKfaEorlG4r4bWaMUjs9zGssUeOVJWnPuNfG0A5I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWT049MlsCKJZGbIj3d2tokPKB3bpzRmm0CYkY5d1Pto0V5ZtaYpT7d/rfCjJ9N2G
	 Qrm8RRmTnOJA4ZQ5Otn/LqNyKIndFt2kDCG8ZojBFF5cbqHWGmus2NMKaJSFRSsib+
	 ag11IgkMnfr2Fg4Yms1L+IiAyUQd9UujqEBrw1s0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B8F9F80809;
	Sat,  5 Nov 2022 08:04:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6289F80155; Fri,  4 Nov 2022 16:51:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06EDDF80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 16:51:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06EDDF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="c28hMZxP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lcjGNhjE"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2CF9E58022E;
 Fri,  4 Nov 2022 11:51:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 11:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1667577089; x=1667584289; bh=96a+nENK+p
 wJv6heDljopZWYNAHZZlQcLYBgPBXjxIA=; b=c28hMZxPcLC5cKVn4RzGU23sOy
 5KEaQ9azswPKVog9NQ9wCBgjJ5zlJEN0cHdbBCKvIlrdT+ZQfG2rcIz/rQlXO2jw
 k1UxgqmX2FagKHw4X9whxQYdXqwWm+7Stg0ICjSEvVtcBkwwWTvNMnDOyIgDZEfK
 HtR1ckYbIzWCnRQVeUfpYNLCZ1i4rwsh+GH+8saO+PVq3hn4d5QWQBRwmhPFIulZ
 ZlC0ds9S6hNtgM4W07ajJa0wYBoiJMHdyUGc3JQeTkMBHEKKxMPhA7p0I2haT2t2
 3KZ/N91fsmtAZg/vrWyo2Oe6uM7vziDS9Pnre6j6vnzrWB8ADGNFdEv/GhOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667577089; x=1667584289; bh=96a+nENK+pwJv6heDljopZWYNAHZ
 ZlQcLYBgPBXjxIA=; b=lcjGNhjEpFG9UwlWNPlyqpI20z1c8nUuBQ9ZXwVXmg/b
 ZeLdY5iT/PXtaTrCfBAbCRdLswoYCAlW/DJ8MOK3ly5WU0Ri4GsMvmbAiZM3YEV8
 7b7rziMvPjbfCHBYUwVNNrurjBuR3uM3+3L5lP3jdROGg/FnKT7sHSV3uPRkhQpZ
 apKhPjgWLrgSbzFty/fXLc5fDY2SimZDf9xM4fPoFnfU9jFtTLnjSfErO1Csdvwy
 Kk5IyWi+3oStGEXC27JrUOyDJxsp3DASuQw9cI88KNVcO6v5HFvkr0/dBK9GL+h7
 ToiYgcEnWuz66mqkbQ5B1R6Mal/DSPHP4ae31UzZPw==
X-ME-Sender: <xms:_jRlY7Ez8WsNCE5vgDv7giaGvtlg_-S_TRslJicSiPCdt5bJkUoEjA>
 <xme:_jRlY4UkRheR3U5QmJmsOPh6-XGK5CQfNUGZeNQ_AbqAFRLcEDmyB2cLzouBqARTU
 krI-Ojq4CzRnSVgVcQ>
X-ME-Received: <xmr:_jRlY9JiqeUBTyn6bWYvKmWYMotpgbK8YnEgDbLILKZx9L6KVBu2EE7Q3xNYrmiF1AYxcraFfmECS4yiAk2-MsqHugGRG3CxMH-3YrxjsuZX1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_jRlY5ErY3ILridCfPdMiI1BdUsTnsKgcTt_koj5Y7kuky5Mvy56uw>
 <xmx:_jRlYxWXTfF1vqAblQrq-NPyvBsz17O77BeYEHZbjU-jpqVh11zyFw>
 <xmx:_jRlY0POCHLJSycVzP16fIOwooAHD-iZGUX4A32zENNBZ9QYZ-oINg>
 <xmx:ATVlY1cZWdXf4vVe3bWpJOEOfEyXbf56TJKG-VDoEj6QaLJERlKGuA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 11:51:24 -0400 (EDT)
Date: Fri, 4 Nov 2022 16:51:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <20221104155123.qomguvthehnogkdd@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mczzont5aeejoi22"
Content-Disposition: inline
In-Reply-To: <Y2UzdYyjgahJsbHg@sirena.org.uk>
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:32 +0100
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


--mczzont5aeejoi22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, Nov 04, 2022 at 03:44:53PM +0000, Mark Brown wrote:
> On Fri, Nov 04, 2022 at 02:18:00PM +0100, Maxime Ripard wrote:
>=20
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call to
> > clk_set_parent().
>=20
> > The latter case would be equivalent to setting the flag
> > CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> > to __clk_mux_determine_rate(). Indeed, if no determine_rate
> > implementation is provided, clk_round_rate() (through
> > clk_core_round_rate_nolock()) will call itself on the parent if
> > CLK_SET_RATE_PARENT is set, and will not change the clock rate
> > otherwise. __clk_mux_determine_rate() has the exact same behavior when
> > CLK_SET_RATE_NO_REPARENT is set.
>=20
> > And if it was an oversight, then we are at least explicit about our
> > behavior now and it can be further refined down the line.
>=20
> Given that the current approach involves patching every single user to
> set a default implementation it feels like it might be more
> straightforward to just have the clock API use that implementation if
> none is defined - as you say there's already a flag to indicate the
> unusual case where there's a solid reason to prevent reparenting.  It
> feels like the resulting API is more straightforward.

That would be another solution indeed. The thing is, most places where
determine_rate is missing seems to be oversight, and the flag is missing
as well.

Just filling determine_rate if it's missing with
__clk_mux_determine_rate will possibly pick different parents, and I'm
fairly certain that this have never been tested on most platforms, and
will be completely broken. And I don't really want to play a game of
whack-a-mole adding that flag everywhere it turns out it's broken.

Maxime

--mczzont5aeejoi22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2U0+wAKCRDj7w1vZxhR
xXdWAP9xOaAlwGZ6oTzlixCwOJjLcIji+k20bZRWJg3KwM8WjgD/XCMOLieTzsjF
hAeOJdZFWunkoq+e4ZeBrrG36c3row8=
=SvO6
-----END PGP SIGNATURE-----

--mczzont5aeejoi22--

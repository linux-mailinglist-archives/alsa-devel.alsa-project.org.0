Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D8623166
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:24:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AFC216A1;
	Wed,  9 Nov 2022 18:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AFC216A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014677;
	bh=pH9EnTs5L3AE9yRrf/TOfLTE3vMWtMQ5hIBy7+jkfxo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PbCdw76uDmSlfs7ouhfQtHl6m5UbNo0n1Bakr/oj3uYqRlhf6sXmFmo/GN9rO81q1
	 i/AkETbpnNLI4xewE15cUvyR27LArCC+zgdHPdqRNPCX8+yPmjMh1cQxYms046f4XA
	 yLY3+EVLdvCRX7oxoNdtzzRCBbHZNNl3ca1IqWdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 744D6F80609;
	Wed,  9 Nov 2022 18:16:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DD62F8025A; Mon,  7 Nov 2022 15:52:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B713EF800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 15:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B713EF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="F7wDDyPb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tm2CjukN"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 10FC32B05D99;
 Mon,  7 Nov 2022 09:52:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 09:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667832726; x=1667839926; bh=pH9EnTs5L3
 AE9yRrf/TOfLTE3vMWtMQ5hIBy7+jkfxo=; b=F7wDDyPbg4B6cj4BQiM8vMTPkt
 tkEJFLYEYVOXIksN+jqz4ftMcxZZXnzOddYWfqs9q6bd1iOFwyhB5pE4Fvz/05uZ
 RF10RSC0RzcIedJ1G2E1LSQq4Zg42bEfK0TSyO7m7id0Yy1xeUuD5zWJX3us817V
 rjIfPInA1Vwm/QlX4DnPJzUv40Z0ii9fRJxzgHqkydlEG9GHtOtzfSoBBYVuklOY
 znHltzYI/nV8aA3pqWRO9oD9yS5dvx0Tnbouc9wI5DeGckOnRznPX94uGeI63tXw
 4a6YpykXCScaYQzL11169W/UCCuCj+CqGjGcj2LOgIC8IwvROeIK920PT8Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667832726; x=1667839926; bh=pH9EnTs5L3AE9yRrf/TOfLTE3vMW
 tMQ5hIBy7+jkfxo=; b=tm2CjukNyGky7m61cEbNeNPEwlXow6RPoGg2KjXghbKg
 ra/lLyp2zKjbGDhKlZm+A1NYUYItu9u5SMkA9pJHis1as3Cuaw086EXYoGiWAwEc
 kwmgNzmeS59QVCIvcfLkrQ+Ebrrzyvxm0bLZzUJt64WJNOdWIwV+A1Lm0sxt1PlG
 pqQrTshYGPUOlH25VHE+1Lo/JkFnLumTSx7pnL0tNbn51t3OP92FWPXw0EfQztVG
 wtJ4RnEpesPcGbqI0l7+PnoJguGMz6X3T6Oc+iWlaBg8/BNZZbD/jeW+bRR9Y7Mm
 aeVy4dRLsyWLoksEM3gODq0m5OD2atrQxRTwoulo5w==
X-ME-Sender: <xms:lBtpY-40Eo4JzBjQaFjHtoUz7QeBdEwcwbk96GIlHmmJELkNOdiNuw>
 <xme:lBtpY355rFDdDU_5_Zhsu6BuYYJ8FsknqxkvYPdHiPLl5stDZ4ymxPAwZCGrhq1q0
 rYmNowEFVM52RrtcrQ>
X-ME-Received: <xmr:lBtpY9dGH4qlk66IJxrnFOeAg7gL0Dzov_oSAqI9d3jUn16Bj4wfUEZhAxYh6xwVb1pD_70A4Fj78DNZ9hmuXeqDZ6FtyKnnZ6v_m9fVoJ9KEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lBtpY7K_De75Z1Qb3KnMLSjsRajiL-H-Ua3gdzprEa6elskIEslNHg>
 <xmx:lBtpYyJPcAZLuZCZ9YrgeNVP2SDE0zyvQMv9GMV_qnwg12P9XLOYhg>
 <xmx:lBtpY8zZKJW8BWrb3kvSxaP7pHRcbh-yGdZ8oBvUaVqZHP2VBvAXdw>
 <xmx:lhtpY2R7H97-NMegP3mWI1QxFbMYDvDajfqDlJ0guaZiDLR4Zxs1FRw326M>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:52:03 -0500 (EST)
Date: Mon, 7 Nov 2022 15:52:02 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 54/65] clk: da8xx: clk48: Switch to determine_rate
Message-ID: <20221107145202.2mne5p2sa4l2dm6g@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-54-f6736dec138e@cerno.tech>
 <6296d944-e03d-6f2b-48b1-3dad78e3c89d@lechnology.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kwjqag62r4ghubsj"
Content-Disposition: inline
In-Reply-To: <6296d944-e03d-6f2b-48b1-3dad78e3c89d@lechnology.com>
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


--kwjqag62r4ghubsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Nov 04, 2022 at 11:49:34AM -0500, David Lechner wrote:
> On 11/4/22 8:18 AM, Maxime Ripard wrote:
> > The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
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
> >=20
> > The driver does implement round_rate() though, which means that we can
> > change the rate of the clock, but we will never get to change the
> > parent.
> >=20
> > However, It's hard to tell whether it's been done on purpose or not.
> >=20
> > Since we'll start mandating a determine_rate() implementation, let's
> > convert the round_rate() implementation to a determine_rate(), which
> > will also make the current behavior explicit. And if it was an
> > oversight, the clock behaviour can be adjusted later on.
>=20
> I think this one should be the same as the clk:davinci changes and
> not allow re-parenting. Since this is a USB 48MHz PHY clock, a rate
> change will never be requested.

I'm not sure, it doesn't seem to be the same clock, it's not doing the
same thing (this one will always force the same rate, the others let the
rate change), and we're not doing the same refactoring (this one had a
round_rate implementation, the other one doesn't)

Maxime

--kwjqag62r4ghubsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2kbkgAKCRDj7w1vZxhR
xdnyAPoDUCObUrCr2C1a0eiJzKGIcW+Cl1z7L7QadhXWYBxPJAD+K5Cnal04FAYQ
nw7UCY5eZErrD6YvLzwUrAeczrFXVQw=
=GExv
-----END PGP SIGNATURE-----

--kwjqag62r4ghubsj--

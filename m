Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6C6623174
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:27:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F1C16C1;
	Wed,  9 Nov 2022 18:26:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F1C16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014829;
	bh=vmOE1i1nn9SMlBuCJ3VnNfQD0xqLuGWwaNRgBFkPe6c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6i6EQu2pUsACiNok5bu+NWWmyLSoj7cVRr6K3+JM8SHrx5MtWgX1kdAtLBtJhDs2
	 j5BRFFJkuSNiTKY4wLN7qsNV1fQYqWLnhChWLmXe/fvyDs3c5KX7U9OdFLJ3pdGSQ2
	 CFmqA2Hwb5z+sQCFnOIKxgj4k12CCNREHYmmosSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F76F80637;
	Wed,  9 Nov 2022 18:16:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97B3AF80217; Wed,  9 Nov 2022 12:06:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3DCDF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 12:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DCDF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="iUBuhX7k"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TTY4LI5y"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A2BB358028C;
 Wed,  9 Nov 2022 06:05:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 09 Nov 2022 06:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667991951; x=
 1667999151; bh=vmOE1i1nn9SMlBuCJ3VnNfQD0xqLuGWwaNRgBFkPe6c=; b=i
 UBuhX7kriUxSCehPgyDNVaNazC6ZqYODyvhJk308S4xAUw5FR/DHRUqG16A1PS1v
 ENmxNSthPcYKnBHtEEF4NaMy6AMNMFRKmBB4ZMO5eWIGTyu5mcJ/lxtMQQKTp+Sl
 bQoUGjVADCr+WlHx0lEbNyRZEkgxaNZtrOmYQk0n2ac7Ict9gfpAbOd1BC7PqTrX
 39etLAMsLKZQd37k5nG5BLcya9So/IuudBRhm20X4So5igEWds4fbHOimh5wN49/
 ln1R90AfTyvxybxkoM8IkNdb6OToGOLdadgCnR968ucV/axdvSNCg+RE2oF7ctmL
 2LiRGx0TVolehy8/Ne86g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667991951; x=
 1667999151; bh=vmOE1i1nn9SMlBuCJ3VnNfQD0xqLuGWwaNRgBFkPe6c=; b=T
 TY4LI5yFmrInBONewR1yb5qlBkxihM8159PIPlYDmWA5k3cs6R078ZVOeWwQKn+P
 +GckfW29QMZbSl2Ct2toWmPP/d/xCps3+gIRhC/48d53tAMpx3CcXdvjbcMdlGaH
 418HC+LOEQXdmRN+xj8IKR8GWz1rDO6wMRy7uCnn56UrZhz/yjPEDpwf7vYX0fkH
 m0aRfjw4W6386+uBxP7werCj507zKudg266b6LBMV4hkq3aTnpLukKcBpCDI5KGA
 8lLXnV2C7a6crYf665PdrAcrj1EAi4pI3ygcaSw2JcXkB3tTOxiiF/e+yvWF+UEd
 KTf55HOf20U+esBTcvDDw==
X-ME-Sender: <xms:j4lrYzcfce-pkfxbNMuUAe7O8SDJOGOpo4BU3gOxZUwHo3_o1PcbrA>
 <xme:j4lrY5PQ31XtPRQUz_ETEKlwp3m5MnIUkuBQicNvVSH2Dk-Z3jYgjUTMMcj9vm_ZH
 2AmIewUJcs6VVAxKrI>
X-ME-Received: <xmr:j4lrY8g4lF5pYrEXuizOwk38wsEzey4gfyK8eZCr5QD3P-aC1t9ztZvQmVMmd1ki94ZIcVtJtjvk3LGTtQiMc2tfSmAhsaxLcXamGm7hIZoq2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:j4lrY09JY312_H6bkXFS7A43Biy7qGwzGnEeP5Y0uZ9G7kysxJhf1A>
 <xmx:j4lrY_v0OupU2v2HjodxIchYMkMoZQ5cFdpdz4BYWFJTwbBA5z3TNQ>
 <xmx:j4lrYzFtfrVh7k6R2NrlYul8_U1RKhEST7MBUj48swjdXWPIopZ5uQ>
 <xmx:j4lrYz0j-wnR26hF6pYd5MvmBktuLP8ovKPiXE4FNNZ6DDGeDvNxfQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 06:05:49 -0500 (EST)
Date: Wed, 9 Nov 2022 12:05:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 34/65] clk: ux500: prcmu: Add a determine_rate hook
Message-ID: <20221109110548.4dcbkwx3jgjnhldw@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-34-f6736dec138e@cerno.tech>
 <CACRpkdYwM6X8bBABCisUGX=P4F=hcFb7QLT3Cu7XUWUvV4TE1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdYwM6X8bBABCisUGX=P4F=hcFb7QLT3Cu7XUWUvV4TE1Q@mail.gmail.com>
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
 linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org,
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
 Alessandro Zummo <a.zummo@towertech.it>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
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

Hi Linus,

On Tue, Nov 08, 2022 at 02:25:04PM +0100, Linus Walleij wrote:
> On Fri, Nov 4, 2022 at 2:32 PM Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
> > but doesn't provide a determine_rate implementation.
> >
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
> >
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call to
> > clk_set_parent().
>=20
> It is actually set up from the device tree, typically like this:
>=20
> /* clkout1 from ACLK divided by 8 */
> clocks =3D <&clkout_clk DB8500_CLKOUT_1 DB8500_CLKOUT_SRC_ACLK 8>;
>=20
> So the parent (source) and divisor comes in there.
>=20
> clk->source and clk->divider is already set up when clk_hw_register() is
> called.

I wasn't aware that we had such bindings. AFAIUI, it looks redundant
with assigned-clock-rates and assigned-clock-parents, could we deprecate
it?

> So set/get_parent() is never used on clkout.
>=20
> I think I just added the callbacks for completeness, should we delete them
> altogether?

I can't really test any of these platforms, so I'm a bit wary of making
such changes myself. Feel free to send a follow-up if you think it's
needed :)

> The patch is probably fine as-is as well so
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!
Maxime

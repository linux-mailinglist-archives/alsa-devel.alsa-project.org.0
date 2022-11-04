Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 140F761D81A
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:10:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F7D416CD;
	Sat,  5 Nov 2022 08:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F7D416CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632244;
	bh=4BlYqq5UPfFYo3niNZoafiUX8HiY7gooJ3ho6JQRT2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Afr9yizDXdqbyy3ZwZTDRNlGDOubMeYw7uZ1ktXyVbo1KFWzzRGqgUSaWqtbygGkh
	 IeKfYFiUv5GeMlsfFutv6nfYsTVh2bJzx0JcliYFovjUlMf/Ap4fBwTs+9sGzwqWPj
	 Tr/Aeqil4mVG+jOAnZV0FzhMx6pimKMAPxWPLkM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DAF7F8060A;
	Sat,  5 Nov 2022 08:03:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 189CCF8049E; Fri,  4 Nov 2022 14:18:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC534F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC534F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="sC6kD/hb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gvrxgbNP"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0DCE258050C;
 Fri,  4 Nov 2022 09:18:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567911; x=
 1667575111; bh=fD5QkUGTVXjqsPP/sK/neTD9XbByTp5xchKTtVPLBts=; b=s
 C6kD/hbUSh1Ha/l2HFiNzWscphfRg7OoztB6W57Jod+o6eFTHn2AIwUp5zWvjCyi
 IDE9YiogefGA7DMn69kujuGcAyAGXLk9PmNIOmh2Byxkn2xT6/BkIa2P0agO+Wz0
 jcgtAaBRuCdCuNZRR1nLYdEV0ckkzIWTX3ald30OfUjSDOzQ3pPGgeAdoOJFW9oK
 v6p965Cb0A2//fb5FVQJXEsqNdYkyBHRPcVkXhjgx/z45ZLexgQ5/w4DUDEY4jk/
 dJy6eGxxO0dHcp5gP0HdAGCoUYqWPrNz7nYVuSaoRlpSPru/S2mWztyX9G/PAqHO
 SH74dXFTzQFdM626XUwUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567911; x=
 1667575111; bh=fD5QkUGTVXjqsPP/sK/neTD9XbByTp5xchKTtVPLBts=; b=g
 vrxgbNPvtfCBcIsbxJzut77zSpOraJdxEAdprjmwGPebtseQelwtr+K4ke8gQ4ge
 8FPWxIx26ao9VLwyTyBXD1aHaNSRh4vaPVAirAJ2Vf8cZB/7ehJCtvuWwtvOv9H7
 AOjCAHR/cvcZaUS6e/NObKc1mHvloR1SrDILXCG0DbyuAi5Ip2JMKl/24DMt++Rr
 QXtNzORFflJN33dr/fsLA5ttlqEVN+aqvGBx30uUhl/+NAXv6M/T3aYutc+HuuR/
 tOtPanS2DoYMO/Otj8NMe08TVTNVgN3B47WwsmGVJoacyVFqqjKlU7X10VLclH7O
 s4o/NHbfUDk+OZ6RYpvBw==
X-ME-Sender: <xms:JhFlY2Lc7_LRa5qJBw1Qi6kaSo7UO9AVnVQ3clOGpDdyfcSnp5ctfQ>
 <xme:JhFlY-L9bl6TszUS58lAeKYN5miw35sLUP5177yT0NUU37r96sCRN8rlY9HCkPrOY
 njJtTYjhr6M4mfUHaE>
X-ME-Received: <xmr:JhFlY2t9E-1blMwfEsKCQm1XXZjIFL2I5nFTgFNPBxRTSn3alYKY4sGbbWIAnr7r-HP7T4uXc6i7H7K1k2bRmfBFCNIz6INPLVzfEd2NEn5otw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JhFlY7b0gSGoDHazb7neLSMLbjKiSHCuNut7i_sV7aJPABXqRDoX1w>
 <xmx:JhFlY9Z5PK7MVEh5HpJv2ypfDakM8w_Yxe-tkC9FYRZh2pr4bpJ_QA>
 <xmx:JhFlY3DAZOvSF4Y_36sIndMUCGF3VLODjLl9wlcyJomkku2mYc2qiA>
 <xmx:JxFlY5qPOzaWFh875bd2ZTviLskq5njUpdAm4Q74jphC_HpI3tdizA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:37 +0100
Subject: [PATCH v2 20/65] clk: wm831x: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-20-f6736dec138e@cerno.tech>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=4BlYqq5UPfFYo3niNZoafiUX8HiY7gooJ3ho6JQRT2Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp9/cZbYiNgFSp1Uslx4bUtC1n6H9On2a8PqVoa2VFyR
 +XOwo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABM518DI0FjC4Lh+0eWkr7tsFh/pjX
 A1yvy6fNLR61GGswsra5arLmNkeMsXfG5/8JoXPs17T4ZP5Kw6PuuJv71QRv1P36j0xpXibAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:31 +0100
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-phy@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The WM381x "clkout" clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-wm831x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-wm831x.c b/drivers/clk/clk-wm831x.c
index ae6dd38ec053..be3a9c1f3610 100644
--- a/drivers/clk/clk-wm831x.c
+++ b/drivers/clk/clk-wm831x.c
@@ -329,6 +329,7 @@ static const struct clk_ops wm831x_clkout_ops = {
 	.is_prepared = wm831x_clkout_is_prepared,
 	.prepare = wm831x_clkout_prepare,
 	.unprepare = wm831x_clkout_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = wm831x_clkout_get_parent,
 	.set_parent = wm831x_clkout_set_parent,
 };
@@ -338,7 +339,7 @@ static const struct clk_init_data wm831x_clkout_init = {
 	.ops = &wm831x_clkout_ops,
 	.parent_names = wm831x_clkout_parents,
 	.num_parents = ARRAY_SIZE(wm831x_clkout_parents),
-	.flags = CLK_SET_RATE_PARENT,
+	.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 };
 
 static int wm831x_clk_probe(struct platform_device *pdev)

-- 
b4 0.11.0-dev-99e3a

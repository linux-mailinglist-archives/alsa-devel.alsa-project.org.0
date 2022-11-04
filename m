Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150861D813
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:09:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D94168D;
	Sat,  5 Nov 2022 08:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D94168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632178;
	bh=UHYzA/6Th38vKXuoTjYzk35rG9CoA3kN/ZZ7xjHnj08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZIx83Zrck5TvIDbefdBJF6xl2XZeEiJAgIOdrqw+ae8rjg4JhzXJh01drQ9Chudk
	 ABvPlbZKkRKndVWSmnAP64WgmS1DKQ190t5eMJXP7pkNtpO2r1qllvMcP1NpCSvZQh
	 Qs1cam0+moQmVeR+nIgq9ebEzG5ESVp+6OCyb1KU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D19F805DA;
	Sat,  5 Nov 2022 08:03:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D66BEF804E7; Fri,  4 Nov 2022 14:18:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC150F80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC150F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="p7sG0etQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FSc+SC64"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E62CC5804CA;
 Fri,  4 Nov 2022 09:18:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567906; x=
 1667575106; bh=5y94lcdciHGnxsIUF611rAjwiEbDzI+GRIM63DhjQ2I=; b=p
 7sG0etQ4w8VvMurS5E1x1s8e34HA6/ESjrqf2T8/oeYUUhUqvbDeYEilHTpDdrcl
 eUEbHNH5PaABl7QXw9OsszdG8/qFDVeOeThYm1sy+8h5RbiqMZzSr/IXQ2bX5QLw
 Gk9h1W7ipwKgyE/WsJyalfoZO4gvfSl41MIz92t68zpO6Z5B9GHoI/ys9xlavqTY
 1Vcydo0FgD1lpX3TX5Gb9n6okBBQosmJgpZZkkVI+MwP1J+4icDBAnbHl2Cybakr
 yd7bSjW+akk7pTM9ZaaW3UJ0Q0eli7WksxVNduf4EyoQvdHGEpdwkcFS4uGHIwVp
 4+wonm7WOaSllsNgqILeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567906; x=
 1667575106; bh=5y94lcdciHGnxsIUF611rAjwiEbDzI+GRIM63DhjQ2I=; b=F
 Sc+SC644Dsuq/yPQ860pRaogIUkMlcIWla5PN4pdESBgqRdWEMOf19tKAkS94O/9
 r0eJsSALXG01dxVdBqMp6fsLA/2s0Mxo/zMRXUdW3IEh4F/Aldvb4BbETlDGYl/y
 wlYs4idlaSh4/fHCWrtoObeycW9S32M6w4I+1BuwP00SvDHCohJ/eWk3gvB1052a
 GkX8zvGMJw9UfCQsFB5JsJDceoOhs2/ff++dXGVwzpVVmHAf/bMsOHXSuj8wrRpj
 0fk94/SD1yg/ObTyngY+DzFk2kWmF6WDSGZBNBK/IEIcc7h0YiDuQbSkbBH46jF7
 uUHBPYRAzbOu9QdbE3lFA==
X-ME-Sender: <xms:IhFlYxecIbirF2dRG53YtsuSY2gvfrMPioY34rqtuv7Ro3qjJWLzuQ>
 <xme:IhFlY_M7trfLS0oU8uqMtxBTikHQIQbMb41n4ZnwZerrkzzygcd84opJOevo41w2k
 tbuMwwfGj12fFvAzo0>
X-ME-Received: <xmr:IhFlY6gw2OeFZS_0MwWKgt_wIQDlBWSUY-_nyFAr0OyOJt8i8rfqr2lQx37AiVZtGJZCyijtuD0W84juuRb-_c5dwwnm-9btVUebKkE9nKlFbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IhFlY68Th8I0IZg_f2-UAh3-fghqZMVSx8KGv8wzPLUY48Jl4rBtkw>
 <xmx:IhFlY9tfylIoj1R32c70nXw4jTs4QVtuGnndMMEKj_JA3-tu9uoufg>
 <xmx:IhFlY5EuFNtM2RK4ohZD8Rggury8j7LV1Uh6oZDGchKXVj2RzdkRFw>
 <xmx:IhFlYyM2gN63BCfv8AtuXAdulgI7jyqCwLmtcojUwqEeXnyLxL54pQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:35 +0100
Subject: [PATCH v2 18/65] clk: vc5: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-18-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UHYzA/6Th38vKXuoTjYzk35rG9CoA3kN/ZZ7xjHnj08=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp9DBZ4qWZ1h2GCy9+jC9UcZFWRu/amQalW+8cMkxFVm
 wjHBjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkKx/D/9yGTQLmDDVFd4O2JO7f1y
 3en7P0/bwPBfbf9x96/nLRvOWMDM/uvkj8t3DN4hKGvKCzvVoCm8vXxDTdV7q/guX02V11OiwA
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

The Versaclock5 mux clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

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
 drivers/clk/clk-versaclock5.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 88689415aff9..e858066c2c3f 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -281,6 +281,7 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops vc5_mux_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= vc5_mux_set_parent,
 	.get_parent	= vc5_mux_get_parent,
 };
@@ -1031,7 +1032,7 @@ static int vc5_probe(struct i2c_client *client)
 
 	init.name = kasprintf(GFP_KERNEL, "%pOFn.mux", client->dev.of_node);
 	init.ops = &vc5_mux_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	vc5->clk_mux.init = &init;
 	ret = devm_clk_hw_register(&client->dev, &vc5->clk_mux);

-- 
b4 0.11.0-dev-99e3a

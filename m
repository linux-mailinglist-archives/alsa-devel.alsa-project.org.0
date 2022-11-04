Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48C61D80C
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:07:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536BB167E;
	Sat,  5 Nov 2022 08:07:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536BB167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632071;
	bh=6IusAj9w3/tB8c67BjbXsxFLlirYjqevo85MFxaRu+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=koqajjL7cTHOMZjbiSH6pdGbl1lBUzMX9q3GKzccP4XWWeDLF9Dd2ZNkC4PH7RVBu
	 cgY18ANomza8Wv3Tn8Zk1c8qQh9eSurM4/nXYeXEEXiIALGLajLLKdozdd6YSz4A3Y
	 xmqLinDfWbKMr/FgfDeoUYO/lJohb4oFmVpO3l5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19868F805B1;
	Sat,  5 Nov 2022 08:03:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A52B1F80448; Fri,  4 Nov 2022 14:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D612F8047D
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D612F8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="gexMH46J"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AbiPP7Hx"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5FD305804B2;
 Fri,  4 Nov 2022 09:18:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567889; x=
 1667575089; bh=HSdFwQ3aW19zofmGUIyzD52AzOA8mMIUukqySVU5Fxw=; b=g
 exMH46JBY4nrfTxtsAVPMinzBNkX+8+g6BdrM/jCohcU7TfjvqLP0pv8xrPVI573
 L32KLdvZgWspf84qIDSefyC55ognb8gtlpa4gyenbzihCDx9B+aeBh75uAKsuPc/
 OMePI4Ukr7zyZf8TAWbbpTjlf1tGfjlMB5KhJq2OWRwSrsvReua9KUhfdINkY1HI
 5+00U+dfoHwTRfbfqfqRWy+6Y2D5LQc3aw1yaF3AXQuMQMTXHPG90kHp+DvsjSbL
 3f51o4E9huiwauUyMwg7M9+PCvOrGMJfpm+q7BjlKokD5jSnl0kEapRyCSSE36OC
 WUzsSr9BxIAmcSlZUqCnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567889; x=
 1667575089; bh=HSdFwQ3aW19zofmGUIyzD52AzOA8mMIUukqySVU5Fxw=; b=A
 biPP7HxWRM2nrGMfQZiT/vH7QrSVae2oXaq6/ibwrHHKDCL8eWdvnqH6TDSIqHgs
 Go01KRYa0XITm7jMTwJMfXDd/WrKe89YEtVhP4yR1OT2LIdtwWt8QaWfNHqzJBoY
 jSBDzq9m03pjrd/48dAPSa0BBuBEEPs1gZdyU+4mhnixFcoDGW7wSj5K9nklAuFv
 xM/kbaGWkC+f74B/lfSyGa9GU4qTj/iEIksYt1WPLs9pXrqNh4LV+6VyazMtGFS5
 6qE3P4anbi0F2a9f7Ezp2HsTB1zsC/BAfWFhjNeONJz3wnYcsyyz5WZVeJkD5S8u
 kfLnT33QBGCbvRnT1HgWA==
X-ME-Sender: <xms:ERFlY-aPgM6HEqmGMCnfW30TmzXo6Ebdseu3a-hdl-voPY6GYm4GUQ>
 <xme:ERFlYxYFBNLX8u2qWBGVKwuMlwoVhdOKs3K3BNul6VWktR1_JJJ2UbDo35JTyxJam
 clxYRYqXKUxBvYosAU>
X-ME-Received: <xmr:ERFlY49G8MN_KrZS-5czMcZAA4VQhIzXXmEF0OiFW4zBrA1M9bhcx7uS4_xf09Z6bgm8qYhtOWHt_fD5sdBKLRiHeMI5_1v5_WjD2bFOldf9uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ERFlYwrxaZ9E_N-JSOBTXpLUen3USPs4gxowOV7P2YjZV5p6L2jQHw>
 <xmx:ERFlY5phJiyD5RuroAvFRKtoQjqVFAIzoYVbp0wc6tElE0Yu6W8tOQ>
 <xmx:ERFlY-SG5k5tYlab6jMQZ7f0AUsX7Nr8QStvKumXnjxO7_nZvwS4gg>
 <xmx:ERFlYy4xAF6KHzFYmJpK3Js9u3ueI2qxQCMW_fnG9XBZUO2RqLjTSA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:27 +0100
Subject: [PATCH v2 10/65] clk: k210: pll: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-10-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3687; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=6IusAj9w3/tB8c67BjbXsxFLlirYjqevo85MFxaRu+Q=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp9nzthWO/9t0mWP8nM3/zoJhbxUmy21Sfoov+JM69Pr
 Dvfqd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi07sYGVoy354y73h5YENih8nUsr
 g9MW+nWu4+9+yQcnpXSND8d0cYGf6tkbWT0VozTcysrrua6ZDO77JVH8/Or98hHfVx9uLcRcwA
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

The K210 PLL clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-k210.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 67a7cb3503c3..279931a38127 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -537,6 +537,7 @@ static const struct clk_ops k210_pll2_ops = {
 	.disable	= k210_pll_disable,
 	.is_enabled	= k210_pll_is_enabled,
 	.recalc_rate	= k210_pll_get_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent	= k210_pll2_set_parent,
 	.get_parent	= k210_pll2_get_parent,
 };
@@ -544,7 +545,8 @@ static const struct clk_ops k210_pll2_ops = {
 static int __init k210_register_pll(struct device_node *np,
 				    struct k210_sysclk *ksc,
 				    enum k210_pll_id pllid, const char *name,
-				    int num_parents, const struct clk_ops *ops)
+				    int num_parents, const struct clk_ops *ops,
+				    unsigned long flags)
 {
 	struct k210_pll *pll = &ksc->plls[pllid];
 	struct clk_init_data init = {};
@@ -558,6 +560,7 @@ static int __init k210_register_pll(struct device_node *np,
 	init.parent_data = parent_data;
 	init.num_parents = num_parents;
 	init.ops = ops;
+	init.flags = flags;
 
 	pll->hw.init = &init;
 	pll->ksc = ksc;
@@ -574,19 +577,20 @@ static int __init k210_register_plls(struct device_node *np,
 		k210_init_pll(ksc->regs, i, &ksc->plls[i]);
 
 	/* PLL0 and PLL1 only have IN0 as parent */
-	ret = k210_register_pll(np, ksc, K210_PLL0, "pll0", 1, &k210_pll_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL0, "pll0", 1, &k210_pll_ops, 0);
 	if (ret) {
 		pr_err("%pOFP: register PLL0 failed\n", np);
 		return ret;
 	}
-	ret = k210_register_pll(np, ksc, K210_PLL1, "pll1", 1, &k210_pll_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL1, "pll1", 1, &k210_pll_ops, 0);
 	if (ret) {
 		pr_err("%pOFP: register PLL1 failed\n", np);
 		return ret;
 	}
 
 	/* PLL2 has IN0, PLL0 and PLL1 as parents */
-	ret = k210_register_pll(np, ksc, K210_PLL2, "pll2", 3, &k210_pll2_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL2, "pll2", 3, &k210_pll2_ops,
+				CLK_SET_RATE_NO_REPARENT);
 	if (ret) {
 		pr_err("%pOFP: register PLL2 failed\n", np);
 		return ret;

-- 
b4 0.11.0-dev-99e3a

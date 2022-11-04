Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47AF61D84C
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:18:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768F216FC;
	Sat,  5 Nov 2022 08:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768F216FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632684;
	bh=Q8gBzirmJeZ33RW5LvDEEWpimdL9veoEzpYNfMu3wJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eS8E+GBg5aWECRSTWdNVtyJNBAXc+6YYzDAE2f6gBK46ikak6XCCJL7tuB//jW6Rk
	 uWBetH5luk+zkT10CrjpGLUIDHsArbIv7Qqvh75IFXkTmeeUfZcsm5dudGNy0FxKni
	 hGa3DviyIpAE3DaGio3gRYTYWp57M+U7eR/k7pcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9289F80720;
	Sat,  5 Nov 2022 08:04:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB8B5F80448; Fri,  4 Nov 2022 14:33:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABCD4F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABCD4F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="CVv33buH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jMwMp/Au"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E2886580557;
 Fri,  4 Nov 2022 09:33:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568809; x=
 1667576009; bh=Ca8uceC6XTgaL0T6vfBE+x1DidRhuhT7oHwTsk34l0s=; b=C
 Vv33buHEaurk2brJFzaAzWWywkiilE/o2dWsnExRu2al4YAMFnjqJh6z+T5k1mYs
 LliIxGh4PRUY1BSQIKoqibutiB0PtZilhORBmRs7STO/XrlEw7lMt/1DuQaB+bYF
 WEIiTZMxPwjCbgP3F79Brux14UxSk1AchfPA2YHR0QLXUlAcgVWKsFtRpH7ThgpP
 7Yt0F3HLCwApHqN6LBjQaAYLN8wrKsj9nq8Alk2KQMUbiEhFe8xfhZt52GsuzYK5
 qmF7eGyfvlgAF6K8ReDFn0x5FDIoOVeUo1NISk8hbgDBvivX1t392/oNNvBC2oV+
 +O5Oqm3XCgDRC5G7LIfBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568809; x=
 1667576009; bh=Ca8uceC6XTgaL0T6vfBE+x1DidRhuhT7oHwTsk34l0s=; b=j
 MwMp/AuACxzpIn7x9Y6I74itNwvzGh5Mo6H8Occw5HJAf1n4oLlRNCKLi/8NTH2h
 M8HgUs87Hw300yyv5wleImX4mwd1gGCFC6W9miz7aEFFcHPmdc/P7g72swWh5Icy
 6VxculxJ5Bl+zLxOU7IBGrPhjFdR7CEE4lf/6ZLqxnaUd2qTvN/65AX1CR3auWWH
 3faBT0YQvxk/lIegVI0SGS2bqP8j2ui+0XQ8BExJAefn+KuGuvsAoU7uJLIVFLAS
 +UKqOUmoioZQf1ZF6Ux0WmZZldBVEIj5nIX+psZo/xmldj8gbxYRcSluoabm5twi
 sQ/xiUhDS0UHsgMXfvg/A==
X-ME-Sender: <xms:qRRlY8vF9Q5JW-QYrgvjyYpddP-Dqh9MrX5WbzWIXvnpDWNAM0PAnQ>
 <xme:qRRlY5e1c9eXHv5Naav5RxQKyOa2LIDVbjwR08wZ1z2RyXEctjC9LNL4IBpJWqcSz
 RB5XqX90JjooaT9yH0>
X-ME-Received: <xmr:qRRlY3xT_gEL0AFTIdl4YtQqXtYJMyMIhaJmszIDMT74jGWn3zOWYNI3O2i4c5Hc1yt14xVb_C6CAZh4gJvJhTStz7GrVDUaiKvuyIgEuqv3ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qRRlY_NffhukrAIERZJocyJuCnth7xBz2CrGQB_8NcbNaNIXT3bS7Q>
 <xmx:qRRlY8_wSqlxcGWyWKl9LEFw_LkeDPzzsX0x7ndl32gbK8OSspFGwQ>
 <xmx:qRRlY3Ue_WrHBpWaKLWZe0EVE5F8uEabz8kGCjuK-DPRv4DIJ9bLtA>
 <xmx:qRRlY6emQ03er17HHWE_v2OQPieYQchDv8SGTy2P6Wl5EAtMrBIFBg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:05 +0100
Subject: [PATCH v2 48/65] clk: cdce706: divider: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-48-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3573; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Q8gBzirmJeZ33RW5LvDEEWpimdL9veoEzpYNfMu3wJ4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8T7+n4HI+aJe2o9urg/uqEc/M0N8w6qHPz5BpjgT5h
 cZ/2jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEQZeRYcZ265vfpOz1U3ktvSICr+
 wLeHl96+73V1xuX/ES0QnzMGdkaG5/N3tDZ/JFTuFLR3+sePOOV3hv2J1L4jHHP76Rf3x7CysA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:32 +0100
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

The cdce706 divider clocks implements a mux with a set_parent hook, but
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

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-cdce706.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index dc046bbf83a1..a53769d239a9 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -288,18 +288,19 @@ static unsigned long cdce706_divider_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int cdce706_divider_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct cdce706_hw_data *hwd = to_hw_data(hw);
 	struct cdce706_dev_data *cdce = hwd->dev_data;
+	unsigned long rate = req->rate;
 	unsigned long mul, div;
 
 	dev_dbg(&hwd->dev_data->client->dev,
 		"%s, rate: %lu, parent_rate: %lu\n",
-		__func__, rate, *parent_rate);
+		__func__, rate, req->best_parent_rate);
 
-	rational_best_approximation(rate, *parent_rate,
+	rational_best_approximation(rate, req->best_parent_rate,
 				    1, CDCE706_DIVIDER_DIVIDER_MAX,
 				    &mul, &div);
 	if (!mul)
@@ -344,8 +345,8 @@ static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 
 		dev_dbg(&hwd->dev_data->client->dev,
 			"%s, altering parent rate: %lu -> %lu\n",
-			__func__, *parent_rate, rate * div);
-		*parent_rate = rate * div;
+			__func__, req->best_parent_rate, rate * div);
+		req->best_parent_rate = rate * div;
 	}
 	hwd->div = div;
 
@@ -353,7 +354,8 @@ static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		"%s, divider: %d, div: %lu\n",
 		__func__, hwd->idx, div);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static int cdce706_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -375,7 +377,7 @@ static const struct clk_ops cdce706_divider_ops = {
 	.set_parent = cdce706_divider_set_parent,
 	.get_parent = cdce706_divider_get_parent,
 	.recalc_rate = cdce706_divider_recalc_rate,
-	.round_rate = cdce706_divider_round_rate,
+	.determine_rate = cdce706_divider_determine_rate,
 	.set_rate = cdce706_divider_set_rate,
 };
 

-- 
b4 0.11.0-dev-99e3a

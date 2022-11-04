Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042EC61D85D
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:20:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C13E0170A;
	Sat,  5 Nov 2022 08:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C13E0170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632855;
	bh=wiPrQrPtwHN8JkTzjgovj5i1AFxQRgKSk4e/VekItv0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QMrL6s949Bov6Fc4iQ/WW5//OliTzMGGBlGlLaG+Mb9QDTVtNEDMda3HaSXiTPhIj
	 WIGjAqqczRiogGbDCHCapgaPWshDrahYuEhSxb0mq8cdQ4pwN2amz8U3pBZ8K2JBtl
	 vO5qfB7CVnx1GGdG13xG0oLPpKpg24FJDbc8cYcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F981F8075C;
	Sat,  5 Nov 2022 08:04:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B02EF804AC; Fri,  4 Nov 2022 14:33:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7ED6F80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7ED6F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="YtFpLN/R"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IDim9Knh"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1CB475805AF;
 Fri,  4 Nov 2022 09:33:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568836; x=
 1667576036; bh=8i9Mndy2jbfBk1MIVA7c/A2hrdbXrLt4ZlzMYH+ZKBI=; b=Y
 tFpLN/RrfKWUEcWDR0f4VrdRTlj4gIMKGGpfK0akKub31fTdbquIY/iS3Ua2LFqo
 chXDAEUzsvUrNYDMr91oZozPbA1gpnelWwcINGl2rx+gHlT6em+qGNhMZ4Jpbo+s
 OxWGotUcAVThTMFOKgTnbY5eVDjboisUaiJqJXcvmmAQ/x8LioOlI0Gw4zjA8i0r
 YcF3pggSXgWn5eQd3A9hrEUHDTDKmXHsezYWpKflijmMJETSEA1OuyQakkyyKH9E
 f9Zw4Tj341f7UEjA+mG7kxo/uGP/D2HT32QZzh5aVzVo0fkdHtHEFgpklLUePDiu
 +/50mfTLVF8VAFoDbo+8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568836; x=
 1667576036; bh=8i9Mndy2jbfBk1MIVA7c/A2hrdbXrLt4ZlzMYH+ZKBI=; b=I
 Dim9KnhBoO75TmaMviA33lXsyJaI5GzBZhMxr7PkD2xhbo4GP+AAk/aLXQuiGx5g
 gBq2LY6aTVQDjm/uWk9LEKn+6vlJTw0bdMMgvWzsxkNNLli5iPshkfcFqTZ983y9
 UnSDBNmrN/PSdmukA7VZhzVEQTyNRUBT6R7kicjqHtX8UoTrBEreK9m56whIkCoP
 VTfrQM0aJfyLkF2x+qQpo2BugpbKSVEebmNKyHDY6PCE+4//j89QnLeD/Mr7LqZG
 6xzsj9WkR4zZDyJa+fKLcPkGmFseQ2AJTkgkdowkMltbPQWAQBwIwRQHyq9/whOZ
 ZmaOxa1PlWGSgJ8frasGQ==
X-ME-Sender: <xms:wxRlY_sGaUKevWVJcyUWxXmH_gF14N4bWQN11bmRePnvVSai8iA9YA>
 <xme:wxRlYweXVwQYfjMOnu_orcFboj0UgVJbgOFePmjCiqUJ0TgHS_jHaYgpxXPX6YlD0
 lbJi89X4ME9_hJbqM4>
X-ME-Received: <xmr:wxRlYyzwz87gIICWoAMSvh1qDLD0w_tlewKaE9XxM22KDLnwDZ9Lbd6CyUhB0kwbUIgC8REVHMg5L4cRbCjrs6r4KQEVftdOMhHhl7v9Qp4otQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wxRlY-M2xLXb2o2X9JvAgpWTdk8tzd77fs3G_O89BKyfGhHPVUZEow>
 <xmx:wxRlY_8UY10jK9A0kF2NsrKGiBxLBAqT1IE5AlUkQ7ZLRGk3KT_i2Q>
 <xmx:wxRlY-WmB8bYawzGPDv5ppZqGGo8HW1ayy05wOhsijdSQRm4hCOBPg>
 <xmx:xBRlY5dsSb2BVE_qW1PBYqjGk9oiX0uB6lms6dkAlzDGMKViO62QGg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:17 +0100
Subject: [PATCH v2 60/65] clk: stm32: composite: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-60-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3796; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wiPrQrPtwHN8JkTzjgovj5i1AFxQRgKSk4e/VekItv0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt+2uc8y+efrdmg9i7mF6t9F12s1T8acW/1o/bozHvv/
 7rVO7yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEvjUy/M9KP163gqVsrXqg9h954S
 fCJlMuyn63NnK9Xp+vJOM8kZGR4bf7tEXfjytNd2E8m5rGw/yAJfHgUtvQST9Zou1Ezl6sZgMA
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

The STM32 composite clocks implements a mux with a set_parent hook, but
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
 drivers/clk/stm32/clk-stm32-core.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 3247539683c9..4027ca7d9806 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -349,14 +349,15 @@ static int clk_stm32_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long clk_stm32_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *prate)
+static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_stm32_div *div = to_clk_stm32_divider(hw);
 	const struct stm32_div_cfg *divider;
+	unsigned long rate;
 
 	if (div->div_id == NO_STM32_DIV)
-		return rate;
+		return 0;
 
 	divider = &div->clock_data->dividers[div->div_id];
 
@@ -367,14 +368,24 @@ static long clk_stm32_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		val =  readl(div->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		return divider_ro_round_rate(hw, rate, prate, divider->table,
-				divider->width, divider->flags,
-				val);
+		rate = divider_ro_round_rate(hw, req->rate, &req->best_parent_rate,
+					     divider->table, divider->width, divider->flags,
+					     val);
+		if (rate < 0)
+			return rate;
+
+		req->rate = rate;
+		return 0;
 	}
 
-	return divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					 rate, prate, divider->table,
-					 divider->width, divider->flags);
+	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
+					 req->rate, &req->best_parent_rate,
+					 divider->table, divider->width, divider->flags);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long clk_stm32_divider_recalc_rate(struct clk_hw *hw,
@@ -602,7 +613,7 @@ static void clk_stm32_composite_disable_unused(struct clk_hw *hw)
 const struct clk_ops clk_stm32_composite_ops = {
 	.set_rate	= clk_stm32_composite_set_rate,
 	.recalc_rate	= clk_stm32_composite_recalc_rate,
-	.round_rate	= clk_stm32_composite_round_rate,
+	.determine_rate	= clk_stm32_composite_determine_rate,
 	.get_parent	= clk_stm32_composite_get_parent,
 	.set_parent	= clk_stm32_composite_set_parent,
 	.enable		= clk_stm32_composite_gate_enable,

-- 
b4 0.11.0-dev-99e3a

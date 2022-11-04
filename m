Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F561D84F
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:18:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA4B1707;
	Sat,  5 Nov 2022 08:17:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA4B1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632713;
	bh=Qbffwobc2f4qG6KNVK9kakvzDTd3L35C5TOO/CHBHR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mv4O8SH5hHSgW3Ro+FwbiNbglYmZznVffMthtFOrH3rlxe8v6kZj2VBo4WtyNXjhx
	 gYuKshpyu0Mos4wagwij8KUHgFMVvFEaiDmCGP6aqmQCquIJOgRRXJanRX9S5LXXK7
	 D3N9wGufGDjMaPlbTGyXSrIpRH5VOIOmRVkUcXGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D64EF80730;
	Sat,  5 Nov 2022 08:04:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3898FF8047D; Fri,  4 Nov 2022 14:33:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E06DF801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E06DF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="QMKZH4rO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="um35+KlR"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 95A5E580260;
 Fri,  4 Nov 2022 09:33:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568816; x=
 1667576016; bh=+AiYlQRmsw0uLRfb7MwzL/XTfZ5Fxn4mSWP4u38OBc0=; b=Q
 MKZH4rOQfBAUFPl2kU8N+az8xxxzqHwnfoagnSqHE4Z4x/I66CzikPa9khpog+TK
 mX5CiOHHyetOrtj5B5H3oIai0cVqAz7dsmhKFDWMDsTaflteAVnw5lplRRRmLh2M
 AwISHUMsvI6qMf3oyCHUzrW2nWnzxDhB+dLoQUwjMTZyQSS+7khRSHzVzcEcVxM2
 YKRWdcWPqrs4G1C5tx7f1ZP8ishZc1U0mjkL6kw6P/cKmGfBySebzcoWlL4YC0hD
 qBonwLy3SAxv6/yCeqViGDywUyfo88TjitYF+NT3aBFKZT/+J2+h9egozrqnvV+C
 0ketKOn02usfgtAXomy+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568816; x=
 1667576016; bh=+AiYlQRmsw0uLRfb7MwzL/XTfZ5Fxn4mSWP4u38OBc0=; b=u
 m35+KlRBkM503Uuc8W388SCArOUQTpzxXyG0lJs2th/3sKr+hh5s1H795WNFZ2E4
 RzXoCzo3P804NnZRfL4cqR+NuGicK8/MPhJQ6B47tqh4tBFEREUyQal/H2Qna6pW
 PvW7w9AY6XTnG9PIma4faNayN9B8YAjDkKdryWnWPx/qtCTKAo3hzCGEh1+UXPiI
 6WICivcddpyfdPgqG8rMzRFrY7vqHpG7G3tD6paTJ/iFjGpRGJrQDCpaLEizkpk1
 vbEgKqSaOEczPSmpqPpZs9Jp/goRDfBD41UfLRtPXxrVMHtgZcjPVT+9+cGYzLcU
 Egtp1AK7+MLlRuhE5n/Mg==
X-ME-Sender: <xms:sBRlYzUNaaVfnV5EqHlsqaA-REKqn87XUxokvt7NfHsJetCr5B0MZg>
 <xme:sBRlY7lZajrvzxWHx51z4NQ95DAKK4o-7LBVHAt2dT2ff_WxwgYSxj-w2VcRTXCMj
 3l0O4mJ3v4cSQsdUDY>
X-ME-Received: <xmr:sBRlY_bB0IfPftiSMLWVeLyDjTxnJMfllOoCtH3MAwUM24qC-_ICI5ZSbOxae4DwfO0OBWvQYFr-815zzyPslk5Bk3WHetS2VLjLEWKiHdoFvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sBRlY-UF0clLTXB1V_cuzi0jHeTkodj5tMRMndVQ3AxyjmNx4I1YGg>
 <xmx:sBRlY9kEq_o4o4BuRnyLDdQWYo5PpZHDzy5mJlhUipwojKLCD3JPvA>
 <xmx:sBRlY7eiHogjfIxd2WooB3GVmLokVfQLukJdOdHhzNu5nTROFN3O_Q>
 <xmx:sBRlY7nbW_KUPxY3wnOzYGlaqWUplPl9IR4JO_7Wy-IvNAW2PGFo_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:08 +0100
Subject: [PATCH v2 51/65] clk: si5351: pll: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-51-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4022; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Qbffwobc2f4qG6KNVK9kakvzDTd3L35C5TOO/CHBHR4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl/rPYvbg/V0k9JrtXWTEhtePJyVwTpD7du9IEn5uUcO
 /uruKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERaDjEyzLps/b5q/Y0muQOrVQwX/6
 s5ydSl9tDnhXDV0qWrE1MrLzP8039RZxmyy+q9ZeHk3GVbpaT3esd/K34Sf9dHnHXSve53/AA=
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

The SI5351 PLL clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5351.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 9e939c98a455..fcf5785ba4ce 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -442,11 +442,12 @@ static unsigned long si5351_pll_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)rate;
 }
 
-static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int si5351_pll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	unsigned long rate = req->rate;
 	unsigned long rfrac, denom, a, b, c;
 	unsigned long long lltmp;
 
@@ -456,18 +457,18 @@ static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		rate = SI5351_PLL_VCO_MAX;
 
 	/* determine integer part of feedback equation */
-	a = rate / *parent_rate;
+	a = rate / req->best_parent_rate;
 
 	if (a < SI5351_PLL_A_MIN)
-		rate = *parent_rate * SI5351_PLL_A_MIN;
+		rate = req->best_parent_rate * SI5351_PLL_A_MIN;
 	if (a > SI5351_PLL_A_MAX)
-		rate = *parent_rate * SI5351_PLL_A_MAX;
+		rate = req->best_parent_rate * SI5351_PLL_A_MAX;
 
 	/* find best approximation for b/c = fVCO mod fIN */
 	denom = 1000 * 1000;
-	lltmp = rate % (*parent_rate);
+	lltmp = rate % (req->best_parent_rate);
 	lltmp *= denom;
-	do_div(lltmp, *parent_rate);
+	do_div(lltmp, req->best_parent_rate);
 	rfrac = (unsigned long)lltmp;
 
 	b = 0;
@@ -484,19 +485,20 @@ static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	hwdata->params.p1 -= 512;
 
 	/* recalculate rate by fIN * (a + b/c) */
-	lltmp  = *parent_rate;
+	lltmp  = req->best_parent_rate;
 	lltmp *= b;
 	do_div(lltmp, c);
 
 	rate  = (unsigned long)lltmp;
-	rate += *parent_rate * a;
+	rate += req->best_parent_rate * a;
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: a = %lu, b = %lu, c = %lu, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), a, b, c,
-		*parent_rate, rate);
+		req->best_parent_rate, rate);
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5351_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -533,7 +535,7 @@ static const struct clk_ops si5351_pll_ops = {
 	.set_parent = si5351_pll_set_parent,
 	.get_parent = si5351_pll_get_parent,
 	.recalc_rate = si5351_pll_recalc_rate,
-	.round_rate = si5351_pll_round_rate,
+	.determine_rate = si5351_pll_determine_rate,
 	.set_rate = si5351_pll_set_rate,
 };
 

-- 
b4 0.11.0-dev-99e3a

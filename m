Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9E61D858
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:20:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6641D170C;
	Sat,  5 Nov 2022 08:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6641D170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632808;
	bh=+/l/s0ydlizM56vbOYruDyw3Ne8uTB/GZrYOy/EaaeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vDEbhtjDw/Mr9Nn54w/tD5zdPhVfl6CRFOmoDyC+x5U9RG/tifNM97yx0SS4rcQ9o
	 vwfn3hTvY8cfzBZkbmzFq+J3Ji6seQDmURDMWdPwMC9VgxpC1zxkZM9Iqh08kyGqJx
	 yOX/eU+p7YQS4lbk3u3rwn2Yiqph8Y6xQ8pKpuqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB9F9F80766;
	Sat,  5 Nov 2022 08:04:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59BA8F8049E; Fri,  4 Nov 2022 14:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DD6BF80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD6BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Qw0wQGCB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RucYl3m2"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 66C2F58058D;
 Fri,  4 Nov 2022 09:33:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568827; x=
 1667576027; bh=+rhKeJrs2s5Tbw0epy9S7OEOW4HBQEwW9Fe83Y4csGg=; b=Q
 w0wQGCBxhQtQGlbixoAT+qMUoEcDsIy6LIps7XRmFMTWSVeMAPwmerqgfvyHejlr
 H+Z7b9CGlFGG34AUunuVAgFe9ldDrBxVnVsT1gwmV8TBkfz83A8AhpCoNMggXdBt
 F1kFxi0RFNocFCotjhk4SpJ43BRDT2hY7zxzMpvYEE83XqZ9js8diV47+CkVwAaO
 ySx+TS/26sSG+e0znlSf7XbPujdlMhxr1zDz7cRHSGQj4XKHsNAGbsbgFFLB3/jW
 74PR6BaZ5bDmHXfDgffNZ8EK7y2GwVfJ4VvY8Jrj/A7F/kmeHQNGaMcQyRDr1RRd
 4zl0atU59MB4U39mqZ19g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568827; x=
 1667576027; bh=+rhKeJrs2s5Tbw0epy9S7OEOW4HBQEwW9Fe83Y4csGg=; b=R
 ucYl3m2HwHg2BDYRjcPtc07kAiRB4XogMmHQxKgbUP7UpoExrL2KcOrl06XmGhIT
 q2zlRB2WDpWumAfE3EdkrcCL0ajq4Cp58aXe8KWvmSva8rUP2XPVk9luTzW7TKnr
 Ss9WorYuMk0ZgzqNSOaRjUjdJh9sLubDuC2hGRj0s48C6WnHA/oJw8ug+n2lTXpU
 YcAbcXtsCKyX9j8/1Rn1U4vuUD7haUIKud6GSEINjfHHx8jsimgxrAd3TjtSXpt9
 BsyRHGLucxDMwkzA6BIsM4HvkGYYKi4+2EsLBy0d2TY098MVdskwf7hQ4L2wRQMZ
 oI8AACrw1jFg16bNj2kIg==
X-ME-Sender: <xms:uxRlYx51gPV_TfdhkeLKbVbiT94vYjb4GP2ufOkGau7cMGSoVkmdDQ>
 <xme:uxRlY-7tiDRolCxwU1PVIMLC2bzmj7HHWYyoPWFdRySMYURskNl4wr0uS8tEul80W
 EJ1YoHHDjf_Ff3D59c>
X-ME-Received: <xmr:uxRlY4d62RbRDjFC3nEmU_z-92zNDaAafANFAGSTRJFFu05VvcKDK34RzGaFXZ1Z7LsyUjdpsJGFSlEnkdcOSj9kA0ESYqtD4I1m7Y94XYQQ6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uxRlY6LhBWpwQxaf2hf9hJkrlsqJuEF9xz7zVAo_HrgWjdYh2bIYfQ>
 <xmx:uxRlY1Ji1CYFJgxkjUFLyehrFO0vKJNNI3eEco70q5YcVEr9vBiYfg>
 <xmx:uxRlYzwlQpkAJ4zS_iTcbSiIphfMeXWOyswaDXT4p-1KnR98Dvej_Q>
 <xmx:uxRlY0Zrzz2lPdAGUjJ-HuZMOUJDJHWqIyweSRJacXBx7GZP4g1bUg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:13 +0100
Subject: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3004; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=+/l/s0ydlizM56vbOYruDyw3Ne8uTB/GZrYOy/EaaeM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt8uhoWy8hfPYBPIa/m5cU5FueThKfVBKfUfVv3itJkf
 bavcUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIno6jAyHNqr91dgD3+Cm8SXP7ta/F
 Y8efnG16Gps/uRt8Xvj0erOhkZzqxomnxtfUKd47rNn30PKSVGTl7gOLNk2y3HN4Z/pohacAEA
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

The Ingenic CGU clocks implements a mux with a set_parent hook, but
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
 drivers/clk/ingenic/cgu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 1f7ba30f5a1b..0c9c8344ad11 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -491,22 +491,23 @@ ingenic_clk_calc_div(struct clk_hw *hw,
 	return div;
 }
 
-static long
-ingenic_clk_round_rate(struct clk_hw *hw, unsigned long req_rate,
-		       unsigned long *parent_rate)
+static int ingenic_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 	unsigned int div = 1;
 
 	if (clk_info->type & CGU_CLK_DIV)
-		div = ingenic_clk_calc_div(hw, clk_info, *parent_rate, req_rate);
+		div = ingenic_clk_calc_div(hw, clk_info, req->best_parent_rate,
+					   req->rate);
 	else if (clk_info->type & CGU_CLK_FIXDIV)
 		div = clk_info->fixdiv.div;
 	else if (clk_hw_can_set_rate_parent(hw))
-		*parent_rate = req_rate;
+		req->best_parent_rate = req->rate;
 
-	return DIV_ROUND_UP(*parent_rate, div);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);
+	return 0;
 }
 
 static inline int ingenic_clk_check_stable(struct ingenic_cgu *cgu,
@@ -626,7 +627,7 @@ static const struct clk_ops ingenic_clk_ops = {
 	.set_parent = ingenic_clk_set_parent,
 
 	.recalc_rate = ingenic_clk_recalc_rate,
-	.round_rate = ingenic_clk_round_rate,
+	.determine_rate = ingenic_clk_determine_rate,
 	.set_rate = ingenic_clk_set_rate,
 
 	.enable = ingenic_clk_enable,

-- 
b4 0.11.0-dev-99e3a

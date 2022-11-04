Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835E61D859
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:20:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 132A5170D;
	Sat,  5 Nov 2022 08:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 132A5170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632823;
	bh=MbfBGfNkM8+Fx2bW6mWZyrQOFEdgYBpFkszGxyCct/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFiYZ2JmWmzkLvlqDTp5NpWHXwqOlgB0EEk8G6PHymI/Ab3eDU2XmZ+R/rsmleTwQ
	 PpfHIAFmG+bPCh44l3yq4aD8ti+aIIF3zFZTimKN7Tzjdm5d2dg2P6u9ZwnhteAFCF
	 X1WwYaGN6yTQYeG0NZ+q7z6gZEwxbAFqguNZ8LhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9232F8076B;
	Sat,  5 Nov 2022 08:04:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 359B9F8049E; Fri,  4 Nov 2022 14:33:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFFDCF80448
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFFDCF80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Q3alsfm9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k2IfcCL8"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id EC3235805A9;
 Fri,  4 Nov 2022 09:33:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568831; x=
 1667576031; bh=3SayXt0/D6WxnYze/EYNShXO6XiADGikWDKu2qyjPH8=; b=Q
 3alsfm9UsUSiVuvki3aPQBiMbtcumgeCqm/udg1EnIjDa4XLZiG/Gj/RNjpuFO3+
 kHUxfVO7z+WjrfDZ9Jm0aoSbyodiNgm2DGJQRybGX3hChO9nDBHTsUbC1y9EgNqM
 z1zeJOHLSPDbJ1mqYNrfVMBcjjBnJk284GBSopqV/anlXaoEEEA2K3AQsiBRpNb3
 NAF9Ip0GDIbLO7d/VyE5LwbVpFmDWhQBxCIvYEtMDnpcYkL4Ylz5mw3dSylSOPMC
 +7BSLzNwihfkTJe+KlSAI+CQFfEUXo/6pmDPBfoJQgRz6Q4dFmCQN8urky3mGz02
 XI0G/xprHLTPqrursWLxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568831; x=
 1667576031; bh=3SayXt0/D6WxnYze/EYNShXO6XiADGikWDKu2qyjPH8=; b=k
 2IfcCL8aVNsXppKPSwBg7YkXwLHTF+ofimflsF3lzaP0Wl3fC3zcYMWb87hTzeJb
 MjXWqTbiNiqbqn/ZlXWVKrQZjEwbaKsK88oGk18mcmQeSKKE21Rccx/Ti+/R3jVu
 XAcSMsBANE/iKkpVXVJmgWuAT2LzycZawKeIlYJ4GcifB5yAB7iOXQ0CUhCn1lNJ
 vQ8aCtlxuJBVCS7r2WRepwLaqX+MnJdVkRQA8Gk1zSnyf0mqIgFrWQb7cw4nLd/R
 GXaom5wnteT7EheB1X2eYFwprXyhpZc1G7N8mU0M3r9ExQpRwCv5atQaI5qT4hgx
 7m393h0+PDTxONdwjF0cA==
X-ME-Sender: <xms:vxRlYyLuoDLa_nwCFtKTCQbyvyG8e8f_AIMFWuVHimwSAQ8SQ-nvgA>
 <xme:vxRlY6IMxm981-6IQMPjRoKXJC1Ua62qvwx2v_zy6ZbEB5LRCtk5zSXPcWetdF8-o
 -DLexmx9Ii8daqzJxw>
X-ME-Received: <xmr:vxRlYytFZZ8N29MSnMyr354hHnnKc_YzLlVq_kfecHUWoFu_YmFQFw61iLTIokqLgMWqnjAKmkpBzqJ1tDYb1DbKjer3GdTgkJ6TfcL2qu4Eqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vxRlY3aByiwkk5oxKjpEKagmnGpOPnmndpg4gQjj3Ilb7GgHs5BwKA>
 <xmx:vxRlY5bnlOsu07dTU3eetC00JGRwabUQ7sowwjPJXr1iRcYmDB8QiA>
 <xmx:vxRlYzD7pSlJ53eBjQDvxLkV6obRrxl33X2zJc9yyOCYFwjhVKETpg>
 <xmx:vxRlY1robqxis5S8PaOYdcx7BwRV-iBXHBwRI7x4eHXngkhfMMskEA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:15 +0100
Subject: [PATCH v2 58/65] clk: sprd: composite: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-58-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2634; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=MbfBGfNkM8+Fx2bW6mWZyrQOFEdgYBpFkszGxyCct/o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt8q5ZTls+9o2XY9lc2ZaaDIeyCNPWbOGsN+pavfum4s
 ZcvrKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERi1jEyrCqQsJ926f6TzvqDFi7n1K
 qcLqfeufKy72+ZZtu7+89jexkZ5k5kX1LJdmVj15Z1r7ZGxm2ydpx1/FrrgjL2NWf/ybyczwgA
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

The Spreadtrum composite clocks implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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
 drivers/clk/sprd/composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
index ebb644820b1e..d3a852720c07 100644
--- a/drivers/clk/sprd/composite.c
+++ b/drivers/clk/sprd/composite.c
@@ -9,13 +9,19 @@
 
 #include "composite.h"
 
-static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int sprd_comp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sprd_comp *cc = hw_to_sprd_comp(hw);
+	unsigned long rate;
 
-	return sprd_div_helper_round_rate(&cc->common, &cc->div,
-					 rate, parent_rate);
+	rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
+					  req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
@@ -53,7 +59,7 @@ const struct clk_ops sprd_comp_ops = {
 	.get_parent	= sprd_comp_get_parent,
 	.set_parent	= sprd_comp_set_parent,
 
-	.round_rate	= sprd_comp_round_rate,
+	.determine_rate	= sprd_comp_determine_rate,
 	.recalc_rate	= sprd_comp_recalc_rate,
 	.set_rate	= sprd_comp_set_rate,
 };

-- 
b4 0.11.0-dev-99e3a

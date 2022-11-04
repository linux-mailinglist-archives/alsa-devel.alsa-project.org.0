Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B661D803
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:05:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41BDE167E;
	Sat,  5 Nov 2022 08:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41BDE167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667631923;
	bh=UUWQAfB4LjFBOSGFZ6uyIELdMsnaIf0eeBGtwWhM+3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHy/KfwPawbx9Vh30wpinfWcNDqm09qtQpENTg9hrKW/6nRQ65+VZ34mtcGRKJ6LM
	 nTjwX4zd8zmH74Ri9+nVJyR4Dmxn9jXvifG0PdI5Wdo1742m1KCqAUD2AXOHmtyLAW
	 HyGj3XCUZhowW0xocQddt0u/lBNs+V6Im7ZnSVC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10CBDF8055C;
	Sat,  5 Nov 2022 08:03:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4789BF804E7; Fri,  4 Nov 2022 14:18:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52C14F80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52C14F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="e1ZeoTlj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="O1TqjhPO"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 61D9858044C;
 Fri,  4 Nov 2022 09:17:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567872; x=
 1667575072; bh=06erX3Kj2Cpg1UoaP6NUgmKg6CRYa/Sd79GEp9CTLUk=; b=e
 1ZeoTljhCPkZpz2rIoVn4PYG9rZGAspv5rnLPPk41E3S9iCP+0nCwdQvSyVEpKlr
 Z5Jiu8Mbec/PKLsbqcILj3878dmHzqvG+e9pk3gXVjxy+FUYgJbQqCZIE0NxHDJ6
 FOf6Ez+WuBz85DACVSv1TfoY2uCWu6oSxx0yLC8K8Wkq+wRK8MlPV4X0RXDQwiGK
 qQ59Dzpv2S5quPC/rxmIxn5jsKMIDI1Z5NpVGGAmUrQwdS6AtSzTQiXeahLbpbv1
 fyZ2iR/6sHpVBP7gQk9WjuiA5ucOSZfWC37s3dYrDDB3LWJ7SUC5/SptcCEcvd1J
 fIQccRyog/25GtPWrg8wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567872; x=
 1667575072; bh=06erX3Kj2Cpg1UoaP6NUgmKg6CRYa/Sd79GEp9CTLUk=; b=O
 1TqjhPO0LY4RXuxO29Nix1PCYvo1wCARUQeGv3LyVWVwqLlizWkmKCf4ONBaxIyX
 y0c3rBl6+5IohCEpE3AmLurPhH1TpSY422cJaHmD6fA9H45dkj74X7c2SBob5UMJ
 atcHQwp7sU33ZPzAvoDn7SIoHBxNcgkPrjZ9AP5+yi08cxEKT7IgaLG+n6h4CVbx
 9kBAd0rWUHqYq4S7rwT6hwzy2RhFl1Fve1/j8L7h3peV+9hRZjRjvwfI+3aPpdie
 9kgkIqVYCR+GZOzR01+RuVCjS/l8gYgWMyVDgh8E6W1fuLMpv/7PvvqbwoGytXWZ
 mdscHkxnn0JPA9QiFdt8Q==
X-ME-Sender: <xms:ABFlY_dJpQD9hcGry3hBHYYckdcnQpNy3dsh74dzGjsYN9wGMbIWDw>
 <xme:ABFlY1OEfnCWIe5C33S-adK8w5Q4ZhTsV2ENpe0K7k_WfwT7mZDQ_80Lb28I1wGJr
 a9eu8d9fO4qpF6uzQA>
X-ME-Received: <xmr:ABFlY4hBpX56ErLfM4fX-GGFztlW0lFJmFNN_Ze7gvHpZoCFSMATNW0yt-BAVDn-DmGDoOnTnB2G5-UAzohkRovZkpvY4OtEsN37CmavcLHp8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ABFlYw-DgANXlXvxTorZPiqI1K4NE9FxHGBpYOy0Fe8UYlBuvdQR3Q>
 <xmx:ABFlY7sLjwO_bDmdsK2JWkcP8Gahy0ULxLN7Bi8KQhSg66ubzg2Z0w>
 <xmx:ABFlY_GcvIPFbzURXkvd-U8XewfaQ5VfJfVlsyuXWk2kTR6cVyjxwg>
 <xmx:ABFlY4ObWRjqPTCdsP6YSGjeS2QO6RdkD01nCaFrs_4ctu9H2dKeiA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:19 +0100
Subject: [PATCH v2 02/65] clk: lan966x: Remove unused round_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-2-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UUWQAfB4LjFBOSGFZ6uyIELdMsnaIf0eeBGtwWhM+3Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp80QlY2nviyod257eWMD6xV2dMP2fspWXFExnhWBFwp
 NQruKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQ+vGX4p7RFJ8c9ym9KRP3i+j9yG9
 f4pdRXfxHeFsm382TzioAPEowMM/46eBx3YEqvMhJnNg0UUA3Yslxced5S2+ZZYt2ZL9qZAQ==
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

The lan966x driver registers a gck clock with both a determine_rate and
a round_rate implementation. Both are equivalent, and are only called by
clk_core_determine_round_nolock() which favors determine_rate.

Thus, lan966x_gck_round_rate() is never called, so we can just remove
it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lan966x.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/clk-lan966x.c b/drivers/clk/clk-lan966x.c
index 460e7216bfa1..870fd7df50c1 100644
--- a/drivers/clk/clk-lan966x.c
+++ b/drivers/clk/clk-lan966x.c
@@ -103,22 +103,6 @@ static int lan966x_gck_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long lan966x_gck_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
-{
-	unsigned int div;
-
-	if (rate == 0 || *parent_rate == 0)
-		return -EINVAL;
-
-	if (rate >= *parent_rate)
-		return *parent_rate;
-
-	div = DIV_ROUND_CLOSEST(*parent_rate, rate);
-
-	return *parent_rate / div;
-}
-
 static unsigned long lan966x_gck_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -177,7 +161,6 @@ static const struct clk_ops lan966x_gck_ops = {
 	.enable         = lan966x_gck_enable,
 	.disable        = lan966x_gck_disable,
 	.set_rate       = lan966x_gck_set_rate,
-	.round_rate     = lan966x_gck_round_rate,
 	.recalc_rate    = lan966x_gck_recalc_rate,
 	.determine_rate = lan966x_gck_determine_rate,
 	.set_parent     = lan966x_gck_set_parent,

-- 
b4 0.11.0-dev-99e3a

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C98B61D850
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:18:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDBCE1709;
	Sat,  5 Nov 2022 08:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDBCE1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632729;
	bh=LBRgLD6ule1i9P91PA8GWOAFBI/bOqx0LkhzNbQyeKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0kpy3xydqxwQjgfMOrghcqTdOMimR8AKOh1l1mNECucNx+OONsbgF26Q/ZEIU1nQ
	 pGirFbAl6bTyZioGwQvYtBV20XdianyMMtZXD6+8EWM4HSCq+MCSkbhVGNL9jHbqq6
	 P1/Zd8LvQwix2B4uVBGD0XWokpJ0rV69acinHx98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7ADCF80733;
	Sat,  5 Nov 2022 08:04:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FA3FF801D5; Fri,  4 Nov 2022 14:33:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F163AF80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F163AF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="yavmSF21"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ue3G+wWD"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 28DAC580559;
 Fri,  4 Nov 2022 09:33:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568812; x=
 1667576012; bh=hLZAHotGbvX5RCXUVHAH7bvNpGr04f++TPN1ala9Hwk=; b=y
 avmSF21AqBq2otaD9WpEPbsopcxp7067eucqG0A/J5D0qgh3C7nhhQkuxa/UBDeM
 zGsRsBtv//2zvo1LAeaS86hlrLNLZye7tOsLnvYO2w8Wmh8INPPZN0VI4dGcDs8a
 Jv30In4FPtUatIgm8BsX6E6NmJcn1Hcovrsq1QdrNixbR8scF/TmZ28kvu+d+hqR
 tVgBXonGqTZoytTaDa56ngd21clkTWuMOBmV7KiQxQue89LKoFmEgHkM1sA4Dz2A
 DecNxM6P4eO1hrvU6MfOo/hm/n15EqBNxObP3SF3UbUfnzS+y3c9ko4B2uEJNIVE
 NNN2ePJcaGIxOvUcFeqiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568812; x=
 1667576012; bh=hLZAHotGbvX5RCXUVHAH7bvNpGr04f++TPN1ala9Hwk=; b=u
 e3G+wWDcY1Mo8Jt9Trr95g7TEadmjVfWiFRo/eUCALy5vyJhy35+VsUeclRxM7X2
 aHs6IdN11wGptGVg1pnrQj1WMlMNf8sYkg+3I7u/PCFUPNU/cmyCOibtn99h8SSL
 jP8cCPM0T290AYJm0ZJKurkEMuG12zjH3HXjkWU+8Fg0OfzqhfMbOt27AdkZRuw+
 ixQJvGUujEe/sj/uv+Zs3ku+W9ug2l0wjuGQyNatfxqiGeCUUefghnakBPIGTm2p
 +ULUu6tYyxGiAVE0REV4APfXiMxhButinhuBFdnPHn35ebNeuFGBf3GB4bIVjWIj
 5nuDZbZwKMlumDMYlw84A==
X-ME-Sender: <xms:qxRlY0LfWzrCZELA0VBq2MkzL1Ka36b1K0LvzKnetx61roE9Tma2Qg>
 <xme:qxRlY0J3gbj3fFEIjyuHkx8s3s7axINZUtLv6Ve5X2H9tLq-45EnP58W86hQ8IQJC
 6fk-K8ZTMKq5VfyhF4>
X-ME-Received: <xmr:qxRlY0trfQQriJKjQdLFTtsYR2kWmlFozQmI_ZlMy5radNafsXFiQKIZJ8RpZxjgo0m2fhYcTujyIk_OW9flldkqilh8DOByvNQiIT8OBe6Y0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rBRlYxZ9089tOG3J0q6dtY1o91_QlSAt84sCn9CF4y9yIfLxQPRdoQ>
 <xmx:rBRlY7bK-R-GI813aZ9Mxs51OV3_-Y_JkDZ6iQb6rz6YDSnM4OfNZQ>
 <xmx:rBRlY9BvKT6Zp8O66iRB3o-SlGkp2rHVlsye8NnRPFfs8nJR2QfG2g>
 <xmx:rBRlY_qdhkN6RI66njRQ3lsI3rekdaxzUOZje2r8rXc33bLmWWut2g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:06 +0100
Subject: [PATCH v2 49/65] clk: cdce706: clkout: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-49-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LBRgLD6ule1i9P91PA8GWOAFBI/bOqx0LkhzNbQyeKM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8PzX4rKXRKI8OwcvX/MzsWHP38O+5UMcf7mEddJy45
 rRd36ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEUv8w/A/+73n09cFz5rK1mgIPT9
 7jcJlw2F49WuHdrlNiuxflcf1nZGh0qhP5KH/AaMpB/6sql+RCX1xq22kS2iG66eWzZaH50fwA
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

The cdce706 clkout clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-cdce706.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index a53769d239a9..0a560b4d295e 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -423,11 +423,12 @@ static unsigned long cdce706_clkout_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long cdce706_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int cdce706_clkout_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
-	*parent_rate = rate;
-	return rate;
+	req->best_parent_rate = req->rate;
+
+	return 0;
 }
 
 static int cdce706_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -442,7 +443,7 @@ static const struct clk_ops cdce706_clkout_ops = {
 	.set_parent = cdce706_clkout_set_parent,
 	.get_parent = cdce706_clkout_get_parent,
 	.recalc_rate = cdce706_clkout_recalc_rate,
-	.round_rate = cdce706_clkout_round_rate,
+	.determine_rate = cdce706_clkout_determine_rate,
 	.set_rate = cdce706_clkout_set_rate,
 };
 

-- 
b4 0.11.0-dev-99e3a

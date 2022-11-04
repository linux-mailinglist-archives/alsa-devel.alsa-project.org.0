Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A076D61D845
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:17:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242F91700;
	Sat,  5 Nov 2022 08:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242F91700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632651;
	bh=gzcyRDG/OIMJFYi0N/cpVcR4UVw51AqrYck0s0PpWsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EPxjotZ2c9s3D7qs1enG1ad5bgXh2kQv2M+RXW7e1zvN+rTnXC0lJU0eVg7SBHemk
	 +iGgAFLIgs+UBV0LyP8CJWiYcgwx+Z7sC1tcLXDBCVBAyzGjlGm3LmGMMigxSMGsM5
	 XT2eePphLK5S4fUVocGpv11MpDOW8ZlTHM0qdY64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 336B7F80714;
	Sat,  5 Nov 2022 08:04:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B88EF8049E; Fri,  4 Nov 2022 14:33:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F758F80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F758F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="WBpDa0xz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WjuI7T3Y"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 971B858054E;
 Fri,  4 Nov 2022 09:33:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568805; x=
 1667576005; bh=IylGEyJTRPMvT8znDqNL1T0V9+HlmisR/0Tt/8pDDS8=; b=W
 BpDa0xz0UgeA2M2gUTMFCVVbp+BZl4goID59uvjfUACGG7XuBpUieF8ctaHia78L
 OApudN1sUygyjkP5bS3uMoL/tAw9a2Kzm2t+/2YYQZG3dixkEzEJe7QLjtvEL4LD
 +FNoKxavMYBJ2Z3GW1EeLLj6V+f7MmBcupP2LV33uKWxEQ697Q5PcY/DbmlZ7e7B
 fI0TdNVxJK5GE3Nyh0MVcK+Vtjts9DHWsmwf+tejk3yqnfDyfCy+KOa0e0KCO7BL
 edSKAqm/VEggHY8wahQxCf/cIkpF9ll++rP2zcbrmwrYvJz3FFIwI4KG7q2DoRJI
 bDG5lJ5anDu62v0V5+ISg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568805; x=
 1667576005; bh=IylGEyJTRPMvT8znDqNL1T0V9+HlmisR/0Tt/8pDDS8=; b=W
 juI7T3YWHMoa00g+k2ccSQlseVZm563421NKUS0hszpO7WrLBe+xK8iONRyKqmQD
 c7kJ41/6N6zgAOJJZKCJpN7hdN1wDXRaNi+LI07xrtO0sGBsfmnTCV8kFz0cQCc6
 OSam8j4bezwmEc1zx/tHNwRgBtvHhjVnBaopDd3LBrto5X0f9QjjTqSaZUZcRuZM
 jvMKjobMpnN2Wi0aKkH0nk4cLwRpCDK0e2dD3QhUk41Nc/gucrnXzuf54fHaROtp
 2tzCPa1MA6ge5iLD6RCAmJUjyNcYuYDD9VRjNQKxZPwYckmYTzfwEOP3irABtLE4
 UPhOdBqkOWgto/XGIPDNw==
X-ME-Sender: <xms:pRRlY_7STr8khwphJd5W0vLOinbcShPWK701LN7wf21h-EMhET6k8Q>
 <xme:pRRlY04mPlQAY4-jvigAmN4a2LNIWg-c83gqAhAqk7QpdmXTIjvN1KPAQy89grZVK
 T3lJ6IBcS_Mv4ojnvc>
X-ME-Received: <xmr:pRRlY2e7KKAo-NuTlEVCWtWa-ILoXUhGUt5VwI3WX6QQ28sSrC95zNTVuBgTmJqooYCMdwPpiMOazGwZc33npvug4xFIrSoEHc7-0LApi76HQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pRRlYwLBjSNbnDSnK4SS2bR5LAHxLp7KJHOsB1mwjq4aYb0AOtblmQ>
 <xmx:pRRlYzK-3mRK4U8gDtTGpp5gVtfpXVkwfUW-k0GlQt4J_pJy7qg_vw>
 <xmx:pRRlY5yDtkR_GBi4PTJ_q0ItV3AsNJ5W0g8eoLVBa6n9-yPBE7ps1g>
 <xmx:pRRlY6ZAnu8IvARsuzhlLfnVY6TZZZuMvwAHlzhpf7qeoT5Xk9gHjA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:03 +0100
Subject: [PATCH v2 46/65] clk: at91: smd: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-46-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3366; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=gzcyRDG/OIMJFYi0N/cpVcR4UVw51AqrYck0s0PpWsk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8Vlpw/VfXKJr5lyeqiJQ/O/t7scaOweumsbEm7s79a
 zq/j7ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBETicyMnxiOCAeeF4sdZdDyommx6
 meywI3VD25FB2v5K90kFE4yZ+RYaJR0aKsNze2p64/53LJguOGVKUt34cFX86ear3Vu/rGGnYA
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

The Atmel SAM9x5 SMD clocks implements a mux with a set_parent
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
 drivers/clk/at91/clk-smd.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/clk-smd.c b/drivers/clk/at91/clk-smd.c
index 160378438f1b..09c649c8598e 100644
--- a/drivers/clk/at91/clk-smd.c
+++ b/drivers/clk/at91/clk-smd.c
@@ -36,26 +36,31 @@ static unsigned long at91sam9x5_clk_smd_recalc_rate(struct clk_hw *hw,
 	return parent_rate / (smddiv + 1);
 }
 
-static long at91sam9x5_clk_smd_round_rate(struct clk_hw *hw, unsigned long rate,
-					  unsigned long *parent_rate)
+static int at91sam9x5_clk_smd_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	unsigned long div;
 	unsigned long bestrate;
 	unsigned long tmp;
 
-	if (rate >= *parent_rate)
-		return *parent_rate;
+	if (req->rate >= req->best_parent_rate) {
+		req->rate = req->best_parent_rate;
+		return 0;
+	}
 
-	div = *parent_rate / rate;
-	if (div > SMD_MAX_DIV)
-		return *parent_rate / (SMD_MAX_DIV + 1);
+	div = req->best_parent_rate / req->rate;
+	if (div > SMD_MAX_DIV) {
+		req->rate = req->best_parent_rate / (SMD_MAX_DIV + 1);
+		return 0;
+	}
 
-	bestrate = *parent_rate / div;
-	tmp = *parent_rate / (div + 1);
-	if (bestrate - rate > rate - tmp)
+	bestrate = req->best_parent_rate / div;
+	tmp = req->best_parent_rate / (div + 1);
+	if (bestrate - req->rate > req->rate - tmp)
 		bestrate = tmp;
 
-	return bestrate;
+	req->rate = bestrate;
+	return 0;
 }
 
 static int at91sam9x5_clk_smd_set_parent(struct clk_hw *hw, u8 index)
@@ -98,7 +103,7 @@ static int at91sam9x5_clk_smd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops at91sam9x5_smd_ops = {
 	.recalc_rate = at91sam9x5_clk_smd_recalc_rate,
-	.round_rate = at91sam9x5_clk_smd_round_rate,
+	.determine_rate = at91sam9x5_clk_smd_determine_rate,
 	.get_parent = at91sam9x5_clk_smd_get_parent,
 	.set_parent = at91sam9x5_clk_smd_set_parent,
 	.set_rate = at91sam9x5_clk_smd_set_rate,

-- 
b4 0.11.0-dev-99e3a

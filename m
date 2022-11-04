Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC961D856
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:19:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 393771DB;
	Sat,  5 Nov 2022 08:18:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 393771DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632777;
	bh=RpxATOZmvBLL00EJD9BBUbWIZTvIK1qjBFCyUubpy6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4km0yIVvkdvNiEV5g3CzrFopV8chI0ny+wTBUVwzgf/JQc845uJrL4TOKXm95Hkh
	 Q/gw0AKV7wJunX5Jnyyiv8pxY+6Z5BFdSSqdG2qXBu4MkUTN8DNZvZJOjmFPMAh8SR
	 K2YN33IJPKQ2UWuUUGnnzyTpt27fygWJhQQE8qYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B0DF80751;
	Sat,  5 Nov 2022 08:04:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95B33F8047D; Fri,  4 Nov 2022 14:33:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93375F8049E
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93375F8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="K8dp5qIH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hDCxwsC0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id CE31B58055B;
 Fri,  4 Nov 2022 09:33:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568822; x=
 1667576022; bh=R/DplwUAt4nhTBW2vr4E0Jh+Cu3e6ZWFvgxyUc6nsTc=; b=K
 8dp5qIHhrjyC0qSDz0kXY4svN41bk/6HGKbRXGpfEg8jwkFnMjTjIkzPEmj7rJWY
 04DS9qZFNYMINw1OQ+pgzKTZeGeBy5reu80eqqOAA4u6uI9qCJo2u3UKxCAxkgjL
 IkerdlVglEl0Cp/wWPJfisL7TZBKvRaUsAH2vv1vkACa7Jzp/izqtAn5TxbLFmKG
 LD/2fC/d1Kk4bAyjOh0TJsB4ItfW4eHC7iZAvJ198G6K9V2T0rgsaML1xgIwBbqk
 wRvx/hjkS9lSFCYPfcBibxpbr306DEEce0sChoQ1p1g14SST8PdGiqp4f+1UOU9R
 uwklcvDoZrG+Uex0LokKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568822; x=
 1667576022; bh=R/DplwUAt4nhTBW2vr4E0Jh+Cu3e6ZWFvgxyUc6nsTc=; b=h
 DCxwsC0IahmQ0mDfoYhaMgMbq6upErIRT4GRS7VQlQ8ZVEco9VTiyBgwYM6crp0n
 Oc/Kd30WhJR7ovoBizULkdTfWi9Cz5ZlqzeiJKdsnP8uc2bxjfESVpoMFoPx8BD4
 7ZMT0P0ysp8AzWVGeuwzcQj771lXoWMjJpBKnNowOMN1qbO3bfD4SAa3Am5tckwK
 GTGTJDsSRn3nIGyTjBGiASHp2SIVu6RcOa/RNxjl8AKwp9jb8cCwJ06V8jJmSu3b
 GbkXHNYKfr80hm+MjBx0s8VRMXZSPf2TGKHYMF10eCANB7XVvqO/LvN/EMCJr29u
 Cm+YRn/4FSzOsTt/T7T7w==
X-ME-Sender: <xms:thRlY1A-chqiSIKvh6DSutAs9U_L04v_oHiyRlBdmR0NMTtESqoFEA>
 <xme:thRlYziEVgCDEwtrSGPjTLW99vN9vxw5Sy-aEF2kxCbYqVBlq3cAzYHyE7-zgC9am
 OMILPCtiZKAbMz-9Uo>
X-ME-Received: <xmr:thRlYwn0oEqCl0FWvcvLYwBZUtdJN4I27h9ta63Fs7vezD05ogMYu5kI3ePaiVItyn1zd6XVOIceLsIEeo_2np-TNfhST1HWAWOHIomxREw2Pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:thRlY_xp92xg8ZbOMQHmvf2MMbcJu1QVEZvpHwL2W03ekXCFxgm0Iw>
 <xmx:thRlY6RMJCeQ1_njp0fjs1BFqMIWnlsAP24nHk0AF0xLEvnpV1LmDA>
 <xmx:thRlYyaWZqfeiN5cSr4EObpMejcQi5BfuFw4I66tUSAkv4l0_YhkCA>
 <xmx:thRlY0BpiGYjl-1B6o9WDS4OAA3471aj0owfbUcqWy2VLTVx8mZiiQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:11 +0100
Subject: [PATCH v2 54/65] clk: da8xx: clk48: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-54-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2574; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=RpxATOZmvBLL00EJD9BBUbWIZTvIK1qjBFCyUubpy6c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt/YltWZnGN3jJ/OHCTa+mZLlIq0vL7OHbf1Qo8aBLe/
 WyzYUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkEFTD8r3uUK5fZKrO449UnhSIn1Q
 Mr2Vp/7TKKK+ub4vqj7UjKe4b/7tOMr5Y5ubVcWd78nuV339y4l/XMapPmh7W5R7TufvOfHwA=
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

The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
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
 drivers/clk/davinci/da8xx-cfgchip.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 4c1cc59bba53..f60c97091818 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -462,10 +462,12 @@ static unsigned long da8xx_usb0_clk48_recalc_rate(struct clk_hw *hw,
 	return 48000000;
 }
 
-static long da8xx_usb0_clk48_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int da8xx_usb0_clk48_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
-	return 48000000;
+	req->rate = 48000000;
+
+	return 0;
 }
 
 static int da8xx_usb0_clk48_set_parent(struct clk_hw *hw, u8 index)
@@ -494,7 +496,7 @@ static const struct clk_ops da8xx_usb0_clk48_ops = {
 	.disable	= da8xx_usb0_clk48_disable,
 	.is_enabled	= da8xx_usb0_clk48_is_enabled,
 	.recalc_rate	= da8xx_usb0_clk48_recalc_rate,
-	.round_rate	= da8xx_usb0_clk48_round_rate,
+	.determine_rate	= da8xx_usb0_clk48_determine_rate,
 	.set_parent	= da8xx_usb0_clk48_set_parent,
 	.get_parent	= da8xx_usb0_clk48_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a

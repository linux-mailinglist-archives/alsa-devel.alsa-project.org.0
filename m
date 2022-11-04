Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C0061D810
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:08:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097B01663;
	Sat,  5 Nov 2022 08:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097B01663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632131;
	bh=1/qQmnkaLnLq5c4J9u4KwVo54amMRuIrpmMOv9UfOro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDjIcJsERYZVOLGxzmBLVQf5O0zcm3lGY9s75Vjd0ivgezOKIcuEBVo3MOr1ae6BX
	 6L2o987SPruWrsD+ARN6cA4rzXUNZHYrIFpgm0R7KRmbsmHAelOvI+blWirw/i3m6g
	 mR1j1DktXNhvg8mvSK7Tv6TYKQOlrzE2h81iIzO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A738AF805C8;
	Sat,  5 Nov 2022 08:03:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D114AF801D5; Fri,  4 Nov 2022 14:18:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 540C0F80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540C0F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="pc2Q5C0m"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="V0h10qHv"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B8EC5804C2;
 Fri,  4 Nov 2022 09:18:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567900; x=
 1667575100; bh=ZCwzbCeVZB2Z2ZsOYNmFLEHLHlieS5RCP9CrLVnrDto=; b=p
 c2Q5C0moCtna7UVj3FhJIKcS3uaQpR1TZpMr72LICx8oqkdiNcSekX6/onZeEiGy
 sRgyK/t8JOGAfqyn9wd+OKG5V8uZiadXkX4lQ6gVlkpj6Eyx36Dn39lw93G4JQK6
 k86WunS42LQH42TyuEKqHgkEDijTjTMFUVePqESJD1xnHtFRRZNMauwuk4dH5rxu
 bGrRcpzuifgwbtD0Vl5edz+I73xW30/3aYT0N7Bigfx0rjqI6EwwuU4Fy3fXB8Ql
 IafJWPL+JgiTcTWpvP3h9MdXizLuA38oJzBzKrtQkpkXhH+9xVXmvyVDhKEQk74D
 OSyzdKmcKZ2T0tCf5lLqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567900; x=
 1667575100; bh=ZCwzbCeVZB2Z2ZsOYNmFLEHLHlieS5RCP9CrLVnrDto=; b=V
 0h10qHvmMLmXBIw3VozyS6ppDm9KJWguva10hoozqItb97jLvKdnYCPzaU96TDob
 Yggc98OSi9Zx4TIXtFwDZwHYuHsQPxeuf0s90yF1Nbc/Z26VOeLw4SSeg/xor9KH
 fpBUHC6kvPrKkRE/kfl0H6vgE0s/EZKOif+BYE2gCYE6facPJayXDYgXp/JxVl9m
 y0v3sl+hBy6ZiiFQ/2wbQMXZ8+sYMtZoOBvb/hIHSwe/+SI3+RkporpvigU9H54B
 cbLX3DRDf2fV/wt7DnqRFvkWqFQSRt7NUzhzZa8lH3cwfKqfIjgbMd29H8pempPQ
 3WWUgQSbqZOvg4TqI8p6w==
X-ME-Sender: <xms:HBFlY__H2ujhHL69MelMpi711rHF3hXZH12Ddo7qbw2-VmhU2m5M9A>
 <xme:HBFlY7td4H1sws5OpRR8x38aFO5Ot0rEZeuyyWBdmuJHUUx09m3llYy18baJARvQF
 TlB0okEMkBSSNHMCSE>
X-ME-Received: <xmr:HBFlY9BCgrbknFwCIFzDJ3Zq4ePKBhmX0byftdrs209CzN1g8Le1coO-xM737tUaT5qW4wJ8qk-IYyaZuF5m1AEjbKIYzYlsjvxqoyk0vWbsCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HBFlY7e-IPqy-cib_DxCTPosG5hG6SqTEd0rp6GiCwGA9DdPoaBQKg>
 <xmx:HBFlY0NiQarYMIZ99PabgWwrPsAVyROiNi1NqmoEBfrVkDWKNLeWBg>
 <xmx:HBFlY9mkyWxpad4wg-k-BVPKqwRPisOUIzymuFZZa_blnNPLAQ9hCg>
 <xmx:HBFlY6tRvz4zNdAi3v0wuQHc9yEGNmueyxoNwFXo0DaruOSNZ4akLQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:32 +0100
Subject: [PATCH v2 15/65] clk: qoriq: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-15-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3449; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=1/qQmnkaLnLq5c4J9u4KwVo54amMRuIrpmMOv9UfOro=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp+n77x3kfen/fO8TvnL5zs7qyq42ffq/L6x9F6ShUzd
 hgsLOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRa48ZGQ5HePQydxW3Pqx9GtI706
 cvcUHkZlvJaMPQdUe1YrZdCGP4Kxv0qvHEcrZeJaVjqn9fv35UIrnQdlqc71rNHmXlH3uXcAAA
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

The Qoriq mux clocks implement a mux with a set_parent hook, but
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
 drivers/clk/clk-qoriq.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 5eddb9f0d6bd..6f51a2cfaace 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -878,6 +878,7 @@ static u8 mux_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cmux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = mux_get_parent,
 	.set_parent = mux_set_parent,
 };
@@ -908,6 +909,7 @@ static const struct clockgen_pll_div *get_pll_div(struct clockgen *cg,
 static struct clk * __init create_mux_common(struct clockgen *cg,
 					     struct mux_hwclock *hwc,
 					     const struct clk_ops *ops,
+					     unsigned long flags,
 					     unsigned long min_rate,
 					     unsigned long max_rate,
 					     unsigned long pct80_rate,
@@ -951,7 +953,7 @@ static struct clk * __init create_mux_common(struct clockgen *cg,
 	init.ops = ops;
 	init.parent_names = parent_names;
 	init.num_parents = hwc->num_parents = j;
-	init.flags = 0;
+	init.flags = flags;
 	hwc->hw.init = &init;
 	hwc->cg = cg;
 
@@ -1010,8 +1012,8 @@ static struct clk * __init create_one_cmux(struct clockgen *cg, int idx)
 	else
 		min_rate = plat_rate / 2;
 
-	return create_mux_common(cg, hwc, &cmux_ops, min_rate, max_rate,
-				 pct80_rate, "cg-cmux%d", idx);
+	return create_mux_common(cg, hwc, &cmux_ops, CLK_SET_RATE_NO_REPARENT,
+				 min_rate, max_rate, pct80_rate, "cg-cmux%d", idx);
 }
 
 static struct clk * __init create_one_hwaccel(struct clockgen *cg, int idx)
@@ -1025,7 +1027,7 @@ static struct clk * __init create_one_hwaccel(struct clockgen *cg, int idx)
 	hwc->reg = cg->regs + 0x20 * idx + 0x10;
 	hwc->info = cg->info.hwaccel[idx];
 
-	return create_mux_common(cg, hwc, &hwaccel_ops, 0, ULONG_MAX, 0,
+	return create_mux_common(cg, hwc, &hwaccel_ops, 0, 0, ULONG_MAX, 0,
 				 "cg-hwaccel%d", idx);
 }
 

-- 
b4 0.11.0-dev-99e3a

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C9161D809
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:07:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04FB6950;
	Sat,  5 Nov 2022 08:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04FB6950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632023;
	bh=GMav8u9gHBIjeuouIjRsu7I6ApdOcNs7sXTeIwxStJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kp211wSJGZJv+aq1sYEudm0SsQhlWWphfnmd3EenoYfXZWryIbn3NU+J2Aeq/RGcx
	 KGfP+CKmrsFOabEuWw0MjISZjXgUwhQoy3ooQMefXuYi26Bq9k53fRSruNSr0xpmBq
	 J0DhPO1PoQbVrSXd5DRkIyhbhOqWg7si4k6i3S4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B09AF805A0;
	Sat,  5 Nov 2022 08:03:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C30D8F80431; Fri,  4 Nov 2022 14:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAEB7F80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAEB7F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="RL3QSnBx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hVS7UTxO"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DEBCE5804A6;
 Fri,  4 Nov 2022 09:18:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567882; x=
 1667575082; bh=+sGsriMY9gumtulyD6+ryWkyisaCZqEROGKJ28jHBsM=; b=R
 L3QSnBx+wOPF79j3Cpe8bMgpmaUP0S6erjJbqjLOJ9Ho0FrknPrCNp084KHHuqaY
 JoscoysehO3PNpkfIkzpimOGEWun8DIfg9KVSE6e0Qz2u0DQgWUdNxIANUCURI+i
 M0xWpmefH2qRTi2X+v4cTAAaJavV1jJ4gD21yaHaPuHXpa8E2UHToeRId8xLQdNM
 WXQLHwx537xr9BzNuAnVATKq2gLYAb5ux/Ue1d99PVGPod5aHxTl9mm6GsIyumv5
 ZoU3uYR5MxLJgNsHvDaIK2Ynu39CqLFJbNtnmxEgF2FC1Bs1BhOLg9nLBwLLxqS3
 0pD2s4HXDz55YawdflZIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567882; x=
 1667575082; bh=+sGsriMY9gumtulyD6+ryWkyisaCZqEROGKJ28jHBsM=; b=h
 VS7UTxOlqO2nT9CGDsz7XTecQdQ2WsmWmLs5Z2mxyfmZEnW9Itlgw8c5vHMgklwn
 KJC372oVOT8UaKVwu5MpsvVplaPGKk5VVcnPwjWnN/+JxjZlVHly5jB6NMOIWBHs
 7Gp4PcrIASOHN3j4il+PkQmjwVlItzdxEo4D8TE6kU9dWQvoeUyfl/lhLh6JmKRB
 duz8t2faQNR3y/wcdExkXF7AaCT9SctUt2arpCml1/aW6f1AVIE6m8HzkoCEUJsj
 9q3dMRIvdPeJGsh95Jw0QkWM4Z0pCOHWlRfhFbE6ZYSkzkGRVOkz/oDvpm0VVmVd
 318psvDVqeWb31K7fwIkg==
X-ME-Sender: <xms:ChFlY-KDkebq58nWT4k8wm0hRs2TyMpeAhb2gvTPNarKL1f4EZ2fAQ>
 <xme:ChFlY2JPwMCJu3478SX6cditrXCBkVSYpG1sy3jq3mynPUrrWVUwOjLFWmyQo5DJa
 o-qlw45J6jqVECZFFk>
X-ME-Received: <xmr:ChFlY-sw7Poyw0DzkIniXdO_wc7y8KUwqAYemfJaQuCr2F46tpdxVBolqMd0-cu69-fB_1MgPdBbmIEMgx4999HhMODT0kU7D0oslk9I76IOzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ChFlYzZiCzKjIhp2Lj-flMkiuowbPkhEVRuOmh3BzJ08BBp9MA_Xew>
 <xmx:ChFlY1YZISNpjUqZnPf9vRmkIlPvizJ5Ld4KDcBdedRYsH2Rikz8Yw>
 <xmx:ChFlY_CpCSL7M_iS5LNR8CBakhoy11-6k_ozOWgdmDC8B5l50LMeBw>
 <xmx:ChFlYxrV_7iUL0SPRlevcyWVb83gonGe-L7FnWrmgTEHqzzJogNz-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:24 +0100
Subject: [PATCH v2 07/65] clk: at91: sckc: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-7-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=GMav8u9gHBIjeuouIjRsu7I6ApdOcNs7sXTeIwxStJs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8Xrk2fs77P+JC/4UmRXX0fxHdu5Z4iIr325LR5d58l
 7Cln7ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBE9ncxMtzjEkm0q7X/tFfHqUX4Ks
 vzPROc09SMfh2Xbk2IOOgb08/wi8lNpshbdl6ppAvjh30mys3N2bsy5xjW/r2nsql32wRtdgA=
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

The SAM9x5 slow clock implements a mux with a set_parent hook, but
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
 drivers/clk/at91/sckc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index fdc9b669f8a7..9c42961a8a2f 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -310,6 +310,7 @@ static u8 clk_sam9x5_slow_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops sam9x5_slow_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_sam9x5_slow_set_parent,
 	.get_parent = clk_sam9x5_slow_get_parent,
 };
@@ -337,7 +338,7 @@ at91_clk_register_sam9x5_slow(void __iomem *sckcr,
 	init.ops = &sam9x5_slow_ops;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	slowck->hw.init = &init;
 	slowck->sckcr = sckcr;

-- 
b4 0.11.0-dev-99e3a

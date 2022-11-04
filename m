Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F361D840
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:16:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A71D916C5;
	Sat,  5 Nov 2022 08:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A71D916C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632591;
	bh=i8NV7IjuD9Yk1Zqq8ZAa7SMelcQ7FkoI783UQL/koLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WttqTfXX/HCJ7OCefjGg2rTVRf/GH+NQwwG9BjIx+n7dUqob+4k1u2lnbFC2Ji4XH
	 ZIy1zc3fDlQ9Xpk2L3XbPCowwRN22XzGFCAdWnd+8HJv8nAnDl3g2Ii15pOpIK6C0Z
	 Zat3haQIzweGWLQ8M7x9bGeapq9bhdK1OD/uijqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66769F806F1;
	Sat,  5 Nov 2022 08:04:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFECEF804AC; Fri,  4 Nov 2022 14:33:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,PRX_BODY_26,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4B65F80448
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4B65F80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="J9nWs5By"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="edHY5hm1"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE0F258051B;
 Fri,  4 Nov 2022 09:33:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568794; x=
 1667575994; bh=i/mdM6EBYqXU9owm3d69sSy2Pa3hzJ15q/3x138bZyE=; b=J
 9nWs5By63qyldGfoZmgNazEVWBlEeNGjsA0SN8tbirUuxog9s4i0zrfw5GGBLya9
 Evo+SqmEgs93b2kr2vmSc+dxzwGTU12hU+xqej8aG1Ii4CjRlwXwRqlXAC1rEtBW
 5mylbxY1ynlVmY2o+SS3NqAc0yIVon/cllx3aVeXbjp4dS8KTUP2kaNNhI+uv1Ap
 nJVf5zY5D3qy8c/HsZidhxweByt/JXBLNyenLxzvzG8dnUH88rmcwaXntuXwsmOP
 tYZQWdbmKDNSOBYVMnFElBDqj+JK6CrOy6z+tBFRcEvBC6dq26BG39LyyC4sdGCg
 jxOCP8/hqj7H9UoYrsu8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568794; x=
 1667575994; bh=i/mdM6EBYqXU9owm3d69sSy2Pa3hzJ15q/3x138bZyE=; b=e
 dHY5hm1zWpU0YGASfdRoL44xxdxjBrGMnPUcihMgN4pXSWsooezkVeoqd+P0FZ8C
 u9RJTf22oaCo2WRQIakhyozIElT/ubuZrquA4JOHHwfr2CNsjuWuVA7vbf3BPr+n
 abUqLUh2j/S+nFfOhkdbrATHOjoquPEfJFNG8Nt4f71BMni1+OR7tHJUUndtrYjn
 +89vHPfffaliFdW+P/QTiR7Ij3L2ZyqFO0pJ+LvEBcCCqvfiHtNH8GV2lww8O/b2
 ocXR9Oergoyr7M2aMg+RsoMZZAHCHwCIl3n3eQsheu1ZPLIIhrpwUvBgULAdPbgk
 lncx0aAmOJt8aEsKbhG5Q==
X-ME-Sender: <xms:mhRlYyhAnNjz59Te_QXoAGOsy7CY4BJwZkKyAh9UT8VX-sw7l0SpDQ>
 <xme:mhRlYzBdAbkLJFWevBlay9JMhRPXOqrGBnHeKCOHRgenzwMGj747aIzVI6TnyoCK8
 ocG3vYzRKLx9cND9Uw>
X-ME-Received: <xmr:mhRlY6El7n78fPMtPvONnh8LI6ma-idm70tBYaAEFKa7XHaWqlaDm5WJDYcj0c4r7ljvSi54bJCsBPEWFqX1xnCU601XBpBHqVfUBaqZdTICew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mhRlY7QXhJS3HplAi3aJ-uw0xhE_CukyqBoOhdKrrNquVyCl8vjybw>
 <xmx:mhRlY_yTvRe_9YCn5yzYsbOyvBi0JAVeOECKWcy7Q7lVx7hLMs3DsA>
 <xmx:mhRlY54G4-P3LLADjAlCUN_cCmyCd8DZQlGj7G95O_IPhM7Hz65bvw>
 <xmx:mhRlY3gyV6x6qEa_o6ZOyXZ4I-9El8YOhr_k7VARwquXZVi6kweLGw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:59 +0100
Subject: [PATCH v2 42/65] rtc: sun6i: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-42-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2353; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=i8NV7IjuD9Yk1Zqq8ZAa7SMelcQ7FkoI783UQL/koLU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl/1/VZaF0+xO3nvzpLUj0Lhj9ZM94pYvE+Ry81ombm7
 +4vVHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiInTUjQ9MpMxvNpTFH+ji1p8+I/m
 4cZKbL/NZdzCf1qne564+6fwz/o5bve5501XEa677Dto4WJcfWtbLdlZLwiq++IZqxpMybGwA=
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

The Allwinner sun6i RTC clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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
 drivers/rtc/rtc-sun6i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index ed5516089e9a..a2781502c244 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -215,6 +215,7 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw, u8 index)
 
 static const struct clk_ops sun6i_rtc_osc_ops = {
 	.recalc_rate	= sun6i_rtc_osc_recalc_rate,
+	.determine_rate	= __clk_mux_determine_rate,
 
 	.get_parent	= sun6i_rtc_osc_get_parent,
 	.set_parent	= sun6i_rtc_osc_set_parent,
@@ -228,6 +229,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	struct clk_init_data init = {
 		.ops		= &sun6i_rtc_osc_ops,
 		.name		= "losc",
+		.flags		= CLK_SET_RATE_NO_REPARENT,
 	};
 	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";

-- 
b4 0.11.0-dev-99e3a

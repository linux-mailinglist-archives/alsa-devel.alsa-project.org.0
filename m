Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DED61D80E
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:08:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F871689;
	Sat,  5 Nov 2022 08:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F871689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632099;
	bh=Qcdipb0o2ae/N8jSEKXNaEcjkI/bera5lXalhrYMenQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3yeAhGro0Zh0DM9bzBbdbwcbpycA8MUywjx90UEhjNeTZMCnGZ+P6OGcM4jzPFPj
	 0rLr4feTjJkB5rhZGQGVp1GY1JGcgpKsDMsGgKH6WSkCdjtZ3nFr5fa20H60npn640
	 twF3vuXyAcd4Lq+9AtbcD/26ftmndqdlGI8/p09U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57862F805C0;
	Sat,  5 Nov 2022 08:03:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C32DF8047D; Fri,  4 Nov 2022 14:18:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5167EF8049E
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5167EF8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="HE9+GFig"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="h8f/i8gy"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2559C5804B7;
 Fri,  4 Nov 2022 09:18:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567896; x=
 1667575096; bh=IZ9UQ4DbVzbIJsLd1t+7sQBLMSQknh79wDggweQ8Tfw=; b=H
 E9+GFigRxmJ0btH19cuEF1I+Q7oSyo2VB5yjUzcKpwPw6+hgNZssum7qye/gfJXD
 oI1LVsmfkuX1QxODfaM6D/fBolvl2JJZE3GG2YY4120499IyiZhQ/zZHEeyzql+G
 EHFEX0WSOgf83/dH4VWUEcPcdoEQWJPYaN1ZO/u7cKqHYraZnfidoD6VyixptwRl
 oRECi31IwUGxrMoGE6yxPw+n9SsBdtMG0eSB6/KYQQz1dO6cnsRK0BpmdDMit3f/
 puOZmH4v7PuvPJRmPPVQhSNbiguZ4IEUuG6c0tZv339equzgA3yLprb/2vQVNQH6
 uYstgbrwCZzIZNR6dJnzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567896; x=
 1667575096; bh=IZ9UQ4DbVzbIJsLd1t+7sQBLMSQknh79wDggweQ8Tfw=; b=h
 8f/i8gyuyu426UDXEklkTY33MOqF0cm6Q2e3NUACnLO/Gvy1hKqFyetHdmpF+mJR
 kwlIqEBI9vvMrZZ07BA8CYO4l/+jWb281w0FmNHoulubbktqTtoiWBHc+aG9yO2R
 vzfvfU24V7E/IRWWy7cbkyNJJr48uX6w+wzFByTpGUzrF+JydvMncB9v5Tzg7jiL
 PaOym40VVFsCRmcxXt6C2VrNRll49V+3Ju1+pnOsDYt+3Zbk43td+kekTjG3OypV
 DEUAVaU/Tqww/rI6GuIKA64x9g7nI9guZGNtuV0aGi48kMUJpTJu0AiovAeZ0Qgy
 xy6lSlyu7kGVVeiDfp9wA==
X-ME-Sender: <xms:FxFlY6xzxWw1KTM1-JK-YpMrD-GmKMhd11ZzDrdioMVhi0q2564GZA>
 <xme:FxFlY2TkhMhX9MXoKdxN_Y59CtRwRXl7yUc0ZUwIDVbE_O580Swtaux1zNSXZ5TiI
 30cpHnsAyDel3GoeJ0>
X-ME-Received: <xmr:FxFlY8VuVwGxLoBe-zCD0POUao6810PwWDcRFumCdEGvclWoOMGKJg5zQ_V673XmDfOmP2bxE4SWWjGljbPT5r_k4N_1Pp7np6Q20iLe5h1i0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FxFlYwiUPlgMVVdq7ScRhFtUXpvqvRacN7JF9UXvhsxiMiBPAVXjAw>
 <xmx:FxFlY8D7R2-9733wxJXNm15zZ--qURF7uj0GxFist4o5yokiqhfPuw>
 <xmx:FxFlYxJNuyPF80-pHicN0eIf1famH6qmcHnMJjCZpIgdrSU7rdNQ1A>
 <xmx:GBFlYwxUFtOgWE5dNUKGZwxb4kgYvHzzSjla-7XedLudEJRE79vKFA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:30 +0100
Subject: [PATCH v2 13/65] clk: lmk04832: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-13-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Qcdipb0o2ae/N8jSEKXNaEcjkI/bera5lXalhrYMenQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp91ojkiNA5wfu7ViHnF/fB8QWK6wK6jDjnn/55cf5Nt
 Rc/XjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkSJjhn2GvrJd9wuOtbOyub4KEai
 3/bmF26akq352iUJadl1BixMhwfa7Pj9S2Fya3301mOn58f8HWXxOWGCh3Ln5xR8xn0RI3TgA=
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

The LKM04832 "CLKOUT" clock implements a mux with a set_parent hook, but
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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lmk04832.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index f416f8bc2898..f68bb0affdad 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1281,6 +1281,7 @@ static const struct clk_ops lmk04832_clkout_ops = {
 	.is_enabled = lmk04832_clkout_is_enabled,
 	.prepare = lmk04832_clkout_prepare,
 	.unprepare = lmk04832_clkout_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = lmk04832_clkout_set_parent,
 	.get_parent = lmk04832_clkout_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5D6D75A7
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA461E3;
	Wed,  5 Apr 2023 09:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA461E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679981;
	bh=ne7+Ni8GdplaAMyjTXPRz6J0r6sewA5LY1sPpnagops=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EP5EoHMH621GzBvZJnSg29iMw2AYPJh8mMovSrWU2b2Z3W7JKtY1NiS8BHMlmRdzL
	 /gvqKTFDaWnzuTC7bm+F23e38Tdp8QcMD1ZW+hEY0etoGGdQftFLr7uKhYeW+fp4N/
	 Gr/p/WvtD9vb4jx0LqwKAqc754g66LfrvXHGj5KA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C29FF80651;
	Wed,  5 Apr 2023 09:21:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D549FF8024C; Tue,  4 Apr 2023 15:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4F0EF8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F0EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=km7KRmL0;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=tBl8dAV1
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 00A4A5821A5;
	Tue,  4 Apr 2023 09:57:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 04 Apr 2023 09:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680616652; x=1680623852; bh=B8LNzBZ62+5wjGOJ+Ainw06cB0cXimLIqR8
	qQ4T9Zn0=; b=km7KRmL0YXjnP/meUd+DcvUHazwMYR7lt5dN45/wkkooBj4B8qU
	ZrGww+AkMePc+R2TkyXgZmskmymjuP/FzY8svkzkapVGcKdttcZHMAJDFsqGockO
	sGYg/5U6VuUfm5AP9mQxJxtbIW8IS9jT8tw6GMX5u7FTuihpQ9/dhmIwmJwh+hBy
	St5Bfecyobe3jvELshTkG8xdlASivgWsK9ZS9aSViooaOWGm0zgmvlpNF+7oI3IO
	F26GEKtCJ20wq+z7ec/UPB/z8G95sTbzHD4c/Toaa5BWdsvpzReQIY5sGfOPHP6J
	1smMSIPJbO0pNq6QqEuUbUP61Eys4M7wVZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680616652; x=1680623852; bh=B8LNzBZ62+5wjGOJ+Ainw06cB0cXimLIqR8
	qQ4T9Zn0=; b=tBl8dAV1XGouArzqpExRFtAA2Vfup3jTGzKeWuO3PeM2IDkvf0R
	Kiz+cq7zeUKTs8MHWxy2XEMSj20y1luajaE3Ba9WNjbWqExpVL7AZJKv6E6kppwA
	ctI13AfdaDRK+fD+RBu3tr0DcAUA6LQ/uaj60rFGlsfpIk+aTVKgYhXPUs1Y13yz
	QO0vlf35OMs5BKbPKyU8/51AjEdA8tuXFcI9A9zgkKUwyexMIu7EaYyrLxh8LJPu
	GClgUYSpxxLrptoXxIA8mWCekwYOxldTcnZOuvk/xQA2btjPGeBlePOYQiCdH9cq
	ozBBNXnwR454rLqveTKA+vc2ChTIMee7fqA==
X-ME-Sender: <xms:zCwsZBK9EeId2aElEaBHn26Gfaq2IjQjps_GgL8oEcdSWFiG9f8c_g>
    <xme:zCwsZNLI-WF_-5lUBD7pbdJBpzwhAyzdRvuQmDLEC7zYYghez2XiuxXb_Oyth2yHa
    yAEtLWodFBnuwpv1HQ>
X-ME-Received: 
 <xmr:zCwsZJuFv1YpVW4t768nHygqYUzVTQhFlImmzhg0e0NVTAcsk_IqGnq2Yb81aOnF2y54r5AA9UCTVMHn8pOQvGUP0nDtEjw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zCwsZCaRXNtdQzi3s3VmKwVZFMjZ0TzN6QYhrDPD7yNZKM_BcZIKDg>
    <xmx:zCwsZIa1HZATPIxxoz4MWP_Lz3nIaSgrokbWZY3hbDTX8PqZ_mx0dQ>
    <xmx:zCwsZGBKKxrfzF7T-37Lbz5v2t0VAg7nKI61riyosQJZKTseJMfS-w>
    <xmx:zCwsZBkrqfQf7tuTnSdeK-HXprDE_16USYKH6esUK36M5bUpjF6LCA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:49 +0200
Subject: [PATCH v3 59/65] clk: st: flexgen: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-59-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,
  =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@microchip.com>,
  Max Filippov <jcmvbkbc@gmail.com>,
  Charles Keepax <ckeepax@opensource.cirrus.com>,
  Richard Fitzgerald <rf@opensource.cirrus.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,
  David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
  Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>,
  Dinh Nguyen <dinguyen@kernel.org>,
  Peter De Schrijver <pdeschrijver@nvidia.com>,
  Prashant Gaikwad <pgaikwad@nvidia.com>,
  Thierry Reding <thierry.reding@gmail.com>,
  Jonathan Hunter <jonathanh@nvidia.com>,
  Ulf Hansson <ulf.hansson@linaro.org>,
  Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>,
  Kishon Vijay Abraham I <kishon@kernel.org>,
  Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ne7+Ni8GdplaAMyjTXPRz6J0r6sewA5LY1sPpnagops=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37c/XPFcOumCmLJCVs/N2q3Fv/SmMZid0OKw3f2J7/xO
 x+9vOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARnnhGhvttc0uMmNum5BXrr2/NWt
 j3e899x6lvmXfbrf4Tmfor5DPDP90HXyQDSy8e+xMv3B6z6Mzi2tgkO3NmgxbNfd/Vt2pn8QMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-MailFrom: maxime@cerno.tech
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: MK57Y7Y6NLJBF6V5KULMMFFY366MXZBH
X-Message-ID-Hash: MK57Y7Y6NLJBF6V5KULMMFFY366MXZBH
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:54 +0000
CC: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MK57Y7Y6NLJBF6V5KULMMFFY366MXZBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ST Flexgen clocks implements a mux with a set_parent hook, but
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
 drivers/clk/st/clk-flexgen.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 7ae4f656191e..5292208c4dd8 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -119,20 +119,21 @@ clk_best_div(unsigned long parent_rate, unsigned long rate)
 	return parent_rate / rate + ((rate > (2*(parent_rate % rate))) ? 0 : 1);
 }
 
-static long flexgen_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int flexgen_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	unsigned long div;
 
 	/* Round div according to exact prate and wished rate */
-	div = clk_best_div(*prate, rate);
+	div = clk_best_div(req->best_parent_rate, req->rate);
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		*prate = rate * div;
-		return rate;
+		req->best_parent_rate = req->rate * div;
+		return 0;
 	}
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static unsigned long flexgen_recalc_rate(struct clk_hw *hw,
@@ -197,7 +198,7 @@ static const struct clk_ops flexgen_ops = {
 	.is_enabled = flexgen_is_enabled,
 	.get_parent = flexgen_get_parent,
 	.set_parent = flexgen_set_parent,
-	.round_rate = flexgen_round_rate,
+	.determine_rate = flexgen_determine_rate,
 	.recalc_rate = flexgen_recalc_rate,
 	.set_rate = flexgen_set_rate,
 };

-- 
2.39.2


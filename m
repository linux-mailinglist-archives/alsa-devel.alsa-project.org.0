Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D56D758D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F37EFE9A;
	Wed,  5 Apr 2023 09:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F37EFE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679921;
	bh=p50VsOqv1T6k93woaLiN8Bd5AJfocwfLhT9fhB9gDvw=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tMXLx6LrqFjSqhb/I2j9Tw4Beko9dt0JarDwauG1DrHvVCyuY437VKwkBu7a+wbXV
	 +v/gIr683ugZroUQ11Uy3dQQnTTrBDnd7/xLHb+JQdGSFc3HY418jTCxSMRJbyCN8I
	 ekbYup7/KV4iLUDHd8bfcrwblSC1ga2BU5z+hH88=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F33AF80636;
	Wed,  5 Apr 2023 09:21:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62017F801C0; Tue,  4 Apr 2023 15:57:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E0F25F8026D
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0F25F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=e+xt/OOv;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NXOXR9qV
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 93B4B582182;
	Tue,  4 Apr 2023 09:57:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 09:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680616643; x=1680623843; bh=u5IaUxp37Eo22Z56jEIWVdhJKniriGtZUw7
	vNfPP1hQ=; b=e+xt/OOvKjKGuDtA0Ahj98cbkLitDqUU/UKcS7yZvjtyc7psjqk
	LLw1N3v1gT2lsI/jgZA00iUrVTwZQxGKzydhUwln9Tj+wVAEXYIgbj3+MsmLaCaE
	Cdo43DrAYaRpuSPg3B7Q7p+OsKoFrmKWU52+BSzHDJ1vA0+MtqsVego5xt5NE4Fb
	XmbZatqcMRhZuyd5Vm0CAuUt4jPlErlw+Mec+xBQ8k/0s2XKZJjz4y+43nkwzhAh
	vCvnI1CKC25cC7E2n7m/B0np80epZ7fwDkl4RIbHNtgoZe92XFv8vVJr4POIg/P0
	es8wZkSwpUBx2vbqr+t8TgShtC0OsLucfSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680616643; x=1680623843; bh=u5IaUxp37Eo22Z56jEIWVdhJKniriGtZUw7
	vNfPP1hQ=; b=NXOXR9qVx9GhB0bCSr2MeQseIneXnaIVjiGYQJEvq0EZ31TnNDj
	RptliQ+Rq4cWDdoPDc66MlDR2SDmZZZNuJCK7UVliZva62cXnBLaSluuuBoPDA69
	pNSOkZk95veaoI39rp0+uzJhRgkiCawy98yPzfTC+q4CBYvb0OfiRZf7mvKk423z
	VTAmddPC+8W8DD039rTb8mFeqaTPFl4qq5z3lTvvHaMcII8D0u6A6F967BqCHpRA
	AqY6g65szcumC5rvueD4FsAd83aexoCXosZV4WGQIgfRPrC2DW3reUqp9dtEchD1
	SR1X0sqOYKpt7s6rc2nTiqdHTGREkC7SOVw==
X-ME-Sender: <xms:wywsZNiCxmvgcKric11KJvKuEq1FehZqEcIxwniPsULXBadQlxvF2w>
    <xme:wywsZCDiKXQ-SwIPeBZdKU0x6Oe3k4wqeumQLw3sO5StItxIkxX0NPDS5XP8x78Rr
    KOCKwU-fc1G-sB162I>
X-ME-Received: 
 <xmr:wywsZNFf3kNKAQom6E7PTWT_AclJRPGTzSMo5gMkrGzVQNAQWEkSOL4Oul0Nyq0ovjI3B-6TXoUd03airWEzvyGtHYhjJZc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wywsZCT-U4e-6PkOEQgY4RIEhmT1p7JS2YyOE-sY9IGIKSFnO6pszw>
    <xmx:wywsZKxRi9LUhyDXJmLOyS6WVxSfn71QPg6OgjWVUhsROrBPL-9x0A>
    <xmx:wywsZI7qKMRHIbetV5AV9nEa0pScwXAhYlU19ov_TQRMFoqsmt8EsA>
    <xmx:wywsZK--zs-8fCvMuaT7dX3Yp0547dKOF-7Od2LEpp5JmlfcUPbh2w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:46 +0200
Subject: [PATCH v3 56/65] clk: ingenic: cgu: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-56-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=p50VsOqv1T6k93woaLiN8Bd5AJfocwfLhT9fhB9gDvw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37f7LQ1ZEGqj8Ozv94ZVPP9uWmyJX/grlLV048y9bA11
 ZetXd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiN44zMlz8f591su6Xe0mLwu49kf
 8nqznpSaNM1fGOHzGZPyPsVl5m+O+76l2DYc/ex/dTXp3UD9hYzthavZp1tWOT0zOjtOvTl3MAAA==
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
Message-ID-Hash: RSFKYFTBRDZ732YXWVVPD5T6JEGJJUZJ
X-Message-ID-Hash: RSFKYFTBRDZ732YXWVVPD5T6JEGJJUZJ
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:53 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSFKYFTBRDZ732YXWVVPD5T6JEGJJUZJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Ingenic CGU clocks implements a mux with a set_parent hook, but
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
 drivers/clk/ingenic/cgu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 1f7ba30f5a1b..0c9c8344ad11 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -491,22 +491,23 @@ ingenic_clk_calc_div(struct clk_hw *hw,
 	return div;
 }
 
-static long
-ingenic_clk_round_rate(struct clk_hw *hw, unsigned long req_rate,
-		       unsigned long *parent_rate)
+static int ingenic_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 	unsigned int div = 1;
 
 	if (clk_info->type & CGU_CLK_DIV)
-		div = ingenic_clk_calc_div(hw, clk_info, *parent_rate, req_rate);
+		div = ingenic_clk_calc_div(hw, clk_info, req->best_parent_rate,
+					   req->rate);
 	else if (clk_info->type & CGU_CLK_FIXDIV)
 		div = clk_info->fixdiv.div;
 	else if (clk_hw_can_set_rate_parent(hw))
-		*parent_rate = req_rate;
+		req->best_parent_rate = req->rate;
 
-	return DIV_ROUND_UP(*parent_rate, div);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);
+	return 0;
 }
 
 static inline int ingenic_clk_check_stable(struct ingenic_cgu *cgu,
@@ -626,7 +627,7 @@ static const struct clk_ops ingenic_clk_ops = {
 	.set_parent = ingenic_clk_set_parent,
 
 	.recalc_rate = ingenic_clk_recalc_rate,
-	.round_rate = ingenic_clk_round_rate,
+	.determine_rate = ingenic_clk_determine_rate,
 	.set_rate = ingenic_clk_set_rate,
 
 	.enable = ingenic_clk_enable,

-- 
2.39.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE36D752E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E1A683A;
	Wed,  5 Apr 2023 09:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E1A683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679241;
	bh=XeSprVIIyV/zrzbwClEFi3glvsdpjWNha9xD/jrwm8I=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YYL6nTHZmyVOEeHWYPar7hNzsBYOTefgEVLg9IoaIav5ZKLgvrbx4+rFc6k+fhBoL
	 ap2kphesmum4qxQ84RMJAuUlbmrT6AVbju95fqfL2uC5D0szsFHaiJqL4aQhV3cxzz
	 QXrUIVcHQsVgzbH4oLgNpDEs3UhfynTd48YeA35w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB1CAF80589;
	Wed,  5 Apr 2023 09:16:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C16AF8026D; Tue,  4 Apr 2023 12:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29DEFF801C0
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29DEFF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=OZEponvy;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qNYSFBdU
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 00159582163;
	Tue,  4 Apr 2023 06:22:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 06:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680603748; x=1680610948; bh=Y91dNVRC560xUvx2fMAi/mWKBqMyfZBI+Kp
	XEHHEN9g=; b=OZEponvylEnXflhuY8Pa/uMr6kPZI8uy7C27QHYzERputK8PFyj
	nPusGsKhQqWQTAWGMuU/jFKFHxMENuvsN96gsc2qRsN72iDMgJlt8jQNXu9j09AC
	ZncdFytpz0SfEhc/HfGOhG/qj/yCVtwbQS2JDEQ/qpyMzZ8+UVzxcHyFedHFqlu7
	STkxuqlGbKKvggHnOS/hbKfjTUvAAPHmQWso9IaEKOn+R9RKdxIhIOXi+MY+fWJs
	U8sYvsrFReQTwEzMVMRgXOPLVupSoYKg9FFtu4o3L6aoj/I00Mh79FKJdOYd5mE2
	4FvMw7EL4VWRD2CPqyYD0BIi/gdMAuHiCPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680603748; x=1680610948; bh=Y91dNVRC560xUvx2fMAi/mWKBqMyfZBI+Kp
	XEHHEN9g=; b=qNYSFBdULXpzc2blFVma8VlW8cwRBsN1qtqo3bd9XX7gyScq5Rw
	ywm5VSv1BJfDg5Cgk5PGuneL9leymiZl1GuoVVNJBEzRhHGyZi06SLZBtymH4zsR
	As9bSpXomue4N6PLLGJxKpi2d5E0vumbRd2cocmGiKhjvqYkvuwCA/3arXzBoGTx
	URY+lRltXiCE+PoJI1Hiq7uB+yTodeei2rMwY91mLLQln/9Q+qt+KgK6OdHlxifs
	MNuZW/55ZCtkl6tX5+Os6zM1iuk5fx61em+mDjCAyc1dsP9cFzEs7rl2vPnfeeIr
	9K9GRT45MkrB18L3AQAwttlu3PjkXFXkcdA==
X-ME-Sender: <xms:ZPorZKTRBWkmcfnlzz1RL0m7fNkZwkm0yGMxLRBBpiGF_33jzfM-UA>
    <xme:ZPorZPy2-bSQ-aNL7KwRxfjaUtfh87x_2rzV7qCb8Tt5_X7H4cQ76UZrwFm58RstQ
    ewyhS68AUyEmwDKjps>
X-ME-Received: 
 <xmr:ZPorZH2paZiRSBTAumRkSoyMO3J4e6Z67wXRfanbP1ksP3cXr8ip_1xC80G1sBaGAQeNX4wy6InwqWKuSaN_S--VlDto3X4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZPorZGDkYr2idebGaoMxJDtv57Xzfvopes69ah9ClSc5n3bpeFsiag>
    <xmx:ZPorZDhBDYE_mkQ2xxhFkfcHyh11XwYhOWdaAxoFr-vfn2iPY4iqaQ>
    <xmx:ZPorZCqxwwuEpa2mjh4WDlwztpS1H5uiSXkZDmY4EUZaT8XhZpAYCQ>
    <xmx:ZPorZBsPulsBNyB8imiTYQ-FKgCG1DOW2Vy4NhI2LqUG495349RB8g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:00 +0200
Subject: [PATCH v3 10/65] clk: k210: pll: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-10-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=XeSprVIIyV/zrzbwClEFi3glvsdpjWNha9xD/jrwm8I=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fW3go1M1YpvFiplc2y3N3T39BP8sDt/8drHnrdeOAd
 sjqpo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZWcfwv3hir+py1csVXsffsRyWLG
 yXT2T+lcsey7gyReX9qdn/ZRgZ3vZwcO1f/yonqulLnU7ar6tXe5ItLRpfifwQMRD70PObBwA=
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
Message-ID-Hash: GWKIS6ILWSNUFBY3SAFYCJ3ZQVES3XWS
X-Message-ID-Hash: GWKIS6ILWSNUFBY3SAFYCJ3ZQVES3XWS
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:14:25 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWKIS6ILWSNUFBY3SAFYCJ3ZQVES3XWS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The K210 PLL clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-k210.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 4eed667eddaf..a96ab8611e1f 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -537,6 +537,7 @@ static const struct clk_ops k210_pll2_ops = {
 	.disable	= k210_pll_disable,
 	.is_enabled	= k210_pll_is_enabled,
 	.recalc_rate	= k210_pll_get_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent	= k210_pll2_set_parent,
 	.get_parent	= k210_pll2_get_parent,
 };
@@ -544,7 +545,8 @@ static const struct clk_ops k210_pll2_ops = {
 static int __init k210_register_pll(struct device_node *np,
 				    struct k210_sysclk *ksc,
 				    enum k210_pll_id pllid, const char *name,
-				    int num_parents, const struct clk_ops *ops)
+				    int num_parents, const struct clk_ops *ops,
+				    unsigned long flags)
 {
 	struct k210_pll *pll = &ksc->plls[pllid];
 	struct clk_init_data init = {};
@@ -558,6 +560,7 @@ static int __init k210_register_pll(struct device_node *np,
 	init.parent_data = parent_data;
 	init.num_parents = num_parents;
 	init.ops = ops;
+	init.flags = flags;
 
 	pll->hw.init = &init;
 	pll->ksc = ksc;
@@ -574,19 +577,20 @@ static int __init k210_register_plls(struct device_node *np,
 		k210_init_pll(ksc->regs, i, &ksc->plls[i]);
 
 	/* PLL0 and PLL1 only have IN0 as parent */
-	ret = k210_register_pll(np, ksc, K210_PLL0, "pll0", 1, &k210_pll_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL0, "pll0", 1, &k210_pll_ops, 0);
 	if (ret) {
 		pr_err("%pOFP: register PLL0 failed\n", np);
 		return ret;
 	}
-	ret = k210_register_pll(np, ksc, K210_PLL1, "pll1", 1, &k210_pll_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL1, "pll1", 1, &k210_pll_ops, 0);
 	if (ret) {
 		pr_err("%pOFP: register PLL1 failed\n", np);
 		return ret;
 	}
 
 	/* PLL2 has IN0, PLL0 and PLL1 as parents */
-	ret = k210_register_pll(np, ksc, K210_PLL2, "pll2", 3, &k210_pll2_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL2, "pll2", 3, &k210_pll2_ops,
+				CLK_SET_RATE_NO_REPARENT);
 	if (ret) {
 		pr_err("%pOFP: register PLL2 failed\n", np);
 		return ret;

-- 
2.39.2


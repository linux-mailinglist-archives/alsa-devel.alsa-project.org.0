Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254E6D7556
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:28:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BDF882E;
	Wed,  5 Apr 2023 09:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BDF882E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679727;
	bh=HtiZLTZxu+0Vc/tuIwwetW0OP4SJJZ85i6en1IS1+Ro=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GKSbo4c8KupCpvOb67jnvF177bciSCBr6nBYcrXl9n8mZfTd5p8t0QDNmLDsbxrUU
	 sDSjWiRbxjMrzHEOXEl1gxEbdyEx5Ms9Y9xcyyHnn6c/uQeefJE0xGOm7uWSJZleS4
	 OWCHsAvfiJOPdSavTIYHdqhpKOPNoE7s5ksc2SVs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19055F80602;
	Wed,  5 Apr 2023 09:20:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B9BF80054; Tue,  4 Apr 2023 15:37:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B1828F8024C
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1828F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=YdasKTWY;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=R4rZh5eZ
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 313B75821B5;
	Tue,  4 Apr 2023 09:37:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 09:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680615469; x=1680622669; bh=2f/GcOwC9A0ZwKNkj3FhXDHyxqI3cZjTVz5
	j/5zG6a4=; b=YdasKTWY9UutI9KwQqigqhxGYK3ML0Gb3XawGuJf2dTogDW+Sp4
	hjqk4JSxnnu1fsz749xiav0a3Rm9hwjE5iB4T4WIRnkEXpiXK04DGkxnXcpQVNDD
	uMpqW/mU/3FkNk4w5+qKVwxXyWa+4r/cZpVuF5VSvdhF6nEs7oOxa2c48+uHmRRL
	diE9/aYJ+ndqVLtWl14v7VffR+fzu6b0T9A4du/TWgDiraNsJRkA/IwT0cjgjj7u
	zeBnh06LAgyD3dLaU36XbvLaDicm0Rwwfhekaga7YjkKiTqfSNH0mBAQlhfUx4U3
	Csk35KszJZtfuf2c+qwC0Kn5uhZBEe9Ej+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680615469; x=1680622669; bh=2f/GcOwC9A0ZwKNkj3FhXDHyxqI3cZjTVz5
	j/5zG6a4=; b=R4rZh5eZAhCRXW0ZgLVw0QITTsAmR0Yi8Z6I5bX9y/uUoYyNEvC
	bfXsgHyXrTaIMcQe+Trxn3FeG3gMSAOxfs5bXF7d3Fe3qAxrFALEDPlp85SCD0eF
	TIaXjcLt0xwfM8FD6Z35MiXo5H1sxDnTGk2T76uNPw8Ec0qxKfiF/HvP4DVPfy0A
	xooDMJri9B8zVzVCatzCPGuABVd/KqSKXkuHIyLFeRtfeECy5hCsERiZ3weSC7t5
	rlCZVQ4bRXI99XqS/nHXwkLXzScrXhbUTC9TQ5CMMcI2+osJ3nIcYoPdNpsGTPdn
	isn1R2dLbB0ExtI6eTZ0f3zzUOaToLEw68Q==
X-ME-Sender: <xms:LCgsZAt-gaauDetDLsx8VCTzVJ-j7QEru_j2Q6fJWGnuF11_DJOU3Q>
    <xme:LCgsZNeoekCQKW71k7CfVT37kjflJAZae2XO0Ulks7qHWGAeMAdSpa5mbjE0G4xoB
    KZeBB0vPWJv3sZPbEg>
X-ME-Received: 
 <xmr:LCgsZLxlf7c1Vh41qz1TcrtlwDlNPrQ_LP7zYk-PpWXRBR0-MtYKiawwCXheyvYDOpmef2Q7IKtzfdx9DlNR2Dtu_4wuw78>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LSgsZDOl2KyGVQXbcvWu9DVweT7d0A-2bvGBeWUTPr0vJkYLcCAHZQ>
    <xmx:LSgsZA_t8f09pPmHS-QDtHs9wGVXaiARFRplYUznJK-8JjuoKzl8Zg>
    <xmx:LSgsZLUFuIcFk8j-oHCtaUmfnjQNPOOsnXeCoYa0pw1TQdcHF4mH0Q>
    <xmx:LSgsZEp-9uiq07WyCC6YwPTE8mcHWEectda7jKcHcHccL_U6dt1Lpw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:37:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:34 +0200
Subject: [PATCH v3 44/65] clk: actions: composite: div: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-44-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=HtiZLTZxu+0Vc/tuIwwetW0OP4SJJZ85i6en1IS1+Ro=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fNnzPlzLGNc+cczLofr6MXLZ922uqAoZfTnL0fVJUO
 lhnO6yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBE9C4y/I96wsVSzhW6LiX8fwIzB+
 vkqncrL3u/PZgXET/P18a7pIOR4UjAPR3lq98vv1i7+U6IfcJK2ZyPbv+TNPTvOok/8ogM5wcA
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
Message-ID-Hash: ARR3I3C5UBJ4CXCOPVX7RCMJH6TJO2UO
X-Message-ID-Hash: ARR3I3C5UBJ4CXCOPVX7RCMJH6TJO2UO
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:33 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARR3I3C5UBJ4CXCOPVX7RCMJH6TJO2UO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Actions composite divider clocks implements a mux with a set_parent
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
 drivers/clk/actions/owl-composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 4c844a5613e4..d66b268563d0 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -53,13 +53,19 @@ static int owl_comp_is_enabled(struct clk_hw *hw)
 	return owl_gate_clk_is_enabled(common, &comp->gate_hw);
 }
 
-static long owl_comp_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int owl_comp_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
+	long rate;
 
-	return owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
-					rate, parent_rate);
+	rate = owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
+					     req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long owl_comp_div_recalc_rate(struct clk_hw *hw,
@@ -152,7 +158,7 @@ const struct clk_ops owl_comp_div_ops = {
 	.is_enabled	= owl_comp_is_enabled,
 
 	/* div_ops */
-	.round_rate	= owl_comp_div_round_rate,
+	.determine_rate	= owl_comp_div_determine_rate,
 	.recalc_rate	= owl_comp_div_recalc_rate,
 	.set_rate	= owl_comp_div_set_rate,
 };

-- 
2.39.2


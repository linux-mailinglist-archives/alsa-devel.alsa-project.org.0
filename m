Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7F6D7552
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC44E7F;
	Wed,  5 Apr 2023 09:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC44E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679694;
	bh=GJLfktUZeSsz+SqbECv8pHKpT94sJfK29hHkQN5qagk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VK8WIegNLI1oWqcEXHQbAef7vlDHUlsyy7dc6OG2oSxz6MCLbLyV+YSpo86gPUjUT
	 zlmZAGXNSD3Nk8aqwmYGyNTxEATOm6mJOZEZW1sdJyTgxfSg8TCdL4LTRFU6Mx4gLk
	 5oghilnS/HtppTlk7oJyBB2PKJgoiwVxpdNCLcsY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B86FF805AC;
	Wed,  5 Apr 2023 09:20:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFB5FF8024C; Tue,  4 Apr 2023 15:32:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AF197F801C0
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF197F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=JtP1grB+;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nUCmuL+E
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id D9603581F70;
	Tue,  4 Apr 2023 09:32:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 09:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680615166; x=1680622366; bh=X5yQ82ymN/fY+BFvs4cyiVoAbRFgqrMybYi
	jGIueh0I=; b=JtP1grB+aM7//XbZ/GrqYW7pR04PXpY7qECsQCECnzlROBJQ/RN
	406GTUXB/K/KXulm+Wj8G9yRpshIUksIVHRNVgOc2BW1GrV6g8eREet8psE8gEG5
	CksDkj5nR1/bQBCRtqXQxNsS6tCPfCAOSsvDoQACeJtoV0KvCIK1W7JaEwKECqIU
	LOTPWkDGt4cA2AvcZxgPuQI5fRbTsVS9vknSoviPoTjez9KYgnewuOOsTtB/fi4C
	nhq4LtSUU2mwXu9p1gpAdg6bdlbiKyg/gbfn6AlYA91S3rD4YEBcFq3vD2XBKbr1
	VMVXXnjGc4pm+VNaTTsJZzr9hQB93xdEOAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680615166; x=1680622366; bh=X5yQ82ymN/fY+BFvs4cyiVoAbRFgqrMybYi
	jGIueh0I=; b=nUCmuL+EKcIqZb9ZbIxQENehMUI/mW8njDMj8bwPll8weqgK2h3
	0iwcKhpCRYqvG1n7Q063wPV/ETA9mlOjgkQoZYb6lzkvGTMhwMVTOoE9l660kNzM
	vZB7fMy9FuRf7Bn+oHrQj60C2PYdkGw2IcQZ4hgl6j0RNIkF70h9Jz+jzsDO0NNo
	pjKiGP8ScT2Uaj19itLzm83DS/qV5jpqLdmhdap5uocjZTRkND0DMwqSk0BxXT2x
	wkj/QZPS+m24rtvV3bklXRB++QE5dGOtaLGG08qQHjMHN5IwHoqSnhJQm4JOrkZs
	y9pIpmicllZNaqI5ywgh2F2T59TFhW/nWiQ==
X-ME-Sender: <xms:_SYsZHP3caxqmNYfGCNxQgt40TVFaXGhugJc6ib1tnpaaiGzpskm9A>
    <xme:_SYsZB_K0fDh4RWRtQsMhQa_MAFezrSv8OaRUxZ2wksInWqvfLsz02y6wTjjRa7Qa
    fc79G3VABwgxlC55g4>
X-ME-Received: 
 <xmr:_SYsZGRB3zJ2pu3kb_BzdeCtMz3JOZYLf0E-ZTTBsCKY6tqissLp_bSngG-u5DiZ15xLVA43c4IinBFmgJti3dF2I09YMec>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_SYsZLsb4oLyHvFEZf1b8EukmsiFzIFA-gYmG8ynlDLaLKiEL5RaFA>
    <xmx:_SYsZPeU19X7_wfFwOV4x1s68zTPzW-U-6h83djyJX_1a4gVQDYsZA>
    <xmx:_SYsZH3zOsNfVLFU1t1ih6ujWAwSZhpKzz1Yb7MN4e5OVpn5DMttyg>
    <xmx:_iYsZHI8HOEg60S8uvZPwUueTdoLA_fVRRF74RXfDeeyoaG7Jy1Q-g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:32:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:30 +0200
Subject: [PATCH v3 40/65] phy: ti: am654-serdes: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-40-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=GJLfktUZeSsz+SqbECv8pHKpT94sJfK29hHkQN5qagk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fxlKznLju47UeF3czM29sSJbPupaz/t/vg3aS8CMbp
 LzkfdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi02YzMnyP4eC/5fQo6tLyuwYFPH
 mMKx/f3mjYsu3gkuKdTYcD4zoZ/ucv/vjy/v1fajxyb3cl125/9on147m3/TYspYfXTPhbdp0ZAA==
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
Message-ID-Hash: 7KLQB5MW5YTFBLGRB2E2A5RDCKHCEK6N
X-Message-ID-Hash: 7KLQB5MW5YTFBLGRB2E2A5RDCKHCEK6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7KLQB5MW5YTFBLGRB2E2A5RDCKHCEK6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TI AM654 SerDes clock implements a mux with a set_parent
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
 drivers/phy/ti/phy-am654-serdes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 4ed2d951d3df..3f1d43e8b7ad 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -634,6 +634,7 @@ static int serdes_am654_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops serdes_am654_clk_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = serdes_am654_clk_mux_set_parent,
 	.get_parent = serdes_am654_clk_mux_get_parent,
 };

-- 
2.39.2


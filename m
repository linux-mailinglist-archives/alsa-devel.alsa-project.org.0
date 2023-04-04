Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AFF6D7540
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:24:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3EB3AEA;
	Wed,  5 Apr 2023 09:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3EB3AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679484;
	bh=IwEgz161veiawiKdNuOBW5MAyJ+o8GT0uk16kXh+sLY=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OjSpJFuKw1bCotaZebUYOD5BNrD10hc5lcFP614Mfl6awvf7GXCALxAsFTzItHDhh
	 5jAgSUKF5VlgYANQRqp7RuJOtTUh8BBFY5QvHEQAatb16ILBTfWcb7/rnIMULVhYNu
	 ZnIOV1knUshQem6I5DogSuVfqGRLDHlfUcK58Zhw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51C9CF80558;
	Wed,  5 Apr 2023 09:18:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FF27F80423; Tue,  4 Apr 2023 14:44:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91AE7F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91AE7F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=lcvpmJgz;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ULLY0ymW
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 64E63582160;
	Tue,  4 Apr 2023 08:44:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 08:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680612292; x=1680619492; bh=BmYoftJb7rcYHdtlBRpDNUU+CfimWUBZ5ua
	nFM3R0KU=; b=lcvpmJgzSe3SdrYcqJA9ONo9zmmjmwa8D67iy1CwpsY6R27s5PG
	BVojUkBLNUQPQnnpblgY4TSXb5FajeztQZXdhmCHSi5wBUMhnkPmvJIVL4O8vZ5z
	HyH7uwO1wvFB2Algi6sCIvZoIbZUzJzz3Mj5bc7dzwnnUKyM9LgxvebypaKwdFM6
	TAkyzSYc14i9HIfGX7BPvUS79E507PSczO/QBs5VurIzfBOsbkabE0FDrP8QvnSj
	+RRgIhprjo87mqA0dOk5DeC4EHcxtBmeAtFE5zpfRVIEgiCbN0LtoPS1ohMtx+2W
	0TlPXDckJexVbWMgFovo2o+JzQq2oxqRVGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680612292; x=1680619492; bh=BmYoftJb7rcYHdtlBRpDNUU+CfimWUBZ5ua
	nFM3R0KU=; b=ULLY0ymWpgutYoyyw2WXNX583urzAtJ82c8rgGXtuIwO/HZhL6k
	qebxr+cgtUReHQ2yq7IreLLVPO/vLPF/b8mYHI3UCNkORcZuY8wpkv0LBJER5VrP
	zUsWYWdd4qhrAhmf55CwIi4C084xs4HjLswkDDalsjiOeDNXB9nON0vUgQvVs3Di
	UBlwl/ZrbpBASgs02nhP5bg0Klt+PPdoYhOlauXOXt/shDXkEVlgdOXsAEgqJqMF
	te2Z+NQyudiH0OwBbxO+SdWucML9hCMwtomsP2VEbLNXIi8xxxt4EK+QsBq/O8Oh
	EED5g4QUnaVYv3GmEvsmwvb0iSqCzUuy2OQ==
X-ME-Sender: <xms:xBssZFCxDfatDiknMf1UVADmnPJlmUfp1RhcCa9QKAb9TTHdr65EtQ>
    <xme:xBssZDh72C63LTdNz5IB-xCUYftjS2t6G8YB4RPJPKR_7636vVgyFZXCeuDcTC_2u
    qNaC0VOIL51ecD3dr0>
X-ME-Received: 
 <xmr:xBssZAkf4Y96WUeosukvKKS33EFmOcIPLn2BjUxcxoE1aawr2_Rm5zj9yhRuIHwurhjqnV_kAgvVzTMpP_pPvvmm4NdD_sc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xBssZPy46zNpQEicUmrwubzNRli7DZg-9Xzz2VataGJX8xCaDhoofA>
    <xmx:xBssZKTvIzAk7hlSbCfDxdGLKVYxJB_q9OmKNQMQuFfYNl2S7qB51Q>
    <xmx:xBssZCb9sGzJfm-pTRCY-Nd2xijO3WzTqglY-JCy7M54L2jgooqxyQ>
    <xmx:xBssZGcpli6eO3YtEl4ERjO9YnKL_GGimFlKzXDJPTiV9v89Qfsf3A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:44:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:17 +0200
Subject: [PATCH v3 27/65] clk: pxa: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-27-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=IwEgz161veiawiKdNuOBW5MAyJ+o8GT0uk16kXh+sLY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eaVXBZn76WUn0wnO3PxCDnc3+6GbV5xW6I2n8orG4M
 E+TvKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERWTWRkWPF3t9il9GUqUxQOzo8+6W
 676ObPR8t3aa9Ourvs+8SlVz4z/M9SzxOVEAzdyxD7I2jTXMmbOfNm/joUO53Xd2vQqRX1CzgA
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
Message-ID-Hash: DZA5GX7WS4J3ABHLACJGKBJGJB6KQ4QD
X-Message-ID-Hash: DZA5GX7WS4J3ABHLACJGKBJGJB6KQ4QD
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:11 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZA5GX7WS4J3ABHLACJGKBJGJB6KQ4QD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The PXA "CKEN" clock implements a mux with a set_parent hook, but
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

Since the set_parent implementation is a nop though, it seems unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/pxa/clk-pxa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 374098ebbf2b..47bc60c2854c 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -82,6 +82,7 @@ static u8 cken_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cken_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = cken_get_parent,
 	.set_parent = dummy_clk_set_parent,
 };
@@ -117,7 +118,7 @@ int __init clk_pxa_cken_init(const struct desc_clk_cken *clks,
 					     &pxa_clk->hw, &cken_mux_ops,
 					     &pxa_clk->hw, &cken_rate_ops,
 					     &pxa_clk->gate.hw, &clk_gate_ops,
-					     clks[i].flags);
+					     clks[i].flags | CLK_SET_RATE_NO_REPARENT);
 		clkdev_pxa_register(clks[i].ckid, clks[i].con_id,
 				    clks[i].dev_id, clk);
 	}

-- 
2.39.2


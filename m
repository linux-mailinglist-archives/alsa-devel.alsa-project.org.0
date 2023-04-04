Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742F6D7FAC
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 16:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55CA7209;
	Wed,  5 Apr 2023 16:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55CA7209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680705473;
	bh=H89ybMftU/jF/mSnT7t9XXRlldLTbWRKBAeeojhOMGw=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=psD7BhKdu1EFhNhga6ZwDpoS7KYeW7R+UXh7+xi7D92+wJwwidMLyvj7OR8s/kkjV
	 6Gz6l215DQXx8FZJfhLMpSiSlk7YiYL7HdyYbhe2owt7UgAtLDqwwhGBJ21UqZxgXu
	 Y6CITfI8C2MmcL4ds/bDXxS8Nvh2OUG7xntQmzAM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C41B4F80423;
	Wed,  5 Apr 2023 16:36:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9991F80249; Wed,  5 Apr 2023 14:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83833F8024C
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 14:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83833F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=Wts/Ah4x;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=TJt8SE1I
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id E031F2B06740;
	Wed,  5 Apr 2023 08:25:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 05 Apr 2023 08:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680697511; x=1680704711; bh=gWfanKGu7k0uR6sCschsWvSUb9iXlQk4TW0
	N04BwoCQ=; b=Wts/Ah4xwykIELLuVOyydo/p1UGL9G/HJY/ERkwIccdne8UsCAw
	X0PmG5K0bcqaEyRUzoWHG0oVt+49ZELc6VwPM2bbnB7Q6KDqcs8OOo8ckMbMZ+RL
	DKwDb8ModcB/XpwqnfSu9kwYDO781wqKfc3k85DrB5IrzhsEsb5/w+mH3LJR/fmM
	XbWCKuHGNs/G2Ncxgv0wXe0b7UZjnUDqlm/H+vVP7y6M5EzJSI5hwcXryt/7TWcn
	x2PoNUmovZSVXjqXU442ELIWyFCb2TK0OquEZRilwLsEUnxWf2tD6NYbDZuxZaBO
	1e9oE8wU1U+oCwmBb981th4h8d6MQ6I15rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680697511; x=1680704711; bh=gWfanKGu7k0uR6sCschsWvSUb9iXlQk4TW0
	N04BwoCQ=; b=TJt8SE1IgEzc0KpglToUainSE4eNFtJFqOIadR3Aw0w4iPzOBCp
	T7zZ1chmtSiOBxN3MvHWzyoyNC43zazRBLNOMgwV2goNvpcmLNoxWEHiDb/9V03T
	WqbkUOPppAfDp1lfLQERD4d9RtAdodePkq783ksNdsQOEtZ0YNss3Eprqjfvt/nN
	kO7L5DariGDXLonWJO+hWIpoZxEYQCsypuK/jqg0nKXQ3uvKiqloZ1BiukZJzPz1
	YpR3d+y3y6G243Ad9Cj01eNNPcdlL1pIs4n9C1Ejcg0dYX17CKsF9c3c6oJA9TLj
	OI6pgZjc8LIQJcEp85pkrQBuBvOHfuhKBEg==
X-ME-Sender: <xms:pGgtZOMldRw9UEzMSSw9I_16P6Nh8uWoC4G5IxdeXhaf6cgqrrzPkw>
    <xme:pGgtZM8vJW0v5RLXKfpP1B30xBya9iCZQG9f3N4LOeu6GPgZLeDUnDyQ9xb3eVe8U
    Jjfq16Xf1lnK5HolA0>
X-ME-Received: 
 <xmr:pGgtZFSt_W3SaLhjt9yJ8c7kyZV5sinLzmDcveP-bhjWLgYOnINQKkWGt_VoysCLks7z4FJH18Z3Iufubf4jHvGpiizZ09U>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pGgtZOuwD6V3-SK77MsB7UnDET01NWQ1J0FEM_a_tHDV_Wd8LAX3nA>
    <xmx:pGgtZGc6iX9GiPe48LHMJqyM2e5beO91F8WcGBskctjFG2kJLt3MBQ>
    <xmx:pGgtZC0EwUEqmao45oOU_dJyzQL31Mo4S3zcbaFAhGu0aeI6ljMT_w>
    <xmx:p2gtZGJX-HkMFt7mgRW1BHWYhPPxWlY5gUmeCqa4tyFNOW-Njt8_xUIYlj4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 08:25:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:53 +0200
Subject: [PATCH v3 63/65] ASoC: tlv320aic32x4: pll: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-63-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3060; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=H89ybMftU/jF/mSnT7t9XXRlldLTbWRKBAeeojhOMGw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37ez8VvEii39va+tcvoZfzdxxUPd2wRkdwVYPMp1lo9Z
 pGHcUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIuIMvzT6NRk4a6VklCfFrt34pOivT
 dO/vx0ZleDzy3WQH7/Ndt8GP4Xn+z4wbyskuNe7PtDUnKLNxhutHRaJHJKenEay+7oL/bMAA==
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
Message-ID-Hash: KYXGQ2RIRIG4NAHQZOMEKL7TBMEIQ4KF
X-Message-ID-Hash: KYXGQ2RIRIG4NAHQZOMEKL7TBMEIQ4KF
X-Mailman-Approved-At: Wed, 05 Apr 2023 14:36:08 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYXGQ2RIRIG4NAHQZOMEKL7TBMEIQ4KF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tlv320aic32x4 PLL clocks implements a mux with a set_parent hook, but
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
 sound/soc/codecs/tlv320aic32x4-clk.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 65b72373cb95..d8b8ea3eaa12 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -205,18 +205,23 @@ static unsigned long clk_aic32x4_pll_recalc_rate(struct clk_hw *hw,
 	return clk_aic32x4_pll_calc_rate(&settings, parent_rate);
 }
 
-static long clk_aic32x4_pll_round_rate(struct clk_hw *hw,
-			unsigned long rate,
-			unsigned long *parent_rate)
+static int clk_aic32x4_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct clk_aic32x4_pll_muldiv settings;
+	unsigned long rate;
 	int ret;
 
-	ret = clk_aic32x4_pll_calc_muldiv(&settings, rate, *parent_rate);
+	ret = clk_aic32x4_pll_calc_muldiv(&settings, req->rate, req->best_parent_rate);
 	if (ret < 0)
-		return 0;
+		return -EINVAL;
 
-	return clk_aic32x4_pll_calc_rate(&settings, *parent_rate);
+	rate = clk_aic32x4_pll_calc_rate(&settings, req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static int clk_aic32x4_pll_set_rate(struct clk_hw *hw,
@@ -267,7 +272,7 @@ static const struct clk_ops aic32x4_pll_ops = {
 	.unprepare = clk_aic32x4_pll_unprepare,
 	.is_prepared = clk_aic32x4_pll_is_prepared,
 	.recalc_rate = clk_aic32x4_pll_recalc_rate,
-	.round_rate = clk_aic32x4_pll_round_rate,
+	.determine_rate = clk_aic32x4_pll_determine_rate,
 	.set_rate = clk_aic32x4_pll_set_rate,
 	.set_parent = clk_aic32x4_pll_set_parent,
 	.get_parent = clk_aic32x4_pll_get_parent,

-- 
2.39.2


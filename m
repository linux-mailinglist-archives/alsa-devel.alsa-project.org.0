Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F556D755F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:29:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0249E7D;
	Wed,  5 Apr 2023 09:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0249E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679782;
	bh=dnanpEYQNgfEiWyEet2BPZYrOEJEAi5KqsKheoPaYRc=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OCq/iN5sgSrjVUp48OI8ThQXlVbhehGi3gv0VGgUFng4eWzkZxgaCmon7unpxinxB
	 5p8qDkxcTjSOoWCgpiTBlupZsow/qlwr/WUvMh5euG9mwU5aplJCyyrkt4x+zvVGWh
	 2ncAL7pE7txHxEK/aOcJn8jRQTXgPMyZL4m9+AcE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D5AF80606;
	Wed,  5 Apr 2023 09:20:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1697F8024C; Tue,  4 Apr 2023 15:38:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 718CCF80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 718CCF80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=f/utoZt/;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=V0M+xj0x
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id A04DF5821B9;
	Tue,  4 Apr 2023 09:37:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 09:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680615476; x=1680622676; bh=IRvUmfFNsMs7DLQdJ6TJDFMMQsz+lSIX5Vy
	vpb8PIeY=; b=f/utoZt/EY/+6xUFuUlwzaCTmj8zHoU93k79pb1hMLYuJJQ5CPs
	bmuRX+u5323KUis2v67Jj5VIWnM5Hb3TTEpYCg5h5qPoF0uGlGG38gC7GfA82Heh
	3EmMb0jDeZEUiF0Be5HP9cQFhDO0ExbqTupz7aIow9luBdMfzmtCYJUm8se2UxNh
	OQM7z3VPX65GOapRINgb0wMUIuBJGPJ0OZ0gcM+GaZNNCp1hTeZgFWRYHK9gTWMC
	9YWf+2ZIU+fOY8yfvz26/eNUeY0bMLm4t+PsmAyIWGVmsS5yO/ipWyvTlM/jknGB
	glMPYCk0xyxkESSxIryZ9ix8lTnXchf98/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680615476; x=1680622676; bh=IRvUmfFNsMs7DLQdJ6TJDFMMQsz+lSIX5Vy
	vpb8PIeY=; b=V0M+xj0xoPYOYAoF+VdxIL9uGLttsB4q7a6eYq+dMtuAYsOA3Vp
	sChat0+XLi5/Hj6qPD637/O9MW0eqELPdqKHP4djzXEg4dnu4hsPU8pvJSVCDuH7
	ZtofqzV4APHrIHGrigyFqBZrxS4z3J4fgtq6E4rxEf2gKvqxf19CxRXT9Qe3kTCh
	UYA+le0mLUzr2nsp0p+Mqr+5r8e9epr3pxH43svKZvO+cGyRB7cy4FmZHt810YN/
	t2w/AYfC+2s25tRi1RKFVExTWXo6ho+L1SoQ1CjD664c1vCTBysIRipEhGZSAyCD
	7j2jwyjVFoKS4x4xj8YZDz/LBxwBt3xgGNw==
X-ME-Sender: <xms:NCgsZB82tNH6CxPXNpEh7_mzQMH-f9uY9WWqBezVvyeNE3ZwN6sD7w>
    <xme:NCgsZFsB5UAQ6gxzSYaszeEnG1ltCpF3_oAu92AFI6sac5nnPm5xhJVovHyM8emH_
    Qmszm_zU9QeZ3GZ1Zw>
X-ME-Received: 
 <xmr:NCgsZPCt_YF-SBvsKCbqd5ABA0sZkOZA-ZOeAuK5tRjkhFl11Kin4M9vpACmw4nYkivaVi69EqfMY_naaLd7JpESn8QlpPU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NCgsZFcbbAHoE3zzCCxIjMs_AhaxCYn6n4vMlH0ldhWh_ngxdPGJtw>
    <xmx:NCgsZGOSD57GCn3o7esJ6N-0LNY6ahRn5U8ZQ2RYix7dzPaSJJ0wnQ>
    <xmx:NCgsZHniUJgYn9YenJvSZKQtNkVUQryyMgbwcDIx5-uFl92ZU9b9AA>
    <xmx:NCgsZL69NS1jjaZocFCZFabqwqk_lnkDcGXCHAwpWQkfrVJfEA9Grw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:37:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:36 +0200
Subject: [PATCH v3 46/65] clk: at91: smd: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-46-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dnanpEYQNgfEiWyEet2BPZYrOEJEAi5KqsKheoPaYRc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37cnsgv9/Lrp3JsQ3WN6O+/lzxBZrq9tcfrjwstTjwce
 2ZNh2FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJmEgx/M+4lnLjfc+9Bwdz2rbMMZ
 nzwqdpj+31R8YdT7WLzgZ2//zPyPCs9USLkeo+c/v8fd/Frq1gTtNsznHetKNp3qzzPokMj/gB
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
Message-ID-Hash: VQIWUBIBRI6PZPIPHBAXKR6PR4R7IOSA
X-Message-ID-Hash: VQIWUBIBRI6PZPIPHBAXKR6PR4R7IOSA
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:34 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQIWUBIBRI6PZPIPHBAXKR6PR4R7IOSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Atmel SAM9x5 SMD clocks implements a mux with a set_parent
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
 drivers/clk/at91/clk-smd.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/clk-smd.c b/drivers/clk/at91/clk-smd.c
index 160378438f1b..09c649c8598e 100644
--- a/drivers/clk/at91/clk-smd.c
+++ b/drivers/clk/at91/clk-smd.c
@@ -36,26 +36,31 @@ static unsigned long at91sam9x5_clk_smd_recalc_rate(struct clk_hw *hw,
 	return parent_rate / (smddiv + 1);
 }
 
-static long at91sam9x5_clk_smd_round_rate(struct clk_hw *hw, unsigned long rate,
-					  unsigned long *parent_rate)
+static int at91sam9x5_clk_smd_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	unsigned long div;
 	unsigned long bestrate;
 	unsigned long tmp;
 
-	if (rate >= *parent_rate)
-		return *parent_rate;
+	if (req->rate >= req->best_parent_rate) {
+		req->rate = req->best_parent_rate;
+		return 0;
+	}
 
-	div = *parent_rate / rate;
-	if (div > SMD_MAX_DIV)
-		return *parent_rate / (SMD_MAX_DIV + 1);
+	div = req->best_parent_rate / req->rate;
+	if (div > SMD_MAX_DIV) {
+		req->rate = req->best_parent_rate / (SMD_MAX_DIV + 1);
+		return 0;
+	}
 
-	bestrate = *parent_rate / div;
-	tmp = *parent_rate / (div + 1);
-	if (bestrate - rate > rate - tmp)
+	bestrate = req->best_parent_rate / div;
+	tmp = req->best_parent_rate / (div + 1);
+	if (bestrate - req->rate > req->rate - tmp)
 		bestrate = tmp;
 
-	return bestrate;
+	req->rate = bestrate;
+	return 0;
 }
 
 static int at91sam9x5_clk_smd_set_parent(struct clk_hw *hw, u8 index)
@@ -98,7 +103,7 @@ static int at91sam9x5_clk_smd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops at91sam9x5_smd_ops = {
 	.recalc_rate = at91sam9x5_clk_smd_recalc_rate,
-	.round_rate = at91sam9x5_clk_smd_round_rate,
+	.determine_rate = at91sam9x5_clk_smd_determine_rate,
 	.get_parent = at91sam9x5_clk_smd_get_parent,
 	.set_parent = at91sam9x5_clk_smd_set_parent,
 	.set_rate = at91sam9x5_clk_smd_set_rate,

-- 
2.39.2


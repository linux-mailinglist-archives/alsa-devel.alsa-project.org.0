Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAF6D758C
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:31:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30C0EE99;
	Wed,  5 Apr 2023 09:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30C0EE99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679918;
	bh=b8SqxOytwDE+KkaHfp5gKpFnsaNRQtdPkb4IDowdilo=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A/FywZYcv3cn8b6H84nIofAhiO4VMy53LDORMBs818ebbQ0bUPFLFURrXMFlVVneB
	 ccrqk4jNPtpjG1vY0+XbKO0wJvNFfYPBBhf/maDe06st7pTKv89SkJiwPwtPayXJU2
	 NpcrzN2XxdKiMjDe7FnzYrHmHZJ1dFhbFSHJRZng=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E11C2F8063A;
	Wed,  5 Apr 2023 09:21:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77A5FF8024C; Tue,  4 Apr 2023 15:57:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D834F80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D834F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=sDfzMxiK;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ov2Y1K0A
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 7FBE458215F;
	Tue,  4 Apr 2023 09:57:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 09:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680616640; x=1680623840; bh=YkG+C+vV7ZctkwqPaFXw45PShNJ45xIMivA
	+SkZxzuo=; b=sDfzMxiK88EsNOBKkSSkJVT4SHez239NYbVPxUcUDHCJ3gvleKv
	YK6K/vHJrOYlhuVt0qbmOJv3cD2bygdHHR2jLfnDtUyu8bn7KNGK52vvnVEX/+5A
	7Rb5noqFC+X9RTWxEf/XbQ/+muGS+fX8S3JmZYcbuFnIbrnJaXk6RwUKVHi4yELI
	Xihf49FwlVT6jYZN+8C09LvlxLYKVNL/P+nbYq2t7Ixlqa/4/5I8T5ITKTnoq0NU
	9gvZjq4WxeiDgoig3Q55PcBH2ZqZT5OSzzpMJ++UWbJguYUMwoMUhKGOiV5ThEtv
	MrYlQqZHGozllmmgEowpIdl8HbJGR27IiRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680616640; x=1680623840; bh=YkG+C+vV7ZctkwqPaFXw45PShNJ45xIMivA
	+SkZxzuo=; b=ov2Y1K0AWHY4Y9MMVw/JCWk6F927YjLN7fHGibqzLlN4V73W3Ym
	OZapqDqbKE/2gTHmym/0v1IYVDGxtMNpgSL2bPesKc/iMQA7Q3RJj7kjlPps2q8z
	em+Dpe7XrpIycSbZ/jrvD5SY2XFM4vtU4cmwdr2Yo/bfK+Ovgq75TvVc3ioFSXLr
	8jfe8nhvLNXQMvwRTWwc8KFHA2bgaLoEDxbpVlUBNqF9V4X7Tc7G5DApJoKWaIBB
	i/bcGWYn3BfyxwnYNsrEI/955ykS53OPSvbSY6KNbIpoUDSq8lY0tfjfbHXgj1qO
	woFs+6seQd3Uuzz6yNxkPeR7KCLq5+rK9dA==
X-ME-Sender: <xms:wCwsZPDiFLjq0l6yOMFyt1jdNbQ6paasgPsSTf8-Tgr60yM5Q_97vQ>
    <xme:wCwsZFhc_sE5mRgWyPCuER3FeIkYkYfc6eM0qnSUOKiJUGWdFZXkI2YWzZkPyz0o1
    Ar9JmIGJLwsmgPPW9E>
X-ME-Received: 
 <xmr:wCwsZKm5xIgGAfHNCBb220urrUKdq-EiejPETyuE9hMOoS2ndtV39_2uQFH2jXE5ZouNODtdAubInzxZ1uAXY5rghpWBqQU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wCwsZBxPQPUtXqfGhVBZ7NR9LH6uRHESCV_wDbw1a58s3bjLfg79og>
    <xmx:wCwsZESbiKUK_hhVdwvl0k-l7lMfNoYNY5b3gep7pmQWQXg1DM1JDw>
    <xmx:wCwsZEbQP9Ld5upFj47SpoLBj3Yr-hUnv8etSD46pBmF6Dhb5qoy2A>
    <xmx:wCwsZAcOwF7rXWcaR9pAGsRzG-ELDwUDd9wfklYt9lU6IIZ5DjBtOA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:45 +0200
Subject: [PATCH v3 55/65] clk: imx: scu: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-55-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=b8SqxOytwDE+KkaHfp5gKpFnsaNRQtdPkb4IDowdilo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eH9Ozk8vnJkrxq7Z5tOdek/x02zC4/J/zPasPlso6Z
 82fEdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi100Z/uerpJnWWxfK8R39caTjUs
 IPdaXzzDKLprdPfveU9cn819UM/9M2TbKdHLTu+Etjgc86WRIXxCwlPi5SiBd/33anTu/CPlYA
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
Message-ID-Hash: 2NVUPAU5HHZR6M2EBW7WALAQR55UYMPA
X-Message-ID-Hash: 2NVUPAU5HHZR6M2EBW7WALAQR55UYMPA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NVUPAU5HHZR6M2EBW7WALAQR55UYMPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The iMX SCU clocks implements a mux with a set_parent hook, but doesn't
provide a determine_rate implementation.

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
will also make the current behavior explicit. The round_rate()
implementation being shared with other clocks, it's not removed.

And if it was an oversight, the clock behaviour can be adjusted later
on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/imx/clk-scu.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 66e49fea5f8a..bbdc1b23f6f5 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -250,6 +250,23 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
+/*
+ * clk_scu_determine_rate - Returns the closest rate for a SCU clock
+ * @hw: clock to round rate for
+ * @req: clock rate request
+ *
+ * Returns 0 on success, a negative error on failure
+ */
+static int clk_scu_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	/*
+	 * Assume we support all the requested rate and let the SCU firmware
+	 * to handle the left work
+	 */
+	return 0;
+}
+
 /*
  * clk_scu_round_rate - Round clock rate for a SCU clock
  * @hw: clock to round rate for
@@ -425,7 +442,7 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,

-- 
2.39.2


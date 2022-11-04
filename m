Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC461D84E
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:18:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754501704;
	Sat,  5 Nov 2022 08:17:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754501704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632698;
	bh=utUH6EMI1InTg240nlK+dQXZPyYHpDtciqK334scBKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgmBGrdqeaZqOl3WvPl1GHF0SlxQRPDOnFpW6vEeC35wojnAsBC5fHmw/ERZ7Cx/g
	 2y2+mtqVFhhxMmWwqeuOsQsG6b2es7qQZxiMuSPGRwpBvQzIAkQL3gR0kGvJ7fqH9s
	 luKBjMUMmGuM9WAGSQvTJadojAtYFZxmWJlFz73k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF2EF80727;
	Sat,  5 Nov 2022 08:04:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0855F801D5; Fri,  4 Nov 2022 14:33:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3425BF801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3425BF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="W2hgwuQh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="scdVS0cA"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6EDE658055A;
 Fri,  4 Nov 2022 09:33:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568814; x=
 1667576014; bh=7qelYozWRBeNQ18eAF0ig9Rqs1/Vy7erIZoCj5CRlF8=; b=W
 2hgwuQhCuDzZFqOL74G8eMJopYbe3WVWO1tOSfbjm7rGs545/RqMe4YpsXPSSJ7e
 Os78ELU0McLCwosmkahg4x6agO8j9BlK7zqjZWeq1NAKTr+22H1xF4pNVV+dG/92
 6+IFxJWnelWdQJK0BqxDVgwiGbq4mar6ITkvuE33C7BFKmuhNmy9YuWTzH8xalPK
 55Foi6jiR2swY9GoXwqCB19fO/gZF7rpP1eUPqaCxM3/jNqwumDgXhuy01FMauaK
 duYoqgzgpQ0ogkpgCizxFqDzEHh+vX+zw8j7HtZt2PIxIsdlqkASHdyxKSSJMel7
 7RgLlgMWwG5WHpeb7Jb7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568814; x=
 1667576014; bh=7qelYozWRBeNQ18eAF0ig9Rqs1/Vy7erIZoCj5CRlF8=; b=s
 cdVS0cAOV4KaEJ63gsAkZSZ+3h2gOTwQ7j5sA5jB8i4P1C6hAwEn/z6Ow9dunnEw
 KDNUSU2rJ1UoFaCR1zh+jrFGtvl+7FxtLxA2agByj9oGkH/HCQR7h77UmyFIMrc4
 +J9oZtbA5Qcr3+AYCDgGAhDwAX/Gk5IStqng7crrG3Px/ip/VaCf8kleJ91TsAkG
 DolRmD69h4AKlsLj9LQrU0CUvBxsYqyN3X7ghK43mMUBK71xjQnpaHznnJpN/UTl
 LFxWHa+OEPE0tfuQbcyRaafljr7S7dsmmNOcqe4EHW5ou8eL5L8Rx9octy2FMBLO
 CVHMXR7SuTApHmu45a0fg==
X-ME-Sender: <xms:rhRlYx4Po3SFEJlD7guChAQqQjy4e_EkAQK_r_BZD3nC9T9uYms9Jw>
 <xme:rhRlY-5_oGSUIaFebzXclwrOYlkWy0I4OOfa65Zmjg7zGM5u1F-PQIvaFWT1qU8y9
 MHFctOdESp6hm6gDis>
X-ME-Received: <xmr:rhRlY4ekDlZ0EMPapb-lfFLlAqhZZRSFB21AvLXqVLMBLDYy1dOtbuFf4kGwnpfvaL-WP2h9hVmldPA3eOwjmgBSFeIlnPO4oOl9ivFuOpwmuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rhRlY6LDZM-vHYXMEErR66lk4hELeTy-1Ld8rRJKiFiHIEPthWfE4w>
 <xmx:rhRlY1KcRud8v07kBH-fSgt-wHOJYeGsAzvHYz9oGBzIAOKP3XO5rA>
 <xmx:rhRlYzzXAKJ_OC9AOddVXWjiW3jXGhUx6CV8U5NRDEEf0MQJjzbz4Q>
 <xmx:rhRlY0ZtzKb6q19z0fACUXXxIZQEbJrFmuNEsxQW1MikgJVssBCi7g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:07 +0100
Subject: [PATCH v2 50/65] clk: si5341: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-50-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3381; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=utUH6EMI1InTg240nlK+dQXZPyYHpDtciqK334scBKM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl+VlwTvXiWkbioeP5m7/okWr+Mh5S9zg2wFEkTUwrW/
 KXl0lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCK1WowMyxwUXnWH5ThZ7b4b/dGOdW
 5utUDZ1SJu1S8fF2q1dttxMjI0rDw+14KBaeZJi8gJzr1P/LjNxe6Vei3bzOgjFJt+7TEbAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:32 +0100
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

The SI5341 output clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5341.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 259861aa2e2f..14792d5ffb4f 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -828,19 +828,20 @@ static unsigned long si5341_output_clk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / r_divider;
 }
 
-static long si5341_output_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int si5341_output_clk_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
+	unsigned long rate = req->rate;
 	unsigned long r;
 
 	if (!rate)
 		return 0;
 
-	r = *parent_rate >> 1;
+	r = req->best_parent_rate >> 1;
 
 	/* If rate is an even divisor, no changes to parent required */
 	if (r && !(r % rate))
-		return (long)rate;
+		return 0;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
 		if (rate > 200000000) {
@@ -850,14 +851,15 @@ static long si5341_output_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 			/* Take a parent frequency near 400 MHz */
 			r = (400000000u / rate) & ~1;
 		}
-		*parent_rate = r * rate;
+		req->best_parent_rate = r * rate;
 	} else {
 		/* We cannot change our parent's rate, report what we can do */
 		r /= rate;
-		rate = *parent_rate / (r << 1);
+		rate = req->best_parent_rate / (r << 1);
 	}
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5341_output_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -930,7 +932,7 @@ static const struct clk_ops si5341_output_clk_ops = {
 	.prepare = si5341_output_clk_prepare,
 	.unprepare = si5341_output_clk_unprepare,
 	.recalc_rate = si5341_output_clk_recalc_rate,
-	.round_rate = si5341_output_clk_round_rate,
+	.determine_rate = si5341_output_clk_determine_rate,
 	.set_rate = si5341_output_clk_set_rate,
 	.set_parent = si5341_output_set_parent,
 	.get_parent = si5341_output_get_parent,

-- 
b4 0.11.0-dev-99e3a

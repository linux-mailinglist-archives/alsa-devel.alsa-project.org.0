Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D46D7571
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:31:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319AEE95;
	Wed,  5 Apr 2023 09:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319AEE95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679870;
	bh=0FRX8CfksJbTHUiPdGQAgkXBCmG/4Qilh3JpXfqzQ/o=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mqhX5e9K6pGSTr+LzxDwMUNhbGnbmwdt0JquacJZIDJ77UqvsRdLSrQ/nJS4DaluB
	 ryDo3SZrpiicNbVOKC/nDg6Ves21Is/0Jt3R84AupUZQ5H4/PUgn/Vworg+tty45UG
	 ++az05Xon8XFKEC/RV+/QSRFN7hm1s+5CzvrCB4Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6720BF80621;
	Wed,  5 Apr 2023 09:21:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05E26F8024C; Tue,  4 Apr 2023 15:57:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EFE3FF8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFE3FF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=HEK90Ct5;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rAkdd8Vl
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1F86258214E;
	Tue,  4 Apr 2023 09:57:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 09:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680616637; x=1680623837; bh=Bv1Ngdi+jPgDsaCfDDPfM4pzHXEBluXYVNL
	GoWLN578=; b=HEK90Ct5ssYf268f8cW/4392ULbzkxG4OAoUZjNNZ662Es1cXip
	zu2KnAPQ61RoFY38bzmlkFdwt7icqW0wtte7CR5Iud4xVuMn0eZ9c7Qqvyr6Sei6
	1Vr6JOB22OZ1cGKW1BkhIgY7oD8DoufO/0/DVciPgrQTdqtZuKghFrEcwo6U+2X/
	2iiA099Rna7js9K3vbewD9MZC6Ulb0bkb+brIh2JzZkNAPspvHNAPCYS+V6w6NzR
	BxWpQIE8mzT3IVRDwUUuBk5ZUcbK94k2YOvhD8pJgIsS9lF8xepnVOusoQZjB8Ji
	QeZSGYvLi0tXsYbEnrMm94SUDHt9alZnnBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680616637; x=1680623837; bh=Bv1Ngdi+jPgDsaCfDDPfM4pzHXEBluXYVNL
	GoWLN578=; b=rAkdd8VlEfIHXxsYHd7c0O4bMxmHnUto+CPV/N+kiNSIuphAKK9
	4LmSRCmlN73hKr4tyM4VyF0sEqdsquyARyTkQpwc/JR9aIBdq0vIgfFUlRmr1CSy
	tWSwQrFol4RlQXrYF7KOwNL32WFuzomYaDI1XMD7Hq7KeGHdAH1AnOycziU2wYG3
	oVpuQcyQYzc9DdH8LMG0XxJbCZpSGemvyjVEpouZ/IZ5NANsNYTEs7KStOIwkG+C
	3Cx6uNcWaxiA3hbK9Hmai7QtJ3QQPn+7HOVlLBgnv/zezHwSQVi7IzKW0/WStx+0
	NmOao3pbVDmnvsA541nI1EuwpHgrqeifAsA==
X-ME-Sender: <xms:vCwsZPt_c8RgC-7qariMpdsFis2sMNC4SL2ONNPoeeos5Kj0ekPJoA>
    <xme:vCwsZAccg1f4wQzEddnh0ZxqjzS2zukUrRrUBqItMoiEp9MF1ts9Lbgt2bAtIbf4a
    t5Gu3psYi3bu1J5VE0>
X-ME-Received: 
 <xmr:vCwsZCyR1e3dgYtldyTkG_wHdgs3np90eD4e2x-51HA1Ejnvjz_2MbYOhv6hZ0vK7znbu1HFtilGEWDPPnH9WGPkWpivHiU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vCwsZOPDz2WfKkuu3eX_hfFxXhlXJQhPRGQimxwaiRNxgGf4aofASQ>
    <xmx:vCwsZP8d_K5S9kI9y1hAuaMXzazX820JPX13HyVjFg_r8cTPdynZTQ>
    <xmx:vCwsZOV7Rk5JymMvN6UFdVN3m-HoRPQWS2fa9KZHVaj7V45lKjxcmg>
    <xmx:vSwsZLrQnREk9hCTWjUCqmkgmgKr3ncG5Y3ESWxUHmBGSjJv-hiYeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:44 +0200
Subject: [PATCH v3 54/65] clk: da8xx: clk48: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-54-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0FRX8CfksJbTHUiPdGQAgkXBCmG/4Qilh3JpXfqzQ/o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eXfJ9ckFpapHytzOfrnsyaoHNqzlyaHimZk0K2WhyT
 iDndUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgImUVTMyPPwam6ZxZselGtfO/xemp8
 /4eWyC1OrTXQW2EYY8/6T5njL8Znd0lLbu9jxrfixXWnbfrwRjHx17nw13Pk1++ftp6Jp8LgA=
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
Message-ID-Hash: YWLBQVCUEQGNHJV2CT37UEC2IIRQ4YUK
X-Message-ID-Hash: YWLBQVCUEQGNHJV2CT37UEC2IIRQ4YUK
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:45 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWLBQVCUEQGNHJV2CT37UEC2IIRQ4YUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
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
 drivers/clk/davinci/da8xx-cfgchip.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 4c1cc59bba53..f60c97091818 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -462,10 +462,12 @@ static unsigned long da8xx_usb0_clk48_recalc_rate(struct clk_hw *hw,
 	return 48000000;
 }
 
-static long da8xx_usb0_clk48_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int da8xx_usb0_clk48_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
-	return 48000000;
+	req->rate = 48000000;
+
+	return 0;
 }
 
 static int da8xx_usb0_clk48_set_parent(struct clk_hw *hw, u8 index)
@@ -494,7 +496,7 @@ static const struct clk_ops da8xx_usb0_clk48_ops = {
 	.disable	= da8xx_usb0_clk48_disable,
 	.is_enabled	= da8xx_usb0_clk48_is_enabled,
 	.recalc_rate	= da8xx_usb0_clk48_recalc_rate,
-	.round_rate	= da8xx_usb0_clk48_round_rate,
+	.determine_rate	= da8xx_usb0_clk48_determine_rate,
 	.set_parent	= da8xx_usb0_clk48_set_parent,
 	.get_parent	= da8xx_usb0_clk48_get_parent,
 };

-- 
2.39.2


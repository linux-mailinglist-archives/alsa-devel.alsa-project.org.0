Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086FF6D7531
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:21:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A4986E;
	Wed,  5 Apr 2023 09:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A4986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679292;
	bh=a/SpswKPgHoEuudH64e5ufLmPO7DpK2feZMjb66YaIk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CfvsGVWk2kKTzXKCbQAKgRRsLZKdiwm+GyWeCooOcbzmvVMVnAng3NfDcizGmQEnz
	 MFerwvyis8fUJ2zO/p/ZuMXQx8kYgcx6dp9aQSL6hgbM5oysiY4mrsrNMxB1XHtX7W
	 lA8/zoSOUu2IQ5OUvxndnPdpitoVKJqlVcECCdXQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52747F805B3;
	Wed,  5 Apr 2023 09:16:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A78FF80529; Tue,  4 Apr 2023 14:34:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A4405F80423
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4405F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=VSdvYaTh;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KGeKibpk
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 6F9D4582194;
	Tue,  4 Apr 2023 08:34:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680611660; x=1680618860; bh=opmYql4+ErFJ2a6YE1yNNHOV4ob4uWT1X//
	grUgsr5A=; b=VSdvYaThbswoCh0qpVdSxG6NSZb3aec381Oiu0w5DqKwxQ6PFUX
	PK5s+7daJfBd8fX2FjZZjAo4dY3/XAIDLtrlg3TE2BAuG9NYwjCtAZ4jMHTXYexW
	NMsU/sZXxcb4kjmf6Ydkp93cATT0wEppUJp0L7IsJlSSl0/JYLdHomgSI3Q42d5f
	OpuZKJ6af/410SqwpZjTw5ozEPQ2GPAIUc2t7H8fWsoISEOIykA5VoGVCSY2Ym9w
	dMYnRBl9cMReLxmzW2SUimt65BHpoxVfH2eV8ftSuk81DpylHHOQJGVtieJRIZVb
	nbdFFD/mDo5ps0JB9UBwwv20/5EsT2NCKUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680611660; x=1680618860; bh=opmYql4+ErFJ2a6YE1yNNHOV4ob4uWT1X//
	grUgsr5A=; b=KGeKibpktED0Z5xrmegmDpy8tP3zCgzZgbRylxVRwFK0DywLYRO
	d8ouUHJZo/Ls0AKdNW6pcOgf0r2fNV4dspyr/vjQ7WrX1h7hTHOEEqLfhoZTqBGd
	XmkD0DdcyUWQvhHmCu4PIZs82dhJ5FX8SfCzCI4XPgKKCz/gBLrVoP2Jb/YwjTky
	nd5JvtjQ1OSGXGo+K4pGyimB4IhMfYGYgKRNefF3giB0oJJnQCGKDeG8jNlUuQao
	z0dpaBTJQQIulFk0Zv/DhMvMztBk8nPNgXCDq+2/yzh+N6h8ROaensYZK20bL2Lx
	B4/pTmCceuRxPLlHUVW2PSp17iQGGRvlSkQ==
X-ME-Sender: <xms:TBksZEJUHMA9C5qKESIMg9WzDM1e439eQTNPi4NEr6fQx1ZoHO1oKg>
    <xme:TBksZEJIkXDX-0eEQJbJZztP_k-DTYVP_fg6FqiWCBH8jScO03pw9xtxTN8L1o83O
    izneLEN3qgcshkQHnc>
X-ME-Received: 
 <xmr:TBksZEto_0RQE-5zlJc-FHlRspqFe4mv0h0JPCkZIwFVv0Da7G6vwtIbTYmm43kB268mH2tkKibfmSvgX5PitTJWhwpogo0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TBksZBY2ekz5TI_smmGHdQ4Fz5dgyPlCbXhDA5pYk4MdVF0_DEoU_w>
    <xmx:TBksZLaPLImg_edWcd-dftrE99wgs7plVCtAZusRu5pUohyi0kF_5Q>
    <xmx:TBksZNBQxUF_3fiUeQiGoOasHXA5LohVHbO2lIHBG0jBWvRCJbjKTw>
    <xmx:TBksZMnoEBtBRDxgBL-nTLpPf2HZ6O-VdFfpCiyrnjNBGeKW5MNRAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:07 +0200
Subject: [PATCH v3 17/65] clk: stm32f4: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-17-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2275; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=a/SpswKPgHoEuudH64e5ufLmPO7DpK2feZMjb66YaIk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37cKdq0x/br2nO+Fpefkm5fJF7xTMJa+/ydVwrS47ovN
 uyk3OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRc2cZGaZeXhD2hXW2+Oap67a8Kp
 pS4Wq07drbDXe8Y02Lmff4ZcxhZNhzZlLvm7Df5912hrL8scw11Al+n2T3LzZt4uJbXHE6E7kA
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
Message-ID-Hash: UC4KY6G2HNFFDIKDO2C4ZPKXLD7IY6U2
X-Message-ID-Hash: UC4KY6G2HNFFDIKDO2C4ZPKXLD7IY6U2
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:14:26 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UC4KY6G2HNFFDIKDO2C4ZPKXLD7IY6U2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The STM32F4 mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-stm32f4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 473dfe632cc5..01046437a48c 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1045,6 +1045,7 @@ static int cclk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops cclk_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = cclk_mux_get_parent,
 	.set_parent = cclk_mux_set_parent,
 };
@@ -1085,7 +1086,7 @@ static struct clk_hw *stm32_register_cclk(struct device *dev, const char *name,
 			&mux->hw, &cclk_mux_ops,
 			NULL, NULL,
 			&gate->hw, &cclk_gate_ops,
-			flags);
+			flags | CLK_SET_RATE_NO_REPARENT);
 
 	if (IS_ERR(hw)) {
 		kfree(gate);

-- 
2.39.2


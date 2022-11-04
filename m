Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F661D804
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:05:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F1684C;
	Sat,  5 Nov 2022 08:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F1684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667631944;
	bh=VkPVOrruF5FqCt4has6Fte3flpq+DUum5sJ0HsbRupA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qt/sYwbPbDEtXP7Few8mzPheRRJxsFdGYoWZt0SUG5QR168piC2D/krIn+lrO5B/c
	 ryQN8/yrWBrv9k4GQemzQIdpIWuRriISanLZLUC8OV0mTDL5tXim1tC7b2NeocI57W
	 joysgRensTkJO5deA4Z9pPTjRuF3aKKc87NQwTqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D7AF80563;
	Sat,  5 Nov 2022 08:03:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EB0FF804AC; Fri,  4 Nov 2022 14:18:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B2B1F80448
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:17:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B2B1F80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="wo5yf59D"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HLdzmdsP"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A346A58046C;
 Fri,  4 Nov 2022 09:17:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567876; x=
 1667575076; bh=L5wASX54u8n/djj/NOTWyB5h74dOMSF40gyr8Izx+PM=; b=w
 o5yf59DJo2lg0er1Ihv4bUCkkCfOZSysHpM8j2KZUudIcSQKLit35/EwhGHwdpdE
 UnJmQM+37JVpRwPEDUq/c69V5MDtv5XI2+G4OVxRUDPDTJ0rJcr7Qsrl5W86JuZb
 WnzxjA+YljMtA0dz6vqeN60gRwMONWlSh0LlE65S2OpOzY1Z1ae/o8DSM6AFkQMJ
 Lm2zKKruwETpA3kpDcni4FnoUKm2/9I/OpXz3mInbnL3LuqJ2bOVqyoyeBVdkSsw
 5FUonyqajbV6lSZn79XWdQSnvtyXwdnSXkv80volJQHqxSB+cDStSyPQHgpRFHB6
 DMKvprVXIy93Gof051BpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567876; x=
 1667575076; bh=L5wASX54u8n/djj/NOTWyB5h74dOMSF40gyr8Izx+PM=; b=H
 LdzmdsPkObzjGsUJbpUqtcESSs8NEzMQB4dUyHGMXou0SMkfu96aHNECIKTlqiK9
 /a3jqGVCXucOVjwkAMMcLC/akaa/13DWw8Cy5iYfswpi6jIACTKexUZ5oCkoi6GC
 PyENG9cD4J2tfGg+GKRrPH0WcI5ah2Fo3QlADO3E19UYD0KTtaD/3j++PkJJ/3+4
 AsaWsAcv5G9vDnjwo4RsXSnsgb9mpTRZtXh0GczXU7ymQgtPIscMACZhJ+u9+MNo
 uDrtp1AvIOcwx0om7MNe4gwv3yMdCFwZyVlGNudQXysuymEj5Cxa4W9fgn/7CgwJ
 Fb+YSBhTRo8MsswXZOQew==
X-ME-Sender: <xms:BBFlYxem826tIFEspNPiZKm_uJwICu3abZJ9UtBoMuH85s88Q1dBBQ>
 <xme:BBFlY_N9IHzZ_krnA43Om_ekxhtOv6fOFFyIP5aG8NDcBh0UgRw7K3YvozyoIwrvv
 NEV_xZ1FIhE2e_44Us>
X-ME-Received: <xmr:BBFlY6hKYtgdpyZLBZg9dPlUNPjtm-zAh14Wl8sZoYiZBB5hQgM3vCnJ8JNGhTxDHmXC8nepmzzgtC2J-WAXeiZpjJh1jMBAT0dCirQrVtSIqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BBFlY68lsDhrl0-ogkbfS5D9mrwsGuv-yUuXHixP5-IK9dIrmM84EQ>
 <xmx:BBFlY9sJcyDD1nuDNuA0RSXnzppyRLZ7Eny-fLCA5F-9FPpHHKZaMA>
 <xmx:BBFlY5GQoKySiS1C9SXJvHGAGt4dmq01ueXCpx9103Utq5ch4NujDw>
 <xmx:BBFlYyNoamWkzyJvrKO5546vE2gl_P3_DYDPNUBTxKg9ftJeWl10TQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:21 +0100
Subject: [PATCH v2 04/65] clk: test: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-4-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=VkPVOrruF5FqCt4has6Fte3flpq+DUum5sJ0HsbRupA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp/yll1seLXoFEeiavmPhY805evWH5ladNrqys2tTy9H
 uMm86ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEJgUzMvxzbEzhdPe6VW79r632Ye
 yFOX5dESsKb6d3bDa8HTWn4wojw6ub9XclXhZxubQ2pbZPaV78dwnHM6l7cZqynTJaRwXmcwIA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:31 +0100
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

The single parent clock in our kunit tests implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

This is not entirely unexpected, since its whole purpose it to have a
single parent. When determine_rate is missing, and since
CLK_SET_RATE_PARENT is set for all its instances, the default behaviour
of the framework will be to forward it to the current parent.

This is totally fine as far as the tests are concerned, but we'll start
to mandate a determine_rate implementation when set_parent is set, so
let's fill it with __clk_mux_determine_rate() which will have the same
behavior.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f9a5c2964c65..b4f37fbd180b 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -104,6 +104,7 @@ static const struct clk_ops clk_dummy_minimize_rate_ops = {
 };
 
 static const struct clk_ops clk_dummy_single_parent_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_dummy_single_set_parent,
 	.get_parent = clk_dummy_single_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C5257273
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 05:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29E461801;
	Mon, 31 Aug 2020 05:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29E461801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598845856;
	bh=n8eva39d6i6OR7iE37A9HSwEN/eWgV3fEDnYsLTBFeY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVn0SLdyf2HkX0vhEV1Kco0psdRoxvlIBI4MG59idYA/GNYUoZ3NJ2QeJbJsEJSBW
	 1yF7CYbOfS9u7WhI1Zr0AGMycoDDJl3oE6uCUBhEmXlnbr+lZljOsZb4f1Yc03nP1Z
	 +f3Bb1OZVpWAzMe+d/3d39BQndl/ygLFPE6mReAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35384F80058;
	Mon, 31 Aug 2020 05:49:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88F89F802C3; Mon, 31 Aug 2020 05:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF4BF801DA
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 05:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF4BF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="hQeLlKHi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dR80+nW1"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D37B558054E;
 Sun, 30 Aug 2020 23:48:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 30 Aug 2020 23:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=vuHoEqUnlx/Z5
 PQhy2y3P36C8JzS/AOw1EeZvaEYsUk=; b=hQeLlKHiSG0COlQZgbKfxOFyur2kz
 cmsCZtMbGoKELzwPleO74JqS8+3CGmaVLhuGLpxzGJ0uiXQ08AH/VIZQonMi5vgp
 kbsS0oykrS3cfhO+9Hp464wl0H0GmZmzropL4PCMeamaC5s0JAXtBEKxPJMpOfs2
 LrZDWgR6HkADTCsejkhg9Sxxyhl9CkSRlc2RMQPAP92YxjRVjSBlA3UxTnRJNYid
 hxrzjLA9k7TicD9FI9mBacok1xBPQ+hwIYM5SGDhxZCKCuRhgH8SPrejBtXEOAfA
 32inhhUb0HtEqyb1nreS2xTOUujWyZbe68uz96RDdKkntHIkStvc3xmpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=vuHoEqUnlx/Z5PQhy2y3P36C8JzS/AOw1EeZvaEYsUk=; b=dR80+nW1
 hr11+rlosEOyNZhj89Hy9CSpvsPTXbNAoDi/rH1JTytVa5XvmrZJGbI8lGvzl7BS
 1IlL5kBYYfQ5hoAsIVkKthhhI17H/jc1xKtcaMitxdbOimWWHv2ujl2vRZ15v1ZR
 99Id81fmN7/bgKpZPmNG4jUoJkR0GzqxDo4h9sfmTkU7qFH6Xhe/sPa88uBxydvq
 2pC9xjYXHhGF47MZ9oW6nJW2NjxgIB3LidGWozai7RJcoQIgiqQUpgOuyHkY3P4u
 k1uZppDqMShHeAFO10saakNwFug0Qogq77th9thc4oBDFHdWuCe5QpjsCZBYeJ85
 g82fUPYwVONmEQ==
X-ME-Sender: <xms:J3NMXzRJ2Uxsm8o69iJZgZK93na29E9BPTf0UUD3PI2a5XEKZkTagg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:J3NMX0z_LswX-2Qojpu8r6d2Em6ndQmHr7dytuYu6Pq2udE2BqBnaQ>
 <xmx:J3NMX41T0WJT8YH2MnwTNvkdHt7LrY1Y4mjJpcNruTYYTmzbOZ8fmw>
 <xmx:J3NMXzCtELVjlbjMmo5GvV7sWUMcSTZnm6nIflK1XFJp1Lf55T1mFg>
 <xmx:J3NMX4j0xlaaZEUsuITrK0qJWeAPi84vxPmr-F8E4W-FApPnbRHqcQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id D1C26328005D;
 Sun, 30 Aug 2020 23:48:54 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/9] ASoC: sun8i-codec: Fix AIF1 MODCLK widget name
Date: Sun, 30 Aug 2020 22:48:45 -0500
Message-Id: <20200831034852.18841-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200831034852.18841-1-samuel@sholland.org>
References: <20200831034852.18841-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
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

The name should reference "AIF1", not "AFI1".

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 52ef0f9ec79e..263c1e7c3cc2 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -431,7 +431,7 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			sun8i_input_mixer_controls),
 
 	/* Clocks */
-	SND_SOC_DAPM_SUPPLY("MODCLK AFI1", SUN8I_MOD_CLK_ENA,
+	SND_SOC_DAPM_SUPPLY("MODCLK AIF1", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MODCLK DAC", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
@@ -464,11 +464,11 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "SYSCLK", NULL, "AIF1 PLL" },
 
 	{ "RST AIF1", NULL, "SYSCLK" },
-	{ "MODCLK AFI1", NULL, "RST AIF1" },
-	{ "AIF1 AD0L", NULL, "MODCLK AFI1" },
-	{ "AIF1 AD0R", NULL, "MODCLK AFI1" },
-	{ "AIF1 DA0L", NULL, "MODCLK AFI1" },
-	{ "AIF1 DA0R", NULL, "MODCLK AFI1" },
+	{ "MODCLK AIF1", NULL, "RST AIF1" },
+	{ "AIF1 AD0L", NULL, "MODCLK AIF1" },
+	{ "AIF1 AD0R", NULL, "MODCLK AIF1" },
+	{ "AIF1 DA0L", NULL, "MODCLK AIF1" },
+	{ "AIF1 DA0R", NULL, "MODCLK AIF1" },
 
 	{ "RST DAC", NULL, "SYSCLK" },
 	{ "MODCLK DAC", NULL, "RST DAC" },
-- 
2.26.2


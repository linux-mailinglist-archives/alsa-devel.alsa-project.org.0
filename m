Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE6160AF4
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:45:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E051167A;
	Mon, 17 Feb 2020 07:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E051167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581921926;
	bh=R/gQICyUhF0yzd9T8EqKX7YnV5psQfbI1zS4UFnZ8Gw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZgFCKgzheH8TFjMJSNsXSh+ZVGtchxR8yid3v59lM5AtO2tMetu9FJKnDncMxmW4D
	 NiatAquiPLct9Rjmoi+vEbkXGueyuiGmbSlKzSLPiChEEGmi13mt8nz4dPcgtfrUgg
	 KYNNOzSbO/meWLkPq3ow8RMhMbz/XFOlVzc7097M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B61F80233;
	Mon, 17 Feb 2020 07:43:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 841A5F80277; Mon, 17 Feb 2020 07:42:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20C59F80172
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C59F80172
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="RkZQd/pl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="4A4KsHWr"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AF91A52A0;
 Mon, 17 Feb 2020 01:42:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/r22J9LyeZH3n
 hDCjpJzsr1zZdkXKV/PR9xsFs//i4A=; b=RkZQd/plZ75InhtalRrUTNzlvrQDI
 V+DjOl2jqUeIv08IGxLfhJIShJWcrP3UmUePGseFiLDSiGl/QhcfSP6v5qaUJwOU
 d/rXUJ9E63xRv/jtQPW0LNakay1bdxhGQYAAk9esejDaI+vNMDsPJAKxXP7SH83v
 VxwiWvMeSNUCmhCDrAHqGEFMVowC2EJxEqZZOWiGVpjyIDnZ0vOUHnt5z8XbFpIR
 II82yO3+Oyg6moAedc23v5V0ASV1VPz7udjRWPKR3YFgR9ZryNDPhO1JzgijSmKp
 4srOtYmjnSsCGTa4aWGhIQnPrNbd3fIqKN84tKPyf0v+ZM0fUIi47WK0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/r22J9LyeZH3nhDCjpJzsr1zZdkXKV/PR9xsFs//i4A=; b=4A4KsHWr
 AHjQVFafot3515noqJwL7Rxql6EXlbl/OxkAe9sV+KdoDL6lBiHXsys4AZGEHOTD
 jMK+buGerTqJ+SmtKrr02483bRKbGDQ5jUmLHz9pQg2hJeOaEWn4cq0NoCdVdhg3
 l96zT8Cbi6mrwW/5STuEtHHCZLYfXgemu3z76Qk3EbAFVjhYyjw2aFUwGaS0BQw7
 jKCCFTvrDD84K3R/Za6Upu7KWHbBMfa1nR/t9o84APO08ENHCWvXLVpo47tzMGIu
 MY92krHAC1T2b4haAiX/0Y23Zit6Dw29jUnhXm/HVwT8GLjy6TwMKmjAEUtLiEZM
 1+cj7wCWxgYQQQ==
X-ME-Sender: <xms:7TVKXr0-o8ELo-TzRnG8KnI9PRIms0MAh8frMdCinqciToHwnJK3hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7TVKXi0bmbe0A7Qb41GS_IeKJk8QLApCAXNV9R6vyb2LLQ_2QDVFPA>
 <xmx:7TVKXhUBYj158EV3ESNGss-OK29itzxpdMcwLR95RtAz_lvmqAc-ow>
 <xmx:7TVKXkjc94DvGv4d2-mwOCW7RIcdMSzjMTxe2j8s7ZQnAHYTp-2ZPQ>
 <xmx:7TVKXvBFR55WaXcyhc5tivgDJeGi5gSkxGgx23jagq6uviiWuCi2kg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2BFC3280062;
 Mon, 17 Feb 2020 01:42:52 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:20 -0600
Message-Id: <20200217064250.15516-5-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 04/34] ASoC: sun8i-codec: Remove unused dev
	from codec struct
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This field is not used anywhere in the driver, so remove it.

Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 14cf31f5c535..33ffbc2be47c 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -86,7 +86,6 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 
 struct sun8i_codec {
-	struct device	*dev;
 	struct regmap	*regmap;
 	struct clk	*clk_module;
 	struct clk	*clk_bus;
@@ -544,8 +543,6 @@ static int sun8i_codec_probe(struct platform_device *pdev)
 	if (!scodec)
 		return -ENOMEM;
 
-	scodec->dev = &pdev->dev;
-
 	scodec->clk_module = devm_clk_get(&pdev->dev, "mod");
 	if (IS_ERR(scodec->clk_module)) {
 		dev_err(&pdev->dev, "Failed to get the module clock\n");
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

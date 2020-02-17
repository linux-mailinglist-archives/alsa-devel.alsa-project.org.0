Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7DF160AFE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:46:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3AA21684;
	Mon, 17 Feb 2020 07:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3AA21684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581921984;
	bh=9UGpinSjkMjiPWxlVIYGeWkFn7CWrzyUUvXEJO7U9iw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LkCEGjix/hUOi+EMBieFmn9+yOljl+UWyCHjrbNQtwnUh70Z8xY5KN/RyH+mI2Yt0
	 b3ysMY7ZS8pu7lpURNXLjpaebtmpsrfbmtYB3kgDRqQzXjcKV0kGOfepuDCCqwJJ8T
	 HzTLSrtVjoC+OJaNCSFJyLw1Bd9QqvvNvR9QZGqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B5DF801F5;
	Mon, 17 Feb 2020 07:43:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96F42F8029A; Mon, 17 Feb 2020 07:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE168F801F4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE168F801F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="VjDVnylg"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="O7JOvtlF"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 77391522A;
 Mon, 17 Feb 2020 01:42:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/Gz9CsMmbdcrp
 9kMVCWTTsaDhYUcCaxrF9/HDAwTHKU=; b=VjDVnylgG2LGyvcpl9mBpyl6stR8G
 4uFkbuK8eeuIrCdclOr3vVR9riQxRH/LkG9Fi17pSK5flP/1IGrTCZmGFIlXfMrm
 EA2VMOwM5bma7VA9qJ2BtyO7oWLYxzCX5UgMkzD+n2RWcPNUIqZajkEJZJlyA8Jc
 llyYBpj1n7TKAOVGjuFWmLChB784wazfndfdwfQBdxsTnChr1P9v850p4MaQZd+s
 I/j+2JsSX6yzkMCQSKKe+lda4OSYn6nDzInlNYOu1sgH0C7GoLcu1t/AbGkJmteD
 qBhhD7nnVnffarL8PPQc7jigc2RJF9HL/D9b/GPhMsWnFjHzW00jyhdEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/Gz9CsMmbdcrp9kMVCWTTsaDhYUcCaxrF9/HDAwTHKU=; b=O7JOvtlF
 REuRqYr0lwuabjfsdDy0gu4A7Yxpk3C5u6yZhZtVrqiKxKf1BuNEQjCc5rHaADF7
 8fJB13eCs25DGL9K9wulZWIA4UzoiZHMndCodSAkLoAYcCfFgw7rju+2M8HJvcKl
 s9ThTKwbVm4Y4s9NpXoWoWO0XgzJ60ua6lC19P4+oyJX/TX0xUUw6FqGw7v4pyPa
 a/25vT1v1h/6A7GuMyyGL5Axy/o7IxVToCeLAEKY9DAVxh9JDGk0um3oH9oGOcrZ
 xsoQMciqWus28A1Y8k7gcN+dMAGw6dxZ2Wwd1Gcp4CbTMJS/KouYrwGwNOZ8tyRF
 0ICr1Y8bQxcVtg==
X-ME-Sender: <xms:7DVKXo1DaDJG8d4Ga6Jv-vdyaxBnPqApLsAX8sI55uDHxBviOEScyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7DVKXul36QX7Mv3aqrG4wyt3ojg7SbbuWMcTFTNyFWwf7yiq6yKPCw>
 <xmx:7DVKXm4boMbEjopJ5_PHRFsI675HN_YybnOLyIRfJS9h5t7A2Hq4RQ>
 <xmx:7DVKXvlWwE6B7azilCWmcy07aLGM1SdWYWWUBAuhjPUfkCymJO3h7Q>
 <xmx:7DVKXlO72EjgDkx-YNUXIm4bah2ERIQRp09BCfMKo5y5QSLwcWX90g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFF183280065;
 Mon, 17 Feb 2020 01:42:51 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:18 -0600
Message-Id: <20200217064250.15516-3-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [RFC PATCH 02/34] ASoC: sun8i-codec: LRCK is not
	inverted on A64
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

On the A64 (tested with the Pinephone), the current code causes the
left/right channels to be swapped during I2S playback from the CPU on
AIF1, and breaks DSP_A communication with the modem on AIF2.

Trusting that the comment in the code is correct, the existing behavior
is kept for the A33.

Cc: stable@kernel.org
Fixes: ec4a95409d5c ("arm64: dts: allwinner: a64: add nodes necessary for analog sound support")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 55798bc8eae2..14cf31f5c535 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/log2.h>
@@ -89,6 +90,7 @@ struct sun8i_codec {
 	struct regmap	*regmap;
 	struct clk	*clk_module;
 	struct clk	*clk_bus;
+	bool		inverted_lrck;
 };
 
 static int sun8i_codec_runtime_resume(struct device *dev)
@@ -209,18 +211,19 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 			   value << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV);
 
 	/*
-	 * It appears that the DAI and the codec don't share the same
-	 * polarity for the LRCK signal when they mean 'normal' and
-	 * 'inverted' in the datasheet.
+	 * It appears that the DAI and the codec in the A33 SoC don't
+	 * share the same polarity for the LRCK signal when they mean
+	 * 'normal' and 'inverted' in the datasheet.
 	 *
 	 * Since the DAI here is our regular i2s driver that have been
 	 * tested with way more codecs than just this one, it means
 	 * that the codec probably gets it backward, and we have to
 	 * invert the value here.
 	 */
+	value ^= scodec->inverted_lrck;
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV),
-			   !value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
+			   value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
 
 	/* DAI format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -568,6 +571,8 @@ static int sun8i_codec_probe(struct platform_device *pdev)
 		return PTR_ERR(scodec->regmap);
 	}
 
+	scodec->inverted_lrck = (uintptr_t)of_device_get_match_data(&pdev->dev);
+
 	platform_set_drvdata(pdev, scodec);
 
 	pm_runtime_enable(&pdev->dev);
@@ -606,7 +611,14 @@ static int sun8i_codec_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id sun8i_codec_of_match[] = {
-	{ .compatible = "allwinner,sun8i-a33-codec" },
+	{
+		.compatible = "allwinner,sun8i-a33-codec",
+		.data = (void *)1,
+	},
+	{
+		.compatible = "allwinner,sun50i-a64-codec",
+		.data = (void *)0,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun8i_codec_of_match);
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

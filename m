Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6A24A7DAA
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 03:03:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DA1F1757;
	Thu,  3 Feb 2022 03:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DA1F1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643853789;
	bh=6KwpskiMqbuQTAZ/20OpLP94PBTNIVeLcXGARz7224Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lr4luPMrTTw2/G+YZ10frNSesuDbOxgjnigBxpAbS1GmYDtp4ZEsI4C0yRPSrQhUu
	 LwEhAq9UTCKsOjJdDcOu9BO20hqEJwx54fq7imaYxE2X6m9Vl+RCraegiEW/aHTr9I
	 Owtb7cql1yMmUPY/kW05pWqAFjXvrhN7cLglBs5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 898EAF80515;
	Thu,  3 Feb 2022 03:01:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06B36F8050F; Thu,  3 Feb 2022 03:01:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D5EEF80508
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 03:01:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D5EEF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="MN3sE4II"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="M4+MwmA+"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9CE9B2B0009C;
 Wed,  2 Feb 2022 21:01:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Feb 2022 21:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=oRtlm9gP26d6U4CD1wUo0AI9DuSbCw
 n2YimTpK+4ceA=; b=MN3sE4IIAhqB46he2RABex7nCo2tqUTHS5bn+SBc5y3bFJ
 YEdBbYp/DsCZnUTT3iOfcYmBt0kHKyt2Wt5riuPQG1pS4aXnrZD8pZ+P97oms3fB
 iGaHFWXZ70OJjJjv+jaEhohnh8X8drBwK4DN80p6apt3ZClxjT/y3+qs3sJ7J3vP
 5UPqih6W9jSQbxYGMdUUuq2KZnJvyO5uUXMhP82iC233Licptj6DQogOAocCuw32
 eaNygMUmjJDdhW7yyx9EpSjGqINLxEmvX9sCAFBGdcS1AE0HYwYcUocl+GwmUX+p
 HkaYqs8p7/cP0hJpxdS7wHYOmC0Fztxz/ET+OwFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oRtlm9
 gP26d6U4CD1wUo0AI9DuSbCwn2YimTpK+4ceA=; b=M4+MwmA+hF8VoiDARbFKVx
 h/dkp/veyLdBIueoAFgyRJLn/fmm8zWO1PcWYxshCiCMYeNvlDG4VBwNM36cujX5
 DE+ilKUPUlQ24X9urJWpB/3qPl3renErWDV5bdEvgw9uvr5ds03aZHu4myZmgp0L
 qXeiCA2tVDQHlc/IVc6s5dTwT61VkmOj1qOi21SnlEpl89lx8Cc1ooA16s0lPm+n
 7YuOsKv3P6som27gfinokhWllWxK9r4h8smKZa7mzetiuG108d7xlxPLDO03UQtD
 cDwNJnt2DpNgDWbzdR2nAOWtLATY3yQDHtUt+wyhbZDsccAvkQay/ts7XjqERmjw
 ==
X-ME-Sender: <xms:dTf7Ya3CRvjoaGWmUYEjNWJ2JNpuFqF3JO3f0jRAmMeh_ePC0aqrWQ>
 <xme:dTf7YdFteg5-54TkqnncJI_7hzAPNi8FJiCd7mQ1V9Sn0jwQThSEox4jSztVYBJ9u
 OTca2_lQzEHNkTGJw>
X-ME-Received: <xmr:dTf7YS7g1pqbNJ1RD4zMLA-D4YLQD4br89xYoj_CrphW5LGHS6e9zoJB-PyJBlUKRWlMTrcYubwabxeXsTRT7OljsJFJrYY34NVxeJ09-rsFZJgz05jxqgYlV3CMynjXOH58zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:dTf7Yb0zMs5rCmH8Ev2edoJWv8Dgb2iPDl2EFNviq33WhHK0SjlpFw>
 <xmx:dTf7YdGZW7pTNw1VQjVch3QS1VgWwWX5anmA6nogm6i4z5si9vJmRg>
 <xmx:dTf7YU_gxDC9CYyZdl8o-qrg8Iwug00kFHsgrNKC7Bvdz5MziRtu8g>
 <xmx:djf7YVGPG88dC4sm8TLNE2Rfhan3kHymAb_cY2lRlEtAayWaYfwH5O_8RvQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 21:01:25 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: sun4i-i2s: Update registers for more channels
Date: Wed,  2 Feb 2022 20:01:14 -0600
Message-Id: <20220203020116.12279-3-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220203020116.12279-1-samuel@sholland.org>
References: <20220203020116.12279-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

H6 expands the number of channels in each direction to 16, so the slot
number fields need to be expanded from 3 to 4 bits each.

R329/D1 expand that further by allowing each of the 16 slots to map to
any of 4 data pins. For TX, the configuration of each pin is
independent, so there is a copy of the mapping registers for each pin.
For RX, each of the 16 slots can map to only one pin, so the registers
were changed to add the pin selection inline with the channel mapping.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 sound/soc/sunxi/sun4i-i2s.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 1e9116cd365e..7da8a16955a1 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -115,9 +115,9 @@
 #define SUN8I_I2S_FIFO_TX_REG		0x20
 
 #define SUN8I_I2S_CHAN_CFG_REG		0x30
-#define SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK	GENMASK(6, 4)
+#define SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK	GENMASK(7, 4)
 #define SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM(chan)	((chan - 1) << 4)
-#define SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK	GENMASK(2, 0)
+#define SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK	GENMASK(3, 0)
 #define SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM(chan)	(chan - 1)
 
 #define SUN8I_I2S_TX_CHAN_MAP_REG	0x44
@@ -138,13 +138,19 @@
 #define SUN50I_H6_I2S_TX_CHAN_EN_MASK		GENMASK(15, 0)
 #define SUN50I_H6_I2S_TX_CHAN_EN(num_chan)	(((1 << num_chan) - 1))
 
-#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG	0x44
-#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG	0x48
+#define SUN50I_H6_I2S_TX_CHAN_SEL_REG(pin)	(0x34 + 4 * (pin))
+#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG(pin)	(0x44 + 8 * (pin))
+#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG(pin)	(0x48 + 8 * (pin))
 
 #define SUN50I_H6_I2S_RX_CHAN_SEL_REG	0x64
 #define SUN50I_H6_I2S_RX_CHAN_MAP0_REG	0x68
 #define SUN50I_H6_I2S_RX_CHAN_MAP1_REG	0x6C
 
+#define SUN50I_R329_I2S_RX_CHAN_MAP0_REG 0x68
+#define SUN50I_R329_I2S_RX_CHAN_MAP1_REG 0x6c
+#define SUN50I_R329_I2S_RX_CHAN_MAP2_REG 0x70
+#define SUN50I_R329_I2S_RX_CHAN_MAP3_REG 0x74
+
 struct sun4i_i2s;
 
 /**
@@ -523,13 +529,13 @@ static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	unsigned int lrck_period;
 
 	/* Map the channels for playback and capture */
-	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFEDCBA98);
-	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
+	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG(0), 0xFEDCBA98);
+	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG(0), 0x76543210);
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0xFEDCBA98);
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);
 
 	/* Configure the channels */
-	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
+	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_SEL_REG(0),
 			   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
 			   SUN50I_H6_I2S_TX_CHAN_SEL(channels));
 	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_SEL_REG,
@@ -563,7 +569,7 @@ static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
 
-	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
+	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_SEL_REG(0),
 			   SUN50I_H6_I2S_TX_CHAN_EN_MASK,
 			   SUN50I_H6_I2S_TX_CHAN_EN(channels));
 
@@ -1210,9 +1216,9 @@ static const struct reg_default sun50i_h6_i2s_reg_defaults[] = {
 	{ SUN4I_I2S_DMA_INT_CTRL_REG, 0x00000000 },
 	{ SUN4I_I2S_CLK_DIV_REG, 0x00000000 },
 	{ SUN8I_I2S_CHAN_CFG_REG, 0x00000000 },
-	{ SUN8I_I2S_TX_CHAN_SEL_REG, 0x00000000 },
-	{ SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0x00000000 },
-	{ SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x00000000 },
+	{ SUN50I_H6_I2S_TX_CHAN_SEL_REG(0), 0x00000000 },
+	{ SUN50I_H6_I2S_TX_CHAN_MAP0_REG(0), 0x00000000 },
+	{ SUN50I_H6_I2S_TX_CHAN_MAP1_REG(0), 0x00000000 },
 	{ SUN50I_H6_I2S_RX_CHAN_SEL_REG, 0x00000000 },
 	{ SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0x00000000 },
 	{ SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x00000000 },
-- 
2.33.1


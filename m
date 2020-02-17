Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A1160B2D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:54:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9C916A9;
	Mon, 17 Feb 2020 07:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9C916A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922472;
	bh=R9gTIB4ZFiTRZU+7CzNPSSjZ4yjL5Tux0ZIgVhZ4pVQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6DeyCbFVV4+THnf3AlOemM88qvCaSKYECoEcUAiXqCraMwGSX21pItGlP0HySHKo
	 8ox03K64ftswPdiLZwfEd20LnlmFHOkBYud30s0UizmkjwQb4UaTDTGnUM9+svdZPW
	 ueA+x3gHSaTiOpOr+r8iOEyI7P4BccC9SsErkgeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63334F80333;
	Mon, 17 Feb 2020 07:44:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92CCAF802FB; Mon, 17 Feb 2020 07:43:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FAF9F80172
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAF9F80172
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="YkUlL4uC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="o57zOObe"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 65B4B539F;
 Mon, 17 Feb 2020 01:43:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Ka38TRYaT49vf
 pdd4Hx2SUEK/pkVlhY/GFkRWWqZ1Iw=; b=YkUlL4uCUFYm72WdplCV2egPKoT3g
 eEL9x7B8x7GchOFWWeUwjI4EOqQvFIKQvPa/5t2NdX2udiwBd0LECukJjjxM4t2N
 nBUPb2CfU0LsLQz7TY2PM3Jc/xfzSOYMEZ7w1wCKyU6TI6pBZu6iqwnDh7DtQHvX
 LHc10YVCl2Z+YaehH10R+AGOacdRXQv7vLJk014z7wqQ8VLFl0VwY2fd+sX+5L4S
 MKFi/7aDg9jCyMR9coZHqUJv5TRA9phGTZDqqjVgysB+V7IyZvNJYyrz1BHp8sWg
 HrwWaQ3OfCUeVNRN2fHnlMzpNaL8FWUpdl/qWiDEfjl5KpR4DrMpNQFPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Ka38TRYaT49vfpdd4Hx2SUEK/pkVlhY/GFkRWWqZ1Iw=; b=o57zOObe
 q1sivwubPtAEh8LNg0PFAi1axSJJ9qQ1QKhY8XTngxGbU+9/O9oxX+bUD/HkuIEL
 po3pb+C9LSxl2IONKaMu+xiQ0iNAqkhitBBtZLzvmQyCos9oIl6CwAKfPEIOmIMT
 SvI/HPY1YMoHm9L/OCdCofGxpt547YBYzAcdXX6z5X7Vlh0KG6gnTL4ysFtyFJZ1
 OJwrVODeKvo7XTgKatMgj1XS3uTlNg22L7/1GQNHpfl9bcRKDsrB/IsJBg8QiUDa
 pxz5Nc3qxy/gad0agbFVuGQse01FN387gV9K2B82kD9HDlPv0PPcmnlDy6GkgcuT
 1/bdzrN+HDWjbg==
X-ME-Sender: <xms:9jVKXn0FPsuD0woE-CZhJPVCjF7HZE8aFWSzuzSCmuMo2jgRWLiFNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedujeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:9jVKXrBZH8WTh0eXzyLSQhSbgCKq-n15kVEcz1FXOo1ry1ReeSzT3w>
 <xmx:9jVKXsJ_reivPJ1nFomRunQiI0QJt-oGrTF7-yBV49FpbHGbtxOKXg>
 <xmx:9jVKXslnIQd-lTbQJIb7GYmDlObXUdV5lbHaFTCKoCa4EuUQa0C69A>
 <xmx:9jVKXraDwrxNGx6BdM-gXyt0IEioxlZN_skZo2IZ0AWaA4Fd_lse9g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5DC9328005A;
 Mon, 17 Feb 2020 01:43:01 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:34 -0600
Message-Id: <20200217064250.15516-19-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 18/34] ASoC: sun8i-codec: Allow all clock
	inversion permutations
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

Since the hardware has separate bits for BCLK and LRCK inversion, we can
support any combination of normal and inverted clocks.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 36ce281286b5..f8cde149a92b 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -41,8 +41,7 @@
 #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
 #define SUN8I_AIF1CLK_CTRL				0x040
 #define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
-#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV		14
-#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV		13
+#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
@@ -81,6 +80,7 @@
 
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
+#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
@@ -205,16 +205,18 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_NB_NF: /* Normal */
 		value = 0x0;
 		break;
-	case SND_SOC_DAIFMT_IB_IF: /* Inversion */
+	case SND_SOC_DAIFMT_NB_IF: /* Inverted LRCK */
 		value = 0x1;
 		break;
+	case SND_SOC_DAIFMT_IB_NF: /* Inverted BCLK */
+		value = 0x2;
+		break;
+	case SND_SOC_DAIFMT_IB_IF: /* Both inverted */
+		value = 0x3;
+		break;
 	default:
 		return -EINVAL;
 	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV);
-
 	/*
 	 * It appears that the DAI and the codec in the A33 SoC don't
 	 * share the same polarity for the LRCK signal when they mean
@@ -227,8 +229,8 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	 */
 	value ^= scodec->inverted_lrck;
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
+			   SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK,
+			   value << SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV);
 
 	/* DAI format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

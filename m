Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA5160B1E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:51:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 240971697;
	Mon, 17 Feb 2020 07:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 240971697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922303;
	bh=KZvjJ99t7fNSxZVKbjCPoX7mVlNNwTLvmx4lGPLONdI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BojU4bmuDkVrjsq3bog2T5ZHvZAPcZxn7QqgJsNbJmM/KeWoN6Ug3uA93Ii7PZba6
	 2Q2Uoy8RbrcaS1zF9lkKGn0AB1OzknwvW/1mObfEq+CsVxXgVoAfUjsht/SYZsxRhD
	 tVOmQTxuAMIfJkaCuSfBX+DyuBQXjz+0qr+/H4CU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE38F802A8;
	Mon, 17 Feb 2020 07:43:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8A1DF80247; Mon, 17 Feb 2020 07:43:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B819F8027B
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B819F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="iYnsynIQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AB4wG6tJ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B0AE5240;
 Mon, 17 Feb 2020 01:42:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=quPjEsfhLhkxZ
 JxWr8pdY2HamuseL6mLJzNXb0wlNAQ=; b=iYnsynIQaQ8rJpgkLfEnukcRnAEXZ
 AUpa+Md+7MnQL23o9Wi6C3GzBslTOnkjlWE9efbDS54FpzfACFYIS85VlVv/jX+E
 DRf1ewGLxn1K5xfWCbtvbI2mzRF+DYlpKnWDcCeR4/3Dvre8YwftM6/HLOYGPuDR
 v6sz5diQIZ4W7dx2xeSYE2FrK4bJGQsyLvdL805sayqfa2KZ27ckOjz26V2WJPu2
 bSfliW6KiqJK59MZUF5iyyNdCfAd0pT+Gg2JN4+/pEzUJD4vBw4nQexZJokyGXEq
 szxXGYEUDXHVMNwdF71ugVNmfGpmcCYlUTOHwPYhcls/fKvexukKRch3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=quPjEsfhLhkxZJxWr8pdY2HamuseL6mLJzNXb0wlNAQ=; b=AB4wG6tJ
 y9hHY+UgJpTnH5ooW/QWnC3TdWAbJCGrJJzIwdL6l7+EuY8Ld7XIqBA3B3Q+vXe6
 MMtt0LmKEjgyMVnUzEqXhDdsRy7Rp0Yu2D6hJm/dhk3XO43l1Tm9tBuCgVCwsmix
 PdUEitiqXDQfgRXydbEQdyjZFGlH4ELpQ78qykDvT7q4dZH0Gw3WF1ywiWMBblgz
 3CajymOQmYBh796jX5RF1u3zlhU7kMq9z/U4gmlymjpstsy6hGVNIxAzAfed7Dy3
 i9gb6KIPkJJKC4uoqx50MTHadkBN450KQaN52bCMHZToOEa5bNBM9CBnu5Wc5y8A
 8b0zsBwXy3TqJw==
X-ME-Sender: <xms:8zVKXq4no9v-8W8clfOk-kyd4Lyuc93uG1znpSY4iKF83smxYt6Y5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8zVKXq3zWpR9CyukjTBk4TxDIlJIt-ayHp8f8sKBRsCh9ku6EyBOYw>
 <xmx:8zVKXiZkllV2gTaBopMwgHhzDNEdnPmqPLoQ99VWh0h5GRyNyZrLRg>
 <xmx:8zVKXu-_2DIGd0hQsed669T0S_3fS_6fYQ8D0hg2GUUOg3Q_-mBzeQ>
 <xmx:8zVKXp88cwrOgijRPne_-v92y0Nh8sOEVyH3Xa2kVXJOpgsJ0g2VAw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CFF73280059;
 Mon, 17 Feb 2020 01:42:58 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:29 -0600
Message-Id: <20200217064250.15516-14-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 13/34] ASoC: sun8i-codec: Fix
	AIF1_ADCDAT_CTRL field names
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

They are controlling "AD0" (AIF1 slot 0), not "DA0".

Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 03cfe4e17ff7..8b08cb34c503 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -49,8 +49,8 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
-#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0L_ENA		15
-#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0R_ENA		14
+#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
+#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
 #define SUN8I_AIF1_DACDAT_CTRL				0x048
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA		14
@@ -406,10 +406,10 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* Analog ADC AIF */
 	SND_SOC_DAPM_AIF_OUT("AIF1 Slot 0 Left ADC", "Capture", 0,
 			     SUN8I_AIF1_ADCDAT_CTRL,
-			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0L_ENA, 0),
+			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
 	SND_SOC_DAPM_AIF_OUT("AIF1 Slot 0 Right ADC", "Capture", 0,
 			     SUN8I_AIF1_ADCDAT_CTRL,
-			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0R_ENA, 0),
+			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
 	/* Main DAC Outputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_PGA("DAC Left", SND_SOC_NOPM, 0, 0, NULL, 0),
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

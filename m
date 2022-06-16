Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0674054DA8F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 08:28:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AAB41AE0;
	Thu, 16 Jun 2022 08:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AAB41AE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655360892;
	bh=6pl7bTO1Gj1kdpynWzIlJKnTNNWmWdFoAxJ7BChJAXI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ex8N18TP2ACuQlE42jRsnoIhl+RkHrNsT6963ZZuGbApIyBnt/Isap7cmY1AwAbYH
	 SQcG6tN/vCOOjuykdABIBirTakGdaTEJ73BC8NfasAfsaKyeCKj7kAAt8JYqg6iGii
	 2sxBtKiGyKcS/xq3hjLgQQm17C3FqsUDcYxnuaMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E67F8052F;
	Thu, 16 Jun 2022 08:26:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C546FF804D0; Thu, 16 Jun 2022 08:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E9B8F800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 08:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E9B8F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="IVlm4kT+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vvXG2UPb"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EFAC73200B43;
 Thu, 16 Jun 2022 02:26:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 16 Jun 2022 02:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655360766; x=1655447166; bh=B6
 6Ha6BawNI5v7cRXHK0sJIXUS4GnPz6lQgVNJ1yryI=; b=IVlm4kT+eA+Eu/+rpc
 Pq8+7roAl6iskpML1mlrdCp56hkrO1E2t/S/7jFYZQw3vxvt0bC5wrt2IETkT5+i
 6U4Rli4s9hE/t2ehUm+MgyN5rTrrwKL/Cn29KvMM4uM9n638tPSeMzOj0ccfmp1y
 VIbn53tRmExR8qIQ2BRWmravSraaQTqw7wh0QwfsWPw5DXIff2cxgATsqKn9THTD
 EYBOe/4LS9X3bVn6qdHeFdBO3w6AtbiE4czasBrcEXh9CUewGkKmuyTWIQsEW/9l
 tM5DG8ViNI4flI/9VHhqSqjnjLo3VdLxKkysRBGMZAqU7o1eKD+aAH2v3QqrCAZk
 pujw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655360766; x=1655447166; bh=B66Ha6BawNI5v
 7cRXHK0sJIXUS4GnPz6lQgVNJ1yryI=; b=vvXG2UPbKQsU/5BAOEja64obwY9m9
 /yltaHtzF1nubRwdvr4i3kzJlOwydcZY3eZmuhuAyNAGSphGIFqHIxdHB71f3jdL
 gg40cEyOyry0RAHmMr3sCD645T4Fw0HzjVqQDPCZ3LB7vO+z9A5+7N04yvXoNNhB
 hYQEkdnzDVZfaRVwh92ztoqiX3X9YHgfyLclsS8KUrRCzXwUlSsRsD8v65miPeRB
 dDofx07wLQ+R5+K/jaFl2irP4kBlwmcChv+ikvdY4d44eurrjJuLmWh5K7QHwwhA
 htK2pKOEQT06Kk5bwMHWID5hx9uqmcxMrK+Oeh3WaIzuriR+5WVANHwyg==
X-ME-Sender: <xms:_cyqYs-9zC4vzVwAdmFbBS8PEO7UHAIbqQnTwR3Y-u5mkXj51k9wkw>
 <xme:_cyqYkvnfqRH4tyGxHZpZFwTe_9GrTfnAVI54lLzTYqDPHUp7SnLo1laS9n1tHqK_
 -vrq6a3HtrK4K4NPA>
X-ME-Received: <xmr:_cyqYiA1WkjhdrDKVZqi9SSZZ7dk41topdAy8cE_NbAo4vvxVvcg8bBUt1cEdRwHGmtb8xWAvNeh_whm16oMcHzym3p_0VR7XXDRsq9ANzh6m8qrgkAFYy2jcfkXiGV5lr_Vww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
 gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:_syqYsfKhthcAxyPzjKZK106WNh3xL1sidzLtxt63E7d6m-egTAErA>
 <xmx:_syqYhPlSglZP4Z2pwuSIETtq6GD1mCglkkIf_ltjAU5GPrnLv3HMg>
 <xmx:_syqYmk3HWeak4GaVts3SvYkIlLvcpSjUtlayDHmiHPSkZBfwYLGVQ>
 <xmx:_syqYonmp-6xj7X4vInCLZnDlNl-CcUaVF3ZPI2SlfmR7GvIsrtSCw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 02:26:05 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] arm64: dts: allwinner: pinephone: Enable internal HMIC
 bias
Date: Thu, 16 Jun 2022 01:25:54 -0500
Message-Id: <20220616062554.57266-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616062554.57266-1-samuel@sholland.org>
References: <20220616062554.57266-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

Revisions 1.0 and 1.1 of the PinePhone mainboard do not have an external
resistor connecting HBIAS to MIC2P. Enable the internal resistor to
provide the necessary headeset microphone bias.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts
index fb65319a3bd3..219f720b8b7d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts
@@ -10,6 +10,10 @@ / {
 	compatible = "pine64,pinephone-1.0", "pine64,pinephone", "allwinner,sun50i-a64";
 };
 
+&codec_analog {
+	allwinner,internal-bias-resistor;
+};
+
 &sgm3140 {
 	enable-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* PC3 */
 	flash-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
index 5e59d3752178..723af64a9cee 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
@@ -29,6 +29,10 @@ &backlight {
 	default-brightness-level = <400>;
 };
 
+&codec_analog {
+	allwinner,internal-bias-resistor;
+};
+
 &sgm3140 {
 	enable-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
 	flash-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* PC3 */
-- 
2.35.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738736F4B8
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 06:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 151071695;
	Fri, 30 Apr 2021 06:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 151071695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619755254;
	bh=0Lg4ULP/nMjVTZMR/E7a+ihzfnh/vGNCsQz/1RsCPao=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L0JfjBIthtP6O1EfFM5S/ta/FzvWz45TR7elVsw8htOQJTBTO+5nq5Y0LE6Q1HdfZ
	 c58SwO6yqUiOz8h8fKpWthoLXFm9UYlyyLqtUton1vF1ykm97Gov9XM52ygZcCVdp/
	 IpnRNMEgzw13w799Gu+yFbN6e/NzZdccJzKH36Cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE354F80165;
	Fri, 30 Apr 2021 05:59:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0379EF80425; Fri, 30 Apr 2021 05:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 252D5F800E4
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 05:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252D5F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="p7X+/8zV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AwUnA8+k"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 73E4D58098C;
 Thu, 29 Apr 2021 23:59:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 29 Apr 2021 23:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=C/zv9YAufZEA1
 vYQZ89gyFjqQ5tKRBiTvd9OZQm7wS4=; b=p7X+/8zVRC7OM40ixXor7PStlAf1B
 d+fNjICLPlm7O2B1ySMbXOrsSQv1RYYl6fIVW2mNAwh1fiSGtJojBTKMW3k+VmHy
 yjoaBRZIchoE7h4troyMEUKU04LB1wBcMKH3+1VhkHzou7A7LlIH/zAGLQtqzxOZ
 tANQwDh0GwQvSu++j7PuawlbM1C9hnmFp7vunN9wGkkG5XLOlYLBQUInSzhXo6fF
 tqGngYhNEOs7TrN2h+UfJDdspYSSqO3MX32KZPy4ZQbFRq8KiBuGcfzCLwAtl6GN
 x8U0DWCg0tvbE6EBoMyo5J9s5a83igXxsGfcmARVSIgWoBw8jWmKyo/pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=C/zv9YAufZEA1vYQZ89gyFjqQ5tKRBiTvd9OZQm7wS4=; b=AwUnA8+k
 otv4GjsfgS/kRNyRZADBOpKQMrJ3616aHugx7CPyZJ65/X0reIOr7KukHTe4WmMQ
 RjlgLFtDpDYNq8ZRb9ddHKmJfE4X6Mz6zTGm639bwuH7uyNZHmWkpaeVJ81sfAKT
 J+XxkDmHco5uq5r3NY27wBGrxozUxM8hRiw9m2ZYJuTDwSv1IFw6X3E5NzVcPtvZ
 42oB8nd88KvQgNBwfr2CxlQKqR/FBMZ/5ozoYancNLYfgSuNT/E9FgFrA+N/qgMg
 yN8AxmG1Px02qA5Eq2qVfjNx2sekjEzRqyquDNLdroQPRT+6EBkIMYTK+sl8IRW+
 dJ2RBH4shXXu6A==
X-ME-Sender: <xms:h4CLYHEcWZ5Qd0-n7d4TaD7b8-TE3lWyAUW0GhvCKLeN4GD1_iOSJg>
 <xme:h4CLYEW-oPmd4CtO_h4u6piOvYszuFNmPWzNO6Uxuv-Hp1Pz7YZNPSWGfuy3_R0qD
 fW3dRHzp807TWm6kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:h4CLYJJZX-kPUviKas-CZ1w3kv6CkPJa6lvnQIx4P-waSTanyJTcgQ>
 <xmx:h4CLYFG7jXs-fj6O-ypKcLAdXk0uHTmrcHlEWkx0Zrzw0uWYsHZLvQ>
 <xmx:h4CLYNVLkxqUY2-bw6t-m9LLFHXo9MmdzfsvPCRFeM7iWAbuqjsdYw>
 <xmx:h4CLYFRSPNiupws35jXNVXHU1xtD7cfrLxWnT4a7RSDPocV-G10FxQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 23:59:02 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/7] ASoC: dt-bindings: sun8i-codec: Increase
 #sound-dai-cells
Date: Thu, 29 Apr 2021 22:58:53 -0500
Message-Id: <20210430035859.3487-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430035859.3487-1-samuel@sholland.org>
References: <20210430035859.3487-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
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

Increase sound-dai-cells to 1 to allow using the DAIs in the codec
corresponding to AIF2 and AIF3.

The generic ASoC OF code supports a #sound-dai-cells value of 0 or 1
with no impact to the driver, so this is a backward-compatible change.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../bindings/sound/allwinner,sun8i-a33-codec.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
index 67405e6d8168..19f111f40225 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
@@ -12,7 +12,11 @@ maintainers:
 
 properties:
   "#sound-dai-cells":
-    const: 0
+    minimum: 0
+    maximum: 1
+    description:
+      A value of 0 is deprecated. When used, it only allows access to
+      the ADC/DAC and AIF1 (the CPU DAI), not the other two AIFs/DAIs.
 
   compatible:
     oneOf:
@@ -50,7 +54,7 @@ additionalProperties: false
 examples:
   - |
     audio-codec@1c22e00 {
-      #sound-dai-cells = <0>;
+      #sound-dai-cells = <1>;
       compatible = "allwinner,sun8i-a33-codec";
       reg = <0x01c22e00 0x400>;
       interrupts = <0 29 4>;
-- 
2.26.3


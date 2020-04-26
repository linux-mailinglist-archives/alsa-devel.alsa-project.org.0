Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC8B1B8FBC
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 14:08:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7B81688;
	Sun, 26 Apr 2020 14:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7B81688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587902898;
	bh=BLb/2JVOU6GjAOaqq2ZF+M+5nxpkI0dVmUJCuiKlU7o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFSpchou2Jjr/4rpgXOX/5BeIwhSxTc0nepaAfnusX3kASH3rFClpHRr+dqN5O4Fi
	 TKBW70gXi/cFbfBCQAeUTpT42Qhz7qZCGmid0uKZilJVWYvi7NV8JnPMNhgpWwyVz9
	 mj0kDPuQXAgUEL3/aT44elwy6BTQ03boxRyn3KCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D082F801F7;
	Sun, 26 Apr 2020 14:05:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C14F802A2; Sun, 26 Apr 2020 14:04:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 540A5F801EB
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 14:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540A5F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="elO4ES6Z"
Received: by mail-wm1-x343.google.com with SMTP id z6so17101275wml.2
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4BM4DNbysaClY0EV6xOgF2ovMVU3sJ0+ScvdfNi5NQ=;
 b=elO4ES6Zl1mm+m0hwviU6BmYb4hh+LOJNukPomLbcf7SS8SnTpLR7xGis+AHOwg1DT
 Wu0dzhT4g8+dSXBWjRPGm2FdYDu2KBxP5zevMclI8pAm+yWijzazLxVeXn/wcYIdc6j3
 nos2w6/74APgGBKOQVr1VdTqGkvGgsmQ6styreKbAIUzLomtg3hQleOfPSKegNlRXntS
 khjVPQAxuMSoSuvbDb/Xd7WO4dH2kdJws/h0BavW7efiAafndGqzthgfuWcAm+LqxvrR
 P/AOoIHdyY9OyMy3QcglfHD206KV0ir90VVAithplg7gGPDXO0yogXrHbho1JGDMZkJQ
 J+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4BM4DNbysaClY0EV6xOgF2ovMVU3sJ0+ScvdfNi5NQ=;
 b=Bl6+ih1I5Pvr3b1KdaxhoA9mlfikdplFfpsZdttpxTQZhvFXoT1WkfnEMAHQVONVBB
 RJ5a5axEJgSk8j8drCyxo2kVWKpRFRtda/HAmpnIVVOEZA6GIg9HFfU1WLb9oBuQKaFV
 10GtrKQ8jj3800fMzVwg5EP2xfkhf2pnfnXnRv5IZwj0k+3pe6aUhaGVrRELhNwsMDJZ
 pO+/Udhvm5IaZivtj/YqXH4NRsXet5T84osPElDxZozYG6HMvv4uStrixPuvMt5TujJt
 Udrosi+XiGk4al042oTbLzyTUqtSs55hl55x526UcyZCRp71rjb4XWNyArA7OFdxsbMC
 af7w==
X-Gm-Message-State: AGi0PuYgzAI93lRr38HFsPhnde3EmRMS0OxhVXWS9sq1NxSUK3o9ouyb
 gik5TKHV16doo0mfIq8PNHQ=
X-Google-Smtp-Source: APiQypJw86c/sNx95DXV8lKs4/fEZfGFlBuG6VgZQUEpXj3ZPhbvaLaZ89ziUvHrSB/ed3WVWYGD0A==
X-Received: by 2002:a1c:b684:: with SMTP id
 g126mr19832432wmf.163.1587902690012; 
 Sun, 26 Apr 2020 05:04:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 s24sm11120026wmj.28.2020.04.26.05.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 05:04:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/7] arm64: dts: allwinner: a64: Add DAI node for HDMI
Date: Sun, 26 Apr 2020 14:04:38 +0200
Message-Id: <20200426120442.11560-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426120442.11560-1-peron.clem@gmail.com>
References: <20200426120442.11560-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Marcus Cooper <codekipper@gmail.com>

Add the new DAI block for I2S2 which is used for HDMI audio.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 8d10fe6d06b6..e56e1e3d4b73 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -863,6 +863,20 @@
 			status = "disabled";
 		};
 
+		i2s2: i2s@1c22800 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun50i-a64-i2s",
+				     "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
+			clock-names = "apb", "mod";
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "tx";
+			dmas = <&dma 27>;
+			status = "disabled";
+		};
+
 		dai: dai@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-codec-i2s";
-- 
2.20.1


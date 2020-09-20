Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFF2716F8
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B6D416AB;
	Sun, 20 Sep 2020 20:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B6D416AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625695;
	bh=boSYUpAFaV1HcTVn+7H652mrbdplQWGEROHV+TLKk8U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XX03/6ZG8cc3ppOCY1cLoT8fqM3CLYyZd6P8SZajx3rmLxvz9YkjvC/vTo+kg1Qxa
	 c5538cNOT4mGE6cyvxdw8O1FYFC0TEKZIcXC7f3qm4sU1pK/SIsTNw4WnZ5mCgrKSW
	 om3aoGmPRMY2TE5RQtR9ZoQdg7wfxZhiU8utaaXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9DBDF80317;
	Sun, 20 Sep 2020 20:08:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29E33F802E9; Sun, 20 Sep 2020 20:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CBA2F802C4
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBA2F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UA/bNOBv"
Received: by mail-wm1-x344.google.com with SMTP id q9so9973902wmj.2
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enpKzUiBmoSBJ4eITLO8PaawwyRhwbwKqDOCyrD6nZM=;
 b=UA/bNOBvqES4EMfHn2jBa9EyeU0LlGxVDZSMK5WGe8KvOZHQ9K5OsXk2ZMtz4JROMQ
 DLiSNh8tjROvD/XOTJSfJsywKG0IYVV8mgL24nwPT25AUpXiQO9KMv8wDuArzm5Wz0Wi
 aZWiLuI0Gz0KTdsNfRx7FQEN0mqdlX5mb5njBgYKsYihfcUNbYp2Dz6zCSwJ0crY0z0o
 Evq5G9IuAIZWTqiBApruFWOdgAgDW/AzaSfvqOsxGcle/jQX3q8mij/VlHU8NEwAVhrO
 bY7hnW2XpgZKQNne6H8APjP+xKgVdd2cEdcgjvZjyB5Xdv5cjKY+HjX4RZ7fX5LSWrS9
 SvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enpKzUiBmoSBJ4eITLO8PaawwyRhwbwKqDOCyrD6nZM=;
 b=fzsXFNaEiiH0goEW6hA8EWJLSmWOwhXWba+GWbK/AVcokyrpWZ1yduO7pc/0S+9CkY
 +Au8AZ4J92/OdNnZlSilrKBZcldfbkuHbHPB4PWQD6tlQBpxf2qz3KusUyoph3ZeaCYm
 xs/D92SrawLUTos70qON4IRHWZrohUQHThuDiWBhjug6Q8xmryYC43REvKwwvpL6QagM
 k3lXiOBy2iYXCwjUmtp3IB6ljFJan3PdczZiySS6TBz+YvBQefgGf+gOz0Hi5+s1Fup+
 cBYd8IGVWriX8QugVNRCEkg5A1iz4Ga0sSxuKRDpmGqclaWYEGXNpdlxhT1BxhbUx2In
 9Hew==
X-Gm-Message-State: AOAM533Rff0JVdA6KxXtmREzFgD6/s7DTamgh4x0McwvXXBc+ql63ZiU
 leAgsoMfHAl0APVbeDJPKhc=
X-Google-Smtp-Source: ABdhPJwBZG9fnJ/nzYth4dqCC9qkwA/eO62i803OIxJpJjI7Roty7Cf7p6PqCCuvyBuyGUi/lpTkRg==
X-Received: by 2002:a1c:6145:: with SMTP id v66mr27212181wmb.171.1600625300928; 
 Sun, 20 Sep 2020 11:08:20 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 09/19] arm: dts: sunxi: h3/h5: Add DAI node for HDMI
Date: Sun, 20 Sep 2020 20:07:48 +0200
Message-Id: <20200920180758.592217-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
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
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 22d533d18992..3dca6d89cab9 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -662,6 +662,19 @@ i2s1: i2s@1c22400 {
 			status = "disabled";
 		};
 
+		i2s2: i2s@1c22800 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
+			clock-names = "apb", "mod";
+			dmas = <&dma 27>, <&dma 27>;
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-codec";
-- 
2.25.1


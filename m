Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9A727212F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C02BB16FE;
	Mon, 21 Sep 2020 12:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C02BB16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684381;
	bh=YkAZHIqttnR+8m+uZlRMYJVNyrEfuMy5SJ3/4qbG9ok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRePIn7HT89pt5RAGRAgbeuLeif7FOQCbHdD0jsK4YZWrepeYVhbSS4urleUd9jLq
	 qAzIC/9Ng5gD+KGgqnElz/8ek5BgG13iBkWXVUk3AkvhK5h6/jx7WUYoA/mcahT90z
	 Y21w16QOsJQk8EXNftjdMLdAB72Jqyl/aMys9wRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0400CF802E7;
	Mon, 21 Sep 2020 12:28:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2043BF80304; Mon, 21 Sep 2020 12:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 396B0F802DB
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 396B0F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IHedG0vW"
Received: by mail-wr1-x441.google.com with SMTP id e16so12166816wrm.2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUVIxl5BYolVip4ZPyodUNNPga8sBfd676yD0NuAt4Y=;
 b=IHedG0vW9UU+XQPNRqvk7Cb6wMYdd1thMl9pgjksErL76FaiLiwWghXnrWTf2PFPvF
 RIEodkMANh7i2aEWiNi5Xtz/+SsDEgtM9I6QLVvbFy3+qwSPnsVXwq05NmsI/e8Aoqfp
 hzLbxFNQMpW5arNozbwAC5i7ciwAsMJnngQfwWed/lDJZHru8N81RRhS5BbLzsHTgKCL
 xGxdDvmXt/FOlCdDy1gxhs3sHwvorAiIJk5JFRb+zTzDvsHEMHE2BvgewxiQR1wQnl3E
 i3IUPK49t6YPngxCUZwfr82Xv2FwkpArekDImtJURFqh4pw1a+bKmN4OEc1yTh5NsUpN
 D9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUVIxl5BYolVip4ZPyodUNNPga8sBfd676yD0NuAt4Y=;
 b=tSQrkCCKv5pBmiecSktKCOEApuqGPkEndVxCNuo0t3aeC57LAkQw4NJo1fi3Opt/0C
 nL21Dk9JUodVqv9LiQUwA1du/YxpONwqRvQ1LqMFVw07ujlo6gA01f3nVPebhlV/cy1l
 cmciB3QrlBo4DMBJRQISXeiLWyYoMiB+LFeJ4O5VEzgQjn8irk66z7izPeS9Tat/DKUY
 uHgVE4BRHPZQcFSPeFIKk9uAci7fdHHRBX0KNR4eSgXIid9Xc0bL/2fbNFyNZsKY/6Lr
 YgMt/n5HK6YX1buAIVRH0k7aEG+AD2a64ZE4X9wHhJm66DSd8Hmrk9S7bATqeXDgfhDU
 /Fog==
X-Gm-Message-State: AOAM531a8pV0vnmaEPh7Fd067tpNqYvv+1XUsiwwgodpjJ4SS6gOK90J
 c+nwXiOCwnZyJOVHu3KGOVM=
X-Google-Smtp-Source: ABdhPJywGur0//dGuTvYT+x0vHWsW6qDoeNQvEl5jqNVb8ymdsdvTJ8F0ELiftzQUySC5ZdJY9VZdQ==
X-Received: by 2002:adf:f011:: with SMTP id j17mr30143476wro.276.1600684071510; 
 Mon, 21 Sep 2020 03:27:51 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 13/22] arm64: dts: allwinner: a64: Add DAI node for HDMI
Date: Mon, 21 Sep 2020 12:27:22 +0200
Message-Id: <20200921102731.747736-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index dc238814013c..51cc30e84e26 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -846,6 +846,20 @@ i2s1: i2s@1c22400 {
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
+			dma-names = "rx", "tx";
+			dmas = <&dma 27>, <&dma 27>;
+			status = "disabled";
+		};
+
 		dai: dai@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-codec-i2s";
-- 
2.25.1


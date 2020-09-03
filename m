Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3612025CB1C
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE6FA1A9E;
	Thu,  3 Sep 2020 22:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE6FA1A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165501;
	bh=87h8of5G348yr/RBRUub90d1/M1X4wvG2ujoVUj0FZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdDpBekZYhMYbo91ilk36cbtWLYu4TJEM4B9fP8UHAPPNFPcjwR3SzWgNhw2ehluv
	 i1MQGfKO7Ns0Fx0po+uAYit784/FN8HaXxNxfNbqGU03du7i+ZtM+TeWakwv2PxvEt
	 F3v0Vm9vgCzEfDjCMY4iZjmO5DXyc4Kpz+GJMTb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CC8CF80342;
	Thu,  3 Sep 2020 22:31:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A96CF8033E; Thu,  3 Sep 2020 22:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D2AFF802FD
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D2AFF802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mNB7LFuL"
Received: by mail-wr1-x441.google.com with SMTP id z4so4589833wrr.4
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQf32lRefYlvWpNqVHDN0Q4olqQ7nkdPDH05d5Mwk20=;
 b=mNB7LFuLunsa59ryEWxxPyempqYxfpwPFhvUy2WMjgyrvy+hAVWipxmu70QL6d0l5L
 5U0RC71ib7EWr2tCGMvXAL73SjOOJgsvX7ZwiKaPtXmgmS/AT/8bZr5OyFVX5jlzpANp
 v6GbgeFbYfMDLT2RYz4PSMIcx9l8spVWX8QWgvKXF77emPd+rjdvAIXpeQIojnuFlnQF
 T8w3IJow0iwOPLTa8vhnvuodhrZyfAVtcrb/hdW3MrX7nS6AuUuGp4+GSnyv4fxBDxHe
 8FKou8Pjy7PLpNCJ7OPPbBdLjvBC4xWGXgX4S4CprZdrYF2vQWVo2DWKd8ViHemZIINr
 JGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQf32lRefYlvWpNqVHDN0Q4olqQ7nkdPDH05d5Mwk20=;
 b=WEgTu5+kbKMUCLPG1IMBdqtgEJQjU0aX4OiiJOkYxR7ftFfOvMajhL5PpJEU1gDyZN
 AsA0A6kgQTxYwL3oteeDMoR5MYVKYFE6sT5HD33QOMJ8OMVF34rWVueUtN5Gv5aJdGhU
 mVrJd7H4MuIlon5AXFnc0x2CCj0VOi3zRq9VonpXh95hFCCDqS2vqoNFCvKnJ7wkLqMv
 bTCUyNhmY1Zu1+IURkhOyPClPVTvuXuQr76Qmqh5bfOw9YkwQwsK/gD4tqIq8OGayYcn
 xKQR9bgde7cPMxbfXgoAaNw6KYz6zygHbHqhvLzKVxIAhRtY7Y/wxNcvo7ptrIOQOAM9
 qKYQ==
X-Gm-Message-State: AOAM532oF4LGBQtLqz/YRwESK4x8Jw39WewsuKcqbR6/v7/4YvLFt8F2
 P555CEsedau++U1gIOLR7bs=
X-Google-Smtp-Source: ABdhPJwV/D5vEOt7HiGayfYHGwvmD+WzmO5fqpG1aehEipiDZFdrGd3VaUCsTXMp0iDFlDyazWYq2Q==
X-Received: by 2002:adf:dd0b:: with SMTP id a11mr4159015wrm.422.1599165057172; 
 Thu, 03 Sep 2020 13:30:57 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 12/20] arm64: dts: allwinner: a64: Add DAI node for HDMI
Date: Thu,  3 Sep 2020 22:30:26 +0200
Message-Id: <20200903203034.1057334-13-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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
index 8dfbcd144072..bcf808459edf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -845,6 +845,20 @@ i2s1: i2s@1c22400 {
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4631B8FC1
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 14:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1452F1688;
	Sun, 26 Apr 2020 14:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1452F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587903042;
	bh=PL8OgatR7vHUNglCaokb2tlFs3jeb+sdHty3GGkW6uo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hH3AqIQE3k3Qm8KWZR74R+d7vifDZg6hUNHC4b5/8ylZkXRnLluKPzaapMaGGEJJu
	 IENHZOk+3bayuNzYjVMbfEwO4ySdGvHcVB4eCHQxQaTWzgb5Y66lrvZACzxXiFNeDr
	 ZsWOk0rsIDbkbHUhOH2bPxy9leaLufewObT2Oubc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 329B0F802E0;
	Sun, 26 Apr 2020 14:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01CEAF802A2; Sun, 26 Apr 2020 14:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA017F801F7
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 14:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA017F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tkoO+MHU"
Received: by mail-wm1-x341.google.com with SMTP id x4so16373426wmj.1
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hIU92tFnbM5F4GsZxfyBvjNoAK6MdY4fHHnGiOLjInY=;
 b=tkoO+MHUDgKE2W2y6Vwh3dRnEyCcyLv/zkEQrzs/FwHfhTpbHQP0iKeYrQ4wMLckWT
 JIEXVvi/NI/sgohW4tyaa6rGnX6l2ql+TBtATuktrJ/V71CFJ8APzipcoiIvkGsYkXQ/
 Hqd2YinT9n9VLspN83dS59ix5n/DfUBVV4RmpHwraP6FdMbIq+5Aml8akBG0FS1TP1S7
 X1c9ajGo2PJ3YIlvcSHTZeibGqacs2RJxOfauMjT8ZDE8x6u0qQFXyOpYG1SWMeXJFJY
 DlDL2IUFqZTzzSVeyw9gnRFo3GncRtxzjc+9+d1GuZWY47xt+VR5fIovX93az8Q68AgG
 sLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hIU92tFnbM5F4GsZxfyBvjNoAK6MdY4fHHnGiOLjInY=;
 b=U9jywjAc5/We/8eAooAYrqkcglwIsCZM7XCoYWRd2O9a68UDM8qOnH/0m1w0wy1kN0
 FY2UoaeLbMRMfKuM2vVOh3K1OsrxLOcbXxO/pzeTFYKbkFPEpcem16vWyeSRntMvLuRz
 YYOhj0gmqdJEpuSSzloDuylnTHq1uhlHtiSMPIiJ7kxN9qpkiLhvefS5e8SH1J1o+eGB
 LCQ2gkjLlI+EKq4ZaobJXYL3LfHjigAaboPATa4GahAYBYm6fyQKjQ3QuYREU4cr5GGb
 Z+3xCx5ylBxHuDh92vzjupOQVpd+IPsJFHJJjaJJwz+g08O4JQDQb+6zFra05xyzWs0w
 vBHA==
X-Gm-Message-State: AGi0Pub/nyjh4l7qSdvhhVjjH14h2+8b2obKoviy49xGvX4FTjqa6XL+
 6S66NPXvN4hCCj5WtHG7zkc=
X-Google-Smtp-Source: APiQypJQivLKtZXp/OmZXZ5Izse0wCnqEyHEKmH7wBdtOiTI+IQ0H8Prs5Pn5dUr68966e52DjPNlw==
X-Received: by 2002:a1c:4989:: with SMTP id
 w131mr21647354wma.137.1587902691211; 
 Sun, 26 Apr 2020 05:04:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 s24sm11120026wmj.28.2020.04.26.05.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 05:04:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/7] arm64: dts: allwinner: a64: Add HDMI audio
Date: Sun, 26 Apr 2020 14:04:39 +0200
Message-Id: <20200426120442.11560-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426120442.11560-1-peron.clem@gmail.com>
References: <20200426120442.11560-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 Marcus Cooper <codekipper@gmail.com>,
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

Add a simple-soundcard to link audio between HDMI and I2S.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index e56e1e3d4b73..08ab6b5e72a5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -102,6 +102,25 @@
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "allwinner,hdmi";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,frame-inversion;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s2>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+	};
+
 	osc24M: osc24M_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -874,6 +893,7 @@
 			resets = <&ccu RST_BUS_I2S2>;
 			dma-names = "tx";
 			dmas = <&dma 27>;
+			allwinner,playback-channels = <8>;
 			status = "disabled";
 		};
 
@@ -1171,6 +1191,7 @@
 		};
 
 		hdmi: hdmi@1ee0000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.20.1


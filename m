Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF02716FE
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 161EE1699;
	Sun, 20 Sep 2020 20:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 161EE1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625793;
	bh=NdGyoRYkKZvP01+kEb44ZuymONqz4VyR72Pt7Pzwt3k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmEMKFEqsLgAm78vi3hqSw7mVyGWRCSHonJ0J1Z/y9MLKCKZbmUMuXZl8Z3l1adeJ
	 8Nw0nHF09jG71Py6x5rVQRXr3PAlbX58RAvnHKsEyDYf4JeIbOM3ss6YL7WJmOnjhX
	 ORKK/UdhOvDX/dfu1odw+8gNO3daysZszmJ7z6DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DD29F80338;
	Sun, 20 Sep 2020 20:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDDEDF802E8; Sun, 20 Sep 2020 20:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D81D8F8010F
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D81D8F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vEmyQvKj"
Received: by mail-wr1-x441.google.com with SMTP id x14so10432859wrl.12
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sjb20+qzG//QXYZPPH3YllTlMZ4wlxmmKse+Y7AgH+E=;
 b=vEmyQvKjJaAXDUj/rxXMX+vHTZTCdfErxj7V33up2yN3JYLREihy4L0FtbdAhmEWcR
 8uYuEP9RBDhpgapbDdfN5EN3XgdkQYbBaOfNWQEUGikrm6ZCLPWK64NNns9dIPSkqVQG
 Xug3VF8VJuaXq5bu9nUlrxA/QhMKroVfaSXEcgnV2adO9YBZNTLL8x01WobILe8ILY61
 zIVm9JjGvuKNMenYaM89i0uoljF4nQIMh3V0hvYqWWmnBpXy2dWf7NmN5tbwmOjFFb39
 7dCSU7Q3up1ddGj3WiXufn4qrLY2o0gSP45MyiJdQNf9j/RmK6vElRjUOjlALkFRmevV
 B+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sjb20+qzG//QXYZPPH3YllTlMZ4wlxmmKse+Y7AgH+E=;
 b=H2PmD8XsdybL6RpVPoVzpvhC6im3G1D8dqMPeFIyh1f3dSkGkfy43Spk58Km2PkOns
 AZ2q8CyM+8isF1sbc9KOx2rVw4W0nGR3+rvTZ9lI6k2jevc7APKqlLm8yMOrpwZvOdr1
 +sZHxX93V2M9ovdTpYRROHrcW6Yk3mW2WA1FcQ3xCaWqPbBvu4PAbadF9Ouy6PNk20uN
 Oc51ngQcLYvmL0tkZrc2Po0+lT8bYQZmNhNH49kWgQ0lxfmfJUkSY+rOaMHeF20gUHA1
 zf7nnJiW7Ha+ZlA7I4YtmNoHF1B8zNxpz27ciemKSSvl/w6RlL/ilA+5dCX666ODm3Ho
 RKWg==
X-Gm-Message-State: AOAM533JmeT+17aGUCbyDu4gxoV8sQio3PyutQA6ScQgUUz0YpMbJnn5
 5GJkWwIqOZSgGNNJOWXo0II=
X-Google-Smtp-Source: ABdhPJwQLbwAbHuOnHksf+G9cX2MKV6L1THeLclz2qL1+zagG0AMM4cwPSaCppbAgaXKAR/xUNJ1jg==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr46523685wrm.136.1600625302166; 
 Sun, 20 Sep 2020 11:08:22 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 10/19] arm: dts: sunxi: h3/h5: Add HDMI audio
Date: Sun, 20 Sep 2020 20:07:49 +0200
Message-Id: <20200920180758.592217-11-peron.clem@gmail.com>
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

Add a simple-soundcard to link audio between HDMI and I2S.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 3dca6d89cab9..7168e9412410 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -105,6 +105,25 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "sun8i-h3-hdmi";
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
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -806,6 +825,7 @@ csi: camera@1cb0000 {
 		};
 
 		hdmi: hdmi@1ee0000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.25.1


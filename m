Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC827A2CB
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 198D41930;
	Sun, 27 Sep 2020 21:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 198D41930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235274;
	bh=rm4WkJekPu/v4PudpiRV9e0i9QeJ9EUVLvWeDy27Qh0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ai6LQQwe7jM0dCQ8vZwfs7ZdpLhJQREbYkJ74wSxvi+HIn7Zsoczz/D+DnVOjPSfj
	 EkHsyiJbUtdIzPu+nyuXQ7+drzup0VbFM8GRe2C4uYHZsLx7jIUXQfj3AEUt1Gjab5
	 reIAkfd015o0S4CdTnQgm5hvaXt2b9BMul9oGIUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC00F8022D;
	Sun, 27 Sep 2020 21:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11659F802E0; Sun, 27 Sep 2020 21:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F184F80292
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F184F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hYYtdT5J"
Received: by mail-wr1-x443.google.com with SMTP id m6so9588375wrn.0
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3W8D6ez0E1EN9kunjStsHDeyLV2So0bhgmjFnVu+y0o=;
 b=hYYtdT5J2lbYtw1h3CNjAzek2lH+LzJZdHVECbEvdTU/jLRW1oXuAcVlyA6z/Irotx
 kTZYef2GiX4xFbLOEoY68jUAsnlYyfybzCVmPVvjjDe9sU+NBQbH3BOJEQ2iyyjKwmZz
 XqA0syBhyivdtEC0L0MsNGIOojTDvboRPwon6/BuRRzKkfO0+AhaRjQBavKrMZz4Ccqv
 hSbB9A1D75lTZ/tXtw1LzOMs4bZo0PDdSYvbKNUM8f5HJSvMt9lDQZXaT4ICCHHfFCfi
 5MEinIW2essWfKAZFGgWWnRupJ/qb841ZTUqAiRIaUeNCoqYZAbZE/7p6YT0/NWgt++f
 cnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3W8D6ez0E1EN9kunjStsHDeyLV2So0bhgmjFnVu+y0o=;
 b=eZz5zuoesIJO1D+5ya/m6VXKOwwjeux/sIzuSJXMfcp60/JXRz4QTWafm6zJmCX3q1
 Q0QXKHz1plSQUY/ptCiZuXAlBqz/W6zxFX8qIBQa76BOONNecXocYhtTmVQW9nehxwHm
 he+ldOie5xhrXU4LtsRURTwNPiNuO3iiPt3G2lupRqGkp4M456F1Ba8wWVxS3RCVCSY6
 EF/5D45vjf76oiAHsuOewpRma+Ox/QUcCWOkSUEJnC3y8TKszrGdz0Ua2RzJtGJOBhDy
 0b4H+AzAq48o5z9/vsPCCr2cw2To9Y5B+UF6bDFiusSCLI/OPsQTAfQTj/8SI5ufF/KC
 QadA==
X-Gm-Message-State: AOAM533RErN68mgT2OLUjhiVxoiLWsNOL38yObL5p6vaYPNuVukPnI3r
 uxsY50APH8m5zxiQAXz6pR8=
X-Google-Smtp-Source: ABdhPJxdMPb3y8OLx5/uCv7BmgNFZaa3m3cSLR5JV5R5qBm9oAw2aUmQrVEJFSUhiTLVyvr2EGEGWQ==
X-Received: by 2002:adf:aadb:: with SMTP id i27mr15006207wrc.258.1601234968172; 
 Sun, 27 Sep 2020 12:29:28 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:27 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 09/20] arm64: dts: allwinner: h6: Add DAI node and
 soundcard for HDMI
Date: Sun, 27 Sep 2020 21:29:01 +0200
Message-Id: <20200927192912.46323-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

Add the I2S node used by the HDMI and a simple-soundcard to
link audio between HDMI and I2S.

Note that the HDMI codec requires an inverted frame clock and
a fixed I2S width. As there is no such option for I2S we use
TDM property of the simple-soundcard to do that.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 28c77d6872f6..a8853ee7885a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -67,6 +67,25 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "sun50i-h6-hdmi";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,frame-inversion;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+	};
+
 	osc24M: osc24M_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -609,6 +628,19 @@ mdio: mdio {
 			};
 		};
 
+		i2s1: i2s@5091000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun50i-h6-i2s";
+			reg = <0x05091000 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S1>;
+			clock-names = "apb", "mod";
+			dmas = <&dma 4>, <&dma 4>;
+			resets = <&ccu RST_BUS_I2S1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		spdif: spdif@5093000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-spdif";
@@ -739,6 +771,7 @@ ohci3: usb@5311400 {
 		};
 
 		hdmi: hdmi@6000000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-dw-hdmi";
 			reg = <0x06000000 0x10000>;
 			reg-io-width = <1>;
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED767739A8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C049B851;
	Tue,  8 Aug 2023 12:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C049B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491117;
	bh=pAXgC7Nll/1yEWipy/eZZlMIyyKvenDBBKMACXoT6hY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qWOQYKqgnq9dae/K1HYu7xre31IXv+yFDfTAH+Ai06/solezYRA5z3Ub14TZVYyzB
	 S9L+PgDs1wdSxXRG8VHklF7JOe3LXsPG8K/wb94bYYDZyfs5cbBnb7ztfu02836bNP
	 DyqBAN0emv1p6/IIzC198RkWEgwGMYjMOBY17HpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FCE4F805D4; Tue,  8 Aug 2023 12:35:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B759FF805D5;
	Tue,  8 Aug 2023 12:35:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CD58F8025A; Sat,  5 Aug 2023 20:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C39F6F801D5
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 20:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C39F6F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=qYKcS/LR
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31765792c7cso2770102f8f.0
        for <alsa-devel@alsa-project.org>;
 Sat, 05 Aug 2023 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258757; x=1691863557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjaA2yNdWRxoAIXKsMRIdPQiU+5JdGf4g+hfiGSEvXE=;
        b=qYKcS/LRkaOGXq4NdDRZzuiufmfi/JdXCUCdjxwvNlMaybZDSX+xGMyEpQTIV9OZnZ
         Gp4GB7jEPbcH9CWDW84PAFwbO0TClcrL1aQj9C8N3+bq0nxcYCPolbMCJ0eeZvdBV9ay
         ZAxs/9qDf+W5rvv6Y9l+xHmmsRaC5BJEAfFMJSpt0sHRKes7er/87raNN1FouMnr0lNA
         iYYMr5A7x6LN4+vL4w4rTM6AwN9sc0kyUnxH5uI4v5kMrNw/MNjSdGEhaL4kvXojMj65
         CznA+lUQm1lfKGBNQPnmKeQYtKKcVEGKXUzGXIRDiviT6mXGGyTe0umYKJHf2Up2LKYA
         oYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258757; x=1691863557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjaA2yNdWRxoAIXKsMRIdPQiU+5JdGf4g+hfiGSEvXE=;
        b=WNz16SCe5iD5RJ9DJeq6Zp3RrgJVJk9qGkEc3uk6esdESzHmZalpJ4CLGtQ1O8G1sn
         YzZrr+9X8iR+P4BqsPbnpITxs4pWqe4QPHwSN6LG9lXBdJGOHarCkIHDbWrvfx0MHtBh
         ss8AT7Lq3u2BoN4AgPET2psmJD+7rvG/VWdmIgrSsUYWvvwa/wXTY0GByINrIayOyPpE
         z5+WMKSQ6CQml1P15H0SPraUUxGSpX0OXerWPHUkUPNMOPAio3sIS5WisoJnzBGcZtQy
         ISW+pFRWKR+9t6vgKq9hhtO6MLaOq2S71EnG9yKeZm4eFrIfgr+ihGHfVgs9Sji8wUt3
         2fVA==
X-Gm-Message-State: AOJu0Yx+nHM/zf/donqqtHukgFeqtEkKLZ04P0MowP4E6fxRq56S0lP7
	FuvUgLaqyxFJ1poY91mWqQQ=
X-Google-Smtp-Source: 
 AGHT+IHH4WVwBu7aihjp9nuzFtSfjcWnZEsanbwbY8snGr0wZKCSwwwsVErXaYwxTLHpE9k4p+t7Qg==
X-Received: by 2002:a5d:4447:0:b0:317:3d36:b2cd with SMTP id
 x7-20020a5d4447000000b003173d36b2cdmr3214277wrr.71.1691258756721;
        Sat, 05 Aug 2023 11:05:56 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:56 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 5/5] riscv: dts: allwinner: d1: Add device nodes for
 internal audio codec
Date: Sat,  5 Aug 2023 21:05:05 +0300
Message-Id: <20230805180506.718364-6-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bigunclemax@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D5S2NUQCLLHUPFUHO2VXLJSCQZC3XARH
X-Message-ID-Hash: D5S2NUQCLLHUPFUHO2VXLJSCQZC3XARH
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:35:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5S2NUQCLLHUPFUHO2VXLJSCQZC3XARH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add DT nodes for the internal D1/T113s audio codec and its analog part.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 1c48bfff1715..6ceb141c3f93 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -180,6 +180,28 @@ ths: thermal-sensor@2009400 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		codec: codec@2030000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun20i-d1-codec";
+			reg = <0x02030000 0x300>;
+			interrupts = <SOC_PERIPHERAL_IRQ(25) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_AUDIO>,
+				 <&ccu CLK_AUDIO_ADC>,
+				 <&ccu CLK_AUDIO_DAC>;
+			clock-names = "apb", "adc", "dac";
+			resets = <&ccu RST_BUS_AUDIO>;
+			dmas = <&dma 7>, <&dma 7>;
+			dma-names = "rx", "tx";
+			allwinner,codec-analog-controls = <&codec_analog>;
+			status = "disabled";
+		};
+
+		codec_analog: codec-analog@2030300 {
+			compatible = "allwinner,sun20i-d1-codec-analog";
+			reg = <0x02030300 0xd00>;
+			status = "disabled";
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.39.2


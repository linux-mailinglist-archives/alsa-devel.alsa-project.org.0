Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5E272151
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:38:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A23DB16E9;
	Mon, 21 Sep 2020 12:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A23DB16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684699;
	bh=boSYUpAFaV1HcTVn+7H652mrbdplQWGEROHV+TLKk8U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UPqEnsHS7yPVDq9Nu5vFaYSsvNKVKETP5D7jfem0WepoYl/iHrcYa6WnotFAlYfER
	 K6zF8k5iz7WlIs9av1RhapDGnJ6vS1saugSIqc0B7q/wfhAIrPDFZbT8PAFvSGCVFC
	 qQ/DWVKys4XHaqiwiBeATpQ8ANvu3DKBOHnQMQ1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63E1BF80360;
	Mon, 21 Sep 2020 12:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B16ACF8031A; Mon, 21 Sep 2020 12:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AD54F802E3
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD54F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cjoOunCb"
Received: by mail-wm1-x342.google.com with SMTP id s13so11572085wmh.4
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enpKzUiBmoSBJ4eITLO8PaawwyRhwbwKqDOCyrD6nZM=;
 b=cjoOunCbxfCsZrnr8q13EjVFjpa8QPlF72/+TVBQ41JAsi3GulSL2W8KOiUjbGMUEt
 kHK3ESOm6IgP4rx7O7GhZ1hsZ4sZeV1s3Xd1pzyxP3DkEm9p9kbmS1gQEpo5fAnszG5X
 bfpKmzlo++rpwdGNnBTG9npDJ91gqPl2OD3v3oY8MfF7XmK+NdSbHCl9VaOFOjOkohAD
 ZnRVdJYQvhU1yyn6n16C56lWyKCUQXlaA7k7sweLlg07r3hKss6EV7ykeFfYoYdrpvkL
 KbGzv2iJp3IgTj1nCuQ6lYyD+Bio42VQFGS2fpdjOSyreHEY6W/lfn54ou03pfneQew9
 JtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enpKzUiBmoSBJ4eITLO8PaawwyRhwbwKqDOCyrD6nZM=;
 b=LZJwQlnveKSsxk7VZfe/eVGwgmONaY4/yd+rMd80oqtfr4JGJNTLgKFkMWkZkvjYy0
 4S8AX4sn3wGWp0j5e6Ic2rG25bcxCkkos4kYRXEcmZgC7zf2sKt5A/Gnk/M4swx4e7dc
 CgcpyNqBu2fX3+ch/DFezDdSk1trAxJg3lTWyodOqplSzTQlCUpveHIK/1ooor54Rw1S
 CuHdjYY+cXdMFBfI4K3gD35kYHToVAYL1h3xhdtYlIGSv5TIgjlZfL9OReF0TwMiNAFf
 nSJhSQesydOIj3LiB86Ic/ccKgpniOjVT3foyYm0yajCWiHEEIkthPLcuFaiYHupyNth
 oWfw==
X-Gm-Message-State: AOAM531LQJtbqc3ivtGPXbl5H0PvNz1+FvRSdTm0GPcpfDPUDRQTHmdo
 oXxz5bYpQXD21V72SdwS+QY=
X-Google-Smtp-Source: ABdhPJx2PSrk+As/ort/HK8PkUGoNOih3A4NMpX+w71lYU7pO8aA7piuuwkjxsnL7bkwa/d6nopflQ==
X-Received: by 2002:a7b:c345:: with SMTP id l5mr8081528wmj.123.1600684069140; 
 Mon, 21 Sep 2020 03:27:49 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 11/22] arm: dts: sunxi: h3/h5: Add DAI node for HDMI
Date: Mon, 21 Sep 2020 12:27:20 +0200
Message-Id: <20200921102731.747736-12-peron.clem@gmail.com>
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


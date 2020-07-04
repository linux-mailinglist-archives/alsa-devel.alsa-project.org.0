Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A537214599
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE7016AC;
	Sat,  4 Jul 2020 13:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE7016AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863103;
	bh=uhrG0eMECHl7mT4uCDC4omonH71vj5Jt38w89dyZJfY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OWSILmC3vvQFBkYQkSExBdlH7LQR0ZQbgw21PV6wNRlLuxFl04RlQKV/kj7nkonSf
	 i3nvne8NT1aM/wMfseDhJ4xX4ho11AngMeuB+Xsh2xlJ0bbDGosCfsGI9FbRzLy/vf
	 uXbaswI72i2+l3HgkWD7FGR9eg4OCP6RiathvUps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A5F8F80305;
	Sat,  4 Jul 2020 13:39:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5822AF802E8; Sat,  4 Jul 2020 13:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30DADF802E1
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30DADF802E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QLybyCd2"
Received: by mail-wr1-x443.google.com with SMTP id b6so35412607wrs.11
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l//kuzEonZP/MtSIPdl0oofvGh1vlE+vGu7lmwtYnss=;
 b=QLybyCd2a2kCXvm7nPchhmYIaButiS71TXF/yDP130cpemzym8xlOUV/3Qa+2FuPNj
 v+F0EidhgPddugmzL+i9L11c3P51SRSzQqLVB51jpMaX2JgnXrtvbJEITzIU9i0tb9x5
 uaCMVDOkM26Ve+gVdqPGeC9ywDnwoqMvv9jHvUvM4/u82K9g4zfnAfUzZ0H9RHAlIyCO
 /H+Y9vAE+RHfSttq+yAuIndsCLAWdoqpYLmxeGxaxeJ4qBOEl26y3BLA6bOpaFRiyBdr
 YYXECplBSawVpVylmhmNQbgp27K27qxrVyU+jejiwloGZAG/stMBlz2IN6FB7hFipEmC
 z7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l//kuzEonZP/MtSIPdl0oofvGh1vlE+vGu7lmwtYnss=;
 b=uJF3nzMi54FAoRebCfeOszSisDb6Fgh3qE/w3Px6/VL89YU8Z+mAzjjUI50ysFNeG8
 QO8kkG3y6IBUYj6DqU6Xevfauy7CEg5NEyys9tlPjEejoWtWo69IZPGgdMmDCcAXJEsc
 Qoff0YRoX+27jMBxAV6KuHLW1z2t39+twlvIM7ULuRF/c+xzlZP7T8gnETHy39QIN8jz
 L8rAVpPjqC+2zKW5+azYawGXUXn3U2lLlbwL4bDxjGG7FB2r+fvwMtgl9LgaWQk4plX8
 U+j4zG8iibEUaoadl+VnbBE2zCEbJNyvFyszd/2UtZUWQu6dnGpDRoQ42muR/II45FYl
 X1Xw==
X-Gm-Message-State: AOAM531ckn5U5LXfaClxs8/BjLHy3+BNbODt3kG2rjJKY48yJwq/tfvI
 ewlYObgQx6Xwa262rmSKEPY=
X-Google-Smtp-Source: ABdhPJzd1H9PD/V5StIT+Pl28p4LlonUtT9WBwwFKz+ltoQc2lgzwioCcRMWJv9/YlS9sd0/nJ3+oQ==
X-Received: by 2002:adf:e684:: with SMTP id r4mr40698341wrm.68.1593862757609; 
 Sat, 04 Jul 2020 04:39:17 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:17 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 10/16] arm: dts: sunxi: h3/h5: Add DAI node for HDMI
Date: Sat,  4 Jul 2020 13:38:56 +0200
Message-Id: <20200704113902.336911-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704113902.336911-1-peron.clem@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
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
index 22d533d18992..9be13378d4df 100644
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
+			dmas = <&dma 27>;
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-codec";
-- 
2.25.1


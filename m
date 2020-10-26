Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11988299651
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:58:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4CC316C1;
	Mon, 26 Oct 2020 19:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4CC316C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738736;
	bh=jByL7wceUKemAIpsigGbzjkZTh11zuZWY1O+VcfPAy4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTgabZ+nO0ke1wSDQsaBac9n3v2UUuv3mA4FAaRoLF9gPU9v6ygmaOPbvI0cr6TWY
	 3dG0t2K7wozcHDVsa3X9BIpuZFl/Dsh0jX7qp4VqHicJoyUDsjPLZHrl7oUGcr0IaF
	 yLl67redCRj/h3xca1vjJyb5Wl9Nr1h5pT9XfHEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB68F80524;
	Mon, 26 Oct 2020 19:53:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D0BF804EB; Mon, 26 Oct 2020 19:53:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA70DF804CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA70DF804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="u92gL6J5"
Received: by mail-wm1-x343.google.com with SMTP id e2so13588237wme.1
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QarSYS8sybXOFMHVXdp4I9fWDCgninS8jZ0IjR0OesA=;
 b=u92gL6J5QB2wSKmArlF123sP8XwwWi+2NKdf4veonS68veeQLO6FOpGw3MyzwrD0T4
 4FgkFebcUrBd40EwOKP0QbEeccHu1cdWWL2jOWXmnvZTdJ3zkUdB0PxoB8ZHjzbsYrzP
 6jJ0UDiqaU6bZlX0dIKlRIjNbN1N63tu76uTKjfcz/rMaz7tVv93lytst3mUoe6f+qh6
 xeNDlgL3z7LFizkwxkw140LGmYuqMPHiW68mlbCBuLq8GZMu0rcf+3LmUhvNLlkA/O/X
 yOn1W1ItYbUuq1AwPFkU3wpkJOdb/d16IXEweZ27LDfiuEaUsz+HwvF+qOLy4OECvEku
 m4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QarSYS8sybXOFMHVXdp4I9fWDCgninS8jZ0IjR0OesA=;
 b=s3xzXz2ezKXJGBgzXCJ3lScpAyYobYN6NFX0Ixuh4eeqgy7LE7mRGVa9R2yunXQmeJ
 9ArvSrJqrjBCLQIwlWBgir5ebOjv2emGXQjNAVYKKSJZ4ABw2PUG+fRlk8z+t+QxBYgR
 g1/EmtDLfn7li21lmIsxWC+pqDhD0Yitb+Ov6W+61Y4HRSpkH8gvic11BQkeoMcf9Zz6
 kiWskxbkKvRwFq4sOy8YrtU9WQW5rN7blFHazFM5s1XR//83VCdOJ/u/eMNOAYbJMb1g
 hABS2RUqohlA8a/VxVNI4YbNJRfz9saUDn/htku9TVYI+4ph1B9C++TZOeRZ+fDJW5HF
 RKkg==
X-Gm-Message-State: AOAM532YASlaDrAi23JJhjMah5eTvEd2QroCZFOsnD9GNZlIgJYCu3S3
 Ouorj1IO7OgtOJWkzQNkk8M=
X-Google-Smtp-Source: ABdhPJxgw5SMQfquJqSrV6lWqN6sjacFWgBT9bI/RfmLwJG2Tyts6s4IQJrbsVWk+LiwpvA8cNv+Tw==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr17326513wmj.52.1603738374351; 
 Mon, 26 Oct 2020 11:52:54 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 10/14] arm64: dts: allwinner: h6: Add I2S1 node
Date: Mon, 26 Oct 2020 19:52:35 +0100
Message-Id: <20201026185239.379417-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026185239.379417-1-peron.clem@gmail.com>
References: <20201026185239.379417-1-peron.clem@gmail.com>
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

Add Allwinner H6 I2S1 node connected to HDMI interface.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 28c77d6872f6..d915aeb13297 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -609,6 +609,19 @@ mdio: mdio {
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
-- 
2.25.1


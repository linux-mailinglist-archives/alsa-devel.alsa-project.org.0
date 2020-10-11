Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753428AA61
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02FF51664;
	Sun, 11 Oct 2020 22:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02FF51664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602448163;
	bh=TlaKVXdkaBmec4tXS1T9gPnftMPH3PL+xEeJCkQRjjE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tPheZ/YSbcNxaNjurkSGSweWELFthnd7lbbZEnJJNUhMVcwclZc+ClwrnzGE8E39v
	 1BLpMzhGQVAaKTPNTQN8KXPPu4+Q2k9FTJemx56jbKDuZCI3wPtuwrZS6YSjv+1bNa
	 5Q++HGRAzdQk+Nr23MlRZxaGfjzAND73pQ6IO14g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C7C3F80306;
	Sun, 11 Oct 2020 22:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C09BF80304; Sun, 11 Oct 2020 22:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F35C5F802F7
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F35C5F802F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Dtd8EF3H"
Received: by mail-qt1-x841.google.com with SMTP id e6so2321329qtw.10
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Id6RP1VS5hXJUMhUzwY34yVBORZ0nCdjPMNOwgBnW8=;
 b=Dtd8EF3HlfRs4MWa79LdCfJPJtUWqor9o0qiwofUy20/ORQGpQR3CoJUFr9p/A7v2z
 zPvQvVJyt2qvBwncJvzqdVGCtOv00Buc9jPUd4mI1b1QxYD0P9W1A9J2kLIsz6WbjKAl
 o4Z7/qzj7k1A4XAF5IOots4VKRPz7dwVOPJKBvNa57qe83uctt7jhI7J4pv4kIwuy282
 iAaAVtl/e2drs19Vlap3WYuJMIp6mshZV12RL3dvI0+7zfL+RZtGuLPlsEIM5LebDYO/
 0UZRyPh0diQFxaPHHDdvt1Rror0wcjrrQ1R+vGf2qA9kigcq1LZGRgDieSxsC2XCbDUx
 Kd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Id6RP1VS5hXJUMhUzwY34yVBORZ0nCdjPMNOwgBnW8=;
 b=J8n7CDbFH5uF0p1Jz5SbCg3Bw6S6yUV+bn8PaqiqujaGkyZSMQg6nn0rXagD3qxDSq
 dX4nKnoOBL0vgLhMfOmTr743+UHu0SVqzwt+hnd+mIHU+JAg7XqfI0+PxyP8UkKeZ3Sg
 VGvZdZd7EdV3XfzfZkN00jDGLWg3kYBHyVm2SJj3AVNoAqE8cho71DaYBHqK2QyKbXVp
 XfAynBpHxjPApdV5/GFK1o3yUz2vQA/y1p0BCPT7Ec2NEnrQ40Cc9MFciNMGGRPlH7a+
 wYEL1ty2+Ng0GVekIvdTYAmgV6CFpNU94LJRgz92EMguHz7zjhSJoyxjYVSlrXvWnSTO
 1AJA==
X-Gm-Message-State: AOAM530B3gL+gZ84/e3NKkSGHvSwL7cLyf0DXSW1cGcjwpfCqMXh+4cy
 jxd1KyHeWxKUTJ66IzR/Ymk=
X-Google-Smtp-Source: ABdhPJxSEC9EpSHrro+wVXZqDV6OF6pY8xh6pzPC7pTckykvjI3LVHpwb+CsEvR7xNuEo/WfmLQEIg==
X-Received: by 2002:ac8:4808:: with SMTP id g8mr7039187qtq.18.1602447784085;
 Sun, 11 Oct 2020 13:23:04 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:23:03 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 11/14] arm64: dts: allwinner: a64: Add I2S2 node
Date: Sun, 11 Oct 2020 22:22:21 +0200
Message-Id: <20201011202224.47544-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
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

Add the I2S2 node connected to the HDMI interface.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
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


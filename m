Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F125CB66
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:41:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F5DB1A97;
	Thu,  3 Sep 2020 22:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F5DB1A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165703;
	bh=FtDtCsCG+I5mkYHTFGcWwPmUiqOJd/722cScSNcK4tM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ALc7RznCS9ULje82MfqFWVx6vD1jFWcChAC4C4NGvyhMahqSQA+ozZAoj3PaXpMxK
	 Xb5hN813i+oNy+es+VgVKJZ2sbDn4NH+vnnyly/59DPhckAahFmatrIXCTlLAobvVq
	 rc0SQStBVaMHQuu0Q0noZrrb7S8bYz3FuoC+UMGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E93DF802A1;
	Thu,  3 Sep 2020 22:31:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87E4DF80369; Thu,  3 Sep 2020 22:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1D8EF802DB
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1D8EF802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NvhWJaDb"
Received: by mail-wm1-x343.google.com with SMTP id z9so4149028wmk.1
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtKn0+o2ojoOITB0B8/ryvpv4K4vTdQg90PI/damrA4=;
 b=NvhWJaDbv/CVT9H6S29IsQSZxL5ZweScApFazMPHWLRFiJH07CfnQWVipSJp0FmtUE
 c03kRCzyLeMaYSSW7xh88tK0WE0f0Ainzb0Zf0NGSPH+P5sAHS5NIkXRZuDG5gNusfzT
 y1lxM3ngFNEYJ5J2CZMvQ4w+QpC4tZjAMrO9iIWDrYVt+0QBU1Bx4H5VYJApJyoTkecd
 1aEuWZL15F6x0irX5hYs5FxvJ2nGY5gkntUET07x0KdepGdP/wAkehcEi40dhNsv95pk
 ++yJde9mhM34UMD9S+wydpdyqcyPDyIde9D71FBDkDq74l6ljB4K0DDjeJTGVo5G5dhV
 8sIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtKn0+o2ojoOITB0B8/ryvpv4K4vTdQg90PI/damrA4=;
 b=Lyqahu+1PxnL2V19aodhX5rf0liNIKpHhz/6rGrd49lUKv9vPxCR1wGT6OUEbw3Dmx
 /eAwXA3ICB5L42Qz8yXx0G/bDF134VzA6/SMhocI2qDIVqdgKDio2hdn5oj++A8VLLXB
 baxfkguFjdHE5obdMT+v7Ey7mjJ5YxE5GMxAG417hiwvc0GZ1wDvk/yMwDTnDWtZfFK1
 RgRf0V2xUWVNkC2GQu2BYjnzdpI0wsRQvXzuGPlrY7w3TKSo3WcToU94gq8CPhzAFdWr
 ny/tOmqBbiUMqwYSJG373wyNRCDBk6KRY9E5vDLDjoQX9zPO6RqxKAEINM3AxaYmYYHC
 Sp+w==
X-Gm-Message-State: AOAM533s3E4yk1O2J7tVeV0e5843TRXbN5y0AmuWHLev25dlIhAf7bfw
 tOPU20elkCGS6l4Gp1cshn4=
X-Google-Smtp-Source: ABdhPJzrI2TFNBVGeQt56vIBniKFdjFqYjQTb+7a/xKeOi2G2IH0IgIrLV+8r2IOyg1V2Aoaghdcug==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr4080239wmk.47.1599165064542; 
 Thu, 03 Sep 2020 13:31:04 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:31:03 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 18/20] ARM: dts: sun8i-h3: Enable HDMI audio on Orange Pi
 PC/One
Date: Thu,  3 Sep 2020 22:30:32 +0200
Message-Id: <20200903203034.1057334-19-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

From: Ondrej Jirman <megous@megous.com>

The board has HDMI output, enable audio on it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 8 ++++++++
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 4759ba3f2986..a5b45655fcf6 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -146,6 +146,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s2 {
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	bus-width = <4>;
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 5aff8ecc66cb..ebb12a6f3a9f 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -146,6 +146,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s2 {
+	status = "okay";
+};
+
 &ir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_ir_rx_pin>;
-- 
2.25.1


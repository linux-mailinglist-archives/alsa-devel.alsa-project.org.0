Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596AA45CFD9
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65BE1825;
	Wed, 24 Nov 2021 23:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65BE1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791859;
	bh=Q+iZfZiuFAwG+py6EhLGHr0HJdeFsJpOkfBShhQuc9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+FDdSwn5DeyIc2x+3L4IKwlAjRY35HZ834QDUT3l1O5G3J6gmtVXuzqhGGUa8XUU
	 Gd4ohX7DQoLTjJEtU24O/re4r621pn5mGKemo5G2MpXwpmOItS68KnVtL8LXH9M8Xg
	 kTbNa1ytDHP6DoFqDivCzI4XdfOklzKZ24gEgAA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0572AF8052D;
	Wed, 24 Nov 2021 23:06:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26622F8051F; Wed, 24 Nov 2021 23:06:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0346F804AD
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0346F804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mMaACgOE"
Received: by mail-lf1-x130.google.com with SMTP id l22so10958498lfg.7
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
 b=mMaACgOERSenGcWLmEoPPJgHhkMiAOulay0sv0LWaWQjUgzWbk0njA+eHQFw6bf7L7
 9XOnsWVMupgevKRLOiZaqLG7dUZtOV945CJFwJh+7sx2lVMJQsN9OxuK39vlXGU3Yg3v
 TfcqyppW6ujcpicdJLj2rGXrQoksV+Uak9OjjPypM7+V9tZjmsnUFUgtTCWr7nPvedKI
 ROQEs5xMbEXm3QH/VzvAaH6EIbPm17ixh11PUZQYbEfWCT5id6Hkk3f7WBW/IRnccKjB
 x76kMWlBeOlh1hj/idXLQ6q82W8Mzuz4dSJ7vrZfTH0b3QPcXlPEIIEJ4Dhx+/2CzbV4
 fS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
 b=k2IdsG4rLRfW7UtrcTCMw7FiirO33PLH5dnLPW746s0DK5naZMvuGAH1zUxjvnQ4xX
 BfUPBz2RcUJODgoIBRC6yviAPiLb7mnk8mbbnUd1/zM1ZQ9GTGSKT5pheivUtdjkkiuc
 6USQ96DMv7RdMu9W+JlTRMs7K4EZl/qgEo7O2R8AojQrl7Ir9f95ZNiAr6tkvKGhfu8y
 8cNewGOB4X24a7ki3in8ECIQtwedFoYKOWnByVIPcQSLkwZvOGlFE3tSPq82nnG+DJPh
 OypSfrEInzBKoEcc+Vc5AcLMJhAOnwphSxp9ngR7E95PZPH9TODObMPpZtrqjckcmOI+
 DLhw==
X-Gm-Message-State: AOAM533NiLwVLt+yne8C+UQI5kPq8+a+Wm4jjHrgEX6NjwD8S3RMbkDt
 6bYbuYZcU01tEN3e7Kvn0po=
X-Google-Smtp-Source: ABdhPJza1gucFIMiw7WDt9rwXdn3NZAoRTr2XAdbH095/UnxQNN+DzGeh7xH7/8MELMaGpv5Zlm2Vg==
X-Received: by 2002:a05:6512:2292:: with SMTP id
 f18mr18381994lfu.18.1637791604612; 
 Wed, 24 Nov 2021 14:06:44 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 17/20] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date: Thu, 25 Nov 2021 01:00:54 +0300
Message-Id: <20211124220057.15763-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

Add S/PDIF node to Tegra20 device-tree. It's needed for enabling HDMI
audio support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 63c2c2f8c0ce..799da7dc929b 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -197,6 +197,7 @@ hdmi@54280000 {
 			reset-names = "hdmi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&hdmi_dvfs_opp_table>;
+			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
 
@@ -396,6 +397,23 @@ tegra_ac97: ac97@70002000 {
 		status = "disabled";
 	};
 
+	tegra_spdif: spdif@70002400 {
+		compatible = "nvidia,tegra20-spdif";
+		reg = <0x70002400 0x200>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>,
+			 <&tegra_car TEGRA20_CLK_SPDIF_IN>;
+		clock-names = "spdif_out", "spdif_in";
+		resets = <&tegra_car 10>;
+		dmas = <&apbdma 3>, <&apbdma 3>;
+		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
+		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_A_OUT0>;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002800 0x200>;
-- 
2.33.1


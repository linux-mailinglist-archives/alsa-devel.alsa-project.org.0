Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D2045F1DC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:27:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82B7E1AD4;
	Fri, 26 Nov 2021 17:26:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82B7E1AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637944068;
	bh=Q+iZfZiuFAwG+py6EhLGHr0HJdeFsJpOkfBShhQuc9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SU8i/VGQKIKPyLZQUAZKAheF2CbE3C32oGo6zNE6tfh+8EDNZIeSgXl+aD9Q8Vhlp
	 gHH9lJQQvCZYgKwr7kvdnHTDTLCPkVoBPS26MbwFZ3YOg9I6e/lOL+n6ZO06mF4PiF
	 gl9eNgrFYF+5PxysJNNotcw53Yge3LfBB5l0T/jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A6BF805AB;
	Fri, 26 Nov 2021 17:20:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FD51F80526; Fri, 26 Nov 2021 17:20:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A24AF80515
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A24AF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bdbspkD2"
Received: by mail-lj1-x22f.google.com with SMTP id t11so19726606ljh.6
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
 b=bdbspkD2uxc8qeriYgYo3urTgP3sVL8LPoyinGG3VjF3C7Lw0RK+XZckeGj0vFEJHn
 XQ4zadccolf5Ix433mkdFsT6vgImRa6Txk210jDxGGs2WztWVW5Y9CpKN8ks1hCa1VoP
 MxyOOSkQGswD28YdxKvlc2JDyMc1jj0NVGVovHOfgYq6LoJTdWVQXajaanCtGL1TdQ1i
 +WwdN6tfAhUArRz59d16jrN3THi5VHiu1P1uHM7Egb1SzwU0RYaOxhLHHfG3Uw+UoD3O
 LtVtusEJIBWcyT1kojXzI8gP4RLEwwLnfE9bWG5pUgcIpqyp/yhYbnhxT7suOiB95i7B
 AOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
 b=YePTlNnxzKq0GN+pWmbgHin7OhL6ZYc7BfZYFH+WWMoytkJAQs3sEfuFENVAgalSls
 sLAYjBmwhbr6DNZVtgs4A3ICN3S+qx5Am3KOH4th1nQaOFLpjwbH+LaQUnDwTMInSy5H
 4Dt7ZMGyGdsq8Q6IlVkyaP/eswGJyT5Hy4Uzfbp6TAN9ql0nTCuvBGa0rhek8yD/jykz
 AY53Rzse/RLPjGK2JeBXGGtDdWjj5F5vEuP+FLBWkS1apju0s/ccTyVRQeAWV8ULfFAI
 yiQRw5CC/VUsRMCvJj5z7wKisxtjPHas8FdA+acSsNyvKgsV6tHF9Fo5P7HFKMmB5GKa
 eFPA==
X-Gm-Message-State: AOAM531APDhxxFhyTsMX0wIMRB4pqHxLu+4zhNWVF28bBKMTv1HYFPCW
 2YReVEWo3K06GLZqxuJ1yKg=
X-Google-Smtp-Source: ABdhPJxpm9nqKWKezaZcIWKSbgNt+5aswTDFHwGvFf90WbQr4/XEZVYSn1hrv8SDqgkyr4alLXIBbw==
X-Received: by 2002:a2e:9217:: with SMTP id k23mr31531018ljg.267.1637943597317; 
 Fri, 26 Nov 2021 08:19:57 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:56 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 17/20] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date: Fri, 26 Nov 2021 19:18:04 +0300
Message-Id: <20211126161807.15776-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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


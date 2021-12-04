Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D174685BA
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:44:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C59C1F68;
	Sat,  4 Dec 2021 15:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C59C1F68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638629059;
	bh=96krRvreUm2iu4ydznpueRnlYw6Yvaa39UT/lUYqmo4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S6p3JQMeO0TJrxUegLERCyJvk2S79C68yjAsdGL/WjtFPo8KzIzjLQmPoJulIF1Hy
	 UqByCANowi8s8kAyO2K53r090mFoACajPNPFyKN0k4YRT5eVMpaf7uVNjLpy4Mkuyz
	 RhBP3eYChXmd9BKzBp6Mfi15UJ0PnALoEoiKdnEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4074F8056F;
	Sat,  4 Dec 2021 15:38:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03340F80534; Sat,  4 Dec 2021 15:38:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F6B7F80508
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F6B7F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="leSChBds"
Received: by mail-lj1-x22e.google.com with SMTP id 207so11921186ljf.10
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHEu7xIUmbPKbJQuG/1auedODddNVJ0Qz8PQOApRayA=;
 b=leSChBds958mAfUMY9jeuuqD5Qn6lvxbEB6QV5qCZ0n0CsKze78eor5z0bN9rj/7Vw
 h7/tlsyatSb4Rnn4aadHj9eKx3Hufmh5E1AfSh5sxzyV+r76EZLz4xGtHt/Upcn83GRk
 VlmvlBxwI9IrqnFSd36xJr7Sj1OUvD1LYMjcmuDTUgiYSK1yb5hTeoP7IWcrLVmEe8Vq
 ABkcKxWz8+fCJmaobjrWsaQaOyL68eh9YEuSyfNpUr0lL4ZpAvMCkfWw+ME8czOM9IQG
 5rwGwfIae8P3ENqoKLVdn2qIscFlew1Y0QtLEW09HYlSN5ZtDmEBLi/dLcE2RWXmINFP
 Ns6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHEu7xIUmbPKbJQuG/1auedODddNVJ0Qz8PQOApRayA=;
 b=ekIQgBqBoP+J2/NTj/dxEwZM2+5mH8hCIWD66aQomuV7FZuZrFjWr6gkT79ylbei11
 lKc0YGm1fEU8wYwfQgBODcs7TY/vBSL5KUWRKRfP2GjfQMW1vBtuWs1/bQEonfX2xGXQ
 CzJHB+WBkIz7mcBQ5mwrTsxHdCWwdrnIQZze1EwzFrGZNR+ORaCq0DnYDUWQNUV2DymM
 p0Tuqr1P56Oq5y7Tf3eZS+PSbSsanRGbh/V4nk9rjYv3Fqq5k2eEMhF+COYAYRhspv9d
 8IX0wF5TvjvDoeCHywEVi1YnWsL14uP31EN26ekXqCH4//B3hHoV5mL8fYCaJia9iduY
 jQ9Q==
X-Gm-Message-State: AOAM532x1EvINKt67Z6fkc5O/RD2X142jmPIqtWauaLICiwMjHnpJq6N
 2fQxNQEw0Z4Vc6tqbBITiTo=
X-Google-Smtp-Source: ABdhPJyDeO75xIBk/QZj5qYQSqZV15+DMrRsbXBSrSANn3YT8kCBPAn11GIEkBQ9rFB2qoWlosH3Fw==
X-Received: by 2002:a2e:b8cf:: with SMTP id s15mr24932955ljp.297.1638628667574; 
 Sat, 04 Dec 2021 06:37:47 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 20/22] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Date: Sat,  4 Dec 2021 17:37:23 +0300
Message-Id: <20211204143725.31646-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
Tegra20 devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 72cbe32d0c1d..dde228bcbbff 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -186,7 +186,7 @@ rgb {
 			};
 		};
 
-		hdmi@54280000 {
+		tegra_hdmi: hdmi@54280000 {
 			compatible = "nvidia,tegra20-hdmi";
 			reg = <0x54280000 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -1063,4 +1063,24 @@ pmu {
 		interrupt-affinity = <&{/cpus/cpu@0}>,
 				     <&{/cpus/cpu@1}>;
 	};
+
+	sound-hdmi {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "NVIDIA Tegra20 HDMI";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+
+			cpu {
+				sound-dai = <&tegra_spdif>;
+			};
+
+			codec {
+				sound-dai = <&tegra_hdmi>;
+			};
+		};
+	};
 };
-- 
2.33.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A16B05C2
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 12:22:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A232017D3;
	Wed,  8 Mar 2023 12:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A232017D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678274565;
	bh=lGdJ9WTyXXmC97TknANQhOpSyraJGI5n8TG/m7EnJIk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aQVX/CwtlH1fgSxbtcQymAM2NmXR1Q0D/rPrfgw0UsD8/xHm+Vggky45lJNhAT5SA
	 aJjsvpzGoage2CVlBwYtUMKrS0wFf8MENa0U6cCJkRTGIGXXSEvVWno95Bobtn6Qre
	 edqCTwFNesUkN27JRPjFXnCsKniu1icAtFA89sj8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0722F8055A;
	Wed,  8 Mar 2023 12:20:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E671F8052D; Wed,  8 Mar 2023 08:35:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3AC1F8051B
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 08:35:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3AC1F8051B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QHNf0aLV
Received: by mail-ed1-x52a.google.com with SMTP id g3so62151986eda.1
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 23:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39MKY2PBggsOqLz16dtI8J1bAyc0BT5d5OTGVqhjQKs=;
        b=QHNf0aLV0JBCmKc7lo9CAcdqetX0+L7WO5mOJT6e1MG2iD5mPktKd8CpCvITismNE8
         nAZbon1hMTDWH09FXCFpkBeJiqt4LhWe0frq9/LtZIhSMrd8Er0+VvpimR8KbJtjHFZe
         ShlFEbH/K7Vpz65ubEXRTnjKglid7YAbP9NQGR+tKBzWZX8mv1S7YANnYTRcJ7fh6OhS
         NyHDOUMasETq8xtiwNndMKQlL24TffXN4qtUUmF1S97ASdNp57vJTJ5a5yUYaWsouYCS
         Nq94fWqucEqCW9D9ZJLVLFlL6HRf2w01sjBcWaUZtNoVQ+Tkcv5U6QGtKjsyMAFomo6p
         /ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39MKY2PBggsOqLz16dtI8J1bAyc0BT5d5OTGVqhjQKs=;
        b=xVKhwyMkRW017y50Cm49lSeBNgTsTkV2goeVHApCDUCpPMNrfT3NLcpq7bV555eN3C
         Dph9ob5LHP7ZpE6RRVgu0YZIcwIzFOdKumUT71VnxnatgB5/VpZWvc1hbgDB8xImUldw
         GuYwSIUN+sph/yG+pHc0oyGPk67xlnlcvA4L+dQFE4uNe/gwWCZaoBJyLCH4dqMgedQf
         dPuxjLCER3ssu+ZvvH9zIkk1g3Bmj2jRYrb1j0V8avFGvxazyo43jfBFwG/cU/bnuZx1
         Cj49LusmV+HUo4bFso423Eopx+F4Mw3IRM80t4ih4q0ECbIrWRNaajC62jRjT9ftNfsl
         +INQ==
X-Gm-Message-State: AO0yUKVMDyGn+loGAMlSMHy0WIMEfZb17SdgTMJ45Jmjq0p3V2i0mAeU
	SJhhDxL01pD2QABOF5greXM=
X-Google-Smtp-Source: 
 AK7set8ZGa8fQHr0KjSuQKfjIPJyG5o7GhZibY+r358ltED0FvEzlU0aKzEoqt3sLzCE8W9a4IOqnw==
X-Received: by 2002:a05:6402:1810:b0:4ab:ec2:3cd1 with SMTP id
 g16-20020a056402181000b004ab0ec23cd1mr15708604edy.25.1678260930042;
        Tue, 07 Mar 2023 23:35:30 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 6/8] ARM: tegra: transformers: bind RT5631 sound nodes
Date: Wed,  8 Mar 2023 09:35:00 +0200
Message-Id: <20230308073502.5421-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TFJEMMN53ROFW2WJ6PJPOC3SD37VQAVE
X-Message-ID-Hash: TFJEMMN53ROFW2WJ6PJPOC3SD37VQAVE
X-Mailman-Approved-At: Wed, 08 Mar 2023 11:20:03 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFJEMMN53ROFW2WJ6PJPOC3SD37VQAVE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

TF201, TF300TG and TF700T support RT5631 codec.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-tf201.dts   | 17 +++++++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts | 17 +++++++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf700t.dts  | 17 +++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-tf201.dts b/arch/arm/boot/dts/tegra30-asus-tf201.dts
index 315c6dc068c5..47865deeb88a 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf201.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf201.dts
@@ -605,6 +605,23 @@ haptic-feedback {
 		enable-gpios = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		vcc-supply = <&vdd_3v3_sys>;
 	};
+
+	sound {
+		compatible = "asus,tegra-audio-rt5631-tf201",
+			     "nvidia,tegra-audio-rt5631";
+		nvidia,model = "Asus Transformer Prime TF201 RT5631";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR",
+			"Int Spk", "SPOL",
+			"Int Spk", "SPOR",
+			"MIC1", "MIC Bias1",
+			"MIC Bias1", "Headset Mic",
+			"DMIC", "Int Mic";
+
+		nvidia,audio-codec = <&rt5631>;
+	};
 };
 
 &emc_icc_dvfs_opp_table {
diff --git a/arch/arm/boot/dts/tegra30-asus-tf300tg.dts b/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
index 96345f821c3d..82c51e177a70 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
@@ -1072,6 +1072,23 @@ timing-667000000 {
 	display-panel {
 		compatible = "innolux,g101ice-l01";
 	};
+
+	sound {
+		compatible = "asus,tegra-audio-rt5631-tf300tg",
+			     "nvidia,tegra-audio-rt5631";
+		nvidia,model = "Asus Transformer Pad TF300TG RT5631";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR",
+			"Int Spk", "SPOL",
+			"Int Spk", "SPOR",
+			"MIC1", "MIC Bias1",
+			"MIC Bias1", "Headset Mic",
+			"DMIC", "Int Mic";
+
+		nvidia,audio-codec = <&rt5631>;
+	};
 };
 
 &emc_icc_dvfs_opp_table {
diff --git a/arch/arm/boot/dts/tegra30-asus-tf700t.dts b/arch/arm/boot/dts/tegra30-asus-tf700t.dts
index 1a331dec3cfe..766225ebdeab 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf700t.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf700t.dts
@@ -812,6 +812,23 @@ vdd_1v2_mipi: regulator-mipi {
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
+
+	sound {
+		compatible = "asus,tegra-audio-rt5631-tf700t",
+			     "nvidia,tegra-audio-rt5631";
+		nvidia,model = "Asus Transformer Infinity TF700T RT5631";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR",
+			"Int Spk", "SPOL",
+			"Int Spk", "SPOR",
+			"MIC1", "MIC Bias1",
+			"MIC Bias1", "Headset Mic",
+			"DMIC", "Int Mic";
+
+		nvidia,audio-codec = <&rt5631>;
+	};
 };
 
 &emc_icc_dvfs_opp_table {
-- 
2.37.2


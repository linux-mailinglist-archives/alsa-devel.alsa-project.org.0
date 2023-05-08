Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5996FD714
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:33:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C22931076;
	Wed, 10 May 2023 08:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C22931076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700435;
	bh=7hkqB67ueLmc7zjVefLgn5oHsk7a99IQ4Vds3QR66DM=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=okwpqt8COnKHCmr+Bs5xMIyLuZvj/4loBvBnUw52s9idoVz8n73m6ds3IUNnn32Lo
	 uqmstCKdqUWsJ3464mQRSdLVwXGNxOytIgnW6aCXifq78GpLjQ5NxLJAFRRumZvegj
	 f0zm6F1dBHEyN2fQOW5D9OgPaT/NETFDpjkxzyqw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14A8FF80310;
	Wed, 10 May 2023 08:32:22 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 6/7] ARM: dts: chameleonv3: Add Chameleon v3 audio
Date: Mon,  8 May 2023 13:30:36 +0200
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLAK3W6RZQEJUII2BO2JPJNFLCXWRAVE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168370034141.26.10571410279810810100@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47CE3F80534; Mon,  8 May 2023 13:32:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A451AF8053D
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 13:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A451AF8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=lUUfpAeV
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so28208381e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 04:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1683545460; x=1686137460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhrKh4Q91sZcDX0gh+ihiUBjUKwTDAbt/DVIKMwpD58=;
        b=lUUfpAeVYiOp9sTbu7V2dri2yipImnljXZO7JnejQP6OpjQt/zWkyKihYCsVro6o7l
         S6UoN+QxuZHfcuwgC7cHr0l/mHxbd8R51UUYxQf7lq+3B8QRTTEtR79Gd3vqBdR4HjB7
         ORczo3vCzMS1X9nxfzh1q1ueq1vL4qovPEgx3aNxeJfYNfBk1PQw9qUyEttYkaCKijrP
         v0ilfSf5XaV/Tm0RaeID6+sTVhfZhWbnJXFaWc1G/55u9fKVa4vyaX0iqEkIWDQzRaPH
         a7LMrAUfDUv92d6hkbLrHXZSZTHomOqJ8DxpjfGweDH2J38eBlSoyQkC7btL/t9C4adM
         xudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545460; x=1686137460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhrKh4Q91sZcDX0gh+ihiUBjUKwTDAbt/DVIKMwpD58=;
        b=K/UBm4e5nexalawW6P51XsbD7o6kXOMhCaRUiH/2uINMEY/bYgXhHsws+RP0U88FWo
         18TS48aqP8kXtb11M1Ag4hPoEEQEGmRL7JwQP0ujN2Rvga/IfbqlJo4BmAL6Ejo/1rN7
         OJAZD10IaO/IB63M2U3K2vK1Q/FOUD4SQsiwdk0n/9nItUt3siNt7krok130zlPZWwaT
         Sypm2u8HEkNaWVJA/mPUifzVwv82YngVwFTcPPhuz8NUAIkQ3dMBYND1/raVBM3hh4t9
         y/OQ+CYNZCQsfocNiFUIJArFDvm+xwp4MX98zyunx94qzxHPfWPlPDTW8g/RhuCVgpxo
         vucw==
X-Gm-Message-State: AC+VfDyc6lLd+ILX2ogj+zBua99YoCx//5i7G0MbFsst6NXngW9iGT1r
	cU55eHkg6OnyRWPkXVKF6DGISCRW1E2HzoZx0IE=
X-Google-Smtp-Source: 
 ACHHUZ4C5KbrYUeGkSphmYDewWuv94QqJjr9H/rTtEfQLFyPH78jorLDZ2/w5tdPPZSc1PQ/QXjNPg==
X-Received: by 2002:a2e:8e3a:0:b0:2a9:d4f0:6 with SMTP id
 r26-20020a2e8e3a000000b002a9d4f00006mr2845808ljk.17.1683545460507;
        Mon, 08 May 2023 04:31:00 -0700 (PDT)
Received: from panikiel.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a2e2408000000b002a8b9353338sm1144406ljk.117.2023.05.08.04.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:31:00 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 6/7] ARM: dts: chameleonv3: Add Chameleon v3 audio
Date: Mon,  8 May 2023 13:30:36 +0200
Message-ID: <20230508113037.137627-7-pan@semihalf.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QLAK3W6RZQEJUII2BO2JPJNFLCXWRAVE
X-Message-ID-Hash: QLAK3W6RZQEJUII2BO2JPJNFLCXWRAVE
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:16 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLAK3W6RZQEJUII2BO2JPJNFLCXWRAVE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add dts nodes for i2s, audio codec, and simple-audio-card devices.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 .../boot/dts/socfpga_arria10_chameleonv3.dts  | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
index f0483ef46a36..a69819e26144 100644
--- a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
@@ -15,6 +15,61 @@ aliases {
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 	};
+
+	soc {
+		i2s0: i2s@c0060300 {
+			compatible = "google,chv3-i2s";
+			reg = <0xc0060300 0x100>,
+			      <0xc0060f00 0x10>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			#sound-dai-cells = <0>;
+		};
+
+		i2s1: i2s@c0060400 {
+			compatible = "google,chv3-i2s";
+			reg = <0xc0060400 0x100>,
+			      <0xc0060f10 0x10>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			#sound-dai-cells = <0>;
+		};
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "chv3-audio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			cpu {
+				sound-dai = <&i2s0>;
+			};
+			codec {
+				sound-dai = <&chv3_codec>;
+			};
+		};
+
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+			format = "i2s";
+			cpu {
+				sound-dai = <&i2s1>;
+			};
+			codec {
+				sound-dai = <&ssm2603>;
+				bitclock-master;
+				frame-master;
+				system-clock-frequency = <22579200>;
+				mclk-fs = <512>;
+			};
+		};
+	};
+
+	chv3_codec: audio-codec {
+		compatible = "google,chv3-codec";
+		#sound-dai-cells = <0>;
+	};
 };
 
 &gmac0 {
@@ -39,6 +94,7 @@ &i2c0 {
 	ssm2603: audio-codec@1a {
 		compatible = "adi,ssm2603";
 		reg = <0x1a>;
+		#sound-dai-cells = <0>;
 	};
 };
 
-- 
2.40.1.521.gf1e218fcd8-goog


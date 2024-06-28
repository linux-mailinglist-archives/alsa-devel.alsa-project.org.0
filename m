Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BBD91DF79
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:38:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759BD2BB0;
	Mon,  1 Jul 2024 14:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759BD2BB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837497;
	bh=eAsxPRlEzNTeurZUlbb1dRpSlSCLeJU/Bps8eIDqRWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MmJiVnKhu+EFXRLAklXtn7QmsAYJ6g8OZNDnpLIC7ZNNpTfIld3mRW+019sLCZ94q
	 2O9IRlcCfH1ns4iFHSSeNqM9DsftY/j44s8MXkx72ZxoaHJ2gfCyS370+6JldsFZaB
	 ZlOmhO2PfEZIQ5lbYedTnc/cWNCJ9W23gpIHD/lI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54D64F89B67; Mon,  1 Jul 2024 14:24:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72F4DF89B6A;
	Mon,  1 Jul 2024 14:24:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A39BFF80495; Fri, 28 Jun 2024 03:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0CEDF80423
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 03:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0CEDF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=f/tJkR24
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42563a9fa58so572595e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 18:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536841; x=1720141641;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8Cullp4heLq3j3LJu15lP4LYL9Xcky4j2OZDLvmJ7E=;
        b=f/tJkR245D+xSRsLamOCiGime6kztCP58Mws+QOT2O4JvWFhGcQDvua4YiSrrvGlOd
         REssRZuPLdNedhSRMpN0+Y9j7wXnpvl89T+9lfWngIE+Zq4hvzxkkwtQ0CMO0MEytccs
         zdzhXyKHISe04qyKPvotAomg42cuCPJMU0dPGIXK0S8UeV+ox6C+/JAjD8PCw4tmQXOr
         Hjxby68obi6ewp6YoLRPZMm+0AzAkqhvDnPucc52HLZCyNhSyMWcBkcBLpCI71VaxjSD
         5zbHl6bjn/34f7Bera5pHEFYtKCAn1gH56hM+T08XAtgHIjTldkaRJLlL7efAcQiTjoG
         wewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536841; x=1720141641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8Cullp4heLq3j3LJu15lP4LYL9Xcky4j2OZDLvmJ7E=;
        b=mS26tXuDilFO3P7HubyFryk7wbhXY2Rgr6nCKl3A0jEjglYBXtMpFMy8xqujMidqBl
         4U+G8EgJE/L2a7CNLLuCPVwVd/o5QJps5rWIlNYMHucuxGgPPgE50Uz9yHNSYEcMBXwT
         GP4/BUbwXW3+TlqXUstS3iZfortN6rDW8VWQPLmIvVjPLc0C2QbLLJ1sHhJO5K65BM+A
         uE5KkCThM5ahswvSiL0skpIUHs9Q1C88SUF76C5nX0YOgcBgVuyhH+HjINPvpFDmM3Gl
         9gPrkooiFfxwf5fLUN0k/UUrqp7fm+RbEIi6m8nGkIVZAop8fvLgg47F0Yi4xE75DZyG
         4qlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Vy5dclyotXmC3fDv6STYnbcDy2TDmISkrHmqPXXkbrHrzQ4c/xX9cAy4bsQjXTKVuqEXiMwpBoR8NN3U0bP9+xgyp62L+p62p18=
X-Gm-Message-State: AOJu0YxwLqSV0Zut7TuCOc3qkWeXjluSKm9F8eiRyfbU2i945gTiwSTG
	3ZfzGgYSbqtrdRpCr+yedYUheP31jQQ/iK5UhKumclKVnDIGvTplo9bLWU0QHDI=
X-Google-Smtp-Source: 
 AGHT+IFE15Or4v64XjwbEff7c+MWOISRCnhFWtQM6ObQ3evXM/ffhHAIMMW/rwLFVOHlxMVgJL8Gew==
X-Received: by 2002:a05:600c:1504:b0:425:633d:926a with SMTP id
 5b1f17b1804b1-425633d9463mr28806335e9.21.1719536841671;
        Thu, 27 Jun 2024 18:07:21 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:21 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH 5/7] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
Date: Fri, 28 Jun 2024 02:07:13 +0100
Message-ID: <20240628010715.438471-6-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PHHO7VLSMO6Z3LVUPHBT4FQVEK2HN53K
X-Message-ID-Hash: PHHO7VLSMO6Z3LVUPHBT4FQVEK2HN53K
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHHO7VLSMO6Z3LVUPHBT4FQVEK2HN53K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI)
pin controller device node required for audio subsystem on
Qualcomm QRB4210 RB2.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c49aca3d0772..3a9fb1780c90 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -809,6 +810,21 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+			reg = <0x0 0xa7c0000 0x0 0x20000>,
+			      <0x0 0xa950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 26>;
+
+			status = "disabled";
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-sm6115";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
@@ -3068,6 +3084,9 @@ cpufreq_hw: cpufreq@f521000 {
 		};
 	};
 
+	sound: sound {
+	};
+
 	thermal-zones {
 		mapss-thermal {
 			polling-delay-passive = <0>;
-- 
2.45.2


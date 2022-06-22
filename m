Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9115542FF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 08:50:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770CE1F4A;
	Wed, 22 Jun 2022 08:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770CE1F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655880635;
	bh=ew9/y6Zbzk8IV+ephSnSvN3ztkmlhonfvEZg1Pybg/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qAONJ3fXG7khRA2CSTYCZsmKVP+02/XYMSXmkQPXVyGe67Tv6vHyHyqauA7/ZXEia
	 NNtWVrLysj2Vw7Wk7ltxurG0wnR5DaIoFwwlSCzwY3UHPeA0y8YMDeeNBfhfl+BJpF
	 K4vkgfMswKi5CFmavn7qDgPJvm19nwhAfo/6Ux8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39CDBF80542;
	Wed, 22 Jun 2022 08:49:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AD9EF8053E; Wed, 22 Jun 2022 08:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BABE2F80538
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 08:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BABE2F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EUth92aS"
Received: by mail-ej1-x62a.google.com with SMTP id u15so4429419ejc.10
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBoEfewX7uE5qiTFF5ceaeSxviE76/D0VbXLBnCtMOk=;
 b=EUth92aS+ARXNsUtB82Fn+0F0yahSJwW0aRp3pWoXXG95IKw1RArK9Ig7q3Rce1Ehw
 IB9YD315FvrufeFHauaTVDmyU561dpJJXVoxeP+YEOqYEB0GnwGjYYtO1LZlK0o6QfsS
 BWFYFQiQlRYg0TliVlsC5C5feb19tNjrrKtR8kj8DM6+fCRVWi11MZKCMVbP+keN1pSk
 Y1EH0SW0kUa5wZx/+ZvoXeYEPP577kv00tMCUDJ/q/mSmcBZtgAtalgDCO97V29+FF0L
 wIqsPe04Qtlfs5uOqGtzgmol7qNeUSdazWS2kf76TziOEgPdeiTWHQ3efBkkbD6pe2Jo
 fq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBoEfewX7uE5qiTFF5ceaeSxviE76/D0VbXLBnCtMOk=;
 b=wQFEu4IC3qiRIzUCoKeDX3MvUOCIgrBZjfv/T0XbsygyhRHHPWW8B2L/0I53Z9NDWA
 JTSWRSp+Q5uQl634P+hC1LzJgyTOQZ4dEQ/l/9meWDT+kHchZp5PY4HkzOX7IOsG2AiS
 rB3LHHHj1Qb0aAtbnS4wYgJ3pPI5dg0DnslBgahIZh5bJMGV45rB6LCPT9qFN/4QNleJ
 2djRHB3mT7j7Ojo1wHQ8MpfZ2u6ab2z8XzNVDpNfa1RFEBDS2u/UpScbsIj2wkZVAXnf
 ujrIfJOar5JxIJZuU/GHLxA5V8Lkioa2l0Evar2PN7UoBA+kE7VuY5U/LxLhtnmEedUS
 wvGQ==
X-Gm-Message-State: AJIora8ksEWXt1PqWJ6hJpLtwjvaNlyumW9I2LPGcQX4YbJeiQqpXObv
 qBOSvr/zYb3C+2eKCBKN1/c=
X-Google-Smtp-Source: AGRyM1vWBsfxuaNlo0tjKP0/6jEDWmmlRypkx4HG/8dsYU+wsKOh1CtyzxerPhaniyY/3W5GIrXT8A==
X-Received: by 2002:a17:906:6a27:b0:708:1282:cbe9 with SMTP id
 qw39-20020a1709066a2700b007081282cbe9mr1767404ejc.186.1655880528800; 
 Tue, 21 Jun 2022 23:48:48 -0700 (PDT)
Received: from localhost.localdomain ([185.107.95.225])
 by smtp.gmail.com with ESMTPSA id
 sd12-20020a1709076e0c00b00722e8c47cc9sm1197148ejc.181.2022.06.21.23.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 23:48:47 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] arm64: dts: qcom: Use WCD9335 DT bindings
Date: Wed, 22 Jun 2022 10:47:58 +0400
Message-Id: <20220622064758.40543-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622064758.40543-1-y.oudjana@protonmail.com>
References: <20220622064758.40543-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <yassine.oudjana@gmail.com>,
 phone-devel@vger.kernel.org
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Replace DAI indices in codec nodes with definitions from the WCD9335
DT bindings for devices that use WCD9335.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts         | 5 +++--
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts  | 5 +++--
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 49afbb1a066a..ff915cd8e5a6 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -13,6 +13,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,wcd9335.h>
 
 /*
  * GPIO name legend: proper name = the GPIO line is used as GPIO
@@ -1009,7 +1010,7 @@ platform {
 	};
 
 		codec {
-			sound-dai = <&wcd9335 6>;
+			sound-dai = <&wcd9335 AIF4_PB>;
 		};
 	};
 
@@ -1024,7 +1025,7 @@ platform {
 		};
 
 		codec {
-			sound-dai = <&wcd9335 1>;
+			sound-dai = <&wcd9335 AIF1_CAP>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index 22978d06f85b..261f2ea7def0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/input/ti-drv260x.h>
+#include <dt-bindings/sound/qcom,wcd9335.h>
 
 / {
 	model = "Xiaomi Mi 5";
@@ -193,7 +194,7 @@ platform {
 		};
 
 		codec {
-			sound-dai = <&wcd9335 6>;
+			sound-dai = <&wcd9335 AIF4_PB>;
 		};
 	};
 
@@ -208,7 +209,7 @@ platform {
 		};
 
 		codec {
-			sound-dai = <&wcd9335 1>;
+			sound-dai = <&wcd9335 AIF1_CAP>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
index 1e2dd6763ad1..c9f935cfb587 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
@@ -9,6 +9,7 @@
 #include "pmi8996.dtsi"
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,wcd9335.h>
 
 / {
 	model = "Xiaomi Mi Note 2";
@@ -171,7 +172,7 @@ platform {
 		};
 
 		codec {
-			sound-dai = <&wcd9335 6>;
+			sound-dai = <&wcd9335 AIF4_PB>;
 		};
 	};
 
@@ -186,7 +187,7 @@ platform {
 		};
 
 		codec {
-			sound-dai = <&wcd9335 1>;
+			sound-dai = <&wcd9335 AIF1_CAP>;
 		};
 	};
 };
-- 
2.36.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7F555116
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 18:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F228E2821;
	Wed, 22 Jun 2022 18:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F228E2821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655914553;
	bh=9a2gjejf8GE21wDjARORGQOLVTXGrAImaZHq5M3uosw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jC60GwuFE9AeWBNZeRQvsEqmLjtLpvPC4Hx4Iw0N/w9OwQiX/D4EpDXF9bQov3VMR
	 arRTfckm03l7RZGPDs/GMFCOyqQ9Sf/FNqB4gog0wybraYMt5XcjIezvqA7MXr2qvW
	 lrSRAUxADJa5CVvoARg8mCtIKNJpZm6RpzVhVNNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB247F804AB;
	Wed, 22 Jun 2022 18:14:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5DC4F80539; Wed, 22 Jun 2022 18:14:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA1ABF804AB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 18:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA1ABF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mHdOM2Wo"
Received: by mail-ej1-x62f.google.com with SMTP id sb34so6263860ejc.11
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzYR8E/Z4d+yIxT6wxjVdh3AUuQSp32xTOoEtVA33Ic=;
 b=mHdOM2WoMZGuHTH9ibMduMO9iTX7wWF3RnKUIlwlF/f5maP3tJLzgD0LFBy0kaAFuu
 LBf3pKzeW0j2ZXwFr9pBeNzHMx2XqTpPlzeVscunilw/mRu2jq7G2zOjNyV355hFIvF0
 U7gQNfF4d93YXFZmss4Zw83fi4vc3s1D5OVDgj3RfV5YsI2DtORJ1F5/7Z9xed0lzd/3
 QhOkLryhMlAtYOEAn2JmlUlJBeFcwFklSr+/2om0JKO/s5rPbeJWWDW0k59WSR8U+Bdc
 kcFwZYPRsHhjRtQCJCihHT+tH3Ar+Z8cGRdw9z3H+Ko1XNahTyd3E3gq+JKRP3v5FvjE
 u4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzYR8E/Z4d+yIxT6wxjVdh3AUuQSp32xTOoEtVA33Ic=;
 b=iRnn1KsLelQu9zQmPeGdO22/RraAU61Spwln9zYk9YkwL4TTw3C8i/Oxjbh9LdrJwL
 yOQNZyFPYTIaMPv6Z/IVJ1izQxll8RhHpOWmlR+z0erlyOR0ItaihQYv0RhC4EGZ+waw
 Zght2bGyY1DfymHdpYpLPE62lr85oMZjJS/tqdNKXZAwjnp00c8FEhWfCBb6ir+/NWZa
 RpYGwBvbWwt8XxoftAujKgfxALt5iDTlkM+qRv5En6Nr49MLSH5C8FxL86tlOkj/9Io2
 5SE7C+ILUcRH4jZGGup6VcHgREq0tqgQajtT6Qr42rGpCOPK3nr+cTbs+Yq5gTEeUo0O
 4IAg==
X-Gm-Message-State: AJIora/wtZKG2tR71l3kGq0rSaImUn4E3elXBuX3HGUxxx9HnML2XzUv
 pIzezeIQHcI616Hfgb7bo/w=
X-Google-Smtp-Source: AGRyM1tFNI8nzCzf1c3HbSPbmMDqjs4QMeRDCukz3KOrq4G1bBxyF6h6Icic02RBVljA/Fz0VS5r5A==
X-Received: by 2002:a17:906:147:b0:712:1288:348f with SMTP id
 7-20020a170906014700b007121288348fmr3774357ejh.324.1655914445528; 
 Wed, 22 Jun 2022 09:14:05 -0700 (PDT)
Received: from localhost.localdomain ([185.107.95.225])
 by smtp.gmail.com with ESMTPSA id
 sd14-20020a1709076e0e00b007072dc80e06sm9576036ejc.190.2022.06.22.09.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 09:14:05 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: Use WCD9335 DT bindings
Date: Wed, 22 Jun 2022 20:13:22 +0400
Message-Id: <20220622161322.168017-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622161322.168017-1-y.oudjana@protonmail.com>
References: <20220622161322.168017-1-y.oudjana@protonmail.com>
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
Changes since v1:
 - Maintain the alphabetical order in msm8996-xiaomi-gemini includes

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
index 22978d06f85b..8cdae01aaa85 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -8,6 +8,7 @@
 #include "msm8996-xiaomi-common.dtsi"
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,wcd9335.h>
 #include <dt-bindings/input/ti-drv260x.h>
 
 / {
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


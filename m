Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A491DF78
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:37:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7934423D4;
	Mon,  1 Jul 2024 14:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7934423D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837476;
	bh=VaJgdAUwAE0Dxl/8QEWuET/yRCAh4TW1cOFSAuG2kP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OldtdQW7M8YFln5wp5XCjWpeB4mCTikivLNj94Q+t2XDvhOAVXYiiYkv/eOZ3VdGX
	 shLiyMYdtLutQZXSps6YlREIsaTNcpJT8KBQQN2rnYGXyAWO/I3UT93Ll5ckHlQwaK
	 yHO3ZERyy0sigbeT+6mNtEVV8DJuBANW2gzAcyGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68609F89B53; Mon,  1 Jul 2024 14:24:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7A09F89B52;
	Mon,  1 Jul 2024 14:24:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37F6CF804F2; Fri, 28 Jun 2024 03:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CF1EF800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 03:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CF1EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Lq9ukaXd
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4256742f67fso411775e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 18:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536843; x=1720141643;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dygKyrjKx/kOGRgW4z+quGaDKz0N+z+SoU7Eqh65Kfs=;
        b=Lq9ukaXdsNqk+HMJ0+/wSjq+yUr/yud0NiI3xrXiTODKrX67lguOhJ5lFWjkUOU0EW
         RSAmeluEFvU2raSLmR28qeujYR+c2SkDSCNS65kwhVYdifIHVopRW81WYG6WLbe3L2sY
         8D0zcmauLoIqt8Lfq83ht1iFtdhsOlZ4CiMFsU018MOfypmoQAM3EPPZs4/C7vTThvqo
         42ULyA0KlPVoQV9Yi1Vn3y7aSo6kQjcVSvVm6jvFOGNphXmWVxUU0FnypEQ7dhz6YpK4
         TXZPRQl3o5wLeIh5yhjQyHUZsikuT//aPI8/lLiiQOAuTcrZH0+fuFQ58y5Nfs8ypLdS
         RxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536843; x=1720141643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dygKyrjKx/kOGRgW4z+quGaDKz0N+z+SoU7Eqh65Kfs=;
        b=TP56aNakadMtwI//YuvFnqkUfiPk4sqW67dmQ0px7fLjsygXhpZKz5szgzQnDaBIlu
         3FUv0BrrVF2FABAZ0I+rY03LJG8G3q3fmjGOuXgNOlDWmbswxKKU9h+kqF20GkrcrK8f
         ZA01Jiq5wUVojVa0WD2mbssVdOUCOuq0sC1Rx7zzkF+kO3Ktcah6syzdtXagx9VRjpXe
         viRCOvyG5dZAJ1BbjTg6KNI2qyVKKZJ110fsiqztQUFnVLAChj6maQ/LBVS9IftI6Dc0
         jMwxMkBx/SI9coFkvJI7GSw4T4djrFbGb9leOX8NkolWcTcSoObD8G13pG67LC1ba/sg
         v5aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVer9L1u8rYBrWE3qbGVlGFBvJcMFUaLc2zsd+YpyDz0NhhvtDMyR8+JN7Mlsxml3sUEIr4vGTd5aiymlNSg/XQmA+yJshHdrj/Kg=
X-Gm-Message-State: AOJu0Yw0q8M6NAjzPoHkAGefocqHjrO0v5FnBi4wFAbHIeIioIy/k08E
	q7gd69nnxGMXRbWhKEHwViZsm3dQupPhZ25eBvoUW5zn3/VTzvQRsUEJs7D+8r0=
X-Google-Smtp-Source: 
 AGHT+IFPa0BrWjNQbwKC2PbxrY3h/NKDG7XWM5mvy10enz+zNiE0uSA7CMfLfTgpWJljWSV/xaEc6A==
X-Received: by 2002:a05:600c:4f83:b0:424:8c13:edc4 with SMTP id
 5b1f17b1804b1-4248c13ee6amr101471675e9.27.1719536843575;
        Thu, 27 Jun 2024 18:07:23 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:23 -0700 (PDT)
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
Subject: [PATCH 7/7] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback
 support
Date: Fri, 28 Jun 2024 02:07:15 +0100
Message-ID: <20240628010715.438471-8-alexey.klimov@linaro.org>
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
Message-ID-Hash: 7KYJNFTE7IY3WJEVQ63HUGOSUOUNQTWR
X-Message-ID-Hash: 7KYJNFTE7IY3WJEVQ63HUGOSUOUNQTWR
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7KYJNFTE7IY3WJEVQ63HUGOSUOUNQTWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sound node, dsp-related pieces and LPASS pinctrl to enable
HDMI audio support on Qualcomm QRB4210 RB2 board. That is the
only sound output supported for now.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 73 ++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 2c39bb1b97db..9f4dde927be4 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm4250.dtsi"
 #include "pm6125.dtsi"
@@ -230,6 +232,10 @@ lt9611_out: endpoint {
 	};
 };
 
+&lpass_tlmm {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -307,6 +313,28 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+	};
+
+	dai@1 {
+		reg = <1>;
+	};
+
+	dai@2 {
+		reg = <2>;
+	};
+};
+
+/* SECONDARY I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
+&q6afedai {
+	dai@20 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -535,6 +563,51 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&sound {
+	compatible = "qcom,qrb4210-rb2-sndcard";
+	pinctrl-0 = <&lpi_i2s2_active>;
+	pinctrl-names = "default";
+	model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+	audio-routing = "MM_DL1",  "MultiMedia1 Playback",
+			"MM_DL2",  "MultiMedia2 Playback";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	hdmi-dai-link {
+		link-name = "HDMI Playback";
+		cpu {
+			sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
 			       <56 3>, <61 2>, <64 1>,
-- 
2.45.2


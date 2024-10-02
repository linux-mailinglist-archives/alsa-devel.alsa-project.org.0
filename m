Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 145FE99516E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82AAA847;
	Tue,  8 Oct 2024 16:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82AAA847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397403;
	bh=ULS7v19diYZOA4yWMObow1IhNGxKdw920LDv9hjWWKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mM+a7u2Q6T0YqttbWcYVHLW1Zj/fHDEHPMdk5/FCPUxGf/Uoubx3gh88gazkyPMq2
	 +FP5/gcdaUfmXme0AwLiKoUuO9GcWOnzeRNe8DilmMLAAO/s0YT+9Y3tOgf4Qb6bFI
	 +a0K8dOUjx2YCPVs5LiXYX+EZbysdEIl6XuD3Pa0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D598F80588; Tue,  8 Oct 2024 16:21:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7D5F806DB;
	Tue,  8 Oct 2024 16:21:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C26CF80517; Wed,  2 Oct 2024 04:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA97DF800C9
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA97DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=E5/6wvL0
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so893348166b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 19:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835636; x=1728440436;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/fecHAusQTSWcNvNWVR1JO2nQmW0cI1ww9wmHUrbrs=;
        b=E5/6wvL09CWQgQb1zmqa2X1hXsBM0NrrMPwAPYGTYuyMSPz/+ufB8JQ+nyjnvVAIc+
         Sy3ENOTT4uF8hLzQhH+GoMGA0kQsbaE3NQhvhmh2G22RBiswUXjclcxpKLzUvrxe7V48
         HvswAn9H60VFNk++qWML88WwLxPGmaSxnvDZrEUHoXB+JAvZhhdL+n4pK02tLPA+IiTl
         vpV2tTkdi69xmoYIeJ0moofcdA3tt6SF4ShyHkOueMz/t0CcWKQcWqtyJJ/gYaio/hNs
         M8uEnIZPTgrTKIzmqNk0Z+4tMPy92xNgcXXnyLlcIMJKoiUeclOZVmMtis6wKBu4c3Cd
         6nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835636; x=1728440436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/fecHAusQTSWcNvNWVR1JO2nQmW0cI1ww9wmHUrbrs=;
        b=CwmyTpGxyjBIbl9R3wK0+60G9ySnmAiARWKzxT0rE4JiY1vR3UnrY20/g/mDBjqjss
         vJtFFcSgUQd3K/+hv5N40WIwSHGWXaGTIr49bFA+aTHdRMQ+inPKjzzxiH4Ewl5fPuxH
         b23YYnYtMWRxOxR0arbPBtqS7ismrY/w5F2fY4IgmbP0JTCdFo3reqr5bMBq2o+FRlSq
         Bo5N8iiYg0627v1V7H5sAFy0fo772LR/84jlMPT5DQGnPR7z1qCIv9o4mKU6pc1id/aE
         ly3ZEDkI0Io6VRrIAOBaogRvx7gjfkqDXQR38Ud1CdK7FrpOE3j0CQyJ+fjrjtiJsA0N
         XtDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbo2tUmnPR0OOSpRpI/0DONg1DsxCYcmva6c17GIT0KThh94A1cRjzg/Q6PEEVFEN+C3W97+d2WVUP@alsa-project.org
X-Gm-Message-State: AOJu0YxS8nKzLskCEU00y1W8n+nuBWKdF3bEHobKe1aT6u/3qNgzmFK3
	wY2Jlu6ZM3O5eyTuAUxkVsr0JS3KW7PPHfq0kboezfdZo4fJtmsalDoiYDlp8w4=
X-Google-Smtp-Source: 
 AGHT+IGSWbnUX5pepZAtcaQL9h+8bQ2G+ar2GaP4ub1B1kbGdQfmXR5BpalUGXI74HFkbN9vCYhdIQ==
X-Received: by 2002:a17:907:6e92:b0:a86:79a2:ab15 with SMTP id
 a640c23a62f3a-a98f83d7a73mr142020366b.40.1727835635620;
        Tue, 01 Oct 2024 19:20:35 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:34 -0700 (PDT)
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
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback
 support
Date: Wed,  2 Oct 2024 03:20:15 +0100
Message-ID: <20241002022015.867031-8-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4TEEDEGUQ6MUMILOP5A7QEWEPHEJ3HG3
X-Message-ID-Hash: 4TEEDEGUQ6MUMILOP5A7QEWEPHEJ3HG3
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TEEDEGUQ6MUMILOP5A7QEWEPHEJ3HG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sound node and dsp-related piece to enable HDMI audio
playback support on Qualcomm QRB4210 RB2 board. That is the
only sound output supported for now.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7731681688d5..b8bc4452ca48 100644
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
@@ -103,6 +105,51 @@ led-wlan {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qrb4210-rb2-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+		audio-routing = "MM_DL1",  "MultiMedia1 Playback",
+				"MM_DL2",  "MultiMedia2 Playback";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		hdmi-dai-link {
+			link-name = "HDMI Playback";
+			cpu {
+				sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+		};
+	};
+
 	vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_HDMI_OUT_1P2";
@@ -318,6 +365,14 @@ &pon_resin {
 	status = "okay";
 };
 
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
-- 
2.45.2


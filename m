Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F82B264798
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 16:00:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1601216BE;
	Thu, 10 Sep 2020 15:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1601216BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599746402;
	bh=u4Vg6iP4bjp++uNFGotcVfZR9ekw0HQJHmdczKSG3SY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BVGOgtqnKxOaQBHF0aLFs9G/GoCwFZ5pd2q0hvlGMkYTk1YleV6j0vLjRLjMDZrqK
	 vOLqtqzZ095KKOWVtPs+95Hfw9/M3sMQaDAgxEIUB1GFaGUjSPLxnSCbkVRN7e+c40
	 lPuM+Bszu4q4cMooBWDd3M7sNJBfBr4wWJRTa9Ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 520C9F8028E;
	Thu, 10 Sep 2020 15:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0256FF8026F; Thu, 10 Sep 2020 15:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7AD3F80264
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 15:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7AD3F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BU07gu7R"
Received: by mail-wm1-x341.google.com with SMTP id w2so155664wmi.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p5LHymWJ1t58cRZI4MxwTqiMv3bCXN9LR4UYb0nY9Ks=;
 b=BU07gu7RbTwVUCaVgyCcrK6dlZRCQMCpP0JLqt4VxVj9PkiQON6snK8y8evDWZJ9C7
 G8ssLCUwz9l9RP5wku9eS6dKXlZIhl4KGyrHEFlyTNQ69idDig2PugrYXY+znUd1vB3n
 P+HKcxvKMEzj8muUBzw+37tSpBaGsPM2cSLlugb106UvcTJ3Loka58FbnEsk6KI//4mw
 Gg/WdilAn8NOl9yX2VwvHV+Sdx1/umi5ouYY7HKddcpPfWdWJaoN+6xF5nFE6H/xU4j2
 u4EIFHXYhKdPqomERJLcJd2EhDkZRnPG1C71B7pNw73aauNnYqSmM9YZiqKn17/MvTD+
 gIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p5LHymWJ1t58cRZI4MxwTqiMv3bCXN9LR4UYb0nY9Ks=;
 b=t8ZNv6GUnvRzuv35aue9kWC99WJCobFWA7M6e3B8zO/XYsb6Rp22fSfdTv6BFyKUgC
 IumINcZv3WrjxVZdZtFVds5HyWMqXLPq9BeDNEWE4qD2/ZiLXZaYPGujNFyhTibTqbq2
 OjanLwkJzFlCf4xH92oyB6ZfNUKzbdyHHtc9C8tDNPQGL3Z0JdPjg5n2RqMX3gYAWvfJ
 4I7d1dW5uygc29aAPBnb/RJPOcF+lb2gxhEDdn3I3uNTnao6TCP5q0SFsLamNnzyy5kj
 n7YNuLRs0taAJUefndHzmL9RmVW6oUVynhcjYnxoTGgT8wTGnbNlSBzFE/mLv5L76PfB
 Au0w==
X-Gm-Message-State: AOAM5333VgSbe7s/ZRtGGFhRTWBb1dZ3HHOOuGk0ciNNu3dD5+Vqj3Ne
 xr3kxnyTOMuOOXvpzVFuZEd+Xw==
X-Google-Smtp-Source: ABdhPJz8JPkdphleeGWLjFTULiHVBVjim7Pu1cJZNz2RZlrDgsKlArRXdMY8J0edNYU4G94ktur8Yw==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr138263wmk.86.1599746251701;
 Thu, 10 Sep 2020 06:57:31 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b2sm3786154wmh.47.2020.09.10.06.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:57:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org
Subject: [PATCH 1/2] ASoC: q6afe: dt-bindings: add q6afe clock bindings
Date: Thu, 10 Sep 2020 14:57:07 +0100
Message-Id: <20200910135708.14842-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200910135708.14842-1-srinivas.kandagatla@linaro.org>
References: <20200910135708.14842-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

q6afe exposes various lpass clocks controls via q6dsp q6afe commands.
This patch adds bindings required for this clock controller.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6afe.txt  | 23 ++++++
 include/dt-bindings/sound/qcom,q6afe.h        | 74 ++++++++++++++++++-
 2 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
index 4916dd6a0896..2d6fb2ea75a0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
@@ -98,6 +98,24 @@ configuration of each dai. Must contain the following properties.
 		0 - MSB
 		1 - LSB
 
+= AFE CLOCKSS
+"clocks" subnode of the AFE node. It represents q6afe clocks
+"clocks" node should have following properties.
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,q6afe-clocks"
+
+- #clock-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: Must be 2. Clock Id followed by
+		below valid clock coupling attributes.
+		1 - for no coupled clock
+		2 - for dividend of the coupled clock
+		3 - for divisor of the coupled clock
+		4 - for inverted and no couple clock
+
 = EXAMPLE
 
 apr-service@4 {
@@ -175,4 +193,9 @@ apr-service@4 {
 			qcom,sd-lines = <1>;
 		};
 	};
+
+	clocks {
+		compatible = "qcom,q6afe-clocks";
+		#clock-cells = <2>;
+	};
 };
diff --git a/include/dt-bindings/sound/qcom,q6afe.h b/include/dt-bindings/sound/qcom,q6afe.h
index 7207ab2b57bf..f64b5d2e6efd 100644
--- a/include/dt-bindings/sound/qcom,q6afe.h
+++ b/include/dt-bindings/sound/qcom,q6afe.h
@@ -130,5 +130,77 @@
 #define RX_CODEC_DMA_RX_6	125
 #define RX_CODEC_DMA_RX_7	126
 
-#endif /* __DT_BINDINGS_Q6_AFE_H__ */
+#define LPASS_CLK_ID_PRI_MI2S_IBIT	1
+#define LPASS_CLK_ID_PRI_MI2S_EBIT	2
+#define LPASS_CLK_ID_SEC_MI2S_IBIT	3
+#define LPASS_CLK_ID_SEC_MI2S_EBIT	4
+#define LPASS_CLK_ID_TER_MI2S_IBIT	5
+#define LPASS_CLK_ID_TER_MI2S_EBIT	6
+#define LPASS_CLK_ID_QUAD_MI2S_IBIT	7
+#define LPASS_CLK_ID_QUAD_MI2S_EBIT	8
+#define LPASS_CLK_ID_SPEAKER_I2S_IBIT	9
+#define LPASS_CLK_ID_SPEAKER_I2S_EBIT	10
+#define LPASS_CLK_ID_SPEAKER_I2S_OSR	11
+#define LPASS_CLK_ID_QUI_MI2S_IBIT	12
+#define LPASS_CLK_ID_QUI_MI2S_EBIT	13
+#define LPASS_CLK_ID_SEN_MI2S_IBIT	14
+#define LPASS_CLK_ID_SEN_MI2S_EBIT	15
+#define LPASS_CLK_ID_INT0_MI2S_IBIT	16
+#define LPASS_CLK_ID_INT1_MI2S_IBIT	17
+#define LPASS_CLK_ID_INT2_MI2S_IBIT	18
+#define LPASS_CLK_ID_INT3_MI2S_IBIT	19
+#define LPASS_CLK_ID_INT4_MI2S_IBIT	20
+#define LPASS_CLK_ID_INT5_MI2S_IBIT	21
+#define LPASS_CLK_ID_INT6_MI2S_IBIT	22
+#define LPASS_CLK_ID_QUI_MI2S_OSR	23
+#define LPASS_CLK_ID_PRI_PCM_IBIT	24
+#define LPASS_CLK_ID_PRI_PCM_EBIT	25
+#define LPASS_CLK_ID_SEC_PCM_IBIT	26
+#define LPASS_CLK_ID_SEC_PCM_EBIT	27
+#define LPASS_CLK_ID_TER_PCM_IBIT	28
+#define LPASS_CLK_ID_TER_PCM_EBIT	29
+#define LPASS_CLK_ID_QUAD_PCM_IBIT	30
+#define LPASS_CLK_ID_QUAD_PCM_EBIT	31
+#define LPASS_CLK_ID_QUIN_PCM_IBIT	32
+#define LPASS_CLK_ID_QUIN_PCM_EBIT	33
+#define LPASS_CLK_ID_QUI_PCM_OSR	34
+#define LPASS_CLK_ID_PRI_TDM_IBIT	35
+#define LPASS_CLK_ID_PRI_TDM_EBIT	36
+#define LPASS_CLK_ID_SEC_TDM_IBIT	37
+#define LPASS_CLK_ID_SEC_TDM_EBIT	38
+#define LPASS_CLK_ID_TER_TDM_IBIT	39
+#define LPASS_CLK_ID_TER_TDM_EBIT	40
+#define LPASS_CLK_ID_QUAD_TDM_IBIT	41
+#define LPASS_CLK_ID_QUAD_TDM_EBIT	42
+#define LPASS_CLK_ID_QUIN_TDM_IBIT	43
+#define LPASS_CLK_ID_QUIN_TDM_EBIT	44
+#define LPASS_CLK_ID_QUIN_TDM_OSR	45
+#define LPASS_CLK_ID_MCLK_1		46
+#define LPASS_CLK_ID_MCLK_2		47
+#define LPASS_CLK_ID_MCLK_3		48
+#define LPASS_CLK_ID_MCLK_4		49
+#define LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE	50
+#define LPASS_CLK_ID_INT_MCLK_0		51
+#define LPASS_CLK_ID_INT_MCLK_1		52
+#define LPASS_CLK_ID_MCLK_5		53
+#define LPASS_CLK_ID_WSA_CORE_MCLK	54
+#define LPASS_CLK_ID_WSA_CORE_NPL_MCLK	55
+#define LPASS_CLK_ID_VA_CORE_MCLK	56
+#define LPASS_CLK_ID_TX_CORE_MCLK	57
+#define LPASS_CLK_ID_TX_CORE_NPL_MCLK	58
+#define LPASS_CLK_ID_RX_CORE_MCLK	59
+#define LPASS_CLK_ID_RX_CORE_NPL_MCLK	60
+#define LPASS_CLK_ID_VA_CORE_2X_MCLK	61
+
+#define LPASS_HW_AVTIMER_VOTE		101
+#define LPASS_HW_MACRO_VOTE		102
+#define LPASS_HW_DCODEC_VOTE		103
+
+#define Q6AFE_MAX_CLK_ID			104
 
+#define LPASS_CLK_ATTRIBUTE_INVALID		0x0
+#define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
+#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVIDEND	0x2
+#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR	0x3
+
+#endif /* __DT_BINDINGS_Q6_AFE_H__ */
-- 
2.21.0


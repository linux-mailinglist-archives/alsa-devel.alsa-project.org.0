Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEFD122B6D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 13:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A871658;
	Tue, 17 Dec 2019 13:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A871658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576585557;
	bh=TfYVqEjFJO3Cseuql53pCDOx179GXM4At/p5W5Sgny0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWaBcgnBm/X5awbuRWj0jzMXlWaDyZpxyFZSh0LQEAsmlqCvvvRDfDqg7/Rsqrz1x
	 nbjdUHqGV0teQ3whkrl9S3ufvUaPlokIAz7daLk1YjHE/DvTfC4SB+2RH3QaGRmaZV
	 kxQJALsv7gCjk1R8rf7bXas9u01lTmondtgz1UXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E709FF80323;
	Tue, 17 Dec 2019 13:17:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAFE5F802E9; Tue, 17 Dec 2019 13:17:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,UPPERCASE_50_75
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFCE4F8027B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:17:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFCE4F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Csv5N6ve"
Received: by mail-wm1-x341.google.com with SMTP id b19so2702584wmj.4
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 04:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cc/Wcghptv17eVo74c8YLg74slbbKTTES3sc9U0AuPU=;
 b=Csv5N6veoj2DXMRJ4b4T+Uyo3ItiEBoEDkde79JpqXTWYMfE3gW83orBRYFznKVgwN
 JstDxID1gbl2qVyYOOhJ/onUeG135R/zEZ8Qm32hFzoDkeSk8m9TSY9gRgUitNHI4bVD
 PYktEEr59ZHVTsKCFibR/XyNITg3p5p9b5kgjsKRPkUkc6od8KWBHdpzMt3w/2V62pzl
 VBT2hyREv+dTKteSZxsTd/iCcbtcAcqAF/WjPzPnnG+5FopiZ9+7L9n6NO1hSrJQyIUW
 XYnXYCu0rZleMeiSLYfUf/T2n7JCk2JO/P6D1j4aq+eG8APAjaIWJLazGToHqPRU5+vA
 WUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cc/Wcghptv17eVo74c8YLg74slbbKTTES3sc9U0AuPU=;
 b=DP7M/evsnAeJPBjwFQ8t6hWonVjTCBMRf9xkk6D36f8UZF1e/WqHCySylI5tV/baYw
 VxDTcW6mEZi0y/xKKhve835eFlBGOZ40/xbtdTQUMVzkA8f++i1LR/3jTJTttkBWCpZO
 +wu9xK8ZY814C1yJgpBzB4yR2BagAAZMj2ZDV3GSsgoPfqyDY84nvmBFip68QOWCgIZ8
 +jjS7HLB4Dw39TK64EBpi96pr6UTfcl+bE40Hw4hsCrYZMX0efn5pKZGeBsidghz7T+u
 tL8RIH+NpRiHiqImcClMYTjNPfocwYp5dOc12n6CZpRoi+5PPMzVgwUjZZ+XFFo9B9ua
 gEfw==
X-Gm-Message-State: APjAAAUJxMHegdK9IsvS/r/swmuHFb1aArpeT5dGhLPKY/Z1kAIn4Fra
 AcDhkkfmQBnBq6tAG/ZW6ESDpQ==
X-Google-Smtp-Source: APXvYqy31hVm8tt1FgAppZ/jgEzJceEWmOJzbtOeRMV4bxnt44eJOCfaxG1xGPaBHrBFLXfZ2adthg==
X-Received: by 2002:a05:600c:23c9:: with SMTP id
 p9mr5253085wmb.160.1576585029412; 
 Tue, 17 Dec 2019 04:17:09 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f1sm25087270wru.6.2019.12.17.04.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 04:17:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Tue, 17 Dec 2019 12:16:38 +0000
Message-Id: <20191217121642.28534-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
References: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v5 07/11] ASoC: wcd934x: add audio routings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds audio routing for both playback and capture.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 290 +++++++++++++++++++++++++++++++++++++
 1 file changed, 290 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 24f78a0b7f5a..158e878abd6c 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -135,6 +135,162 @@
 	} \
 }
 
+#define WCD934X_INTERPOLATOR_PATH(id)			\
+	{"RX INT" #id "_1 MIX1 INP0", "RX0", "SLIM RX0"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX1", "SLIM RX1"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX2", "SLIM RX2"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX3", "SLIM RX3"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX4", "SLIM RX4"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX5", "SLIM RX5"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX6", "SLIM RX6"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX7", "SLIM RX7"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "IIR0", "IIR0"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "IIR1", "IIR1"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX0", "SLIM RX0"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX1", "SLIM RX1"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX2", "SLIM RX2"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX3", "SLIM RX3"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX4", "SLIM RX4"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX5", "SLIM RX5"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX6", "SLIM RX6"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX7", "SLIM RX7"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "IIR0", "IIR0"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "IIR1", "IIR1"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX0", "SLIM RX0"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX1", "SLIM RX1"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX2", "SLIM RX2"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX3", "SLIM RX3"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX4", "SLIM RX4"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX5", "SLIM RX5"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX6", "SLIM RX6"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX7", "SLIM RX7"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "IIR0", "IIR0"},		\
+	{"RX INT" #id "_1 MIX1 INP2", "IIR1", "IIR1"},		\
+	{"RX INT" #id "_1 MIX1", NULL, "RX INT" #id "_1 MIX1 INP0"}, \
+	{"RX INT" #id "_1 MIX1", NULL, "RX INT" #id "_1 MIX1 INP1"}, \
+	{"RX INT" #id "_1 MIX1", NULL, "RX INT" #id "_1 MIX1 INP2"}, \
+	{"RX INT" #id "_2 MUX", "RX0", "SLIM RX0"},	\
+	{"RX INT" #id "_2 MUX", "RX1", "SLIM RX1"},	\
+	{"RX INT" #id "_2 MUX", "RX2", "SLIM RX2"},	\
+	{"RX INT" #id "_2 MUX", "RX3", "SLIM RX3"},	\
+	{"RX INT" #id "_2 MUX", "RX4", "SLIM RX4"},	\
+	{"RX INT" #id "_2 MUX", "RX5", "SLIM RX5"},	\
+	{"RX INT" #id "_2 MUX", "RX6", "SLIM RX6"},	\
+	{"RX INT" #id "_2 MUX", "RX7", "SLIM RX7"},	\
+	{"RX INT" #id "_2 MUX", NULL, "INT" #id "_CLK"}, \
+	{"RX INT" #id "_2 MUX", NULL, "DSMDEM" #id "_CLK"}, \
+	{"RX INT" #id "_2 INTERP", NULL, "RX INT" #id "_2 MUX"},	\
+	{"RX INT" #id " SEC MIX", NULL, "RX INT" #id "_2 INTERP"},	\
+	{"RX INT" #id "_1 INTERP", NULL, "RX INT" #id "_1 MIX1"},	\
+	{"RX INT" #id "_1 INTERP", NULL, "INT" #id "_CLK"},	\
+	{"RX INT" #id "_1 INTERP", NULL, "DSMDEM" #id "_CLK"},	\
+	{"RX INT" #id " SEC MIX", NULL, "RX INT" #id "_1 INTERP"}
+
+#define WCD934X_INTERPOLATOR_MIX2(id)			\
+	{"RX INT" #id " MIX2", NULL, "RX INT" #id " SEC MIX"}, \
+	{"RX INT" #id " MIX2", NULL, "RX INT" #id " MIX2 INP"}
+
+#define WCD934X_SLIM_RX_AIF_PATH(id)	\
+	{"SLIM RX"#id" MUX", "AIF1_PB", "AIF1 PB"},	\
+	{"SLIM RX"#id" MUX", "AIF2_PB", "AIF2 PB"},	\
+	{"SLIM RX"#id" MUX", "AIF3_PB", "AIF3 PB"},	\
+	{"SLIM RX"#id" MUX", "AIF4_PB", "AIF4 PB"},   \
+	{"SLIM RX"#id, NULL, "SLIM RX"#id" MUX"}
+
+#define WCD934X_ADC_MUX(id) \
+	{"ADC MUX" #id, "DMIC", "DMIC MUX" #id },	\
+	{"ADC MUX" #id, "AMIC", "AMIC MUX" #id },	\
+	{"DMIC MUX" #id, "DMIC0", "DMIC0"},		\
+	{"DMIC MUX" #id, "DMIC1", "DMIC1"},		\
+	{"DMIC MUX" #id, "DMIC2", "DMIC2"},		\
+	{"DMIC MUX" #id, "DMIC3", "DMIC3"},		\
+	{"DMIC MUX" #id, "DMIC4", "DMIC4"},		\
+	{"DMIC MUX" #id, "DMIC5", "DMIC5"},		\
+	{"AMIC MUX" #id, "ADC1", "ADC1"},		\
+	{"AMIC MUX" #id, "ADC2", "ADC2"},		\
+	{"AMIC MUX" #id, "ADC3", "ADC3"},		\
+	{"AMIC MUX" #id, "ADC4", "ADC4"}
+
+#define WCD934X_IIR_INP_MUX(id) \
+	{"IIR" #id, NULL, "IIR" #id " INP0 MUX"},	\
+	{"IIR" #id " INP0 MUX", "DEC0", "ADC MUX0"},	\
+	{"IIR" #id " INP0 MUX", "DEC1", "ADC MUX1"},	\
+	{"IIR" #id " INP0 MUX", "DEC2", "ADC MUX2"},	\
+	{"IIR" #id " INP0 MUX", "DEC3", "ADC MUX3"},	\
+	{"IIR" #id " INP0 MUX", "DEC4", "ADC MUX4"},	\
+	{"IIR" #id " INP0 MUX", "DEC5", "ADC MUX5"},	\
+	{"IIR" #id " INP0 MUX", "DEC6", "ADC MUX6"},	\
+	{"IIR" #id " INP0 MUX", "DEC7", "ADC MUX7"},	\
+	{"IIR" #id " INP0 MUX", "DEC8", "ADC MUX8"},	\
+	{"IIR" #id " INP0 MUX", "RX0", "SLIM RX0"},	\
+	{"IIR" #id " INP0 MUX", "RX1", "SLIM RX1"},	\
+	{"IIR" #id " INP0 MUX", "RX2", "SLIM RX2"},	\
+	{"IIR" #id " INP0 MUX", "RX3", "SLIM RX3"},	\
+	{"IIR" #id " INP0 MUX", "RX4", "SLIM RX4"},	\
+	{"IIR" #id " INP0 MUX", "RX5", "SLIM RX5"},	\
+	{"IIR" #id " INP0 MUX", "RX6", "SLIM RX6"},	\
+	{"IIR" #id " INP0 MUX", "RX7", "SLIM RX7"},	\
+	{"IIR" #id, NULL, "IIR" #id " INP1 MUX"},	\
+	{"IIR" #id " INP1 MUX", "DEC0", "ADC MUX0"},	\
+	{"IIR" #id " INP1 MUX", "DEC1", "ADC MUX1"},	\
+	{"IIR" #id " INP1 MUX", "DEC2", "ADC MUX2"},	\
+	{"IIR" #id " INP1 MUX", "DEC3", "ADC MUX3"},	\
+	{"IIR" #id " INP1 MUX", "DEC4", "ADC MUX4"},	\
+	{"IIR" #id " INP1 MUX", "DEC5", "ADC MUX5"},	\
+	{"IIR" #id " INP1 MUX", "DEC6", "ADC MUX6"},	\
+	{"IIR" #id " INP1 MUX", "DEC7", "ADC MUX7"},	\
+	{"IIR" #id " INP1 MUX", "DEC8", "ADC MUX8"},	\
+	{"IIR" #id " INP1 MUX", "RX0", "SLIM RX0"},	\
+	{"IIR" #id " INP1 MUX", "RX1", "SLIM RX1"},	\
+	{"IIR" #id " INP1 MUX", "RX2", "SLIM RX2"},	\
+	{"IIR" #id " INP1 MUX", "RX3", "SLIM RX3"},	\
+	{"IIR" #id " INP1 MUX", "RX4", "SLIM RX4"},	\
+	{"IIR" #id " INP1 MUX", "RX5", "SLIM RX5"},	\
+	{"IIR" #id " INP1 MUX", "RX6", "SLIM RX6"},	\
+	{"IIR" #id " INP1 MUX", "RX7", "SLIM RX7"},	\
+	{"IIR" #id, NULL, "IIR" #id " INP2 MUX"},	\
+	{"IIR" #id " INP2 MUX", "DEC0", "ADC MUX0"},	\
+	{"IIR" #id " INP2 MUX", "DEC1", "ADC MUX1"},	\
+	{"IIR" #id " INP2 MUX", "DEC2", "ADC MUX2"},	\
+	{"IIR" #id " INP2 MUX", "DEC3", "ADC MUX3"},	\
+	{"IIR" #id " INP2 MUX", "DEC4", "ADC MUX4"},	\
+	{"IIR" #id " INP2 MUX", "DEC5", "ADC MUX5"},	\
+	{"IIR" #id " INP2 MUX", "DEC6", "ADC MUX6"},	\
+	{"IIR" #id " INP2 MUX", "DEC7", "ADC MUX7"},	\
+	{"IIR" #id " INP2 MUX", "DEC8", "ADC MUX8"},	\
+	{"IIR" #id " INP2 MUX", "RX0", "SLIM RX0"},	\
+	{"IIR" #id " INP2 MUX", "RX1", "SLIM RX1"},	\
+	{"IIR" #id " INP2 MUX", "RX2", "SLIM RX2"},	\
+	{"IIR" #id " INP2 MUX", "RX3", "SLIM RX3"},	\
+	{"IIR" #id " INP2 MUX", "RX4", "SLIM RX4"},	\
+	{"IIR" #id " INP2 MUX", "RX5", "SLIM RX5"},	\
+	{"IIR" #id " INP2 MUX", "RX6", "SLIM RX6"},	\
+	{"IIR" #id " INP2 MUX", "RX7", "SLIM RX7"},	\
+	{"IIR" #id, NULL, "IIR" #id " INP3 MUX"},	\
+	{"IIR" #id " INP3 MUX", "DEC0", "ADC MUX0"},	\
+	{"IIR" #id " INP3 MUX", "DEC1", "ADC MUX1"},	\
+	{"IIR" #id " INP3 MUX", "DEC2", "ADC MUX2"},	\
+	{"IIR" #id " INP3 MUX", "DEC3", "ADC MUX3"},	\
+	{"IIR" #id " INP3 MUX", "DEC4", "ADC MUX4"},	\
+	{"IIR" #id " INP3 MUX", "DEC5", "ADC MUX5"},	\
+	{"IIR" #id " INP3 MUX", "DEC6", "ADC MUX6"},	\
+	{"IIR" #id " INP3 MUX", "DEC7", "ADC MUX7"},	\
+	{"IIR" #id " INP3 MUX", "DEC8", "ADC MUX8"},	\
+	{"IIR" #id " INP3 MUX", "RX0", "SLIM RX0"},	\
+	{"IIR" #id " INP3 MUX", "RX1", "SLIM RX1"},	\
+	{"IIR" #id " INP3 MUX", "RX2", "SLIM RX2"},	\
+	{"IIR" #id " INP3 MUX", "RX3", "SLIM RX3"},	\
+	{"IIR" #id " INP3 MUX", "RX4", "SLIM RX4"},	\
+	{"IIR" #id " INP3 MUX", "RX5", "SLIM RX5"},	\
+	{"IIR" #id " INP3 MUX", "RX6", "SLIM RX6"},	\
+	{"IIR" #id " INP3 MUX", "RX7", "SLIM RX7"}
+
+#define WCD934X_SLIM_TX_AIF_PATH(id)	\
+	{"AIF1_CAP Mixer", "SLIM TX" #id, "SLIM TX" #id },	\
+	{"AIF2_CAP Mixer", "SLIM TX" #id, "SLIM TX" #id },	\
+	{"AIF3_CAP Mixer", "SLIM TX" #id, "SLIM TX" #id },	\
+	{"SLIM TX" #id, NULL, "CDC_IF TX" #id " MUX"}
+
 enum {
 	MIC_BIAS_1 = 1,
 	MIC_BIAS_2,
@@ -4678,6 +4834,138 @@ static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
 			   ARRAY_SIZE(aif3_slim_cap_mixer)),
 };
 
+static const struct snd_soc_dapm_route wcd934x_audio_map[] = {
+	/* RX0-RX7 */
+	WCD934X_SLIM_RX_AIF_PATH(0),
+	WCD934X_SLIM_RX_AIF_PATH(1),
+	WCD934X_SLIM_RX_AIF_PATH(2),
+	WCD934X_SLIM_RX_AIF_PATH(3),
+	WCD934X_SLIM_RX_AIF_PATH(4),
+	WCD934X_SLIM_RX_AIF_PATH(5),
+	WCD934X_SLIM_RX_AIF_PATH(6),
+	WCD934X_SLIM_RX_AIF_PATH(7),
+
+	/* RX0 Ear out */
+	WCD934X_INTERPOLATOR_PATH(0),
+	WCD934X_INTERPOLATOR_MIX2(0),
+	{"RX INT0 DEM MUX", "CLSH_DSM_OUT", "RX INT0 MIX2"},
+	{"RX INT0 DAC", NULL, "RX INT0 DEM MUX"},
+	{"RX INT0 DAC", NULL, "RX_BIAS"},
+	{"EAR PA", NULL, "RX INT0 DAC"},
+	{"EAR", NULL, "EAR PA"},
+
+	/* RX1 Headphone left */
+	WCD934X_INTERPOLATOR_PATH(1),
+	WCD934X_INTERPOLATOR_MIX2(1),
+	{"RX INT1 MIX3", NULL, "RX INT1 MIX2"},
+	{"RX INT1 DEM MUX", "CLSH_DSM_OUT", "RX INT1 MIX3"},
+	{"RX INT1 DAC", NULL, "RX INT1 DEM MUX"},
+	{"RX INT1 DAC", NULL, "RX_BIAS"},
+	{"HPHL PA", NULL, "RX INT1 DAC"},
+	{"HPHL", NULL, "HPHL PA"},
+
+	/* RX2 Headphone right */
+	WCD934X_INTERPOLATOR_PATH(2),
+	WCD934X_INTERPOLATOR_MIX2(2),
+	{"RX INT2 MIX3", NULL, "RX INT2 MIX2"},
+	{"RX INT2 DEM MUX", "CLSH_DSM_OUT", "RX INT2 MIX3"},
+	{"RX INT2 DAC", NULL, "RX INT2 DEM MUX"},
+	{"RX INT2 DAC", NULL, "RX_BIAS"},
+	{"HPHR PA", NULL, "RX INT2 DAC"},
+	{"HPHR", NULL, "HPHR PA"},
+
+	/* RX3 HIFi LineOut1 */
+	WCD934X_INTERPOLATOR_PATH(3),
+	WCD934X_INTERPOLATOR_MIX2(3),
+	{"RX INT3 MIX3", NULL, "RX INT3 MIX2"},
+	{"RX INT3 DAC", NULL, "RX INT3 MIX3"},
+	{"RX INT3 DAC", NULL, "RX_BIAS"},
+	{"LINEOUT1 PA", NULL, "RX INT3 DAC"},
+	{"LINEOUT1", NULL, "LINEOUT1 PA"},
+
+	/* RX4 HIFi LineOut2 */
+	WCD934X_INTERPOLATOR_PATH(4),
+	WCD934X_INTERPOLATOR_MIX2(4),
+	{"RX INT4 MIX3", NULL, "RX INT4 MIX2"},
+	{"RX INT4 DAC", NULL, "RX INT4 MIX3"},
+	{"RX INT4 DAC", NULL, "RX_BIAS"},
+	{"LINEOUT2 PA", NULL, "RX INT4 DAC"},
+	{"LINEOUT2", NULL, "LINEOUT2 PA"},
+
+	/* RX7 Speaker Left Out PA */
+	WCD934X_INTERPOLATOR_PATH(7),
+	WCD934X_INTERPOLATOR_MIX2(7),
+	{"RX INT7 CHAIN", NULL, "RX INT7 MIX2"},
+	{"RX INT7 CHAIN", NULL, "RX_BIAS"},
+	{"RX INT7 CHAIN", NULL, "SBOOST0"},
+	{"RX INT7 CHAIN", NULL, "SBOOST0_CLK"},
+	{"SPK1 OUT", NULL, "RX INT7 CHAIN"},
+
+	/* RX8 Speaker Right Out PA */
+	WCD934X_INTERPOLATOR_PATH(8),
+	{"RX INT8 CHAIN", NULL, "RX INT8 SEC MIX"},
+	{"RX INT8 CHAIN", NULL, "RX_BIAS"},
+	{"RX INT8 CHAIN", NULL, "SBOOST1"},
+	{"RX INT8 CHAIN", NULL, "SBOOST1_CLK"},
+	{"SPK2 OUT", NULL, "RX INT8 CHAIN"},
+
+	/* Tx */
+	{"AIF1 CAP", NULL, "AIF1_CAP Mixer"},
+	{"AIF2 CAP", NULL, "AIF2_CAP Mixer"},
+	{"AIF3 CAP", NULL, "AIF3_CAP Mixer"},
+
+	WCD934X_SLIM_TX_AIF_PATH(0),
+	WCD934X_SLIM_TX_AIF_PATH(1),
+	WCD934X_SLIM_TX_AIF_PATH(2),
+	WCD934X_SLIM_TX_AIF_PATH(3),
+	WCD934X_SLIM_TX_AIF_PATH(4),
+	WCD934X_SLIM_TX_AIF_PATH(5),
+	WCD934X_SLIM_TX_AIF_PATH(6),
+	WCD934X_SLIM_TX_AIF_PATH(7),
+	WCD934X_SLIM_TX_AIF_PATH(8),
+
+	WCD934X_ADC_MUX(0),
+	WCD934X_ADC_MUX(1),
+	WCD934X_ADC_MUX(2),
+	WCD934X_ADC_MUX(3),
+	WCD934X_ADC_MUX(4),
+	WCD934X_ADC_MUX(5),
+	WCD934X_ADC_MUX(6),
+	WCD934X_ADC_MUX(7),
+	WCD934X_ADC_MUX(8),
+
+	{"CDC_IF TX0 MUX", "DEC0", "ADC MUX0"},
+	{"CDC_IF TX1 MUX", "DEC1", "ADC MUX1"},
+	{"CDC_IF TX2 MUX", "DEC2", "ADC MUX2"},
+	{"CDC_IF TX3 MUX", "DEC3", "ADC MUX3"},
+	{"CDC_IF TX4 MUX", "DEC4", "ADC MUX4"},
+	{"CDC_IF TX5 MUX", "DEC5", "ADC MUX5"},
+	{"CDC_IF TX6 MUX", "DEC6", "ADC MUX6"},
+	{"CDC_IF TX7 MUX", "DEC7", "ADC MUX7"},
+	{"CDC_IF TX8 MUX", "DEC8", "ADC MUX8"},
+
+	{"AMIC4_5 SEL", "AMIC4", "AMIC4"},
+	{"AMIC4_5 SEL", "AMIC5", "AMIC5"},
+
+	{ "DMIC0", NULL, "DMIC0 Pin" },
+	{ "DMIC1", NULL, "DMIC1 Pin" },
+	{ "DMIC2", NULL, "DMIC2 Pin" },
+	{ "DMIC3", NULL, "DMIC3 Pin" },
+	{ "DMIC4", NULL, "DMIC4 Pin" },
+	{ "DMIC5", NULL, "DMIC5 Pin" },
+
+	{"ADC1", NULL, "AMIC1"},
+	{"ADC2", NULL, "AMIC2"},
+	{"ADC3", NULL, "AMIC3"},
+	{"ADC4", NULL, "AMIC4_5 SEL"},
+
+	WCD934X_IIR_INP_MUX(0),
+	WCD934X_IIR_INP_MUX(1),
+
+	{"SRC0", NULL, "IIR0"},
+	{"SRC1", NULL, "IIR1"},
+};
+
 static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.probe = wcd934x_comp_probe,
 	.remove = wcd934x_comp_remove,
@@ -4686,6 +4974,8 @@ static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.num_controls = ARRAY_SIZE(wcd934x_snd_controls),
 	.dapm_widgets = wcd934x_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(wcd934x_dapm_widgets),
+	.dapm_routes = wcd934x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd934x_audio_map),
 };
 
 static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC095AE756
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:12:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D1A850;
	Tue,  6 Sep 2022 14:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D1A850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466346;
	bh=YVfsMFCmmPEItesWO0ZYVH/8a5jK/QpIhB1DjBKrGHc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ggZxl1B8d1CCO7fOrEzfGVX6mN7kXaMxro/Cc+T5a0WLIgnYcn4DrsFEt/qzU6EmN
	 z8cXq7tejEeHsNmugwY6FG/N8ZsMT+bNgAeWEb1FIvEw2m+B4WCLdPzzwDNWaScRSa
	 3YQlz7Q+yIsjiHKiyv9i9xvhlZzW0IP0CqZkOML0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B25D8F8024C;
	Tue,  6 Sep 2022 14:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0679F80249; Tue,  6 Sep 2022 14:11:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89160F8019B
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89160F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xXp4wxSj"
Received: by mail-lj1-x233.google.com with SMTP id s15so12056088ljp.5
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=op1My7AD6wRZoajP6NjClBRCjufsM1FdrS7RvoXvXoM=;
 b=xXp4wxSjqmLI9WZ78W8Hd+I5B6ZuBukGMDbQlcYHzUwBV4WZ76GLEA0ZauVLPli9Ia
 JzOq1lrm56AojqHIIJrb7QDEedU4ei3JSR6105JOmjI9ayXH/hI9Hz0dr+PKOv1R6PyZ
 PKk8tdFesOgdAVy5Vbjqe1h3SZ+MGLedDrFPcol/LpHxmqBQXqh1y4on4Io/r/MtOlsx
 98mMKlO5TVDmH39X3lMn3E6BLuxaYqRUqfIEyDrQJnrlMHuPqBlbdb+aIZkUlLfCRjW1
 H8BPllT58gv0NCzSfmCJiidNBzce/qLZ7PAUkuUw5l8hVpfIBgSPZPwrSo5GXMg9RySo
 j1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=op1My7AD6wRZoajP6NjClBRCjufsM1FdrS7RvoXvXoM=;
 b=5w/QsJLFBwHcMcur4K+Yon051xQM/OFoIrOKiUmkbR7mIxcM1ITfRT2Ssd3C8FvfKZ
 AYi1kLLYCNPApKTMF63JLRFnS6eXU1DkGua1s7sg9HWEL0k8Q09J/yPeaHa8ExiViVpx
 ch4LLUlJg23nOkvFqnEybgP8ePxnmfOdbP0Kf9QMRaLcObUs3YRS7GLVtQEoYbVsS1c1
 KrZlv9dmyPJFXalo67pSheVrWHxFK+9XEDThYMSKoizS9CQDWFu7AgBEjRij/M8njUF0
 P9TocW5wKukr7hc/FX/LOoKVmoiqFROx0KghGNZa+UWo07q79GxRXsOSDlXM766MV8Zd
 SlBg==
X-Gm-Message-State: ACgBeo0C2G8ws4DWGzmjFLmXG4IBuFCE96g1xepJpURYT34qec/FJWQr
 DwEaXrRN//V3mQa3sFADBhfgHA==
X-Google-Smtp-Source: AA6agR7DVYxx5ldZwxSPHEQ+K6cIBOeh+9IU955p69IwfaOY+ubEBlSVsQXcCy60wL7W30N0ZZELXQ==
X-Received: by 2002:a05:651c:245:b0:261:caa7:5be3 with SMTP id
 x5-20020a05651c024500b00261caa75be3mr14972270ljn.334.1662466276582; 
 Tue, 06 Sep 2022 05:11:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 c23-20020ac25f77000000b0049462af8614sm1699122lfc.145.2022.09.06.05.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:11:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: qcom,q6core: remove binding
Date: Tue,  6 Sep 2022 14:11:10 +0200
Message-Id: <20220906121110.301900-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

qcom,q6core is already described in soc/qcom/qcom,apr.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6core.txt | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6core.txt b/Documentation/devicetree/bindings/sound/qcom,q6core.txt
deleted file mode 100644
index 5cd4cc9b1fde..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,q6core.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Qualcomm ADSP Core service binding
-
-Q6CORE is one of the APR audio service on Q6DSP.
-Please refer to qcom,apr.txt for details of the common apr service bindings
-used by the apr service device.
-
-- but must contain the following property:
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6core-v<MAJOR-NUMBER>.<MINOR-NUMBER>".
-		   Or "qcom,q6core" where the version number can be queried
-		   from DSP.
-		   example "qcom,q6core-v2.0"
-
-= EXAMPLE
-apr-service@3 {
-	compatible = "qcom,q6core";
-	reg = <APR_SVC_ADSP_CORE>;
-};
-- 
2.34.1


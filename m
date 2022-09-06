Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7B5AE7CA
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4939AE12;
	Tue,  6 Sep 2022 14:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4939AE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466839;
	bh=cXHOXb//cGCrmJ75tOZc1zbuQ4tKVmRxnpzbZhKbiOw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtnusHEOxmdpmah/SPUiwx7mBsnoBrY42fHrYvjcgsL20JRtwfYAUk2TJrNxBDEV/
	 OrBGfJaVlzN3+kRjghTAd7MRQ74R+JHGsqLRWSI94/EbBAcSPhkFuZzwcLnTpV8Cld
	 PQjGgQdIfc141Ei515fWFER/n9Mfsg8mY8gqOUs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D2BF80587;
	Tue,  6 Sep 2022 14:17:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7054F80559; Tue,  6 Sep 2022 14:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91717F80558
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91717F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AhIkh5FR"
Received: by mail-lf1-x131.google.com with SMTP id z29so17015735lfb.13
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pShykHWoNvg0r3Ewb/OZKB3QYRKzKfqFYZ0KOJ2rq3w=;
 b=AhIkh5FR6npoShM6uugzD5k9iK7mxV70+HUEAtdloIiU8B9We4/vxf/3jNzSLGnMum
 gncYJmVW9RdZFnAl85T4DD3LdTSI+uaknLF84FaRenmV5iKZoSEWfeBrAeZ0TG7/qVig
 PZBzlWPAQWJkeFpfQjslokSDQ69qFYDqFdUX5ywZSlxcEfp6/smXdBcfRy3X+ZhyMYKa
 ErYhr2dQBl6N2O40vJh8ePzCLF5EkxGqQ/BAXsqOzDiQgi0dUV7rgdHfXM+cY/vLUEY7
 pa0X5TsJSyLcTFQbwBb9JRfXK7mhNcrnbfzCtgu/6rPugtabxVcbErnUxSynBAusmM9D
 U6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pShykHWoNvg0r3Ewb/OZKB3QYRKzKfqFYZ0KOJ2rq3w=;
 b=2G1uQOHmKrB87c8z3Hxq6+pF503P+mKqzF/xZiyHUsXOUrHYclzfRQc8HOX9CPbBBr
 hZdxNPjOYg5XZ2wnaX2FE0uqRtgiHBA97kf2GZsvuUEZV3MRUTBGlg+db5PCKPjKAR08
 stVXXrhMArTLqAMxjXUXIjKKynwPtZMZdqEa51rX3+3eF6G7nYpcIdW7vt0TWIGEADH7
 Je2FY8E2jik+sgW2mBHOXCxQbHUa6U8dVDd45Ja70IakIJG4c1yymNgcKcPGWNi+I47U
 QjudJ7fHLGr7I0TednAa8MAh3/LmJJJUgyLBf1i8WZOwtv4MClwwo6HlVGZDILTQBtrR
 FSHg==
X-Gm-Message-State: ACgBeo22lYjtupv3rT6v5MM2l3px4E1FZqFICLQm1YNu6YcCnemE/myp
 zMTF/jb37m/srfapf24VgYxm1w==
X-Google-Smtp-Source: AA6agR4qr8s28dZedBmuzdp0myoMb7Xb/7ljIivdwwXHXPEKQ4N3LJ7PzASOXM9daVOBYG3plOAM6A==
X-Received: by 2002:a05:6512:159a:b0:492:8c61:1991 with SMTP id
 bp26-20020a056512159a00b004928c611991mr16402938lfb.245.1662466631431; 
 Tue, 06 Sep 2022 05:17:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 10/12] ASoC: dt-bindings: qcom,
 q6dsp-lpass-ports: cleanup example
Date: Tue,  6 Sep 2022 14:16:53 +0200
Message-Id: <20220906121655.303693-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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

Cleanup the example DTS by adding APR compatible, using proper device
node names for services and fixing indentation to 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 5e666d9fb388..9b5b53d1edf1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -153,9 +153,12 @@ examples:
     #include <dt-bindings/soc/qcom,apr.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     apr {
+        compatible = "qcom,apr-v2";
         #address-cells = <1>;
         #size-cells = <0>;
-        apr-service@4 {
+        qcom,domain = <APR_DOMAIN_ADSP>;
+
+        service@4 {
             reg = <APR_SVC_AFE>;
 
             dais {
@@ -165,8 +168,8 @@ examples:
               #sound-dai-cells = <1>;
 
               dai@22 {
-                reg = <QUATERNARY_MI2S_RX>;
-                qcom,sd-lines = <0 1 2 3>;
+                  reg = <QUATERNARY_MI2S_RX>;
+                  qcom,sd-lines = <0 1 2 3>;
               };
             };
         };
@@ -178,6 +181,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+
         service@1 {
             compatible = "qcom,q6apm";
             reg = <GPR_APM_MODULE_IID>;
@@ -189,8 +193,8 @@ examples:
               #sound-dai-cells = <1>;
 
               dai@22 {
-                reg = <QUATERNARY_MI2S_RX>;
-                qcom,sd-lines = <0 1 2 3>;
+                  reg = <QUATERNARY_MI2S_RX>;
+                  qcom,sd-lines = <0 1 2 3>;
               };
             };
         };
-- 
2.34.1


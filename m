Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE625B4562
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8592D1697;
	Sat, 10 Sep 2022 11:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8592D1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801009;
	bh=6vyMm5pP4lUsOvLg2kNznGbVUXIDk+XoqFbW/LztLQ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GLRweyz2gY5fE5EOoe0ZgRAwgR+f8i3UAzt74BT5NNAW6oC4hod/LoLMdOzyxc9W4
	 eGhRQxBQOxixDH21EsISxXbPIxea8aD2nJFFds9rmvgMv2EGlm97c3bjz4MFWAwWsA
	 BGutNh+GKJqZZ/Ah+sSYZ6arzdbVOb8EK+CNiDmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE3B9F800B8;
	Sat, 10 Sep 2022 11:09:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A278F8042F; Sat, 10 Sep 2022 11:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F8C2F800B8
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F8C2F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="D7lvpBa0"
Received: by mail-lf1-x130.google.com with SMTP id i26so6665729lfp.11
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ZuuwgMgWZdLoQrFrciWoob85mt2oidbKv+Fs5nLorLU=;
 b=D7lvpBa0OM2v483NJSAEmhXZpFZw85H62yQlnE1xUaS/R5kScSmkTe0rYvjcqqc80z
 goHwh8vzRFL9X4sbCE2sWNtNgszbOtNXi+1FGPWGk2nH8n694oZ2W36pe2kYW6O/bhuB
 KtykgK6iheKISgYAQXEe1k5MkjAoUEZGoe9fmFXE8DGLaQKA2eLcs4tjyb204ZyWsI3U
 xRRCvJWu28+jD8mz5pZPpERVTK9hnxQik7dlY+HLZVzvO+xouGjae2KaEPwhSXC0ohvD
 0FmRgWzZ40MWwxQCprWXb4RKOQypJbjTpjD3kQamfMHwzca3epphmRkDMQLMr4QeAo5k
 7a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ZuuwgMgWZdLoQrFrciWoob85mt2oidbKv+Fs5nLorLU=;
 b=ye0JeLesI6qWt3AybJpIC+7HghTTgJaX0i4hlAXM0lR+CUVN1EvK82byZEUiS5piFI
 JyTONM5j4hjGI1Hv/hSaqyih4tx4Aevz2/niqi2rcFxs9dRYzlZDOGe+X4dxA/rwhFlO
 1cvivQWCmtODdX9PaQZkLYitGA5njzBDpuyiCN99LUANHmrDOmkpwBJeJlSZw+hnRLOt
 xjpQMcvRmTLQq2y9nxoATFKiX+6EkSYFlhvasldblatWFw1FkSjsbUZrxxxyccUB0IJG
 qe5WxLsFucAC29QdJYgQWdgsYY3E5yVKlhe15XEzaT3JNzD+kydC9Zv22TGov+4m+f1P
 YhcQ==
X-Gm-Message-State: ACgBeo1FLHHDC6Qd6d61+WBi80A9GBtqH3oH2hLx9/lK0lVQNrLzebkX
 iVtUyewD13mDytivPRIDZFK+rw==
X-Google-Smtp-Source: AA6agR57Mnkr7zHXYRcCJwAmGEe1GabSx2cHHL3x4HqQ+6NQFNGed0q/+0WhZQTzoRJKylo4QscqeA==
X-Received: by 2002:a05:6512:239c:b0:497:938e:2c99 with SMTP id
 c28-20020a056512239c00b00497938e2c99mr5503975lfv.416.1662800940013; 
 Sat, 10 Sep 2022 02:09:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 k7-20020ac257c7000000b0048b23c609c9sm197338lfo.102.2022.09.10.02.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:08:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: qcom,q6afe: remove binding
Date: Sat, 10 Sep 2022 11:08:56 +0200
Message-Id: <20220910090856.49271-1-krzysztof.kozlowski@linaro.org>
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

qcom,q6afe is already documented in soc/qcom/qcom,apr.yaml.  The
version-based compatibles ("qcom,q6afe-v<MAJOR-NUMBER>.<MINOR-NUMBER>")
are not used (neither in upstream nor in downstream DTS).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6afe.txt  | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
deleted file mode 100644
index bc6b5f1fe4f1..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Qualcomm Audio Front End (Q6AFE) binding
-
-AFE is one of the APR audio service on Q6DSP
-Please refer to qcom,apr.txt for details of the common apr service bindings
-used by all apr services. Must contain the following properties.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6afe-v<MAJOR-NUMBER>.<MINOR-NUMBER>"
-		  Or "qcom,q6afe" where the version number can be queried
-		  from DSP.
-		  example "qcom,q6afe"
-
-= EXAMPLE
-
-apr-service@4 {
-	compatible = "qcom,q6afe";
-	reg = <APR_SVC_AFE>;
-};
-- 
2.34.1


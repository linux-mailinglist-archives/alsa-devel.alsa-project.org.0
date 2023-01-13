Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C58669D95
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 17:23:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12DCE6BAA;
	Fri, 13 Jan 2023 17:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12DCE6BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673627029;
	bh=Z4oDwHkHPTvOWGo2/BGKJ4VE8eCKBifMlKZSiY2yEUU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l+5XU3klQ0QPa97yaw7DEZ0UIPzVHClGCk2uVAv94L4/eCsrZ1l05e95DXjFLfi8B
	 MUhIDuF6RrCawirywQ5OC6zNoCuWLNajwApyuf50kWYqpPhs68nmFLc6iQqVej3aac
	 2qHxGFnP17XQd3ox3fhuhPk4w5dWa/RG9ZfZtipc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F5A4F80539;
	Fri, 13 Jan 2023 17:22:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FCF0F804A9; Fri, 13 Jan 2023 17:22:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5785AF8030F
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 17:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5785AF8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=M0oeeTuT
Received: by mail-ej1-x62d.google.com with SMTP id l22so23764091eja.12
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 08:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qphHuiI3995fMsqnotERxhZjaBqWPqwflOdlSfg7u7A=;
 b=M0oeeTuTJxcCGIov8N7a9cwJEF4PjtMbQry9x4/Ou4MJXCTqdNMqWZr6QMBzxEvR3Q
 /o2AX3Wgl5g/LLXrR5xx1Eqqlnnnk0xz2r3wX1kagWU0kdGGXqJM5LLjToKoZ0RCg3YS
 p5Mx4oi8ib1cMAX2BoxdZifdW8Wtv+iAXKXUVhSMAFcbIMQ1bkBa12/uDXMOGZDtXUJs
 6bgrTY3h5uXShC9oOArHaau4Ps5tLxOhrV4kDx34vuq/zuMZEhFflJmn6IkLSDPR3YK7
 uoZFUrQs2ipkn6EgPcQCCJ5zTBEiCytplQS/Oi8PB/TWMKUvOo7EkFzetCxVDWC2aaba
 ooNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qphHuiI3995fMsqnotERxhZjaBqWPqwflOdlSfg7u7A=;
 b=EZZUDGI9PVjuQsz980NxSHSIFT7Gb+8gvAXDpSCUDEBoKDNeOQqKTxeoZtuH+TSGTP
 r1jZnMibmLP89o4L7O2XbjrLw2SvVhpD5iU8Lrcu1gpopkeRXVhwq7yCoFHR2nCU6nt/
 6Wp50e2Oic34/Uohuqeyv6tMbyNDK1FYeh435LFQSX5XM0JIX2zuguwIT3/kTO9EKxp4
 a5wLkgsGs5KWyAdxXIqVCTpoJoQ07uVxyL5UWilAhsXjhaP0kKNSB34TWgeCtSFsOm0M
 USYePiKyX85Ltzs64sdHx93VIKYqt0VxbW63uPwSqDi78GZF8jyauHnUth1+vJlPhPB6
 G0KA==
X-Gm-Message-State: AFqh2krMdpLvlGai5QcVtksADtbNb9agh23oPVpfehAikEfD5C5VteQo
 elA3MlsQOG4MBlD8KlSx07HJ3w==
X-Google-Smtp-Source: AMrXdXtz10DQ/GMKG5X8oHVUlAN1dqCKvaugAKT3DKU7zmqlYytG/RBEMle5ksnPhyux6qTtte0urw==
X-Received: by 2002:a17:906:eda2:b0:84d:4712:9c42 with SMTP id
 sa2-20020a170906eda200b0084d47129c42mr19114978ejb.56.1673626940618; 
 Fri, 13 Jan 2023 08:22:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 o11-20020a170906768b00b0084d242d07ffsm8376737ejm.8.2023.01.13.08.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 08:22:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: dt-bindings: qcom,wcd934x: Describe slim-ifc-dev
Date: Fri, 13 Jan 2023 17:22:13 +0100
Message-Id: <20230113162214.117261-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The "slim-ifc-dev" property should not be just "true", because it allows
any type.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index 184e8ccbdd13..39b27126cfc1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -28,7 +28,9 @@ properties:
     description: GPIO spec for reset line to use
     maxItems: 1
 
-  slim-ifc-dev: true
+  slim-ifc-dev:
+    description: IFC device interface
+    $ref: /schemas/types.yaml#/definitions/phandle
 
   clocks:
     maxItems: 1
-- 
2.34.1


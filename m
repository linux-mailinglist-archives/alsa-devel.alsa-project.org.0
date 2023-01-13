Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A935669D8F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 17:23:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8156BD7;
	Fri, 13 Jan 2023 17:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8156BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673627002;
	bh=7igi3QXwPJz6wzBQj26BT//kmqhniZAOlj7qDJhZfJo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nGrEq/fS3hIjj5gqBi89cMnVovLSo/LoUprcg2pAXzIjTTlTHdaj6YfkUhWbxibnP
	 jqWUZLQBil0+BudxUki6R4Ij2SGj+esIvgh/w87ga1HNAHGkOFOK+schPEF51xMmdM
	 K3C2SbDlabqI7IjB1DcxOo/usiG0CoP6hH734id8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F7ECF8019B;
	Fri, 13 Jan 2023 17:22:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AED39F8030F; Fri, 13 Jan 2023 17:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C533AF8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 17:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C533AF8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yz/Vebqf
Received: by mail-ej1-x62e.google.com with SMTP id mp20so6867410ejc.7
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 08:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M9oKZpLB3KLxNjht49zMQ5zevFbZ/bcUUbDkM3FfyYA=;
 b=yz/VebqfEp1bmhZjr9FNC1ihtfQnR9SeGG3hAJziFTTvriFYLQCyTY3TTjL93C5MKA
 hla/sInL4jnIB1nKZJAyFRBaHSvNdGSCqqZ1I7hDPhrRKfuTr+RoZB1E0MKx7oZVY64h
 iKU+DDNYQwUUUhZ92UbsIUHk8by803W17KKNdpFFLyZgiCP0zpkV0zdfePV1+aUnlNHc
 6vaJvgT3KNT60pZ6cszElSPhqfX9BBB4po46IhOvJkB6fmZ8MogstCBzywuA0vKjrhle
 hSB+ykAAJ6lFL+C/Tnf1soGmRB9OLBE4I3n0/uFJOonGnzDcY/PYQW1z6MZUl6Se2Ndm
 garQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M9oKZpLB3KLxNjht49zMQ5zevFbZ/bcUUbDkM3FfyYA=;
 b=58jcr5je9YMgGtpG/5JlEkFCYr8e8UoooL3TqMxaCQA6BazdPZZY4gXzZBxcVoRqdE
 HL7++C1qb0aDupHpKh0frDSiAX8VNjci/YN/+qBK7orOhcfU5oP1024KKpGkbSMFy7p5
 Q4cMKZGGPxS/R15y7P24sdvQIAh+7OZY+V7DHleM7/ETBihe+aG0igjWUrbU33T11pbL
 zeSRq6faaDLzvvfC6aOI+VVseAmm9lbVLpvf+Kh/KXV+cdYrjcXyhN8ouVYeJXAw3GHz
 kBrQQbA7AyzEddv2WJ3NBXqa11qum04gz8MTEIimlMFzZmUDNdGszp5VqmD85NZ40Vlk
 6Kow==
X-Gm-Message-State: AFqh2kotcaKKtXvaWvSNnd2AkDPQ6ZvEKdA6ayU4LvubORc3pJQOFDbx
 uSPSylj1xi+mU+vEW5sOlpHv2w==
X-Google-Smtp-Source: AMrXdXvd45K78hFtMbn/TLgUzGtyghVKPnuwBJk4k2UCCXd5I59g2iRZLy7eqsLZ58B/VpDHcrS18Q==
X-Received: by 2002:a17:906:7fc3:b0:7c1:10b8:e6a4 with SMTP id
 r3-20020a1709067fc300b007c110b8e6a4mr65343071ejs.19.1673626938650; 
 Fri, 13 Jan 2023 08:22:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 o11-20020a170906768b00b0084d242d07ffsm8376737ejm.8.2023.01.13.08.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 08:22:18 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom,wsa881x: Allow sound-name-prefix
Date: Fri, 13 Jan 2023 17:22:12 +0100
Message-Id: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Reference common DAI properties to fix:

  sdm845-db845c.dtb: speaker@0,1: 'sound-name-prefix' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index d702b489320f..ac03672ebf6d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -15,6 +15,9 @@ description: |
   Their primary operating mode uses a SoundWire digital audio
   interface. This binding is for SoundWire interface.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: sdw10217201000
@@ -39,7 +42,7 @@ required:
   - "#thermal-sensor-cells"
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6217868C56C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 19:09:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5264F7;
	Mon,  6 Feb 2023 19:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5264F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675706956;
	bh=Pq8s/+VCVG64q0dCUQnzaQtErBPNflLgZMosQZOMvDE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YszgiGNgUpXAl8s3MsHL32y/D+66OqjCr6bBuUOWcc1jOQ+yJ+3rz4d0mLK3Ad0iI
	 MZ5XPUm9hSGvNHpeMvBJ0pZ0xFWDE5fxi+JvO4rUmZ5iBLM9DU2pRu4ZIAzMJOzURJ
	 YfnZoOo3+BPY67E0Xq5YAejG4TBT5cd5GYHwywus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D682FF800F5;
	Mon,  6 Feb 2023 19:08:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 933C8F804FF; Mon,  6 Feb 2023 19:08:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C178F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 19:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C178F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=z0TFKQ6w
Received: by mail-wr1-x42c.google.com with SMTP id j25so7675730wrc.4
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 10:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N1rv0t43J6tKvWo934ap8gxxkbzw40bp71nO/z+5p0I=;
 b=z0TFKQ6wxNXvFSlJcaVakmDWnbGR/+iJXLF2oFmqKp29Ueu6m6nqNk2o7/iL8wgxvY
 EiLsTkG4zgCCyEgeHp/8e/eaoesUWu45pH6P+i4tGN5tvI2kefCMIgUrmUdzXuFkAO0B
 inpMmoHXLU32kd2oYOaZGkKwRkYkl9k//4mYKghDLGD3EyDQ++NCeczGaSm1dVxpKtKb
 1yO5VKJ7kmijqhzLjomihD5pnJCOlD8Mw4ztgn3vZBw9iiPn5/W9qfTZrB3dki+8WrnS
 q3qYkAIdmKpiDzdJAJRqVQtnGnzTGQellaTLr+iVWEhUgGfzdFDsz9Q+o2OuGkJvm3wm
 clmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N1rv0t43J6tKvWo934ap8gxxkbzw40bp71nO/z+5p0I=;
 b=JkpablzlD0wsWnAtUHbvRjej+x0fHDacCPd3o4CAzgUYcjZ9z9Ogj1XE+mhBh4dW8q
 QSD3Ebed4NmBHMd4dTKCgA36UlhIXET2XWw+UVXB8CvwAB3RhVe4MmrETfPGpm8VCHXa
 jaNqxUHGlT3li+ZMmKmip7kq9cGEJhcmXsKOFOlVUr4z8tzTVg9ioURy2u8GzqXQc65r
 wSPLVWpJQau85GRIEOZNDHFxwE18LTePhSUJ+qMq8rNsOEjrPosX5YJiDtUyjIDAs8nd
 Y4Dw60yCsWWTQ6ggolhmT8LgdG4RjkwqFuuCGdPXaiYMTkCwWzA7dN2cfBPsm5JphRgJ
 Qegw==
X-Gm-Message-State: AO0yUKXccKB3WaWJeaV/2EjFqxdcJnUm7JHEnmnu26mD2iI2lV+qfrq1
 qIGZWV4eKx3g4G+tlF8UFC9bcw==
X-Google-Smtp-Source: AK7set8ElkzR+jxlBPw1USAVyiw1jBgLmw4dM3/TvWW35hELqxj8QCQwrOAuiEZ0m1ZbVVIulr+hEw==
X-Received: by 2002:a05:6000:789:b0:2bf:cb91:a40a with SMTP id
 bu9-20020a056000078900b002bfcb91a40amr16979292wrb.46.1675706888435; 
 Mon, 06 Feb 2023 10:08:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c3f1214e33sm365451wrw.100.2023.02.06.10.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 10:08:08 -0800 (PST)
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
Subject: [RESEND PATCH 1/3] ASoC: dt-bindings: qcom,
 wsa881x: Allow sound-name-prefix
Date: Mon,  6 Feb 2023 19:08:03 +0100
Message-Id: <20230206180805.6621-1-krzysztof.kozlowski@linaro.org>
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Reference common DAI properties to fix:

  sdm845-db845c.dtb: speaker@0,1: 'sound-name-prefix' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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


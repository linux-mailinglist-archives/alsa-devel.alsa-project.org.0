Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552CB6B4052
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:24:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D7417F8;
	Fri, 10 Mar 2023 14:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D7417F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454643;
	bh=pMXK2nU9TDhsMNF2O0ysGc2eN8QSKaEidbOTfNnAhHo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ELTYKFZo9gpletBFkcjXQVQjTiQWaApoKQcvZOdDw6rKRz9IBjtKZOBAclUBqsf2v
	 5TF9yEuipGqYwKNasZiqYmAgQkr4PoticSrQbcUqfvJmYtTq3ccDUOXeqYP8aXGAe5
	 LVAIZ1dRXkVlJhxPAyGMIEzcg0PJWbqopnqP7HDI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD02BF80520;
	Fri, 10 Mar 2023 14:22:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE1FCF804FE; Fri, 10 Mar 2023 14:22:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 607C2F80236
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 607C2F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QWRaO46r
Received: by mail-ed1-x535.google.com with SMTP id j11so20364252edq.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcXL6MCdOOilzj/9V8Bxhr6PgZvPsGUvEZbtUrf8CA0=;
        b=QWRaO46r5Vlo+LFpfEj41+oWL74m9vY9Ye1RziJsp7mkHfJg357wAQjE6BSqZxl1OP
         WBeQSKR+I0Vz4KemBZidBqo0sdYi30BB7QngnRQtPNPX9izS42xhL4QrpBlEpSMyS1La
         aCMC7sHmtJ9rov8CDTNGUPFBvGl0guj6xQ64aQOx50BOrKAOoADxn6xhQY0nsw40jBnO
         7/yQ5OD8flLzXTkCHyfpRE4L200L6IxelwR7ynIAw5dVdpqoomUVZbyUMDvUKwVFskTc
         UdMTONwoarGEBF554WPMXmeWNd5fnI/gHGkGRiBPJGilCR9hYZj4bgMgX9KTmc2fBJGZ
         gm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcXL6MCdOOilzj/9V8Bxhr6PgZvPsGUvEZbtUrf8CA0=;
        b=Pj0NZLfYXfuZLPuKeuEMOwYEd8aWtKGcFR0aur/d9m4FBdiNFU9nyJHwZx9GB6jjp9
         1R+Ek3uJeE3UiYAFfQQAuCxiPDDG/7w+N4H3CKBzVCuBfVu0rDidH6XvBScdSCdox0LW
         B5V2bEen3X+IkabGruWhaCRIUnpyUj5pM+3VGH81bdh2rh90LLOF7L3kC+OkwqGh2qPj
         1HPsn4ektcAUVOv6Byz6YptvFMmCk1cqDSF7yyZ4YncwNFXD1nZrHMtkxkxrhvFQnv5f
         O8RxzhbiGEWlQBTmQXVqigh1CevSIi5zyP2zUyPaEz78deTSzccRvfri3feF1aqTcVwp
         LvDw==
X-Gm-Message-State: AO0yUKVRlhl/UrdmoXw9QZ6O8naeyzi83bai0cUrG8p5iAg7SkudGVzI
	euoGpSphBRHXnajK9moA6vzatg==
X-Google-Smtp-Source: 
 AK7set86DEihjYozkYNfs2JVNMeu/cjpWbEQPkrPICoAQV9Zd2V3aoH5znXQFvekHR3LgD1deH2NWA==
X-Received: by 2002:a17:906:32d9:b0:8aa:bf4e:7b2c with SMTP id
 k25-20020a17090632d900b008aabf4e7b2cmr26777378ejk.21.1678454526446;
        Fri, 10 Mar 2023 05:22:06 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX
 macro
Date: Fri, 10 Mar 2023 14:21:54 +0100
Message-Id: <20230310132201.322148-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IH5HTYLDB5SCYQCZPAHLE45UKIMWT2KY
X-Message-ID-Hash: IH5HTYLDB5SCYQCZPAHLE45UKIMWT2KY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IH5HTYLDB5SCYQCZPAHLE45UKIMWT2KY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the RX macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 8b3d617a9578..0ae3c81abdf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-rx-macro
       - qcom,sm8250-lpass-rx-macro
       - qcom,sm8450-lpass-rx-macro
+      - qcom,sm8550-lpass-rx-macro
       - qcom,sc8280xp-lpass-rx-macro
 
   reg:
@@ -92,6 +93,23 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


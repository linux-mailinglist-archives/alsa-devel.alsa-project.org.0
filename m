Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA70740123
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:28:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5ED185D;
	Tue, 27 Jun 2023 18:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5ED185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883333;
	bh=lErWU6dobB0XeId/RGdHSYC+Fh+f5HQU6i/ZQfWoHV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PDPnvvETSoV5+wYLt1pniUChaYTmRqhMlnIXDYa3tgQSGnK/tYeq2sVHd2A7ngAvY
	 POpXB4aZa5hGXqcUyrx5PGpBraX9UYL3lUXZiqgBDozlU9hwKzSMZwIkZ2TRYcFBEZ
	 DdJfcCRv+HNVMl6MJU5xJuQNSTi+gRf51gpC2/9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8A84F80558; Tue, 27 Jun 2023 18:27:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECF4F80551;
	Tue, 27 Jun 2023 18:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 868FDF80093; Tue, 27 Jun 2023 18:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01DB5F80246
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01DB5F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gPQ+01eM
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fa08687246so4695107e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883092; x=1690475092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apFUalLZyQqWq0aQwYgxypM+yPAfzDeJRJiPTT9OzgQ=;
        b=gPQ+01eM8GOGBERecL3B/NIxhQbrVmrrFXxYZiCCONOF7/F61cH5oZ4S7PViK0H9X3
         yXr/dkivL6tpoBinlyPIzXzeVhamwTu8Oo4+oDsjDo9mxhFy9Kp7iTj9zqBShJlvW5Sr
         3XZeOtU4fWRTMlxkBRNd1kkaaCf27QvN1bclNG3WoJmKIpIgQhZ03uKOPZvd7hIT0PGY
         azP7RD8WQQxDUWPpOCyYB/heKlw/sQWav43VkZQQ4ykMqIbGoZPA/wnM17Ra7uPnIX5m
         nrtp2FldB8AQvrSjYItV9pKqMHKA5lejbTU0yr8PwlU1APcwlIwpaSCeeMY7VuNPD0vN
         kayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883092; x=1690475092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apFUalLZyQqWq0aQwYgxypM+yPAfzDeJRJiPTT9OzgQ=;
        b=EafwZco3OPmaRCB+EgWRbfICFfNbtYsg5K3ja5RZMDMnZBryOU4P+zB+kQxHzkMwdR
         zI+eEKWyiErLLaxeHEiK5J0iutkSjgEKZLr5lzHtqbMRjUg2nKlPyQ04UfjTIFoPNZ7W
         4BG6OVSLtX196SidfZyBDig1n019ot9gZ/Z87dBXcptz1c+YvMLubRZ1feSyDKX5HWIe
         LRs6xeW/wSIerknj1GvEQorMCzyMur2kaZUnrJdGufLjcz5uXjNcpUP4e+Rt6gNjs1oh
         POjahmzz4QWjuPZcTSirMPko9WljDmRwYwLQqey8xe4bJMyEEm2/Oy26LFgG9kd68xgn
         pccw==
X-Gm-Message-State: AC+VfDyKXOYripwNqr7Vel0lLn7pcVwcopdFRcdkzs4FYV56cTEzSFON
	ByJFSl4zUg6UUlfPyGqAc1nn8Q==
X-Google-Smtp-Source: 
 ACHHUZ4atKHp3LY0BnQtuVG83sCZJ0bHCYAJTWN9stucrksa1utFdi1jhZ+5jdferRA74CWyuyxYjw==
X-Received: by 2002:a05:6512:234a:b0:4f9:607a:6508 with SMTP id
 p10-20020a056512234a00b004f9607a6508mr11552003lfu.50.1687883092611;
        Tue, 27 Jun 2023 09:24:52 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:22 +0200
Subject: [PATCH 06/11] dt-bindings: mfd: qcom,spmi-pmic: Reference pm8916
 wcd analog codec schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-6-6b4b6cd081e5@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
To: cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Benjamin Li <benl@squareup.com>, James Willcox <jwillcox@squareup.com>,
 Joseph Gates <jgates@squareup.com>, Stephan Gerhold <stephan@gerhold.net>,
 Zac Crosby <zac@squareup.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Max Chen <mchen@squareup.com>, Shawn Guo <shawn.guo@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev, linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
 Andy Gross <andy.gross@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=878;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lErWU6dobB0XeId/RGdHSYC+Fh+f5HQU6i/ZQfWoHV4=;
 b=UL8UOKYocMxpJYoe0YJwzMhvxXtghVykIHjdlEGq50CZhtl1LLZ8LZLlN2lH90cJbYWcbYJLO
 QV9/CGe0uXSAFNUnoT8wQU4pN1dR03bjwZsdsXFzKbUyEu8A3n7SbpX
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: PJYYIMJ6CMXI7OE4O6NUXQY6PFLBPZAC
X-Message-ID-Hash: PJYYIMJ6CMXI7OE4O6NUXQY6PFLBPZAC
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJYYIMJ6CMXI7OE4O6NUXQY6PFLBPZAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that it's been converted to YAML, reference the PM8916 wcd codec
schema.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f473b2d820bc..b5ec8cecab6a 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -128,7 +128,7 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    additionalProperties: true # FIXME qcom,pm8916-wcd-analog-codec binding not converted yet
+    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
 
   "^charger@[0-9a-f]+$":
     type: object

-- 
2.41.0


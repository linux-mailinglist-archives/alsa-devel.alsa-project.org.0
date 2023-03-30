Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A700F6CFC7E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 09:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB3241F0;
	Thu, 30 Mar 2023 09:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB3241F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680160503;
	bh=dR+TqKGt2psOjJVbvLk6TYNCYka5Bwc5gzVdEA5NQtI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S/KNlI1mPB1PhHhM174QbOYk9p0m8ENRvorq/UwIe0+rYGTgz6RTjw9QIgz7LQayl
	 TMrXxWYBJehHLaM1ACOcGLT/PtwZ0GQQ5XwxIT/sM0BviEKHIHoNGVwcrTcT1TEDDH
	 H6eFpp+o0BQKqFVspr4vAuVnQHz0ygiO7ZYoNyd4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED57DF80249;
	Thu, 30 Mar 2023 09:14:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2039BF80272; Thu, 30 Mar 2023 09:14:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1260BF80114
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 09:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1260BF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U3YRPvTp
Received: by mail-lf1-x129.google.com with SMTP id y20so23329218lfj.2
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680160440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=loyEBhBPXJSd2oDq+EoAXwWIzrLOsQjO8pe3fhmwgiY=;
        b=U3YRPvTpjRpsvPS7VgrRRocB1If0hzy/qEXZOGuz1Qk8AwHtevj58Q3gIp31dIn4Cm
         /Wg7apuNcR/ZghtFLX1rbKEFCVSidlxmh9bmR7bk6hXRRF8Q8KFdWIKUVI7uaLLjh5cq
         6v5zbzkeKiAJrhMCEMswb4zNv/4qbIGsDYKAYtcTs8XpbYCMn8cCJVpTfnbOn9Rhf04s
         ON57Tu+OVdS3FOyKFoQQiq/UOpWvsz8SYPDcCZDxzR17NWozVIgzFOyxEEIEeimhR1Aq
         QWMIlonPYn5CtZFnXCt9a9n2Pg88JZgbNsTQZIZ12cyg0WKn69SPD0IWiRXrbCwYdw5g
         SyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680160440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loyEBhBPXJSd2oDq+EoAXwWIzrLOsQjO8pe3fhmwgiY=;
        b=1oR8dNYExcZIKOIOMeP9mec8eZvagMZy10g+Ryncjam28gFkc+Q4fGKGKF4mfhshBU
         +u01Z0e0loZ49DSVPnr/nIAezQlWwuXu2wcBwVEfS8bHZZwUquDmWTjiLu276N5GcGID
         vDZO1o02BOztf1onVusSAJyuE4HXfXFPBiTvv9NvzfNykITfxj5VKHFb/Qt1iBwXcEJr
         63mdxsecsP+pHXPkX1A+hweepaXviheZ6GMIhpIqhJZUKW68oTTlbtWmVx36vI16DEII
         1+ThXMzUtVOoHUTl0rS2NYuUtlr1Tg+l5QB+o4STOagxg4h17zOfDVPaDuFSgzsXbs7E
         eGDg==
X-Gm-Message-State: AAQBX9ez3BRW0iNfWZakn24vLT7m9CyKgMEuzS2bk+YQFcnl8AqBtEhe
	J1xLAHLhMKKKUsqJi8xNOuHyEUYMKcLuJQA3idc=
X-Google-Smtp-Source: 
 AKy350b3y9O6CwWcsVsGYE/JWxP5ddszJslLziesflMMk+TImPwhlH4vJ9XHMRo03nUhcvsYp7n7qQ==
X-Received: by 2002:ac2:5547:0:b0:4db:1bab:98a4 with SMTP id
 l7-20020ac25547000000b004db1bab98a4mr5013932lfk.32.1680160440483;
        Thu, 30 Mar 2023 00:14:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 b16-20020a056512219000b004d85895d7e0sm3949103lft.147.2023.03.30.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 00:14:00 -0700 (PDT)
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
	Venkata Prasad Potturu <quic_potturu@quicinc.com>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ASoC: dt-bindings: qcom,lpass-rx-macro: correct
 minItems for clocks
Date: Thu, 30 Mar 2023 09:13:33 +0200
Message-Id: <20230330071333.24308-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R6S6SYBFVRHTMROAOUJGVXSPGT4PTEH2
X-Message-ID-Hash: R6S6SYBFVRHTMROAOUJGVXSPGT4PTEH2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org, Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6S6SYBFVRHTMROAOUJGVXSPGT4PTEH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The RX macro codec comes on some platforms in two variants - ADSP
and ADSP bypassed - thus the clock-names varies from 3 to 5.  The clocks
must vary as well:

  sc7280-idp.dtb: codec@3200000: clocks: [[202, 8], [202, 7], [203]] is too short

Fixes: 852fda58d99a ("ASoC: qcom: dt-bindings: Update bindings for clocks in lpass digital codes")
Cc: <stable@vger.kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index f8972769cc6a..ec4b0ac8ad68 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -28,6 +28,7 @@ properties:
     const: 0
 
   clocks:
+    minItems: 3
     maxItems: 5
 
   clock-names:
-- 
2.34.1


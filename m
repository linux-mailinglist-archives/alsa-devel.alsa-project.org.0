Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE936B3BC2
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 11:11:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F91B17C9;
	Fri, 10 Mar 2023 11:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F91B17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678443072;
	bh=gIitaahuQx4qQ+AQp4ObOZ5+ukbB7+0o1sIwePqBld4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ameCCzmlKlCB0r56BH+XOb8f/EevO1HwasXAj8LNZfpjFjCYc/oeq7awzek2YI1bl
	 b6lZW9xp+nkc+SOuyeVVO3DUA8IRAqKyiHU5thDC8ZigZdJtREKkVx/0Wo8+X3EwOt
	 Wz0HXMKXpK5Otiw02jlk1Sn4N/LPKe06u/oDiSnk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDDA0F80236;
	Fri, 10 Mar 2023 11:10:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4CCCF8042F; Fri, 10 Mar 2023 11:10:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBEB5F80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 11:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBEB5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ozr1iPXo
Received: by mail-ed1-x532.google.com with SMTP id u9so18409251edd.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 02:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678443008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VES88RDu68rL5NDUHr3sXnSGJ9TXEfu2GH9TAuqlmkU=;
        b=Ozr1iPXoEGvcAHwAy9H9S8GCoun0lCmweQbD8YnbUqziy2u/98BqZPBfzPbRnLPABx
         nUWc5FrRdihvGHgCfjrqZPsD6V9xwGYOtcCbmoB+6DVL280iKMrB1gIdz0YBcOUR3OIN
         HSME51Il8c5yPqHjdS1detBGS/ZTEl9SWOkFovseOvMYGbvXGa7aiXgUEXWJujXap3Es
         70eqsFq6rsMnYTAy8/+vBxTFHEe/eDuueJgjnT3atKSChkJnq/t/GNZQK8W5z5sUNkgx
         82jtG7DdKnmVYLKXQGGxRUaQVEgKS+tkvwpLP7lCJ+ytuj+m8sbcvWc39sJJXMhASmKR
         svdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678443008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VES88RDu68rL5NDUHr3sXnSGJ9TXEfu2GH9TAuqlmkU=;
        b=0ebE5QZAGL0LTTXRQ9Y6NFaYtmA0F0HJjG95EMGsJI9jdV2R3w7dmy7pbjd6zIwGWz
         BLCd5u7X9/cXHUYX/fv6YpdXsWJemCovxFdj45NkSZP4Ksf8GRSx1tKW7vbvi8bRkK25
         aVyKBDP85Yiz8Pjb66xexxUymLrgigm1luhY0FnBvnk5Ge5h6JxhorqQ04+jAiZnuZ2y
         E4pI0T8CrA55L44DN12z2FS66X4iwP82YAEHkJX7fe0BCgyGb6Eo9gWNXqXKJOCbLZfy
         uwUJwdFel6Z+fqQ1voyeZzlE9peIdFDsyfrh8kmdpxY1LxK7B9cMOosv/09Neze95zRS
         +4hg==
X-Gm-Message-State: AO0yUKVCAZngJ27qFTg4gwwriH6T+aAigOygW8qs2B6QYwgbo+bNJx6Y
	sUbrSTC/LTTIQ94Snf8qhe13OA==
X-Google-Smtp-Source: 
 AK7set/S605bhmLAtsmVPrUq/mepr0q5FJC+/eV4WvNFS5d4216qWzvQbfEOofPJqPaTziJ7CzL1Bg==
X-Received: by 2002:a17:907:1b1e:b0:8b2:8876:2a11 with SMTP id
 mp30-20020a1709071b1e00b008b288762a11mr1368992ejc.28.1678443007804;
        Fri, 10 Mar 2023 02:10:07 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id
 a20-20020a17090680d400b008c979c74732sm761350ejx.156.2023.03.10.02.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:10:07 -0800 (PST)
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
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Venkata Prasad Potturu <quic_potturu@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: qcom,lpass-rx-macro: correct minItems for
 clocks
Date: Fri, 10 Mar 2023 11:09:37 +0100
Message-Id: <20230310100937.32485-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2NJC2LOOVDF2FUZF6TGQCEWNYCVE4LXE
X-Message-ID-Hash: 2NJC2LOOVDF2FUZF6TGQCEWNYCVE4LXE
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NJC2LOOVDF2FUZF6TGQCEWNYCVE4LXE/>
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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 79c6f8da1319..b0b95689d78b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -30,6 +30,7 @@ properties:
     const: 0
 
   clocks:
+    minItems: 3
     maxItems: 5
 
   clock-names:
-- 
2.34.1


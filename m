Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8166D261F
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 18:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CF0C1F4;
	Fri, 31 Mar 2023 18:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CF0C1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680281253;
	bh=UQJ3DTvUtwE9RwCGFDkUPOIAfOHXfmckK7nPLGJ/3ww=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FJnDROOk3zihqAH2+zSLsi0bnTunrDV6CAWvknJZgQx6QFd4eKxn0J9HIrrVJAT6u
	 L3oUkQOrEodV8BDVPNgI4T0IvXKbzsyTBMo3NtB+YnqDOlJ/vJiaxGt/LY3TFtx/nc
	 r0D/kuw4oVgW0Tvg0fb+jiA4rdTOGg3G2J7fPrLI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A378F8052D;
	Fri, 31 Mar 2023 18:45:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33E8BF80495; Fri, 31 Mar 2023 18:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11A0AF8024E
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 18:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A0AF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aJi3v7Lo
Received: by mail-lf1-x132.google.com with SMTP id k37so29748895lfv.0
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aC9vcgB4zQ+sZKRkrSflhEld19cf9czc3eWEZjB6u4=;
        b=aJi3v7Lo50cPQ7a47bC9Gq33KWNWI3NSqnrEIyU6xyoYWhyOCWrW4XACQho4sPRu6a
         uZgm/e2TEFsSM63xW1hjMsYo7BNgDEUdDUfoDJXJ9fpY7FLRQAo5bDFPDNxOXnYxDXP/
         fRxk6vG6Ph92RVwYlcDPHoJjhZmGhDv77VmtccAKgo4JfvIgBFR0rjwofpCjZioqWbIA
         PdCrW9r2dncb+7Bhx5StSWaitDHkPAll/uwgV/A7PvkLa2eoMNVx7i9Afm63zvC2XaOq
         pNJApOC0TbLZKeReWL85OyzlQfEpVQrJZh56geWRB95P9dCgrRP/3La158CI8yr/LPpr
         DS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aC9vcgB4zQ+sZKRkrSflhEld19cf9czc3eWEZjB6u4=;
        b=0xV0exaxNGGpzddyiH12cT1Atd0VqqRTYsPhgRNYvFoT7YCUHmR15o06ipoJez7VlC
         nZTOrPUpgMfCnmT0dCniLlY/ejnON3zKQ+tvznoX5cPaXujowhJFJCXI/LMCqLfhF9eZ
         qEh01+/bbNd/pK+ZV1knIrwnWeHx4tpZ3NlvJ38wUICuxwmSF/dKoUtK92B7Mp/gXizp
         +NgfT6FKFR/3AfGrI6Gtd4iKL6rhxrF982rd65IHZG6iNhZYWpdoPAiYtNi3jQJniLVo
         SZdiL14uVC9FWqKrdaYGsu3vLcNI6Zij1wnfrmaQ9YFKGXVkrX7RoR0INR6n6r1ZIjDj
         SG1A==
X-Gm-Message-State: AAQBX9eZOCf5CdOA89Sih+kKE3ggB9FKbB6wNmCzSiWT9+i6aPjfaYfk
	Ww8dVLhLn5wJxWy98IAbpgG/nw==
X-Google-Smtp-Source: 
 AKy350YA6FD7eDeRN/9/jo/VJ4UZULMRWphtY3gDX6/+wMnIIP6e19kwZCq8H+LNMAd05BlqDWZ2OA==
X-Received: by 2002:ac2:446f:0:b0:4dd:a61c:8f74 with SMTP id
 y15-20020ac2446f000000b004dda61c8f74mr8958859lfl.51.1680281136994;
        Fri, 31 Mar 2023 09:45:36 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 u26-20020ac2519a000000b004e8483bff82sm439872lfi.271.2023.03.31.09.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:45:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/7] dt-bindings: soundwire: qcom: add Qualcomm Soundwire
 v2.0.0
Date: Fri, 31 Mar 2023 18:45:25 +0200
Message-Id: <20230331164530.227302-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331164530.227302-1-krzysztof.kozlowski@linaro.org>
References: <20230331164530.227302-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F6R67XZV3U26E3YRHPTPVBSZTSJMKXMA
X-Message-ID-Hash: F6R67XZV3U26E3YRHPTPVBSZTSJMKXMA
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6R67XZV3U26E3YRHPTPVBSZTSJMKXMA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible for Qualcomm Soundwire v2.0.0 controller, which comes
with several differences against v1.7.0 in register layout.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index e2acfd09fb22..adf28fd6134a 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,soundwire-v1.5.1
       - qcom,soundwire-v1.6.0
       - qcom,soundwire-v1.7.0
+      - qcom,soundwire-v2.0.0
 
   reg:
     maxItems: 1
-- 
2.34.1


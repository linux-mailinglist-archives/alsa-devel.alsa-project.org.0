Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8255AE7A9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E66B6852;
	Tue,  6 Sep 2022 14:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E66B6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466763;
	bh=5kDFwGxXwlPO+BaEnn99NX8zmSmaj5/zQgQXkhUhbz8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdctk2lA/+38fxRNXvamAijcJ8ORRZ4xePIFhDYuT5SdWMKC0oq3XARJBpvGrWi7G
	 3rXOSXIbsroGF51Ifm/wtJ8ipKgHfGOr5e2HyRb3lZnG5eGYJCrYcQAeWGkQeQeVGa
	 EdavmC9ciZkGeq4tECYSGvqjcKSXeWEvqhuns2Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A341BF80552;
	Tue,  6 Sep 2022 14:17:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9787F80557; Tue,  6 Sep 2022 14:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55221F80535
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55221F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CpJkP37q"
Received: by mail-lj1-x22f.google.com with SMTP id b19so12059635ljf.8
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jxL+xsbNPMQ0LRDW07pB1gCBkhj6BzOUQBO7qCX71FU=;
 b=CpJkP37qUoWaOHam9E2JAXwW7u39U2t7NFMBIZbyL9Ciwo2aoTnIgBpY+VG65GKios
 EUzehYF7WCd/erNoIw86cRzW2VbckRTzNQobzDqfQZKHcX670oAW7M42ajfMLnlJa7OC
 Ei6EkLBbFSLdvQKMt85KhsRYgSoPBN5Ksdo4IW4lUMTIig8RDzobfhi2qOAorUCZ4Ulv
 SK5qajKFl91SwgYZVOjt4fXC3P2kGaDKQtN7lq5M97lPtH/bjun8/tEyyAyr3oR1Zep4
 OdzNmbCgNP++pWpBk2mL0sOs5DrYjhw5YQBX76MiP3B9KvLslR/ZiI2drDGkdb7GZbhh
 ohBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jxL+xsbNPMQ0LRDW07pB1gCBkhj6BzOUQBO7qCX71FU=;
 b=Th4SzKmNKgu3zQ9qZBmeOZceeOiMAsMPQa5qXij/iIH+zwKXzk4DUnjuteUVpeoVf6
 /kxRROBWQOfMg9P871HsTdeBSvNPLZeNWMaPmw51x8wWYPZlBbzoRxeul4eko47T1kkR
 0fYmnmdJPCQNhozTnFfLlfEFtRX1fD6i8wddFd42/sdCCUZq4Vohz/ejQLu083HKXHvt
 sfxjL+U2ixAn1ZxzPCpDBO1CGx431LRlPTHU3UobYhuYFSqbD6c3yi0wzmjKQ8BcNtd9
 G28gqti6wPKY+Sxzn5hj2ihCpdcXXco885Xd46mCize1VX2vk5/zNMXyNpMkNFK7d+El
 v4nA==
X-Gm-Message-State: ACgBeo1J5YrkP7qY8Wl1af/W9FUnYrGb3mtxknTSQg+RKPXuTBZ/WP6W
 xiPPe3MqHA/hBLUjl0Jgh1D1Ig==
X-Google-Smtp-Source: AA6agR7/pgyd1DQA1bmXkzqfd0ZlNJS2Vz9kmJ4Jy591mvQSpPAnHiz8NkjvC+XOwPPeTO8BxJc2Vw==
X-Received: by 2002:a2e:a604:0:b0:25e:87b1:fda5 with SMTP id
 v4-20020a2ea604000000b0025e87b1fda5mr15152545ljp.428.1662466623852; 
 Tue, 06 Sep 2022 05:17:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:03 -0700 (PDT)
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
Subject: [PATCH 04/12] arm64: dts: qcom: msm8996: fix APR services nodes
Date: Tue,  6 Sep 2022 14:16:47 +0200
Message-Id: <20220906121655.303693-5-krzysztof.kozlowski@linaro.org>
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

DT schema expects APR services node names to be "service" and to have an
unit address (as it has a "reg" property):

  qcom/msm8996-xiaomi-gemini.dtb: apr: 'power-domains', 'q6adm', 'q6afe', 'q6asm', 'qcom,smd-channels' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 742eac4ce9b3..8dd4f6d09330 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3388,12 +3388,12 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					q6core {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 					};
 
-					q6afe: q6afe {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						q6afedai: dais {
@@ -3407,7 +3407,7 @@ hdmi@1 {
 						};
 					};
 
-					q6asm: q6asm {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
@@ -3419,7 +3419,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: q6adm {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						q6routing: routing {
-- 
2.34.1


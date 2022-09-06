Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7FE5AE7A6
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE80885D;
	Tue,  6 Sep 2022 14:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE80885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466714;
	bh=EM/cQSjs/dCGM71CxxxVgTAX5ucfSZ6UvUnPGqJlFjI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQ3Gg0AIIlHYFia1YrZEZ3OqDXiqg328KZBS9WIu5GUKUUdwcHs9X4vR7KKQkR3x+
	 RrJ7/rcfEfkUxD0H/Ih1LGlJuJ102Bsg5ob8cMlArJACv/B+kxerEauaDTeDUvhXD7
	 gjtrtgPkBVoElN/4eUb2BmqLghmT3mFYIXsZgkSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76478F8019B;
	Tue,  6 Sep 2022 14:17:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78942F80537; Tue,  6 Sep 2022 14:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E6BFF8011C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E6BFF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AfprGoA9"
Received: by mail-lj1-x235.google.com with SMTP id r27so11643874ljn.0
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=lVPyeQ2iOH6eoW7svXNN0i3ITGNgus4jUsMchB4/XmY=;
 b=AfprGoA9gCfMR73Wg2GWfLozAtEGnAbp6sHvLZ00EjGtnDIuoGEe0xV1lB6n4FeG2e
 o5jLEAfPqYzYODGVmc2h7dlB2ykI6pLGPHnAzmNecnXfG8nI6QpkWi1xf6ntnKjV6NLp
 4xanHlI+G447u1cBNFpnZC6EU6zTyjsBVfq5lcqS3UDbyIKSqeu7AtwIvMkQ0Wpya47q
 vhDgoLyiTgouDFdqWphAC2MvDa4goUrd7QXTksd8iwOV8k7qjIdzIjQuHnR8/UBU+bCC
 DyPcdM6ge2STts7jAseikP42KE3Y8q+JHRSPEdlFVajnKkxrWypLqdiWKOo/TDAWp7SQ
 eL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lVPyeQ2iOH6eoW7svXNN0i3ITGNgus4jUsMchB4/XmY=;
 b=rRWliTc9LDTMw8KkGoxCtKYeOkDtibjyjW0N2VhrpK6M3b/OJXBT4ImCDaq+CZ7dZV
 Ot1jv85nSp1iZ/YOeT2QJGU0I+1/W5By1ZkaZ6WoODcDJJDLxP/pb2mu8JPTxIk41gvY
 8BAoT40LtrPRcjefdVsyHzPieSiC/+RjEqn+BssA/EFRb3N0iupBb4xDR9ND4/ut//QW
 FIT4CJgqE6sDnZ+Blyo42EVv4MufYXNapmHSDzlW3/azg6Hg0nvQpXGHUOvX9yoduDH3
 vbvZoNQTkYdupjtGzg7DWp+gVIs6uGq1skePuPgskCVK5YpTVsNPWe2eb9pkPbAlWJrK
 HLgg==
X-Gm-Message-State: ACgBeo2ETvPQBDf3X+D1uafIBnXnwcV5JZPMMa2QTCrtTaUIrpWqwh9k
 p4RK98qjrOEp2MqTEex5/aG5fFhuY3fZgQ==
X-Google-Smtp-Source: AA6agR4AWd3RVjZKD2Gi/fOUvxXLLmz4KmbtKrsxZkSynyYoBuHXOsjx+NdgKbG27R8UID5TqZniiQ==
X-Received: by 2002:a2e:9208:0:b0:26a:6213:3568 with SMTP id
 k8-20020a2e9208000000b0026a62133568mr2728879ljg.503.1662466620083; 
 Tue, 06 Sep 2022 05:17:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:16:59 -0700 (PDT)
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
Subject: [PATCH 01/12] arm64: dts: qcom: sdm630: align APR services node names
 with dtschema
Date: Tue,  6 Sep 2022 14:16:44 +0200
Message-Id: <20220906121655.303693-2-krzysztof.kozlowski@linaro.org>
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

DT schema expects APR services node names to be "service":

  qcom/sdm850-lenovo-yoga-c630.dtb: remoteproc-adsp: glink-edge:apr: 'apr-service@3', 'apr-service@4', 'apr-service@7', 'apr-service@8', 'qcom,glink-channels', 'qcom,intents' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1bc9091cad2a..2d4e3d39727c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2218,12 +2218,12 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					q6core {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 					};
 
-					q6afe: apr-service@4 {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						q6afedai: dais {
@@ -2234,7 +2234,7 @@ q6afedai: dais {
 						};
 					};
 
-					q6asm: apr-service@7 {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
@@ -2246,7 +2246,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: apr-service@8 {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						q6routing: routing {
-- 
2.34.1


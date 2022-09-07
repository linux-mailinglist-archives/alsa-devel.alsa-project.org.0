Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB585B01B2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:18:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52FD21686;
	Wed,  7 Sep 2022 12:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52FD21686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545910;
	bh=eE+hyAgLHdXEAluhjKv4sgo66rg/94MQD9jYEuS9nFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cgB3Hr57fPbIPr+EHeVXf63SKGX0uZeXSnjY2LYp5KPdpfA+UNwUcuKxPv70rnCn1
	 7arZR8wVohH5RvTvysgzcLkmxzOoS6Q5EGUlwIgZ378diVzfteQlcjqSY8GXlDeA44
	 2bUxqRnR7z+AsFJQgje9AA4BakB7kZicFCIIMWvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C0F7F805A9;
	Wed,  7 Sep 2022 12:16:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2062F80535; Wed,  7 Sep 2022 12:16:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CFF1F804B2
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CFF1F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="o5d+FdZn"
Received: by mail-lf1-x133.google.com with SMTP id bq23so21674001lfb.7
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=751surAPxPI7nKu0MMgW0W0B94zgA9MhkjYrnO7nGnI=;
 b=o5d+FdZnHGKmhZkD13oEr5F2G7/5qQRMGIc/xYqsZnha5sQxzrPVMX8IVbRTOKbcxw
 OAomQ+Q2KiUCOBAijRgd8owZ2Wc1aWPqqMusrNIYCPHkRrEy+m0NGndmwxFPYFV1zi1Q
 xN4/jxTG0tzd9/FdscLVJofV8cfq92yVgM2vsyL+U3qznumg0+2pZllHn+EH7KmkP6m+
 ih0hmX98sQVmXnYZ0dWgAC0/4s+/IYCCxVkhWv2R8eCKovkjAAyBIjq3KcuIFH9oJlF7
 ZYKNmHoWudAgOgpkWpR2+9zPqr6ZHpeqEyKgC7h64hDjsDetrjXqQPFs7zlQZavgITJG
 Z0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=751surAPxPI7nKu0MMgW0W0B94zgA9MhkjYrnO7nGnI=;
 b=J/ahIIoHcKssZMPZrzPRMhX8H6iv/nHA6ag9/7dIntZQZlJicHl4e4JBM53sm8Oc7a
 gJjgvUsstPpWQwTANklnCn+gi+dWuWva+sKEVNbGrN0eUjYCkLanniLwsuJj802AGxq9
 2xxcMEI+rX2Z5uqbXpzx+PHDn3QJHFbrgq9TO8DRa76BpnDKH1139mmMnAW3fazbIzUG
 WR4Hq1OTALEQfP24axp1cBukKsRjKn5vRZfmgswTuTF1GPvwbHQmUSPH3SScVFrd2Vq+
 NEEhuKjLziYnUKFvpuY08wTbyoULwLNeegBfG04bSeqwZ77B25kNMDjv/H2cVj4aDjGN
 eurg==
X-Gm-Message-State: ACgBeo3MTm1+BdQz+z7Dlh0eBvzAh6ihfRHjMKD32Kgd97RC5hoeI75r
 8RnP15zcEnAOsPTiqmX5JP8JHQ==
X-Google-Smtp-Source: AA6agR7C/OFIpW9w94tqGiShtUWVPncRPvTDDLGRPNEnmp5S+qRQa35ahQen3VhMVvQmjiaL71XG1g==
X-Received: by 2002:a05:6512:3502:b0:493:e21:b77d with SMTP id
 h2-20020a056512350200b004930e21b77dmr843355lfs.580.1662545768897; 
 Wed, 07 Sep 2022 03:16:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 03/14] arm64: dts: qcom: sm8250: align APR services node
 names with dtschema
Date: Wed,  7 Sep 2022 12:15:45 +0200
Message-Id: <20220907101556.37394-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
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

  qcom/sm8250-sony-xperia-edo-pdx203.dtb: remoteproc@17300000: glink-edge:apr:service@7: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index cf5d65940174..84b4b8e40e7f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4782,13 +4782,13 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					apr-service@3 {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 					};
 
-					q6afe: apr-service@4 {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -4805,7 +4805,7 @@ q6afecc: cc {
 						};
 					};
 
-					q6asm: apr-service@7 {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -4818,7 +4818,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: apr-service@8 {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-- 
2.34.1


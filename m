Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3495B187B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:22:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD57F16C2;
	Thu,  8 Sep 2022 11:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD57F16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662628978;
	bh=eE+hyAgLHdXEAluhjKv4sgo66rg/94MQD9jYEuS9nFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lo0wt3W3R6UT2iuxIZ2d+cyaiBQnc3PF9dEjwTWO4+gjIQEEcdrcwbg4Hyg/d39vx
	 /HDSbnNHav4zwvhOBJHOAaOjG+NALasz+MgSaGtIvgtgJive/zwArUX1ePsZpjWRIj
	 OJF06rRXqzGlzuSPAmjvsjj37RfRpwWSW4hR24gI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA7DAF80570;
	Thu,  8 Sep 2022 11:20:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B96F5F80552; Thu,  8 Sep 2022 11:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64AFCF804B3
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64AFCF804B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PuPGkNjt"
Received: by mail-lf1-x12c.google.com with SMTP id q21so12467138lfo.0
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=751surAPxPI7nKu0MMgW0W0B94zgA9MhkjYrnO7nGnI=;
 b=PuPGkNjtT6B9Vr0jSKszhti/biwZaWxyshVjYixpUSMn0KigF0laZ852HWOGXU5baK
 ZFYtiF0QhfkMzZxLuOUTv8Qsvk0CD+l6wLpxEs66DQjTCpXO5i4pM4B5/xuqu5bsClJr
 pOD9us8IrovpKwwyeH756ct4zYNOmwO4fu92yiE+f4INKh6M5pMkBpRUuCsLkwGvC2hg
 YLH9HPx2sbjxPDbSWeGueK23xmd6tkjVi7L3wSk5lfxREpmY7R1rr3KlQXJqorvWxqCC
 SHWb7mHR8IYHBG1G+8k06rq4uzh2ck1LWsi9sOXqXEFnKSzvIlNO0Gro35Q2OV5RqaHc
 21Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=751surAPxPI7nKu0MMgW0W0B94zgA9MhkjYrnO7nGnI=;
 b=KS/dylUVMRhXd94rq1rKdk2NFuWg+f4C11Q9ASUSREShs7wsLwLymC+07a+8naG/SX
 FFp5YhPFgU8hG/B3AgJi4PVYLBG2MDgiiq2uxGjvFGnbd6fNxio7XNrQtGi/1f9bokYe
 Ky59TR1TxnvgrpVgRJ3mR3lgMJcNgmBQTrZfAANitLi94QPJYsffTWPkOXc292rI16HA
 NnY8fNX7ramc0lDHO74vvyxwvy/459pW0GVrVntgxYZZkVqewHUuToBXcjHUBrfOocvt
 dSLOtdaMBHvtMI8SyLATWmI7VUGSHY1R40XID1JMbEf1fl0UmSNSVq95djQzl6RuzPPe
 jKIQ==
X-Gm-Message-State: ACgBeo1pJ26tzsTzqpcFEm9bKxfqpRCM0no+h6J36RXvnSVLvrMtuJNm
 TMUGTc6xFzJA+0kx11v7ieXvXw==
X-Google-Smtp-Source: AA6agR4smf+/sFmgq5vvP1pJNHHG8LvAudVpkl2pkMm1d88+KlKqaxkaalEXMokbdD3cwJdCkN3iLQ==
X-Received: by 2002:a05:6512:b08:b0:492:87ad:5f5c with SMTP id
 w8-20020a0565120b0800b0049287ad5f5cmr2688256lfu.293.1662628794396; 
 Thu, 08 Sep 2022 02:19:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:19:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/14] arm64: dts: qcom: sm8250: align APR services node
 names with dtschema
Date: Thu,  8 Sep 2022 11:19:35 +0200
Message-Id: <20220908091946.44800-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
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


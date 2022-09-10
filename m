Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A25B45A2
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D372616B1;
	Sat, 10 Sep 2022 11:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D372616B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801529;
	bh=7vwWCNfKHjy4BThutFo9CHxrjqK0PKYige6llxYL3GM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxADJ27DOioM9qgh8rvs1AYK4lQP32VRvW7hr5oYA7eZlcszQSifERYkDgUXUfF8L
	 oVPu1XPDIHrBTqaozRPMMEfJdAL/Ig5SxjtK75PEQmAY7Q539QrDKFDl07Gd4E/q/w
	 hxpWyJmBfGbQ/dUY5H3zRusTsVQhLrjthyLNGC1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9AA3F805A1;
	Sat, 10 Sep 2022 11:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DE8DF80570; Sat, 10 Sep 2022 11:15:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A303F80549
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A303F80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="shixtIhB"
Received: by mail-lf1-x12d.google.com with SMTP id q21so6786374lfo.0
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Om7NL/8n/AZHbaNF9gisHUFy/iTMOZIGCGU/AWMpqjM=;
 b=shixtIhBSAZGcGZxoWGvxbe94FCKP7YSUgKsBA+rsiVc1TNpTivGMg2TRyabz7coMR
 jV4cawvAYBdMCi29AkwxoEbUe2qGu8t9Ik7Zq8i8cLKdaV/sxnJyxiiyoXpZEoELiA1v
 AGMCzIejMjD1Ts1xNVvtJfkqYoimBVjSsvLhab7sGSGO6OxRTIAKI4Wt/hEk663pVo8X
 VmqDckdFXxdI9U0UShm4yqrc1Aqf6370/kjPPQHRrhI1cxQiCBKWaZpfwkJ3wM+RyAvC
 XDbjqPdkaCAmprKKysIOKL1RpwYhuMOeB7h0x9XIBoqlykC2dDMXecckjxRKRSFr+jVx
 1ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Om7NL/8n/AZHbaNF9gisHUFy/iTMOZIGCGU/AWMpqjM=;
 b=f3IJ1bd77ujR3bOlfJ6jtqySEUskrxZ2DcU1u2OK4keGa2n1J66orrMzWTWImXb2aK
 oNiFXCv/5rUc8+dVD9XfWtmL5jx9nY5zDFduk5l9gxQOY1Xo6H9l2DVM2SusyHEbI7EL
 Fkh6R1uYEf8MPtJNt10uCaPrSOY3fEPilzS0BEe3zJiXRWAvgvU52wPOwtqLdGB9OgGY
 zdiR/gxa3NLxSHqZ1TqNxUgdJYji8OUy2vi3EM4hzsddgM9wl29dxRqMNhdXflkhQ1jc
 sjoy2f/YNptHvh0qNHuuungSzLc4dWAuzTjzWLueXdI3fqLhqxBeh5NurFnASZ8Jvn0s
 PayA==
X-Gm-Message-State: ACgBeo2o7a5rIyrpOjVuoEMcL3F6TI5LciPWT16mfDs2O8sBACuzxNNo
 ZRU/1feU3FHWgXA6WeWfRvGprg==
X-Google-Smtp-Source: AA6agR65F1UZGoG65loqPXfIrJaLts3AmGwOQ+PcGtwW4XTYY0dznF07HfSCsWDWPNHFdSwvMKEi0Q==
X-Received: by 2002:a19:910f:0:b0:498:7212:10c0 with SMTP id
 t15-20020a19910f000000b00498721210c0mr4374129lfd.39.1662801285269; 
 Sat, 10 Sep 2022 02:14:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:44 -0700 (PDT)
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
Subject: [PATCH v4 07/15] arm64: dts: qcom: qrb5165-rb5: align dai node names
 with dtschema
Date: Sat, 10 Sep 2022 11:14:20 +0200
Message-Id: <20220910091428.50418-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects DAI node names to be "dai":

  qcom/qrb5165-rb5.dtb: dais: 'qi2s@16', 'qi2s@20' do not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index bf8077a1cf9a..d39ca3671477 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -867,7 +867,7 @@ &qupv3_id_2 {
 };
 
 &q6afedai {
-	qi2s@16 {
+	dai@16 {
 		reg = <PRIMARY_MI2S_RX>;
 		qcom,sd-lines = <0 1 2 3>;
 	};
@@ -875,7 +875,7 @@ qi2s@16 {
 
 /* TERT I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
-	qi2s@20 {
+	dai@20 {
 		reg = <TERTIARY_MI2S_RX>;
 		qcom,sd-lines = <0>;
 	};
-- 
2.34.1


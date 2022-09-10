Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8E5B4597
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:16:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D5E1698;
	Sat, 10 Sep 2022 11:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D5E1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801385;
	bh=eE+hyAgLHdXEAluhjKv4sgo66rg/94MQD9jYEuS9nFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PlxQsBgdCdonX2W+Q/DDxhXVe6TZZ4PZDc0BVpeHXZEGlcZeuhJGdZk3doua3Hf6f
	 O3UYcm3dmjLaWnREzQ3nh4LcL01UJkVvRjWtTVZ/LWXjjRQB27Rx4akQt2FRasFTx5
	 8U4K2k1HuqXTkWBeqhH3Mj3BMUzlqymPxq3G9HZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 616BEF8054A;
	Sat, 10 Sep 2022 11:14:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 607A9F8053B; Sat, 10 Sep 2022 11:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 648C1F800B8
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 648C1F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zQRFMq36"
Received: by mail-lj1-x231.google.com with SMTP id p5so4729477ljc.13
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=751surAPxPI7nKu0MMgW0W0B94zgA9MhkjYrnO7nGnI=;
 b=zQRFMq36RqrYYs98jR8t72WidrCl3iJiSCBHNxN1ZJYx6QbQ7WquWi5WgsXWdGpNQy
 BlBNnj+3iSehQi7ZJmYT4tPs+Ja5LD9i0dqMHzOOxOFynFINL8lBvwKfU5Wown/yVG4y
 JrrTJFZtdGHxd2PuORiccTfHbS7wy7/3WSwyac7hwLY0cNT6OUoZ+VxXPaUGbjOaOHmJ
 wAmoOBTO0t9qxZIqQjh3VN4Mhg7CsSf7+CCK2y3tZxTKhnA9UGCWnMdbiZlPh0avt/3z
 vwp7UdP4V2n2hH852lhzDSwg4YErw59prYf9+Hi9ejQT6I2OM47ZUJP8uI26lhwMXQfi
 3eFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=751surAPxPI7nKu0MMgW0W0B94zgA9MhkjYrnO7nGnI=;
 b=K5sDvRs6FD8hiCzN7kh36eYNfnY4IBzUWyoy/0z7XZx+ySs8dBzUTWxJDmGXzSwkJv
 nBdfcAm2Dnvvj8ojdX/jQYp9ol+OHfEvXIAj4NEtZfEkRqzRXbSfatbcOggSdrSEvDjc
 gR/mVqjHP2phWO+Aid2WqPBvJgvE9saUuzUOOyvP4PkhO6DEB2BfKxV9YccDLflKqGEF
 0oNJlOtfsu97+czM9veG25q7nH+sC2uramOfqdI+LvZgasXU4nHjKVsIkNB3zsLq6pPw
 9s98vHhuI3VQbjBmMdobhMDsOm20Wf+3d/FYy58ODZEoJXkLy84j83smpmb0KwvOr3QO
 wFOg==
X-Gm-Message-State: ACgBeo2aShvXKyML1mkjNe/cbOcyXKuf3NFVsxaDsuvcUnm23SfbajYi
 5K+sb/XYlaFBy64iVIB8WgA3vQ==
X-Google-Smtp-Source: AA6agR4U63/GsFPvu4Z2mdmgG77xs6DtfoVI+BdZsBLB64vmdeJ0oNDloNGvhtPn6XYNIDr7gAPedg==
X-Received: by 2002:a2e:a884:0:b0:25d:ea06:6a3f with SMTP id
 m4-20020a2ea884000000b0025dea066a3fmr4914365ljq.335.1662801280403; 
 Sat, 10 Sep 2022 02:14:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:39 -0700 (PDT)
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
Subject: [PATCH v4 03/15] arm64: dts: qcom: sm8250: align APR services node
 names with dtschema
Date: Sat, 10 Sep 2022 11:14:16 +0200
Message-Id: <20220910091428.50418-4-krzysztof.kozlowski@linaro.org>
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


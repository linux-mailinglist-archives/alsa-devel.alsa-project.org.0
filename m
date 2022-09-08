Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1C5B1880
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B05A316ED;
	Thu,  8 Sep 2022 11:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B05A316ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629001;
	bh=XVZGj+P033LVn8gjSj00T+VeC40UUF3xiKUBPJCysAc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfeSu5VDwYCNhy4aBjbrWvtdbxROQu/vfeY8+MxhScI9xdzWPzQmbhxqkr9IZkNCo
	 GrTOGeQ3wcoJY86dh9gst7Aj/6/iROv8bZs7HiFbvuHbYxu4pf+7eij496Myam0Fuf
	 G5c/r4okem/Qw1lSaL/Hr1vsIEfWfZabKlH9Tvd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14446F8057F;
	Thu,  8 Sep 2022 11:20:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84C61F8056F; Thu,  8 Sep 2022 11:20:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36EBAF80527
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36EBAF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KBODdy75"
Received: by mail-lj1-x232.google.com with SMTP id bn9so19119309ljb.6
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/UI25rqJUxEZV+KxQUPmeT2zHV2+PmX8LADJ48o6xoo=;
 b=KBODdy75Wft+JHstPoIvy6Q557uXJSD1mFwan7/iXcYA7kysX9VJjfyEhjvakhJ0K+
 DMZ0ps+Fa93+mZhlt7iqnX9E+ZUqVjUxFTKGy0Atgm25gt+AziBCYD3FWrNLzcqiuy7y
 n7fVdSZSg+dKka17HviQdRY0T631/K9WoXSBXciVVyX9pFW0Z/R6wJbk1OY+ohkSeyER
 912FxjZ7PyN3lspzZKABel0q+2E3MAkJBK1KctKlra4I4rV/lmASx3Biw/vCCPInLWQr
 UFFMOqoH+400C39UitmEEHvaAPxItCV9THPQQbMJ6q0aE+Rsm1OitYYuXXyJjnxA/Dh9
 O36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/UI25rqJUxEZV+KxQUPmeT2zHV2+PmX8LADJ48o6xoo=;
 b=qNc1PvMEmumGrHYMvneBbLyJiQeuI+INyBbc5gKyqbs7kfDnV/aM/8jS9nXebiCxGr
 qVIOsLlKj94K6CbGWhb//Q9UtlmC1Qfm0pZRByT92ef5ygyaXu0zU38j2ZEPQSd9/WxV
 YKE9k1Qb4boHOYnGYFuLR11f/cRau2Gw2HG8ETvwr01+MXGer7w6lWNiDiLgnp/A5Zk0
 7w1Sg46DIOfQcc7YbAr9BZuSxtmocBrbjjJqMR/Zg5A87xlLqeUwPhSVfqsd3Xtun14b
 /hNJsu0d8U2Ap7Asgg5Q33JVPkavv0wsBURymBHCWb4q7DJrsC7plKOkBPVxeXKfgk5T
 9Leg==
X-Gm-Message-State: ACgBeo0nVAy2bMgpWzpuFqjkdZNTThzBl0Qb5gCzFrYisSsN8Rm+b8re
 zGOV7UvIt4b0ThOXg5akGvcOgDp4iZsi1A==
X-Google-Smtp-Source: AA6agR6qEO8uDknL2F7QOCw5O93PZp02P6M/Hq4sZ3Zhi5sScHvtdEE+/aV4Wp32DbyE32qUg1wc6A==
X-Received: by 2002:a2e:a90a:0:b0:261:d622:248c with SMTP id
 j10-20020a2ea90a000000b00261d622248cmr2085650ljq.332.1662628798161; 
 Thu, 08 Sep 2022 02:19:58 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:19:57 -0700 (PDT)
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
Subject: [PATCH v3 06/14] arm64: dts: qcom: msm8996: align dai node names with
 dtschema
Date: Thu,  8 Sep 2022 11:19:38 +0200
Message-Id: <20220908091946.44800-7-krzysztof.kozlowski@linaro.org>
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

DT schema expects DAI node names to be "dai":

  qcom/msm8996-mtp.dtb: dais: 'hdmi@1' does not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index abc17c905bfe..b346ecccb94d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3402,7 +3402,7 @@ q6afedai: dais {
 							#address-cells = <1>;
 							#size-cells = <0>;
 							#sound-dai-cells = <1>;
-							hdmi@1 {
+							dai@1 {
 								reg = <1>;
 							};
 						};
-- 
2.34.1


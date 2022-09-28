Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F55EE020
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2924AEA;
	Wed, 28 Sep 2022 17:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2924AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378540;
	bh=mfauvSU+PSgHAUhtsCh69F35zn6lPMXA2MV2vJSo0g4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vB5G+P9KV6RojW3YN754eF1RxaiRBJN2eNqPCXPyyoPuc9exQMpFQT1cxuAj0ULcL
	 dc1nHgWYU9G3t2x19+6O06HY9zGhroO1HN1b2BbPqSZRAL5xQfPVgQt+Zmkb6/rk84
	 L/Dtx7oQGHS25hVzcmNAjwivQsh20Kdoq0nlpMvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E907FF80542;
	Wed, 28 Sep 2022 17:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 305ECF80109; Wed, 28 Sep 2022 17:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92F63F80272
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92F63F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xgs6vT8t"
Received: by mail-lf1-x12b.google.com with SMTP id s6so20860559lfo.7
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8gAb0vttvsZ8wRV0w5Eu2WIvLvAPbZHBztrbwSwM8vY=;
 b=xgs6vT8teutOSFqb0VQposP83OTGki/PknCXsIbr5xGNEZGDaOfRYMEyn97Ilvol+S
 +LRGnzc51DCEPl3tfFTHWxUwiAemmxvdNqC5yP95YW9o6ZrUqNQzAcHQupC5o5ky7OQE
 dIN+7/+x+rvTQxTs76tT/7GVSd3nh+QgBDAj+B7YJJ6+pOe6bB7zpm7rQRS1a4U/h4d4
 3cuMvVAi9sCxqw0zHYFSxHJSaLw+XRyscJ0FNeGWuLTQ/GK9d1TJ1zsyeVOGR0ffgsN9
 BwS8g7Z2/UkpYKC3lEKwS+EXytz+d55aNonu54ly7MTu8PaeVBQNfE3Xr/mU3KY7m6x/
 7NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8gAb0vttvsZ8wRV0w5Eu2WIvLvAPbZHBztrbwSwM8vY=;
 b=oCu7PJzvLYNK/AORRJJkdz3kw4Y0vUgDNLKUmbXaDQpFf5YA/ETc6WFV65yaSnuA1y
 2IdONTSGcAybkAdUCtbYe8dq//FXNv0jIWwWptA8EXP33zgeykNnaLJL6EDAjTuNRlRz
 5kILPbd0RpI2pu7q9g6mrl5p2Bklsughn7ELG93Decw/zlVeAyzc1vX3wQEiSuP69UTo
 /Pa0uzk05yMyKi4Pq9vGxWutLujLwvY4fmTkboFAxyI437R6pgYqqMXLSczofNLvOEO+
 +bX/saMrth3bh1oZPwCKQgCLp1LjhV00mr6CeWRSaNqf4E4ro0DAY0o5+rnx+h+NPInS
 2j2Q==
X-Gm-Message-State: ACrzQf02jB42gm39Te0DVUfIn73QuVuqi4exJUT30VmH6sF6fkIHGs0l
 x8OuTS7T4YWU5f0BRXY6NIKQBA==
X-Google-Smtp-Source: AMsMyM4bMv8X2l3axxRXBvUc+yU6M49iZMEsYIEYQjPgxc8If280c7PBFJL+iGRW+647aZKCgEPsng==
X-Received: by 2002:a05:6512:6c3:b0:49a:d227:1b5b with SMTP id
 u3-20020a05651206c300b0049ad2271b5bmr13138341lff.386.1664378435773; 
 Wed, 28 Sep 2022 08:20:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 03/11] arm64: dts: qcom: sdm845: correct slimbus children
 unit addresses
Date: Wed, 28 Sep 2022 17:20:19 +0200
Message-Id: <20220928152027.489543-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Steev Klimaszewski <steev@kali.org>
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

slimbus uses address-cells=2, so correct children unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 9db1fce6b198..2264bba69f84 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3841,12 +3841,12 @@ ngd@1 {
 				#address-cells = <2>;
 				#size-cells = <0>;
 
-				wcd9340_ifd: ifd@0{
+				wcd9340_ifd: ifd@0,0 {
 					compatible = "slim217,250";
 					reg = <0 0>;
 				};
 
-				wcd9340: codec@1{
+				wcd9340: codec@1,0 {
 					compatible = "slim217,250";
 					reg = <1 0>;
 					slim-ifc-dev = <&wcd9340_ifd>;
-- 
2.34.1


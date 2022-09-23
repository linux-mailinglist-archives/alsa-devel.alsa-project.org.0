Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D85E7F90
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E79846;
	Fri, 23 Sep 2022 18:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E79846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949953;
	bh=3XhbU7h5obbjFdGCVrJz1FiLjAQihfNNuBMXlWvXliI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khKeYGgkqxACnm3sPwREpWGfm1aEgIatu2fHAWhpN2Sy5Vq+yglbZlhcI7CpQsu5e
	 IySfCRf4SMyWQVEY8JpRoNtUSanvPdcKH1lhE/ncvYqAneKuewWZK1RQ14XSqo5/h6
	 mr/dMn9WDKQbYgztvghToP5rrQRixriEkEtWR8Sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB801F80579;
	Fri, 23 Sep 2022 18:16:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1400F8055C; Fri, 23 Sep 2022 18:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 629C8F80269
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 629C8F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vG4aYOJx"
Received: by mail-lf1-x12b.google.com with SMTP id a3so1031643lfk.9
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Lrd9Ag3kQFn9grspIehTV3wHAbbn3W40XhTDucisaac=;
 b=vG4aYOJxubPZ6k9oOUcui4yAtG/ezr3PvDauAplq08/P+NNbTbNPO68rKy9FIafKJz
 ItDxDpZoF/3bTCVijyfn/6M7dPZ9XxWqM/H0/Q73hcVZg4xurB1GXsCW2Vp5X048MmuZ
 25wJxkhP/zCA29qRe2PWiLosjZkMMLfqPg13MPmVguIpOLEyuYD2wM1JD/Vcx91UhD0d
 gtCuTIojnGZCqWUcQWZJPijrXrmgRN0Xis3vzs0FpuPYKJ8jpV0sTy/iws71n9p2764G
 bJoxTL+tJNgoE0XeRgP8ursMOZCg2k7BuAnBPjCwvOQJufvCGCjPJdV61SU2xmkYAnzQ
 g6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Lrd9Ag3kQFn9grspIehTV3wHAbbn3W40XhTDucisaac=;
 b=6MKW+IZSE1lP/8uztou/EWKgOjXxYco6+biBbW0V0kE9dkiJlxCZ3onmXeeIxNOi0h
 ssK5bq1pXnyu4OA++i070h6c9sfNnthY1GyNAmATvOC12NEJOzBzPdh1tJ2pDDolbsd+
 A5vj8cTaTK18IE32MaYlypztD4PUYYguO8A2v+tXtnnNJYvYHL5IQu/aqBuGeq79bbFO
 Q11uxha7LqsUpPpuj3FhY2rMEXbKPcI8WrRVCARWhrmbpqVOnjzwgU2iX5qjlVh/WXFl
 cz1aGG2Mw3+qYpx1qjaxbe0R/eDDLUY0Yx/RnYu+HPFdTXKRzS+vfHTv+ayCJvBa9uYa
 Ripw==
X-Gm-Message-State: ACrzQf1Smf86c71Rp87VEyt90rKyfeN/ZhmgjH1xUGZIWv6rSHQiunEf
 tbp0FjBikqKo9MxtFviKJ9GsKA==
X-Google-Smtp-Source: AMsMyM48qFkxH4H4cuuFPOGwgMdTwjyoFcATid7MMqAGbHlAt9ZoXGyDzoY0GOQ86U7VI1ol7rP/JQ==
X-Received: by 2002:a05:6512:3159:b0:492:d660:4dd7 with SMTP id
 s25-20020a056512315900b00492d6604dd7mr3272431lfi.204.1663949769983; 
 Fri, 23 Sep 2022 09:16:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 03/11] arm64: dts: qcom: sdm845: correct slimbus children unit
 addresses
Date: Fri, 23 Sep 2022 18:14:45 +0200
Message-Id: <20220923161453.469179-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
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

slimbus uses address-cells=2, so correct children unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


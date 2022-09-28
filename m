Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D615EE021
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7721B1614;
	Wed, 28 Sep 2022 17:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7721B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378548;
	bh=UAP3sv+2BCKOMyPUKp6yBPjUJLF3S3wNX+/tVIIZJlg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITxmr7K1yuusXNSPhvJv5CV1ssnpfCdL4OoAnyc30BvARV/qrhLS4+HiO2BJ4ZzoF
	 l2pHZApDEblIlC7jjrpmp0Y/4Hw7GIp+RtvbiMVlZ5HN0xMyoqDg5IrCPleKxMyPs3
	 T5/FNe1OhwesptbaPLJywZonZ2O5v2TWBGmbKajo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6A0DF80537;
	Wed, 28 Sep 2022 17:20:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F60EF80553; Wed, 28 Sep 2022 17:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA3D5F804EC
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3D5F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ECypbLZl"
Received: by mail-lf1-x12e.google.com with SMTP id 10so20896336lfy.5
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nJKdZtRvq8vBlaQZJuT8tYogYRM3UsmdrKTxy6xD2iw=;
 b=ECypbLZlEBc3Z0/O30Pgb3Wuvkjh6iruZJgk/EF/uCk7saaGA/yDzvJh62ro/qVt6b
 w01CCdQr1JDsRaOPdeIjbE3+gz4trI87d/gth247bcrjHFq2fF4ReuPcsU4FJhyzc9Sa
 jA0K66MaRwnzATCEm4PGvHFGm+YruNrK0uL+i6Md0v18eMAsriPGIBotwuMkPP3eD6vR
 m0VnTQbvUSyC9rH7zICG0YKNWVqINMlo5nCcc4maDICcnj8vuoAsLv3h1M+UK/2Jyu17
 fZhjp9Bb14lKA7ykxL/Iq/mGneg/12VAp7kG5MKPSa//z8tEHSRaUt5D08ua1R05CKmw
 qvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nJKdZtRvq8vBlaQZJuT8tYogYRM3UsmdrKTxy6xD2iw=;
 b=sM1YSQCP4kKqxqFvY/jExbqn5SA9wDXm9aqS21lrdvCzk6FICzwLU6/MtV7jXcNpG9
 YHToXnN48YONKLKiHfVyodQPgpPLX4RjyPs1zZu0xwaD0+KprmQQC9+XWvovcpXBjACJ
 im0+iHEVNStBzb8G6zSlC6iKtgYN+d8w2k/81zDH7sEPq8egpYiWU2BliXsgx15HIQ2b
 if8Hsce9YuQtHnyxTW3INUzfhrHBZbjzLe7QWMvg1cKCQHqxVOrjxCGNx1G5epSSEpGw
 VhkvfNG0m1PsuEJfjTsGrNucC2JHy57dRRHuo3M37RwiWNCHVsatiQqOuRprX9YqN6x/
 BVpA==
X-Gm-Message-State: ACrzQf0DSJvzl3Mv9ZiAL3WY+DVE/OKLz5BsZhq6A45yUoZqcO66czPr
 UEwNUmE1HGckF57yL43LjQlJWQ==
X-Google-Smtp-Source: AMsMyM4OvHn5df/1ZdYKcsHcWuHyLKD/5xwVshBRv1ealxyNmTVpj9vuLVX96fYV7ZzhhZFuf2GAZQ==
X-Received: by 2002:ac2:518d:0:b0:4a1:c4ad:fe2d with SMTP id
 u13-20020ac2518d000000b004a1c4adfe2dmr7519443lfi.222.1664378436849; 
 Wed, 28 Sep 2022 08:20:36 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 04/11] arm64: dts: qcom: mms8996: correct slimbus children
 unit addresses
Date: Wed, 28 Sep 2022 17:20:20 +0200
Message-Id: <20220928152027.489543-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

Correct slimbus address/size cells to match bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 903c443a867f..2c5908d104f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3320,15 +3320,15 @@ slim_msm: slim@91c0000 {
 			#size-cells = <0>;
 			ngd@1 {
 				reg = <1>;
-				#address-cells = <1>;
-				#size-cells = <1>;
+				#address-cells = <2>;
+				#size-cells = <0>;
 
-				tasha_ifd: tas-ifd {
+				tasha_ifd: tas-ifd@0,0 {
 					compatible = "slim217,1a0";
 					reg = <0 0>;
 				};
 
-				wcd9335: codec@1{
+				wcd9335: codec@1,0 {
 					pinctrl-0 = <&cdc_reset_active &wcd_intr_default>;
 					pinctrl-names = "default";
 
-- 
2.34.1


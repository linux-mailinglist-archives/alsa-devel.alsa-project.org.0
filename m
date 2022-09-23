Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4935E7F85
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A8CC9F6;
	Fri, 23 Sep 2022 18:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A8CC9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949888;
	bh=UAP3sv+2BCKOMyPUKp6yBPjUJLF3S3wNX+/tVIIZJlg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kKwBaaZkFjFDNasWEQc+b1IYFiuK22Ny8eZx0m4s/2HOCXGQhB4YUDKemNOKXO+Pr
	 pTV45JJVNGmNpsl3aFBntoLGqneeCxDEFuM0qmsuiYK+eQB5WwGqXvEKezUkdPcEU7
	 Xey/qhBTacHBnJoirq4UoQ3tHuUOY4EiAzMpUwUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F21A9F80533;
	Fri, 23 Sep 2022 18:16:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B7D8F80543; Fri, 23 Sep 2022 18:16:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7344F804D1
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7344F804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Xfg1awDm"
Received: by mail-lf1-x12e.google.com with SMTP id a3so1031702lfk.9
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nJKdZtRvq8vBlaQZJuT8tYogYRM3UsmdrKTxy6xD2iw=;
 b=Xfg1awDmiUcpuVPcBMW/FiqbFFeQmvs0LWuSTrmgGp2qby6q1KdawTWyRdaIMvkGHN
 CttSYjA7q2t7TxM/DHGI1E6jjctpOdpZK4lrSCnGGmP6MHdUoZiAUl1qdTBiAiyFu2HX
 Kp6eTFdFGYBdsvvvVYYGBN2zFbx/NsnoePe1DmBxt4EiWnSIZdKd51mM5vezG52ZR3re
 LV/PeV3zrKUh9QIHB4NOsdhd1K/pFPce8ocQQuAnekN/vNkONipqEAYgrVitj/s30RPb
 lOD4ewemEaITwY+ApcwPqLhE0rF1RnZpg5VW5djLNMGVUT8EnRlwg7hd788Z+Y+0tR+H
 ixjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nJKdZtRvq8vBlaQZJuT8tYogYRM3UsmdrKTxy6xD2iw=;
 b=paX+q8c+b5uKK2uDahLnqrCwNF3rxBd7OlvHdXQczRO6ILPD1cBBDbbSWHQAhKUtyv
 9QM5Daa7VgAiulyTf6cNnlQKnMnkdfiu5xAjtGQbgrg19xqwpIqHBjIlEBguRDj+o6Jg
 gq00NN7swZf2g0b7ovfgakGiIX7haR9bqeK/jWEZBz9N9KpNzxAxL36csa49qVY+4mPq
 4EWAq1xz8NTelKWXO/xJnQbord75i+y7z3c1ca9rzmzXSr+lB1AmCuThh2yYErJnkVQO
 zPHsfcjdUr7BWnjYSFYf7R8tZa+16xSKBo+dClQiOEqF632iHF5zqOyPGnWDUV7u+VQj
 g8cA==
X-Gm-Message-State: ACrzQf04WR73lu7gYuNehmOFjc0Cdi/E6fDSNi6tGLSOzJVpFh4kJWCx
 x3KXmntrlbMPvyDcNUwG+clCKQ==
X-Google-Smtp-Source: AMsMyM7pGltPmmGkuAEHAcrGUgl/lKfRBdxAiWjL6WRo3JAsU/8+hmNR9y1u0n50ycApnB7uOANipg==
X-Received: by 2002:a05:6512:b8b:b0:498:f32a:3c1e with SMTP id
 b11-20020a0565120b8b00b00498f32a3c1emr3355951lfv.123.1663949770909; 
 Fri, 23 Sep 2022 09:16:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 04/11] arm64: dts: qcom: mms8996: correct slimbus children
 unit addresses
Date: Fri, 23 Sep 2022 18:14:46 +0200
Message-Id: <20220923161453.469179-5-krzysztof.kozlowski@linaro.org>
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA165E7F8C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:18:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D53383D;
	Fri, 23 Sep 2022 18:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D53383D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949926;
	bh=P5sgxQwL30CjeqUJkajH4E0CUPxIvOOScUMxW7bV9lU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYQoctcCOGDbngeXNE4ZYtM79VnqLTD9omiicV1cj6dtplBVeI3srkdTgyj52MxZc
	 G/szfJZg3YhdfbMZiRXtXIviULTNuxZbxTlPKXm8rWWvRXfGQSIJSmdnihjT67VZWY
	 1xlmJMJmOvV6QJrZmKZUIP1iftBB1sQy8vu4dZR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE6BF8055C;
	Fri, 23 Sep 2022 18:16:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D8CEF80559; Fri, 23 Sep 2022 18:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AD77F80538
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD77F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zVQQekk/"
Received: by mail-lf1-x129.google.com with SMTP id a2so1055077lfb.6
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Fxkwow1Xm3fK1Et6nbVH+mRVG5q33XL6HKbPhtZeFeU=;
 b=zVQQekk/Mlp72KLlSivea4gGYJ3+w8T0iZz9rqlmj1KrQoqhrt5CMvAKI+3nytIvf1
 b6PHZ7jbhUZWnZHnLm8zYMZo7jScJv5N+k1SIAWM4gUduDVyapl0IpqVTcguifIgJDyu
 2WxK1oNB9kTTAqUPljJvjjZK0l6emoxCpd59vCKRxMlMHSVkrMCHYXKsH674AwvVNO6A
 1STnB9IJIh47ZHxyS1Z6vXe2NNamlMgvzv4H4S41vzaX8nuVPBnHm0IyaH6yFTOqpTZU
 hfPqIbix3VMl/R8F7Ynh79ME2INbUWU15CBagKknzqbz7JtGDF0+qxSLQJ7GKfMHuzfP
 5RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Fxkwow1Xm3fK1Et6nbVH+mRVG5q33XL6HKbPhtZeFeU=;
 b=pdd/se9lD1xOejFmU/h/+vXaTeabdvznG2X5afICkaNVvnqGjuDXh4AF8g2iIaKRQy
 GhaO5QRvlGBK4exVesGJysQUNiC87B1Qu993I+bHt6CYdl2+JEa14fobb6SqL3zfto1G
 quW+vYfUEZfQzIOYJTy+iUGkOKdhl2qneA8mPqHUOCsjybBxK1vtd7IHW/CDe4ekhMSE
 OPe27EshV7q7xhnUfYnoykeTUJHt6eaEvk1sdh9OsIPu1LNdaWWgEwAK79V6x3QdVWq3
 oseLmtbaMwVFPY/HSX7+9m3ijE/r1wsBZwIq042u3E8JgW+4G831taiYskUp2Oc7elNX
 KHug==
X-Gm-Message-State: ACrzQf0HxlX98GJh1VxN9fHbggPa3kHD2rRjgvvvNWxVuoNkxpjWl4Oi
 2Kw+0rAeAxB84+wjCk1JtS3beA==
X-Google-Smtp-Source: AMsMyM7DOObn6h8MdzBToiTAMWV4GmPp6zELz5cw/q+cXHcV8zqF8A6H+UUYK65xFZ/CBSUZ2fa2/g==
X-Received: by 2002:a05:6512:10ce:b0:49e:ad1f:3d7 with SMTP id
 k14-20020a05651210ce00b0049ead1f03d7mr3327874lfg.609.1663949772788; 
 Fri, 23 Sep 2022 09:16:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 06/11] arm64: dts: qcom: msm8996: drop unused slimbus dmas
Date: Fri, 23 Sep 2022 18:14:48 +0200
Message-Id: <20220923161453.469179-7-krzysztof.kozlowski@linaro.org>
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

Bindings document only two DMA channels.  Linux driver also does not use
remaining rx2/tx2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2c5908d104f7..8b31f4655cb8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3313,9 +3313,8 @@ slim_msm: slim@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
 			reg = <0x091c0000 0x2C000>;
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&slimbam 3>, <&slimbam 4>,
-				<&slimbam 5>, <&slimbam 6>;
-			dma-names = "rx", "tx", "tx2", "rx2";
+			dmas = <&slimbam 3>, <&slimbam 4>;
+			dma-names = "rx", "tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ngd@1 {
-- 
2.34.1


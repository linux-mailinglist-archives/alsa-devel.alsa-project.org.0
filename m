Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDBE5157D7
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 00:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D4115F9;
	Sat, 30 Apr 2022 00:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D4115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651269930;
	bh=NiRqID2KbLl6kxegULZqRjH2szoblFzNFB5sgXlMMuQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T14hZM0GguqlGiXTsWQAobZWhAKp7DmSOJrmKromkxzfQuqTRa2kXdoKO12nnRsnT
	 Eh7R5jxBTqNNPN6aFGBdKwRbKeR8bP3PnuG1rKMGi9VVnVHIxozeAomHCqT9SJiitN
	 ukMSrlV7U5HPvug8crR+k5RAmEilLrskq3pcPjwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD26F8047B;
	Sat, 30 Apr 2022 00:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAC90F8012B; Sat, 30 Apr 2022 00:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07DECF8012B
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 00:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07DECF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aBZ84A6X"
Received: by mail-wm1-x332.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5448879wml.5
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 15:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ngAHAx8KCTZqbA/wVhf/k9wvjiY7TwrBlQ520mj9F/4=;
 b=aBZ84A6XYuRroZXuADMKuVKuiABfQxp6erm24iGZxALBSAsyoJg8sVqbwTb3ELkHRW
 RTAnZ5w9yk5l2zE2KaF7KMxIaYBc7+G6wkuaXhyhsZSAAQxY4HvUgfQ0YDLjcM2n/GK4
 EpvWmWTI+ax79bzPrVXkYY0pDp1Z4ATWp2ANK7I2teOnJ3gFwXRnSfnWMZBy/c4v2lCh
 TD/BdAZIPm+MqCuDqSPszjMhaepnn4wYFqj0/dKRJNDHSseXLrkIAEqTtX7mX3AGdDg9
 z9ut9RF+dMddYLFfDPzRDCr2jRUXcUvA5+VWVDxV5Rz4o+ykBIoPOLlKKL4qXs+UIJC9
 zM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ngAHAx8KCTZqbA/wVhf/k9wvjiY7TwrBlQ520mj9F/4=;
 b=4hbMvX5AVqtP7kz3+6i8j4wr/6OwojoIB+tzDVXAbDDZFPlTzOq+jo57Ocpn0KC8/g
 zJchRTKnYi5qj4pnB+jj4fxXIPsqO12+QaTC4uYxRbPm6tyYHTeMygf0niGrpR8+tZlU
 oie3cfkUt7Gy7chT4PatBR552ziBh8nrCFypMRlZR7772J0sOUB2+5a7qyYvx8hmXMlb
 Fso2WkOwA6Zy3o2F87o6Egp4g+6w8VToJDm8HwXpAH8JIPk+3EOIlWNSFps6WMcMdsMt
 vl9RWHozM+UfRfyKrGyaVSZqFooSDae1bbVxLcEeZBCEl3zeJj+Qa5MHyHIwH7dsfbmZ
 3vQg==
X-Gm-Message-State: AOAM533C6X+iI8upplWIRIqLO1HOUR6z7fVdmHOhrXBCKg/bk9enMKzz
 8nOoS0fWwba35JXc0OYW16I2bQ==
X-Google-Smtp-Source: ABdhPJyKUSsewMfq0OpVMM/q5rmJHwonDZeVA4hBkJow4pGLOm7E+ezi81qsjihjWs3T6BQNDzW7+w==
X-Received: by 2002:a7b:c181:0:b0:392:b34a:96a2 with SMTP id
 y1-20020a7bc181000000b00392b34a96a2mr877535wmi.48.1651269834379; 
 Fri, 29 Apr 2022 15:03:54 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020adfc70f000000b0020c5253d90dsm338311wrg.89.2022.04.29.15.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 15:03:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: Fix apq8016 compat string to match
 yaml
Date: Fri, 29 Apr 2022 23:03:49 +0100
Message-Id: <20220429220349.1142759-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
References: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 bryan.odonoghue@linaro.org, devicetree@vger.kernel.org
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

The documented yaml compat string for the apq8016 is
"qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
lpass compat strings the general form is "qcom,socnum-lpass-cpu".

We need to fix both the driver and dts to match.

Fixes: 3761a3618f55 ("arm64: dts: qcom: add lpass node")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e34963505e07..452cdfbf8ef9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1392,7 +1392,7 @@ sound: sound@7702000 {
 
 		lpass: audio-controller@7708000 {
 			status = "disabled";
-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";
 
 			/*
 			 * Note: Unlike the name would suggest, the SEC_I2S_CLK
-- 
2.35.1


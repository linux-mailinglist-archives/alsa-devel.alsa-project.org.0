Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82955C0D7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 14:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78401658;
	Tue, 28 Jun 2022 14:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78401658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656417978;
	bh=A+LyKANzIxnDJ/JSpUl/mkENtm6E9fF26Gte9GpwP6g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mXLlP642latrjXU2yaZuDU6aqFopxnvxJC2tb/f+TniQ6gdAoN8Ji2ahfYh+2ktxT
	 VqNA5wSYGfen4s0E5iAb9KWUPFxvhJiD7R6Nq/owFkDDauXDTFrQFUESh3JvPuDuW7
	 oQ5cLg97uxTy8IEa0mpl3WMC/WAluGfdwx9AW7bU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76166F804F2;
	Tue, 28 Jun 2022 14:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9BF7F804CF; Tue, 28 Jun 2022 14:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20EE2F80167
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 14:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20EE2F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="m3vTwS/d"
Received: by mail-wr1-x436.google.com with SMTP id q9so17362986wrd.8
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xyE1UAgMW31jME2wx6Txhct6npxMtKTSOZN3VWFZNHw=;
 b=m3vTwS/dP8Fe6wpZeS/CQG9ugsk3/odZc3WP+Bfsr3fKin6P+AUs3nuxKWP+qOBk0k
 Ofisb+kLd0uFcPR3clSCtQwkzAFzITwoh3AgAuAEuDpvpijcRVlaf9O9j9EB7r9zW9b5
 vS8/IKQr9Vgqd7dfRGp4frugIvbrnZ0Yu6BeafktCNdj92hMX7G/Vr2TK+HjuT7QuKFO
 Gw//2e/AfNzs2rma+RFnN5PcekzAKGkt+mmqmiKegpOa+8GtNLTSulPEcI233ZhWK6ye
 81FWM0JrwlEqX0iG2s4h3lWis25+gG5YRtzfys8bLC73stUm1iBO3M8rL6WoH7/8VRix
 biTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyE1UAgMW31jME2wx6Txhct6npxMtKTSOZN3VWFZNHw=;
 b=Q6dH24KLZEfxVKBlUC5/VN3WbAg51br5IRqB1gxyRXLoTclkQ7TAEu0r3QXyiGRyV/
 Mq8id/LW64zZs2TCQrNl2c6u54+pubWqDpvDN41Sl9jBMLYkENcvNqmfxGQXOw4jVdQw
 0LkuzqDRZOTQNCgQ7Zd3TwY0kdL4hdsjXnWjL77L1ZV3k5xbm3SsU90FpBG2gBBJLbMy
 5caSb+sUjUAKi1nAGWXQYmOswSO5M8bQMLmwjePzk68zyaGo9gAvCi4n2iR+BLeTk1Cb
 Gij4nOfs/u1KYWVcw1sek9e2KrK2gC2UxJy29fMeZPWTkK15Zk5J2srDDv/O2uPqqqry
 pv9Q==
X-Gm-Message-State: AJIora9gr4coAtdFVgKz5a8J2tKhMjegwhtktWRtjXQ+FojPma4MLUFa
 WO0Fng4HhNzcKrssliN7EMc46g==
X-Google-Smtp-Source: AGRyM1sIGgkLsPSHOSBLRUUGIuQR0r+aLMYB45/sEFZDsRlArA/bkN9r0zZG2vSMYwT6ccthSxkwZA==
X-Received: by 2002:a05:6000:1705:b0:21b:bcff:39d3 with SMTP id
 n5-20020a056000170500b0021bbcff39d3mr16525829wrc.502.1656417881302; 
 Tue, 28 Jun 2022 05:04:41 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1c7414000000b003a05621dc53sm1457737wmc.29.2022.06.28.05.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 05:04:40 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	bjorn.andersson@linaro.org
Subject: [PATCH v5 2/2] arm64: dts: qcom: Fix apq8016 compat string to match
 yaml
Date: Tue, 28 Jun 2022 13:04:35 +0100
Message-Id: <20220628120435.3044939-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
References: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bryan.odonoghue@linaro.org, krzk+dt@kernel.org
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

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 05472510e29d5..a101b2871d5f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1422,7 +1422,7 @@ sound: sound@7702000 {
 
 		lpass: audio-controller@7708000 {
 			status = "disabled";
-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";
 
 			/*
 			 * Note: Unlike the name would suggest, the SEC_I2S_CLK
-- 
2.36.1


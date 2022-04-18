Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74913506B80
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0551C1845;
	Tue, 19 Apr 2022 13:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0551C1845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369306;
	bh=cdGSVuap4GmSgx3UR/OMsX584RLmNF42q8GVFue1EPM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bE3nEFqSKz2kR2C4sM6FvSVUJGQbf5XniLOT0BAwGN4tG3Gh8eXCObPH6upjQ+69O
	 5FVo8mEsIjREObDgqIFXaOlkzlVveKwIRSalbfQkbBYUcRSu1Go8xPVOOXfFrwCE3/
	 /fEE8conxN/TNi9vlVmiLw/Mde437KkWbxkTckeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7035BF8052F;
	Tue, 19 Apr 2022 13:52:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE537F804CC; Tue, 19 Apr 2022 01:10:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02D13F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 01:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D13F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sn995jmC"
Received: by mail-wm1-x32e.google.com with SMTP id x3so9562106wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 16:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ma+BI04gWQ/Gx/6CZ1w2tfFPMhM4LqfFZ+0ix0uokDc=;
 b=sn995jmC9GwrvezwLe/wPpk9HKgCzMu5unxZVJSGWlsh/1sppWsfFVyua1x9Fvx4wE
 Oc5RAzmQUO3zAYbmoX8dB3yNfj1M7std5yQURF1F9EhdLwnPa092GMOh+kBnRowY3CDP
 0F6z/T4dLsYimB4ety6yryRzZkb9SEotDufFbwGdTlltEDE3Myk1mQ55SOa1dQYYXKxK
 e+qnBmVu+oYLqMLeghYG0LkA25MJlcXDjRoeJq0upgCiaXbBPL9VU93yXxVzyE7gY4zU
 dUSrMmi7f+9C+z2CW8jqc1CLn6/iFf8L04whaEFD4+kpQKSC4PAii3sjz0hevbJ9PE4g
 9yBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ma+BI04gWQ/Gx/6CZ1w2tfFPMhM4LqfFZ+0ix0uokDc=;
 b=q2i/K/0J5CrsgzqAfmxkVobbhE6OvtAAlq6Y//kLCgIkDhatVoo71nBzmhI2Hhzow6
 V+puxC8uQKsX1dSymbqYF/KyOWZAd/KZMVb28hdAqhnkHtTlRTE9ogFRhUvbUO3fBFHS
 QFrhEKx8/QNDEf+h5qGOEpnrarAVygibOT0HTFOT3nnFolqHJ6bmIKds4I452DZZ3mx6
 0iP7HWhV1bMI+KW8Z1pUbKfIgjx7g5TY7AQteSASJl5kG5UfU3GTHXYTV/cAvfddf5/9
 1q/2gHuycZL1b13c5BFEQ1qlzrOxL+crjPUaxewyrzKzP7gxrLYoEVKvn2pWr6kC0VVI
 ibmw==
X-Gm-Message-State: AOAM531fWwV9uSO3rLzv1Ik2aJZzUG5+Ydz9SDeHe22lieHCgGfB3HSu
 jYWghkk1khX9RKwq/Y3o0NBkug==
X-Google-Smtp-Source: ABdhPJxZoakdFldpRtcq6a2ls92ZkmEbJCnPj7ftc/9xkMmnC+iEseDaL40CILgi9S2lK4t9TpdYxA==
X-Received: by 2002:a05:600c:4ecb:b0:392:88ed:1ef9 with SMTP id
 g11-20020a05600c4ecb00b0039288ed1ef9mr13078107wmq.68.1650323401217; 
 Mon, 18 Apr 2022 16:10:01 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 f14-20020a5d568e000000b00207ae498882sm11187567wrv.32.2022.04.18.16.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 16:10:00 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: srinivas.kandagatla@linaro.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: Fix apq8016 compat string to match yaml
Date: Tue, 19 Apr 2022 00:09:56 +0100
Message-Id: <20220418230956.3059563-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
References: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
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


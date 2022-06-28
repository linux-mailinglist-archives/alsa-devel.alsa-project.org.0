Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DE355BCB6
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 02:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C41F167D;
	Tue, 28 Jun 2022 02:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C41F167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656376253;
	bh=63SQ21f+Y8cAjcbc+0Hs++NtB+99gYL4fWWYWAI7o0g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OX0cb/jiAjW7vyNEDmYxSZHdgnTh4OvHZ9uABOdzzZsmxt6inJpUHcLDxJTHerES8
	 sMQ3MoG42eiMb3ahzhPT6BonFfdBm5NHN0xgf0eGEtzUvBJhbcy4sYBoNLbOT9izie
	 HkAHtEKCpo6dQFqCI1TfeMZwFj6jX4emsD+tCyYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0627F80537;
	Tue, 28 Jun 2022 02:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37539F804F1; Tue, 28 Jun 2022 02:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7EC2F80107
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 02:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7EC2F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jUicXQ60"
Received: by mail-wm1-x32f.google.com with SMTP id
 v193-20020a1cacca000000b003a051f41541so231565wme.5
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 17:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fOncqFOL4cD/VqA7SHbK/ZWzLlcJK+/jxUQrf4ImoVY=;
 b=jUicXQ60nek8n1EEGGxuKrtitiKBRfagX/FCmNl3UYrk3zH+/ILkjVYOAXX5iqkkc8
 eSVppRQOId2GpSFDlsJs6XLTU+w1mOeJvLJWldL6PWaK1oMwQ1WjfwEOSV4NueK31e/Q
 RXOQ+h+6Xf9cxcNOjx+PbpLybB03ItEhYSiY8FufoiW5sTNUe1fm2xXoiC9uAoN46pFa
 Kn0pEevsQZ3HucUWv6aCu7p1KR4xUMKQbslflginRbIWB0nEvohd45YRCLJnlrTOu7Zp
 RwOSL0gaK3jpk+Dn+WAcKoeopnD1gvy/9qBY/oYfaROsjnM4JIRg6h/bxE+2VjmPipy3
 iEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOncqFOL4cD/VqA7SHbK/ZWzLlcJK+/jxUQrf4ImoVY=;
 b=hwcGGKv7meIlMP7h6cXNHUxuNusBWyl0xwm4ps/LVGFRk+5sElqANvXZFTrtt+RWZ7
 8e+H44d/NgrTN633NwCYHqE7z3E1aQrdpdY5ce3bRKkIHmyd5FEmOboObTuWBU/6w2M+
 Z4LrJvF2oqbi6d+iQH1mlkgSkSo8Sm+DfD6qTIxdP3/yi2oHR3LxRRTiLf+6JVyhrMJs
 4xkfXj4JCO1y92Jppul+NPTWYQIi1jfB9S32OgLLLKxKV7W5m5kQFl37p2wGcjJb943B
 5czGYWJpfpNuYbf9a6n727B7wYPLe1d2iK71gu++wrx53mcCw9YEQLVFHEPiffq4ddkP
 KCzA==
X-Gm-Message-State: AJIora+OzK5ONCFy/wc3vA2mr8en/TG7D+Y1mtn2lWKWv8BoWJxmsFPZ
 ue3560yxrY1Lo/NfyLPAgXbIAw==
X-Google-Smtp-Source: AGRyM1tShn9JTmkar8VZPVp7ofhESWrbGuYNgwiUOu6137frSg1MIFQb5WD7Mc8deWfRoNsYXJ8/Og==
X-Received: by 2002:a7b:c24c:0:b0:3a0:4d4c:dc96 with SMTP id
 b12-20020a7bc24c000000b003a04d4cdc96mr5633580wmj.111.1656376144796; 
 Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b0039c5cecf206sm15863560wms.4.2022.06.27.17.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	bjorn.andersson@linaro.org
Subject: [PATCH v4 2/2] arm64: dts: qcom: Fix apq8016 compat string to match
 yaml
Date: Tue, 28 Jun 2022 01:28:58 +0100
Message-Id: <20220628002858.2638442-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
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

Fixes: 3761a3618f55 ("arm64: dts: qcom: add lpass node")
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


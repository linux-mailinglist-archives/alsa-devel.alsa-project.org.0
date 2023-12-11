Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47B780C9EF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 13:33:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C2CE73;
	Mon, 11 Dec 2023 13:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C2CE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702298036;
	bh=GjEzsMXjmPMj5tgut84noNDMNBftQAdWwb9x/4gmPJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D6iz5+sY+iz+I/OWqb3Yu1I4spSEmxDB0xh11CvyZQj31a2G8G/t+U10pqmcPMnlF
	 m+lHuhqPCbGJFe2+A61i3nI6n3cb9LcAHdjV6psL303PSXbUc3f8K6sOaPOTjjmJzZ
	 X5zDpdi7Ro5ZvxttWrR0oEQbHz145IjVP8tQzDeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 877C2F805EE; Mon, 11 Dec 2023 13:32:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9347AF805D8;
	Mon, 11 Dec 2023 13:32:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91E06F8016E; Mon, 11 Dec 2023 13:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C97D4F80124
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 13:31:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C97D4F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FO2MeFTZ
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c0e7b8a9bso56565975e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 04:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702297872; x=1702902672;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fHF1MoshH1NMiiExL+9DYVxymX7ra4O3Ex0Iu1m030=;
        b=FO2MeFTZHZ8XwPN1y+kpbAehJgfxHdirLvG5qE+pVVz2VU5mm5ZEgA9P8vmr3j0czG
         6nJfyIGGq4okIkDYZNHAch7AeO8f6cTzPEPVXQVDbnhT8tXPPgWanXqX4QRMhyM0Lmrh
         e3E/m9bCXsRs7zveqNczC6T7xU+XuGYavVtay73Zg+8OgF/ggTORp0G1idyhO9Z+f7/B
         sSxvyEdpODAZ92jMcFUaBuXw8YAo0LSaRxwKfNpX1POKfc2vFtIDJGDrcGYRdFQ+4Upr
         +z3j/298AdA8aSUP5fdLeTasuHmgrAYZkpjZkEswC+5ExKaEt51P1oA6gJo/MDk/d0e4
         fY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297872; x=1702902672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fHF1MoshH1NMiiExL+9DYVxymX7ra4O3Ex0Iu1m030=;
        b=CCmgawkjVYKvMPAZ+BkYArixRv6Q7h3ph0tr9Y8f6UzE+MfKShEahNNSR3CrltzN74
         bL1bcSHfTOIG5HdZqitND03F7mIbhaFJfZwlowA3Ay1Cqgh0+wUkTwt753mR/CXNJzgd
         WvFl4lezcqpuugsoUbZSKhNItg3oejLXIyLEfAUZ5KRhNpvhKte4UEh96HNQq/soycJa
         Op/bDQq1oF4/KO4mXPrcMlVi7u7iJTusnNV06BX45G3do6IWWxP1u/NK27r3Lr+qxlUT
         77CwE+dqGUd4i31aZuRP/mNPdMkNjl7mmz2ioBmcy84oc5jJ5pgBREJw89NrLVuIHL4Z
         sTUw==
X-Gm-Message-State: AOJu0YzKYnsPiJ9j8pAnLdxDxEXNS/tk49GDRrqhm0PDFmbjtwrhRwhe
	eSzt0kTX43Dvpk/Ke2++YZftSQ==
X-Google-Smtp-Source: 
 AGHT+IFhLh+o2/YSAv/NSFuu3qqjkPLbe6RTQxxI5s75iK6leejwAde+aW5OIximFnGDWjYIaPxR7w==
X-Received: by 2002:a05:600c:1f1a:b0:40c:16ee:3219 with SMTP id
 bd26-20020a05600c1f1a00b0040c16ee3219mr2528379wmb.165.1702297872668;
        Mon, 11 Dec 2023 04:31:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 s5-20020a05600c384500b0040b632f31d2sm12932313wmr.5.2023.12.11.04.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:31:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS VA
Date: Mon, 11 Dec 2023 13:31:03 +0100
Message-Id: <20231211123104.72963-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IBL7ZJJNNNGA24WE3PBE33AWLOKU2ML5
X-Message-ID-Hash: IBL7ZJJNNNGA24WE3PBE33AWLOKU2ML5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBL7ZJJNNNGA24WE3PBE33AWLOKU2ML5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
VA macro codec, which looks like compatible with earlier SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index ca6b07d5826d..c03ff9472a85 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -19,7 +19,9 @@ properties:
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
       - items:
-          - const: qcom,sm8650-lpass-va-macro
+          - enum:
+              - qcom,sm8650-lpass-va-macro
+              - qcom,x1e80100-lpass-va-macro
           - const: qcom,sm8550-lpass-va-macro
 
   reg:
-- 
2.34.1


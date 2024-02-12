Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F7385143C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:12:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C60F827;
	Mon, 12 Feb 2024 14:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C60F827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707743520;
	bh=q26xy0RgLyg/jgOoRIiuTBV+Qq9VjOt9WLdRQMJTi4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JSogw6vM5SCe3DP56hp4djQQobR0tFeryjErlYz9YHm4nUtz0crN5lFnwxNmKQKmI
	 H0+lzkHBQbl++JUkSfo0Q3e6xPm0V21dYktp/Hf8wVe4rjRe6c0WMU743MO0oXyk07
	 QXVq67CSx7eWYnrFWY+vqd4MZkMGf1gfPL7UJ2nQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABA7EF805B3; Mon, 12 Feb 2024 14:11:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C050F805F4;
	Mon, 12 Feb 2024 14:10:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1031F804CC; Mon, 12 Feb 2024 14:10:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D837BF8016E
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D837BF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wiE1VUkl
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a38271c0bd5so388823166b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743421; x=1708348221;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3YxY7MTjuSd/BMOvzsAl2Om+NYqMFmRsHTZC5B3VNs=;
        b=wiE1VUklQZCaZU4A/x/Ya/hYdUc/3be97KS34nQbts0NuoMX+D7fmMhkb/mkQxtpH8
         HFnMe3nKttN/yYq5BQkmVmKik/qf7x9n41fx73QIy4AHyfhMQhJEQVFy+GM2ghzC0yzK
         KqR2Cojn9Gy/V24uJ7KABy33PHm1JI+AwYX3EyA3y6ZdntixC+l8eiLfpxV/3klOrrwt
         h7Kc6s+hu0ZtORhfA4AHadcYDg+OVh00+rqxRtISOGGUBrvUJkumAz90nafGSs4bZPPt
         4OQFuiNuSpoLXnYw2I195pAZoBr7CvvB5TTrKugDLkNXJ54QQajGUmAojjssZiZWIYfX
         bBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743421; x=1708348221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3YxY7MTjuSd/BMOvzsAl2Om+NYqMFmRsHTZC5B3VNs=;
        b=HyF/MMB7dUarsYYJj5zhAerz2tZwOBF/0LJ7y5lFRgEd9Ov3sVLpNRTs+8GjP+ma5x
         f+vceXScYcZhP4aeWD+JUCaP1aJD2gavGgIOI/RHudTPwviheRWI7CNwOWyPLuPnhHv7
         IHZQCXjCKObefkFSqNSfuenf4V3+GqG1yqAkQSyu8LBo1Sksh9rodHHsoY1q5ehfrbqu
         lbbj5vwrUw0LtcDpYoLpZIRltQhGTTWKhp1LcIOcxB7iSYXITX0TVVtVU+cH0928DJZX
         glpXt8f4QVFK+Wh8CmqHc7RdJqYIOOenVBRaWYiK8nGaQii23dhiYZDo/rE66uGTkCzY
         iXZw==
X-Gm-Message-State: AOJu0Yx+/ZQ/9FbTpL91IcHua1hmHJ66PQ+rt5NMujSOKeV6QjRfCgHh
	VAMe9HqlHsopqf2/VdI4N5IC+06sZNR/B61vJb/eOUIvQd1vyZ2a/jwt3icBFXs=
X-Google-Smtp-Source: 
 AGHT+IEs9wj1jsQKzm/kk4U3j9kxrPRagZuV0hgdDTKxJr6XhT94I8eZQ0Zsxis6PXUyOtgQmcgTDA==
X-Received: by 2002:a17:906:3552:b0:a3b:fe76:d666 with SMTP id
 s18-20020a170906355200b00a3bfe76d666mr4896870eja.0.1707743421644;
        Mon, 12 Feb 2024 05:10:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWvH/ndhym9RY9fuwwtB05rpHM/ses9iieVGa45q7+ykdMChxwx6aPkrSYcNBkRQxhz2wm/QKCaTWe2cRrH6GI8GEuRcEEo96M/nhs0+KCOlfNUJOEpbTyPMnZxYN9aeCrtche9IVMzxenHzZQOmcMgiPLbPLUWSEdeaPkv+isL+lSSm8nl7A4UwKxvj/cuseHSWCLUWwAFk1HqfyY9PZqpnJNGOocr7HXf/E3oHUA1ZnWIQRWaRVamnwi+z/RO6wGsyksyarGyV083TyKNR7U8ZazwETqqws4S4Hlhro9F4DGCeG+n4NZdkpyEqCaGDB98ipXinJ2mXs2b1kpceSOEJyP9gs7CEAboF2FDVjNqn9YcQvqAAb+yPTV1TCj7GjBAy4lyyZ2TjIDx0k+Wkuuaco/2OWo/my8MYK/m2JFkNBqS3RLvOV7kE3QnGvam1J8SMYPrvTqPfGA8EFGmZzVQ4gcHrmFnoDUpJI800c3A+dAtFPFqLLczxCWM/hphB1PmqwKhC3Gq279Wlp4SFtstmRMJSVvVJXtNYnMIlSDF1C0WJbWdgowbB0YxdZQZvfgy7/IVbePQGn32mJ6Xo5bonvRQ8MGdneYbl0IKH3cWwmZ0QW4d+tN89VenVrDUxVOcaB0bEkumWC/ePu6jFAV32DAxO8EgCqGj3Qk2XhqMiKtAYm418AuHsiPFBD78K1RFhheBNNhjds9fqjoBS1kOWgaelb2k/Rnv2Mab1eh1P89UJlozwjN/Iuf3ZLUf6UtE+MAb9z6MOQjfS/PVXOgFhW/at2SDaTnc9i7GBkg0GAvXMS2/j3m1qvBYzCuulZqKFaakYdgFliFmvT6m4gPbxEfu
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id
 gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:21 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:10:10 +0100
Subject: [PATCH 2/7] dt-bindings: arm: qcom: Add Xperia 1 V
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-1v-v1-2-fda0db38e29b@linaro.org>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
In-Reply-To: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=706;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=q26xy0RgLyg/jgOoRIiuTBV+Qq9VjOt9WLdRQMJTi4A=;
 b=KYsGSSNWcJwe5h/iFyeyuB0SBVNLU3N7Eo8waXvmIVKJb2YHFeJiNM4EU9aFNIkrtTVvM28tU
 CKrhnDmIQi2BSI+XWRZ67t5oEwPB5bMA2wPoetf9mZg1Ml+J6b/fBjF
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: DFB4OOGM7KKB5CW75V36VAJIOELGQJ4G
X-Message-ID-Hash: DFB4OOGM7KKB5CW75V36VAJIOELGQJ4G
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFB4OOGM7KKB5CW75V36VAJIOELGQJ4G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the SM8550 SONY Xperia 1 V (PDX234) board.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2b993b4c51dc..fada660257ed 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1002,6 +1002,7 @@ properties:
               - qcom,sm8550-hdk
               - qcom,sm8550-mtp
               - qcom,sm8550-qrd
+              - sony,pdx234
           - const: qcom,sm8550
 
       - items:

-- 
2.43.1


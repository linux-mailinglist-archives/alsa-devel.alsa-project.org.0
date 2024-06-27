Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BFA91A5DE
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 13:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8285211E;
	Thu, 27 Jun 2024 13:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8285211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719489469;
	bh=fhOsLuyqrBwQUqU3KeH1GRGhl2FQpbGrlcG9u9+rBVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dvi62sga5e4cK1Vkr1e8eV910JunBVMWR1fQ0+fHhlwK5aCq6HPzC51e27ZGlPs1W
	 iNRaJVLKS/KTuC2mXUDR1E9CZ5ZTst+mM/mHGJDBbwGOFkHRoylgpwyeDieU4mSlWk
	 1zdPVH9dYJvy52Fy4oy0TfV0/DGZkuf05Rr0vWrQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CA48F8063C; Thu, 27 Jun 2024 13:56:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D3EF80635;
	Thu, 27 Jun 2024 13:56:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7138F8049C; Thu, 27 Jun 2024 13:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B669BF800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 13:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B669BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vpTL02Pt
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso7550034e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489366; x=1720094166;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piU6dixVwevEMvMKFVjdM2+dDBv8tkHRGk2Ym1RU0bw=;
        b=vpTL02PtOCvdvfk32dHPeqKtiQQ3Igv+QSpi77qZV5c/ZFt8gPmAVcbjiXcOk5o/oU
         fjMqam5vqK4PS5/7bTIfrVVU0AXREcVzKskE+GsEpefkCVwbKqi7NReOEU8NeNF3VtMG
         +FcgQWykA8u6TNhf6uHSj8GCkhK3xmWKtDkX37kkrBmzQCMVPL7UZmA4j8XkH9s8SjNs
         2EiIn/yuCgJF+7slEYFTFEL1YEBGTbU6AnkkCYiwSqBayry/JonJplmaAQyr7oe0yu8V
         TECSBA494MPyZdIUXqOIdInokgB/DuQAiU7LPlQ1ncFKrlGJnfdWgtVjCTm89bgGK+L8
         v79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489366; x=1720094166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piU6dixVwevEMvMKFVjdM2+dDBv8tkHRGk2Ym1RU0bw=;
        b=fhhtVvCibRZ6y1PhXuNBZc01lUON5Gn/uY/9PJ8RXrogqfQThhZsXituuwtM6wfL+H
         RGkiZ2qDshUBCiQ/EnTA5qJF1FDHk6NDQYYQytyVJCsGGHCoMGedEnLqIKO4Ub5JNTSE
         25OUAyg6+azuJyVzw2WawrGCN5F/JZlokgV95RVZlpgSjiXDkA5qXHfJVaRJXcyYKFxL
         1lcJ2t9MQIfwKlS/F0RGwSbBkGOO0iIdUXRpx1xg/t86d5OMIQluAcTE/gWg1dKOp45U
         G123id912ajM6wRIYGFcyi2Zi/IqJbx4wVA5XNXxWT7Dhsj045GWlUtykevi5//P0vnV
         O1CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXusxj1d2R2REj05kjB9Z2pSiu1ZmgTJXUbpa2xFhC+5jkf6GfthRykYKL8sWySWOo+D1wnTQfgzTctQ/P7j1X7EA0X3gEMhQ/PX+0=
X-Gm-Message-State: AOJu0Yz56uuEm0lU7tXjvk6dLRH8aiOxFPTotWdDzGRyuf7iB4gLxby9
	AD7siOiLlvJF/+xztwq/+PnYT411NEE8DEXr3VSUBATCuxVlcHiXg4WwxC4Shd8=
X-Google-Smtp-Source: 
 AGHT+IHrpS4FaO+MLa+HNiW45CgkKJteDWyaEAeg1DQpUOW+P5vfLDvcO4u786fvHvXTXhgmUZujUg==
X-Received: by 2002:a05:6512:3091:b0:52c:e54e:f84b with SMTP id
 2adb3069b0e04-52ce54ef9fdmr8943991e87.14.1719489366398;
        Thu, 27 Jun 2024 04:56:06 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:56:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 12:55:22 +0100
Subject: [PATCH 6/6] arm64: dts: x1e80100-qcp: fix wsa soundwire port
 mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-6-bd8987d2b332@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=fhOsLuyqrBwQUqU3KeH1GRGhl2FQpbGrlcG9u9+rBVA=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNN8VJANE2p5q7a9tQElvD/J+6BThXZJo1SY
 JISlTpiwtmJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N9nEB/wLOagPz2MWymeyiPZmgmKPaDEpckmNiW48ztjNspLG+XaXC/0zZDNJaNW4yBaoDFolpp6
 fU/t9kex0J1DPRyOltkiJ2CIkbyAyNCYOICpax+aogY+C4eFTrNB9YNNRolqlLY3qJ/P4qpgvSJ
 hyyjJxY/Aqj1TB3p3CWzLzMAmlUY10GMZ87Juje7Rn4TisWat05KCZCrQgY67mQWuraYApVY3Pe
 0qwNcqae067Cc1MKITj6GWJC5OFyjvumStp7sn4Syr6kyYu6MrDSlAaXC+HZd/lmTYj3Z3BWlzZ
 SqI6SNQ/hJC3sveXQrErHVC3Br9w9UBRZM7Bk/qGm1BiD3U1
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: 7RA5VXOYA46QID4MZONTOBZBXGEOEJ2W
X-Message-ID-Hash: 7RA5VXOYA46QID4MZONTOBZBXGEOEJ2W
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RA5VXOYA46QID4MZONTOBZBXGEOEJ2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Existing way of allocating ports dynamically is linear starting from 1 to
MAX_PORTS. This will not work for x1e80100 as the master ports are
are not mapped in the same order.

Without this fix only one speaker in a pair of speakers will function.

After this fix along with WSA codec changes both the speakers starts
working.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 4edec3212dde..79563ae34890 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -749,6 +749,7 @@ left_spkr: speaker@0,0 {
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Right Speaker */
@@ -760,6 +761,7 @@ right_spkr: speaker@0,1 {
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 

-- 
2.25.1


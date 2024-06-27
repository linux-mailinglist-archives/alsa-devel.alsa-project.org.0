Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6383991A5DC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 13:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFC65210C;
	Thu, 27 Jun 2024 13:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFC65210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719489458;
	bh=KpBwvqPApgC7BTXtL0cPb5X/4XDGASS/oIMKDjK9Deo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhB21Jf0gi2WRbfMiKzGylLeYTo00crLPr41p8GT5As6q8+2jjwmSx/7mxdl84SoN
	 IwcTZ+kJT4fQfkEctK/Sp59w8jHbq7tkIp/e8wW+BIaBrncVzmJNxzyDZFCNNmlGq3
	 P1d8rlbLVWFB4Oe9ENdhcw1ajO/54wNRVUiNDcp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59211F8061F; Thu, 27 Jun 2024 13:56:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3CD2F80617;
	Thu, 27 Jun 2024 13:56:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C54FF805C0; Thu, 27 Jun 2024 13:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24363F8049C
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 13:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24363F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cgpWiUeb
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4256742f67fso2386445e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 04:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489365; x=1720094165;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUAdAcYA0qOL/HQiRFHsxlPcPsEL1Ruth0kB6T0BP2c=;
        b=cgpWiUebuWk0r8whNjUHCJlNO/AFfK1MiwqXpI6tNKKIjbA7uJkLkgMKU8FxDFrVMF
         +k7qPqlwNgwcZ9+MbVXe8kT3TIuTQDi24QphZG5YWxhBHT8nHc/7wA1lgfjiBuEeSAhG
         +oj54jEdM6n867EPA/aC3cfmJ3wtQE7AlZdPHUaWsRmh6EXkdmpLdfd47o4fE1CoAPls
         rPyTE6Q/Ta4V4XNBylXLcakX0z0FaVvqdrzS1k1aT17+ubf197Q1m32Incsw4P9Zrlkg
         2mqV2S7Scj0zb4/PNej6S6T2v18v2N8BKny1008JoonnjOgn0t+Fjwkr/3dCQ4XcYW+Y
         BDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489365; x=1720094165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUAdAcYA0qOL/HQiRFHsxlPcPsEL1Ruth0kB6T0BP2c=;
        b=LIXvvcFcg9zxT4d+s/2nPg8UaDi9kUgFiJ9aCo8Pqs2IFF7UYoHVYIB16gqbhL77k1
         FTEvWBAKFUEexgjdxdh7QiJX5l+yxnMtyjqWw6g/HpiRNZewYwatRRQrPsNUpR3Oc6o0
         ALVUdDSx6gcWGm27AkcUi2QdY8n05e7g6e+FgRLSn4COypZGmBp9BklEHW4Hd5TP8jAI
         gcnfGrHuZtJEDh9c04D9BcMBecMf4KvF4pypvEkxihvgTy/3N+btlFtVAVqWxEikn8jD
         dBA7LRkgVY5ktA89ZvGSp02NyRuyytIF/xa4yNw8zG/Lg9dU/plnNbC4tOSwRbkn3fIc
         es0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFR3Z6AeeNHxnOZsGvTwNb6NfxJ83NGTqZU4dYikv/4pDZH/ceR8Ab2O63iOdidX4S6b+sCfRhvh1/XlGofRBh6fZLYTcVMLiC3Q0=
X-Gm-Message-State: AOJu0YxhevBGu1uLsR4ljijjQlnp+CpUI0fNN4CV+Q6eusbxgx3UW3F5
	U2US9DIfwRNKHHbVSUsKGy5gwj+ABEisGdqh9UlZSlVd+vu+grpNtmMCuTkfVuA=
X-Google-Smtp-Source: 
 AGHT+IGvW0hLop2OsW0c2VyEig+um838vsjHyARjdNe3qlkvb9DzxMySU8m1ZOUZmWWhoDlWsmLqOg==
X-Received: by 2002:a05:600c:2e87:b0:425:5e8b:af9a with SMTP id
 5b1f17b1804b1-4255e8bb07fmr34042215e9.36.1719489365279;
        Thu, 27 Jun 2024 04:56:05 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:56:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 12:55:21 +0100
Subject: [PATCH 5/6] arm64: dts: x1e80100-crd: fix wsa soundwire port
 mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-5-bd8987d2b332@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=KpBwvqPApgC7BTXtL0cPb5X/4XDGASS/oIMKDjK9Deo=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNNox7RstRcA2AkFGvJ//D8Zj2mIdxz2mpOt
 uopA1QtYqyJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 NzgOCACELIeGXVxIgRLBFFIwuTonBWhLIu1LrdDFExawQnHithYxq1bKfsqNY1UvNMceN0rcYLu
 6wS3R71OJihguEyOapPmykZIMgALSxPlCubv950d1NzP84IPnA41tkPdwHG+TpgWumqB5c0R1Nc
 0FXd78PXpT0zKRR6NBDC07Z308LDhTQDdSdnjXvugSNB3Rg+BgRHBcPOnqZlYxSOrJiXTw6VXQv
 nltrD93hCYSFZC81tjTrnTL/2iPU9n5mKxlghnA7plMb8+8bame8wqi0/scr7n597+ORxkyPi4I
 Zt94VxrT90adygGvfkCpY3Mg/YloHJzUSSCi7mf8RfFrorjA
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: Q34L6AI3YYWY65OQE6WCKKWGPWCP54KJ
X-Message-ID-Hash: Q34L6AI3YYWY65OQE6WCKKWGPWCP54KJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q34L6AI3YYWY65OQE6WCKKWGPWCP54KJ/>
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
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index ce80119d798d..67c5cd89b925 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -841,6 +841,7 @@ left_woofer: speaker@0,0 {
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Left Tweeter */
@@ -852,6 +853,7 @@ left_tweeter: speaker@0,1 {
 		sound-name-prefix = "TwitterLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 
@@ -892,6 +894,7 @@ right_woofer: speaker@0,0 {
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Right Tweeter */
@@ -903,6 +906,7 @@ right_tweeter: speaker@0,1 {
 		sound-name-prefix = "TwitterRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 

-- 
2.25.1


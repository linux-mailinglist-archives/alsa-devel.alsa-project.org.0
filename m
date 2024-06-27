Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83F91A999
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:47:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F34A21B8;
	Thu, 27 Jun 2024 16:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F34A21B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719499624;
	bh=2R23639fkPX8iIC+qUMimWznPuF4ISsfAKV3cLgsdsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jVi4TVmmzRwoXeOdZaSFpLdURssQ56kf4pypkiMtQH1JbwcbEigZPb6UwDOj2H0nG
	 u6/bqtCQJB2bm4pRUHSn7VANZ3cmWDpTdaQq90a1wA94u83tmtidBZlcZ57dOFWNwE
	 gHjWDPslXdMPqdCkx1NAoG1gtQcRL1hLGM0DPxqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0BCDF8069F; Thu, 27 Jun 2024 16:45:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50488F8069F;
	Thu, 27 Jun 2024 16:45:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E734F805F4; Thu, 27 Jun 2024 16:45:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C4EEF805C8
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C4EEF805C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RDHeZthN
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-424ad289949so18443845e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499495; x=1720104295;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/2h0WxI0Gkdc2KmSebeNCSc6/7iWl3nnZ9U6r19RMI=;
        b=RDHeZthNQKgeP8tT3uzs5+tZb7Oz2cVcfzR4KR9ADUvRPfbmWNSxpkU8SCsYCyVItr
         BkEyNBsaCj4DV+s20RAE1pkSrEG9KO44oZ2ryxcZmjy8+N3080ln0aYSabLzhIlCLyDB
         MvZM19S26zrpNStTOVpZfKEuhudN5nG/z6aehzhhVS8d7eCotv4VY0QdrRozvo+vhZgN
         8QzhefV2LR3JBIRmQzq6LnBOMxzX+5pGQJ5rPiMsylmeSJSQaLOwP9VnAUUVW7IJJa5q
         v5j/FTIbVE/l/5XGELJfG8lVItESJgOLv8qy7UR6SY/q8jco43WtivLoyXuIByBjzuM5
         i8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499495; x=1720104295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/2h0WxI0Gkdc2KmSebeNCSc6/7iWl3nnZ9U6r19RMI=;
        b=dr8QY1l3Woa5/HcJ/0sbKk5ahFxmDIhGR8go7bUYalMJTcuRPHz33RpNtE2qT36SB4
         nCgAyAYKabgg7n/g2TkHtVYAIoJFYTjvjJsobjwKRP1ib3HroT0tsWPD0DfwxwNwnVoN
         kVTNA4wVvC15coEQYvV6zQINmRlAltJGhE2G2u7HStgXJh0Pu3tIsdGbaR9HMsFcLDNI
         iV4VcegCMuQvApr4utoiYE8dsmwVkranGyDKe4oQ1zwkvzhllcsS8TAerC3Aa1YAOrxo
         VPylkBX4mN/lDMAHqGn6aL8NEAjNZ+4+ZQ2bkIEKH6sZaMZCEPGtu61u3tn1X1KM6jbf
         fidw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8XH8Rrt97ZwucTWc/oggVQSsIWH6VvnoAzPT/rI6KaMfgCVOITKCCrud/+L4uG7om3f9neWZK4VufT0u2NhttJWV1ODnVdR/T46w=
X-Gm-Message-State: AOJu0Yzyht7jcYxePnbuSSYohF/xUj6xmDeM+mDUIgLpeOlftVeTz40U
	lhifip6SobWpQakUIr9dQgUYyrO/U/YCjT+xR3PUQnGpKtYNSJ87xWjcQUctpJw=
X-Google-Smtp-Source: 
 AGHT+IFGt4B0RZSOZNczxSiz5zFHWD1XhA8KV6rhtB/C6YEJbwb2mVelgfDCWMl8+kBFTiWhCuIkDA==
X-Received: by 2002:a05:600c:6a18:b0:425:6327:f00c with SMTP id
 5b1f17b1804b1-4256327f189mr21483385e9.22.1719499495427;
        Thu, 27 Jun 2024 07:44:55 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 15:44:43 +0100
Subject: [PATCH v2 6/6] arm64: dts: x1e80100-qcp: fix wsa soundwire port
 mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-6-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=2R23639fkPX8iIC+qUMimWznPuF4ISsfAKV3cLgsdsU=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYZXcaDPDTEMgAamcZ9w/ZPoMFkd898cvKx
 t8+dolO7NCJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 N9HKB/9z1cCqL0paPtQ+5UMxA9t4wauT0ugB80R2gRNhFexPvqGNB2MHSChO53+qU2/XXbq8Q0L
 W7ruCUqhn1IS7jj2n6siZMkx+2OxEFJ6KwxScKy+yo1PcvwyWpO3ec22X3VS7nAVY6fIpgBG1Ca
 sCiOlFaarg92iccVZeS9vLmadcKCG0YUAXPWgavGusQi6D1Rf/m0B/BbMYWeVAjK0JhOJsHgv3a
 6rwmbuJH+qOgRilQHW9vSzrD7q/ikcKWzLU2lfZ6xAS13MfU68UAgUiogzyA052dyuC49gooiJK
 tdm8ufp2wsZAT0gAWpxyeWBcEi2ZgbKUqdAUw+4aw3FFDjx8
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: YI7QKCKWL7WLCVX735ENMX4OCYP3XRWU
X-Message-ID-Hash: YI7QKCKWL7WLCVX735ENMX4OCYP3XRWU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YI7QKCKWL7WLCVX735ENMX4OCYP3XRWU/>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


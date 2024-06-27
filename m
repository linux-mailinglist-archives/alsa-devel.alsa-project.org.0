Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BC791A997
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 585D8210C;
	Thu, 27 Jun 2024 16:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 585D8210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719499611;
	bh=bMFgCtwFkYJijaWBVrk925QYLyPp0DOg1MhfjncrkzQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K6w/XuNvaaJXJyV0dgAkyzuVX8ly+IaHBWaBaDNcDOHC9BM+LKnue7LL4+QPc7PCE
	 QmcVNgX/oWhkLH6n428qj1cltw92gCDBFdSrOzTpXIOlLq4sDTV9WeikVEeOQDgpLr
	 qFEN/E4DBspN3qxDL/vZakcC/VTXlAv4sxglDU2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E30C1F8068A; Thu, 27 Jun 2024 16:45:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE041F80682;
	Thu, 27 Jun 2024 16:45:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC170F805FF; Thu, 27 Jun 2024 16:45:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA7E0F805A9
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA7E0F805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wYcPi+Ao
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42562e4b5d1so9859605e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499494; x=1720104294;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPvgc1Cco3SnaS+ergB6X4Qiw2lTWzLcT3q27EN/3+0=;
        b=wYcPi+AohHF5Ber+5Jdiv69SeP0qbxFGsbcJ8IT2X8CKnrwjmUTEpN8DmJwRli1tBF
         6yct2BIoXDyOJyMSb0DiWLvqLY8EmX4OeVflsnGq3DOcZb610ZnL0Medi8Muk7V1piYX
         XjGN7SumI3VM8x/ulKpx3KWWP3yhcxahhXife3MfbqPztCYS6PbKeCUER5TIBWb5odJe
         AeZW0obgsCTylSACeAAuY8GhX+B43UXMpv99uxg86TFDZSBICow5/jg8mMidwwSkLzw2
         tJaPh5Z2OirA14kjDqafzdS9oLFbp2JfAD+C/0t5HIWr9wgSucivlHMlnPuoruL02A5v
         ijlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499494; x=1720104294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPvgc1Cco3SnaS+ergB6X4Qiw2lTWzLcT3q27EN/3+0=;
        b=uQqUyu8F83YZ3GiZlpQ2aA0XNfnwDNl79a3RUl+TaKWF0eAEAPt17l0OQigbV/4i+X
         3xplrw3X4NkzIfPhB8k511+wclQenAhtqjLlIzyCIaCpVAfBGEHH0jV59t1gU2w8vPRc
         YM9VYhwbiahWkMLDiLocj9BWDB0vAjJE2pGp0+J7qqviEmWmBCci4qheSmRwkQX72R8U
         zSWwPwGOY3TRCW8YNPGHvtq0DGcIJ47ZJ6hhjaJ6JbssZ6xvO+qtJaGa8sEDyo03I4D8
         ZD+uM/7XN6YABbawTXkwlVSi/GWKidSi75HnGJ5KXL4ZTXeck4OhJCBQg1mdU29Tf1xb
         6qJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyacHwiXSxGC0Wo0RPMirlh0ZG5eGUvp8CBO0pMyl6Iy5TXr5eWT9RpAxV7pf+pVXxCOz3LxG/9vg+jMj74DXF41HtVnolAkqd7b8=
X-Gm-Message-State: AOJu0YyIL8dHiyWAr+1MyfLaPTi74DFB21e1vPRfigJPvramWi50GVJc
	hy7Qj2KxSTp0xMkjY5/dfS5+of6rtohvJ+mvws9UQIoyFaSv965/T/a5Aax5tWM=
X-Google-Smtp-Source: 
 AGHT+IF6BIJRXTjP8xtoo7unU6Qn7gBQTh9iTGx3OOn8MnJjixs8Ql7ftO+NIPhHBCL4ETpldyN5Lw==
X-Received: by 2002:a05:600c:1789:b0:424:a403:565f with SMTP id
 5b1f17b1804b1-424a4035701mr55384855e9.11.1719499494056;
        Thu, 27 Jun 2024 07:44:54 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 15:44:42 +0100
Subject: [PATCH v2 5/6] arm64: dts: x1e80100-crd: fix wsa soundwire port
 mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-5-6cc1c5608cdd@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=bMFgCtwFkYJijaWBVrk925QYLyPp0DOg1MhfjncrkzQ=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYm25KsOdMgKu5bWCuwyAfo4Q9joBXCroZH
 BQvZiqS91SJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 NxggB/9Tzz50ODbNc3ZTbTTAV3ZN5q6sAUxAlyZH0c1WWSRRVNpLc8c0CUWkdrIag/mczavgW1u
 a0Z5/BbP5vG6SZygRnjg22ZC4UNKIwMI3b/X4D4OulwXbWcNkqTzhrQaGQXXLOUPOujE1FtZkw4
 cP2eqgA5Qvk5Fjym5Naje+oh2J5tVWrrbpmD/ApB3Q0Y23Eo10I2Kbl3/jtGFjUVUonA3QVt6Ga
 fRo/uhgiJNVqFnK0X5iNrlyaSOCuCw4KO0VK2Ykx4kDrxFwzLnPfGcGxRXsSR65Zr114mJKHt9d
 8LT+c+UZktbXogp0r1YeENF4dprUWfEnUQWKAn+fWpIriBDE
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: LV2WVFHHTWFKYUOZL2DYGHLC7LW4ZEI3
X-Message-ID-Hash: LV2WVFHHTWFKYUOZL2DYGHLC7LW4ZEI3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LV2WVFHHTWFKYUOZL2DYGHLC7LW4ZEI3/>
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
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


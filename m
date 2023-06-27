Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C274011F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53CE8A4A;
	Tue, 27 Jun 2023 18:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53CE8A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883299;
	bh=Quz7pP0P5pjmtegvrsM8rd2Kfjx4W/mMKGAUDarFvWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PzHdBxkWpuAKe06qfbgbtIPd5an+/WedLUZZ9j42W2+dZ+undfTY+IvjwsRd8NftT
	 C+JJA+ZXmCzgDE+skw98di0RTF/vYh4u6JDaDeBalRTr0GHgA1KvyvTZCzhB35eiM+
	 wWWR9d7NeWeEfNO4mW5C6132XJFcwPnFeaGjHFes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB82BF805E4; Tue, 27 Jun 2023 18:25:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA4CDF805E2;
	Tue, 27 Jun 2023 18:25:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC0A0F805C8; Tue, 27 Jun 2023 18:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C739F805AA
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C739F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SZy5l5RU
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f8689fbf59so41709e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883105; x=1690475105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4mJfqzmvmApW4Rj1dXVWyxSwPO5WPkCbtZ4OGaD398=;
        b=SZy5l5RUOGcrmQW/jdYxGFBe0gnmhxq4QnEAq3v3QfdHzvrew39CDPEdKUkyJjDTre
         XvUlJVp8t0mEoqTyn9Pwf0qePjh+XLG0D8ZDl4ymxEss0hnXLzD8H132evKnb+dI7q6g
         iIwcvLwnGCQ8Pa+uDypTqnm1E9xIg+FOVFuJ1VvdcvaWH0SCIxkJuGInbDX+FjGxchDS
         UfcnzabUq5XzSz4XjJ46q802SSMdmCkrm4AGkTFX+xmI4E1Rzb9SltzEldkBp2H7Svua
         YA73OoB/WAuT3vc362D8wIQrf8gMgNrnI6bS0CHL03TeC95uPtBmLQ5M3j1TLoOzzIWn
         OFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883105; x=1690475105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4mJfqzmvmApW4Rj1dXVWyxSwPO5WPkCbtZ4OGaD398=;
        b=SWLlADWcoyvF+OrwtJZJqS76zKF1zaaWyN6rUx+aS//q/wmFV7eEcbBr+bkEyyN8Dj
         TeHo2Tc9HcsBnJde4mguORt5wI6kJH5Ch48SOgyIVvraa8Qa81qyNOX/6oLMBQjkSeIz
         CRR5ZnwSspAAE3cy3XPLLIjUhpLDW+l9fH56UrkhyxyWGMOIn3kceLJByJPQfUfRCmWr
         Yuj6nqLdboMR58ukOr6fXziRzkeOzgMGq4y5TS3MQj5FMBmNl1v1teb41L1qUiPBhDGK
         wfj8VCnH9zzB0CzUgmbkewyQKYm+3udGOlpJQx7I0/bq4fxTx8zg2JJ497YhE16m6uyh
         Kt2Q==
X-Gm-Message-State: AC+VfDy+t0YUqT2mqjIomoQ0MXWgr6zps3tV2IEEfAeB6C4b4tFOG6VI
	ldJDskyjhJJsD8ZfRJhRea15Nw==
X-Google-Smtp-Source: 
 ACHHUZ6BlsiDYElcMxfXy6yWsewsR0fKcoCpVeJD1LLcD2BVrW44G37On0y3gt5ZzXkA8F3J/hmvxA==
X-Received: by 2002:a19:5007:0:b0:4f8:52a8:d123 with SMTP id
 e7-20020a195007000000b004f852a8d123mr11226655lfb.12.1687883104785;
        Tue, 27 Jun 2023 09:25:04 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:25:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:27 +0200
Subject: [PATCH 11/11] arm64: dts: qcom: msm8996: Add missing interrupt to
 the USB2 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-11-6b4b6cd081e5@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
To: cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Benjamin Li <benl@squareup.com>, James Willcox <jwillcox@squareup.com>,
 Joseph Gates <jgates@squareup.com>, Stephan Gerhold <stephan@gerhold.net>,
 Zac Crosby <zac@squareup.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Max Chen <mchen@squareup.com>, Shawn Guo <shawn.guo@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev, linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
 Andy Gross <andy.gross@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=831;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Quz7pP0P5pjmtegvrsM8rd2Kfjx4W/mMKGAUDarFvWQ=;
 b=ZqlZW1EIjz9G94JII5XehUxnYwlV6O2ulqbfYf+vErKLQwa8/fgJxHsYBw7sTROnVJyMrEv0+
 bXnzqhh0QtJAbJKp7VUNhfrqDtonJ3y69Bbkmt1g/AhS2C/32mzlFdb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: GQ5MSP6ZV2A7ZX4X6V4FIW4YU6DPA6IO
X-Message-ID-Hash: GQ5MSP6ZV2A7ZX4X6V4FIW4YU6DPA6IO
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQ5MSP6ZV2A7ZX4X6V4FIW4YU6DPA6IO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The interrupt line was previously not described. Take care of that.

Fixes: 1e39255ed29d ("arm64: dts: msm8996: Add device node for qcom,dwc3")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 85d9d12f0c2c..7771d2909120 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3386,6 +3386,9 @@ usb2: usb@76f8800 {
 			#size-cells = <1>;
 			ranges;
 
+			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq";
+
 			clocks = <&gcc GCC_PERIPH_NOC_USB20_AHB_CLK>,
 				<&gcc GCC_USB20_MASTER_CLK>,
 				<&gcc GCC_USB20_MOCK_UTMI_CLK>,

-- 
2.41.0


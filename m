Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBC17400FA
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E3D4868;
	Tue, 27 Jun 2023 18:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E3D4868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883203;
	bh=apph7LSM6ElNjbIp4Sa6AEpFAvPu59qNl9eL4vnUenE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uPFRXIORvHSuXK1g9ukQOwB7VSSZ2FJL/93gpJa27K1wo7qU/hRHN3A1oLedC4kwJ
	 jHEWcHzTY8npzgRCHHR6CxA57iDXm0oX0d2Rfc6fTbBeBEdHPfWX/khhmweUB/so9f
	 qkfo8ni0qvZESf4FjxQlwYc9T5CeehBgqJGoW2zI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92A60F80587; Tue, 27 Jun 2023 18:25:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22981F8057D;
	Tue, 27 Jun 2023 18:25:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D409FF80552; Tue, 27 Jun 2023 18:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D620F80246
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D620F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XyWyHIoH
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so6339639e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883087; x=1690475087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCywy6cYyFYFI8kb//sHM+EK5WqBRRu8/iqRaDkQ84M=;
        b=XyWyHIoH2Ze407Yj6nB28IeDN1CDtgfv8AZnJhnbW2U++0ntJoYl3/QVHOKlr0ugmN
         o6vqww24W07lweLE9ksjl1AFLoMK4ShQBmEr1zNIq0EoyAnN9vej5YV2E951JkQg/mj6
         f2be8GMogkEAs23/fSmFJvgtXz/EWJRnx72oJgzg7t4GlH7aGGXtbYQyLDT7IEdCqSqo
         DVYVJAMNjin1r7Ia2V7ZXhY5pJcfcejnwajh9n3V0xWXb6BLAr6EsO0FSIo+81Lam1J+
         dX9zLDenkoPZH6PhWyeFQ7e6lwaX3pCRTuLZDTvb0GJrasYd9Ow7d4TVrxni4hfHa5GJ
         x6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883087; x=1690475087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCywy6cYyFYFI8kb//sHM+EK5WqBRRu8/iqRaDkQ84M=;
        b=V0Hsoc3ZwUvcnV44N7gFwiH+0mWHPiaWngoNQH4iZpM8fmk5y/k5oLOtzVrZ8u4GrM
         wVBSRifixD3bSDxqci1u0ZHmU5HwAeaLX5rNu2chxI2qU/vOSkzsjTCsnwhuMd+kqmi4
         3DviZA9uCgdDD4hjKq+rDoEhOm64XCIn6eXTBlTKHTyXRKWvJ2zIM9Dom8YfizFpTtVm
         OelIkxl/J53hpge3NIUlN4CpE46qP15rlW48NbOyBa5owL39oFRCUP+Waoco5xqfrC2o
         +pNqojivdUgzgsxxNEv6K3qlBa/yXhKO4debVALA3v+1un/WL64RgH3gjs92ezQpEOge
         lEkg==
X-Gm-Message-State: AC+VfDwhQu1SmW07nBdKqWfBiF49RjCKUqnTXdOS1YuqiwashTZu527Z
	Hyt+Y4Tk9IeXhzgSXcorWVW6dA==
X-Google-Smtp-Source: 
 ACHHUZ6LwrqrxKXfB30IuTt/FkjnhAznIHKgmo2XPru91QszdrHpLXOaCrfYFLxXQmjHKGnPvCbFNA==
X-Received: by 2002:a19:4f52:0:b0:4f8:66e1:14e3 with SMTP id
 a18-20020a194f52000000b004f866e114e3mr15836081lfk.17.1687883087477;
        Tue, 27 Jun 2023 09:24:47 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:20 +0200
Subject: [PATCH 04/11] arm64: dts: qcom: apq8039-t2: Drop inexistent
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-4-6b4b6cd081e5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=689;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=apph7LSM6ElNjbIp4Sa6AEpFAvPu59qNl9eL4vnUenE=;
 b=LRBHRbniws8u4a1P+s6dSMgJ58xXojZSxnIPFilY8FRHxj7kwk+9c9/vrMndrQrYkMe6HLBA1
 qsSb3Hqz11BDWo/hVkufLbnuhTmhrQ/zLN4kTfHuIj/Obe2lz0rA+wR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: MUPSCZIKECTC2FLV3TFVUMXQN4IOV77D
X-Message-ID-Hash: MUPSCZIKECTC2FLV3TFVUMXQN4IOV77D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUPSCZIKECTC2FLV3TFVUMXQN4IOV77D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'pin-switch-delay-us' is not used anywhere in the mainline kernel.
Drop it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
index 43686bbd87f4..027d1da7e81d 100644
--- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -374,7 +374,6 @@ &usb {
 	pinctrl-0 = <&pinctrl_otg_default>;
 	pinctrl-1 = <&pinctrl_otg_host>;
 	pinctrl-2 = <&pinctrl_otg_device>;
-	pin-switch-delay-us = <100000>;
 	usb-role-switch;
 	status = "okay";
 

-- 
2.41.0


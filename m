Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 700407400F2
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19721851;
	Tue, 27 Jun 2023 18:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19721851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883197;
	bh=y9aAPQNrTt4WUn0fdGxJxPfCCX9Hk5OUZHkmKm33hlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IUDM1oJxQXdAnVA70FTc640NlMgkoBCDrPpgNa+aeG+yiCgxYrFsAz8r9vX0lgSrb
	 68pccTii/6B1CmrFzzmbQHA0aR8fyXdrvjOmYptQtObx9JDGHShYqzuHIh9POl+/nV
	 Zbp3jnuzLOXCrvRUtrlIEyJ9vs+QiVGjKF1f31o4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B773F8056F; Tue, 27 Jun 2023 18:24:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45317F80563;
	Tue, 27 Jun 2023 18:24:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C830DF80431; Tue, 27 Jun 2023 18:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 197A8F80124
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 197A8F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LWoWb4vs
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b699a2fe86so48693161fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883085; x=1690475085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYaFF944CBPpPI3xTGK+ozEDUtWhjiR1kLsCUSq/tTw=;
        b=LWoWb4vsMHyG2qkazpfTdhW+UQTZZaP+KpW9Fxat/1VZee4W/NKGQEWMqYGZ9NuW/D
         m4BE+3+7lpPfy7kORXnMMu1bSeSKlt7jNRaY8TrFsqHaqL0z4walAIeqcpnYaKEdplVD
         zVKYjMwT9B0tBR/Yd8IcB2nEJlj+n1AoGd3HfdLlKut5f+FuYu/F/MQmAtY2E/ouKsOE
         PUJXqfkz1gHFvCGlVLAU71YT9nrR83dOoYgMvVHd7rBfptkSLO6f5JfCr1/rAq3A0XyZ
         QdODVO8drrPTl7R2Ewo+g5Mm4pgMbt4oi10DHPO9L4FxaqOWf3jd0jHw3mWBZFRgiT4A
         WlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883085; x=1690475085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYaFF944CBPpPI3xTGK+ozEDUtWhjiR1kLsCUSq/tTw=;
        b=BlHhDS82W9kazuhcwr+n3Bd2jpCBqsqXx0xLZq5XQUzJXGeBKnAvz5vXUe0sVEEcsx
         Or0Qfb/M0oNUNZb0gjby5cX8bhTrKwOCqTDsZ6hLI00aHxkXIO0mrRKPD138snGbOweH
         CUAJd6kflsBrSJY7kgBFpzKCkNYRudD0WbCn+5Nz0Hoq0ONGoEgEkieALIR5gN3+v04G
         3Hz6hDmsyDBNYTv3K3pXclPPOo4nQbzyTtvLbQ8PVCEj/ActmPHWasLMfh7xzM9OdJ9D
         3biMWwiQhpk90+ZH1HcNF0x15+G9sbC4Gcy2+hY1+POeuIlLsiPrJw4yCTWlR+E9IUvZ
         eWyg==
X-Gm-Message-State: AC+VfDzLanIN/TJ7FGYgL8Y1M9zMvwDuje34BwxhyCrNp2F/EfKZ1MSW
	swEkZCRFaeGdOSwT7578LP94VA==
X-Google-Smtp-Source: 
 ACHHUZ4ythlTwuN1ng1WKH85xShFqna5kY+HIIDyB4fmlolvggLWrCYvWnSmKrP/dkJwFLHJqDS+fA==
X-Received: by 2002:a19:3807:0:b0:4f6:6b:a43b with SMTP id
 f7-20020a193807000000b004f6006ba43bmr18574040lfa.52.1687883085080;
        Tue, 27 Jun 2023 09:24:45 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:19 +0200
Subject: [PATCH 03/11] arm64: dts: qcom: msm8939: Add missing
 'cache-unified' to L2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-3-6b4b6cd081e5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=872;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=y9aAPQNrTt4WUn0fdGxJxPfCCX9Hk5OUZHkmKm33hlo=;
 b=w488Qve8orkSmgHUwwh9oyM25h1xdVtgnB4Ys0LYV1nlQjCqgKtAhax7MUl7l8I5KTts0L1Ss
 gOcd0DAg1r7Algsiwe2DbhrC3vv080aTNk+DR8kKIxjAULvaSd4hkI+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: O27OFZQP6R2CUG3HV2C6J3IR5KAY73UR
X-Message-ID-Hash: O27OFZQP6R2CUG3HV2C6J3IR5KAY73UR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O27OFZQP6R2CUG3HV2C6J3IR5KAY73UR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the missing property to fix the dt checker warning:

qcom/apq8039-t2.dtb: l2-cache: 'cache-unified' is a required property

Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 38fc22e66bda..664ae303afae 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -55,6 +55,7 @@ CPU0: cpu@100 {
 			L2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
+				cache-unified;
 			};
 		};
 
@@ -111,6 +112,7 @@ CPU4: cpu@0 {
 			L2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
+				cache-unified;
 			};
 		};
 

-- 
2.41.0


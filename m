Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6074011E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:27:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED13885D;
	Tue, 27 Jun 2023 18:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED13885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883274;
	bh=uv1qnNvLB8G/rnBdtPGJ5lEE8zxGk1cKOrp6LALI2o0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dHatscx++usDmi5OuvidCoY2t0p1ny40gkmQrEu6ScKNnG8fLpIpdDMADSkz8boPe
	 htw8XkrwC/0lXDeq/nxAG0aPNh8vc1ExDfranwWoDNlX1kn3ZhTHVfEnevJdbcm+Tb
	 kIgHTCP0mKTFF656M8s3GRIk9dgKfW5l0pduB+yw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F0A0F805D6; Tue, 27 Jun 2023 18:25:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4162F805D2;
	Tue, 27 Jun 2023 18:25:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9617DF805C2; Tue, 27 Jun 2023 18:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E1AAF805AF
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1AAF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kDAt9Yy2
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f973035d60so6298368e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883102; x=1690475102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQgv+M2yvcOQU4FeOLMklrteeN9rCIkhqHWc6b1bMlw=;
        b=kDAt9Yy2OlLY6IWaIgh8Bk9OfVdK25RlsrNuwLLMtXXbG397TVa8a3J+BE2Rthx19v
         ohLNC/e5SJMBYIIx9zS2sFd/JWPzMOHoJq33iJVFsCwitbawpcYQxHixGIODdZjNyoBa
         ZzskP4FEFk2ilEFEAaixuyH1WQha+2ExAWd6CEgTK1Y9lQ77j2gYVGYys3ECidK9mrHk
         nvJj+DSJ2Zxm3GEMajsX81wBQieJ1d4ahWo9QmqJRXHZlDJLhMcjLkakBY8kA8KmjYwC
         VFI7sMK3I0eHGPSZYa3fQRAeFm0je1CrG0P0NoPv5kecifNBI9VjBaa7iVbD/OGDkCea
         ax8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883102; x=1690475102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQgv+M2yvcOQU4FeOLMklrteeN9rCIkhqHWc6b1bMlw=;
        b=Vj8IKYNxexV3R5el34P9WziXqa3GkGis2fiWdDWBiOAp+gL93g9iYwLyougb7rB3D7
         jSQK2wJCYlhuP2Nc1p9vQGgI2OAqXJOhY5BdsEigV1mP44eYjVD22HEbqriMbfjdqb28
         BQMC7DgvNu8h0p7kE98O9mOEeuQvM0syVOAh2KjKaH3n5gD5UVSlBLaQgHwHS3VAxzCF
         kbxwa8yRo8nrlVEBYGHODihHVE6/siEcIPzajt9YxuFnK+9SysdhTeQzzp9r9t28bfAa
         8TWYTZu4GPresoGefN9vkte2zdXC7ioVpxtHoSlhmKdBFx4DgRT5MQwsquTL6rkhS1nX
         bYbw==
X-Gm-Message-State: AC+VfDw6402ZtvEb44nKrFBPKyAPbiOHI2xjUKSBVx2AISsmIZG7cgZE
	i7nQwc4cnozIED2xXubRgA/y4A==
X-Google-Smtp-Source: 
 ACHHUZ5yApBC4INNLgHvtxRRdunBBs9+0RduUnvVu4BrnfQlBcgFBMr/Gb/6J5qgvmBXvYAWuE6Fvw==
X-Received: by 2002:a05:6512:3c9e:b0:4fb:7be5:46b3 with SMTP id
 h30-20020a0565123c9e00b004fb7be546b3mr3902801lfv.55.1687883102401;
        Tue, 27 Jun 2023 09:25:02 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:25:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:26 +0200
Subject: [PATCH 10/11] dt-bindings: usb: dwc3: Allow just 1 interrupt for
 MSM8996
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-10-6b4b6cd081e5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=1056;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uv1qnNvLB8G/rnBdtPGJ5lEE8zxGk1cKOrp6LALI2o0=;
 b=CbB0RfIBkaHhb6P0sSoQoxoKLH0+Nroq3t9sxL+VfHWMFB3r3IxNmJNLNTbVFLUIegbeAFWQG
 oue2RQYT9w3Ch9MjHPlF80d7+kumlsNMxdRcFp2gCaZ4O5ae5p95yJx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: MYFGT5EYVMGHH45YT576I2ZEMKMHROFH
X-Message-ID-Hash: MYFGT5EYVMGHH45YT576I2ZEMKMHROFH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYFGT5EYVMGHH45YT576I2ZEMKMHROFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MSM8996, similarly to SDM660 has two DWC3 controllers: one for SS and
another one for HS operation. Allow just specifying the HS interrupt
in the latter case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index aca20aa8f504..beaeba47a150 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -394,7 +394,6 @@ allOf:
           contains:
             enum:
               - qcom,msm8953-dwc3
-              - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
               - qcom,sm6115-dwc3
     then:
@@ -411,6 +410,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8996-dwc3
               - qcom,sdm660-dwc3
     then:
       properties:

-- 
2.41.0


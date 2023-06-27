Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE5740128
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:29:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C4293A;
	Tue, 27 Jun 2023 18:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C4293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883348;
	bh=dxmGowAABZGGJvN38BvE9OivxrhsE/2mFCf47Qi+lvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mgep3MfDWW5HDkconqDi11RpUZwfoIxq99Dl9oxYy2++FwxLbly1rMt1fRtxCPGF7
	 S1+drCvuvwWhpFyfZxNsVK5zjGnLM9e02LBQmrQCETDJLEUYoRRrDnw1h8m78yVTJs
	 BamOz5qzoWHwJaNvmYEkGAlnI+lx5uXj+UgUlRjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5870DF80567; Tue, 27 Jun 2023 18:27:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8839CF80552;
	Tue, 27 Jun 2023 18:27:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 528CBF80431; Tue, 27 Jun 2023 18:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4573F80564
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4573F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wT4UzEMp
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso6560288e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883095; x=1690475095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPNg5vny77tvK7IJAfh5JkOu6WowF9wjESyOAY+a1Tg=;
        b=wT4UzEMp3D2z+CEciSOj2hOqJZY5IsO6ESwlLi6JpPKPVleeLPbEYQowD4j6ugDDWT
         Xsekoq3dAMFIe2qSha7QD5qXwQK7uvTB6BiLhhzYloSKH2DUuxfYiK6ynHQf2ri1d2c1
         Yia2iEKdlcVgPDQx2b9Z8S09tPtYnMMz4koijj0kOEogFOMnrkkPJthflCOJDrz34rZ5
         VwnYMEmbL3YNE8ElBGdgiBCOyXavqYtRbS4Z6W3D5oGCPCTo//ykefDkMq0NfHPVL3Zs
         /WmtNQzYvKoXfJ6zYDHEJ1lCyAJ49i1gWKSv1N2fqbVfHVreFhWFLTVqIFYR6dTTqWOv
         B+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883095; x=1690475095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPNg5vny77tvK7IJAfh5JkOu6WowF9wjESyOAY+a1Tg=;
        b=kgSj32S96qr2EOZtxXeLH0RDmX5nKJ5aNAGwQDnHkB2mKwmoO97Kcw3epEp/9mK7IX
         89H9EK6k3I+pH/pAJaqNF2Ww2g+kD1Hcbm7zmmco+2Lkwzax3ZuGYA1FiUzmvmsFtkBK
         11T6t40SQMtPLV+kNaqWcmqn0S56I454jHxZP8ljxSkjXrZlOHYg0j6EPADQ3naR4TV+
         7Uv4pb2nDZon/pMfHIIsGJBjxRMl5qd1pSkqP52GPu0FunIpl6bV1Ty7oZxo8CV8jIUp
         qJfo4T5Rzvj960TjboMl/neWCT5CPvwtJ5cxB0Wnwt/KjKkY/s+kM1gV7j1qF0DXN8EV
         96mw==
X-Gm-Message-State: AC+VfDx4WkDsQUUb1gNs3cKoZHlS9nZAUxXsN12xB24ZbNw1yzw+rVqp
	U2eH7nm4WcEok0GhlB/nEQwDbw==
X-Google-Smtp-Source: 
 ACHHUZ5//rTUoalDl1QqK0Ki39B5TbO1+DYtkIbMhpfMKaAAAhwU2SHZDezjmb3zz2NxqSeNX+6TzQ==
X-Received: by 2002:a05:6512:2824:b0:4fb:7888:7e6d with SMTP id
 cf36-20020a056512282400b004fb78887e6dmr4544050lfb.46.1687883095019;
        Tue, 27 Jun 2023 09:24:55 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:54 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:23 +0200
Subject: [PATCH 07/11] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-7-6b4b6cd081e5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=1161;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dxmGowAABZGGJvN38BvE9OivxrhsE/2mFCf47Qi+lvI=;
 b=wzz2xUcbFtxUiSi4ThrPFbDIaElQBro5YtXx/lBo+PD1GGVfkejB8EYDpam4TZsF1HGcnDTRP
 unvzC8nqkCDCKapltiz8/h5Mv3Va5gUnt0oPVF9FgChKOoZXy8L9VnG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: BHHZYB4IR4E6OOEC7T6ZNTQAELZNEEDN
X-Message-ID-Hash: BHHZYB4IR4E6OOEC7T6ZNTQAELZNEEDN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHHZYB4IR4E6OOEC7T6ZNTQAELZNEEDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some IOMMUs on some platforms (there doesn't seem to be a good denominator
for this) require the presence of a third clock, specifically for
accessing the IOMMU's Translation Buffer Unit (TBU). Allow it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index d9fabdf930d9..3b7acb459f8e 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -24,14 +24,18 @@ properties:
       - const: qcom,msm-iommu-v1
 
   clocks:
+    minItems: 2
     items:
       - description: Clock required for IOMMU register group access
       - description: Clock required for underlying bus access
+      - description: Clock required for Translation Buffer Unit access
 
   clock-names:
+    minItems: 2
     items:
       - const: iface
       - const: bus
+      - const: tbu
 
   power-domains:
     maxItems: 1

-- 
2.41.0


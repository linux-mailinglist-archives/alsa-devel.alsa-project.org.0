Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2057740120
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C1471ED;
	Tue, 27 Jun 2023 18:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C1471ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883309;
	bh=wt3diYHxaifCvK5Xl8Y/T0S8CL1BVeC3ZMzX71Qv7t0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=skLYA+bQ+RHvv+YkzFfLXh/8MYPvAYdAnSVBRc5kJu2cDHdRyxBFVdBP1j3+mQjjU
	 Etqx1fzLWvGv88HhR+2mDcUNWg9Td8UF5ESKII6dVdA7LCUO5KS9joOb2chZgdRG2q
	 broYLM0tDgSCjdbkZsAUi6ieR5wRTnEGTKQsDt/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C123DF8051E; Tue, 27 Jun 2023 18:27:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D49F80431;
	Tue, 27 Jun 2023 18:27:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8301AF80534; Tue, 27 Jun 2023 18:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C995FF8058C
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C995FF8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QYqAGssg
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fa16c6a85cso4820126e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883100; x=1690475100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q33POZnKUnc44DnNl9mQs414WVdMBUFcIaqMk7TwHgM=;
        b=QYqAGssgz0Eg7BvDE9m0UQjkpMaZujlgUxNELGTmjD/MUVciTwQqEoa6l1YospPYtK
         9RQXvrhYxwr7/oTsoUsYNvG996nx+nOAwJU/4w7mkXKc1u6gCJODyPi+N1RCjTrUBoHT
         G9iqKDcKCSr8Tp5OT86Bf+Sbj4Ap0iFnrDivV0NFWY6HiPjy/vysASuy3DssXAjL6Q70
         NtJaI/MD19Zj2FiWLhrRuLnqPI77AqLWTsRzGQYDC31x1m0Ov41R9rnU48UkL1od+hXN
         gO3ZFvK3qr6OjgPRkphBhwnN7jzLsS3vm7o/d+TSkeXLXX7LBCXRe4l46p6vNfbq2Kzv
         5Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883100; x=1690475100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q33POZnKUnc44DnNl9mQs414WVdMBUFcIaqMk7TwHgM=;
        b=HCciX45Jo3rXzT9+fGdfQmccihA+Q0baXsyJ34D9ThVCt2d+1DTbE5IN2FqhR9L5oS
         ai+Kmrs4+QjVqfaqBGSwIbs6RtAXcH7XxXHn2G8anMcFOqrEv9KnDivHPl8aZK7e/X+r
         q2RK1sGZKbzCj14zOKfyT3rmyf9J6aHIbq76FYrBRqVK/64TSVYdDmbg2H2fnSiqdhm9
         9Ci6R8Ql1mpf7+r5JyE+wI2otpIBD1z9pTBQjfSv0DmK2vMo7HhiRnide2fyU6Xg85bV
         idHcwzYmrbSGWFkDtw7ikTPTbXXiJe7aWZ1U44JDk7OtEhjj9jQhDYxkStcLN4NST0rN
         jUTQ==
X-Gm-Message-State: AC+VfDynzEXvFoK5vpE9kfsDqJlclxI4WPM4Eo+vM90eY0bqxExz/Whp
	3TdOOW3kcSAZmeUC50svNVaQZA==
X-Google-Smtp-Source: 
 ACHHUZ6CFt+d+5Xq/e+nMds5v3rJtmCSaJmgAZcrHw7TSi73DKGhsgqOetWXrvYdZglDMZM5e2B0FA==
X-Received: by 2002:a05:6512:3d26:b0:4fb:89c1:c209 with SMTP id
 d38-20020a0565123d2600b004fb89c1c209mr1281822lfv.62.1687883100008;
        Tue, 27 Jun 2023 09:25:00 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:59 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:25 +0200
Subject: [PATCH 09/11] dt-bindings: arm: msm: kpss-acc: Make the optional
 reg truly optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-9-6b4b6cd081e5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=947;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wt3diYHxaifCvK5Xl8Y/T0S8CL1BVeC3ZMzX71Qv7t0=;
 b=LUZZ9rw1io0j4EW3EhtpAO7GnVfigJDEYVe/+eZsBuOm+mcYfTwRC4+7VMCWlKK93ARSOPAoO
 RkmO+n5mJD7A/i1W37MwjkK+vgktyNsi+MknPe8Bf8NUXAKU42wjmD/
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: XTHC6B2MASDBONMKUBVNDZVFHNROMTVV
X-Message-ID-Hash: XTHC6B2MASDBONMKUBVNDZVFHNROMTVV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTHC6B2MASDBONMKUBVNDZVFHNROMTVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The description of reg[1] says that register is optional. Adjust
minItems to make it truly optional.

Fixes: 12f40018b6a9 ("dt-bindings: arm: msm: Convert kpss-acc driver Documentation to yaml")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml
index 5e16121d9f0d..75b6287db2c9 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,kpss-acc-v2
 
   reg:
+    minItems: 1
     items:
       - description: Base address and size of the register region
       - description: Optional base address and size of the alias register region

-- 
2.41.0


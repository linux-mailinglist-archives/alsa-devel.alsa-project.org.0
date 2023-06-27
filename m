Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1264740112
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EFCA850;
	Tue, 27 Jun 2023 18:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EFCA850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883223;
	bh=qMPr5ji7TxiW7p+3tmhmdQkl5/eI9UsztKpO6YmgD0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RuyR95c2LNy1C1WeiG1q4zfz0OzUv9L/9MW3enIMITcUGr0YBzBr2ucVDOKtiLUaJ
	 6e1ywJ/+vZWCiiSgkQZBPIAZjuu1yUGwVFgBVnfEU3OBl7x/nCWEYlxSN5pYh1DKmW
	 OUiJVs1Nj/l8YxjgoZmerOberk3nCf+RZOLlB0TQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25435F805AB; Tue, 27 Jun 2023 18:25:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D76F8057F;
	Tue, 27 Jun 2023 18:25:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B303F80212; Tue, 27 Jun 2023 18:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7980EF80212
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7980EF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pc1ltOmR
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so42079e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883080; x=1690475080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ay5CzniySnwEMooKVt/XOy1z9VfFqB2Jhn8qIwDw2AU=;
        b=pc1ltOmRM0YZYgZOi+g3p1/3rAqT0Q/AYh4yLt+KniBs5IdXvrwjPGmMqK5YTbxCnB
         xFEa8f8eSouuMDsImmQbpOi4CFsZHRb8dMe/581qn6WRKlbvVBluGK+Y5MKQcgRs3jyK
         0+p5RGW7p3bRBXvPM8s4iuiQJNtshbGS/jLgyHx8cKj4ro3LcucpEI+do6hqQmszEKla
         wN0hmUFciYaVoom4FsMVkpXFEkOUNjvK0xP8Zh9+bG8iCLzLdr4pI/Dr2moQcBAR60HO
         6qEFUf332HQDNFd6rdGLwBoEPrVYnH8l5iQJgFvcgGbf1VwyQHndGiRD//DXcMCVcw7F
         lu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883080; x=1690475080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay5CzniySnwEMooKVt/XOy1z9VfFqB2Jhn8qIwDw2AU=;
        b=MbFNy48KBjrZIH4yBq6vL4ncG+TM62HzFcNu/DxA3dVppW3E76WUYX531V6pKHikL4
         /08uA6V3Tw1836t+cv5HuvA7jQrKhqme5c3AfF/m31oOhjIAt9BPrU3bUO067VoopH5N
         T0G2LclvuG31VwbjJfYwGlEJ/TvWS1RyoVZEuwHrvXDLXCmpnybA77Q1PXhd7PqfPMEO
         krrFSUwwfqbeei7Z+r7WNEqq3VkTueTcuKql0dJ1XMFVfHdYQCCCpvPxj5GWMXUAWV6i
         yrs9D+SNDtlOgKJPX0IiFQTb1aR7WSW4inXt/5jFOlGN/DxFCyxce3+z1c/LmYhmblJl
         LDiA==
X-Gm-Message-State: AC+VfDwIqZF6hCT/zw3FTjQbAuSX/NTnyw7SVv9iSeB2pgqPj7NL/+Ib
	tooaX0XSrO3NbuT8ZRsDtbRSMg==
X-Google-Smtp-Source: 
 ACHHUZ49YzKh1xHFKDTfmdAfCT+y7MRWyFEMO2kfF9W5tFQkv+4/HgwK3Tei8g4VbO1JOR8V88J7fg==
X-Received: by 2002:a19:4354:0:b0:4f9:56b8:45e5 with SMTP id
 m20-20020a194354000000b004f956b845e5mr6207966lfj.25.1687883080136;
        Tue, 27 Jun 2023 09:24:40 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:17 +0200
Subject: [PATCH 01/11] arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-1-6b4b6cd081e5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=941;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qMPr5ji7TxiW7p+3tmhmdQkl5/eI9UsztKpO6YmgD0s=;
 b=MbgNEkJ4ywd3Nj8Je7BLfi3S0Ws+2ZSlBsN3swV7U0MpdhsVAYIeNsR07In2pvGOe8Wu+U3MD
 PgOYyCpmXUMAqmmRQTd/MAr5w0NCcApsYpskUCP32H0enI9VrE0eLfz
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: UG7JHVZ4QSRGUWLBF7XDLYMSE5YKNKRX
X-Message-ID-Hash: UG7JHVZ4QSRGUWLBF7XDLYMSE5YKNKRX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UG7JHVZ4QSRGUWLBF7XDLYMSE5YKNKRX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 2b616f86d51b ("arm64: dts: qcom: sc7180: rename labels for DSI
nodes") broke reg-names, possibly with search-and-replace. Fix it.

Fixes: 2b616f86d51b ("arm64: dts: qcom: sc7180: rename labels for DSI nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 34eff97f8630..b9640574e73b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3120,8 +3120,8 @@ mdss_dsi0_phy: phy@ae94400 {
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
 				      <0 0x0ae94a00 0 0x1e0>;
-				reg-names = "dsi0_phy",
-					    "dsi0_phy_lane",
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
 					    "dsi_pll";
 
 				#clock-cells = <1>;

-- 
2.41.0


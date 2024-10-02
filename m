Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B3995164
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:22:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D863814C;
	Tue,  8 Oct 2024 16:22:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D863814C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397355;
	bh=KJ/XBCfRYMGGmoGw6pT+HzGpgHNM0HqU+ZU6WmeHwTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A1yClFF1gKIGqtPgx6nK1sfRJrGr1Y4E76IFdevxZkuCVbfYBcqYBn4+gx2h+LgQd
	 74P/Sc+1HbMIFRyddP3um0juY14I/b7cjw4ZLAtxn5mLihvEc0FtJT+0HTGxAqHqiI
	 OVxu7PgRCGr90FuYUkbk2dZLmrGYn7iO3gw3RdXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43CBEF80579; Tue,  8 Oct 2024 16:21:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6AD4F8068A;
	Tue,  8 Oct 2024 16:21:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D729F80536; Wed,  2 Oct 2024 04:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3C3BF8001E
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C3BF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eWz0kp9n
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so106980166b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 19:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835627; x=1728440427;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6tt3oG2r1wMqarycN8kg/XqfelGZiLqlb3bl/K/iuU=;
        b=eWz0kp9nzzMqC1uPZpRUmvBq6/tX32XoJh5RdCfwpBzhM4u8yzif1FT5MgARmhyX9j
         CaD9/NPBsFuLzfeibQbUbrntLQy2e+ypHE8BrrFwyQHbRZjGzyA1t6DOsgc8zdIeNRwW
         ObSNXB4//HfWLyZgBh7XF65CqU/OKN3TQj9V4GL4UB7stNuK5A6dsRlyQB2o2EuZM9eo
         W97zTg64ghAzkyR/YniwLBSH61HEMchV/+FbUMHQsIGLoj9MicfRUF1oxpwleDJU0nR8
         N/lkp5XExTOTr76LXmJ8f0v6+ZLoUmcTzL3papF6I326VGzA8PotuB0B+rj9HAd1J6fN
         g8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835627; x=1728440427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6tt3oG2r1wMqarycN8kg/XqfelGZiLqlb3bl/K/iuU=;
        b=Xo0Of7lqo5I5P4B+YwCSX9PdaCs9hAAij+MDyCVcavtgpXBwNtUVruyShqT7gPK6pv
         05QVG1JEmFEJ/hXsyblj6Kg9cBCIUdS/D2jZOb+kRNlZ5w6uG8q0FDgt64DRkw+EzXMx
         x4sr1Q/VdnYmbNSso+sjieKHCmYtVuiufklIRatNb3Mo8ZrNSId33XW+3p9wNwSml9YF
         Jl2oJqSfYstNkXPnYViZYbHnF3X1csphQz8O2hC8sS2K0kRMEWFTR9wui4AyT4hGmINO
         CMMMGG+xBD3uYvQfTjVYBENFFWMMwmbX9DJiEc0sX5bLKPrQ0lcApU3I1oJoP2CxTfEL
         HFBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrpn4Rukr5B2yfLPvpQg2KEEvUWoD8PKVxYOSYz7LorCQiO8D3YpeFepw97UPnjzPSZ4q7ebj6QrbU@alsa-project.org
X-Gm-Message-State: AOJu0Yya2Pm/8wUgV5GuR8/HdUGxkVve6dzj7TBHrEHwNTm9KKJ/tl3T
	wm79EuC1v3auIwgL0UszaA14bvnUIjIj/NNU11j/PbDN5h4FCC9FeSi117+i9hM=
X-Google-Smtp-Source: 
 AGHT+IF7DSxO6S/zg0dV87J7CmDUxTyQGbSW2llz09R6q945EHLqQDNzRVtWVZkaJVui3r1JoBLxgg==
X-Received: by 2002:a17:907:848:b0:a7a:b4bd:d0eb with SMTP id
 a640c23a62f3a-a98f823904amr119175766b.24.1727835627397;
        Tue, 01 Oct 2024 19:20:27 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:26 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 4/7] arm64: dts: qcom: sm6115: add apr and its services
Date: Wed,  2 Oct 2024 03:20:12 +0100
Message-ID: <20241002022015.867031-5-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YOJ7PDBUEXVOH63GI7PNIWLL3KQVUOYC
X-Message-ID-Hash: YOJ7PDBUEXVOH63GI7PNIWLL3KQVUOYC
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOJ7PDBUEXVOH63GI7PNIWLL3KQVUOYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add apr (asynchronous packet router) node and its associated services
required to enable audio on QRB4210 RB2 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 41216cc319d6..b211a49982d6 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -14,6 +14,8 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2701,6 +2703,76 @@ glink-edge {
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
 
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1c1 0x0>;
+
+							dai@0 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+							};
+
+							dai@1 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+							};
+
+							dai@2 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+							};
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-- 
2.45.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C768EC9B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1FC5DF6;
	Wed,  8 Feb 2023 11:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1FC5DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851414;
	bh=g+u7ulD8eRNQd7YjPVC5WLddWLVJzJ5QrlpjBrdbKeU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mjRYz3AepkELtB8GoNcKFhErhbtTCOyWNKIsPPp6DZwqR4WPC5gWXMLl0Zut7XHZP
	 sf0oR9Ao77ut0xLlTN4zvkYZX7kN+QOszODu3owA3YfwNeou1ZzyiCtXR6rOIl/wgc
	 Rhn3e8QxcPmaXS88zIxQDVw8+THWMBR2rPNy9Uak=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3BD1F80152;
	Wed,  8 Feb 2023 11:16:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E4CDF80152; Wed,  8 Feb 2023 11:15:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C93E5F800AA
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C93E5F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xAgJOQTt
Received: by mail-wm1-x332.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso1064586wms.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eU6t5S19qfP9S/338lMbvl6syTeQ25IZRs/UFhzDsMA=;
        b=xAgJOQTtwNrVJrNTfT5OsEjumUulgPcqd+hkTlkBCkq9Q+8fyumZqYT004/fo9KeZh
         4eES/ylqvkP/Qmcw06wqlaSFqo1tUgkzzuLQYBPy2zokiaeNOfH3p9ecuGTWTfpLUQtd
         imQJCyYsIi1gQCM+J7YBsfjFFZpMPPlvIMCaKL+p3SKujBtA0TW6b4qR9awJM97r6vcB
         BFE8gtZz9Dripy1Y0sNQvMrC+v+j5f0KmnBbibWGDUV0YBtfpm+LvEtpk8XlaAZvmqe2
         QDTdxqjvhDWl0wH1djTencI1QckLv7cmcUVLDl8VTk8hdO1QabwL2IefQ77N1sRL8SjI
         l5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eU6t5S19qfP9S/338lMbvl6syTeQ25IZRs/UFhzDsMA=;
        b=UL1spQ+l3cACClPojl+poRl6emiOuGknXM2wwYBV9rNLAe/Hkw6wzfkZivR95idPu3
         FySyBV+xGU8ymkfT1G26xnvSHNnm8SyXhm+E9DX/RasQ7KpxfceDMJMAMZ068MBbM9Fh
         8aG83u9K+M8zk59s1xgocwYVjVg2tdaIx5cWc9l4Dp3daf89ZFPWyCH/Uh2A/Ghd55mw
         wiwrRgMLtGi4iTLVqYFyHqETVF7lGfmgfNBLKKfWnLzay84JUm5agftQSA69ddMlgL1z
         IidRWTEtR5hOlWIF54ZYmZ2HV3u68HsNxSAiwNmf1WhnTorpz7nK3gTDWPcN9el3IP2H
         TvcA==
X-Gm-Message-State: AO0yUKWPdkKKAAzWXsmUTr4qXmuDwg3CMXBrCa9QuqpT+s0/54vEm467
	3tSRcq/fO2ZEHIhmSjWqY8aq/Q==
X-Google-Smtp-Source: 
 AK7set+3SMFP2OpvNgvLeXy7mER86UTqQJAVe/mbVxWgJzDl3CcIVKEZEMzUr63nz3N38oChbUWJ2w==
X-Received: by 2002:a05:600c:230f:b0:3da:f665:5b66 with SMTP id
 15-20020a05600c230f00b003daf6655b66mr8239345wmo.6.1675851349867;
        Wed, 08 Feb 2023 02:15:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 1/7] arm64: dts: qcom: ipq6018: align RPM G-Link node with
 bindings
Date: Wed,  8 Feb 2023 11:15:39 +0100
Message-Id: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VCW2Q7H47OTGI2A5JWWH7LCUBO3SXMI4
X-Message-ID-Hash: VCW2Q7H47OTGI2A5JWWH7LCUBO3SXMI4
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCW2Q7H47OTGI2A5JWWH7LCUBO3SXMI4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Bindings expect (and most of DTS use) the RPM G-Link node name to be
"rpm-requests".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index d32c9b2515ee..bbd94025ff5d 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -176,7 +176,7 @@ rpm-glink {
 		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		mboxes = <&apcs_glb 0>;
 
-		rpm_requests: glink-channel {
+		rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-ipq6018";
 			qcom,glink-channels = "rpm_requests";
 
-- 
2.34.1


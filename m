Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7468ECA3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:17:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B9AE77;
	Wed,  8 Feb 2023 11:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B9AE77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851468;
	bh=WpnikFqDzHELuPke23TKt+aeY2MHX6gpNHpmXNZFryE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=My6Spo0EAEVDTgUsI+CxMfT/TExEr/CVu0fYnoJPBD5ndNICbiVO38l0iE9zoXxBk
	 Lp34KMOWfQ8AXQPkME7RgjdyKhFuKImVFK1hztZDbsd7MXBas8pHYb6RHogHIW00Of
	 3ZsTKxmrSBDXGbuCTVbbCcRD8Gd+ZPLz8bV8pGek=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB70BF800AF;
	Wed,  8 Feb 2023 11:16:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B974F80152; Wed,  8 Feb 2023 11:15:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9EADF800AA
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:15:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9EADF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qTVFa5Rg
Received: by mail-wm1-x329.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso1043892wmp.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 02:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKDdeglkNeUYsDE7dNCq4DvipvOoaBQXMMUdKEcJp/s=;
        b=qTVFa5RgMhys3GGm+9g32DXDiQdSAtwy7Tat/X4xAnd7P8SEoasyyDRs1XC9nKwmeU
         0ZcERYTUzqS0h8Fifuvv030i2nnLbLTpe0Wa1Dx4VtAdieO6w3URXqUO79G/uP60dZUk
         fFDKxEbS3T2Stj+vlpB79Zjf2RDMMvWWf9JPpXoAnlpgfj/0clsFkoky6tUJfZD3r28T
         2wu4U556PcVC9fv3jXr53TRx0vLrRKig/P7QQzfaKosLHOQyTofjIX/ePz8m75QjTGfQ
         Rp6/2HcNJbA1vMk6dSo18wRNOe807ufBom05YO1/hhLrVU0yuTwtxC9b7ayiKt/rkoSd
         TtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKDdeglkNeUYsDE7dNCq4DvipvOoaBQXMMUdKEcJp/s=;
        b=NclB8AcB4oZ193obYCVyCfiQIIGP/Zu/3glpsTboIrH+3+E4m9IVexErlY1WvBpIJJ
         fTT+LJzzOeeAZ6fm79nN6Yi3m3CVH1Gl/Ab6Xj5081w+KY1YPGuoDbg4MAF+2bUV5sdn
         GLDNcx0uSBuuAXeL3qhwWFxrVn76OXGm076b/Sb09ILEgINc85A85LU+IV1xAGeHdN5I
         g8X2pSD7o2h8uOCI+t5fg1FxXOd0SrjXaHJTXA6p9p0R3l2H5ZIrpZUZh40OIPTm8Y7d
         losQmApNDKkvZbhmxZMkoUBU/mo24FxysgTxgCDOZrm5xIJNdzw26SNI5S2fsH5jZPHQ
         TkiQ==
X-Gm-Message-State: AO0yUKX7CkXnYZEqx2UoFCJ8iZKmBihJZsX9S6819w4Oq8vHW3/cHBLp
	g3mVF4pj7gVyrHTMNJefdvMG0w==
X-Google-Smtp-Source: 
 AK7set9I7FQyv5QlH9tUgviBZftDZjVnw+tfEbullhD6mNVpLl6bzzA6hwk4pWCze2U3YVWY1ZsX7Q==
X-Received: by 2002:a05:600c:331a:b0:3d2:392e:905f with SMTP id
 q26-20020a05600c331a00b003d2392e905fmr5835162wmp.24.1675851353876;
        Wed, 08 Feb 2023 02:15:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:53 -0800 (PST)
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
Subject: [PATCH v2 3/7] arm64: dts: qcom: msm8996: align RPM G-Link
 clock-controller node with bindings
Date: Wed,  8 Feb 2023 11:15:41 +0100
Message-Id: <20230208101545.45711-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XGTXTU4VQCCLE2CDPV4X36UYTYQZNU6L
X-Message-ID-Hash: XGTXTU4VQCCLE2CDPV4X36UYTYQZNU6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGTXTU4VQCCLE2CDPV4X36UYTYQZNU6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

qcom,rpmcc bindings expect RPM clock controller to be named generic
"clock-controller":

  rpm-glink: rpm-requests: 'qcom,rpmcc' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 55180586f7b6..e0d46dbd498f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -483,7 +483,7 @@ rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-msm8996";
 			qcom,glink-channels = "rpm_requests";
 
-			rpmcc: qcom,rpmcc {
+			rpmcc: clock-controller {
 				compatible = "qcom,rpmcc-msm8996", "qcom,rpmcc";
 				#clock-cells = <1>;
 				clocks = <&xo_board>;
-- 
2.34.1


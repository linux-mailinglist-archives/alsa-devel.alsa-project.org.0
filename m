Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F65AE7A7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94DCDAE9;
	Tue,  6 Sep 2022 14:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94DCDAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466727;
	bh=HojHJRU+Zm0cREM5btPJZ9JYluTh1TBsj+tAONgZOGk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ipSgW8OXqMC5Q2DpvP7MOmQKI3fSjGlzlxVnq+3BHHBe1eFwAwYxV+mnTfgGoBeHb
	 qezXeFpVtdHA8JK0xnr7iITyQTKTKdi/nABumwuWwMY5G1EmTciR3L+s+bAUFgtEeh
	 uawZory+Zz7+s4DZ0x1c3MuuRLkyMt5MKUAvVIG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36201F80548;
	Tue,  6 Sep 2022 14:17:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC1FFF80538; Tue,  6 Sep 2022 14:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30FA4F8019B
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30FA4F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jIHJBCvw"
Received: by mail-lf1-x135.google.com with SMTP id q7so17080217lfu.5
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4JDAwEZQcoLKI1Gf4ZPXihH24xb2UdAVE7Vfa8ywfLg=;
 b=jIHJBCvwFRT8UkMJIUSjzxulkLzAHD8JZCtNnbMHOcFyExAj/+3oVWtCEYz7G78wJr
 L7QIX5ZFGIyWXlxStknm9T+2YtokbVSjH6uPbRzyvUfKtH0blGIEIOwIxKrAp4W8Ao3S
 T/P6YkT2v+r+ZeRxLNv6G5YzDy8t9P2pfBjYYN3aEFOOjaj2EF8cwzA37RhhmSfGHqPb
 dSP4oGiurD+bK1MNGcrR/p/alnmlBciVCWHM6td/CHwxIxoefNyaeEsDXFfwj3wx5zGx
 XwW554fzB+fMtEvToJKCWjYy4gyY1m3TNQMENbssKGHzfXz730IhvctCHOmH2LLDjRRK
 +3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4JDAwEZQcoLKI1Gf4ZPXihH24xb2UdAVE7Vfa8ywfLg=;
 b=d7F1w8Yv30qr+TXI5mXFuicSojZrHxEWLjlE49NCRgis5NPGhoql7yuSyf1x8RvjFh
 TpPF/Gs2Qh38xlmoZzBqtuuKY2JvTQ/Z4wYI2aBJoV+uNsFQfBGX79hG6Zb4zpgRLpZ9
 LrN8mUeKcCQcwOvoDJUeQo5hwMNBQegV1fmJwWSDjNlhQkwtjqd/FTThTUcbH4ZUu9h8
 Jm7BKBY2Z60vwdCkzIF9TNqtn0PtdHusANkgWwhVWgk6IkmEW7iCAxXfkdHZakmfLu4l
 DbKmK5UqmRVEL7wMdruMN5K2kipOdLK28llBwGCiTEXPxAZysvLy3XeinYMBimE57KV8
 iSNQ==
X-Gm-Message-State: ACgBeo3PmqMGH+sJOL8jxD7yJSRJ1tp16mZoybG94zh4elBv4ELWkeO7
 rVdGETc5hLvTH/S10k0jRinqmA==
X-Google-Smtp-Source: AA6agR6i73k9qW5HNQcpSZoKLIbwt/o1xO7wVL8odgzciD21w6PoqcPDvxG3NXi4l6UtirxHECBlvg==
X-Received: by 2002:a05:6512:1051:b0:494:8e93:bf6f with SMTP id
 c17-20020a056512105100b004948e93bf6fmr9769680lfb.320.1662466621256; 
 Tue, 06 Sep 2022 05:17:01 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 02/12] arm64: dts: qcom: sdm845: align APR services node names
 with dtschema
Date: Tue,  6 Sep 2022 14:16:45 +0200
Message-Id: <20220906121655.303693-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DT schema expects APR services node names to be "service":

  qcom/sdm630-sony-xperia-nile-voyager.dtb: remoteproc@15700000: glink-edge:apr:service@4: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 98d34b5e1df2..8e7b577f78c2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -767,13 +767,13 @@ apr {
 				#size-cells = <0>;
 				qcom,intents = <512 20>;
 
-				apr-service@3 {
+				service@3 {
 					reg = <APR_SVC_ADSP_CORE>;
 					compatible = "qcom,q6core";
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 				};
 
-				q6afe: apr-service@4 {
+				q6afe: service@4 {
 					compatible = "qcom,q6afe";
 					reg = <APR_SVC_AFE>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -785,7 +785,7 @@ q6afedai: dais {
 					};
 				};
 
-				q6asm: apr-service@7 {
+				q6asm: service@7 {
 					compatible = "qcom,q6asm";
 					reg = <APR_SVC_ASM>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -798,7 +798,7 @@ q6asmdai: dais {
 					};
 				};
 
-				q6adm: apr-service@8 {
+				q6adm: service@8 {
 					compatible = "qcom,q6adm";
 					reg = <APR_SVC_ADM>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-- 
2.34.1


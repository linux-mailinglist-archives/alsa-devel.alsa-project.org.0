Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C64F91DF74
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB7C2C1A;
	Mon,  1 Jul 2024 14:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB7C2C1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837429;
	bh=YC+yCZxleCG05wr5Dx82fT/dLdVie8/UI+vk4bGhDr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UwxKia98rPgWO4P7/OgAyVMuUsSrpOfDUmL9KQ/lVbVY/NifstVpcr5y3Z+nudHtR
	 EPlZHL4/YHPD211yiYZTotVdZeWbL+zlAwXuLHNlmnIFj65RFjTnP42OUTzPpPg+ot
	 AkHpFpU7PypR4I+7w00F2jSihUxsBUWM3CLP4kFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DE5DF89AFD; Mon,  1 Jul 2024 14:24:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3609FF89AF4;
	Mon,  1 Jul 2024 14:24:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25366F80578; Fri, 28 Jun 2024 03:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8796F80495
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 03:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8796F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iiKzqEkW
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4248e28de9eso511605e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 18:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536841; x=1720141641;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcxRyzKXv6NGAGrzN/ICDppwf/NlnyWUCDPLH0CZx2c=;
        b=iiKzqEkWAS+fXoVlzelwY7qdabdMx8c1hC87jICGTY0U9Xkw2xIn2FUM3jRq5tc5u8
         6gdiTTht2LdF6VOQsTWCQI5llQiFPWBomCCYFF11rvTl0YvKcLmC63dJ/ZPGPqABfMP3
         Z10XHi2H/8TUKJeFFPXvIJJlYJ+bZHbO7Y1gpVqTTgCOQQ7wKx42IHNuwJEJemg1jeGG
         f+w3vSn5xArqk4AU5D5kWA4/e/l37fnvlSIcXA0Rwig9ZjeyaOTsgwMnxU4mKBrLJTJG
         FcIaX6vXpwZXvTd2xAPro7WFCB2HJ1DGQ6rrB/TFa7E6DPs3xhgVQoZyUD454rZfqeD9
         sBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536841; x=1720141641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcxRyzKXv6NGAGrzN/ICDppwf/NlnyWUCDPLH0CZx2c=;
        b=m0EEYmXi/WLmcY1+CvT+GqgRXnYOytWos6zl3g75ir/PF9EIPfgieaGqu9WvAueDLL
         bsFljHP3m+zd/Yw6YcOJ49Cn+9IbNg4vIZrpXmglosLKEKbuq0EmCb/WwTXle7OGK8lV
         /c47IRecwkcF6/8oYJHf9VBj0PaaFZT0K0CPHLSHlzvh1a2j+MVxEtXRjOYi/KdEph1w
         qfYFVNSkwdI0o17i18vNmMNd2nQa6OD6SyJ47rTsoV99exWG3rdKtLp4HTBbcWIkJZZ6
         8v7SuM+lgv5VOa0u7uynovTsDiBR1KllOaYI1ZTfL9GYD11I026PKKhs5IXK8yOt5MbY
         P4BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzdkX9liXODGIw3w1rBGk8xpPc4wUdhYcLuUWuR4oZXcicF1we6xCw4mKfddVrShxJIzUZN4JeJTrVMLFZkCAo29ZQ1/20gxUD/LM=
X-Gm-Message-State: AOJu0YyTbEqM2WxmqSs0iMgxIQF5Z+JzAd/bNJO272XzKcDfDsemYoxg
	sCzjEC1L34Y9N+344KRF1H3s+9xSBeqZJfVjCZZ1fL7QXhm8YlG+vWY08Kb6jX4=
X-Google-Smtp-Source: 
 AGHT+IHPN22MSh+P7jZjEm5freqL7ZysOn8u1UOe9bBR19X1ZgvHfUbx9z58xuswMEphBD4YtlPZuQ==
X-Received: by 2002:a05:600c:3b8b:b0:425:69b7:3361 with SMTP id
 5b1f17b1804b1-42569b7352bmr8277325e9.18.1719536840736;
        Thu, 27 Jun 2024 18:07:20 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:20 -0700 (PDT)
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
	alexey.klimov@linaro.org
Subject: [PATCH 4/7] arm64: dts: qcom: sm6115: add apr,
 its services and simple sound node
Date: Fri, 28 Jun 2024 02:07:12 +0100
Message-ID: <20240628010715.438471-5-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SH5XZVXPCS3EZZI5JSI6424Y2TAHEMIW
X-Message-ID-Hash: SH5XZVXPCS3EZZI5JSI6424Y2TAHEMIW
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SH5XZVXPCS3EZZI5JSI6424Y2TAHEMIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add apr (asynchronous packet router) node and its associated services
required to enable audio on QRB4210 RB2 platform.
Also, add an empty sound{} device node. This allows board dts
files to fill in required board specific properties.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index aca0a87092e4..c49aca3d0772 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2695,6 +2696,64 @@ glink-edge {
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


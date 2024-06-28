Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E06DD91DF76
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 368112C0C;
	Mon,  1 Jul 2024 14:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 368112C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837443;
	bh=ZZbdHFT9ZRAwH2jwxwKvq+WMg4pTAYm+sxzcfmphUPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fx1eAdQtBo5dV1ADj2a9ArnOlvLc6x2nnUaiRKQzsFxYEwA/wuMvZRoURgoXsy3MS
	 R5MuErTtoLQ9owPcEM7bglsXn3wod0E9ZLEV0F1rKhJ9GduB0iCRryWwikJGqCzfJd
	 pE62NCOkOgQLcsxXqBelKfTmT27alFVecPaCiJZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1595CF89B1D; Mon,  1 Jul 2024 14:24:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D785F89B12;
	Mon,  1 Jul 2024 14:24:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51B7EF804F2; Fri, 28 Jun 2024 03:07:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69D05F8013D
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 03:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69D05F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zU5JgWWI
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-424ad289912so414055e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 18:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536842; x=1720141642;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dynAb/Zg+8LwHqw/4XbLMs/MXNbFYTrBo5jd++nUj2c=;
        b=zU5JgWWIOteISzOhnEXjBURT3pEtav9OQ3e5LgJRcNOtxzMyjPsW80H6xmR43LNNUB
         /I6U/k3Cto4D5qnn8xnqG/MeaNN0yxK1GuNBjIyvcsxp/tshZwOEwpT9HYWPyt1s23Oy
         FE38RvfH61y+oFqDoEQoG+TQTsg4Js7HR/I6XovR5I3uDkka30U2l5spY31q7FaPgn5/
         7isXy6cLWCQrzPCTJR5M3wwyDvvBafb80rs7BzU1f/BZDOISgoRtLaQLjs40qW6rcxlO
         0jLtcJBQF537VQIxHc4172vCtaPvuzrhBuD/6HB0K5FElwmpMcY8Az9Egf49LMqF0L/L
         6BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536842; x=1720141642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dynAb/Zg+8LwHqw/4XbLMs/MXNbFYTrBo5jd++nUj2c=;
        b=HJ9Br1aOAXWtTKEQ1XC09wwtILxgu2LCYASOgKDxooq5QD9Mtmb2Ojcdlnp+2QgGlb
         6FZsEz5PWiMsEadF39tiIixBADVwoTHrm22iBBu0u7tqujoCpcFgB2ZC6zfgz5TarbWP
         Gh7PJD2V1B2ejHgX+3Pd2PT6w67+NeJ2VJrBuGjwdH/L+NJsp7VbRD3BhFArebDmhx3U
         koJvvakyOlv3Cjg4ZIDnzwCg1MvFduNxj8Nf259KWwdsbZtC3MxJrnosY5hxTTAGx173
         /PvuB9fXeGsag7+3HBLy2wde+fAN2CB9Z3Nquy8ZvuVJbM4BgZvgMkaKUV09d7tZXuSV
         Kx6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUFuvxiaR9LnbH0ljpbMZ6jnScSM8FUYxAP496d6M6A9jTV2GrDXfsDa9448KoWvYCmhShOLwIqxI/k9RAwvKvRm1B5z2xHAGZhq0=
X-Gm-Message-State: AOJu0Yx6m7EFtXTGSohWafAJRgZRiOFI/vJF4K3/7rsUO89NU+2PJGM1
	uHiruMabSlXadzys7olbWPbSL7OwOKDokkr0Xy0UvEqpuk3LuGukhaHIJMrMTdE=
X-Google-Smtp-Source: 
 AGHT+IGOKI5oJNmHOq5jyVwdpyCLf2KYJIoEqX0YWFdClIjga1qqCIxKbsEXzORyUUOyqTbaEueFlA==
X-Received: by 2002:a05:600c:1789:b0:424:a403:565f with SMTP id
 5b1f17b1804b1-424a4035701mr65078085e9.11.1719536842616;
        Thu, 27 Jun 2024 18:07:22 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:22 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: qcom: sm6115: add description of lpi_i2s2
 pins
Date: Fri, 28 Jun 2024 02:07:14 +0100
Message-ID: <20240628010715.438471-7-alexey.klimov@linaro.org>
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
Message-ID-Hash: DC6IQFKCEHLN4ITINPYYGQT6F36UGMHO
X-Message-ID-Hash: DC6IQFKCEHLN4ITINPYYGQT6F36UGMHO
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DC6IQFKCEHLN4ITINPYYGQT6F36UGMHO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is required to enable to HDMI audio playback on
QRB4210 RB2 board.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3a9fb1780c90..5487b274836f 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -823,6 +823,40 @@ lpass_tlmm: pinctrl@a7c0000 {
 			gpio-ranges = <&lpass_tlmm 0 0 26>;
 
 			status = "disabled";
+
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				sck-pin {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ext-mclk1 {
+					pins = "gpio18";
+					function = "ext_mclk1_a";
+					bias-disable;
+					drive-strength = <16>;
+					output-high;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
-- 
2.45.2


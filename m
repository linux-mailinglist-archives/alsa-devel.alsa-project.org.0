Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D125E7F83
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39A1851;
	Fri, 23 Sep 2022 18:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39A1851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949857;
	bh=pSjmQTnA+3uEOeFFPGM28snOnA3f6gUQMic98F+X0J8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I9ADE8eWgqn6ukQjApo90chNdGvnR3cI78UvF5FG27cllwIdMOR8YgW/GQn5VUXeL
	 7WCIyOot6prkLQW4xlZ9bOfa+pBq0hov29UFsXLPFzsyLjdc8HjgS23iUwLUNXrMAd
	 BdBxrNZOhGaTRVgIYZk8DLavlvUmfb8aiSIMJlEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9459BF8053C;
	Fri, 23 Sep 2022 18:16:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ECF0F8053A; Fri, 23 Sep 2022 18:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B978F80224
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B978F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="igysk/LP"
Received: by mail-lf1-x129.google.com with SMTP id a2so1054725lfb.6
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=l9KPENs01rvOOXjLT8Qa2HzJChvcWGtJ+M/KMDgaQo4=;
 b=igysk/LPGN7CPrkOpx0dO63HrJb3ebNd0gJo1lZ5TJcPAcefsFTL9IZfTCzLNzjo/K
 rqsaFrfXWLOvH7yX4HvVvNAN5alEEy53JtMpRwAKeZkGltThuKe/EmkM+HqvW5rVV/Td
 4KRI8EkRoebtGcUsva89IoR8F1mujKAAXt6oTrpRvEGf8tAoQUMiNprYKI4jHrHuYH8T
 jQH5gO0S7VgoKmhr04SF6o1GCR8zw4W5pmF8/hY9VjgFFqt9oALu8x+AvOfFWHll8uOG
 3lXjfpZ8KBEs3uE1I7aJTq18aUaRywiitC+BdjzU7iS+NtWwTtzF7ZM/HgnTGKYawHO5
 ye5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=l9KPENs01rvOOXjLT8Qa2HzJChvcWGtJ+M/KMDgaQo4=;
 b=EUL1svkCQBWycp/D/uHKopOpciR791hqiYcBb2upI+6pmKDcOfbZfF7lea5WwNO2H6
 whjhmpiN/zB7YJfYUiNr+Or4Xnq8VZhvE0l7YHRfdbfR5srsHz+NGKX4qnUxu/DPXSke
 NU+FV5keoZeUtgVNKweLOwFwOKaY7s0S/tw9HhHpnFrnJypDoCg+ZZADENVVkI58fd0V
 5PQAbElbF8peiKh8l3Hga+AojbAH1XzinOXBBk21nx/Ri9bD/xnZLydhuXCKLn0evI4l
 Bb73JpEUUnlADJ4pZ036M01HqsqdzYG4EQAAgoGxahEqJuH4SP1CP/52+8QnDaK+G9sp
 XKog==
X-Gm-Message-State: ACrzQf3nxFD5Kji3WgmqjtO4S/4dsg5DCrqYA/lvViU4h631TUQrZZ7S
 fphxrLJ1azg/YpkVNvx8hwl14EKX6IZzXQ==
X-Google-Smtp-Source: AMsMyM6tObYbcMIu84HwB72ICqPwolfxLPi+i1ky6mlQCNrwwyRzMbsebQ95K4JP3IV2pVVm2iM3fQ==
X-Received: by 2002:a05:6512:32c8:b0:49a:91d7:1bbf with SMTP id
 f8-20020a05651232c800b0049a91d71bbfmr3459943lfg.560.1663949768051; 
 Fri, 23 Sep 2022 09:16:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 01/11] arm64: dts: qcom: sdm845: drop unused slimbus properties
Date: Fri, 23 Sep 2022 18:14:43 +0200
Message-Id: <20220923161453.469179-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
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

Drop properties from slimbus node: unneeded status and
downstream-related qcom,apps-ch-pipes/qcom,ea-pc (not documented, not
used).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d761da47220d..9db1fce6b198 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3828,9 +3828,6 @@ slim: slim@171c0000 {
 			reg = <0 0x171c0000 0 0x2c000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 
-			qcom,apps-ch-pipes = <0x780000>;
-			qcom,ea-pc = <0x270>;
-			status = "okay";
 			dmas = <&slimbam 3>, <&slimbam 4>,
 				<&slimbam 5>, <&slimbam 6>;
 			dma-names = "rx", "tx", "tx2", "rx2";
-- 
2.34.1


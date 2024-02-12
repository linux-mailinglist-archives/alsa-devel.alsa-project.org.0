Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA4851443
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:12:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9269DF6;
	Mon, 12 Feb 2024 14:12:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9269DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707743552;
	bh=OOS7lbYOFBWS9cWYXmiccxamzx9nSjNqu+J04bjACok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AbZOlLtmM9zI6cFvkkNWjGFB4i4RnBP9HCTUJer41/kW/z24lkfSNSe7EawfLJ+jR
	 3v9gw0/sok4TQRE+32SfXdEXESGBB3je4vEdf0/CdA2kgz9K9ISuaEdcJku4YOM6Jz
	 GZgSKFT/Df+TSk6HZUbEMzyZ/7k8LmAsiZCqCcpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B948F80641; Mon, 12 Feb 2024 14:11:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68122F80638;
	Mon, 12 Feb 2024 14:11:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83D75F8025A; Mon, 12 Feb 2024 14:10:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58986F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58986F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NDDbNEtL
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56001d49cc5so3922154a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743424; x=1708348224;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEntnUmUKGyVECFoIVOH3J47fJEuz2/ADzixCid4iQw=;
        b=NDDbNEtL0DeOF33Dk3eCZZfJdkxrETc6dtXlyDm+cWo3eLiz086MrnfImz6qsj4IQp
         6DrZLYqYQOHMGnCSk8xMx6VfJArIAiDR8d/cexHowzNcdamX0+Ttn8UBM+ZIMc5/FCjf
         wtXq07+chv8dVH9LsvCtciEzM5+BbQOhGph9nmtVVJycK1Y5QiMHH+cjZGQNC1v2Cg3q
         sZUUa5HTBuLSbx/rpcZyEYd82Y5mmH6rlufdVqpToSHVOos1KHNMiwPh45sUrnnRh7AH
         fSSEQ7LO0xlsm2ab6avIH3LTiquvvydPkXM83l1ZkYmGzTv5jX9XudX+JYZOi+/wrTl1
         zJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743424; x=1708348224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEntnUmUKGyVECFoIVOH3J47fJEuz2/ADzixCid4iQw=;
        b=RVxBiIOXD885tfRSWV4LLXskOmw3zPvyHbcLcXOqHkcnjwhEeLg30z8eT+EQYhf6yI
         uQ/vrJRzlfM/Fx4UTywcqjxGceBVHkzsyJHhNSi/r+kWNy4BQQDfmmoq8A+FPPV68Nne
         7/rIEbDXko/Nef7ZCSQfPr+Ltae97DiPPV4m7lkO6t90rVwTAomngxxLb+OlC4p7PP6o
         EJGgWitkO05jU2Vf+J145cUmNH3m6azUIDIgbtTDwGljBBUrwUI5AWlXj1lMxgJLy0ns
         LbtW66jmfSr5ERNdfK7eGUbcjUtVTaknx42qhXcg5GegCSQZkxWT2CvqpLB7G6R7YPzN
         XnNw==
X-Gm-Message-State: AOJu0YwJyTJU5TidrC9YINw37zeJjhlL6xLZkkaqk3znGh7CQpHN7Jkc
	C0uD2SF9dS+fD/Tctr9Y8BiFfzwRaoUxPQpKO8KsBDj1vWaD04LK9yo5sfNIR0U=
X-Google-Smtp-Source: 
 AGHT+IHMtZG1xVNXYMfZXJ8coAjFTW1R7mL6BXbztL3soxJqjE6fKCKuAA3JhTttTglvZqU4x5W7Ew==
X-Received: by 2002:a17:906:7f12:b0:a3c:b9b7:8067 with SMTP id
 d18-20020a1709067f1200b00a3cb9b78067mr1423292ejr.58.1707743424223;
        Mon, 12 Feb 2024 05:10:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCURzPBLM3V3pV6Zw67C/ZVKsX8g9TwLnPSvNTaf+U/694OvBmMT/7IVH7YT2czLnc2gkS/XLiUrl8mTJA3KRFbdJdAA5q3Ygu/vs1SLUs2JAXu84TaRGJ1Jg37/XFly3vUtNm1ovQBcvBc11bybT3ruWOhEut/d06SesX6qHjQkPyE9V7qagy4RGzI94IkdHJU8ysZ00Tu5A3tALRtOKwuWsejve6zuUrsd8a8YE57RlrVu9kvq9dC2AAQh/Yjs2fxjlue0p2vyhxIWKKYxEGoG4lrlGy5BdLj7n3fSLCjeJHNWq+Vk0wuwczCinw8gcHFri4BPyiblbDf4fyy/MUGMPSDiYgWM6sf1gWhTP4Q7E26c5TlbLwpblwMemhFxpUN7GJ1qsv/JrI15gnI5y70LiYLcx4MjwtyPtYRG32BVKZSp3BetOgEPalz0v/hfGuf6ThlYOPjBNVPyPql6nc0SUnM5dlcMGOfIStPu/kdeK3kcGphDpf7+od0H3O23KmeqEDFnBYQ1WjDMzXHqbEBu5QnG9SkdTDZos4YdS9hAQRFT87WLiuCNACdDU7YGPA6b2AUYeuo432WAoVs3iuIOFbnAt4sPRnzITrVs/Yz+rSYBT5V3ieyZpJiZSMT/Xgb41El/Rrk1BAUhKieoW+VZa3Hh3X8MC4mvTEmHkyTui3ogeYIpaw8eXa3Fz9/rYh7LGTUxiWEl6VMrT57lDl6HhZXm/gpobcHDSBWxSIcePlI5Rl1jsRPuYgOruEyRZG3tDp6Z7a3tUM/OS9ALILUInqAakWjQYKQm7975jk7boA5MT1hcBWSJlRghvnmvtyfNgdhYZiEKrmB9AFRpIpoWEgiH
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id
 gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:23 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:10:11 +0100
Subject: [PATCH 3/7] arm64: dts: qcom: sm8550: Mark QUPs and GPI
 dma-coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-1v-v1-3-fda0db38e29b@linaro.org>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
In-Reply-To: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=1550;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OOS7lbYOFBWS9cWYXmiccxamzx9nSjNqu+J04bjACok=;
 b=H1Bcg2rzFfpWZ+ONZTsv+XotMsPZWzH0sPWJa5fy6xS93138s4pZiqOTYI7h7EjM4AclTuj9G
 +Ermko5L4yxCW2wmwFkyuUOJYChewCVx9fjKmkcNEtaHvWwgWA+efNV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: ES2HA27BETVU6PINTGNHXEKCHR7MC2IV
X-Message-ID-Hash: ES2HA27BETVU6PINTGNHXEKCHR7MC2IV
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These peripherals are DMA-coherent on 8550. Mark them as such.

Interestingly enough, the I2C master hubs are not.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index b8f1c7f97e48..d696ec6c6850 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -812,6 +812,7 @@ gpi_dma2: dma-controller@800000 {
 			dma-channels = <12>;
 			dma-channel-mask = <0x3e>;
 			iommus = <&apps_smmu 0x436 0>;
+			dma-coherent;
 			status = "disabled";
 		};
 
@@ -823,6 +824,7 @@ qupv3_id_1: geniqup@8c0000 {
 			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
 				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
 			iommus = <&apps_smmu 0x423 0>;
+			dma-coherent;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			status = "disabled";
@@ -1322,6 +1324,7 @@ gpi_dma1: dma-controller@a00000 {
 			dma-channels = <12>;
 			dma-channel-mask = <0x1e>;
 			iommus = <&apps_smmu 0xb6 0>;
+			dma-coherent;
 			status = "disabled";
 		};
 
@@ -1335,6 +1338,7 @@ qupv3_id_0: geniqup@ac0000 {
 			iommus = <&apps_smmu 0xa3 0>;
 			interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>;
 			interconnect-names = "qup-core";
+			dma-coherent;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			status = "disabled";

-- 
2.43.1


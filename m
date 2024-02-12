Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96733851440
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:12:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28ADF826;
	Mon, 12 Feb 2024 14:12:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28ADF826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707743539;
	bh=kq5j5a44u0i4ZLViq4Vc2kh0Xc0OOLzaeXziNYe3I+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nlLxFBb0WJ/wV3wqveM7BXIi9eOXCV+9BmwfhPCTyrWpC6UHBfeol2PDrxgBGJwql
	 F97ArsS32R/qa64Fua0b2gek1Dryx3R6E+d6/h1sPKOu3K5ZqwbF54PWOOrjYpmdBt
	 bu35yZUsBcSpU9f8IzfoCIQXKPWco+JCp0iOZKl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60D07F80608; Mon, 12 Feb 2024 14:11:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA7D8F80613;
	Mon, 12 Feb 2024 14:11:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89DEDF8025A; Mon, 12 Feb 2024 14:10:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2F5BF80238
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2F5BF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Wokl4FYK
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3c00c98d32so360942866b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743427; x=1708348227;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWYcyGNfIFLRPx4pt/22DjIYJEdjPhLiYl159GLEbQg=;
        b=Wokl4FYKYwx49LRYMTuPJqEUAUF6fEd9a6uafDXXAUcS9hVj3XBQsF7q1r+inxakr+
         8bw30SOcaqZd+CkNyr7g23q4raw0T1tbh8ijiRzlgz8abXG7NEW8mn+9Ldj5vGDgd028
         uejX9Rx3+1/cFcui8/v1k9Q9pgbEaKFk/iDvHD2vqqkQjUkJJ0zysk2CeFkg+uIoG7gu
         aAC3ISXA8UKWLhnzfDYR3QhE7jQeWapnuEq1dr5jdu4Dodx+PHDGmiWQoT6CVrn4pBDi
         /V4sK30pgdBebAUWjoLQ73yZmAXflJQKAn9j8u8JoHM3hQVF8t8GyrODWGa6t9j5xK2t
         8yOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743427; x=1708348227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWYcyGNfIFLRPx4pt/22DjIYJEdjPhLiYl159GLEbQg=;
        b=dFyLusrJgx7/egBcwRaS0ixb3CTgKJ7wDbsTHKVj2q8VfkdQqY+lq8q43arbKGRsay
         6QV0+wJnfH3t52meH5+fHJaJ2gjSH/sBfF2vGWPeKsPr8XVo/skChtl79ZYY/Enb4mdq
         fLL1UL66HRRITi33l9px6Lv0UDGFqByewVMt9UhO/FjMW7TOOxLaj207wLt4Ej1KljvZ
         ZoyOfggaK4QLNz1WayRLdiJrMM/fscdwBY0dvkEg59eVVflei2mhA66QZVQgMJxX9jES
         chIr8FhjBfmpNXGIs8Cy7wZjrtSISA0k40BV13ce6rWSWoUr1102FlKkuIoB3haHG4KT
         QvOg==
X-Gm-Message-State: AOJu0YwOfNfIRbufc8tu2riWofx7bV18DeLgpvrjXHiCuoukV0O1Z4+1
	JAn8hfa1mRO45lUlqEhdS7lOqDcoQTAC4BBIJypwX9a5pPFoO0Qp4pyciPqKU94=
X-Google-Smtp-Source: 
 AGHT+IGFBRNSSJxs1RXogQPC+HmdRuTXUKjjSrq5nznzwQO4T+zFDp77bIblvfKfXm6kEnZ2FAD41Q==
X-Received: by 2002:a17:906:29c2:b0:a3c:770:1752 with SMTP id
 y2-20020a17090629c200b00a3c07701752mr4218831eje.68.1707743426912;
        Mon, 12 Feb 2024 05:10:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXuCyaQr/W8a+C1M0E7AVq54SBy2u41vHYdbqFfYBYFbzSAeUsaZGW5YroQozvht5zf/so9htC64gtRC7DKItXZfNf0IHOaR8Jn1DQaW2BL8ogkhCi9c/6BKYjEEDGdMbOSX2g9W8DNOxhDn9L7fSOl7fGY4ZE1gXoTjnAJSZs3DEXpIzx5OyMeBidrJwHu9cieHTa8zRfKUI0bJwCod59Y3GeW+vloREbNWN1HXWVnapH6X3a14N9eiBxyCgxu7VYzCJpvyaMZA5LdX5eMJtHWittgwUG0cL/k6HjbssktBzpt+0y8Pc/q4Durxbk4KXmwFZZLRhz8URFyz7vsphYPdeZt9D7HZaV3JjwWRNGf1gFdsjMrrqLPwsjt4XAK7v0dc4MBwaCPhR3yenyXnXTj/oE+wLio9+4JVMUs/YLxuCklZSNmHkANv35Dx30khK6Yx81FRZyouEwZq5byA8MvbarzQWI66Q5ppPY3weaLP6/r2kxvvHMbln90lIuFV++x4OV8h9lExFhKQzNCDLVEwIcxbeQEX10VqiZGVGARWKGQJ8riAjg4KwSIgSI+9STX/TrXlbLNv3KoIBmSHsblQsqU7zK2TpgU7u3rYbnRBxrG6MnvAWLeTB32HCHF3GwT9f9k2AxWHPrV6fc9n4gdt/USEUkN30clb2/G72dJV7zkEI8OvI4HkmpNCLm08Gtxi900nHobW3DAt0FV7VUdn9fhgMvaA3NEJwRW66pNQx68zZI+L+mkIwak0K9YQFt3WWeEB0QXf8aiCSNlzK7YXm7bv2lYMADU7yDiBQrG2EytArx+k6h94tHGa6isATPbiRMzDy+4I7pFrEkTVnAMqLNq
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id
 gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:26 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:10:12 +0100
Subject: [PATCH 4/7] arm64: dts: qcom: sm8550: Mark APPS SMMU as
 dma-coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-1v-v1-4-fda0db38e29b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=787;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=kq5j5a44u0i4ZLViq4Vc2kh0Xc0OOLzaeXziNYe3I+w=;
 b=4KH+YyPNIYKyi1m0IBMqd9biATcIsevmXT8PvZFoSkc51AMiOSoCBGOHDuTdwZFHd4B9pthVR
 6L3X0T8uOeUAwa1aXYa1+fwU//8FX/p328x8Ieq5xfqSZC1Ge94bOb9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: ILLZHQTVLMKVGTT74HQTHVLDETZSFD33
X-Message-ID-Hash: ILLZHQTVLMKVGTT74HQTHVLDETZSFD33
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILLZHQTVLMKVGTT74HQTHVLDETZSFD33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like on earlier flagship Qualcomm SoCs, the SMMU is dma-coherent.
Mark it as such.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d696ec6c6850..868d48b85555 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3934,6 +3934,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		intc: interrupt-controller@17100000 {

-- 
2.43.1


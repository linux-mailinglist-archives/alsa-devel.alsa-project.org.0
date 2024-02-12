Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D9851446
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:13:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 170C7E7F;
	Mon, 12 Feb 2024 14:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 170C7E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707743585;
	bh=MgGMsg8PJAMVkpQQ8WXu4KK3GFUd7QqW2NVKRDqIWlU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V9NeRzLudcR4TLaq3iFIb85JWdEAsWF9y6IGVlXXM7EBTok76g5px5OVxGAaw2lGE
	 fYlZZJ7fCmdrsZR0LIRbTuRNysQHAck61X/KRLlo7FTQ8ztwgJcQPuuS8EqFaWVjl9
	 8je8pF1j1dkve6piFe7HiD1zWcD3zIC6WmNI4uHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28E9AF80695; Mon, 12 Feb 2024 14:11:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17344F80697;
	Mon, 12 Feb 2024 14:11:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2919F8025A; Mon, 12 Feb 2024 14:10:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C33D9F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33D9F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qYIoC3X9
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so423761466b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743432; x=1708348232;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoA+yBVNdi1njW3vF3aXzPCABd0kr7iht4u+fgdDNYw=;
        b=qYIoC3X9/TvQx0V4/IpK0SqVqy3IGdyQU+tQyFp62HaSFX6RrzA+cA8vFrgLcIGyFs
         ixQLVf0M8S3+yJskq4+TamaoPP2ZWcK3M890OuRR+FqiUN7ErG+FIUHkxaLDfHR/51R2
         IIoiFkG8fh/4y1kX5F/4k9vKrZp2QNAmW9xGaPEyCq3jEFtUSerz0av5fFt2mm16LVrI
         fJkt6hx8xzeKBoN3n9vmlQhrVdqiktaQ+oWQFwHqOyza9AGki891buz/35R2v7MVub+E
         IJpmL+lMFJ+o8KtMYnUJpFoLUTmFu9Ne+bfLMxLqFx72ePrsrHomyxlj+4uAf5+/VfNl
         HGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743432; x=1708348232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoA+yBVNdi1njW3vF3aXzPCABd0kr7iht4u+fgdDNYw=;
        b=wtN7PGl5rC07kAbg/LOuhRq3yeieU4jGIDaL87e8eNlwoW+osne55HYPogdxjGj+n2
         /vmt0IzjnByO9xw6jRH1UjBqet2zIlJHybQE2u6Bc/MD3NaYgUDJ9I7OqUKQY7q/ODoN
         qjoyMwS1adhh6hmPeB+kbTmD1RtsonBPsAn0d3EGBDa3Mv9iFIJPbtQ8avYXiN+d8bPh
         +KKeIpRN75ClyycAtyZK5akBEQWbf8awQX/dMER75DnclqKDjj9cx6vZlB0u/p6fLGhq
         DgbaXtaSCzM8nsicYXNpr2C/LdD97pmSxcprRfoMfH+r6tUr4VUBBistp9xKw+Yxtxxe
         nUqA==
X-Gm-Message-State: AOJu0YxDAU9vUishGHZETSPsl3nBXXdZVF34KNgxe1CGsb1PAbBVoMGG
	TQr38X+cDqhIm8M+Igtkc0PbAzMyb3jpf8AxEW4zyL7MYB9zcApjjV0zOycWgCQ=
X-Google-Smtp-Source: 
 AGHT+IF1L5yNVoQli8PRuWJoFBDUTQ1JqNuxwlnuj7G3XoPbpS0jCyR+DCXueJcfOK/lSlltkTON0A==
X-Received: by 2002:a17:906:b42:b0:a38:984e:2e5a with SMTP id
 v2-20020a1709060b4200b00a38984e2e5amr4389737ejg.33.1707743432301;
        Mon, 12 Feb 2024 05:10:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXLku8sUVcaZo8prr0iSAHJOY+x+SrSpO2++Y8v1BMcWJwS5CMz5Oe0BnKEcb/ySFjHO7S3GcHY+b2TBA3TwzN/0m3wlj6MjLzGx3TdgaQwt64FytU462QI1ADlz0k+aXEDwXskXxrBXm+oMg7e59SGeHS4ObHkmZ+zdWY/ysHKc3NObC0DPJnBkTFEqkxfl6vchytzVStKteVjZGvvwPmQRP+9uKqDcbNLu2JRdy5n6koiZMSLFlecf31B8JzIqKA3HzzoAPFhf/UcBxkACwkkeJWYZTMm7dGEsgiMw5klgkRTSn3OYHmuaSzOnjI7c0TyrRRbOv6X6adizw+GBPHkMm4OouTdJilI9N/I80fvLmXechj0LD0plGi860uBjagoxrpkpnA+4ZIqy1YZCcFxwuoFUzg72hIrnrUTwtuiQq3gUnKIKK57K8UQ4GiiyG3jN8u8SWGLTXR5dfpJre3VC1Ny+d2gl6AjYVexQnMdGz4iQxVbjRxH1+Zjx5Uym2JvmiMmeN+UIO6pIZ+uhw50qnUEBXLrYj4QJaqBqKWFkZFdyTSW5Sy+xRSW27NCa2tXEqDizD7HhXxkz7KRRU45kJQO9IlXAhtFidL+qACjXmCfnw3+4TlWKDPdNzL2cljWkHFC6mEgEOuA+sfM0XbVBMbRZrBDwLqqbaj38Co06E7paGG7aJEnVdGxWf8qjE7OCKyw5hwXWAesQw6CdP1S4P+v9ZrrhvP+Wv3miRAGsdOLPFXq0ii0NpsXEsn8wCvz4JGcOELmPh8ekPnOMd1s7zlSySku8lhraveqNhHBzpoNs2EGnoDQCns2zXU9MIYKoYIZMCN/Ge4OxSAkHd0vnBLb
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id
 gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:10:14 +0100
Subject: [PATCH 6/7] arm64: dts: qcom: sm8550: Mark DWC3 as dma-coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-1v-v1-6-fda0db38e29b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=756;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MgGMsg8PJAMVkpQQ8WXu4KK3GFUd7QqW2NVKRDqIWlU=;
 b=omHcjQyuLjkm+7U15GBNGZL8yj2dbtXdzfMhbPh1XOM6zq40Am+Hcqlnla6o2fLA7Ae+BdUTV
 XcSScpA7kLEBoOeZwRrM+CkmUYtkSr6XbmwfRW86Q1Xy29GfuKwNj77
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: 55TSHCH4YVETQAFQUYX35MDNKGD62LMD
X-Message-ID-Hash: 55TSHCH4YVETQAFQUYX35MDNKGD62LMD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55TSHCH4YVETQAFQUYX35MDNKGD62LMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In a fairly new development, Qualcomm somehow made the DWC3 block
cache-coherent. Annotate that.

Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 925e56317fb0..e845c8814fb9 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3207,6 +3207,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,usb2-lpm-disable;
 				snps,has-lpm-erratum;
 				tx-fifo-resize;
+				dma-coherent;
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.1


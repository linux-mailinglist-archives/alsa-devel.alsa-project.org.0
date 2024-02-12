Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99D851436
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:11:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31920827;
	Mon, 12 Feb 2024 14:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31920827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707743488;
	bh=+63/Xgcnvvl++vw0kFSv69jgv62HeXw4wvXx3EN09/E=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OL2/CAIh5ZJNdBaFqgk1RLaepRxngmqm0YyPNaEBZbXhE2WtzNRh06JBJFwfmsUbt
	 xgOftXCSv9exTBWx8z4BkIV01jTwzs3F3pQuOVrA5Cjazi5yqrDMt0IvgWgFaqBHLR
	 jsPBHUiy02yenvKxiHpePXMs2JKrsqjQ9Co34Js4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CB7DF80570; Mon, 12 Feb 2024 14:10:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 093FEF8056F;
	Mon, 12 Feb 2024 14:10:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1891BF804CC; Mon, 12 Feb 2024 14:10:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5620CF8015B
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5620CF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=s0F3nnBY
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so553778166b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743416; x=1708348216;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsrFFtFar7TX/ORI8AiadfGDjdZ6VxExU8R2VKF2tt0=;
        b=s0F3nnBYWsISoz4+OzzZWIqhr0WDxwiSzgPPA7SolXtfmlNKhXrhoLOcTALqQgZ+c2
         ynFdheYhRcaYmAnXay22HIAiI+6BAlNVnls4FinzC0IQE7F83H+UQL78SZJdcQ8lS4Rb
         AJV7L9QJy92w6Xd3wJR6cClz7cAcFUKWnHvxOdAqI6lftFMKu/UzZ3Km7xDivj38d+K/
         RSvZp7jJcUJp9BeHlS1sWNadV4NbKao1Fpu3YTbZvXSGUerLiVoRVDGrcV4SGZnGekLj
         iYpgQN6bv8JyEn0SyacR3f+YcnmA5L2OS4iMZcgQJTbMhr3GVs73ZxClieYxV0fG2+H8
         HW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743416; x=1708348216;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsrFFtFar7TX/ORI8AiadfGDjdZ6VxExU8R2VKF2tt0=;
        b=BAQR08ZM2SrVVcpib7Lbam5/xAtHCFeNwm2OP8Atnw9HXMfvBlDwMSP55FYMsWHh8r
         TL6+fFdvpAsYJiSG1Gl//CuYFHIsHZ1wYGouLpSRi9sBxCl7UGY3EEboXnjHwh/5AkHk
         Rx/MFeFR9aEkJBWZwkdXpNIQ7U+xk6tFLW2wat7uQU6X8Gr5uONb/WoKz/hYfWU489mC
         dV4a8oizgHkLrxAmWJtS6k+pa8p/uug6yy7OrfqS0w9/ZvuwYp69yqZxS4mXlX8rV1fE
         ZjtFOViwVUY7EJpV86I2JMCgzyGPCWyrGOHVmtjQMG89dcEgkEV3g1FaaMZdzw9f1lCh
         Azyg==
X-Gm-Message-State: AOJu0YzOn+JGvMIRaQqoMCQcyCYKCDvY6s0hs85S+Ol6uGZ5z8KxhEjI
	mzvznV2fTLBKr3CN4YgDxNeSsUZXGoySi/mwAekUXGUkIeQBRxax/SFbMdDKvVE=
X-Google-Smtp-Source: 
 AGHT+IGKQcbm/gLY8lNaBXnZ8bB41KLkoXe2u6YPlJKH4J4XNBLaZGYA1IMY4H/1Je6cum9j4HdrKw==
X-Received: by 2002:a17:907:7630:b0:a3c:d535:39b4 with SMTP id
 jy16-20020a170907763000b00a3cd53539b4mr732454ejc.9.1707743416229;
        Mon, 12 Feb 2024 05:10:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUXtlT2GK2hRcxDFaqLSEtNzsZew685DrIL22y3sX+/RTcf+JI+CNzNXA4MIXhBGQkVmhkZ8xie983qK3t5/DQVwP5jSRfo+grt8qUVWoNG7TARAtc40DsNPCNn3F1ZpKGmsWtljMslQcH+fZExpwMdTsUd4OUWjs19NZSkpDpvDyp+g/XTSOjbIoCvdCQNbpyO8HSyeCI453DLUNpDsWKoVLZYba73m+8tAyieSo2WmBA3I3m/ZXpmOBxByRFZ7KK8GlWEPaZUA8GcRceQgP8STyP77sHHG7Yn51geCFQGj6HmvPVuoPKBPpNojRNfAtSpdZRde1Qxa0sr86vbkJ9a6WGb0AFngzJ/rZQgzOUCzWuet+leYZz2ctLwaClJGbyqnpkGkOYugYGFNYT+rPQ4JT9SfP5m1BENaBaI41BYyu4bRMQG15iPwMAyHwrfNKHDck8lw9bSW3vmGxFQzv01fdYpPABWqNL3DL9alskhwQ2gCXDoeyZGhydxxlAJwCJz+S6SpH/wm+NdHEXAonp6BfbV1ZiMQWHte51UkTKAnmaIiXUz9HcpM44yV91nDjVWmMAQP93Ft1FR5dPIvsAsHE3dK2ffJc1AdtCxGHWv8WQWv9n0XRpVf69WZhl5GJ1gJ9SyzIPhc3H1Y7aHd2Nu8hvGyvHLm7g1dHgKrUvhfDSh+jALsFRS2jSsGmGE8koyh1Lz5s3KEqc/NGW8np8iITcGd5r1Ook7uDpyro+CQRh0d8KyFnfKCWKApLRof45G6gbKuU/XbfV48Awihs62JBwtOwjeW76cwLbFJmq9wO2Me417dgRSxomPOd12eSjhNHy+nDY7/hSPnareqyLvfDwJ
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id
 gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/7] Xperia 1 V support
Date: Mon, 12 Feb 2024 14:10:08 +0100
Message-Id: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAYymUC/x2MSwqAMAwFryJZG2iL/6uIi1qjBqRKqyIU725wO
 Y95kyBSYIrQZQkC3Rx59wI6z8Ct1i+EPAmDUaZQRis894Md6ht1Q23V1pNRZQWijzYSjsF6t8r
 BX9sm4xFo5ufv98P7fprnii5vAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=1101;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+63/Xgcnvvl++vw0kFSv69jgv62HeXw4wvXx3EN09/E=;
 b=6YV2ckgdeayZEZbm5EwxHt13hD4TlThi32QfPyjikJXM4FpoWrBqYyXFMJjgA6J2yL1nJmbXU
 IFYcrqy+DKiDHpnmQkzMx7gpsT1kjrSsW7cc/ESlI/vW8tJtCgvXG8Y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: QX3IO5BQLIN2BRB42NKFRQ2G74L563PS
X-Message-ID-Hash: QX3IO5BQLIN2BRB42NKFRQ2G74L563PS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QX3IO5BQLIN2BRB42NKFRQ2G74L563PS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DTS for the phone and some fly-by fixes

Patch 1 for Mark/sound
Rest for qcom

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (7):
      dt-bindings: ASoC: cs35l45: Add interrupts
      dt-bindings: arm: qcom: Add Xperia 1 V
      arm64: dts: qcom: sm8550: Mark QUPs and GPI dma-coherent
      arm64: dts: qcom: sm8550: Mark APPS SMMU as dma-coherent
      arm64: dts: qcom: sm8550: Add missing DWC3 quirks
      arm64: dts: qcom: sm8550: Mark DWC3 as dma-coherent
      arm64: dts: qcom: Add SM8550 Xperia 1 V

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    | 779 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  20 +-
 5 files changed, 801 insertions(+), 3 deletions(-)
---
base-commit: ae00c445390b349e070a64dc62f08aa878db7248
change-id: 20240210-topic-1v-18e9697d2056

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


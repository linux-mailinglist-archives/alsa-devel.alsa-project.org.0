Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A259F99515A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2AB827;
	Tue,  8 Oct 2024 16:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2AB827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397285;
	bh=qDf4Q21OUR0O2CrvOwqoQ6MiuMMP4c/itFO4cayaOKs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fJXllZ75QdAKlvh/lj3xfrdFKo5VTKpwxJZ5ZfC9LgRwHE/o6cd0yHL6lrlOSdYnd
	 Z045r0L4tjTlwp1s62VMx6mDTB8QEjqK/Wf5fuAtrQZLps7Pj66ShVWZXmGc1tiYgP
	 bvxYw73C9TE2+bOf7vdUasQwuVXuyJYZ4eKV8HuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2727BF805DF; Tue,  8 Oct 2024 16:20:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A03F805C4;
	Tue,  8 Oct 2024 16:20:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D9F4F80517; Wed,  2 Oct 2024 04:20:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3882BF8001E
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3882BF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=F2wLVRzS
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42cae4eb026so59652105e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 19:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835619; x=1728440419;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJP6FxuMyrGQPzIx4I24nor0DhnXqA79XYYTGXwNkXg=;
        b=F2wLVRzSpcIpVjcdm4MR281vx/xb7HhabLLS3t4OMRhdIL7xQbfFuiYdua98WzhHgI
         9a5m6gwGTT1G4Q6joRFs+/8MX9bdWyXajinSBAHetyo/gb2pokAU2aGkbv36NUPCWr0q
         afImATib3GmFEqBWr8aWqcxPzB+AEXRJIH1m2LOJfX1uIM/ruRhD+gOEXFrS1/FokOJz
         6ht6wzpAdt+7MOywN/SW+Ply9TbDl8w8T4kvjb6DKzjs++B4kDyiX4AZf4WYNE9u2P0X
         TZEA11Tp9Jr95EyHvzlxq4V8u92kyJ9lW1SBuG/zVvbnHCPcsMNTgBotzr/vvM2zlFk1
         d7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835619; x=1728440419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJP6FxuMyrGQPzIx4I24nor0DhnXqA79XYYTGXwNkXg=;
        b=gQ9abrjsTXUP57w4n0NCC7v4vs5xoShfsMSiZEO6L4ocq2G8POK3YdU+j3pW7nZ6q/
         bm8Afa4IHJ04lwVK/nM3z5hNKDtK5TX0CUqJSokddzcMxw7nKv+AUwMlPcW2zPlSceA/
         T6SXw4IfzAq7oNwKeVWEnaSMwJy5l5XP472+hO9pE+6rtPlaggJQQAom6suS0pDNrPMQ
         3K+QTZ5sxSpAXafSupVZ9ToccVN6m3tQRuEM2XogZK/TEcMPwnBG6SuICJLTVtbXSKTv
         u4f0CXDkM9ArWL+0zS4R0BMRBI7/yxFf0LDgyZ2zQMRentOnIYAB2KkS4GnqEFdtdP3A
         ZWIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrmgCICiTvKx9mwQIdF9mnCcpssLwF5JhVIkYGF/c6nEUmSPy22q3TE5W578ckVkpgUq+gpUdGZL7x@alsa-project.org
X-Gm-Message-State: AOJu0YzrBb0tAhytYm+7hq/HIDdpC8pSHgghGgfBYZ/RABqeIxcOSG7s
	Mgu/CDiAccmxAnZFeZm5txb8z6eefmrDL0xCMPrDpu9ix7uD5anlSZN8ntJlJ18=
X-Google-Smtp-Source: 
 AGHT+IFs22+u0l81gOgbkwdFzWLkYNo/t5JE/s/V9n01odUb3GkqtgMLO52O3EfAFsS1MGoPOvkYtA==
X-Received: by 2002:adf:a388:0:b0:37c:cee1:acb5 with SMTP id
 ffacd0b85a97d-37cfb8b18aemr868706f8f.7.1727835618798;
        Tue, 01 Oct 2024 19:20:18 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:17 -0700 (PDT)
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
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 0/7] qrb4210-rb2: add HDMI audio playback support
Date: Wed,  2 Oct 2024 03:20:08 +0100
Message-ID: <20241002022015.867031-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R6BFPPLS2RTPNNVW7KNT6M5KDQXB5U7B
X-Message-ID-Hash: R6BFPPLS2RTPNNVW7KNT6M5KDQXB5U7B
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6BFPPLS2RTPNNVW7KNT6M5KDQXB5U7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rebased on top of -master, tested.

Changes since v1:
-- removed handling of MI2S clock in sm2450_snd_shutdown(): setting clock rate
   and disabling it causes audio delay on playback start;
-- removed empty sound { } node from sm6115.dtsi as suggested by Krzysztof;
-- moved lpi_i2s2_active pins description to qrb423310 board-specific file
   as suggested by Dmitry Baryshkov;
-- moved q6asmdai DAIs to apr soc node as suggested by Konrad Dybcio;
-- lpass_tlmm is not disabled;
-- lpass_tlmm node moved to sm4250.dtsi;
-- kept MultiMedia DAIs as is, without them the sound card driver doesn't initialise;
-- added some reviewed-by tags.

This series still keeps "qcom,qrb4210-rb2-sndcard" for sm8250 soundcard. As per
off the list discussion with Srini it was suggested to have it since in future it
may be required to add clocks, workarounds, quirks, model-specific things based on
this compatible. The same as for RB5 compatible in sm8250 snd driver.

This focuses on HDMI audio playback only hence there are no soundwire and dmic pins,
for instance. The work to enable playback via wcd+wsa8815 amplifier is in progress (it works)
and one of the routes is to merge such two patchsets together.

Link to prev series:
https://lore.kernel.org/linux-sound/20240628010715.438471-1-alexey.klimov@linaro.org/

Alexey Klimov (7):
  ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
  ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
  ASoC: qcom: sm8250: add handling of secondary MI2S clock
  arm64: dts: qcom: sm6115: add apr and its services
  arm64: dts: qcom: sm4250: add LPASS LPI pin controller
  arm64: dts: qcom: qrb4210-rb2: add description of lpi_i2s2 pins
  arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

 .../bindings/sound/qcom,sm8250.yaml           |  1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 91 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi          | 16 ++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 72 +++++++++++++++
 sound/soc/qcom/sm8250.c                       |  9 ++
 5 files changed, 189 insertions(+)

-- 
2.45.2


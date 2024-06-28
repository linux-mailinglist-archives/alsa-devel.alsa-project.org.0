Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02491DF6E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 132B32C09;
	Mon,  1 Jul 2024 14:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 132B32C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837379;
	bh=oAIm3tFaJTjlkq3iPYQLO+vtIzmnKuyPQUXtqzc6Sk8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZY7PWP4sCbaX//kIWjz0qozMRZ5RmWDq9dQ1fHlBHJ77wK4EmCNw30hRHimxMh6kD
	 nhRMx3JPMQoEDWkP0aq42eejNEn0MR+S2K9LwTYzRO9YKFQ+q+Mxxjroanxj2pKkw8
	 9LxHALiEXaxagIR8xNPj4Fm+AEIHjL1jIxZ8n8AU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE3DBF80746; Mon,  1 Jul 2024 14:23:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1167F89AAC;
	Mon,  1 Jul 2024 14:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD1B0F80578; Fri, 28 Jun 2024 03:07:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A7D9F8013D
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 03:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A7D9F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=D/NUGSnQ
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42561c16ffeso506945e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536837; x=1720141637;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFzRsf2vVQv0yHSYGNvzC0nZ1m6MD+db413EmZMCcX8=;
        b=D/NUGSnQg1BDhuKiNOQViq4tZx4dsWOIiTA+Y61jOntkQb+/2g4pKfTXYcAG+3jd9q
         iLl6vbxSbU0YpDRrBqNbwqtO9Nbk9q07/2I/pOTMmMGDE9OZS1AraZXM7J+iCat7OD8j
         8Pwqsv1zssDuWyL47ig7DSwYfbW5Hq42HTkJC9wUHVn4V9u7W+5rk/BLcQlK4vgH/Q45
         brFp2css5P+wXkEqKYnj3MDKjvqjxCGKI1LEQltCuCDvyAqAJMhHMnE9a7U7R2D23bgv
         5SIDu1pAA86qrgssLm+cl5+0IY+ibVxRcIsObJiQrRbC6CU/C/EXzTiJV94+ey8PPvgY
         4y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536837; x=1720141637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFzRsf2vVQv0yHSYGNvzC0nZ1m6MD+db413EmZMCcX8=;
        b=OR5cDZxBdgnpXgusMjC+4cElVJlyB2TGh7ced9taNZyR/HcPRuw7SROjSa+Q34G25B
         TYmjJZ7tXASyY1rR9ECfzmtmUXS6XO2ocE6slxOooyGEKKN+X8Yzgf2dDfN4xgdwO52+
         Zy3Df+L4Of0hDvbA1RFlo0Ye08Q7jwhG0Wsz4zOI6hDDdCaPEBCoR4ch0ybL4Pbqz1I9
         itAuxgcH8PSKds/YAZqdTl14B7Ikojo+AUOhlwqk/707Vw1pjqgngLbSucs+TTynFXWs
         ZBCHOiYiB/MVUGE44QODeT6LYd/j7+d1LdlkGTZAzZ0roYz49Q9Yjste/6yG5vVBOMtf
         ef9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRNqbTPkxDMjaBFVef8JLj0+PYrHiBgD0sONdv6C9z1yWfBJDSIRafck5vaMlITwYHTv0as0ScnPoatL9mUq6G+AeOvvaz7HPGG7w=
X-Gm-Message-State: AOJu0YwphonwCiAhmAbfMiSqoPdhaw+9ZqYPCZ/g0CgcD4Kj8P+tENfh
	4jgd86wLy3xf4Bbi24TcvMlsoFl+CKHTOR+npaign3vSRIm3ENM2KiHParlhpEg=
X-Google-Smtp-Source: 
 AGHT+IFQe1Lw9FGACcaDyps6RFYSkDsIklGWtLIOJwNRju+t5I4TqawhUBd4nyhFMIFeZxAwV8S8/g==
X-Received: by 2002:a05:600c:3399:b0:424:a5e3:8022 with SMTP id
 5b1f17b1804b1-424a5e38107mr59654025e9.34.1719536837074;
        Thu, 27 Jun 2024 18:07:17 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:16 -0700 (PDT)
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
Subject: [PATCH 0/7] qrb4210-rb2: add HDMI audio playback support
Date: Fri, 28 Jun 2024 02:07:08 +0100
Message-ID: <20240628010715.438471-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7ZO2KSWU7TKAQCFGFMXE5BHJ4J5NPJ3W
X-Message-ID-Hash: 7ZO2KSWU7TKAQCFGFMXE5BHJ4J5NPJ3W
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZO2KSWU7TKAQCFGFMXE5BHJ4J5NPJ3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

First time I am doing anything like this. This series adds
mising pieces here and there to allow addition of sensible
sound card in qrb4210-rb2.dts and enable HDMI audio playback there.

It is planned in future to add support for other outputs and capture --
analog audio support.

The series depends on Srini's sm4250 lpi pinctrl driver:
c2e5a25e8d88 (pinctrl: qcom: Introduce SM4250 LPI pinctrl driver, 2024-06-22)
2ffa7a354662 (dt-bindings: pinctrl: qcom: Add SM4250 pinctrl, 2024-06-22)
As far as I understood it was already accepted and will go through pinctrl tree.

Alexey Klimov (7):
  ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
  ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
  ASoC: qcom: sm8250: add handling of secondary MI2S clock
  arm64: dts: qcom: sm6115: add apr, its services and simple sound node
  arm64: dts: qcom: sm6115: add LPASS LPI pin controller
  arm64: dts: qcom: sm6115: add description of lpi_i2s2 pins
  arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      |  73 ++++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 112 ++++++++++++++++++
 sound/soc/qcom/sm8250.c                       |  19 +++
 4 files changed, 205 insertions(+)

-- 
2.45.2


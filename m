Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BBC944B00
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982923DAD;
	Thu,  1 Aug 2024 14:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982923DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514171;
	bh=UphWNVZYlMYttOLUSGt7chhQN6dwPnt9BAjSq7UQ/tw=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nkCDVHS2TV71XBtgO99+OByEYeVBOfQXVt94v8LjAs/jgVErFwj7w0pxz3f57qhFX
	 lo+BSnlwFcDZRwuMDFVr3dD7pDEnBOSHP0+eSG/k5JuP+GbHRz9gFeI3ieaXyCI6MJ
	 +IjQsV+VMi4kPWwQ6cOQgddacRbu4GSRxsn4KQyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2044F805A8; Thu,  1 Aug 2024 14:09:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF87F805AF;
	Thu,  1 Aug 2024 14:09:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC96BF80589; Wed, 31 Jul 2024 17:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D95ADF800C9
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 17:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D95ADF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Zo9YXxdi
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42803bbf842so49366355e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439562; x=1723044362;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RQ2igsSgu9UFJsBcOr+mrcxTGh+1fHmdEJppZglmtA=;
        b=Zo9YXxdims79DQZXIDHZTBV+g79gF5upcLnWjSYnEy80Wv71g1ql0967YiiWQmcxcJ
         1e9NJ4QsdA7gtuTqWUjZs9C205ObOGof5ruP67gRJbx058ph5PWY2ZKRDr9/A9nTmBov
         1TlDyTYptlVFdtEcOxaFDgPESgUp3fIYtp0ss/xvMmytg3+4pPMRiU5C0nVk/hV5YSYT
         8lO0mJVOC5HvXJlfTwY3hgeTWu1YE9gs3Y7wwXdTvJV2LeBrFDYQfTY73p1Ric2PbKYp
         JB8/yFGm7zVRoDOv00kerLalFr12rorMl3c1sN7CTE3D9Ua44RiG/LBbfxBKa9Pns3Eq
         XeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439562; x=1723044362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RQ2igsSgu9UFJsBcOr+mrcxTGh+1fHmdEJppZglmtA=;
        b=adQScBswqovJtwbGSZ7I8aRH3SkS78cso0sGEAzbKeu29YjFQG5bkMuXbia7Oc2BtS
         8wvNEnHSKcr/HLftRCE2/itq/mYUIDxP4nVXok1f0+VnjsBIHzBrYX993A6pnB+A3QAl
         GVIFe0VEwf3YLLfXHNrkLnGjUYunHtgyyPwEoknj4dC50CQnKlbT+21xSl1UUIHQLEok
         S/bjd1uwMqpFE/XC9Bfl8a9UqksROt6frhpWp6xe6DwRxVLmzBq1wavj0Pj0Iu1bLOKJ
         GV1P4K6cm81bRTQHqmRdNfVGCKYxOvg56mP4Inh6fBRS5bfu3vMvfJxj11Rn/pO0vdup
         TiNg==
X-Gm-Message-State: AOJu0YzjQMdTneHB79605ZcDMDnxK+GQ86sVco1kamuUCMs09kZ03UTs
	vRAG0sV45k1lAdv/iiSPaqs/7tvDC6EjobS/zCylxucLJuTDfAsu
X-Google-Smtp-Source: 
 AGHT+IH8SmEzgsU5TS8q5NHJu0t7KaDmruJEjzuMDt40zq8SuzZBjHxDJtmKvuaYlFSFEyogD0rI2w==
X-Received: by 2002:a05:600c:a08:b0:426:62c5:4731 with SMTP id
 5b1f17b1804b1-42811dd43c9mr126256445e9.29.1722439561517;
        Wed, 31 Jul 2024 08:26:01 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:01 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Subject: [PATCH v3 0/8] MSM8953/MSM8976 ASoC support
Date: Wed, 31 Jul 2024 17:25:24 +0200
Message-Id: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRXqmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNL3dziXAtLU2MIbW6mm1icn6xrZppmaW6caGhsaGaqBNRaUJSallk
 BNjY6FsIvSi0sBZpeAhWsrQUA3RJ1fXsAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.0
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RX5VTSV5KOOUMMYC3TQZ3P2ZCZBRZ47R
X-Message-ID-Hash: RX5VTSV5KOOUMMYC3TQZ3P2ZCZBRZ47R
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:06:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RX5VTSV5KOOUMMYC3TQZ3P2ZCZBRZ47R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce support for basic sound card setup on MSM8953/MSM8976
platforms, document new compatibles and introduce support for more dais.
Most of code is sourced from msm8953-mainline fork over github
with some changes implemented by me,some basic changes are 
mentioned in each patch.

Changes since v2
===============
1. Guarded ioremap on quinary mux with checking if resource is not NULL
2. Introduced compatible based reg overriding in wcd-analog driver
3. Separated PM8950/PM8953 codec patches
4. Moved reg/reg-names back into top-level and rewrote as in comments
5. Separated MSM8953/MSM8976 QDSP6 patches
6. Added Lineout patch

[1] - https://lore.kernel.org/lkml/20240723083300.35605-1-krzysztof.kozlowski@linaro.org/T/

Changes since v1
================
1. Rebased dt-bindings documentation based on Krzysztof's split patch[1]
2. Resolved clang errors by guarding ret verification inside if
3. Switched quin-iomux to devm_ioremap_resource to not fail on msm8916

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
Adam Skladowski (4):
      ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
      ASoC: msm8916-wcd-analog: add pm8950 codec
      ASoC: dt-bindings: apq8016-sbc: Add msm8953/msm8976-qdsp6-sndcard
      ASoC: qcom: apq8016_sbc: Add support for msm8976 SoC

Vladimir Lypak (4):
      ASoC: qcom: apq8016_sbc.c: Add Quinary support
      ASoC: msm8916-wcd-analog: add pm8953 codec
      ASoC: qcom: apq8016_sbc: Add support for msm8953 SoC
      ASoC: msm8916-wcd-analog: add lineout output

 .../bindings/sound/qcom,apq8016-sbc-sndcard.yaml   |  27 ++++
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        |   6 +-
 sound/soc/codecs/msm8916-wcd-analog.c              | 145 ++++++++++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                       |  88 ++++++++++++-
 4 files changed, 257 insertions(+), 9 deletions(-)
---
base-commit: 31c2a5c4bf3673b0bf098f358ea931b9ada1e7de
change-id: 20240729-msm8953-msm8976-asoc-65f973a13165

Best regards,
-- 
Adam Skladowski <a39.skl@gmail.com>


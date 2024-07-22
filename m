Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC931938F9C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE4814E9;
	Mon, 22 Jul 2024 15:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE4814E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653428;
	bh=0LjKiXktDHZSweMPPr1G1Ui1nNR6eQAesBAToZ8LpPw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M4hf38pDPUWdMt+fKP5DsxLLcPmcCerOuIlugcc4pvu1FcTvjjMLeT89NwxOZCQYG
	 xuHhKa53d44xPa4jEmyddPqTPE7MSgb5fItR15c+toERWzFGVZejv8NHXgwaY+rTTP
	 qWRyNVCWjsZjq6CkAP+jHNXhe3+UwYQQmT/ctFd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 077E3F80760; Mon, 22 Jul 2024 15:01:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7DD9F80753;
	Mon, 22 Jul 2024 15:01:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79B85F80482; Mon, 22 Jul 2024 11:52:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C78C3F800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 11:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C78C3F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IhY82waw
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso1824566e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jul 2024 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641933; x=1722246733;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9E2WTC0jfBaQQGfChBxNUT7+lSWee29QeSeHVUI7bU=;
        b=IhY82waw4gTRyCmXmX7as4wX+d7moO4989FSTq+cu7oR6yWbg8UNyttMIrziyrpsQ+
         raquqxL2WfPcuMJbFwjk+JMTEudMVvyo61UAYEMIq9DOYazhgvjTEpPwJVgQSGy5h3H0
         18yZOPlsRzMZs4aC6z5YiaFJJeQq5c4ywbjXYGdV3f6i5nzVxuXc0yKBjjO5YU/GHMqv
         6c0pXiKqGW/AdsyJh6xF2F8Ocs614IEvc78KGgw1xh4oxsODDRDGwJsdMHqZXsJsoua3
         HTE5PqZz9RtzhU4L12xYqhlak/7K2NieYM3Kbp2lF4ju8Inl30RvYMCky1QP6B4HPrA3
         Ja2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641933; x=1722246733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9E2WTC0jfBaQQGfChBxNUT7+lSWee29QeSeHVUI7bU=;
        b=P0WevRj94B1PTaB71sIBRxZsqYVh0rgyVuS9c+5vEbk3Qt3nxCQ0/wxQ+CTazGC3Ia
         eu+9SYIhKwdskukMWJTeqOqbAv8jYydPtAkNIgFI+TIwNvgIvgSpmkrphwz3eXtQF0Wh
         4+gAmHRT4mhlc0wu31i5iWAt+ziPzgujGNRscJgbTvcDTrdmdfB9WDJ920FA4PzZtcPK
         GwIlN85XDmSkxUlNlEqkj4/SQTqgmGt5QDlZ5HItSzfyjnBt0hb7FNn9FZzOOCyv75Yw
         IakrdJ6jr0gIYj7po2+oVke0X150bJEssxHJIqEPEF13QNtmLa1JLQwrC/fMIXTfvave
         60TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj5dU4t29iNnEgihAM9t9au86d1q/HlNoXm1iTYJNXlEUGnHgN2zpuasfIZcZvGl28qxczQAXHs2QqQAHNfhubeuY5jYZeEodI4SY=
X-Gm-Message-State: AOJu0Yxke33rFJ4ScFeXuBV6beGbK4yMwOrMo1z0UVEWWCV0vRCh0h7B
	/lEKI3IaWq+9rTST2JxE75497JfZIIVd8S6+SwMmSwh66sl+hNWN
X-Google-Smtp-Source: 
 AGHT+IHUrVK9nAGRcepdpcmmyoaKs3owYskKR6lrL0H9J1qjEWYRZA/UQF9/9MY/4zXr/4CmzISjbA==
X-Received: by 2002:ac2:4e15:0:b0:52c:a016:5405 with SMTP id
 2adb3069b0e04-52ef8d859f8mr4808575e87.8.1721641932543;
        Mon, 22 Jul 2024 02:52:12 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl.
 [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:11 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] MSM8953/MSM8976 ASoC support
Date: Mon, 22 Jul 2024 11:51:04 +0200
Message-ID: <20240722095147.3372-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZVB23CT4EX7HPWULVMTZVE2J2N6BGUEF
X-Message-ID-Hash: ZVB23CT4EX7HPWULVMTZVE2J2N6BGUEF
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVB23CT4EX7HPWULVMTZVE2J2N6BGUEF/>
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

Adam Skladowski (1):
  ASoC: dt-bindings: qcom,sm8250: Add msm8953/msm8976-qdsp6-sndcard

Vladimir Lypak (3):
  ASoC: qcom: apq8016_sbc.c: Add Quinary support
  ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
  ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC

 .../bindings/sound/qcom,sm8250.yaml           | 28 ++++++-
 sound/soc/codecs/msm8916-wcd-analog.c         | 63 +++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                  | 82 ++++++++++++++++++-
 3 files changed, 164 insertions(+), 9 deletions(-)

-- 
2.45.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D69339F1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2FC47F4;
	Wed, 17 Jul 2024 11:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2FC47F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208854;
	bh=Zi1bu+0mhBf3Hk6tKFUnpbpzDHk75+uCDG1w0Ixbnr4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YWZ6J/MCkA63VRsdSPFmC3q1cwd0ZRGuq/j+e1fDpCSkmLFwJyohxAZ5Abr/+rBha
	 vlmnUqWKeSZvGGnopeuG9YIbsba+FTwcMpJJah5Ujoi/TmoUHVyYT3k1yEZSjJCh8p
	 rLz4/4qzQVjsu6d6hDps4dfIRhkgAhlcYlxaUa40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C96BF805B2; Wed, 17 Jul 2024 11:33:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33F4FF805AB;
	Wed, 17 Jul 2024 11:33:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD90EF801F5; Wed, 10 Jul 2024 13:39:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2843DF800FA
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 13:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2843DF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a6wiHd0+
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso13760885e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720611579; x=1721216379;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MHKc6WWhLmwAuWzJd0ksrdeT5LunJAc73Qa62Pmp84o=;
        b=a6wiHd0+s0X6Qyi6s/JF+H8rMIGstn2G3opPjz7eFL7oYcEoVPmF1PyIo8JOv1CMNq
         VbqAFTIaq5gPYPP+r5SCuW2iBrppYT/ZzMP262WQNxHGe9e8ZblKkQcET1KsEn+diFbW
         X59eRv223H1u7XHA9tQPvo+NGpJr0RUSbG13MqvdKaIdRafN2cdK7O1Nok3418aQgQhZ
         7VZW3tBt5IdYpx76qY828mJ5IJgTHN46b8og4amVyI+2MbW4aEdYmuZC+kZvp2yI3SGD
         OP1ky9gU9qb1MjFxBEtQz2W5D2ZQmvnuoRgtVxpaNSc+RZBsCwpVRLvCIJiOgrIl35c/
         12SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611579; x=1721216379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHKc6WWhLmwAuWzJd0ksrdeT5LunJAc73Qa62Pmp84o=;
        b=OPd/pH+GddUa2R6DISMvdNEUK2hDMFIusbQESnCR9X9BMfCfLGLdBNhHQtoLxBFFHR
         C8v44fu2TLh/8GzCIvhdA5TD0NowisBIIiZnR3abww3m4e7D5qG3TFDLbfh8HpQ1xyem
         y7L5DASyUZS5Xy9YJfnx/Wp9WW81d7rsToYD6tYoQ8+95GBT65MS+lfPXtodmN03fYsW
         E2AeqJVXVZunar80GiwYAlIAooltOePZLfuyXujJpb2OIhN/Ro5Nlc0JlX3WYFpqUO2j
         rAs0ggFFs/wgn34qgpWJiz45hUeEy8OAU1y5zstEj0HVKxoSEl0w8gcjqkKbYC0GaRQE
         If1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn9OwQw1JASzzqZQ70rmfnPVsidlSoIJre3ybOzxdRzFltgyzTWQ3ZPeyyUsGR/avYmzAeiF4zdPe/EfnBH0XvPQ7AonJWUZPmR9o=
X-Gm-Message-State: AOJu0YwFn5+5qBoAq6wXT6OEZMBJrIIbj0G8MGM751u4g+/XRr2/7HN+
	j9plFyRq+n+QUWGsPMYU3LdGcyWuVJsngKbQUB/1FPjRcxgKJyKT0+rVNcKBA2s=
X-Google-Smtp-Source: 
 AGHT+IFHYPwe6yZ9R+JtpGuu8hlP3VMdv3GZsmSGlWY6ENZv3HqEopDNWzX5jjb+nxuJh9OPTx/xuw==
X-Received: by 2002:a05:600c:22d3:b0:426:5f09:cf57 with SMTP id
 5b1f17b1804b1-426707e3445mr33231125e9.19.1720611579201;
        Wed, 10 Jul 2024 04:39:39 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f7361b5sm78602875e9.29.2024.07.10.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:39:38 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/2] ASoC: dt-bindings: convert qcom sound bindings to yaml
Date: Wed, 10 Jul 2024 12:36:05 +0100
Message-ID: <20240710113833.39859-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: rayyan.ansari@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D4A7A7APUVVPL4LMOBV7PXOEZM2RDU5U
X-Message-ID-Hash: D4A7A7APUVVPL4LMOBV7PXOEZM2RDU5U
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:33:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4A7A7APUVVPL4LMOBV7PXOEZM2RDU5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,
These patches convert the remaining plain text bindings for Qualcomm
sound drivers to dt schema, so device trees can be validated against
them.

v1: https://lore.kernel.org/all/20240709152808.155405-1-rayyan.ansari@linaro.org/

Thanks,
Rayyan

Rayyan Ansari (2):
  ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
  ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema

 .../bindings/sound/qcom,apq8096.txt           | 128 ------------------
 .../sound/qcom,msm8916-wcd-digital-codec.yaml |  55 ++++++++
 .../sound/qcom,msm8916-wcd-digital.txt        |  20 ---
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 4 files changed, 56 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8096.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt

-- 
2.45.2


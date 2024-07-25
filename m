Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C674793C0B9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 13:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0CE4E80;
	Thu, 25 Jul 2024 13:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0CE4E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721906722;
	bh=NSh/MxvAORTdf3D+7kwYTnS9ComIoDJYQPbBNWGeExE=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rmGsUzOH21aRYgXigYq3Ke0OUtS5WxtxrTrm0J+6Sp0hT+cRs+uIiYOQdwG0yvFNZ
	 FSDN8cho5z5jUHF9dVCmP+IhTMvumaET2jrKfiSsW+s3hTKSYRWmYsj/CMp/rfdMvT
	 Pmb9TBR94uhVVJ8m8CXo7SOAQ7E6f/+aNkRhXi7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 149E7F805AD; Thu, 25 Jul 2024 13:24:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE67F805B2;
	Thu, 25 Jul 2024 13:24:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E97FCF80580; Thu, 25 Jul 2024 13:24:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8264DF800C9
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8264DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=L/uaILY/
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-369cb9f086aso500100f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906635; x=1722511435;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyGKLde31br6MPKxdeQh6JIrl8xN/p2NTzkYMLO5nKw=;
        b=L/uaILY/QDvSa7KCFybJnSpVdmE+KOCvjAltTZOIqFU/yGY5fo+bcvUuack3KFM4SD
         PQIRdL6ytUtbHrGBmxm/vm5C+80pdHPwXY1hfipYOHEQbHC/ZTcMOZZGU7/FdEqcjUaO
         RxefmAIEzhYM2IS2mZLeKo44yUNyWgthhLOYK17ddFubXZmnMO3CjQw/eSCRBZpuwEbG
         Bey7xJp6B4kObA79dIqJEnW4lBviTFwsGO5/Roi/dXc1bbN0vJpJkq3IrBSc3NOi8gb8
         nxKAkfezOT1mS1iLBjA2GEL8vv1Vr0AE/dnj6YizTWew+hXOVQ32lHNM+SfoV3wI9bKl
         Nksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906635; x=1722511435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyGKLde31br6MPKxdeQh6JIrl8xN/p2NTzkYMLO5nKw=;
        b=sAz2m9ptAFeHKEmSkNHAg9CCiSZTiFAoiqHnmyr0defcCk+uvck8yOXOapulIW5E7w
         d74UxbQx0sdrxbBE2OWydEqtMSZWh49tp7T61thp59+gBgU4EqXlPnez6lUuqMT5b+Sx
         eZW8T33xYvpTg2lKXwSqxRKJAJn0q1Sm0mgVPoKdFoiyLmLyswWM5AGVXxi8pyhz8qwY
         DvWH+O4lpnjTYksOW7CohbvdXlvrDFjsV/tt5iPAyQkAWkG+sLGYDGGQlmGzlEMXPdC1
         DbqFPuVSpxGSr5KxKsokJsGyJd1WaH1ObSHcWOkTMzW0yCkOMkDmpIAYBcR3EzFb+XKL
         plIA==
X-Gm-Message-State: AOJu0YxmDsExamFntEXGl0LKsF0AcfI03QMAEyAmWHrPOLWZU+t16a0Q
	diXCC3Iqahb6swiSwrfJwTdPpIo9be7IL4Lq+2FjHOdgiavYct36F/AGiYoD3ZU=
X-Google-Smtp-Source: 
 AGHT+IH0c7gMfrQLIwTABjNUwrYJ9IQQat1tC7lPc3ehLehAhoiKKOhHkiCuOIvK05iQiXh9M03jCw==
X-Received: by 2002:a5d:630b:0:b0:369:e72c:876c with SMTP id
 ffacd0b85a97d-36b31b4cc7cmr1798999f8f.45.1721906634807;
        Thu, 25 Jul 2024 04:23:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:23:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] ASoC: codecs: wsa88xx and wcd93xx: Soundwire port
 non-functional cleanup
Date: Thu, 25 Jul 2024 13:23:42 +0200
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL41omYC/x3MQQ6CQAxA0auQrm2CE5HiVYyLplTohiGt0TGEu
 zNh+Rb/bxDqpgGPZgPXr4XlpeJ6aUBmXiZFG6shtenW9qlDjiz4CyYqBdfsH2R3/gdKRzLcZSQ
 ihZqvrm8r5/r52vcDOQVfOWoAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NSh/MxvAORTdf3D+7kwYTnS9ComIoDJYQPbBNWGeExE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXA0ogIB0dmQNF6xpdWxrV44thmzvsZr5Xnv
 598mvqufVeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1wAAKCRDBN2bmhouD
 17AQD/0ayevlV3V1cUR5xC1FkgYqZvKtgx2cr9+wRs8B2RMSi7PoGJWnzBQfHRKk/RwbLRYdVBl
 JgD4WxZugWPCIJYAmcwg/VShivK3yjjaL7sPVtRAGPNjWRmeOLXQekT7LYIJ/LacHWX/XJZLsoR
 sMDj/iXpBsPdghG70BZj5Ev7g2htpIiP73TAl1BQX6Nq3ENKSt9+sQ6ODc0nZ+femMab5j9AZyJ
 kBwRwRPWJCST+bYRAXh6TN0Jtd7awyY8zbxstCY91dmTzsgNw0u5NqMeo20yTM3US1fY4FCh0RO
 Sg6V+3xaUCzFw8BnuxP6jDS3UToSHTbVmzsT4l3UdaG47oVHXTANN0u/3oBaQRMSN9l4A1+3ISQ
 VL5nULVEVlwW7qwjdLQPzUrobPZM1tfck2UAuIyffiRONTI/HKDxLD88iDGpQ8pWPjH4jYdo9nY
 4gBtfZG8thqPRsa0YNTL65ux2QFlTKyU54l0KFit4Ess1YZL+OjTTlDtVCliiqzSLqFmeR+CySf
 UpKw+MlWtriu8sEhX0ZgvUvw6vwPdgLlzWFuVYEFzdtMAKnEfIOLPzc+pQA5RYkhT7zClux3x4K
 W1uQg+bD3eC9v9vFiLlw8j9+ZBLfWzmpiiJPUF6KcY0kuPeVKLyU0EnFHQo6PkStWnNi77WVyZf
 t4Qw1sJQrdSUVCQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: OO7QWW5CSYR766AWIIDNWCDVZ5P5KW45
X-Message-ID-Hash: OO7QWW5CSYR766AWIIDNWCDVZ5P5KW45
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OO7QWW5CSYR766AWIIDNWCDVZ5P5KW45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Few cleanups to make the code more robust or readable.  No functional
impact (compiled objects stay the same).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      ASoC: codecs: wsa881x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wsa883x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wsa884x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wcd938x: Drop unused defines and enums
      ASoC: codecs: wcd937x: Move max port number defines to enum
      ASoC: codecs: wcd938x: Move max port number defines to enum
      ASoC: codecs: wcd939x: Move max port number defines to enum

 sound/soc/codecs/wcd937x.h | 34 +++++++++++++++++-----------------
 sound/soc/codecs/wcd938x.c | 18 ------------------
 sound/soc/codecs/wcd938x.h |  4 ++--
 sound/soc/codecs/wcd939x.h |  6 +++---
 sound/soc/codecs/wsa881x.c | 42 ++++++++++++++++++++++--------------------
 sound/soc/codecs/wsa883x.c | 42 ++++++++++++++++++++++--------------------
 sound/soc/codecs/wsa884x.c | 34 ++++++++++++++++++++++------------
 7 files changed, 88 insertions(+), 92 deletions(-)
---
base-commit: 66df68b9536e7465aec703733ea91ca39b787ed8
change-id: 20240725-asoc-wsa88xx-port-arrays-c58c96cd888e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


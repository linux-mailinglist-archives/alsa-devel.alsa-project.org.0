Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8C7B6D99
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 17:58:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C25A845;
	Tue,  3 Oct 2023 17:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C25A845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696348722;
	bh=QQf6ijVj+PyrKIDcuL9n9LbXefRYaf38N5/86AyT35k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GigVuHVQfmj2wiFWvzFV3CcLNInAa4YCrACDxnxDJc1H5UDqJSAm8kD5h9wiOxgH0
	 ZIl4ih3whIGG5W9xowQsD++dw9mZGDEPpnblBgQWuBmrKp+KSlkNdc86pq8m/eYWLq
	 knz7rSnRoch/gloBPuH/DDOm6uzyOa6JR3PKNQE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8216CF8055A; Tue,  3 Oct 2023 17:57:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A60E9F80310;
	Tue,  3 Oct 2023 17:57:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16FBFF80551; Tue,  3 Oct 2023 17:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C516F80310
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C516F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DLq7k4pZ
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso198477966b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Oct 2023 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696348635; x=1696953435;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umZ+8oKDYfik3oT0i9Ef96i8g6lg2rgWnjuQEEXA5OA=;
        b=DLq7k4pZ0yxWU2HwAI0H+mVs2Hr/nvT6UWakvHCn0RwmcP/ZmD4Bdm+JuMhpiQw061
         N8p6c+na4v6SOp2qIvQVRQIu6L2Cpzfzc5v0OG1vu/PYC2SMmavKNBEvdXDxwgXspLFO
         7MlFPnuBxvqUocL1JT9MX7P6ct6Kd+PUxoVaVlH/5+zFZK2smIwx/DFssAlnVG/HW1k7
         3v56T7qdhBA2TxQd2YkvNR9B3yf/LZoOay7MQy4/SncwE/zcDHdH3SMKLQOfRVrEI+pT
         ko9g55Fk63RU23ra4pua+C4ih4yGZ/mufPgJyVxE2kVACaODe+ecVovCUSIgnwV9qYeD
         a9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696348635; x=1696953435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umZ+8oKDYfik3oT0i9Ef96i8g6lg2rgWnjuQEEXA5OA=;
        b=sS2/DbIfivb2edlLCuTDkLh7BfoBWVtD9CZ3SYavn2QC9KzbVPLk8iLru0A+lkTR/h
         EJtGleTN8zk/et5Za3avkmmcfV8PLfNnEmg/QpXnl3KFxsW0fZaXgf4mH3A4Toy7N+U1
         ROJMw0G3qWf16m1rdw16eBvHLTvhtHEhvp2b5Wu0MZYHLiUXvtrvev2UqJ55mfUpvd5J
         EZ8R3oroxMQYCQhJPLa3hhMyGfON1bgBV+4UKyoYVukIN6x1hlxULuV7zsN69dfz0Mjl
         XX07oLwlmzIYBva3J/n7aXTAmTg6KfxGwYbv3rQ2arYvcsztmDvwX7UwrSwRtGk6mVr8
         YioQ==
X-Gm-Message-State: AOJu0Yz4MsO5DMrQigStL51IqLxKzT6ax3F7nNZMs+T8blQkHr0ouPDg
	pe6quSS5urHVE2UH5YG691oebQ==
X-Google-Smtp-Source: 
 AGHT+IHdJHFnpnjzifSM5/sGMF/eTk/Jh1MeVpKW1pBhyHkKe/pZiH+yTfo51m2c9cQjrpdYVAyiRQ==
X-Received: by 2002:a17:906:13:b0:9ae:588e:142 with SMTP id
 19-20020a170906001300b009ae588e0142mr14014095eja.67.1696348634904;
        Tue, 03 Oct 2023 08:57:14 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id
 w25-20020a170906481900b0099bc2d1429csm1288088ejq.72.2023.10.03.08.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 08:57:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] ASoC: codecs: fix widget name comparisons
Date: Tue,  3 Oct 2023 17:57:08 +0200
Message-Id: <20231003155710.821315-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VMS2RUU5WRQ3YZ3QCY5DBRMAFFSIYADS
X-Message-ID-Hash: VMS2RUU5WRQ3YZ3QCY5DBRMAFFSIYADS
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMS2RUU5WRQ3YZ3QCY5DBRMAFFSIYADS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Some codec drivers compare widget names with strcmp, ignoring the component
name prefix.  If prefix is used, the comparisons start failing.
Add a helper to fix the issue.

If the approach looks good, I will fix other codec drivers.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  ASoC: soc-dapm: Add helper for comparing widget name
  ASoC: codecs: wsa-macro: handle component name prefix

 include/sound/soc-dapm.h           |  1 +
 sound/soc/codecs/lpass-wsa-macro.c |  4 ++--
 sound/soc/soc-component.c          |  1 +
 sound/soc/soc-dapm.c               | 12 ++++++++++++
 4 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.34.1


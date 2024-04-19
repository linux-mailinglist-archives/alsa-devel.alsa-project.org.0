Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36B8AB13B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 17:03:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B0D1EDB;
	Fri, 19 Apr 2024 17:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B0D1EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713538988;
	bh=38u+Wt5Zc3dld0ZUNzGY4xaUgcWnqdvL6LMkBUX2jYs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=btSaXcUGm9J/PTi3Ps3YRmTMW360iWb5EHXRjUwiaFUG1oQRctEMYWHOyRIjZVN2n
	 dFoikqLGV9c6DbWhqudJg3fbvSW7w2VGKMD8Fpar1R50k4Fg3aB/538GrDi3ACwBGN
	 voOND7FS1f9/6u5LHk7KdEtm5T4JIwyGTrCjfWr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20D2AF805EC; Fri, 19 Apr 2024 17:02:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E585EF805F2;
	Fri, 19 Apr 2024 17:02:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F4B5F80570; Fri, 19 Apr 2024 17:02:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76813F80124
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 17:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76813F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gGA+e+Jm
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4155819f710so17915685e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Apr 2024 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713538906; x=1714143706;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xKyNdflCXl1k1Bk34C22tLwiygb4fVA2Yaqs6+5ffr0=;
        b=gGA+e+Jmu+qucSeYjlIRxb7UF1mr0XYY07ZSLF4QTAyGyBGle6iekiJf3c1JmW94Ht
         fwNPgoj93xDCFitA0E5jvQtb0ImDKfdwHM5l06oid348dwgF2FRv4WewlQ/gpWsSrGYj
         Ray84nOVMAd+evqjI6VTXBAgkA1r0XF/gNzwh+Xf8JivMtC7c1unYpgZ3JMxP5ag5txv
         tP8zvveKtzVs9U4LZL4nrsnA8zJ74uuuK3aNYDQ6PMvsmUE/5+Lz4KVK1kLaHOHOSDdg
         LBLUyOR4QW9pEyrPdz1HJxvBmr/NschHPzpVZ2kIEzVs/1Rfxl6z8fwKPaYunyOSFhfV
         GL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538906; x=1714143706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKyNdflCXl1k1Bk34C22tLwiygb4fVA2Yaqs6+5ffr0=;
        b=Wn1h1AutAI5d64EA76amaQreSz1X2EBvZeJb34C9CReL1QO0SPYZ+0WgRmjoLDJIOW
         JYNyz212+FT37Y8sp5MGP1crPVlubUxSt4WNM4y3nWBY8cBf+qojfKZoBMjaeTh3ONUA
         V3vCOhjeu4l2HCvbzqJUtb/ZwtxmxBelb4yLlRWo+aXVQDJSwj7ec0RIZ1upFN+rs5SQ
         ajGZf5h4xQHbGBlJhaQ/NXsFaTJayJrkkzO1/GygBulHYBVOhOn7KT65kVVRl2ME8WLX
         LspV2ZTVOEQ2BnUbLuulFvYB7KvwwmMwpJ6X+OIq9KuF6F2Sxw4OehZXWW8gQaGeQIX6
         nZlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6eaelovPLkY9UNWFTJK/tipasRnuXy7NTQxzy3WvaiwwzruHZ/EeKXN4KlrmpzGDyqWOK7g7Nrz6w0CeLWzqU7WEb8eBXxS4AD5I=
X-Gm-Message-State: AOJu0YxYTzkPqEJcA4p3zYcSofKCbxazdWzyAlipx+H04gn65r0dT4fX
	/PbkdNlWOPYmqDVjLt7kUnI+SimJTFjoFcFRnWj1rk6DSdFO+eI8e7v9nmw+fMA=
X-Google-Smtp-Source: 
 AGHT+IEmv8ZU3P4FOUWe8jOOnJJzNXxiQc6qjZPMNqbl1hoINJs4ktVsOKqF99wOmcKo+yLUw+QqKA==
X-Received: by 2002:a05:600c:4ed1:b0:418:ed13:302d with SMTP id
 g17-20020a05600c4ed100b00418ed13302dmr1759763wmq.26.1713538906051;
        Fri, 19 Apr 2024 08:01:46 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b00417ee886977sm10660462wmq.4.2024.04.19.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:01:45 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/4] ASoC: qcom: display port changes
Date: Fri, 19 Apr 2024 16:01:36 +0100
Message-Id: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IO3N3VH7VRK6UTY4POQF7MY7TCHFDR75
X-Message-ID-Hash: IO3N3VH7VRK6UTY4POQF7MY7TCHFDR75
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IO3N3VH7VRK6UTY4POQF7MY7TCHFDR75/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patchset adds support for.
	1. parse Display Port module tokens from ASoC topology
	2. add support to DP/HDMI Jack events.
	3. fixes a typo in function name in sm8250

Verified these patches on X13s along with changes to tplg in 
https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
and ucm chagnes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp

Thanks,
Srini

Srinivas Kandagatla (4):
  ASoC: qcom: q6dsp: parse Display port tokens
  ASoC: qcom: common: add Display port Jack function
  ASoC: qcom: sc8280xp: add Display port Jack
  ASoC: qcom: sm8250: fix a typo in function name

 sound/soc/qcom/common.c         | 30 ++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h         |  3 +++
 sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++++
 sound/soc/qcom/sc8280xp.c       | 13 +++++++++++++
 sound/soc/qcom/sm8250.c         |  4 ++--
 5 files changed, 74 insertions(+), 2 deletions(-)

-- 
2.43.0


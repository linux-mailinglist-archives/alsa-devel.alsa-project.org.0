Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F40B77F7BC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 15:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78106825;
	Thu, 17 Aug 2023 15:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78106825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692279099;
	bh=wkahDJFtjCX8JvPvOIF6SkhgH0jBG0sZle3XvSdu+C8=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Sl+w8sdLP2QkbHcbPEt6NDZSyVv4B0ZNMJiEz2ehCNXsK+N+f0wuD9mnINElcjOVk
	 5opuglj/zPWCznawdHKKTTv3SMNimEeD96KOZNvkFEekiBI7PRTc02H2wtAL4VU3jX
	 MAnULtbHc+u6JczFTiz2X0CaiYIwed4sZf6XThkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 852CFF8025F; Thu, 17 Aug 2023 15:30:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54341F8025F;
	Thu, 17 Aug 2023 15:30:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2DB7F80272; Thu, 17 Aug 2023 15:30:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0E51F800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 15:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0E51F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RrRrafPK
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so122903571fa.3
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692279027; x=1692883827;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VqPL20+ASkIf7J9Js8wWxOYppVj2GzrpsRc4VB1aKQE=;
        b=RrRrafPKFPRnnWpY5579CSi/gEwFLYijlwHtFn/3Pvspbu2wqZuMAqsQePXg1M0NUJ
         NIWv9D8Sn03gyl4rAOLGaiDLUuJfIPPX2haLkGY17j1gIYOxVzlDxJ3N9lc90HKdsCOy
         p3eGJitNr+dDe/zdr+zECppM2xYSP/ZPdF59K0hkebv81aXZVav70VcX78xXJsZmhG6M
         u46feMInhQFDCUbZLXvw6T99jHDkSyMsK4tTPJcZP9qWZHkgmMK3iTkwRBwFxn30+bq6
         F9LddGBr1DxqzamQHsCE6qpC/HPkdHHKx2Fi49IxrGP1HlmQzcAU2204Kfvm1oF8NtGq
         h2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692279027; x=1692883827;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqPL20+ASkIf7J9Js8wWxOYppVj2GzrpsRc4VB1aKQE=;
        b=kZnF8w5FCDLgeazhJxPu1ZgV1QiTZ2pOTL5/342djKy22AwCAK0JtOz+trcJ7AM5Q8
         qQfke+DQZGZ1FQSfgaPXkkFDnKDf7rlQ24XjB1/i37vdLuwev7WRhpADjGdu/3xuAsy3
         sTcIqbCSZ8RPeF2z7G1aGAuFuyN7oY4ti/0ESAZNMKFfyV2C07rNy/zxxnF54C4T5/4J
         4g2k64s9YLubzEwDfhbu33IwSBYLvcNEkDrdqdTV9Jcr8tD/LgHPEiak1lfoKWupPdhb
         xQnaJTBQCNqv7WrbjOB083OERi4DFmi+wepaUST38qodcPOchsCShIpiZtjsMxPagGro
         4FDg==
X-Gm-Message-State: AOJu0YyoMqFRcm3lHOcIeXMFsJLW5VSwOpTgUvdTONEZF1XmsIPxlIhW
	RUGD8r1NxNYH6bgmNqbzeJmHmw==
X-Google-Smtp-Source: 
 AGHT+IGo4IJtNuN18JCObOYUV8FNAZFh0tysAmxt8dB74j8o6m0zJpESP5MgoF12/mjNJgZJJe6JZw==
X-Received: by 2002:a2e:9e52:0:b0:2ba:5ca7:2311 with SMTP id
 g18-20020a2e9e52000000b002ba5ca72311mr3886327ljk.41.1692279027459;
        Thu, 17 Aug 2023 06:30:27 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a05651c023600b002b9de06f119sm3941689ljn.67.2023.08.17.06.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:30:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5] ASoC: Convert remaining Realtek codecs to GPIO
 descriptors
Date: Thu, 17 Aug 2023 15:30:14 +0200
Message-Id: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYg3mQC/x3MMQqAMAxA0atIZgO1FateRRykjZrFSiIiFO9uc
 XzD/xmUhElhrDII3aycjoKmriDsy7ERciwGa6wzfeMxkgbh80qiuGgKKBcOwXg7uDY630EpT6G
 Vn/86ze/7AXPCRUZlAAAA
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: ZHGGHYPY6VS4TWU67WPTWZI4FM7L3NNT
X-Message-ID-Hash: ZHGGHYPY6VS4TWU67WPTWZI4FM7L3NNT
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHGGHYPY6VS4TWU67WPTWZI4FM7L3NNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After dropping unused headers a few Realtek devices
actually using the GPIO descriptors remain.

Converting them to use optional GPIO descriptors is
pretty straight-forward.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (5):
      ASoC: rt5640: Convert to just use GPIO descriptors
      ASoC: rt5665: Convert to use GPIO descriptors
      ASoC: rt5668: Convert to use GPIO descriptors
      ASoC: rt5682: Convert to use GPIO descriptors
      ASoC: rt5682s: Convert to use GPIO descriptors

 include/sound/rt5665.h        |  2 --
 include/sound/rt5668.h        |  3 ---
 include/sound/rt5682.h        |  3 ---
 include/sound/rt5682s.h       |  3 ---
 sound/soc/codecs/rt5640.c     | 55 ++++++++++++-------------------------------
 sound/soc/codecs/rt5640.h     |  2 +-
 sound/soc/codecs/rt5665.c     | 17 +++++++------
 sound/soc/codecs/rt5668.c     | 17 +++++++------
 sound/soc/codecs/rt5682-i2c.c | 11 ++++-----
 sound/soc/codecs/rt5682-sdw.c |  4 ++++
 sound/soc/codecs/rt5682.c     | 20 ++++++++++++----
 sound/soc/codecs/rt5682.h     |  3 +++
 sound/soc/codecs/rt5682s.c    | 16 ++++++-------
 sound/soc/codecs/rt5682s.h    |  2 ++
 14 files changed, 67 insertions(+), 91 deletions(-)
---
base-commit: c5b06b35a73b80f1af931c2371de084fa77b5c23
change-id: 20230817-descriptors-asoc-rt-9c072934d376

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


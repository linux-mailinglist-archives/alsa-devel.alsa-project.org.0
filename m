Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E41B77F852
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 16:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3787C82B;
	Thu, 17 Aug 2023 16:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3787C82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692281145;
	bh=KtWRE8mS7vV9krSzh9KE6bGkS5VEXgzENazjVowjkfw=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fLdbc8DLuJRRuiFWzUpqOOtM05UNUBB3UL0ejAyQILzK1o8jjaIEWJB50/lYDjJyc
	 d+teFXyMUN6wn5l/Huk5fnHmVln/eAfR9MMXJEsiVRLlJopCp98HV8ePqeb20992Nq
	 ZAmRA1FSGeG/w5Ns3x7VxJirE1FCdnm4mrfPfKC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 639B3F8057B; Thu, 17 Aug 2023 16:03:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6A83F8057A;
	Thu, 17 Aug 2023 16:03:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE4B0F80553; Thu, 17 Aug 2023 16:03:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D87BF80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 16:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D87BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=No0KlvAB
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so123509911fa.3
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692281008; x=1692885808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDdSkDnAa4EA45wBy/GLSEV+l5NgSMIiiSHWvRZ2KOA=;
        b=No0KlvABaYxw/rZPqIHVWHsDziq6x7bSxyP7ou/8aZa900Caq8T1gj8P21xYN37GBH
         pIPtj52oMnu6T0jp4Y26t7RZneMdSofgiuyuIvAwmC9YQ8F/Bs74inq2yUFtzGvdBqwn
         XP2b7g8/ABAfVAgudf/Ls9JV0oEPeIHXlloU/r9QWlatTA958VOQzYkq65N2hM3wGrw4
         TmYlmgT77Ez/jjZFBDNXpGB/UdPR8cB9wlCFVofRSl0fnRhN5wpkf16PzMoKmHJEMoHr
         O7DOG1nP9nf6nB8AqU9kS0eXYpqgDl31Z5xQdnZdXtyctlNUjA6TPOi4ukHr4/I/ANO3
         yjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281008; x=1692885808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDdSkDnAa4EA45wBy/GLSEV+l5NgSMIiiSHWvRZ2KOA=;
        b=B260kfsLd7MEkwZ4xOO6xSdJg065OXDfaKxkIYIg+Q/SbkS6h2KrTHGgV6ftjOWCHJ
         rvod7/EFPPNUrr56kHKK04hb/Vc/lpWEZfsRqa+iKQY4y2688/RKpAoy2k2wTecoWkBI
         9fIdPPzideb+3xYFZMSMG1C8klH4K0OfwnQNK6i3h203X227oVYjy7ALdCzEys0ewHPV
         HOavH3NLUk5n9QsTs/KJZgRM+X883JvCH8Yc9ABvUj599HGieqctFdPPt0ANsGL3qd/8
         IKNwoA3TJ5tmEwz5oIj8vuFpEmRcLzFxB/D0bxthCsnnEgedrxSkI3THWaM4DxYehwz+
         ap6g==
X-Gm-Message-State: AOJu0YyF8Hjmtma04M3pArwC67r4iRC+kwRK+V90j485y3bO8d6mLLCL
	OEo8h/oWDNANk1C9SB/t1K42mjW3RfKNSjoEC08=
X-Google-Smtp-Source: 
 AGHT+IG7UCqtLK72meyZRcjb0NwX5VMnpVVHQ/PTZFMBfc6PLe2Wyn/oxfUWSQoy5ABuPKOFhNLqRg==
X-Received: by 2002:a2e:874a:0:b0:2b6:c61c:745b with SMTP id
 q10-20020a2e874a000000b002b6c61c745bmr4379877ljj.3.1692281008117;
        Thu, 17 Aug 2023 07:03:28 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a2eb0c3000000b002b9c3e18095sm4064645ljl.14.2023.08.17.07.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:03:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/5] ASoC: Convert remaining Realtek codecs to GPIO
 descriptors
Date: Thu, 17 Aug 2023 16:03:16 +0200
Message-Id: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQo3mQC/32NSw6CQBBEr0J6bZv5oCOuvIdhQYYGOjEM6SZEQ
 +bujhzA5atUvdpBSZgU7tUOQhsrp7mAO1UQp24eCbkvDM44b242YE8ahZc1iWKnKaKs2EQTXOP
 r3ocrlOUiNPD7sD7bwhNr6X+Ok83+0v++zaLB2tfDZbAhRKLHi+dO0jnJCG3O+QsQUAiFtwAAA
 A==
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 5M5QH7ZJPEKHRKV3BUFKVYENV7PN77NA
X-Message-ID-Hash: 5M5QH7ZJPEKHRKV3BUFKVYENV7PN77NA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5M5QH7ZJPEKHRKV3BUFKVYENV7PN77NA/>
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
Changes in v2:
- Rebased on asoc-6.6
- Link to v1: https://lore.kernel.org/r/20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org

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
 sound/soc/codecs/rt5682-sdw.c |  5 ++++
 sound/soc/codecs/rt5682.c     | 20 ++++++++++++----
 sound/soc/codecs/rt5682.h     |  3 +++
 sound/soc/codecs/rt5682s.c    | 16 ++++++-------
 sound/soc/codecs/rt5682s.h    |  2 ++
 14 files changed, 68 insertions(+), 91 deletions(-)
---
base-commit: 17b9f4387ebabb19b871bbe2d06562e48e4e7130
change-id: 20230817-descriptors-asoc-rt-9c072934d376

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


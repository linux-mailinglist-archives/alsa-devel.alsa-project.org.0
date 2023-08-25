Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5E07881C0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 10:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30FD0845;
	Fri, 25 Aug 2023 10:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30FD0845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692951197;
	bh=yjXJanr3YDzWuK7G4j13LqKVpeEg0wme/qpkt/S1BxE=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Rv8OsmRAFV6sidhXdd+DpZKPDGxffDnxCRf2Qo6fbqeN9QxqZBFqA2rxWXbRx3rIx
	 lQUA3algiAg/wopAFXCRKKLkg0mFuxHt9QhLhirEZhizQM5OxGY7D7oH24USinkoxe
	 w7w5rjuOPK9nGj+IpFB5hYn76w4PmY93K37tM36M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 794D9F804DA; Fri, 25 Aug 2023 10:12:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 406B9F800D1;
	Fri, 25 Aug 2023 10:12:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EBAEF804F3; Fri, 25 Aug 2023 10:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73E01F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 10:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E01F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LCbnJHQy
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4ffae5bdc9aso953434e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951133; x=1693555933;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZsvxtDw2cHrK/gH+F8nfBihvnVgUOAVKlUaPMeEkUI=;
        b=LCbnJHQy1VMiQ4tifKEsp9uvCTkV/Ewo2KCxFPSMWF2TjNpFdyR5fghHe/vkK9AhdY
         9qFQLtd07F9/BU3IgmFeBPtrGLmUqgx5mW+eNtIQyyTXUbxG/jv+OLSx3N/PWvQLIzpe
         /HucRdle7oxDOeV8DOn2HgvUuPymfi+Y64FAMMUqVqF52ruIeDZtvH6zqCwx5zHpvmMH
         mHIozSTtGU7qZLvQEiBCi7AbdNGtSFVmQbp19e/pMityydV8pmpM+4x1n7TQA2bxPkKG
         9A26hOml8zRBQNNw53M0gg2usWBiHbnmBpGQYSiqJOkJQoRdoQfSyyd6DOnxUAp042xh
         EnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951133; x=1693555933;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZsvxtDw2cHrK/gH+F8nfBihvnVgUOAVKlUaPMeEkUI=;
        b=CwieMRmUV4lWXzwi4LEFYwdi1bFD4lb+irx5vQoKY9GNLOFVcLxud+gaLFzkb25rPj
         D/zgVl8WU/wDCKAL3h9bIew+qyTlG051razh3Q0jbFcMzvrK7WYtBwHtdPgk1WbCxcGj
         0gsUdeHsFfwrmhTpSh1rsxKuwp+HEFf3cLUwWaditVgcNsNPQoRDZVIqD62voIjrMHIB
         YL4QZ4oMhVmFAwU3m0886d6LjCZp6P8EkiY9C9sTBf1WT/uaQBOAmgw48y4qcKh4TkuD
         WyTLNClPA3hwnaHK72MaNJrPylt9/XcNLPSD+rHkqgRjExUekKYFfhzjH0d/hg2Lq3ys
         Kckg==
X-Gm-Message-State: AOJu0YxCLujlVIiBLFQNJoEv0ci4vnFNxWPfYjv6fqtV2XnM5sn2J/wH
	tQgpxxSFACGeONBFDSYVdtZ7pg==
X-Google-Smtp-Source: 
 AGHT+IH2cYfOyAKDYkikVhhazevJIX4VasKy+kIf6y6CW4pTRpKnyies/vWRmWxt1pM2ZCb6NQEIfQ==
X-Received: by 2002:a05:6512:128c:b0:4fa:f96c:745f with SMTP id
 u12-20020a056512128c00b004faf96c745fmr16758118lfs.38.1692951132892;
        Fri, 25 Aug 2023 01:12:12 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm195559lfb.140.2023.08.25.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/7] ASoC: Convert some Maxim codecs to use GPIO
 descriptors
Date: Fri, 25 Aug 2023 10:12:10 +0200
Message-Id: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpi6GQC/22Nyw6CMBBFf4XM2jFtjYCu/A/DovQBkyglM4ZgS
 P/dSly6PDc5524ggSkIXKsNOCwklKYC+lCBG+00BCRfGIwyJ9XqBn0QxzS/EgtaSQ6fdsW+0dY
 p00cdIxR15hBp3bP3rvBIUoT3/rLo7/oLmvP/4KJRobd10/a1ssZfbg+aLKdj4gG6nPMHtnz41
 rkAAAA=
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: GACQLT44LW2DMIWXHVJHUXRRNAEU5PHL
X-Message-ID-Hash: GACQLT44LW2DMIWXHVJHUXRRNAEU5PHL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GACQLT44LW2DMIWXHVJHUXRRNAEU5PHL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Maxim devices are pretty straight-forward to convert
over to use GPIO descriptors, so let's do it.

Tested with some x86_64 allmodconfig and aarch64 allmodconfig
to smoke out the worst bugs this time.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (7):
      ASoC: max9768: Convert to use GPIO descriptors
      ASoC: max98357a: Drop pointless include
      ASoC: max98373: Convert to use GPIO descriptors
      ASoC: max98388: Correct the includes
      ASoC: max98396: Drop pointless include
      ASoC: max98520: Drop pointless includes
      ASoC: max98927: Drop pointless includes

 include/sound/max9768.h         |  4 ----
 sound/soc/codecs/max9768.c      | 45 +++++++++++++++++++++--------------------
 sound/soc/codecs/max98357a.c    |  1 -
 sound/soc/codecs/max98373-i2c.c | 17 ----------------
 sound/soc/codecs/max98373.c     | 35 +++++++++++++++++---------------
 sound/soc/codecs/max98373.h     |  2 +-
 sound/soc/codecs/max98388.c     |  3 +--
 sound/soc/codecs/max98396.c     |  1 -
 sound/soc/codecs/max98520.c     |  2 --
 sound/soc/codecs/max98927.c     |  2 --
 10 files changed, 44 insertions(+), 68 deletions(-)
---
base-commit: 17b9f4387ebabb19b871bbe2d06562e48e4e7130
change-id: 20230817-descriptors-asoc-max-b71ac02bf1ff

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


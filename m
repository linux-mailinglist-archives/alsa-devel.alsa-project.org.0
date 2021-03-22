Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C134478F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 15:42:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB32815E0;
	Mon, 22 Mar 2021 15:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB32815E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616424134;
	bh=Kugk4t7Xzi2zV40Q8JNZkUsRQssHVYPuRMdaAAAuwIA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lUbFLLFJwECjPLfAvBD6XLBxCUne8ZuRDv8duLkXfrI+54rb4mUs9wr/f7GOhb02x
	 v8m7iG+C7T/VZoKWKThQZcoEXf5DddtQ8ThjfJR/fsM7iNiSWBHESYzfKu6mnE6RLF
	 75ewLBEnBn24RxjJVLsSj6ycbwL/eBAzCKaQ12og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC228F801EB;
	Mon, 22 Mar 2021 15:40:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97499F801D5; Mon, 22 Mar 2021 15:40:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60706F80155
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 15:40:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60706F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q5Te0kn+"
Received: by mail-ed1-x52f.google.com with SMTP id b16so19665222eds.7
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sd3NAlYTlcvi/QMV36ICDUYrz39AstS3COa8JsP44Ys=;
 b=Q5Te0kn+z1zC6N0q+DE5A78qVYm7TD6CMBW5JAjg+LhA4c7rmhfA2DomZwU9wY6Zhf
 hZQUtNWBtKyCmPvnpGM8zalZ/pZKqI5zrsdrswbBcvK3NxiZ6ZWcim7FW4nTlAiA9eF8
 Qc2S7z/q8vwTuRaYhTmOWKDoZy72+UQLFG8jylpYBReD25rKjZgbD9cbhjqN8mFXmTII
 ErO+fbwToXW/WzWd9hhL4FddqZeL5hLyfqUxBP7SUXKpkXk2VfIsNVZ+2FAeU8kLh7x4
 zaSWxxY6b9UrNaYOsu+E5hla26QyqusiXGmmby6Vca39nMfYdDynuYTrC13bzqLienUx
 gZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sd3NAlYTlcvi/QMV36ICDUYrz39AstS3COa8JsP44Ys=;
 b=EolC/hdBBHsgDV4+OxJNWNH8kuY3fNgZ0fTkyv5uxSefr3NzTDVQBUBoYCnO0ejird
 cnihgpKiBtJK+/X/T6IMVjt63R0pneZTWf27MBySZXZM+NL+iqpzPNze6lEwpzIz4eg7
 bkM3kmBk/apa6av1o5bltVEjyvu1nxxfyD4dOqe85s0OXHmIrqfwwt1hEaMknITCoStw
 ux16L8B7C48V9bB3CaY/4Eth3LGIrYXr+MlpMLeszdbzhwlPz7KwKhUOuNLcbeXMjYcW
 Y9TROvmiwFmWvBepoM+56KxFY6xtNeKrrNZOPyEDH9fW0nzj2tAeLUsY6S7/QCb8qdlz
 rCcg==
X-Gm-Message-State: AOAM533rwb389O28PBsby7riL9BWLDyj/gZ50lln2Y8m8jD4h4HCchvh
 1kPW222PGpMvk5k7qTXelg9X9Q==
X-Google-Smtp-Source: ABdhPJwIe7HYLh7N874sWXI9W6QN+hPz5NDVkJ/oRhJ20gHSdJ3H+XYwlDc7Cp7XcgYCPoF2KQimkw==
X-Received: by 2002:a05:6402:3495:: with SMTP id
 v21mr25875834edc.117.1616424027789; 
 Mon, 22 Mar 2021 07:40:27 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id i11sm9778388ejc.101.2021.03.22.07.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:40:27 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:40:25 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch between MFD and Extcon due for the v5.13
 merge window
Message-ID: <20210322144025.GW2916463@dell>
References: <20210307151807.35201-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210307151807.35201-1-hdegoede@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Enjoy!

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-extcon-v5.13

for you to fetch changes up to a908a716696eee75bf85199cde2b0989290536d1:

  ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c (2021-03-18 11:46:15 +0000)

----------------------------------------------------------------
Immutable branch between MFD and Extcon due for the v5.13 merge window

----------------------------------------------------------------
Hans de Goede (6):
      mfd: arizona: Drop arizona-extcon cells
      extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
      extcon: arizona: Fix various races on driver unbind
      extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol") call
      extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
      ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c

 MAINTAINERS                                        |  3 +-
 drivers/extcon/Kconfig                             |  8 ---
 drivers/extcon/Makefile                            |  1 -
 drivers/mfd/arizona-core.c                         | 20 -------
 .../soc/codecs/arizona-jack.c                      | 63 +++++++++++-----------
 5 files changed, 34 insertions(+), 61 deletions(-)
 rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (98%)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

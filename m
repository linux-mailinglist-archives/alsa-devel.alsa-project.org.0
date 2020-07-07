Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3720E216EDA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7DE5886;
	Tue,  7 Jul 2020 16:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7DE5886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594132778;
	bh=c8FVJSUbYMSrqnJQEX4avLuiByw8A/i0h1b6nWwN6ok=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YsybRm6lrwDfc1lufEMgYusKPCqYWikjWd59jfFPEJ98XAYK9rUu34pjK4QYXxyHN
	 tHMzm8YjjBMswCmj5hFgIS1H0vZAIMkLTET1p4oHtazFl4k37nd4bCGYzan8WYHwZk
	 SsR+JB9UI6l1umYU3OhAXEZOWNekxnLt488ulmCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADBC7F802A0;
	Tue,  7 Jul 2020 16:37:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 911AEF80274; Tue,  7 Jul 2020 16:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E28EF801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E28EF801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Lz0nPDxc"
Received: by mail-wm1-x341.google.com with SMTP id o2so46777554wmh.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5iF8ft+c50gpwNnzzALPrKJo/bbNCmFujAo6+tQfbag=;
 b=Lz0nPDxcqEOwOrN6zYyousamF2fXBBFMTdeR4LW8bSilPOhb/g/iLa84hhIJJFuDW6
 CHgzKjN/Ks6bLLbbMjwmjRdKIr/m4ToP0M3Ic+JLsug2W7O9eYaS4I+2X8batugOPe+M
 3MGJM+fcDQpTnBBWXXzUKPOcLnFG6F91I0Qd3mc54oBIMtqrjBel4wjkRq+YEjKDY0Eo
 Kk7J2QqmYxBmWkviAU1EFsDPmrOhRGzyZJVWglkYX4qqXij9fyPIwAA2YwXSQL5DQ3SR
 419aaKH6rylK9L6oSlUNULiT38rOIfwa9kWMflWB5O95h6VpS0DQQuAC098qrjCpsGfC
 +7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5iF8ft+c50gpwNnzzALPrKJo/bbNCmFujAo6+tQfbag=;
 b=ORW5MfwY3Gb0N2HpqyU0rD4EobqsUIA1UKsgj8dqmxOmO/sw4cv+6mGd8CmbKpHm4/
 DCUKPZ0kMm8qvkcN0mpvjJBsYbvneUmR7TqHHPfL9qF9aoVwJz2dcdoM4qiE9nSqN/2K
 9MLisg2jvVxepiuJEHNuTVWDjJswcSG6qevJGyrj9GYTgT5WQ1WO/GbbM/wPwBr/sPLq
 0qkZGeRr0UqL1aWH9KUveiwBoSQygKaXg273+LbSYEET+IaTzc90rcRFRu1YGeyXTU7f
 IHJoQ7aNFRt0C3p/skGxnfTRwIbC7qb8//vPAa150jsFVG43Jwwazz4exlIg6Ae7wpOS
 KPlg==
X-Gm-Message-State: AOAM53174Nw2qIwhs7IXBB68spHUF6fp7NekQ5g/h9muAuBJHNP1dIrK
 GnL5VdScWDXyr2nNAwKvui8NmQ==
X-Google-Smtp-Source: ABdhPJw1xINFmSvbUCOzjkbGqZ/QUUiOXhKsCkIjO0i2XygXmAlkbXkTnXKhAMio+o2WFG4v85WpSA==
X-Received: by 2002:a1c:9e06:: with SMTP id h6mr4299319wme.45.1594132665610;
 Tue, 07 Jul 2020 07:37:45 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:45 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 00/28] Clean-up ASoC's W=1 build warnings
Date: Tue,  7 Jul 2020 15:37:14 +0100
Message-Id: <20200707143742.2959960-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

After these patches are applied, the build system no longer
complains about any W=0 nor W=1 level warnings in sound/soc,
when building for Arm.

Hurrah!

Changelog

v1 => v2:
 - Remove whole read from patch 21
   - Suggested by Peter

Lee Jones (28):
  ASoC: atmel: atmel-pcm-dma: Demote function header which is clearly
    not kerneldoc
  ASoC: atmel: atmel_ssc_dai: Demote function header which is clearly
    not kerneldoc
  ASoC: fsl: fsl-asoc-card: Use correct format when providing struct
    documentation
  ASoC: fsl: fsl_asrc: Demote obvious misuse of kerneldoc to standard
    comment blocks
  ASoC: fsl: fsl_ssi: Demote obvious misuse of kerneldoc to standard
    comment blocks
  ASoC: fsl: fsl_ssi_dbg: Demote obvious misuse of kerneldoc to standard
    comment blocks
  ASoC: fsl: fsl_spdif: Use correct formatting when denoting struct
    documentation
  ASoC: fsl: fsl_spdif: Update 'struct fsl_spdif_priv's descriptions
  ASoC: fsl: fsl_esai: Fix a bunch of kerneldoc issues
  ASoC: fsl: fsl_esai: Add descriptions for 'tx_mask' and 'rx_mask' to
    'fsl_esai'
  ASoC: pxa: pxa-ssp: Demote seemingly unintentional kerneldoc header
  ASoC: codecs: ak4458: Remove set but never checked variable 'ret'
  ASoC: qcom: qdsp6: q6asm: Provide documentation for WMA
    'codec_profile'
  ASoC: samsung: pcm: Demote half-documented kerneldoc header
  ASoC: samsung: spdif: Fix 3 misspelled struct properties
  ASoC: sunxi: sun4i-i2s: Demote half-documented kerneldoc header
  ASoC: uniphier: aio-core: Fix incorrectly named struct property and
    remove another
  ASoC: sunxi: sun4i-spdif: Fix misspelling of 'reg_dac_txdata'
  ASoC: ux500: ux500_msp_i2s: Remove unused variables 'reg_val_DR' and
    'reg_val_TSTDR'
  ASoC: sti: uniperif: Mark 'uni_tdm_hw' as __maybe_unused
  ASoC: ti: omap-mcbsp-st: Remove set, but unused variable 'w'
  ASoC: codecs: da7210: Fix formatting issues in da7210_set_dai_pll()
    header
  ASoC: soc-ac97: Demote seemingly unintentional kerneldoc header
  ASoC: codecs: jz4770: Remove defined but never used variable
    'mic_boost_tlv'
  ASoC: codecs: rt5631: Demote misuse of kerneldoc to standard comment
    blocks
  ASoC: codecs: rt5659: Remove many unused const variables
  ASoC: codecs: tlv320aic26: Demote seemingly unintentional kerneldoc
    header
  ASoC: codecs: wm8400: Remove a bunch of unused variables

 sound/soc/atmel/atmel-pcm-dma.c |  2 +-
 sound/soc/atmel/atmel_ssc_dai.c |  2 +-
 sound/soc/codecs/ak4458.c       |  6 +++---
 sound/soc/codecs/da7210.c       | 12 ++++++-----
 sound/soc/codecs/jz4770.c       |  1 -
 sound/soc/codecs/rt5631.c       | 12 +++++------
 sound/soc/codecs/rt5659.c       | 37 ---------------------------------
 sound/soc/codecs/tlv320aic26.c  |  2 +-
 sound/soc/codecs/wm8400.c       | 12 -----------
 sound/soc/fsl/fsl-asoc-card.c   | 16 +++++++-------
 sound/soc/fsl/fsl_asrc.c        | 28 ++++++++++++-------------
 sound/soc/fsl/fsl_esai.c        | 19 ++++++++++-------
 sound/soc/fsl/fsl_spdif.c       |  5 +++--
 sound/soc/fsl/fsl_ssi.c         | 28 ++++++++++++-------------
 sound/soc/fsl/fsl_ssi_dbg.c     |  4 ++--
 sound/soc/pxa/pxa-ssp.c         |  2 +-
 sound/soc/qcom/qdsp6/q6asm.c    |  1 +
 sound/soc/samsung/pcm.c         |  2 +-
 sound/soc/samsung/spdif.c       |  6 +++---
 sound/soc/soc-ac97.c            |  2 +-
 sound/soc/sti/uniperif.h        |  2 +-
 sound/soc/sunxi/sun4i-i2s.c     |  2 +-
 sound/soc/sunxi/sun4i-spdif.c   |  2 +-
 sound/soc/ti/omap-mcbsp-st.c    |  3 ---
 sound/soc/uniphier/aio-core.c   |  7 +++----
 sound/soc/ux500/ux500_msp_i2s.c |  8 +++----
 26 files changed, 88 insertions(+), 135 deletions(-)

-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 480C72169EA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3EB9950;
	Tue,  7 Jul 2020 12:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3EB9950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117116;
	bh=AJeqcxGt4+eXOW1MiP8N5aU1BKo/R0Rn+sODmhxOuJk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jXaMggUsU5ok0w/eG1p7/Cxx62Lw5IHJ8/aTFvQjj4gibx6V37U9/NYGuJmsLrdlF
	 iJt5/CH8WNWViNTwhOhLpns8aSGf0hf+PVE6p3M7dDh3jhDbYDxO5l81k/vlj1Ndoq
	 /5XWi3GTB9BK+pZv3PEWAYBiDFx0hgL4arFY7LGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA13DF800D0;
	Tue,  7 Jul 2020 12:16:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05176F80257; Tue,  7 Jul 2020 12:16:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD8D9F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD8D9F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vDkQymds"
Received: by mail-wr1-x442.google.com with SMTP id z15so33266315wrl.8
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAeTAEOISwkUGJHdFnlz0rMhMgi8r2OkvIBIQRn009g=;
 b=vDkQymdsPAJARkKXV0ZqJKJv0R9QiTZj0Qk3vE4jy2GELVQqwGwKilN1HZ/jt2D7XC
 PD93tlYBzj01lkaRr25TaMO+7n6IspO8ULnepNpzbB8qgFJCwTTQtIhJ9cDQolVufaxE
 fXLNAnPIxzkRLhmtVARWho2rc9FTACCIbEzKe+ZE/KN8NGAaqF2mtkqNUkjU+hmqauh6
 Iw5QZBpgS0oi9qURJUfGd52LTh8EpKpfstzfrCVSd8mcV9U8ELxflRSKCxhCL2dL/L+c
 RZrl2tJpTophaIrzoILWuRUPkGeF2DIkvR5O6dr9Cp8vu8XoK+GnDzEyGlhpdlKGDRQN
 8ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAeTAEOISwkUGJHdFnlz0rMhMgi8r2OkvIBIQRn009g=;
 b=Olwm88PNWveCX/zEyZddpt5qf1Xp8bJjkohHwYpa1IIlvDB48YLh3KbJZRejTtxLsB
 Q7rR8sx17mSHYy9T5Z8TO+2gAvIV0XJVlsereU7HMhS+sa7o7zPWGpzSc6NiwvEps0W5
 OoEt2MlANXzvEMnpKTrY6BQhcEsZ7dhxvIIhsQbY1BDU7iZWm0cCWeXP5VjH4ttkberS
 DkKGKXSxer6tve7B6o9st4ln1zCH1HCz4l3rqImBWP481rAoZRj01++k5wtgTu4ztOcl
 MARclvpN8ADjTntAnAFIuaG3dSMN+DAiTL67DhUWkmA8ifGXLWprC9hsUZXZLZj+W7GD
 VmFQ==
X-Gm-Message-State: AOAM533CoErnJKfa3HVsoKQ3qZLIERuxO0b9262tu+yh7voiiQw+O3PL
 at4oO0VoJWo79U/a0GZ4cGCdIA==
X-Google-Smtp-Source: ABdhPJwR1H3HDPf/6gNEou9O6u3d5rQxvQWsS1h1+DHpi1DC8lg7IU3W6xA85oGItQc5pfva+/d3NA==
X-Received: by 2002:adf:f20a:: with SMTP id p10mr56348436wro.41.1594117006963; 
 Tue, 07 Jul 2020 03:16:46 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 00/28] Clean-up ASoC's W=1 build warnings
Date: Tue,  7 Jul 2020 11:16:14 +0100
Message-Id: <20200707101642.1747944-1-lee.jones@linaro.org>
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
complains about any W=0 nor W=1 level warnings in sound/soc.

Hurrah!

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
 sound/soc/ti/omap-mcbsp-st.c    |  3 +--
 sound/soc/uniphier/aio-core.c   |  7 +++----
 sound/soc/ux500/ux500_msp_i2s.c |  8 +++----
 26 files changed, 89 insertions(+), 134 deletions(-)

-- 
2.25.1


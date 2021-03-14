Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2D133A5B2
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:46:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844FB174B;
	Sun, 14 Mar 2021 16:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844FB174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615736817;
	bh=6s1qy6Za+SwzB+glSteydGwSlZqYhuyAOVVeQ92/qzc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A7P3QKL1ZLMozOdMePG9tuLE+SO+/g6UiC1v/NuLgCdCvTkIi2wuv6LZdG2Ox49k5
	 nrmlHuX8NovEdmJJlbbi9ZSVkM0lKXVScq5MqcH0u+7H6e9app/p1kmibPCR303HBx
	 Pi4NQpEKM67j3UYKMlkbWv+E9lMrw+3Wszum83Lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A24BFF8023B;
	Sun, 14 Mar 2021 16:45:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17ED2F80224; Sun, 14 Mar 2021 16:45:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF7BCF80100
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF7BCF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qAuWjcuk"
Received: by mail-wr1-x431.google.com with SMTP id u16so7450558wrt.1
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PclIFcC2nS7Q4VorzCLkkkTGpzHU2Eq5kWVCvmuDhyI=;
 b=qAuWjcuklA/Y8Y441HfQKMy13BZlI5RX7assgoGjGpvXvlph3m7P5heS9rbqB5KQ/1
 pcjs6BAnCmJkatVXbT/DQ0liLAVUnBe0RfsvOeZI2iHG/HeOhuj852q1W+v3RNVYVBYW
 DFs9CDGu8jmEMnDwhjvQNRgdizpir1MEtdIxdybciDkUECp0AcWzCWpcu6q5OmxAAd7Y
 /lxCVi2MQKGF6YL5me0QlN1PSMMRB/QPOVXGHSxiT2bq/4p8mqbexgro0sFANTclYYMt
 myrNB6vzAqnmujVSpLVAeQYmeRR15+Ex7Ru19rZ7ezd1lPHe1Vk1/A9KJ7kOQqjCmLRh
 8IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PclIFcC2nS7Q4VorzCLkkkTGpzHU2Eq5kWVCvmuDhyI=;
 b=Ca8cRwJt4wFYqeV+7slw+201xdLcojRuIO6m2iIiYgLh4p1fTpBl1zfqqtjKfwus+c
 cH+704qnQGFUCBCsu0N/wy7xRtgvND0MH5pxPRqmbOxBywRx9HwQ34pYNwLwRGD41MzY
 yWoJjvu3BtZ/YY6XfV0JjZrsGptQYxR5XZrQyDx9feFNgAQ7P0RrF+6bO3TmyYIq4F0S
 wptOrVcv/IGJ0PtXmX8iNJW+sVzCNKKuG6EnmFjPFPInXSf8+ivsHDb8tJe6wZbs/W2O
 qzgMqCinyKbH84gnnQTCro4AN0n+ZLegYPnfO20bhriCVmmie+OqOrnBzrKU5ia6tIsj
 ZBzA==
X-Gm-Message-State: AOAM5328KnEJXcoe009t4i+lgB/CAXFs7A4Ixdd9pTsNPJ7nQzB7+idw
 rx7fpVYdUoOl4fngxysVmV0=
X-Google-Smtp-Source: ABdhPJwO1WyF3LJh32pYsIZEBoThmnPXPXjd76LixRiKKFWmeUv7A9UyngwsIPvIbamr5I/6VCpOYA==
X-Received: by 2002:adf:90c2:: with SMTP id i60mr23481723wri.75.1615736720372; 
 Sun, 14 Mar 2021 08:45:20 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:19 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC
 drivers
Date: Sun, 14 Mar 2021 18:44:42 +0300
Message-Id: <20210314154459.15375-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Hi,

This series adds missing hardware reset controls to I2S and AC97 drivers,
corrects runtime PM usage and drivers probe/remove order. Currently drivers
happen to work properly because reset is implicitly deasserted by tegra-clk
driver, but clk driver shouldn't touch the resets and we need to fix it
because this breaks other Tegra drivers. Previously we fixed the resets of
the AHUB and HDMI codec drivers, but turned out that we missed the I2C and
AC97 drivers.

Thanks to Paul Fertser for testing the pending clk patches and finding
that audio got broken on Tegra20 AC100 netbook because of the missing I2S
reset.

Changelog:

v5: - After taking another look at the drivers I noticed couple more
      things that could be improved. These new patches correct runtime PM
      and probe/remove order of the drivers:

        ASoC: tegra20: spdif: Correct driver removal order
        ASoC: tegra20: spdif: Remove handing of disabled runtime PM
        ASoC: tegra20: i2s: Add system level suspend-resume callbacks
        ASoC: tegra20: i2s: Correct driver removal order
        ASoC: tegra20: i2s: Use devm_clk_get()
        ASoC: tegra20: i2s: Remove handing of disabled runtime PM
        ASoC: tegra30: i2s: Correct driver removal order
        ASoC: tegra30: i2s: Use devm_clk_get()
        ASoC: tegra30: i2s: Remove handing of disabled runtime PM
        ASoC: tegra30: ahub: Reset global variable
        ASoC: tegra30: ahub: Correct suspend-resume callbacks
        ASoC: tegra30: ahub: Remove handing of disabled runtime PM

v4: - Added missing prototype for reset_control_bulk_put().

v3: - Fixed reset stubs for !CONFIG_RESET_CONTROLLER.

v2: - After some more testing I found that I2S control logic doesn't require
      I2S clock to be enabled for resetting. Hence it's fine to have I2S to
      be reset by parent AHUB driver, so I dropped "tegra30: i2s: Add reset
      control" patch.

    - While I was double-checking resets on Tegra30, I found that that
      Tegra30 I2S driver has a broken runtime PM which doesn't restore
      hardware state on resume and it's lost after AHUB RPM-resume.
      Thus, added this new patch "tegra30: i2s: Restore hardware state
      on runtime PM resume".

    - Added new patches which switch AHUB driver to use reset-bulk API.
      I took the RFC patch from Philipp Zabel, fixed it and added
      devm_reset_control_bulk_optional_get_exclusive_released() that
      will be useful for further Tegra GPU patches. This is a minor
      improvement which makes code cleaner.

Dmitry Osipenko (16):
  ASoC: tegra20: ac97: Add reset control
  ASoC: tegra20: i2s: Add reset control
  ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
  ASoC: tegra30: ahub: Switch to use reset-bulk API
  ASoC: tegra20: spdif: Correct driver removal order
  ASoC: tegra20: spdif: Remove handing of disabled runtime PM
  ASoC: tegra20: i2s: Add system level suspend-resume callbacks
  ASoC: tegra20: i2s: Correct driver removal order
  ASoC: tegra20: i2s: Use devm_clk_get()
  ASoC: tegra20: i2s: Remove handing of disabled runtime PM
  ASoC: tegra30: i2s: Correct driver removal order
  ASoC: tegra30: i2s: Use devm_clk_get()
  ASoC: tegra30: i2s: Remove handing of disabled runtime PM
  ASoC: tegra30: ahub: Reset global variable
  ASoC: tegra30: ahub: Correct suspend-resume callbacks
  ASoC: tegra30: ahub: Remove handing of disabled runtime PM

Philipp Zabel (1):
  reset: Add reset_control_bulk API

 drivers/reset/core.c            | 215 ++++++++++++++++++++++
 include/linux/reset.h           | 315 ++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.c  |  21 +++
 sound/soc/tegra/tegra20_ac97.h  |   1 +
 sound/soc/tegra/tegra20_i2s.c   |  60 +++---
 sound/soc/tegra/tegra20_i2s.h   |   1 +
 sound/soc/tegra/tegra20_spdif.c |  16 +-
 sound/soc/tegra/tegra30_ahub.c  | 168 ++++++-----------
 sound/soc/tegra/tegra30_ahub.h  |   5 +-
 sound/soc/tegra/tegra30_i2s.c   |  65 ++-----
 10 files changed, 667 insertions(+), 200 deletions(-)

-- 
2.30.2


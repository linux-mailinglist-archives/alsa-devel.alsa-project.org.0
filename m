Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81197337B4D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 18:45:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB3FF17AE;
	Thu, 11 Mar 2021 18:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB3FF17AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615484747;
	bh=2UphQsBif55vQUtcAhtOrY1NkQ3W78h/XxDGSIIlJL0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dESvhSxn7g9Zhes387DZcOaustwIWrhUoviW3VMtzW4RZFsFdbIhaFqshZzmmS77p
	 KmgFQmlAAtmjWPEtS13ZAVUHge9s9EQ5tCn8o69kKOoSGq1U6fAH6kvcnYY6P+f4XE
	 tc9DBmTAtXRsFUs9ejT4QuUwqq9nixujhzg9ennE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DBBBF8032B;
	Thu, 11 Mar 2021 18:43:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07DD4F8028B; Thu, 11 Mar 2021 18:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23CDCF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 18:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23CDCF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ECDG4MRi"
Received: by mail-lf1-x12d.google.com with SMTP id q25so41131330lfc.8
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tV08/S8AYkOlggjIBuODj7Why8Z1+LlJ+V4vGmOX1RE=;
 b=ECDG4MRiMe5CStYYvkaKYV/dG6cxvGotcx4pATfKF5+buUVugq1PUOLDnIhnG8292C
 Bk8WZFFoHtcXvw0fBRsh3zQNR1ddjKewwsm7uHNtXPh9nMAMSKhjXEbJ53QUrUC5GvIf
 gVvZTMmfQjki/ucGrhTIVSFcCGuI+ux35MV3lBcpvl74jtHS8eYR0meRsdF7Xxbnwij0
 u4yjsAT5O2yBzcJe6STgyR+Jv37tRfcvmXragfxRP8pU/VtHw2YoU4oi/bmLAbGJlB+u
 +qCFDehB11KbuxefFr7zrSFjUkL9XpU2lxPZ1cGe9CN/SBEFBwZs0x5CAQ04j2cI8+/a
 5AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tV08/S8AYkOlggjIBuODj7Why8Z1+LlJ+V4vGmOX1RE=;
 b=c8HPRbPfhUSNH0EavMl7LBzKN9ehfVmZVGmyhrGzJ/Awn3cJM+40STSbJ8k0Vpf54w
 T1ODEPhVaOv+cAhr/n6wxqkJfpT8SpgtmvXFnMf3j7R/oc2UdQWdQK34QG9bb1q7uHKq
 N1vjUnZ0S/l6w5Yt4HEMXNC15Ut/qJqh9ao781FYXjb047uUyw+lEdX2Pj7nNWG748xg
 glcnB2QyfEn79Rvc7H/AqQM2wiZDpjg2hNW8lEk/nA106D4U0LBMut58FG1KqH4pbgVx
 Tz6/ECHett2uPtuO0YUQqJ0cMUdmeIYRt+GhCDsBmLmUAdrGobQRmHqtBWpJ9Kn0HuTy
 uMkQ==
X-Gm-Message-State: AOAM531aXM6HArNYQZGmp/emlNsh+NrXBJmCcOCcWRkAJTV+d9s4MVfS
 QmlkwbLa8d3AgSELiAT2/ZQ=
X-Google-Smtp-Source: ABdhPJzZoVdzNWaBBpv/V2H46jX+HJmoeEWU1giXzXKNrzi0/bcW1oUOQs8EzXjuFa1ZQ7NacFM8vQ==
X-Received: by 2002:a19:520b:: with SMTP id m11mr2863398lfb.42.1615484592025; 
 Thu, 11 Mar 2021 09:43:12 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id g10sm1021245lfe.90.2021.03.11.09.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:43:11 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v3 0/5] Add missing reset controls to NVIDIA Tegra ASoC drivers
Date: Thu, 11 Mar 2021 20:42:57 +0300
Message-Id: <20210311174302.15430-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
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

This series adds missing hardware reset controls to I2S and AC97 drivers.
Currently drivers happen to work properly because reset is implicitly
deasserted by tegra-clk driver, but clk driver shouldn't touch the resets
and we need to fix it because this breaks other Tegra drivers. Previously
we fixed the resets of the AHUB and HDMI codec drivers, but turned out
that we missed the I2C and AC97 drivers.

Thanks to Paul Fertser for testing the pending clk patches and finding
that audio got broken on Tegra20 AC100 netbook because of the missing I2S
reset.

Changelog:

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

Dmitry Osipenko (4):
  ASoC: tegra20: ac97: Add reset control
  ASoC: tegra20: i2s: Add reset control
  ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
  ASoC: tegra: ahub: Switch to use reset-bulk API

Philipp Zabel (1):
  reset: Add reset_control_bulk API

 drivers/reset/core.c           | 215 +++++++++++++++++++++++
 include/linux/reset.h          | 308 +++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.c |  21 +++
 sound/soc/tegra/tegra20_ac97.h |   1 +
 sound/soc/tegra/tegra20_i2s.c  |  31 ++++
 sound/soc/tegra/tegra20_i2s.h  |   1 +
 sound/soc/tegra/tegra30_ahub.c | 104 ++++-------
 sound/soc/tegra/tegra30_ahub.h |   5 +-
 sound/soc/tegra/tegra30_i2s.c  |  41 ++---
 9 files changed, 629 insertions(+), 98 deletions(-)

-- 
2.29.2


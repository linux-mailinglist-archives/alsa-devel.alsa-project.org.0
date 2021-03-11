Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F3C337B98
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 19:01:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C3117A7;
	Thu, 11 Mar 2021 19:00:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C3117A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615485707;
	bh=A85EUe7ayjaYQOe5QHBEEJGZlQdbF69bzCjMF50BbuE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=laXc/TpzPYHdSg2skGmwF+0PvShoNOPUoLyw6hwoZlVIaJRJUTr7k0aojerD0XDYu
	 8DeCxIzpbjbNwuRKfoEmc/ht/sq6g6IndC2bbtXTl8KO3ODg76L2x4YCcdPkTVUidj
	 QMgGNw6MM8qIyyXLp3VAJfAp5F2H02y1sjMLMqmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01057F8025A;
	Thu, 11 Mar 2021 19:00:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFD7EF80256; Thu, 11 Mar 2021 19:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF6EF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 19:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF6EF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pAiaQi/D"
Received: by mail-lj1-x22e.google.com with SMTP id 9so3305311ljd.7
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d2kCpNgpV1Us1sS5Z/bRyvGx/S38Rce/udBRavO6Lf4=;
 b=pAiaQi/DOe5VI37J1WZL8wdDYnobnmoDkbM/rJIB6Ztvfpztzu5u+on735OxALpm74
 lWt92dxNoOmnMea7WIS36NrWzLz6dDBkAb7NPAL/Mzojw5e5iiQ8yC9u+DNzQtiCRfg4
 byXy7d/tQQ/M9iUFzLOE/DAevb9rfZyS5VkqQEUSAyIXYIXZIaOzvAxp6Jl8K/p8rKCS
 +LKFJlYZjgQ/JDY5oKYUiyaE6ocYouhSfEdA3bHQn/W8DlSpgfJPsM6lTaKKB6OGv4SV
 kzsejXu2xbtRRP90QJlOsA9yf8QK8x7ltDxKvH6JBo7bUqJcpng2xfdJENmV/NDy86Cj
 fxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d2kCpNgpV1Us1sS5Z/bRyvGx/S38Rce/udBRavO6Lf4=;
 b=PkDWU4Fj7bhkbKuk2+rXiG7aj0h3gg5pI2ipjmtyAVtq/G09dkBC0IOS7tyWVTbb00
 oDo3NAvBRCWK7sRz1Yq+BMmU6P2809ZC/VRIsrzHu6ptUgxBLvPjW3Cqt1BPP6ONapYL
 DuqfnyOnwqGwchUC45Fa2vHUXN2xSZ5aFSkZqIHzx0OeDoAod146sT8FTPmR7KYtJdZl
 LRhvxndIKCdB0QAKa8zVCIzSyzvw5h0AMRlGTMoZjnBGrKleCUCQqs4k+EfTNC9m5gZx
 GquwS9rduNfdyqIhIqAFC2xjP3vLwawYT1YUvT7Z/CUhXFEU0cQ7LyOfuBH1C/k2JENv
 nnOw==
X-Gm-Message-State: AOAM530ZZUamA7B8wvl6Q/EzZ9K97YWevjvfdq4fVOqZyi8C3GJCMph5
 o8FOauIBtzpf3cmDkHGJmRo=
X-Google-Smtp-Source: ABdhPJzLaLYi8RU+Z9F3erPnTXSDwtmFGzk4dCQ3Rl1O/rGe/M9z0Ik7AAb0jXqDVL29+sci+i6S0A==
X-Received: by 2002:a2e:3818:: with SMTP id f24mr51543lja.466.1615485607955;
 Thu, 11 Mar 2021 10:00:07 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id k18sm1014075lfm.88.2021.03.11.10.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 10:00:07 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v4 0/5] Add missing reset controls to NVIDIA Tegra ASoC drivers
Date: Thu, 11 Mar 2021 20:59:53 +0300
Message-Id: <20210311175958.7433-1-digetx@gmail.com>
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

Dmitry Osipenko (4):
  ASoC: tegra20: ac97: Add reset control
  ASoC: tegra20: i2s: Add reset control
  ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
  ASoC: tegra: ahub: Switch to use reset-bulk API

Philipp Zabel (1):
  reset: Add reset_control_bulk API

 drivers/reset/core.c           | 215 ++++++++++++++++++++++
 include/linux/reset.h          | 315 +++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.c |  21 +++
 sound/soc/tegra/tegra20_ac97.h |   1 +
 sound/soc/tegra/tegra20_i2s.c  |  31 ++++
 sound/soc/tegra/tegra20_i2s.h  |   1 +
 sound/soc/tegra/tegra30_ahub.c | 104 ++++-------
 sound/soc/tegra/tegra30_ahub.h |   5 +-
 sound/soc/tegra/tegra30_i2s.c  |  41 ++---
 9 files changed, 636 insertions(+), 98 deletions(-)

-- 
2.29.2


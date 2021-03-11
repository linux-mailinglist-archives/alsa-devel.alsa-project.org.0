Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 710783376C6
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 16:18:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 029171883;
	Thu, 11 Mar 2021 16:17:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 029171883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615475917;
	bh=/UNHYyQOe1wx7jXsrdGrlYI+dw1LED+U+5EporSKJ/0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LiU2lXcVW2nsyNHckVUZ2lDa5iknx1fjShPjkfI1egObzXqTm1VV3vO7qVgzlO5tE
	 bK8na/QToQ2yZSIZmdwXaSVupSVqfGoVxxne+axq1pw268WHkC40CIaUTPuN9owM4M
	 RIRqbfy/0ryTeDeg1VGI+PGQpV9+/W9BiAs4ZWrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1505FF80227;
	Thu, 11 Mar 2021 16:17:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBDC6F80276; Thu, 11 Mar 2021 16:17:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0101F8019B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 16:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0101F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uFfeVaXx"
Received: by mail-lf1-x131.google.com with SMTP id n16so40391854lfb.4
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 07:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+CWL2eeNTaEvB0jQuPhLTAbsCLd3NsiBreGGzW2cpY=;
 b=uFfeVaXxKPI9mw9nMGWki7PhnUs62kQ+YxvX/xZCj2dbVar9p8vsGMdubO4u5mo7/4
 PfOf2ABVcmPPS579y0y04F/+wm98/+H4D3BErvV/XKqzJJtrZQ5CWBE2MoSBOeEayhlP
 In/ZGkV2cvvEP13xLNC1n5Ofs5PWh9mxR1r2qzUWuzP5iqo8qZUNpYQkm+o+CLMYhzLU
 AoOKaTncy/x42DyLS7rKnWhDwb7VZ+814LQ1B8scCe9y0nLEdk5uBPSKjgUf88wt1TpO
 KV11g9CzUyf9ngaqMlaSm1VAgTLS41LUTvDBSNczf9Z593jByI7sAXWS6hP8Zj7BzwbM
 4M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+CWL2eeNTaEvB0jQuPhLTAbsCLd3NsiBreGGzW2cpY=;
 b=PTEfdughMRVkgsblTm5/TPfufSvQZ4YynPG9dOyuaIT53qm7SPJxBmvrwA8OEr84Ei
 7B4IO1m9jA+pOm4t/PiJVKsYdqNwbGLsO7Yl/GV4VqRjVzGZ21zkxdzQum5I30NnxkV0
 lO5PxK1HzRNAGlYeqqWOipDfLG7IWa74uSKLGXiQrmkcVMW1Qb2XX02SCE5BGHoV+CjI
 TGWIz+jWgd5DH/k6aC+mXP8+bBBC7D4bCz03l55Q/rWf4zsMlX0dAl7eRlQmtxlNuVY+
 pVpeeOTyzwyADFBOCrYU24pZqU0hVJnA9AIYJHEW/GztJn0i3+/+6SNglObvEdj0ycSB
 aDpg==
X-Gm-Message-State: AOAM530/xIF15rl9XopcWEP56pWXyTd/7usjdf1VY2F+DK/Uih/pC7P/
 jkBJp3zVkIEgl5PCMYBcfg0=
X-Google-Smtp-Source: ABdhPJxSFPmw78X8rhBkudz4LZD992grPPJ+eluRXMRkArcbOBDeZxExkTV0P8S1FLdgnfKZo3LOaA==
X-Received: by 2002:a19:e08:: with SMTP id 8mr2476210lfo.199.1615475818193;
 Thu, 11 Mar 2021 07:16:58 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id m24sm923138lfq.184.2021.03.11.07.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:16:57 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v2 0/5] Add missing reset controls to NVIDIA Tegra ASoC drivers
Date: Thu, 11 Mar 2021 18:15:49 +0300
Message-Id: <20210311151554.23982-1-digetx@gmail.com>
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

 drivers/reset/core.c           | 215 +++++++++++++++++++++++++
 include/linux/reset.h          | 279 +++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.c |  21 +++
 sound/soc/tegra/tegra20_ac97.h |   1 +
 sound/soc/tegra/tegra20_i2s.c  |  31 ++++
 sound/soc/tegra/tegra20_i2s.h  |   1 +
 sound/soc/tegra/tegra30_ahub.c | 104 +++++-------
 sound/soc/tegra/tegra30_ahub.h |   5 +-
 sound/soc/tegra/tegra30_i2s.c  |  41 ++---
 9 files changed, 600 insertions(+), 98 deletions(-)

-- 
2.29.2


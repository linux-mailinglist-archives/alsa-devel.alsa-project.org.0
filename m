Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F3C394D06
	for <lists+alsa-devel@lfdr.de>; Sat, 29 May 2021 17:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 996FE16D0;
	Sat, 29 May 2021 17:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 996FE16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622303334;
	bh=kBt9sEFep1KdM0pYjv6VSkw32Pl+VAqj7OldA3eD2WU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WblxPlne7hM1u8GnzkEO/t5slyo4nhS5qeSptNMSxpvOhOnN339AZxr9Pxtc9HJUd
	 ahLsS6ZMpDyl9a6S1DGKSHA+pGAwkhrK48EWpjtNKwbZ6OoYpKrU5lFMiQHyWEBrdK
	 UI6eF2CjNTXS/QoEyMv1kF2Jn6bUaBulsKrH31ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D596F804A9;
	Sat, 29 May 2021 17:47:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D65BF8010A; Sat, 29 May 2021 17:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E98FEF80132
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 17:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E98FEF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mRcFb2P0"
Received: by mail-lf1-x136.google.com with SMTP id w33so9856774lfu.7
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69jY18dEEmfg/ZmZabTRCrIvuDBUDZXyA3JOYkZkeGw=;
 b=mRcFb2P0k5/vGofL5Z6ifIaPh1MLPeh+A8QKTudtugZOONYgG0jOYoQk/KzxhvhLfu
 KQDDGsTNC3s8khsw5BXO5qgZGwIO5JOhSVNbW+6P2t+EueqiaQ52nNAuZMtaBBi0qNI/
 e4/gvZtyvEjG3GDM0M5mJdhsqdRtzwFCojSM1uige15JzQLkmP5hhQkBQ5rYNglfZI2G
 4BB56E95lEbYFkYDkzscfLeGKPT6axij8yPU4iub9LtKNwWi8th/kROMJ9eaVnOwxHd2
 FcdezkdjweOLL4fvYsq2EVkXlzbUtMdJGumNsWVfsxucbJZd0QDvpO/M2fHbcC0JHyzL
 lk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69jY18dEEmfg/ZmZabTRCrIvuDBUDZXyA3JOYkZkeGw=;
 b=DOIkQR+EYoyg/sVG7ilQ+H3uE+4OwQdvAcztzhjLYg0oOfUT8/zWTJi606JkGq8buI
 6EFetIV4X70NGudYn8eMD2phNl4vCAUsGQIzC/cBD2nQ5InEQH7cOO56rYnhd/Xj7Jn1
 hh2ixoZtBjfKUBdgSr4EeXtn07IDTYpwMxoyeA1ycedMB+eKAqThJKPTmafBYBhtPaWS
 PQjX7fgix7Tp3CnKH5183UcLqj96i6+1tJncDw4f4rmI62ZIWdG+wdMMxxDoKbmUEcjl
 wR4wTOjixqgmu2V/YQZBJyPsfEoDZJeeHyNniwGpDpH1aKwRBh+1UuP5uhbCHHSQ8SUV
 M2wA==
X-Gm-Message-State: AOAM533J359DVWVncLNYLqG8sEMKtPycjCv2rTxCSrLbZuv6Pi2kPyoG
 8NXBSyL34KDQUjFYMCPmilU=
X-Google-Smtp-Source: ABdhPJxub4O4ti3YHUpNH7X94BqtbHhnVYCK73BCXVrvgQWeio/I30cjJEEadISmn+0wxgOW1GLbgQ==
X-Received: by 2002:a05:6512:a95:: with SMTP id
 m21mr9319762lfu.272.1622303223164; 
 Sat, 29 May 2021 08:47:03 -0700 (PDT)
Received: from localhost.localdomain (46-138-84-89.dynamic.spd-mgts.ru.
 [46.138.84.89])
 by smtp.gmail.com with ESMTPSA id y24sm764005lfg.232.2021.05.29.08.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 08:47:02 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 0/4] Unify NVIDIA Tegra ASoC machine drivers
Date: Sat, 29 May 2021 18:46:45 +0300
Message-Id: <20210529154649.25936-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

This series squashes all the ASoC machine drivers into a single one,
this change was suggested by Jon Hunter. It also sets driver_name and
components string of each card, allowing userspace alsa-lib to find
UCMs at predictable path.

Changelog:

v6: - Fixed missed configuration of AC97 clock rate for the WM9712 codec
      in the unified driver.

    - Added new patch that removes now obsolete "utils" helpers and moves
      code into the unified driver.

        ASoC: tegra: Squash utils into common machine driver

v5: - The v4 removed the customization of components string for Nexus 7,
      but I missed to remove the "components" hook which is unused now,
      it's removed in v5 for consistency.

    - Slightly improved naming of the common 12MHz MCLK rate function
      to make it more consistent with the rest of the driver functions.

v4: - Moved out mclk_rate callback that is currently used only by WM8903
      machine driver from the common driver. This was suggested by Jon Hunter.

    - Dropped patch which was setting custom components string for Nexus 7.
      Jaroslav Kysela wants it to be specified in a device-tree, but the
      components string doesn't have a firm specification for today. It's
      better to drop this change for now since it's optional anyways.

    - Fixed compilation error that was reported by kernel robot for v3.

    - Jaroslav Kysela merged alsa-ucm-conf PR [1] which added UCMs for
      Nexus 7 and Acer A500. The UCMs are fully working using a combination
      of updated kernel + alsa-ucm-conf master + alsa-lib master, meaning
      that they will work with the next releases of kernel and ALSA userspace
      upstream packages.

    - Added ack from Jaroslav Kysela to the "Specify components string for
      each card" patch that he gave to v3.

v3: - Added components string as was suggested by Jaroslav Kysela to v2.

    - Renamed MCLK rate function that is used by max98090 and other codecs
      to make it look more generic. Added option for specifying CLK ID per
      device. This all was suggested by Jon Hunter to v2.

v2: - Dropped use of of_device_compatible_match(), like it was suggested
      by Rob Herring in a review comment to v1.

    - Added patch that sets card's driver_name of as Tegra ASoC drivers.
      In a comment to v1 Jaroslav Kysela suggested that the Tegra drivers
      don't set the card name properly and he was right.

      I opened pull request with the new Tegra UCMs and updated lookup paths
      for older UCMs [1].

      [1] https://github.com/alsa-project/alsa-ucm-conf/pull/92

Dmitry Osipenko (4):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers
  ASoC: tegra: Specify components string for each card
  ASoC: tegra: Squash utils into common machine driver

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  19 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 --------
 sound/soc/tegra/tegra_asoc_machine.c | 854 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  49 ++
 sound/soc/tegra/tegra_asoc_utils.c   | 225 -------
 sound/soc/tegra/tegra_asoc_utils.h   |  38 --
 sound/soc/tegra/tegra_max98090.c     | 276 ---------
 sound/soc/tegra/tegra_rt5640.c       | 222 -------
 sound/soc/tegra/tegra_rt5677.c       | 324 ----------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 -------
 sound/soc/tegra/tegra_wm8753.c       | 185 ------
 sound/soc/tegra/tegra_wm8903.c       | 351 +++--------
 sound/soc/tegra/tegra_wm9712.c       | 166 ------
 sound/soc/tegra/trimslice.c          | 172 ------
 15 files changed, 996 insertions(+), 2367 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_asoc_utils.c
 delete mode 100644 sound/soc/tegra/tegra_asoc_utils.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c

-- 
2.30.2


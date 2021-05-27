Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAC3935B3
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 20:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E53C1705;
	Thu, 27 May 2021 20:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E53C1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622141822;
	bh=qh7NnWS4rCWVBFb+LoYblGlHBJRLOun1bLNLb5Sy7nk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tt5SBLi8t7XoVushCGCSoBBFVAmj+kXACq/6KJItuJwrI2fY2oOQIOPGB775tbeQq
	 VQnJfpjtPpnsvf+BTwQjDDSO5tSVuXsH1JOWnimpInOKY+frQPGMRkF1lcKq+asf6Z
	 T6qJjfTbQ0bfy/Vh/PXKl9L29gXfUc7oN7N55OlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 545CEF80147;
	Thu, 27 May 2021 20:55:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E2A2F8014B; Thu, 27 May 2021 20:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F04CAF8012E
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 20:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F04CAF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NjJl+5ls"
Received: by mail-lf1-x12e.google.com with SMTP id q7so1595546lfr.6
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 11:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=prIWqm0qX1apyyRreQLe2vDKFQUK50Nuu3llPiwjrjk=;
 b=NjJl+5lsWY+hx+wQt/sAnmlHnk46mxtRQdMsgZF94ErSZfAAz47u9IexHk4BUPXPwK
 bYURbgAC7ctwtFFA5FoaK2AFITwSMvIyPWZTCVhBdb3mOUvvGezhK/LsQVPrHZE1jmmZ
 0HufmaJgR+r2rWgXQwB2tejsm29c8HVWzP0ztUiqwsG1izWh4704xhfkkgSe0YriNNCu
 JFyikH9auQXOEmFknxHG720Nou2H1q+NwLU2Ds5JgXy0dJSQRdjV22gPjjPrOdn1dgUM
 19wA4nvnHpd+CUSZTJPki9w/hU6KhXAMQS9oKkmUeEra/gmZJitnflVDkr7+ywHOqV0L
 OYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=prIWqm0qX1apyyRreQLe2vDKFQUK50Nuu3llPiwjrjk=;
 b=Nj16UPXrHWKaLTyKh2KGJfBwZ0BUZt/ksvYNXFqy+eWfZGNvCZ1qONteuAZHkuGUm6
 L4VZIWiL1uznujHjmJgZ/Dyk8xJ4dCyWJZsOPnD/ZIwoUH0erun7jxyCCHDyzgqFqO+c
 nHtIKQKDz9TS2yaGt+O5rYsNKDtJ0sUvtBMxIrK8i5iZh+29kDQT21Jq0BVTxUwAkTGe
 j0ekrU0CSeRzHfx24qfH+fK/YNL99j058aVCUwxx1irUN/bnTmeAXUn0jYxEWIcHLc/K
 jod4lhO/akLwpu/rRbq1y1929JqZCaUpBW1n8SyJp3k9SE37PkwGzRldS8ANZ74sj4UT
 hu7A==
X-Gm-Message-State: AOAM530EbeTe7wY1WLBgnU1vZiDG5tyTNCJ2nLqQH2hvs/Q80kVvh4FK
 H/9xEXi2nt6+DMQdu4hnwj0=
X-Google-Smtp-Source: ABdhPJwVWtdfi/RP6saas2p2ENxKBNBSbx70wytT9yzqXssJFFChMdhm1ciWIzljFn+pYkzHjG0OpQ==
X-Received: by 2002:ac2:46cd:: with SMTP id p13mr3159839lfo.564.1622141728867; 
 Thu, 27 May 2021 11:55:28 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru.
 [46.138.12.55])
 by smtp.gmail.com with ESMTPSA id p16sm265217lfc.113.2021.05.27.11.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 11:55:28 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 0/3] Unify NVIDIA Tegra ASoC machine drivers
Date: Thu, 27 May 2021 21:51:22 +0300
Message-Id: <20210527185125.18720-1-digetx@gmail.com>
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

Dmitry Osipenko (3):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers
  ASoC: tegra: Specify components string for each card

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ----------
 sound/soc/tegra/tegra_asoc_machine.c | 714 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  46 ++
 sound/soc/tegra/tegra_max98090.c     | 276 -----------
 sound/soc/tegra/tegra_rt5640.c       | 222 ---------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 351 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 -------
 sound/soc/tegra/trimslice.c          | 172 -------
 13 files changed, 853 insertions(+), 2103 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c

-- 
2.30.2


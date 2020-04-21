Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071A1B31DC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 23:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A4F16C9;
	Tue, 21 Apr 2020 23:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A4F16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587504199;
	bh=kJ6FYcQjswI1ftVVPnhOBdcV8lBKm4np5uypm78flfM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oKNsStVfMwrh/tosgqRXUi7QKN+WXFz1f9OKXSOVTW55TG5hpdEJqbLl7IMlMZL1v
	 QzkpmOtgbLF6q5A5dvDEJ5m2f0V6NQPBr9d+zIRJRCI4KENehTSXKWLSP0JG45Rxkl
	 L8XH6b06XmIlMlbMHFxXtHQpkjhW4wC1mDQJ44oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C53AF801ED;
	Tue, 21 Apr 2020 23:21:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41CCEF801EC; Tue, 21 Apr 2020 23:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B522F800FF
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 23:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B522F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XIKtgmre"
Received: by mail-wm1-x342.google.com with SMTP id t63so4984329wmt.3
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TK7n//gPeG36lihND5HMtLgm//L8iTOGVH+6m3LoRfw=;
 b=XIKtgmreyS0Cr6MKPOKrYxqNc93UbzcWrhNvLYFT9vLZAJagyeJmTIQ8Pm6cD7ezdx
 YuSb9y/DnY/LbqShUXWjH1D/onnkNjCoYWLZ0dxFZABe5sx7vS4Aqb+dfLMKUJTRWbnH
 5C8mmPYlFP52as320wX32lNV88wLvHtEG69BFpT8ikKSIqwSrgdXHbxqSnEnpdtP1CDn
 RImCkCDSIg8OFs0iBA8I6UYsDPm1hJlLz7wVj/DmxOmpK7U6G//o6WIbS5/7eL9jNb/p
 cK/zTDFubnJx7n+7DlAplKXWQN5lvh8PajC5LUnyFvlsvVPJLQnZfzhwq9QLajgPLZcV
 Ia5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TK7n//gPeG36lihND5HMtLgm//L8iTOGVH+6m3LoRfw=;
 b=fzTXBbIG3iJ6570dwfdUUMyOOBakTZYN7lo5PPBPJZpyNigQX0VXw1fJLoNRWZDThm
 QUFdtH05Lr1cyN7D4E2Z3PZBtFrrRCjOcrZd9XrmHIy9PFvium8ss+rTBnWDY3v0RzCe
 IMTNlt3ZTRnHRglWRw8VG+doKyPWXh+r4fL/W8W1UVbs0O1J9H1fPaNUez+hw0+1MmEX
 s9goKTQe20AKaByqq5kRafAnHtvP89LHg8U2QpHqvI9LNFqg98ETgrjdiCK3zz+lOz/O
 ptvXSamjn1doj9i3KBZI3KulSK4BcGiGvFGTRKDM5TwgXbQrJhm8UThwhvJjfK9iqS65
 adag==
X-Gm-Message-State: AGi0PuaRdRcaINH67OnnmL2bam/I7cE5lSnEmdU2xiTKJ4W/33jA+T4e
 9TuxGDshvCht+RUzQ+0lr1w=
X-Google-Smtp-Source: APiQypJHCYt/qQSBjjIeoumdlZTCo2ETQ8TRw1e0/LrPSZlVZ38YwA2+3pNHXDSq+tHbVExjrJwweA==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr6630963wmj.40.1587504091656;
 Tue, 21 Apr 2020 14:21:31 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
 by smtp.gmail.com with ESMTPSA id c190sm5252751wme.10.2020.04.21.14.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 14:21:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC: tegra: Fixes for v5.7-rc3
Date: Tue, 21 Apr 2020 23:21:21 +0200
Message-Id: <20200421212121.3286517-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
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

Hi Liam, Mark,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-asoc

for you to fetch changes up to ff5d18cb04f4ecccbcf05b7f83ab6df2a0d95c16:

  ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init() (2020-04-21 16:53:15 +0200)

This is a set of patches that I was supposed to send out during the
merge window[0], but I somehow messed up my scripts and then didn't
notice that this was missing. I've rebased these patches on top of
v5.7-rc1.

The lack of these are now causing some issues with unbalanced clock
reference counts.

Is there any chance you can pick these up for v5.7-rc3?

Thanks,
Thierry

[0]: https://lore.kernel.org/lkml/20200327154506.GF4437@sirena.org.uk/

----------------------------------------------------------------
ASoC: tegra: Fixes for v5.7-rc3

This contains a couple of fixes that are needed to properly reconfigure
the audio clocks on older Tegra devices.

----------------------------------------------------------------
Sowjanya Komatineni (4):
      ASoC: tegra: Use device managed resource APIs to get the clock
      ASoC: nau8825: Change Tegra clk_out_2 provider to PMC
      ASoC: tegra: Add audio mclk parent configuration
      ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()

 .../devicetree/bindings/sound/nau8825.txt          |   2 +-
 sound/soc/tegra/tegra_alc5632.c                    |   7 +-
 sound/soc/tegra/tegra_asoc_utils.c                 | 113 ++++++++++-----------
 sound/soc/tegra/tegra_asoc_utils.h                 |   1 -
 sound/soc/tegra/tegra_max98090.c                   |  22 ++--
 sound/soc/tegra/tegra_rt5640.c                     |  22 ++--
 sound/soc/tegra/tegra_rt5677.c                     |   7 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |   7 +-
 sound/soc/tegra/tegra_wm8753.c                     |  22 ++--
 sound/soc/tegra/tegra_wm8903.c                     |  22 ++--
 sound/soc/tegra/tegra_wm9712.c                     |   8 +-
 sound/soc/tegra/trimslice.c                        |  18 +---
 12 files changed, 90 insertions(+), 161 deletions(-)

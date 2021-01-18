Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36E2FA7F8
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 18:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71CA21850;
	Mon, 18 Jan 2021 18:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71CA21850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610992468;
	bh=qrNissM/Gt4Wl59RnAeE37h9nZV3vlaUkSqY6dVpNoU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GCTioAabdOdvRyCn5bmDHGoaOu3TmC1HW7F/cqz/cp01PW6RGqWcur5dAd7V3RBFR
	 OZ97mATk2bFbz82MccBc95VBRL5OI29iPCcR4o9zZgKIBQxRKh3pceE6ANTD68dEDS
	 of3NgxbPglIrcQnH5CznvU9SLo5ew1ExvYi/JFiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06A15F8019D;
	Mon, 18 Jan 2021 18:52:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0577CF8016E; Mon, 18 Jan 2021 18:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6881BF800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 18:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6881BF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TdfP5h1C"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CB0520829;
 Mon, 18 Jan 2021 17:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610992367;
 bh=qrNissM/Gt4Wl59RnAeE37h9nZV3vlaUkSqY6dVpNoU=;
 h=From:To:Cc:Subject:Date:From;
 b=TdfP5h1C1tuqf/WeBReeslNF222c0xqDREE35l2zMrCyRVPDsZY56aRC1tGnm4GiT
 z5nodatH940km33djW6YpwGugJ3mSns8F9ibh8rgqNyV/kcShJ/MWn5zGaU5e3gnxs
 G5qysWYODmyRvm4GOYelSAYj79qo00Yv7fbyF0D9naaSXUqGmLmKgq9fH+DXJZhhZ9
 UpHw8jCO+NYoUsWuD6BD5KaapmR3+jxhUj/kAS/OoWHpbbVdOpC66zblnwVsGHhZIN
 9wYfcofpXJR4rCj0U0qK5SBZRCkEmg6rKmGFDPls9CzYb048u1H6vIWTMC8NFpjWRo
 pEJZT01ZLgydg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.11-rc4
Date: Mon, 18 Jan 2021 17:51:57 +0000
Message-Id: <20210118175247.3CB0520829@mail.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.11-rc4

for you to fetch changes up to 7505c06dabb5e814bda610c8d83338544f15db45:

  MAINTAINERS: update qcom ASoC drivers list (2021-01-15 17:25:35 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.11

A few more fixes for v5.11, mostly around HDA jack detection, plus
a couple of updates to the MAINTAINERS entries.

----------------------------------------------------------------
Kai Vehmanen (1):
      ASoC: SOF: Intel: fix page fault at probe if i915 init fails

Kai-Heng Feng (3):
      ASoC: SOF: Intel: hda: Resume codec to do jack detection
      ASoC: SOF: Intel: hda: Modify existing helper to disable WAKEEN
      ASoC: SOF: Intel: hda: Avoid checking jack on system suspend

Mark Brown (1):
      Merge v5.11-rc3

Mauro Carvalho Chehab (1):
      MAINTAINERS: update references to stm32 audio bindings

Srinivas Kandagatla (2):
      MAINTAINERS: update maintainers of qcom audio
      MAINTAINERS: update qcom ASoC drivers list

Stephan Gerhold (1):
      ASoC: hdmi-codec: Fix return value in hdmi_codec_set_jack()

 .../bindings/sound/ti,j721e-cpb-audio.yaml         |  4 +-
 .../bindings/sound/ti,j721e-cpb-ivi-audio.yaml     |  4 +-
 MAINTAINERS                                        | 18 +++++---
 sound/soc/amd/raven/pci-acp3x.c                    | 16 ++-----
 sound/soc/amd/renoir/rn-pci-acp3x.c                | 14 ++++++
 sound/soc/atmel/Kconfig                            |  4 +-
 sound/soc/codecs/Kconfig                           |  2 +-
 sound/soc/codecs/hdmi-codec.c                      |  2 +-
 sound/soc/codecs/max98373-i2c.c                    | 20 +++++++++
 sound/soc/codecs/max98373-sdw.c                    | 20 +++++++++
 sound/soc/codecs/max98373.c                        | 34 +++++++++++++--
 sound/soc/codecs/max98373.h                        |  8 ++++
 sound/soc/codecs/rt711.c                           |  6 +++
 sound/soc/fsl/imx-hdmi.c                           |  3 +-
 sound/soc/intel/boards/haswell.c                   |  1 +
 sound/soc/intel/skylake/cnl-sst.c                  |  1 +
 sound/soc/meson/axg-tdm-interface.c                | 14 +++++-
 sound/soc/meson/axg-tdmin.c                        | 13 +-----
 sound/soc/qcom/lpass-cpu.c                         | 20 +--------
 sound/soc/qcom/lpass-platform.c                    | 50 +++++++++++++++-------
 sound/soc/sh/rcar/adg.c                            | 18 ++++----
 sound/soc/soc-dapm.c                               |  1 +
 sound/soc/sof/Kconfig                              |  2 +-
 sound/soc/sof/intel/hda-codec.c                    | 37 ++++++++--------
 sound/soc/sof/intel/hda-dsp.c                      |  9 ++--
 sound/soc/sof/intel/hda.h                          |  2 +-
 26 files changed, 217 insertions(+), 106 deletions(-)

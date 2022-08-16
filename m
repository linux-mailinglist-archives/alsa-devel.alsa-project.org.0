Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97A5959DB
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 13:23:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D701651;
	Tue, 16 Aug 2022 13:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D701651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660649023;
	bh=QY7qEnBPxJcLJBB5Xbu88inxpJQ6zgpeVPbXNOce7EQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WmMNHKrTCAUwgk1ZGk+2md2HKUtvv/zZKu7RPKCFr6CuYI20VoKCAxFCmF0MLPIlG
	 m7SdSuCa/47pEkLLZINN0mUrI/vg//9ucJ/+1E9AAGhK6uzVvTS/DhB3EF+P3cqv63
	 KID5u5VVshyse+kDgGbu+RMf1+IFOFSZVHeVAkZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABC1FF80424;
	Tue, 16 Aug 2022 13:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80036F8032D; Tue, 16 Aug 2022 13:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E523AF80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 13:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E523AF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g/w5HGcn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9287D611DD;
 Tue, 16 Aug 2022 11:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99086C433B5;
 Tue, 16 Aug 2022 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660648958;
 bh=QY7qEnBPxJcLJBB5Xbu88inxpJQ6zgpeVPbXNOce7EQ=;
 h=From:To:Cc:Subject:Date:From;
 b=g/w5HGcnOdbpIVNjTY0VrFv8NiRewNwmm84jeWDPk+0v8nOj+zaaX6BKo6riFqEY4
 FXlJEiGIdZjRnOp/QpPJFu1Fxf+ke0QjOzDdc2/L9To4iQQRjLp/lNKMeusCFxKZpx
 1QDEUXtrAWKwcXbNxftWMWxxNJHU6kbXaFUuNFsZ6B79Gayqo97I2ZC2Cgw2LHlgKX
 6s07uuJLgPMQwtMACAenT34l1TmuXCOH90wg7B+pABRiIu8sVVpBG+sTJGs/x5Y02X
 G53w1v2yVBu6Et4OGxpC4/R67vA/jJa7qk6CuMOX/qlGiSj3HNMCiIyw3L/25kAr78
 I783LlDsntvvA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.0-rc1
Date: Tue, 16 Aug 2022 12:22:22 +0100
Message-Id: <20220816112237.99086C433B5@smtp.kernel.org>
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

The following changes since commit 40d060b8158e26438398bf1132925f666e3b6480:

  ASoC: q6asm: use kcalloc() instead of kzalloc() (2022-07-28 11:59:10 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.0-rc1

for you to fetch changes up to b4b5f29a076e52181f63e45a2ad1bc88593072e3:

  ASoC: codec: tlv320aic32x4: fix mono playback via I2S (2022-08-10 14:52:05 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.0

A relatively large batch of fixes that came in since my pull request,
none of them too major and mostly device specific apart from a series of
security/robustness improvements from Takashi.

----------------------------------------------------------------
Biju Das (1):
      ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe() error path

Justin Stitt (1):
      ASoC: SOF: ipc3-topology: Fix clang -Wformat warning

Mark Brown (2):
      ASoC: Fix theoretical buffer overflow by snprintf()
      TAS2770 fixes

Martin Povišer (4):
      ASoC: tas2770: Set correct FSYNC polarity
      ASoC: tas2770: Allow mono streams
      ASoC: tas2770: Drop conflicting set_bias_level power setting
      ASoC: tas2770: Fix handling of mute/unmute

Oder Chiou (1):
      ASoC: rt5640: Fix the JD voltage dropping issue

Philipp Zabel (1):
      ASoC: codec: tlv320aic32x4: fix mono playback via I2S

Pierre-Louis Bossart (1):
      ASoC: Intel: fix sof_es8336 probe

Takashi Iwai (4):
      ASoC: Intel: avs: Fix potential buffer overflow by snprintf()
      ASoC: SOF: debug: Fix potential buffer overflow by snprintf()
      ASoC: SOF: Intel: hda: Fix potential buffer overflow by snprintf()
      ASoC: DPCM: Don't pick up BE without substream

syed sabakareem (1):
      ASoC: amd: yc: Update DMI table entries for AMD platforms

 sound/soc/amd/yc/acp6x-mach.c       | 28 +++++++++++
 sound/soc/codecs/rt5640.c           |  5 +-
 sound/soc/codecs/tas2770.c          | 98 ++++++++++++++++---------------------
 sound/soc/codecs/tas2770.h          |  5 ++
 sound/soc/codecs/tlv320aic32x4.c    |  9 ++++
 sound/soc/intel/avs/pcm.c           |  4 +-
 sound/soc/intel/boards/sof_es8336.c |  4 +-
 sound/soc/sh/rz-ssi.c               | 26 +++++-----
 sound/soc/soc-pcm.c                 |  3 ++
 sound/soc/sof/debug.c               |  6 +--
 sound/soc/sof/intel/hda.c           |  2 +-
 sound/soc/sof/ipc3-topology.c       |  2 +-
 12 files changed, 116 insertions(+), 76 deletions(-)

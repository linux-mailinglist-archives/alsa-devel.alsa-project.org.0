Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EFA67EDF0
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 20:01:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8200F829;
	Fri, 27 Jan 2023 20:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8200F829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674846082;
	bh=O+tD5fblGsqRDBL6erGYbOCFHwVJLL8ot69itGrgjbc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PfHqIacI+X1XheoQRyCwUxKfnw/60xG+kg5Pl0GTyDfQylzvJZBkzxH6NwjkNSICB
	 K/ZnceAPryrW861GkNnHSuYxwiOB4ji5MSB3RLgZA0fqZDNjxFhor1LM+R2+0lN7M1
	 3RgtvyNUNJ13mv+TiSpzlb6f19DS+ZJHjJ4+QqYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B07A0F8007C;
	Fri, 27 Jan 2023 20:00:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45D91F80272; Fri, 27 Jan 2023 20:00:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 707ABF8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 20:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 707ABF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TYeIFbNV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E21FB821AD;
 Fri, 27 Jan 2023 19:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA13C433EF;
 Fri, 27 Jan 2023 19:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674846005;
 bh=O+tD5fblGsqRDBL6erGYbOCFHwVJLL8ot69itGrgjbc=;
 h=From:To:Cc:Subject:Date:From;
 b=TYeIFbNVGu9QLH2tuzIBKj/4go3FwI0f4/YcW1zB44aUQUlKGfey4fEiWlVpIZ+29
 j9aUR0qrJa2b71KXDBtHa/d+shvwqfMN4t1ZIMmVEphscchm5C09O5bwO+gokFvYnr
 9tKrUUeDag6/5rx1IMAD//cHnurUb1MWWarQzUer+QJrvuBEWw5xJNT21NXAklUpPn
 P0LknPJKZnnEwgIo86XqMUAD9qnWKORxrpEEWJfFCibG3SxNW8G5nBPXeKnBD71pi3
 JzCZGPy5cs9wUXSlXCfAsq6xHVsZfXVjLHCDQ8ECMOp7AEww5MWuRaScaKsvkMbuhY
 ebzFkox4Hhl8A==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.2-rc5
Date: Fri, 27 Jan 2023 18:59:49 +0000
Message-Id: <20230127190002.2BA13C433EF@smtp.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The following changes since commit 242fc66ae6e1e2b8519daacc7590a73cd0e8a6e4:

  ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets (2023-01-10 12:45:22 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.2-rc5

for you to fetch changes up to e18c6da62edc780e4f4f3c9ce07bdacd69505182:

  ASoC: cs42l56: fix DT probe (2023-01-26 17:42:36 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.2

An unfortunately large batch of fixes here, the numbers amplified
by several repeated fixes for patterns of bugs in multiple
drivers.  Most of this is in the x86 drivers which are very
actively developed, the implementation of PCI shutdown is a fix
for issues with spamming warnings into the logs with a leaked
reference to the i915 driver.

----------------------------------------------------------------
Amadeusz Sławiński (1):
      ASoC: Intel: avs: Implement PCI shutdown

Andy Shevchenko (6):
      ASoC: amd: acp-es8336: Drop reference count of ACPI device after use
      ASoC: Intel: bytcht_es8316: Drop reference count of ACPI device after use
      ASoC: Intel: bytcr_rt5651: Drop reference count of ACPI device after use
      ASoC: Intel: bytcr_rt5640: Drop reference count of ACPI device after use
      ASoC: Intel: bytcr_wm5102: Drop reference count of ACPI device after use
      ASoC: Intel: sof_es8336: Drop reference count of ACPI device after use

Arnd Bergmann (1):
      ASoC: cs42l56: fix DT probe

Bard Liao (3):
      ASoC: SOF: sof-audio: start with the right widget type
      ASoC: SOF: sof-audio: unprepare when swidget->use_count > 0
      ASoC: SOF: keep prepare/unprepare widgets in sink path

Dan Carpenter (1):
      ASoC: SOF: ipc4-mtrace: prevent underflow in sof_ipc4_priority_mask_dfs_write()

Krzysztof Kozlowski (1):
      ASoC: codecs: wsa883x: correct playback min/max rates

Kuninori Morimoto (1):
      ASoC: hdmi-codec: zero clear HDMI pdata

Mark Brown (2):
      ASoC: SOF: sof-audio: Fixes for widget prepare and
      ASoC: Intel: set dpcm_capture for amps

Peter Ujfalusi (1):
      ASoC: SOF: sof-audio: prepare_widgets: Check swidget for NULL on sink failure

Pierre-Louis Bossart (4):
      ASoC: Intel: sof_rt5682: always set dpcm_capture for amplifiers
      ASoC: Intel: sof_cs42l42: always set dpcm_capture for amplifiers
      ASoC: Intel: sof_nau8825: always set dpcm_capture for amplifiers
      ASoC: Intel: sof_ssp_amp: always set dpcm_capture for amplifiers

Ranjani Sridharan (1):
      ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL

Syed Saba Kareem (1):
      ASoC: amd: yc: Add DMI support for new acer/emdoor platforms

fengwk (1):
      ASoC: amd: yc: Add Xiaomi Redmi Book Pro 15 2022 into DMI table

 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |  1 +
 sound/soc/amd/acp-es8336.c                         |  6 ++++--
 sound/soc/amd/yc/acp6x-mach.c                      | 21 +++++++++++++++++++
 sound/soc/codecs/cs42l56.c                         |  6 ------
 sound/soc/codecs/wsa883x.c                         |  4 ++--
 sound/soc/intel/avs/core.c                         | 24 ++++++++++++++++++++++
 sound/soc/intel/boards/bytcht_es8316.c             | 20 ++++++++++--------
 sound/soc/intel/boards/bytcr_rt5640.c              | 12 +++++------
 sound/soc/intel/boards/bytcr_rt5651.c              |  2 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |  2 +-
 sound/soc/intel/boards/sof_cs42l42.c               |  3 +++
 sound/soc/intel/boards/sof_es8336.c                | 14 +++++++------
 sound/soc/intel/boards/sof_nau8825.c               |  5 +++--
 sound/soc/intel/boards/sof_rt5682.c                |  5 +++--
 sound/soc/intel/boards/sof_ssp_amp.c               |  5 ++---
 sound/soc/sof/ipc4-mtrace.c                        |  7 ++++---
 sound/soc/sof/sof-audio.c                          | 16 ++++++++-------
 17 files changed, 104 insertions(+), 49 deletions(-)

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AA460E9C9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 22:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31185380D;
	Wed, 26 Oct 2022 22:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31185380D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666814698;
	bh=lZoDHy/vgZYUOs20iefMpu03O0wQLw25ZgLEmxWaqbo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QRhYghnHos/hjI4YoUfGBYYsNO28tH7CuUMn1nof1Vk2AnXlUP1DMaR5sNmAbuRKW
	 2BXCADwB5qkroGN8TNKakdSl3nP1MBDl5Mzgx5l+U/rIrDqVk8hC67VLp0IRNq4Z1m
	 r9ceE51+uEcm+y1zsyWP6RCeNgoqxJxCKFa10+Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90CDBF80271;
	Wed, 26 Oct 2022 22:04:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92B72F80240; Wed, 26 Oct 2022 22:04:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA8ADF80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 22:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA8ADF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eyJTK5Ls"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 667C962092;
 Wed, 26 Oct 2022 20:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE50C433C1;
 Wed, 26 Oct 2022 20:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666814635;
 bh=lZoDHy/vgZYUOs20iefMpu03O0wQLw25ZgLEmxWaqbo=;
 h=From:To:Cc:Subject:Date:From;
 b=eyJTK5Lsu5iIOCwLWHuxYuTJdErzIhGLaMO39NQ617ojT7PdA/6gCBI0GXUYkUZ8d
 rNNfYNiFLZ5G6C0C+7wxbv4dYQ5vTk0Jk2vYGtnkBR2p++Jd3fzviyByDJvNi7xVG/
 Og2F6VQSLrrqaNZ/l5Xor6rYJGt2yo2Ns7u2NbTm5ml/IRW1ztqc5yzZjX1lAi5hh0
 9eqB58X/Rp2KuD07n4ARF9yhH14NvFGkJLu139MTMAekCaHtUgC8KJcm4aTnj/WtPx
 x+CIBKCwYAzLC7M9EkUbi0o5jv04R0BctSahK+loz13NgWHpqJbJxS/aC6CPKKGNkD
 TfWtPFXjxOK5g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.1-rc2
Date: Wed, 26 Oct 2022 21:03:49 +0100
Message-Id: <20221026200355.6FE50C433C1@smtp.kernel.org>
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.1-rc2

for you to fetch changes up to e9441675edc1bb8dbfadacf68aafacca60d65a25:

  ASoC: SOF: Intel: hda-codec: fix possible memory leak in hda_codec_device_init() (2022-10-21 13:04:14 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.1

Quite a few fixes here, a lot driver specific, plus some new quirks.
There was a bit of a mess with the runtime PM handling due to some
confusion in the API there which resulted in a number of commits and
reverts but that should all be stable now.

----------------------------------------------------------------
Aidan MacDonald (1):
      ASoC: simple-card: Fix up checks for HW param fixups

Colin Ian King (1):
      ASoC: codecs: jz4725b: Fix spelling mistake "Sourc" -> "Source", "Routee" -> "Route"

Derek Fang (2):
      ASoC: rt5682s: Fix the TDM Tx settings
      ASoC: rt1019: Fix the TDM settings

Geert Uytterhoeven (1):
      ASoC: codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in __exit_p()

Jiangshan Yi (1):
      ASoC: cx2072x: fix spelling typo in comment

Kai Vehmanen (1):
      ASoC: SOF: ipc4-mtrace: protect per-core nodes against multiple open

Leohearts (1):
      ASoC: amd: yc: Add Lenovo Thinkbook 14+ 2022 21D0 to quirks table

Mark Brown (2):
      ASoC: wmxxxx: Revert old "ASoC: wmxxxx: Fix PM disable depth imbalance in wmxxxx_probe"
      ASoC: jz4752b: Capture fixes

Peter Ujfalusi (1):
      Revert "ASoC: soc-component: using pm_runtime_resume_and_get instead of pm_runtime_get_sync"

Pierre-Louis Bossart (3):
      ASoC: Intel: sof_sdw: add quirk variant for LAPBC710 NUC15
      ASoC: SOF: Intel: pci-mtl: fix firmware name
      ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor

Randy Dunlap (2):
      ASoC: codec: tlv320adc3xxx: add GPIOLIB dependency
      ASoC: qcom: SND_SOC_SC7180 optionally depends on SOUNDWIRE

Shuming Fan (2):
      ASoC: rt1308-sdw: update the preset settings
      ASoC: rt1308-sdw: add the default value of some registers

Siarhei Volkau (4):
      ASoC: codecs: jz4725b: add missed Line In power control bit
      ASoC: codecs: jz4725b: fix reported volume for Master ctl
      ASoC: codecs: jz4725b: use right control for Capture Volume
      ASoC: codecs: jz4725b: fix capture selector naming

Srinivasa Rao Mandadapu (2):
      ASoC: qcom: lpass-cpu: mark HDMI TX registers as volatile
      ASoC: qcom: lpass-cpu: Mark HDMI TX parity register as volatile

Xiaolei Wang (1):
      ASoC: wm8962: Add an event handler for TEMP_HP and TEMP_SPK

Yang Yingliang (2):
      ASoC: Intel: Skylake: fix possible memory leak in skl_codec_device_init()
      ASoC: SOF: Intel: hda-codec: fix possible memory leak in hda_codec_device_init()

Yong Zhi (1):
      ASoC: Intel: sof_rt5682: Add quirk for Rex board

Zhang Qilong (7):
      ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
      ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
      ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
      ASoC: wm5102: Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
      ASoC: wm5110: Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
      ASoC: wm8997: Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"
      ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe

linkt (1):
      ASoC: amd: yc: Adding Lenovo ThinkBook 14 Gen 4+ ARA and Lenovo ThinkBook 16 Gen 4+ ARA to the Quirks List

 include/sound/simple_card_utils.h     |  1 +
 sound/soc/amd/yc/acp6x-mach.c         | 21 ++++++++++++++
 sound/soc/codecs/Kconfig              |  1 +
 sound/soc/codecs/cx2072x.h            |  2 +-
 sound/soc/codecs/jz4725b.c            | 34 ++++++++++++----------
 sound/soc/codecs/mt6660.c             |  8 +++---
 sound/soc/codecs/rt1019.c             | 20 +++++++------
 sound/soc/codecs/rt1019.h             |  6 ++++
 sound/soc/codecs/rt1308-sdw.c         | 17 +++++++++--
 sound/soc/codecs/rt1308-sdw.h         |  3 ++
 sound/soc/codecs/rt1308.h             |  5 ++++
 sound/soc/codecs/rt5682s.c            | 15 ++++++++--
 sound/soc/codecs/rt5682s.h            |  1 +
 sound/soc/codecs/tlv320adc3xxx.c      |  2 +-
 sound/soc/codecs/wm5102.c             |  7 +++--
 sound/soc/codecs/wm5110.c             |  7 +++--
 sound/soc/codecs/wm8962.c             | 54 +++++++++++++++++++++++++++++++++--
 sound/soc/codecs/wm8997.c             |  7 +++--
 sound/soc/generic/audio-graph-card.c  |  2 +-
 sound/soc/generic/simple-card-utils.c | 15 ++++++++++
 sound/soc/generic/simple-card.c       |  3 +-
 sound/soc/intel/boards/sof_rt5682.c   | 12 ++++++++
 sound/soc/intel/boards/sof_sdw.c      | 11 +++++++
 sound/soc/intel/skylake/skl.c         |  8 +-----
 sound/soc/qcom/Kconfig                |  1 +
 sound/soc/qcom/lpass-cpu.c            | 10 +++++++
 sound/soc/soc-component.c             |  6 ++--
 sound/soc/sof/intel/hda-codec.c       |  8 +-----
 sound/soc/sof/intel/pci-mtl.c         |  2 +-
 sound/soc/sof/intel/pci-tgl.c         | 30 ++++++++++++++++++-
 sound/soc/sof/ipc4-mtrace.c           | 20 +++++++++++--
 31 files changed, 270 insertions(+), 69 deletions(-)

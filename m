Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C14A60C1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 16:53:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A941782;
	Tue,  1 Feb 2022 16:52:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A941782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643730786;
	bh=C/W+eoGgeQdTUJS9AlbbhCnFAZhNx1Z7OSbCGKznQY0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bGgHfB8UfAiU8GgE2d7jLrRBfgmgvp3Hl/ztem7dbapX5nH5hq+OKudQr7oCIsJ1p
	 0zBOQhktCMWffeBwWu3cP+qJa8+8GPkAq1/RlDfU1g5v7iJSOdK8q0zVM8gLRnyOr2
	 snoTIR73yyDxOHVu2+OXFqf8FB6G3DaBuUAYsi9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5491F80095;
	Tue,  1 Feb 2022 16:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5777F80130; Tue,  1 Feb 2022 16:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21285F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 16:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21285F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hf7bsek+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B7B2616F1;
 Tue,  1 Feb 2022 15:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE80EC340EB;
 Tue,  1 Feb 2022 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643730711;
 bh=C/W+eoGgeQdTUJS9AlbbhCnFAZhNx1Z7OSbCGKznQY0=;
 h=From:To:Cc:Subject:Date:From;
 b=hf7bsek+MykDK8mfjbP21HaohzgwUUd6zhQuUgJPsMr/u2HXbSWxrOViG21rdpu1l
 VgjY39bSP24nvvkLGZQW9xvcaf4g8F8zyakdCvFPDwxAMq8UdVIlE9xqXxFTxiUPri
 cRBSFDGGR3ccCp0QfUVw7gBBO4oAalkKmEQmTJwI8mnC0de2RCZbybOPoRafjwtVx3
 5eN8E7Cnx+WgJM+xfJte4wnQm7AWi8RTK05JJxdqYPtYwVFJCUY+cxmPMW12on0cRG
 fKcfNTihDhJcOXZRYh0PEfVzuxklf80gPEt+eznTBTScBskOLJookkkVXtlw499bBE
 2KNr376hPRPdQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.17-rc2
Date: Tue, 01 Feb 2022 15:51:38 +0000
Message-Id: <20220201155150.EE80EC340EB@smtp.kernel.org>
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

The following changes since commit f517ba4924ad026f2583553db02f3c8bc69de88b:

  ASoC: cs35l41: Add support for hibernate memory retention mode (2022-01-07 17:14:27 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.17-rc2

for you to fetch changes up to a4f399a1416f645ac701064a55b0cb5203707ac9:

  Input: wm97xx: Simplify resource management (2022-01-31 13:17:24 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.17

Quite a few fixes here, including an unusually large set in the core
spurred on by various testing efforts as well as the usual small driver
fixes.  There are quite a few fixes for out of bounds writes in both the
core and the various Qualcomm drivers, plus a couple of fixes for
locking in the DPCM code.

----------------------------------------------------------------
Ajit Kumar Pandey (1):
      ASoC: amd: acp-mach: Fix Left and Right rt1019 amp devices

Christophe JAILLET (1):
      Input: wm97xx: Simplify resource management

Dan Carpenter (1):
      ASoC: max9759: fix underflow in speaker_gain_control_put()

Dmitry Osipenko (1):
      ASoC: hdmi-codec: Fix OOB memory accesses

Jiasheng Jiang (1):
      ASoC: cpcap: Check for NULL pointer after calling of_get_child_by_name

Julian Braha (1):
      ASoC: mediatek: fix unmet dependency on GPIOLIB for SND_SOC_DMIC

Mark Brown (5):
      ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
      ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()
      ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()
      ASoC DPCM lockdep fixes
      ASoC: ops: Check for negative values before reading them

Miaoqian Lin (1):
      ASoC: fsl: Add missing error handling in pcm030_fabric_probe

Peter Ujfalusi (1):
      ASoC: rt5682: Fix deadlock on resume

Robert Hancock (2):
      ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes multiple of period bytes
      ASoC: simple-card: fix probe failure on platform component

Srinivas Kandagatla (4):
      ASoC: codecs: wcd938x: fix incorrect used of portid
      ASoC: codecs: lpass-rx-macro: fix sidetone register offsets
      ASoC: codecs: wcd938x: fix return value of mixer put function
      ASoC: qdsp6: q6apm-dai: only stop graphs that are started

Takashi Iwai (2):
      ASoC: soc-pcm: Fix DPCM lockdep warning due to nested stream locks
      ASoC: soc-pcm: Move debugfs removal out of spinlock

 drivers/input/touchscreen/wm97xx-core.c | 12 +++---------
 include/sound/pcm.h                     | 15 +++++++++++++++
 include/uapi/sound/asound.h             |  4 +++-
 sound/core/pcm_native.c                 | 13 +++++++++++++
 sound/soc/amd/acp/acp-mach-common.c     |  4 ++--
 sound/soc/codecs/cpcap.c                |  2 ++
 sound/soc/codecs/hdmi-codec.c           |  2 +-
 sound/soc/codecs/lpass-rx-macro.c       |  8 ++++----
 sound/soc/codecs/max9759.c              |  3 ++-
 sound/soc/codecs/rt5682-i2c.c           | 15 ++++-----------
 sound/soc/codecs/rt5682.c               | 24 ++++++++----------------
 sound/soc/codecs/rt5682.h               |  2 --
 sound/soc/codecs/wcd938x.c              | 31 +++++++++++++++++--------------
 sound/soc/fsl/pcm030-audio-fabric.c     | 11 ++++++++---
 sound/soc/generic/simple-card.c         | 26 +++++++++++++++++++++++++-
 sound/soc/mediatek/Kconfig              |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  7 +++++--
 sound/soc/soc-ops.c                     | 29 ++++++++++++++++++++++++++---
 sound/soc/soc-pcm.c                     | 18 ++++++++++++------
 sound/soc/xilinx/xlnx_formatter_pcm.c   | 27 ++++++++++++++++++++++++---
 20 files changed, 175 insertions(+), 80 deletions(-)

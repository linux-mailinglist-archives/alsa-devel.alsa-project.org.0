Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF847411441
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 14:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348461696;
	Mon, 20 Sep 2021 14:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348461696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632140448;
	bh=fNEiK3b8BhpRxM8wXEl4oc4sVUAeRk1mn1anXs+WreM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O/MKv5u3giuHwVmSmf+bY4j2SnjzycWRfylYv40nTEh33qqu55vFAT7sl1yGh20hx
	 5Md0T6Tnq7P8YlJllgR7Yzg3Y2kJ0Wwp1jDtILONX6RqjDQoUp5MNUbn94bYWlg8Qc
	 3u34ZYNGIh7Ja6W9T0Y/BViZHcUoB5W8y/yw/hyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF474F80246;
	Mon, 20 Sep 2021 14:19:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85E5CF8025D; Mon, 20 Sep 2021 14:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21323F80124
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 14:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21323F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XML2Rlx5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6F8560EB2;
 Mon, 20 Sep 2021 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632140358;
 bh=fNEiK3b8BhpRxM8wXEl4oc4sVUAeRk1mn1anXs+WreM=;
 h=From:To:Cc:Subject:Date:From;
 b=XML2Rlx5OmCyvxKNqsEmLF+DwFvA9kHoBJwRKvWv9vMWEDwM4WNShAIjeB4B3XBpU
 LpOSSp/+LzthkpRm79W5GfVCwTRuSj6Lfc2aiMykIXumx0mMULojxlGUwNO7Qu6SLW
 GBlOG6BCic8DCnxFjjkWNcd8ZE8N3veSRjigOIAd4G3zVqha418QrUkFHI9VdklKG6
 bLxJZ3pJwQu5ILGpj5n24MnAuZNp9UAvnQSGvFqKxsh6fVwWCjxlyp5pwppFLBVZqa
 Ja8WDT4NZyM49wTlYZRJz5pkWjTvKwGItXbImmuP7/QCSjJgiFT0xGJszXMU7WKFJE
 EPEPP0ojVUZag==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.15-rc2
Date: Mon, 20 Sep 2021 13:18:19 +0100
Message-Id: <20210920121917.A6F8560EB2@mail.kernel.org>
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

The following changes since commit fcb958ee8e832e9cdf43408535207e15f14af755:

  ASoC: rockchip: i2s: Fix concurrency between tx/rx (2021-09-03 16:19:01 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.15-rc2

for you to fetch changes up to cfacfefd382af3b42905108b54f02820dca225c4:

  ASoC: SOF: trace: Omit error print when waking up trace sleepers (2021-09-17 13:16:36 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.15

A crop of mostly device specific fixes that have been applied since
the merge window, nothing particularly standout here.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      MAINTAINERS: fix update references to stm32 audio bindings

Marc Herbert (1):
      ASoC: SOF: loader: release_firmware() on load failure to avoid batching

Mark Brown (1):
      Merge series "ASoC: fsl: register platform component before registering cpu dai" from Shengjiu Wang <shengjiu.wang@nxp.com>:

Peter Ujfalusi (4):
      ASoC: SOF: imx: imx8: Bar index is only valid for IRAM and SRAM types
      ASoC: SOF: imx: imx8m: Bar index is only valid for IRAM and SRAM types
      ASoC: SOF: loader: Re-phrase the missing firmware error to avoid duplication
      ASoC: SOF: trace: Omit error print when waking up trace sleepers

Pierre-Louis Bossart (1):
      ASoC: Intel: sof_sdw: tag SoundWire BEs as non-atomic

Shengjiu Wang (5):
      ASoC: fsl_sai: register platform component before registering cpu dai
      ASoC: fsl_esai: register platform component before registering cpu dai
      ASoC: fsl_micfil: register platform component before registering cpu dai
      ASoC: fsl_spdif: register platform component before registering cpu dai
      ASoC: fsl_xcvr: register platform component before registering cpu dai

Trevor Wu (3):
      ASoC: mediatek: add required config dependency
      ASoC: mediatek: common: handle NULL case in suspend/resume function
      ASoC: mediatek: mt8195: remove wrong fixup assignment on HDMITX

Yong Zhi (1):
      ASoC: SOF: Fix DSP oops stack dump output contents

 MAINTAINERS                                           |  3 ++-
 sound/soc/fsl/fsl_esai.c                              | 16 ++++++++++------
 sound/soc/fsl/fsl_micfil.c                            | 15 ++++++++++-----
 sound/soc/fsl/fsl_sai.c                               | 14 +++++++++-----
 sound/soc/fsl/fsl_spdif.c                             | 14 +++++++++-----
 sound/soc/fsl/fsl_xcvr.c                              | 15 ++++++++++-----
 sound/soc/intel/boards/sof_sdw.c                      |  5 +++++
 sound/soc/mediatek/Kconfig                            |  3 +++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c            | 19 +++++++++++--------
 .../soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c |  7 +++----
 sound/soc/sof/core.c                                  |  4 +---
 sound/soc/sof/imx/imx8.c                              |  9 ++++++++-
 sound/soc/sof/imx/imx8m.c                             |  9 ++++++++-
 sound/soc/sof/loader.c                                |  8 +++++---
 sound/soc/sof/trace.c                                 |  1 -
 sound/soc/sof/xtensa/core.c                           |  4 ++--
 16 files changed, 96 insertions(+), 50 deletions(-)

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1A65B1CB2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 14:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C25516F3;
	Thu,  8 Sep 2022 14:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C25516F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662639744;
	bh=MYLXeYEwJ3veaVQxAvvWtsFWjkpNZidbL4AvWu/+eIs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kVefL6toSUoc3K1D4ugSILp1bMrmfBqxyR9ThvNJiEZ0fa8Fie9UAXq6++0LYHE22
	 dJP60ujMC4Pr9qle4V6q5T8U/1URuxx7x41YB6RPpdxBUq/R7KVABmbDr0nbW++770
	 dDDosN4aoKETQSDRyEnO/vc7XwGz9rSbGQw6Fb6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 658F7F804B3;
	Thu,  8 Sep 2022 14:21:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20D80F803DC; Thu,  8 Sep 2022 14:20:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83DC4F8023B
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 14:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83DC4F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ax4aPHuE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B4340CE1F14;
 Thu,  8 Sep 2022 12:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D789C433C1;
 Thu,  8 Sep 2022 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662639644;
 bh=MYLXeYEwJ3veaVQxAvvWtsFWjkpNZidbL4AvWu/+eIs=;
 h=From:To:Cc:Subject:Date:From;
 b=ax4aPHuEe+FEQOnjwcTk4RArbtsZ7rUGyNc3blMQ6cT+fBxgNMMrBI2UJNPRWn7J1
 RA5208O4HF02y9tySs41gSn8kFxA72XkLrUQY7Cyp/+8OtgTDw7jLWfQxGJETFByGZ
 OPKH6zWGX7It95GJf/jbB1BIAcKwxGp007USpe7/+4CiFhWd2/LliH4bl9yGFJTaQY
 pG2X+qY9U70NxWaSctzlWEUP+6ZOstGPlmH9zoLjeDgBV4IXBc9y27NKd1z1yInGTD
 8gCVZkVwaUVdHIeilCGRnih30xV5GTxC8awagGcFVdAb1zvdBajw4f0J5bxwWMEKla
 revAOL7w8ElNg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.0-rc4
Date: Thu, 08 Sep 2022 13:20:32 +0100
Message-Id: <20220908122044.4D789C433C1@smtp.kernel.org>
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

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.0-rc4

for you to fetch changes up to b1cd3fd42db7593a2d24c06f1c53b8c886592080:

  ASoC: fsl_aud2htx: Add error handler for pm_runtime_enable (2022-08-25 14:17:31 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.0

Quite a few fixes here, all driver specific and fairly small.

----------------------------------------------------------------
Bard Liao (1):
      ASoC: SOF: ipc4-topology: fix alh_group_ida max value

Jiaxin Yu (1):
      ASoC: mediatek: mt8186: fix DMIC record noise

Mark Brown (3):
      Merge remote-tracking branch 'asoc/for-5.20' into asoc-6.0
      ASoC: SOF: Kconfig: Fix the dependency for client modules
      ASoC: nau8xxx: Implement hw constraint for rates

Nathan Chancellor (1):
      ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion

Peter Ujfalusi (2):
      ASoC: SOF: Kconfig: Make IPC_FLOOD_TEST depend on SND_SOC_SOF
      ASoC: SOF: Kconfig: Make IPC_MESSAGE_INJECTOR depend on SND_SOC_SOF

Pieterjan Camerlynck (1):
      ASoC: fsl_sai: fix incorrect mclk number in error message

Richard Fitzgerald (1):
      ASoC: cs42l42: Only report button state if there was a button interrupt

Shengjiu Wang (3):
      ASoC: fsl_mqs: Fix supported clock DAI format
      ASoC: fsl_aud2htx: register platform component before registering cpu dai
      ASoC: fsl_aud2htx: Add error handler for pm_runtime_enable

Srinivas Kandagatla (1):
      ASoC: qcom: sm8250: add missing module owner

Takashi Iwai (5):
      ASoC: nau8821: Implement hw constraint for rates
      ASoC: nau8824: Fix semaphore unbalance at error paths
      ASoC: nau8824: Implement hw constraint for rates
      ASoC: nau8825: Implement hw constraint for rates
      ASoC: nau8540: Implement hw constraint for rates

Yang Yingliang (1):
      ASoC: SOF: ipc4-topology: fix wrong use of sizeof in sof_ipc4_widget_setup_comp_src()

 sound/soc/amd/yc/acp6x-mach.c               | 28 +++++++++
 sound/soc/atmel/mchp-spdiftx.c              |  2 +-
 sound/soc/codecs/cs42l42.c                  | 13 ++--
 sound/soc/codecs/nau8540.c                  | 40 ++++++++----
 sound/soc/codecs/nau8821.c                  | 66 ++++++++++---------
 sound/soc/codecs/nau8824.c                  | 80 +++++++++++++----------
 sound/soc/codecs/nau8825.c                  | 83 +++++++++++++-----------
 sound/soc/codecs/rt5640.c                   |  5 +-
 sound/soc/codecs/tas2770.c                  | 98 +++++++++++++----------------
 sound/soc/codecs/tas2770.h                  |  5 ++
 sound/soc/codecs/tlv320aic32x4.c            |  9 +++
 sound/soc/fsl/fsl_aud2htx.c                 | 16 +++--
 sound/soc/fsl/fsl_mqs.c                     |  2 +-
 sound/soc/fsl/fsl_sai.c                     |  2 +-
 sound/soc/intel/avs/pcm.c                   |  4 +-
 sound/soc/intel/boards/sof_es8336.c         |  4 +-
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c |  3 -
 sound/soc/qcom/sm8250.c                     |  1 +
 sound/soc/sh/rz-ssi.c                       | 26 ++++----
 sound/soc/soc-pcm.c                         |  3 +
 sound/soc/sof/Kconfig                       |  2 +
 sound/soc/sof/debug.c                       |  6 +-
 sound/soc/sof/intel/hda.c                   |  2 +-
 sound/soc/sof/ipc3-topology.c               |  2 +-
 sound/soc/sof/ipc4-topology.c               |  4 +-
 25 files changed, 299 insertions(+), 207 deletions(-)

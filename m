Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C941265F79
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 14:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5F661676;
	Fri, 11 Sep 2020 14:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5F661676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599827099;
	bh=TUBU5cM8qNYk9fQ8DAHx2Me4fR6Z9HvCieD9ftOFJdM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fsaN4AcQ7e2s+tHTHchTzqDXJ2YM8htUFgtTLHtNEhcR8SUmva8SHyjV3fOjaDqk8
	 kfMWdIsx3Do9xmk2j/XpCQeWmorU1hQAMxQoEkrZDpfYBC0lfqbIH3iGSxbn7kV2F2
	 eIL31VR61gP9UzbEHv9bxDI3JOfSq0NxOf8QfR+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4BBFF800E9;
	Fri, 11 Sep 2020 14:23:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07597F80227; Fri, 11 Sep 2020 14:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA130F80115
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 14:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA130F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GsM7uYm/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CED8622204;
 Fri, 11 Sep 2020 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599826981;
 bh=TUBU5cM8qNYk9fQ8DAHx2Me4fR6Z9HvCieD9ftOFJdM=;
 h=From:To:Cc:Subject:Date:From;
 b=GsM7uYm/isu0D/zj+EJ5ohVglB1Xkbv34XIgbUER6PejMzOAuz5ZSb0O9ToklwsmP
 goagV0XFhOQWUuxadAgZanYZNZzLTs4Sg/KyfBAZa3WyapVsrViy8yccQ8Cbz+fSfj
 vLkWwjK4OE7erpPQzwHMqpIWT4L3SXji0d0Qqxso=
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.9-rc4
Date: Fri, 11 Sep 2020 13:22:09 +0100
Message-Id: <20200911122300.CED8622204@mail.kernel.org>
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

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.9-rc4

for you to fetch changes up to 1a5ce48fd667128e369fdc7fb87e21539aed21b5:

  ASoC: tlv320adcx140: Wake up codec before accessing register (2020-09-08 17:26:03 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.9

Most of this is various driver specific fixes, none of which are
terribly exciting in themselves, plus one core fix adding and using a
new DAI lookup function to deal with a lockdep warning.

----------------------------------------------------------------
Brent Lu (1):
      ASoC: intel: atom: Add period size constraint

Camel Guo (2):
      ASoC: tlv320adcx140: Fix accessing uninitialized adcx140->dev
      ASoC: tlv320adcx140: Wake up codec before accessing register

Cezary Rojewski (2):
      ASoC: Intel: haswell: Fix power transition refactor
      ASoC: core: Do not cleanup uninitialized dais on soc_pcm_open failure

Dinghao Liu (1):
      ASoC: qcom: common: Fix refcount imbalance on error

Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN Converter9 2-in-1

Jerome Brunet (1):
      ASoC: meson: axg-toddr: fix channel order on g12 platforms

Kuninori Morimoto (3):
      ASoC: pcm3168a: ignore 0 Hz settings
      ASoC: ti: fixup ams_delta_mute() function name
      ASoC: soc-core: add snd_soc_find_dai_with_mutex()

Mark Brown (2):
      Merge tag 'v5.9-rc2' into asoc-5.9
      Merge series "ASoC: Fix return check for devm_regmap_init_sdw()" from Vinod Koul <vkoul@kernel.org>:

Mateusz Gorski (1):
      ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference in autosuspend delay

Rander Wang (1):
      ASoC: Intel: tgl_max98373: fix a runtime pm issue in multi-thread case

Stephan Gerhold (1):
      ASoC: qcom: Set card->owner to avoid warnings

Sylwester Nawrocki (2):
      ASoC: wm8994: Skip setting of the WM8994_MICBIAS register for WM1811
      ASoC: wm8994: Ensure the device is resumed in wm89xx_mic_detect functions

Vinod Koul (5):
      ASoC: max98373: Fix return check for devm_regmap_init_sdw()
      ASoC: rt1308-sdw: Fix return check for devm_regmap_init_sdw()
      ASoC: rt711: Fix return check for devm_regmap_init_sdw()
      ASoC: rt715: Fix return check for devm_regmap_init_sdw()
      ASoC: rt700: Fix return check for devm_regmap_init_sdw()

 include/sound/soc.h                          |   4 +
 sound/soc/codecs/max98373-sdw.c              |   4 +-
 sound/soc/codecs/pcm3168a.c                  |   7 +
 sound/soc/codecs/rt1308-sdw.c                |   4 +-
 sound/soc/codecs/rt700-sdw.c                 |   4 +-
 sound/soc/codecs/rt711-sdw.c                 |   4 +-
 sound/soc/codecs/rt715-sdw.c                 |   4 +-
 sound/soc/codecs/tlv320adcx140.c             |  28 ++--
 sound/soc/codecs/wm8994.c                    |  10 ++
 sound/soc/codecs/wm_hubs.c                   |   3 +
 sound/soc/codecs/wm_hubs.h                   |   1 +
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  11 ++
 sound/soc/intel/boards/bytcr_rt5640.c        |  10 ++
 sound/soc/intel/boards/skl_hda_dsp_generic.c |   2 +-
 sound/soc/intel/boards/sof_maxim_common.c    |   7 +-
 sound/soc/intel/haswell/sst-haswell-dsp.c    | 185 ++++++++++++---------------
 sound/soc/meson/axg-toddr.c                  |  24 +++-
 sound/soc/qcom/apq8016_sbc.c                 |   1 +
 sound/soc/qcom/apq8096.c                     |   1 +
 sound/soc/qcom/common.c                      |   6 +-
 sound/soc/qcom/sdm845.c                      |   1 +
 sound/soc/qcom/storm.c                       |   1 +
 sound/soc/soc-core.c                         |  13 ++
 sound/soc/soc-dai.c                          |   4 +-
 sound/soc/soc-pcm.c                          |   2 +-
 sound/soc/ti/ams-delta.c                     |   4 +-
 26 files changed, 206 insertions(+), 139 deletions(-)

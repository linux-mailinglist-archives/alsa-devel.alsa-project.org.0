Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A842F015
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 13:58:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1FEE16A3;
	Fri, 15 Oct 2021 13:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1FEE16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634299129;
	bh=+1txifgNcIKZRuKLPOBh7bas0cUE9J1Jip+gYSNUh/c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kko5vkUGXZwEHI4w71r9Plq4mXSnGIgXXTJ2PTSLeT/EJG/pICx+K8VcAjuU1jnZf
	 AKlQrHh+X8LzqEyzx+Ylv4SN+oxsR9E6UxnwtiJg/nYB3XQaDt4FVR1MmeF37mJDIw
	 w+hn/jAsQxuh/xK/V2jfrM8aXqDOiugAj5/C94BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07222F8012E;
	Fri, 15 Oct 2021 13:57:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EDB9F80269; Fri, 15 Oct 2021 13:57:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D5D8F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 13:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D5D8F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="egcUG7Ys"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D3A160524;
 Fri, 15 Oct 2021 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634299038;
 bh=+1txifgNcIKZRuKLPOBh7bas0cUE9J1Jip+gYSNUh/c=;
 h=From:To:Cc:Subject:Date:From;
 b=egcUG7YsMZ4DAhSfCxoGfQiT4vwE5gJdsFam7zF9x2Ow/3feakxLLuPsvOOaQUsYr
 6fd2vimflGgkUgfKUwMO+4qv1G0Mv7GhXYJ48FLjHhSfLEXKgZXV3lsyyH8/09dN1L
 ddq4QcDw1UFXpNv1evD7czL+NPsHR+O4tgeYf+kZ56dD/BH44WLo8SqYQfr2cPOfP/
 L4d3+Rq72b6+IZwZkCSvWUoFFid07zbMRKI/zP0leehgdh1ERcheXsgcAqA9AVKNn6
 N/MiEKR0NUhIwefYxYplN0ccEJqeoIVAxlEzaDLrBqFmO+XClCG2yoDCARIsJmFxDN
 VamKQCb8BTUhQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.15-rc5
Date: Fri, 15 Oct 2021 12:57:04 +0100
Message-Id: <20211015115718.5D3A160524@mail.kernel.org>
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

The following changes since commit cfacfefd382af3b42905108b54f02820dca225c4:

  ASoC: SOF: trace: Omit error print when waking up trace sleepers (2021-09-17 13:16:36 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.15-rc5

for you to fetch changes up to 6b9b546dc00797c74bef491668ce5431ff54e1e2:

  ASoC: wm8960: Fix clock configuration on slave mode (2021-10-13 16:25:33 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.15

A colletion of smallish mostly driver specific fixes, the biggest thing
here is fixing some of the core code to generate change notifications
properly when writing to controls which will fix issues with UIs not
showing the correct values.

There's one build fix here with a slightly misleading changelog saying
it's adding IRQ config support, it's adding a missing select of the
regmap-irq code rather than adding a feature.

----------------------------------------------------------------
Andy Shevchenko (4):
      ASoC: Intel: bytcht_es8316: Get platform data via dev_get_platdata()
      ASoC: Intel: bytcht_es8316: Use temporary variable for struct device
      ASoC: Intel: bytcht_es8316: Switch to use gpiod_get_optional()
      ASoC: Intel: bytcht_es8316: Utilize dev_err_probe() to avoid log saturation

Hans de Goede (1):
      ASoC: nau8824: Fix headphone vs headset, button-press detection no longer working

Mark Brown (2):
      ASoC: pcm179x: Add missing entries SPI to device ID table
      ASoC: cs4341: Add SPI device ID table

Peter Rosin (1):
      ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2 registers

Shengjiu Wang (2):
      ASoC: fsl_xcvr: Fix channel swap issue with ARC
      ASoC: wm8960: Fix clock configuration on slave mode

Srinivasa Rao Mandadapu (2):
      ASoC: wcd938x: Fix jack detection issue
      ASoC: codec: wcd938x: Add irq config support

Stefan Binding (1):
      ASoC: cs42l42: Ensure 0dB full scale volume is used for headsets

Takashi Iwai (1):
      ASoC: DAPM: Fix missing kctl change notifications

Yang Yingliang (1):
      ASoC: soc-core: fix null-ptr-deref in snd_soc_del_component_unlocked()

 sound/soc/codecs/Kconfig               |  1 +
 sound/soc/codecs/cs42l42.c             | 16 +++------------
 sound/soc/codecs/cs4341.c              |  7 +++++++
 sound/soc/codecs/nau8824.c             |  4 ++--
 sound/soc/codecs/pcm179x-spi.c         |  1 +
 sound/soc/codecs/pcm512x.c             |  2 ++
 sound/soc/codecs/wcd938x.c             |  6 +++---
 sound/soc/codecs/wm8960.c              | 13 +++++++++---
 sound/soc/fsl/fsl_xcvr.c               | 17 +++++++++++-----
 sound/soc/intel/boards/bytcht_es8316.c | 37 +++++++++++-----------------------
 sound/soc/soc-core.c                   |  1 +
 sound/soc/soc-dapm.c                   | 13 +++++++-----
 12 files changed, 62 insertions(+), 56 deletions(-)

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA8356CC0
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 14:55:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF48F1662;
	Wed,  7 Apr 2021 14:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF48F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617800132;
	bh=Oo0AcFEK3XaOGPppfcLFqiF8UB/+WPLhChyVxvLH1ZY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r3O7OAwCpSEJqxkFWxaSSx76d2hH1pg6wl8IjYkNHcDNgDX0TaTRjpw1EL/Gg/Nca
	 0zIU9zwKJVOx3B29gd4WBwuKLpYgoF2vc+OknlwxCgQEqeXHkbsB96PGzy9siTlK1J
	 elT4mPQ1LnwyAbkK2FaS1bQvGMIanS44HOpCgBxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 577EEF801F5;
	Wed,  7 Apr 2021 14:54:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF6AFF8016D; Wed,  7 Apr 2021 14:54:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4890F80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 14:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4890F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K0Mt1NfM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF0C36113A;
 Wed,  7 Apr 2021 12:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617800028;
 bh=Oo0AcFEK3XaOGPppfcLFqiF8UB/+WPLhChyVxvLH1ZY=;
 h=From:To:Cc:Subject:Date:From;
 b=K0Mt1NfMBLDlDsX7VuWP17CXR9VEEoYP10mzA5HyDlt7TVfJDrz+5paduzi/7Hy3j
 DF4oR710oamjmIlpHHbm9VXAz6aNI9B/G9eNEVg1Cee2qRLfdT7HgdC1FYYyp1/QFT
 rhXIzRepClwh+KeSX0sQlemsauSnuTBpsHCbFJqiNazeNO3oR7AVn6daIBYRVdVbgt
 utxD1VtffBEBECBesNzKZkKOS+2eNhhbdBYlerwUhJSxgLfL0RTVdzq+hjoxYKd5Dh
 fbsSr4dVk/21YRMlWuBS48FpJXloVD1o3DNW9wTcjO3Un9PoXYKuSbN6SfeedzUSJr
 rYVMzGTfuvtuw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.12-rc6
Date: Wed, 07 Apr 2021 13:53:18 +0100
Message-Id: <20210407125347.BF0C36113A@mail.kernel.org>
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

The following changes since commit f9dc51cc6676e0360dfcb1836b3d426a3ccf3093:

  Merge series "Do not handle MCLK device clock in simple-card-utils" from Sameer Pujar <spujar@nvidia.com>: (2021-03-16 17:55:37 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.12-rc6

for you to fetch changes up to e7a48c710defa0e0fef54d42b7d9e4ab596e2761:

  ASoC: fsl_esai: Fix TDM slot setup for I2S mode (2021-04-02 16:24:16 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.12

A fairly small batch of driver specific fixes, mainly for various x86
systems with the biggest set being fixes to power down DSPs properly on
x86 SOF systems.

----------------------------------------------------------------
Alexander Shiyan (1):
      ASoC: fsl_esai: Fix TDM slot setup for I2S mode

Bastian Germann (1):
      ASoC: sunxi: sun4i-codec: fill ASoC card owner

Guennadi Liakhovetski (1):
      ASoC: SOF: Intel: HDA: fix core status verification

Hans de Goede (2):
      ASoC: intel: atom: Stop advertising non working S24LE support
      ASoC: intel: atom: Remove 44100 sample-rate from the media and deep-buffer DAI descriptions

Libin Yang (5):
      ASoC: SOF: Intel: TGL: fix EHL ops
      ASoC: SOF: Intel: TGL: set shutdown callback to hda_dsp_shutdown
      ASoC: SOF: Intel: ICL: set shutdown callback to hda_dsp_shutdown
      ASoC: SOF: Intel: CNL: set shutdown callback to hda_dsp_shutdown
      ASoC: SOF: Intel: APL: set shutdown callback to hda_dsp_shutdown

Mark Brown (1):
      Merge series "ASoC: SOF: Intel: shutdown and core handling corrections" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:

Pierre-Louis Bossart (2):
      ASoC: SOF: core: harden shutdown helper
      ASoC: SOF: Intel: move ELH chip info

Ryan Lee (2):
      ASoC: max98373: Changed amp shutdown register as volatile
      ASoC: max98373: Added 30ms turn on/off time delay

Shengjiu Wang (1):
      ASoC: wm8960: Fix wrong bclk and lrclk with pll enabled for some chips

Srinivas Kandagatla (2):
      ASoC: codecs: lpass-tx-macro: set npl clock rate correctly
      ASoC: codecs: lpass-rx-macro: set npl clock rate correctly

kernel test robot (1):
      ASoC: cygnus: fix for_each_child.cocci warnings

 sound/soc/bcm/cygnus-ssp.c                   |  4 +++-
 sound/soc/codecs/lpass-rx-macro.c            |  2 +-
 sound/soc/codecs/lpass-tx-macro.c            |  2 +-
 sound/soc/codecs/max98373-i2c.c              |  1 +
 sound/soc/codecs/max98373-sdw.c              |  1 +
 sound/soc/codecs/max98373.c                  |  2 ++
 sound/soc/codecs/wm8960.c                    |  8 +++++++-
 sound/soc/fsl/fsl_esai.c                     |  8 +++++---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 12 ++++++------
 sound/soc/sof/core.c                         |  8 +++++++-
 sound/soc/sof/intel/apl.c                    |  3 ++-
 sound/soc/sof/intel/cnl.c                    | 19 ++-----------------
 sound/soc/sof/intel/hda-dsp.c                | 21 +++++++++++++++++----
 sound/soc/sof/intel/hda.h                    |  1 +
 sound/soc/sof/intel/icl.c                    |  3 ++-
 sound/soc/sof/intel/pci-tgl.c                |  2 +-
 sound/soc/sof/intel/tgl.c                    | 18 +++++++++++++++++-
 sound/soc/sunxi/sun4i-codec.c                |  5 +++++
 18 files changed, 81 insertions(+), 39 deletions(-)

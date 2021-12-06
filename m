Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1846A0AD
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 17:07:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C884208E;
	Mon,  6 Dec 2021 17:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C884208E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638806858;
	bh=EBITfW79TQtwyU9SznXotRgk+r228LsOrFXJ56X6NjE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HqjNH7tHTWyi3rWcO8z/yCeQ24K6iaw/kGJ2XQciyczQfGyRcuSCbsgMNReidOdII
	 pxgBiH/ikvIK/TZMvwAXfTIzUq1AP3yD2OhsHGeAv8p3pehWzJrPHH1RYsxow+90nU
	 v5xXe/bARz6//qFnAJ1oGGbtJhmVtK/Wj+HSvFDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A437F804ED;
	Mon,  6 Dec 2021 17:06:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E48F804ED; Mon,  6 Dec 2021 17:06:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BB5AF804E5
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 17:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB5AF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WJYstpku"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8D01FCE16AE;
 Mon,  6 Dec 2021 16:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22C8C341C1;
 Mon,  6 Dec 2021 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638806764;
 bh=EBITfW79TQtwyU9SznXotRgk+r228LsOrFXJ56X6NjE=;
 h=From:To:Cc:Subject:Date:From;
 b=WJYstpkuoWQ+EMUVbh0liX4WgKccy2C18/NfEdCdI1y9VJUODsR6mpxCiufa5lZch
 m8FUSR3zuhzZSPPQTC9BOPVkGzrzOMXavdwiNHKV7z6GhUHmiq6B5XvfSBDUskZkh6
 ZVm6QNJ9W3oq4TKsLrd47rcLD47mcUFZOP8xvXVgVNQ/C8avr4gwm3ys5Yc1pKa+t0
 xAYuRJYabKg6TfdlWFEWL9UvaY9eYccDZicaFz6DZ4yZAbx2qWRx+LhXSdkX3Y0F3P
 jL5Z9ggl+T28pa3JqlkegeBCMwfwSEnBeDBPAZHVHuFTLGYkuwUR6bIR+4+85e69ct
 TyygDUPU9sLXw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.16-rc4
Date: Mon, 06 Dec 2021 16:05:47 +0000
Message-Id: <20211206160603.E22C8C341C1@smtp.kernel.org>
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

The following changes since commit 86f74ba3fef56dd1cee19b7a15ae27fc0da5bb61:

  ASoC: SOF: hda: reset DAI widget before reconfiguring it (2021-11-24 12:57:11 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.16-rc4

for you to fetch changes up to 3fc27e9a1f619b50700f020e6cd270c1b74755f0:

  ASoC: codecs: wsa881x: fix return values from kcontrol put (2021-12-01 14:13:53 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.16

A relatively large collection of updates, the size is increased quite a
bit by there being some repetitive changes for similar issues that occur
multiple times with both notifying control value changes and runtime PM.

The Rockchip update looks at first glance like a cleanup but fixes
instantiation of the hardware on some systems.

----------------------------------------------------------------
Dan Carpenter (1):
      ASoC: amd: fix uninitialized variable in snd_acp6x_probe()

David Heidelberg (1):
      ASoC: dt-bindings: wlf,wm8962: add missing interrupt property

Hui Wang (1):
      ASoC: SOF: Intel: Retry codec probing if it fails

Mark Brown (1):
      Suspend related fixes on Tegra

Nicolas Frattaroli (1):
      ASoC: rockchip: i2s_tdm: Dup static DAI template

Rob Clark (2):
      ASoC: rt5682: Fix crash due to out of scope stack vars
      ASoC: rt5682s: Fix crash due to out of scope stack vars

Sameer Pujar (6):
      ASoC: tegra: Balance runtime PM count
      ASoC: tegra: Use normal system sleep for SFC
      ASoC: tegra: Use normal system sleep for MVC
      ASoC: tegra: Use normal system sleep for Mixer
      ASoC: tegra: Use normal system sleep for AMX
      ASoC: tegra: Use normal system sleep for ADX

Srinivas Kandagatla (4):
      ASoC: qdsp6: q6routing: Fix return value from msm_routing_put_audio_mixer
      ASoC: codecs: wcd934x: handle channel mappping list correctly
      ASoC: codecs: wcd934x: return correct value from mixer put
      ASoC: codecs: wsa881x: fix return values from kcontrol put

 .../devicetree/bindings/sound/wlf,wm8962.yaml      |   3 +
 sound/soc/amd/yc/pci-acp6x.c                       |   3 +-
 sound/soc/codecs/rt5682.c                          |  10 +-
 sound/soc/codecs/rt5682s.c                         |  10 +-
 sound/soc/codecs/wcd934x.c                         | 126 +++++++++++++++------
 sound/soc/codecs/wsa881x.c                         |  16 ++-
 sound/soc/qcom/qdsp6/q6routing.c                   |   8 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |  52 +++++----
 sound/soc/sof/intel/hda-codec.c                    |  14 ++-
 sound/soc/tegra/tegra210_adx.c                     |   4 +-
 sound/soc/tegra/tegra210_amx.c                     |   4 +-
 sound/soc/tegra/tegra210_mixer.c                   |   4 +-
 sound/soc/tegra/tegra210_mvc.c                     |   8 +-
 sound/soc/tegra/tegra210_sfc.c                     |   4 +-
 14 files changed, 179 insertions(+), 87 deletions(-)

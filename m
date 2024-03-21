Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942B885854
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Mar 2024 12:29:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63DD9233B;
	Thu, 21 Mar 2024 12:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63DD9233B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711020573;
	bh=g8RkSiZ82hYTCBOgNPvwa++yWUXg9ak2YZ21BcXFtVU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fPYxwKePw0yEx+3EqqUUP2VRhIEsFxhXoLPwUNbiG2rLaVpCpHy7DsNlQHTecSF14
	 6pG5RKvjd7BTByvkrYxOYBxBdXke2G1dd+s3U12GJi07oG0qXU5VhLc7cNXSBOeHAb
	 0Hp1Fp+ar253CeJrVMynkMHIo+qrIymwQEG//woI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41E35F80579; Thu, 21 Mar 2024 12:28:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D01DF805A9;
	Thu, 21 Mar 2024 12:28:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 438FEF804E7; Thu, 21 Mar 2024 12:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5920F8025F
	for <alsa-devel@alsa-project.org>; Thu, 21 Mar 2024 12:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5920F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pfsRFK9O
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4602CE12AF;
	Thu, 21 Mar 2024 11:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598D5C433C7;
	Thu, 21 Mar 2024 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711020483;
	bh=g8RkSiZ82hYTCBOgNPvwa++yWUXg9ak2YZ21BcXFtVU=;
	h=From:To:Cc:Subject:Date:From;
	b=pfsRFK9OZRpGvNCeJeIvJ7HB/b0cLKnMlHdQgswpX3Td3q7sHOGxu8qZKVyU806uP
	 zxs341Cjsu4perACQBB2oS/xT4GgQ1MMLkiClKumb+WrNoyca7K4sj0BFuC503+Nc1
	 Nhe8T795P26bt972MV+kEQaw0F9NiG2vPeq+wVHdn3qWWY4AMvrc+s3gKnONjj8Dfu
	 2/6r+wZU0bNKV7tqcvpE30l9Nyag9y/bBk28G2E5enZ7xdZ0mMCWPYbjv5drUFKYLr
	 IE11HWg/qjqXQXqdn9jsXxRkpLRGAxYIDvsMt03LMYO3dhVWSHHbWf1rh5hXDxIkcz
	 LAZBArEhK6K3Q==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.9-merge-window
Date: Thu, 21 Mar 2024 11:27:50 +0000
Message-Id: <20240321112803.598D5C433C7@smtp.kernel.org>
Message-ID-Hash: 5RJP7DCSOMWYGBW2AOWAPDJWCIEVGZ2A
X-Message-ID-Hash: 5RJP7DCSOMWYGBW2AOWAPDJWCIEVGZ2A
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RJP7DCSOMWYGBW2AOWAPDJWCIEVGZ2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit e8f897f4afef0031fe618a8e94127a0934896aba:

  Linux 6.8 (2024-03-10 13:38:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.9-merge-window

for you to fetch changes up to 9a8b202f8cb7ebebc71f1f2a353a21c76d3063a8:

  ASoC: soc-compress: Fix and add DPCM locking (2024-03-18 14:41:51 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.9

A bunch of fixes that came in during the merge window, probably the most
substantial thing is the DPCM locking fix for compressed audio which has
been lurking for a while.

----------------------------------------------------------------
Chancel Liu (1):
      ASoC: soc-core.c: Skip dummy codec when adding platforms

Cristian Ciocaltea (2):
      ASoC: SOF: amd: Move signed_fw_image to struct acp_quirk_entry
      ASoC: SOF: amd: Skip IRAM/DRAM size modification for Steam Deck OLED

Jiawei Wang (2):
      ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
      ASoC: amd: yc: Revert "add new YC platform variant (0x63) support"

Luca Ceresoli (1):
      ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates

M Cooley (1):
      ASoC: amd: yc: Fix non-functional mic on ASUS M7600RE

Mark Brown (3):
      ASoC: Merge up release
      Add support for the internal RK3308 audio codec
      ASoC: SOF: amd: Skip IRAM/DRAM size modification

Rob Herring (1):
      ASoC: dt-bindings: cirrus,cs42l43: Fix 'gpio-ranges' schema

Shalini Manjunatha (1):
      ASoC: soc-compress: Fix and add DPCM locking

Uwe Kleine-König (1):
      ASoC: tlv320adc3xxx: Don't strip remove function when driver is builtin

 .../ABI/testing/sysfs-bus-pci-devices-avs          |    8 +
 .../bindings/sound/atmel,asoc-wm8904.yaml          |   84 +
 .../bindings/sound/atmel,sam9x5-wm8731-audio.yaml  |   76 +
 .../bindings/sound/atmel,sama5d2-classd.yaml       |    7 +-
 .../bindings/sound/atmel-sam9x5-wm8731-audio.txt   |   35 -
 .../devicetree/bindings/sound/atmel-wm8904.txt     |   55 -
 .../bindings/sound/audio-graph-port.yaml           |    2 +-
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  |    3 +
 .../devicetree/bindings/sound/cirrus,cs42l43.yaml  |   11 +-
 .../devicetree/bindings/sound/everest,es8326.yaml  |    8 +-
 .../devicetree/bindings/sound/fsl,asrc.txt         |   80 -
 .../devicetree/bindings/sound/fsl,easrc.yaml       |    4 +-
 .../devicetree/bindings/sound/fsl,imx-asrc.yaml    |  162 +
 .../devicetree/bindings/sound/fsl,micfil.yaml      |   14 +-
 .../devicetree/bindings/sound/fsl,sai.yaml         |    6 +
 .../bindings/sound/infineon,peb2466.yaml           |    2 +-
 .../bindings/sound/microchip,sama7g5-i2smcc.yaml   |   11 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    2 +-
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |   81 +-
 .../bindings/sound/qcom,wcd939x-sdw.yaml           |   69 +
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |   96 +
 .../bindings/sound/qcom,wcd93xx-common.yaml        |   95 +
 .../devicetree/bindings/sound/qcom,wsa8840.yaml    |   11 +-
 .../devicetree/bindings/sound/realtek,rt1015.yaml  |   41 +
 Documentation/devicetree/bindings/sound/rt1015.txt |   23 -
 .../devicetree/bindings/sound/samsung,tm2.yaml     |    7 +-
 drivers/firmware/cirrus/cs_dsp.c                   |    7 +-
 drivers/soundwire/Makefile                         |    2 +-
 drivers/soundwire/amd_init.c                       |  235 ++
 drivers/soundwire/amd_init.h                       |   13 +
 drivers/soundwire/amd_manager.c                    |   47 +-
 drivers/soundwire/amd_manager.h                    |   16 +-
 drivers/soundwire/dmi-quirks.c                     |    8 +
 include/linux/firmware/cirrus/cs_dsp.h             |    1 -
 include/linux/soundwire/sdw_amd.h                  |   83 +-
 include/linux/spi/spi.h                            |    2 -
 include/sound/cs-amp-lib.h                         |   66 +
 include/sound/cs35l56.h                            |   10 +
 include/sound/cs42l42.h                            |    5 +-
 include/sound/hda-mlink.h                          |    2 +-
 include/sound/hda_register.h                       |    2 +
 include/sound/soc.h                                |    4 +-
 include/sound/sof/dai-amd.h                        |    7 +
 include/sound/sof/dai.h                            |    2 +
 include/sound/tas2781.h                            |    1 -
 include/trace/events/asoc.h                        |   45 +-
 include/uapi/sound/intel/avs/tokens.h              |    9 +
 include/uapi/sound/sof/tokens.h                    |    4 +
 sound/pci/hda/Kconfig                              |    2 +
 sound/pci/hda/cs35l56_hda.c                        |   39 +-
 sound/pci/hda/tas2781_hda_i2c.c                    |   12 -
 sound/soc/amd/Kconfig                              |   17 +
 sound/soc/amd/Makefile                             |    2 +-
 sound/soc/amd/acp/Kconfig                          |    7 +
 sound/soc/amd/acp/Makefile                         |    2 +
 sound/soc/amd/acp/acp-mach-common.c                |    6 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   26 +-
 sound/soc/amd/acp/amd-sdw-acpi.c                   |   62 +
 sound/soc/amd/ps/Makefile                          |    2 +-
 sound/soc/amd/ps/acp63.h                           |   91 +-
 sound/soc/amd/ps/pci-ps.c                          |  565 +--
 sound/soc/amd/ps/ps-mach.c                         |    2 +-
 sound/soc/amd/ps/ps-pdm-dma.c                      |    2 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      |    2 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   14 +-
 sound/soc/amd/yc/pci-acp6x.c                       |    1 -
 sound/soc/atmel/mikroe-proto.c                     |    8 +-
 sound/soc/codecs/Kconfig                           |   55 +-
 sound/soc/codecs/Makefile                          |   13 +
 sound/soc/codecs/cs-amp-lib-test.c                 |  709 ++++
 sound/soc/codecs/cs-amp-lib.c                      |  277 ++
 sound/soc/codecs/cs35l56-sdw.c                     |   20 +
 sound/soc/codecs/cs35l56-shared.c                  |   84 +
 sound/soc/codecs/cs35l56.c                         |   44 +-
 sound/soc/codecs/cs42l42.c                         |    1 -
 sound/soc/codecs/cs42l43-jack.c                    |   27 +-
 sound/soc/codecs/cs42l43-sdw.c                     |    1 +
 sound/soc/codecs/cs42l43.c                         |   82 +-
 sound/soc/codecs/cs42l43.h                         |   21 +-
 sound/soc/codecs/da7213.c                          |   12 +-
 sound/soc/codecs/es8326.c                          |  110 +-
 sound/soc/codecs/es8326.h                          |    5 +-
 sound/soc/codecs/framer-codec.c                    |  413 +++
 sound/soc/codecs/lpass-macro-common.h              |    7 +
 sound/soc/codecs/lpass-tx-macro.c                  |  693 +++-
 sound/soc/codecs/lpass-va-macro.c                  |   57 +
 sound/soc/codecs/max98363.c                        |    2 +-
 sound/soc/codecs/max98373-sdw.c                    |    2 +-
 sound/soc/codecs/nau8540.c                         |  116 +-
 sound/soc/codecs/nau8540.h                         |   13 +-
 sound/soc/codecs/nau8825.c                         |   12 +-
 sound/soc/codecs/rt1017-sdca-sdw.c                 |    2 +-
 sound/soc/codecs/rt274.c                           |    2 +-
 sound/soc/codecs/rt286.c                           |    2 +-
 sound/soc/codecs/rt298.c                           |    2 +-
 sound/soc/codecs/rt5514-spi.c                      |    2 +-
 sound/soc/codecs/rt5514.c                          |    9 +-
 sound/soc/codecs/rt5616.c                          |    9 +-
 sound/soc/codecs/rt5640.c                          |    9 +-
 sound/soc/codecs/rt5645.c                          |    2 +-
 sound/soc/codecs/rt5651.c                          |    2 +-
 sound/soc/codecs/rt5659.c                          |    2 +-
 sound/soc/codecs/rt5660.c                          |    9 +-
 sound/soc/codecs/rt5663.c                          |    2 +-
 sound/soc/codecs/rt5665.c                          |    2 +-
 sound/soc/codecs/rt5668.c                          |    2 +-
 sound/soc/codecs/rt5682-i2c.c                      |    2 +-
 sound/soc/codecs/rt5682s.c                         |    2 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |    2 +-
 sound/soc/codecs/rt712-sdca-sdw.c                  |    2 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |    2 +-
 sound/soc/codecs/tas2781-comlib.c                  |    1 -
 sound/soc/codecs/tas2781-fmwlib.c                  |    2 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    4 +-
 sound/soc/codecs/wcd-clsh-v2.h                     |    1 +
 sound/soc/codecs/wcd-mbhc-v2.c                     |   95 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    3 +
 sound/soc/codecs/wcd939x-sdw.c                     | 1551 ++++++++
 sound/soc/codecs/wcd939x.c                         | 3686 ++++++++++++++++++++
 sound/soc/codecs/wcd939x.h                         |  989 ++++++
 sound/soc/codecs/wm_adsp.c                         |   27 +-
 sound/soc/codecs/wm_adsp.h                         |    2 +
 sound/soc/codecs/wsa884x.c                         |   53 +-
 sound/soc/fsl/eukrea-tlv320.c                      |    8 +-
 sound/soc/fsl/fsl_sai.c                            |   13 +
 sound/soc/fsl/p1022_rdk.c                          |   33 +-
 sound/soc/intel/atom/sst/sst_ipc.c                 |    3 +-
 sound/soc/intel/avs/Makefile                       |    5 +-
 sound/soc/intel/avs/apl.c                          |   58 +-
 sound/soc/intel/avs/avs.h                          |   70 +-
 sound/soc/intel/avs/board_selection.c              |   85 +
 sound/soc/intel/avs/cnl.c                          |   61 +
 sound/soc/intel/avs/core.c                         |  161 +-
 sound/soc/intel/avs/icl.c                          |  197 ++
 sound/soc/intel/avs/ipc.c                          |   66 +-
 sound/soc/intel/avs/loader.c                       |    2 +-
 sound/soc/intel/avs/messages.c                     |    1 +
 sound/soc/intel/avs/messages.h                     |   38 +-
 sound/soc/intel/avs/path.c                         |   33 +
 sound/soc/intel/avs/pcm.c                          |   77 +-
 sound/soc/intel/avs/registers.h                    |   21 +-
 sound/soc/intel/avs/skl.c                          |   59 +-
 sound/soc/intel/avs/sysfs.c                        |   35 +
 sound/soc/intel/avs/tgl.c                          |   54 +
 sound/soc/intel/avs/topology.c                     |  164 +-
 sound/soc/intel/avs/topology.h                     |   13 +
 sound/soc/intel/boards/Kconfig                     |    1 +
 sound/soc/intel/boards/sof_board_helpers.c         |  249 +-
 sound/soc/intel/boards/sof_board_helpers.h         |   29 +
 sound/soc/intel/boards/sof_cs42l42.c               |  236 +-
 sound/soc/intel/boards/sof_rt5682.c                |  151 +-
 sound/soc/intel/boards/sof_sdw.c                   |  106 +-
 sound/soc/intel/boards/sof_sdw_common.h            |   82 +-
 sound/soc/intel/boards/sof_sdw_cs42l42.c           |   35 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c           |   25 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c            |    3 +-
 sound/soc/intel/boards/sof_sdw_maxim.c             |    4 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c            |   35 +-
 sound/soc/intel/boards/sof_sdw_rt700.c             |   35 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |   19 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c        |   39 +-
 sound/soc/intel/boards/sof_sdw_rt715.c             |   12 +-
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c        |   12 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c            |   53 +-
 .../soc/intel/boards/sof_sdw_rt_sdca_jack_common.c |   19 +-
 sound/soc/intel/boards/sof_ssp_common.h            |    8 +
 sound/soc/intel/catpt/dsp.c                        |    4 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   12 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   10 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |  102 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   61 +-
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |    4 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |    6 +-
 sound/soc/meson/aiu.c                              |   19 +-
 sound/soc/meson/aiu.h                              |    1 -
 sound/soc/meson/axg-fifo.c                         |   25 +-
 sound/soc/meson/axg-fifo.h                         |   14 +-
 sound/soc/meson/axg-frddr.c                        |   13 +-
 sound/soc/meson/axg-spdifin.c                      |    6 +-
 sound/soc/meson/axg-tdm-interface.c                |   31 +-
 sound/soc/meson/axg-toddr.c                        |   30 +-
 sound/soc/meson/t9015.c                            |   20 +-
 sound/soc/pxa/Kconfig                              |    3 -
 sound/soc/qcom/common.c                            |    2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |  352 +-
 sound/soc/sh/rz-ssi.c                              |    2 +-
 sound/soc/soc-compress.c                           |    4 +
 sound/soc/soc-core.c                               |   24 +-
 sound/soc/soc-dapm.c                               |    8 +-
 sound/soc/sof/amd/Kconfig                          |   18 +
 sound/soc/sof/amd/acp-common.c                     |   65 +-
 sound/soc/sof/amd/acp-dsp-offset.h                 |   10 +
 sound/soc/sof/amd/acp-loader.c                     |   34 +-
 sound/soc/sof/amd/acp.c                            |  252 +-
 sound/soc/sof/amd/acp.h                            |   33 +-
 sound/soc/sof/amd/pci-acp63.c                      |    7 +
 sound/soc/sof/amd/vangogh.c                        |    9 +-
 sound/soc/sof/core.c                               |   10 +
 sound/soc/sof/debug.c                              |    8 +-
 sound/soc/sof/fw-file-profile.c                    |   18 +-
 sound/soc/sof/imx/imx8.c                           |   16 +
 sound/soc/sof/imx/imx8m.c                          |   10 +
 sound/soc/sof/imx/imx8ulp.c                        |   10 +
 sound/soc/sof/intel/hda-common-ops.c               |    1 +
 sound/soc/sof/intel/hda-dai-ops.c                  |   51 +-
 sound/soc/sof/intel/hda-dai.c                      |   17 +-
 sound/soc/sof/intel/hda-dsp.c                      |    5 +
 sound/soc/sof/intel/hda-stream.c                   |    9 +
 sound/soc/sof/intel/hda.c                          |   80 +-
 sound/soc/sof/intel/hda.h                          |    5 +
 sound/soc/sof/intel/lnl.c                          |   24 +-
 sound/soc/sof/ipc3-loader.c                        |    2 +
 sound/soc/sof/ipc3-pcm.c                           |   25 +
 sound/soc/sof/ipc3-topology.c                      |   40 +
 sound/soc/sof/ipc4-pcm.c                           |   19 +-
 sound/soc/sof/ipc4-priv.h                          |    4 +
 sound/soc/sof/ipc4-topology.c                      |   28 +-
 sound/soc/sof/ops.h                                |    9 +
 sound/soc/sof/sof-audio.c                          |    8 +-
 sound/soc/sof/sof-audio.h                          |    2 +
 sound/soc/sof/sof-priv.h                           |   10 +
 sound/soc/sof/topology.c                           |   30 +-
 sound/soc/ti/j721e-evm.c                           |    4 +-
 sound/soc/ti/omap-hdmi.c                           |   10 +-
 224 files changed, 13139 insertions(+), 2591 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-avs
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,asoc-wm8904.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sam9x5-wm8731-audio.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-wm8904.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,asrc.txt
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt1015.txt
 create mode 100644 drivers/soundwire/amd_init.c
 create mode 100644 drivers/soundwire/amd_init.h
 create mode 100644 include/sound/cs-amp-lib.h
 create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c
 create mode 100644 sound/soc/codecs/cs-amp-lib-test.c
 create mode 100644 sound/soc/codecs/cs-amp-lib.c
 create mode 100644 sound/soc/codecs/framer-codec.c
 create mode 100644 sound/soc/codecs/wcd939x-sdw.c
 create mode 100644 sound/soc/codecs/wcd939x.c
 create mode 100644 sound/soc/codecs/wcd939x.h
 create mode 100644 sound/soc/intel/avs/cnl.c
 create mode 100644 sound/soc/intel/avs/icl.c
 create mode 100644 sound/soc/intel/avs/sysfs.c
 create mode 100644 sound/soc/intel/avs/tgl.c

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB05F306B
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 14:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E76901865;
	Mon,  3 Oct 2022 14:46:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E76901865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664801244;
	bh=T/zkTwY+/6S7fxY7tHrt74fJR8teaSVjiHTyiAXR2pI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cT+4TrjKOoXxIZ1BgOW1MSNfOkV/MeFjU1ur3tYz7D7uqg0KJwxfuSDmP244a9CdN
	 U+OZ6DcZLcB9KJmqWbgwUvtnUhPQKIGBGYmRuTX160HwjlLUvII9neW4rlya0mATif
	 mzH4ajL36eyqyQNweMJhCyjaNmOaxvdC/ykVq27A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46EFFF80431;
	Mon,  3 Oct 2022 14:46:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB0BF80269; Mon,  3 Oct 2022 14:46:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BA39F800CC
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 14:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA39F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="APJuRTvG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8C67EB80766;
 Mon,  3 Oct 2022 12:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4ECC433D6;
 Mon,  3 Oct 2022 12:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664801177;
 bh=T/zkTwY+/6S7fxY7tHrt74fJR8teaSVjiHTyiAXR2pI=;
 h=From:To:Cc:Subject:Date:From;
 b=APJuRTvGeJ5ENACNbHHWsAmQsG3N8JIKOR4yDXTy4ld5hlZC1kCOg5q/4GxmXpXRn
 9hLkO6mfgFWa6P0c4EGe4wyG1L6gSNHzIFyLSWBVWp9IQPIDOVHZsfgSuaClenqs7u
 xO7kw/pXVvWIJjLSiInBxIr100U80Cj0m1Co6pC4f3SnIgjKa0kxYxZzNXr53B9P6M
 miqFOPez4dj7FzIr2pfpTITqQ82t82MGB63Y57mmWwaoN0NFE+sPGfDDp/LYMBhDlf
 4sliVIRYRRFeHR1kNzMRGfDfA0j5wj64qVv4NaKMcUc0dpB82RBtrYo+ojGY8yv1oK
 r7jqwKWf4RU5w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v6.1
Date: Mon, 03 Oct 2022 13:46:05 +0100
Message-Id: <20221003124616.9A4ECC433D6@smtp.kernel.org>
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

The following changes since commit 80e78fcce86de0288793a0ef0f6acf37656ee4cf:

  Linux 6.0-rc5 (2022-09-11 16:22:01 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.1

for you to fetch changes up to f0c8d7468af0001b80b0c86802ee28063f800987:

  ASoC: rockchip: i2s: use regmap_read_poll_timeout_atomic to poll I2S_CLR (2022-09-30 17:12:27 +0100)

----------------------------------------------------------------
ASoC: Updates for v6.1

This has been a very quiet release for the core but quite a busy one for
drivers with a big crop of new drivers and lots of feature additions and
fixes to existing ones:

 - A new string helper parse_int_array_user().
 - Improvements to the SOF IPC4 code, especially around trace.
 - Support for AMD Rembrant DSPs, AMD Pink Sardine ACP 6.2, Apple Silcon
   systems, Everest ES8326, Intel Sky Lake and Kaby Lake, MediaTek
   MT8186 support, NXP i.MX8ULP DSPs, Qualcomm SC8280XP, SM8250 and SM8450
   and Texas Instruments SRC4392

There is a conflict with the conversion of I2C remove functions to void
in the cs42l42 driver which is fairly straightforward to resolve but
should be highlighted to Linus.

----------------------------------------------------------------
Aidan MacDonald (2):
      ASoC: wcd9335: Convert irq chip to config regs
      ASoC: wcd938x: Remove spurious type_base from irq chip

Ajit Kumar Pandey (2):
      ASoC: amd: acp: Initialize list to store acp_stream during pcm_open
      ASoC: SOF: amd: Make ACP core code generic for newer SOC transition

Alexander Martinz (1):
      ASoC: codecs: tfa989x: fix register access comments

AngeloGioacchino Del Regno (6):
      ASoC: mediatek: mt8195-mt6359: Properly register sound card for SOF
      ASoC: SOF: mediatek: mt8195: Import namespace SND_SOC_SOF_MTK_COMMON
      ASoC: SOF: mediatek: mt8195: Add mailbox generic callbacks for IPC
      ASoC: SOF: mediatek: mt8195: Add generic pcm_{open,close} callbacks
      ASoC: SOF: mediatek: mt8195: Add devicetree support to select topologies
      ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops instead of custom ops

Astrid Rost (3):
      ASoC: ts3a227e: add parameters to control debounce times
      ASoC: ti,ts3a227e: convert to yaml
      ASoC: ti,ts3a227e: add control of debounce

Ban Tao (2):
      ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
      ASoC: sunxi: Add Allwinner H6 Digital MIC driver

Bard Liao (3):
      ASoC: SOF: add widget setup/free tracing
      ASoC: SOF: Intel: replace dev_vdbg with tracepoints
      ASoC: Intel: soc-acpi-intel-rpl-match: add rpl_sdca_3_in_1 support

Brent Lu (1):
      ASoC: Intel: sof_rt5682: remove SOF_RT1015_SPEAKER_AMP_100FS flag

Cezary Rojewski (6):
      ASoC: Intel: hsw_rt5640: Rename module
      ASoC: Intel: bdw_rt286: Rename module
      ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH dependency
      ASoC: Intel: Drop legacy HSW/BDW board-match information
      lib/string_helpers: Introduce parse_int_array_user()
      ASoC: SOF: Remove strsplit_u32() and tokenize_input()

Christophe JAILLET (3):
      ASoC: tlv320adcx140: Fix a typo in a comment
      ASoC: sam9g20_wm8731: Simplify some error message
      ASoC: da7219: Fix an error handling path in da7219_register_dai_clks()

Chunxu Li (13):
      ASoC: mediatek: mt8186: support DSP downlink
      ASoC: mediatek: mt8186: add SOF support on mt8186-mt6366-rt1019-rt5682s
      ASoC: mediatek: mt8186: add SOF support on mt8186-mt6366-da7219-max98357
      ASoC: SOF: Introduce function sof_of_machine_select
      ASoC: SOF: mediatek: Add sof_mt8186_machs for mt8186
      ASoC: SOF: mediatek: Add dai driver for mt8186
      ASoC: SOF: mediatek: add snd_sof_dsp_ops callbacks for pcm and mail box
      ASoC: SOF: mediatek: Use generic implementation for .ipc_msg_data field
      ASoC: SOF: Introduce function sof_of_machine_select
      ASoC: SOF: mediatek: add pcm_hw_params callback for mt8186
      ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
      ASoC: SOF: mediatek: mt8195: Add pcm_hw_params callback
      ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback

Colin Ian King (1):
      ASoC: mediatek: mt8186: Fix spelling mistake "slect" -> "select"

Cristian Ciocaltea (1):
      ASoC: wm_adsp: Handle optional legacy support

Dan Carpenter (3):
      ASoC: mediatek: mt8186: remove unnecessary NULL check
      ASoC: mt6359: fix tests for platform_get_irq() failure
      ASoC: amd: acp: remove unnecessary NULL checks

Daniel Baluta (3):
      ASoC: SOF: compress: Remove byte offset computation
      ASoC: SOF: compress: Introduce sof_compr_stream
      ASoC: SOF: compress: Remove dai_posn variable

Daniel Mack (2):
      ASoC: dt-bindings: max98396: Document data monitor properties
      ASoC: max98396: Make data monitor features configurable

David Lin (3):
      ASoC: nau8825: Add ADCOUT IO drive strength control
      ASoC: dt-bindings: nau8825: Add ADCOUT IO drive strength control
      ASoC: nau8825: Add TDM support

Derek Fang (3):
      ASoC: rt5682s: Reduce coupling of Micbias and Vref2 settings
      ASoC: rt5682s: Reduce coupling of I2S1 setting
      ASoC: rt5682s: Reduce coupling of PLLB setting

Dmitry Torokhov (3):
      ASoC: simple-card-utils: switch to using gpiod API
      ASoC: ssm2518: drop support for platform data
      ASoC: ssm2518: switch to using gpiod API

Fabio Estevam (1):
      ASoC: tas2562: Propagate the error in tas2562_dac_event()

Fred Oh (4):
      ASoC: SOF: Intel: introduce new op to handle dsp power down
      ASoC: SOF: Intel: define and set power_down_dsp op for HDA platforms
      ASoC: SOF: Intel: mtl: define and set power_down_dsp op
      ASoC: SOF: Intel: use power_down_dsp op in hda_dsp_remove

Gaosheng Cui (2):
      ASoC: Intel: fix unused-variable warning in probe_codec
      ASoC: fsl: Remove unused inline function imx_pcm_dma_params_init_data()

Gustavo A. R. Silva (2):
      ASoC: SOF: control.h: Replace zero-length array with DECLARE_FLEX_ARRAY() helper
      ASoC: Intel: Skylake: Replace zero-length arrays with DECLARE_FLEX_ARRAY() helper

Jairaj Arava (1):
      ASoC: SOF: pci: Change DMI match info to support all Chrome platforms

Jaroslav Kysela (1):
      ASoC: core: clarify the driver name initialization

Jiasheng Jiang (1):
      ASoC: rsnd: Add check for rsnd_mod_power_on

Jinpeng Cui (1):
      ASoC: codecs: max98088: remove redundant ret variable

Jonathan Cameron (1):
      ASoC: samsung: Use iio_get_channel_type() accessor.

Judy Hsiao (2):
      ASoC: rockchip: i2s: use regmap_read_poll_timeout to poll I2S_CLR
      ASoC: rockchip: i2s: use regmap_read_poll_timeout_atomic to poll I2S_CLR

Kai Vehmanen (2):
      ASoC: Intel: common: add ACPI matching tables for Raptor Lake
      ASoC: SOF: Intel: pci-tgl: use RPL specific firmware definitions

Kevin Lu (1):
      ASoC: tlv320adcx140: Add a new kcontrol

Krzysztof Kozlowski (14):
      ASoC: codecs: allow compile testing without MFD drivers
      ASoC: codecs: rk817: fix missing I2C dependency in compile test
      ASoC: codecs: wcd934x: add Slimbus dependency
      ASoC: codecs: rk817: drop I2C dependencies
      ASoC: dt-bindings: qcom,q6core: remove binding
      ASoC: dt-bindings: qcom,q6afe: remove binding
      dt-bindings: soc: qcom: apr: correct service children
      ASoC: dt-bindings: qcom,q6asm: convert to dtschema
      ASoC: dt-bindings: qcom,q6adm: convert to dtschema
      ASoC: dt-bindings: qcom,q6dsp-lpass-ports: cleanup example
      ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
      ASoC: dt-bindings: qcom,q6apm-dai: adjust indentation in example
      dt-bindings: soc: qcom: apr: add missing properties
      ASoC: MAINTAINERS: add bindings and APR to Qualcomm Audio entry

Kuninori Morimoto (14):
      ASoC: soc-pcm.c: summarize related settings at soc_new_pcm()
      ASoC: soc-pcm.c: call __soc_pcm_close() in soc_pcm_close()
      ASoC: soc-pcm.c: remove unnecessary codec2codec_close_delayed_work()
      ASoC: soc-pcm.c: add soc_pcm_ret()
      ASoC: soc-pcm.c: check fe condition at out of loop
      ASoC: soc-dapm.c: don't use WARN_ON() at snd_soc_dai_link_event_pre_pmu()
      ASoC: soc-dapm.c: fixup snd_soc_dapm_new_control_unlocked() error handling
      ASoC: soc-dapm.c: add comment for kzalloc()/kfree() on snd_soc_dai_link_event_pre_pmu()
      ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()
      ASoC: hdmi-codec.c: use devm_kzalloc() for DMA data
      ASoC: soc-core.c: setup rtd->pmdown_time at soc_new_pcm_runtime()
      ASoC: soc.h: remove num_cpus/codecs
      ASoC: soc.h: use defined number instead of direct number
      ASoC: soc.h: use array instead of playback/capture_widget

Laurentiu Mihalcea (4):
      ASoC: SOF: compress: Save channel count and sample bytes
      ASoC: SOF: compress: Add support for computing timestamps
      ASoC: SOF: compress: Move sof_compr_copy functionality
      ASoC: SOF: compress: Add copy function for capture case

Liang He (1):
      ASoC: eureka-tlv320: Hold reference returned from of_find_xxx API

Marek Vasut (2):
      ASoC: st,stm32-sai: Document audio OF graph port
      ASoC: dt-bindings: Document audio OF graph dai-tdm-slot-num dai-tdm-slot-width props

Mario Limonciello (1):
      ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks table

Mark Brown (46):
      ASoC: Replace sprintf() with sysfs_emit()
      DT binding for sample format conversion
      Add support for linked list to store acp_stream and tdm support.
      ASoC: Intel: HSW and BDW updates
      ASoC/soundwire: log actual PING status on resume issues
      Enable timestamp support for SOF compress driver
      ASoC: cs42l42: Some small code improvements
      ASoC: mediatek: support SOF for mt8186
      Introduce sof_of_machine_select
      ASoC: SOF: Intel: hda: Correct Firmware State Register use
      ASoC: mediatek: dt-bindings: modify machine
      ASoC: SOF: mediatek: update SOF driver for mt8186
      ASoC platform driver for Apple MCA
      ASoC: Cleanup deprecated regmap-irq functionality
      TAS2764 fixes/extensions
      Add Pink Sardine platform ASoC driver
      ASoC: SOF: compress: Add support for timestamp on capture
      ASoC: codecs: minor cppcheck cleanups
      ASoC: soc-pcm.c: random cleanup
      Untested TAS2562 power setting fixes
      lib/string_helpers: Introduce parse_int_array_user()
      ASoC: soc-dapm.c: random cleanup
      ASoC: Fixes for MT8195 SOF support
      ASoC: soc-dapm.c: random cleanup retry
      ASoC: mediatek: Set i2s clock sharing from machine drivers
      ASoC: Merge tag 'v6.0-rc4' into asoc-6.1
      ASoC: Drop mistakenly applied DTS patch
      ASoC/qcom/arm64: Qualcomm ADSP DTS and binding fixes
      ASoC: qcom: add support for sc8280xp machine
      ASoC: SOF: start using tracing instead of dev_dbg
      ASoC: SOF: Intel: override mclk_id for ES8336 support
      Support for CS42L83 on Apple machines
      ASoC: soc.h: random cleanup
      ASoC: SOF: sof-audio: fix prepare/unprepare
      ASoC: SOF: ipc4-topology: minor cleanup
      Add some models into acp6x quirk list
      ADD SOF support for rembrandt platform
      ASoC: SOF: Add SKL/KBL support for IPC4 CI tests
      ASoC: ts3a227e control debounce times
      ASoC: mediatek: Allow separate handling of headphone and headset mic jack
      ASoC: SOF: Intel: MTL: Fixes for suspend/resume
      ASoC: codecs: qcom add support for SM8450 and SC8280XP
      ASoC: SOF: ipc4/Intel: Improve and enable IPC error dump
      ASoC: SOF: mediatek: mt8195: Add dsp_ops callback
      Fix PM disable depth imbalance in stm32 probe
      Fix PM disable depth imbalance in probe

Martin Povišer (22):
      ASoC: Change handling of unimplemented set_bclk_ratio
      ASoC: apple: mca: Start new platform driver
      ASoC: apple: mca: Add locking
      ASoC: Add Apple MCA I2S transceiver bindings
      ASoC: tas2764: Allow mono streams
      ASoC: tas2764: Drop conflicting set_bias_level power setting
      ASoC: tas2764: Fix mute/unmute
      ASoC: tas2764: Add IRQ handling
      ASoC: tas2764: Export highpass filter setting
      ASoC: apple: mca: Unselect COMMON_CLK in Kconfig
      MAINTAINERS: Fix file pattern for ARM/APPLE MACHINE SOUND DRIVERS
      ASoC: tas2562: Drop conflicting set_bias_level power setting
      ASoC: tas2562: Fix mute/unmute
      ASoC: apple: mca: Postpone requesting of DMA channels
      ASoC: dt-bindings: cs42l42: Add 'cs42l83' compatible
      ASoC: cs42l42: Export regmap elements to core namespace
      ASoC: cs42l83: Extend CS42L42 support to new part
      ASoC: cs42l42: Implement 'set_bclk_ratio'
      ASoC: cs42l42: Switch to dev_err_probe() helper
      ASoC: apple: mca: Trigger, not deassert, the peripheral reset
      ASoC: apple: mca: Remove stale release of DMA channels
      ASoC: apple: mca: Adjust timing of component unregister

Matt Flax (2):
      ASoC: codecs: add support for the TI SRC4392 codec
      ASoC: codecs: dt bind. doc for the new TI SRC4392 codec

Mikhail Rudenko (2):
      ASoC: sunxi: sun4i-codec: silence misleading error in probe
      ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU DAI component

Muralidhar Reddy (1):
      ALSA: intel-dspconfig: add ES8336 support for AlderLake-PS

Nathan Chancellor (3):
      ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
      ASoC: codes: src4xxx: Avoid clang -Wsometimes-uninitialized in src4xxx_hw_params()
      ASoC: Intel: sof_da7219_mx98360a: Access num_codecs through dai_link

Noah Klayman (5):
      ASoC: SOF: Intel: add HDA interrupt source tracing
      ASoC: SOF: Intel: remove unneeded dev_vdbg
      ASoC: SOF: remove unneeded dev_vdbg
      ASoC: SOF: replace dev_vdbg with tracepoints
      ASoC: SOF: replace ipc4-loader dev_vdbg with tracepoints

Nícolas F. R. A. Prado (17):
      ASoC: mediatek: mt8192: Allow setting shared clocks from machine driver
      ASoC: mediatek: mt8192-mt6359: Make i2s9 share the clock from i2s8
      ASoC: mediatek: mt8192: Remove clock share parsing from DT
      ASoC: mediatek: mt8183: Allow setting shared clocks from machine driver
      ASoC: mediatek: mt8183: Configure shared clocks
      ASoC: mediatek: mt8183: Remove clock share parsing from DT
      arm64: dts: mediatek: kukui: Remove i2s-share properties
      ASoC: mediatek: mt8186: Allow setting shared clocks from machine driver
      ASoC: mediatek: mt8186: Configure shared clocks
      ASoC: mediatek: mt8186: Remove clock share parsing from DT
      ASoC: mediatek: mt8192-mt6359: Expose individual headset jack pins
      ASoC: mediatek: mt8195: Expose individual headset jack pins
      ASoC: mediatek: mt8186-da7219: Add headset widgets with switches
      ASoC: mediatek: mt8186-da7219: Expose individual headset jack pins
      ASoC: mediatek: mt8186-rt5682: Add headset widgets with switches
      ASoC: mediatek: mt8186-rt5682: Expose individual headset jack pins
      ASoC: mediatek: mt8192-mt6359: Set the driver name for the card

Peter Ujfalusi (19):
      ASoC: SOF: Intel: hda-loader: Use the FSR state definitions during bootup
      ASoC: SOF: Intel: hda: Drop no longer used ROM state definitions
      ASoC: SOF: ipc4-loader: Verify ext manifest magic number
      ASoC: SOF: Intel: hda: Skip IMR boot after a firmware crash or boot failure
      ASoC: SOF: ipc4: Only print LOG BUFFER update message info if requested
      ASoC: SOF: ipc4: Add macro to get core ID from log buffer status message
      ASoC: SOF: ipc4: Add define for the outbox window index
      ASoC: SOF: ipc4: Configure the debug box offset
      ASoC: SOF: ipc4: Add support for mtrace log extraction
      ASoC: SOF: Intel: icl: Set IPC4-specific DSP ops
      ASoC: SOF: Intel: Add mtrace type information for IPC4
      ASoC: max98390: Fix dsm calibration reading
      ASoC: SOF: ipc4-topology: Free the ida when IPC fails in sof_ipc4_widget_setup()
      ASoC: SOF: Intel: cnl: Add separate ops for ipc_dump for IPC4
      ASoC: SOF: Intel: hda: Add separate ops for ipc_dump for IPC4
      ASoC: SOF: Intel: skl: Use the ipc4 version of the ipc_dump
      ASoC: SOF: Intel: mtl: Print relevant register in ipc_dump
      ASoC: SOF: Intel: hda: Only dump firmware registers for IPC3
      ASoC: SOF: ipc4: Call snd_sof_handle_fw_exception() in case of timeout

Pierre-Louis Bossart (22):
      soundwire: add read_ping_status helper definition in manager ops
      soundwire: intel/cadence: expose PING status in manager ops
      soundwire: add sdw_show_ping_status() helper
      ASoC: codecs: show PING status on resume failures
      ASoC: SOF: imx: imx8ulp: declare ops structure as static
      ASoC: hdmi-codec: remove unused definitions
      ASoC: wcd-mbhc-v2: remove always-true condition
      ASoC: wcd9335: remove always-true condition
      ASoC: fsl: fsl-utils: remove useless assignment
      ASoC: ti: omap-mcbsp: remove useless assignment
      ASoC: SOF: Intel: hda: refine SSP count support
      ASoC: SOF: add quirk to override topology mclk_id
      ALSA: hda: intel-nhlt: add intel_nhlt_ssp_mclk_mask()
      ASoC: SOF: Intel: hda: override mclk_id after parsing NHLT SSP blob
      ASoC: SOF: Intel: hda-dsp: expose functions for SKL support
      ASoC: SOF: Intel: add SKL/KBL hardware code loader
      ASoC: SOF: Intel: add initial SKL/KBL hardware support
      ASoC: SOF: Intel: add ops for SKL/KBL
      ASoC: SOF: ipc4-topology: clarify calculation precedence
      ASoC: SOF: ipc4-topology: remove useless assignment
      ASoC: SOF: Intel: pci-tgl: reorder PCI IDs
      ASoC: SOF: pci-tgl: add missing PCI IDs for RPL

Pieterjan Camerlynck (1):
      ASoC: fsl_sai: fix incorrect mclk number in error message

Rander Wang (2):
      ASoC: SOF: clear prepare state when widget is unprepared
      ASoC: SOF: don't unprepare widget used other pipelines

Ranjani Sridharan (5):
      ASoC: SOF: Intel: Add a new op for disabling interrupts
      ASoC: SOF: Intel: define and set the disable_interrupts op for cavs platforms
      ASoC: SOF: Intel: MTL: define and set the disable_interrupts op
      ASoC: SOF: Intel: HDA: use IPC version-specific ops
      ASoC: SOF: Intel: MTL: reuse the common ops for PM

Ren Zhijie (1):
      ASoC: codecs: wcd934x: Fix Kconfig dependency

Richard Fitzgerald (13):
      ASoC: soc-utils: Improve kerneldoc for snd_soc_tdm_params_to_bclk()
      ASoC: cs42l42: Don't include kernel.h
      ASoC: cs42l42: Add include dependencies to cs42l42.h
      ASoC: cs42l42: Move cs42l42_supply_names to .c file
      ASoC: cs42l42: Fix comment typo in cs42l42_slow_start_put()
      ASoC: cs42l42: Use snd_soc_tdm_params_to_bclk()
      ASoC: soc-utils-test: Add test for snd_soc_params_to_bclk()
      ASoC: cs42l42: Add bitclock frequency argument to cs42l42_pll_config()
      ASoC: cs42l42: Use cs42l42->dev instead of &i2c_client->dev
      ASoC: cs42l42: Split probe() and remove() into stages
      ASoC: cs42l42: Split cs42l42_resume into two functions
      ASoC: cs42l42: Pass component and dai defs into common probe
      ASoC: cs42l42: Split I2C identity into separate module

Rob Herring (1):
      ASoC: dt-bindings: Add missing (unevaluated|additional)Properties on child nodes

Robert Rosengren (1):
      ASoC: fsl_spdif: add ALSA event on dpll locked

Sameer Pujar (3):
      ASoC: dt-bindings: Definitions for DAI params
      ASoC: dt-bindings: Add sample format conversion
      ASoC: simple-card-utils: Fixup DAI sample format

Sascha Hauer (1):
      ASoC: fsl_asrc_dma: fully initialize structs

Shengjiu Wang (9):
      ASoC: dt-bindings: fsl,sai: Convert format to json-schema
      ASoC: imx-rpmsg: Support configure sysclk for codec dai
      ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
      dt-bindings: dsp: fsl: Add SOF compatile string for i.MX8ULP
      ASoC: fsl_sai: Add support multi fifo sdma script
      ASoC: fsl_sai: Update slots number according to bclk_ratio
      ASoC: ak4458: Remove component probe() and remove()
      ASoC: fsl_asrc: Add initialization finishing check in runtime resume
      ASoC: ak4458: Add ak4458_reset in device probe and remove

Srinivas Kandagatla (20):
      ASoC: qcom: qdsp6: q6prm: add new clocks
      ASoC: core: remove setting platform_max in kcontrol macros
      ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
      ASoC: dt-bindings: qcom: sort compatible strings
      ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
      ASoC: qcom: sm8250: move some code to common
      ASoC: qcom: add machine driver for sc8280xp
      ASoC: codecs: wsa-macro: handle swr_reset correctly
      ASoC: codecs: rx-macro: handle swr_reset correctly
      ASoC: codecs: tx-macro: handle swr_reset correctly
      ASoC: codecs: tx-macro: fix active_decimator array
      ASoC: codecs: tx-macro: fix kcontrol put
      ASoC: codecs: wsa883x: add clock stop support
      ASoC: qcom: dt-bindings: add sm8450 and sc8280xp compatibles
      ASoC: codecs: wsa-macro: add support for sm8450 and sc8280xp
      ASoC: codecs: tx-macro: add support for sm8450 and sc8280xp
      ASoC: codecs: rx-macro: add support for sm8450 and sc8280xp
      ASoC: codecs: va-macro: clear the frame sync counter before enabling
      ASoC: codecs: va-macro: add support for sm8450 and sc8280xp
      ASoC: qcom: fix unmet direct dependencies for SND_SOC_QDSP6

Stefan Binding (2):
      ASoC: Intel: cirrus-common: Use UID to map correct amp to prefix
      ASoC: cs42l42: Fallback to headphones for type detect

Steve Lee (1):
      ASoC: max98390: Remove unnecessary amp on/off conrtol

Syed Saba Kareem (13):
      ASoC: amd: add Pink Sardine platform ACP IP register header
      ASoC: amd: add Pink Sardine ACP PCI driver
      ASoC: amd: add acp6.2 init/de-init functions
      ASoC: amd: add platform devices for acp6.2 pdm driver and dmic driver
      ASoC: amd: add acp6.2 pdm platform driver
      ASoC: amd: add acp6.2 irq handler
      ASoC: amd: add acp6.2 pdm driver dma ops
      ASoC: amd: add acp6.2 pci driver pm ops
      ASoC: amd: add acp6.2 pdm driver pm ops
      ASoC: amd: enable Pink Sardine acp6.2 drivers build
      ASoC: amd: create platform device for acp6.2 machine driver
      ASoC: amd: add Pink Sardine machine driver using dmic
      ASoC: amd: enable Pink sardine platform machine driver build.

Syed Saba kareem (1):
      ASoC: amd: fix spelling mistake: "i.e" -> "i.e."

Takashi Iwai (8):
      ASoC: cs43130: Replace scnprintf() with sysfs_emit()
      ASoC: tlv320aic26: Replace sprintf() with sysfs_emit()
      ASoC: Intel: sst: Replace sprintf() with sysfs_emit()
      ASoC: Intel: catpt: Replace sprintf() with sysfs_emit()
      ASoC: Intel: skylake: Replace sprintf() with sysfs_emit()
      ASoC: core: Replace sprintf() with sysfs_emit()
      ASoC: DAPM: Replace sprintf() calls with sysfs_emit_at()
      ASoC: omap: Replace sprintf() with sysfs_emit()

Tommaso Merciai (1):
      ASoC: max98088: add support for noise gate reg

Trevor Wu (1):
      ASoC: mediatek: mt8195: update audio tuner settings

V sujith kumar Reddy (3):
      ASoC: SOF: amd: Add support for Rembrandt plaform.
      ASoC: SOF: Adding amd HS functionality to the sof core
      ASoC: SOF: amd: increase SRAM inbox and outbox size to 1024

Venkata Prasad Potturu (2):
      ASoC: amd: acp: Add TDM support for acp i2s stream
      ASoC: amd: acp: Modify dai_id macros to be more generic

Xiangsheng Hou (1):
      dt-bindings: mediatek: Add axi clock in mt8173 dts example

Xiaoyan Li (1):
      ASoC: amd: yc: Add ASUS UM5302TA into DMI table

Xin Gao (2):
      ASoC: Variable type completion
      ASoC: Variable type completion

Yang Yingliang (11):
      ASoC: codecs: es8326: change es8326_regmap_config to static
      ASoC: amd: acp: add missing platform_device_unregister() in acp_pci_probe()
      ASoC: amd: acp: switch to use dev_err_probe()
      ASoC: amd: acp: add a label to make error path more clean
      ASoC: SOF: imx8ulp: add missing of_node_put() in imx8ulp_probe()
      ASoC: sigmadsp: switch to use kmemdup_nul() helper
      ASoC: bcm2835-i2s: Switch to use dev_err_probe() helper
      ASoC: cs42l42: Switch to use dev_err_probe() helper
      ASoC: soc-dapm: Switch to use dev_err_probe() helper
      ASoC: rt5682s: simplify the return of rt5682s_probe()
      ASoC: Intel: skylake: remove unnecessary dev_set_drvdata()

Yong Zhi (1):
      ASoC: SOF: Intel: MTL: remove the unnecessary snd_sof_dsp_read()

Zeng Heng (1):
      ASoC: sunxi: fix declaration compile error

Zhang Peng (1):
      ASoC: SOF: imx: Add i.MX8ULP HW support

Zhang Qilong (8):
      ASoC: soc-component: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      ASoC: stm32: dfsdm: Fix PM disable depth imbalance in stm32_adfsdm_probe
      ASoC: stm32: spdifrx: Fix PM disable depth imbalance in stm32_spdifrx_probe
      ASoC: stm: Fix PM disable depth imbalance in stm32_i2s_probe
      ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
      ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
      ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
      ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe

Zhu Ning (3):
      ASoC: dt-bindings: Add Everest ES8326 audio CODEC
      ASoC: codecs: add support for ES8326
      ASoC: codecs: add suspend and resume for ES8316

chunxu.li (3):
      ASoC: mediatek: mt8186: rename sound card name
      ASoC: mediatek: dt-bindings: modify machine bindings for SOF
      ASoC: mediatek: dt-bindings: modify machine bindings for SOF

ye xingchen (10):
      ASoC: atmel_ssc_dai: Remove the unneeded result variable
      ASoC: sti-sas: Remove the unneeded result variable
      ASoC: Intel: sof_nau8825: use function devm_kcalloc() instead of devm_kzalloc()
      ASOC: SOF: use devm_kcalloc() instead of devm_kzalloc()
      ASoC: amd: acp: use devm_kcalloc() instead of devm_kzalloc()
      ASoC: Intel: sof_cs42l42: use function devm_kcalloc() instead of devm_kzalloc()
      ASoC: Intel: sof_ssp_amp: use devm_kcalloc() instead of devm_kzalloc()
      ASoC: amd: acp: use function devm_kcalloc() instead of devm_kzalloc()
      ASoC: Intel: sof_es8336: use function devm_kcalloc() instead of devm_kzalloc()
      ASoC: Intel: sof_rt5682: use devm_kcalloc() instead of devm_kzalloc()

 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml |    1 +
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |  112 +-
 .../devicetree/bindings/sound/adi,max98396.yaml    |   34 +
 .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   |   79 ++
 .../bindings/sound/amlogic,gx-sound-card.yaml      |    2 +
 .../devicetree/bindings/sound/apple,mca.yaml       |  131 +++
 .../bindings/sound/audio-graph-port.yaml           |   25 +-
 .../devicetree/bindings/sound/audio-graph.yaml     |    9 +-
 .../devicetree/bindings/sound/cirrus,cs42l42.yaml  |    1 +
 .../devicetree/bindings/sound/dai-params.yaml      |   40 +
 .../devicetree/bindings/sound/everest,es8326.yaml  |  116 ++
 .../devicetree/bindings/sound/fsl,sai.yaml         |  216 ++++
 .../devicetree/bindings/sound/fsl-sai.txt          |   95 --
 .../bindings/sound/google,sc7180-trogdor.yaml      |    4 +
 .../devicetree/bindings/sound/imx-audio-card.yaml  |    2 +
 .../sound/mt8186-mt6366-da7219-max98357.yaml       |   10 +
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        |   10 +
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |    4 +
 .../devicetree/bindings/sound/nau8825.txt          |    3 +
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |    2 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |    2 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |    2 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |    2 +
 .../bindings/sound/qcom,q6adm-routing.yaml         |   52 +
 .../devicetree/bindings/sound/qcom,q6adm.txt       |   39 -
 .../devicetree/bindings/sound/qcom,q6afe.txt       |   20 -
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |   21 +-
 .../devicetree/bindings/sound/qcom,q6asm-dais.yaml |  112 ++
 .../devicetree/bindings/sound/qcom,q6asm.txt       |   70 --
 .../devicetree/bindings/sound/qcom,q6core.txt      |   21 -
 .../bindings/sound/qcom,q6dsp-lpass-clocks.yaml    |   36 +-
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |   64 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   10 +-
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |   14 +-
 .../bindings/sound/samsung,aries-wm8994.yaml       |    2 +
 .../bindings/sound/samsung,midas-audio.yaml        |    2 +
 .../devicetree/bindings/sound/samsung,snow.yaml    |    2 +
 .../devicetree/bindings/sound/st,stm32-sai.yaml    |    5 +
 .../devicetree/bindings/sound/ti,src4xxx.yaml      |   48 +
 .../devicetree/bindings/sound/ti,ts3a227e.yaml     |   94 ++
 .../devicetree/bindings/sound/ts3a227e.txt         |   30 -
 .../bindings/spi/mediatek,spi-mtk-nor.yaml         |    5 +-
 MAINTAINERS                                        |   19 +
 drivers/soundwire/bus.c                            |   32 +
 drivers/soundwire/cadence_master.c                 |    8 +
 drivers/soundwire/cadence_master.h                 |    2 +
 drivers/soundwire/intel.c                          |    1 +
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |   18 +
 include/linux/platform_data/ssm2518.h              |   21 -
 include/linux/soundwire/sdw.h                      |    5 +
 include/linux/string_helpers.h                     |    2 +
 include/sound/acp62_chip_offset_byte.h             |  444 ++++++++
 include/sound/cs42l42.h                            |    1 +
 include/sound/intel-nhlt.h                         |    7 +
 include/sound/simple_card_utils.h                  |    1 +
 include/sound/soc-acpi-intel-match.h               |    3 +-
 include/sound/soc.h                                |   36 +-
 include/sound/sof.h                                |    2 +
 include/sound/sof/control.h                        |    6 +-
 include/sound/sof/dai.h                            |    2 +
 include/sound/sof/ipc4/header.h                    |    5 +
 include/trace/events/sof.h                         |  121 ++
 include/trace/events/sof_intel.h                   |  148 +++
 lib/string_helpers.c                               |   44 +
 sound/hda/intel-dsp-config.c                       |    5 +
 sound/hda/intel-nhlt.c                             |   79 ++
 sound/soc/Kconfig                                  |    1 +
 sound/soc/Makefile                                 |    1 +
 sound/soc/amd/Kconfig                              |   23 +-
 sound/soc/amd/Makefile                             |    1 +
 sound/soc/amd/acp/acp-i2s.c                        |   80 +-
 sound/soc/amd/acp/acp-mach-common.c                |    4 +-
 sound/soc/amd/acp/acp-pci.c                        |   19 +-
 sound/soc/amd/acp/acp-platform.c                   |   44 +-
 sound/soc/amd/acp/amd.h                            |   22 +-
 sound/soc/amd/ps/Makefile                          |    9 +
 sound/soc/amd/ps/acp62.h                           |   98 ++
 sound/soc/amd/ps/pci-ps.c                          |  351 ++++++
 sound/soc/amd/ps/ps-mach.c                         |   79 ++
 sound/soc/amd/ps/ps-pdm-dma.c                      |  452 ++++++++
 sound/soc/amd/vangogh/acp5x-mach.c                 |    2 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   14 +
 sound/soc/apple/Kconfig                            |    8 +
 sound/soc/apple/Makefile                           |    3 +
 sound/soc/apple/mca.c                              | 1174 ++++++++++++++++++++
 sound/soc/atmel/atmel_ssc_dai.c                    |    5 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |    2 +-
 sound/soc/bcm/bcm2835-i2s.c                        |   11 +-
 sound/soc/codecs/Kconfig                           |   44 +-
 sound/soc/codecs/Makefile                          |   12 +-
 sound/soc/codecs/ak4458.c                          |   57 +-
 sound/soc/codecs/cs42l42-i2c.c                     |  106 ++
 sound/soc/codecs/cs42l42.c                         |  286 ++---
 sound/soc/codecs/cs42l42.h                         |   37 +-
 sound/soc/codecs/cs42l83-i2c.c                     |  242 ++++
 sound/soc/codecs/cs43130.c                         |   11 +-
 sound/soc/codecs/da7219.c                          |    5 +-
 sound/soc/codecs/es8316.c                          |   22 +
 sound/soc/codecs/es8326.c                          |  905 +++++++++++++++
 sound/soc/codecs/es8326.h                          |  182 +++
 sound/soc/codecs/hdmi-codec.c                      |   14 +-
 sound/soc/codecs/lpass-rx-macro.c                  |   18 +-
 sound/soc/codecs/lpass-tx-macro.c                  |   36 +-
 sound/soc/codecs/lpass-va-macro.c                  |   82 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   19 +-
 sound/soc/codecs/max98088.c                        |    7 +-
 sound/soc/codecs/max98373-sdw.c                    |    2 +
 sound/soc/codecs/max98390.c                        |   80 +-
 sound/soc/codecs/max98396.c                        |  102 ++
 sound/soc/codecs/max98396.h                        |   14 +
 sound/soc/codecs/mt6359-accdet.c                   |    6 +-
 sound/soc/codecs/mt6660.c                          |    8 +-
 sound/soc/codecs/nau8825.c                         |  103 ++
 sound/soc/codecs/nau8825.h                         |   17 +
 sound/soc/codecs/rt1308-sdw.c                      |    2 +
 sound/soc/codecs/rt1316-sdw.c                      |    2 +
 sound/soc/codecs/rt5682-sdw.c                      |    2 +
 sound/soc/codecs/rt5682s.c                         |  265 +++--
 sound/soc/codecs/rt5682s.h                         |    2 +
 sound/soc/codecs/rt700-sdw.c                       |    2 +
 sound/soc/codecs/rt711-sdca-sdw.c                  |    2 +
 sound/soc/codecs/rt715-sdca-sdw.c                  |    2 +
 sound/soc/codecs/rt715-sdw.c                       |    2 +
 sound/soc/codecs/sigmadsp.c                        |    4 +-
 sound/soc/codecs/src4xxx-i2c.c                     |   47 +
 sound/soc/codecs/src4xxx.c                         |  518 +++++++++
 sound/soc/codecs/src4xxx.h                         |  113 ++
 sound/soc/codecs/ssm2518.c                         |   34 +-
 sound/soc/codecs/sti-sas.c                         |   10 +-
 sound/soc/codecs/tas2562.c                         |   94 +-
 sound/soc/codecs/tas2764.c                         |  181 ++-
 sound/soc/codecs/tas2764.h                         |   23 +
 sound/soc/codecs/tfa989x.c                         |    4 +-
 sound/soc/codecs/tlv320adcx140.c                   |   59 +
 sound/soc/codecs/tlv320adcx140.h                   |    3 +-
 sound/soc/codecs/tlv320aic26.c                     |    2 +-
 sound/soc/codecs/ts3a227e.c                        |   61 +-
 sound/soc/codecs/uda134x.c                         |    2 +-
 sound/soc/codecs/wcd-mbhc-v2.c                     |    2 +-
 sound/soc/codecs/wcd9335.c                         |   14 +-
 sound/soc/codecs/wcd938x.c                         |    1 -
 sound/soc/codecs/wm5102.c                          |    6 +-
 sound/soc/codecs/wm5110.c                          |    6 +-
 sound/soc/codecs/wm8997.c                          |    6 +-
 sound/soc/codecs/wm_adsp.c                         |    4 +-
 sound/soc/codecs/wsa883x.c                         |   28 +-
 sound/soc/fsl/eukrea-tlv320.c                      |    8 +-
 sound/soc/fsl/fsl_asrc.c                           |   29 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |    3 +-
 sound/soc/fsl/fsl_sai.c                            |   55 +-
 sound/soc/fsl/fsl_sai.h                            |    3 +
 sound/soc/fsl/fsl_spdif.c                          |   21 +-
 sound/soc/fsl/fsl_utils.c                          |    2 +-
 sound/soc/fsl/imx-pcm.h                            |    9 -
 sound/soc/fsl/imx-rpmsg.c                          |   29 +
 sound/soc/generic/simple-card-utils.c              |   62 +-
 sound/soc/intel/Kconfig                            |    2 +-
 sound/soc/intel/atom/sst/sst.c                     |    8 +-
 sound/soc/intel/avs/boards/hdaudio.c               |    1 +
 sound/soc/intel/boards/Makefile                    |    8 +-
 sound/soc/intel/boards/sof_cirrus_common.c         |   92 +-
 sound/soc/intel/boards/sof_cs42l42.c               |   14 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |    2 +-
 sound/soc/intel/boards/sof_es8336.c                |    7 +-
 sound/soc/intel/boards/sof_nau8825.c               |   15 +-
 sound/soc/intel/boards/sof_realtek_common.c        |   86 +-
 sound/soc/intel/boards/sof_realtek_common.h        |    2 +-
 sound/soc/intel/boards/sof_rt5682.c                |   21 +-
 sound/soc/intel/boards/sof_ssp_amp.c               |   15 +-
 sound/soc/intel/catpt/device.c                     |   33 +-
 sound/soc/intel/catpt/sysfs.c                      |    6 +-
 sound/soc/intel/common/Makefile                    |    2 +-
 .../intel/common/soc-acpi-intel-hsw-bdw-match.c    |   15 -
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |  131 +++
 sound/soc/intel/skylake/skl-nhlt.c                 |    2 +-
 sound/soc/intel/skylake/skl-topology.h             |    4 +-
 sound/soc/intel/skylake/skl.c                      |    3 +-
 sound/soc/mediatek/mt8183/mt8183-afe-common.h      |    3 +
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |   33 +
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c         |   45 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |   33 +
 sound/soc/mediatek/mt8186/mt8186-afe-common.h      |    3 +
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c        |    8 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |    3 +
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c         |   58 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c         |  213 +++-
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  213 +++-
 sound/soc/mediatek/mt8192/mt8192-afe-common.h      |    3 +
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c         |   49 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |   32 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c         |    4 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |   30 +-
 sound/soc/qcom/Kconfig                             |   11 +
 sound/soc/qcom/Makefile                            |    2 +
 sound/soc/qcom/common.c                            |  173 ++-
 sound/soc/qcom/common.h                            |   35 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |    9 +
 sound/soc/qcom/qdsp6/q6prm.h                       |   19 +
 sound/soc/qcom/sc8280xp.c                          |  157 +++
 sound/soc/qcom/sm8250.c                            |  152 +--
 sound/soc/rockchip/rockchip_i2s.c                  |   41 +-
 sound/soc/samsung/aries_wm8994.c                   |    8 +-
 sound/soc/samsung/odroid.c                         |    2 +-
 sound/soc/sh/rcar/ctu.c                            |    6 +-
 sound/soc/sh/rcar/dvc.c                            |    6 +-
 sound/soc/sh/rcar/mix.c                            |    6 +-
 sound/soc/sh/rcar/src.c                            |    5 +-
 sound/soc/sh/rcar/ssi.c                            |    4 +-
 sound/soc/soc-ac97.c                               |    8 +-
 sound/soc/soc-component.c                          |    6 +-
 sound/soc/soc-compress.c                           |    4 +-
 sound/soc/soc-core.c                               |   47 +-
 sound/soc/soc-dai.c                                |    2 +-
 sound/soc/soc-dapm.c                               |   86 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |    6 +-
 sound/soc/soc-pcm.c                                |  137 +--
 sound/soc/soc-topology.c                           |    1 +
 sound/soc/soc-utils-test.c                         |   46 +
 sound/soc/soc-utils.c                              |   23 +-
 sound/soc/sof/Makefile                             |    3 +-
 sound/soc/sof/amd/Kconfig                          |   10 +
 sound/soc/sof/amd/Makefile                         |    4 +-
 sound/soc/sof/amd/acp-common.c                     |  111 ++
 sound/soc/sof/amd/acp-dsp-offset.h                 |   33 +-
 sound/soc/sof/amd/acp-ipc.c                        |   49 +-
 sound/soc/sof/amd/acp-loader.c                     |   20 +-
 sound/soc/sof/amd/acp-pcm.c                        |    3 +-
 sound/soc/sof/amd/acp-stream.c                     |    7 +-
 sound/soc/sof/amd/acp.c                            |   52 +-
 sound/soc/sof/amd/acp.h                            |   38 +-
 sound/soc/sof/amd/pci-rmb.c                        |  186 ++++
 sound/soc/sof/amd/pci-rn.c                         |   11 +
 sound/soc/sof/amd/rembrandt.c                      |  134 +++
 sound/soc/sof/amd/renoir.c                         |  101 +-
 sound/soc/sof/compress.c                           |   98 +-
 sound/soc/sof/core.c                               |    3 +
 sound/soc/sof/imx/Kconfig                          |    9 +
 sound/soc/sof/imx/Makefile                         |    2 +
 sound/soc/sof/imx/imx8ulp.c                        |  515 +++++++++
 sound/soc/sof/intel/Kconfig                        |   25 +
 sound/soc/sof/intel/Makefile                       |    4 +
 sound/soc/sof/intel/apl.c                          |   11 +-
 sound/soc/sof/intel/cnl.c                          |   43 +-
 sound/soc/sof/intel/hda-dsp.c                      |   36 +-
 sound/soc/sof/intel/hda-ipc.c                      |   19 +-
 sound/soc/sof/intel/hda-ipc.h                      |    1 +
 sound/soc/sof/intel/hda-loader-skl.c               |  580 ++++++++++
 sound/soc/sof/intel/hda-loader.c                   |   10 +-
 sound/soc/sof/intel/hda-pcm.c                      |    4 +-
 sound/soc/sof/intel/hda-stream.c                   |    9 +-
 sound/soc/sof/intel/hda.c                          |   95 +-
 sound/soc/sof/intel/hda.h                          |   24 +-
 sound/soc/sof/intel/icl.c                          |   39 +-
 sound/soc/sof/intel/mtl.c                          |  217 +---
 sound/soc/sof/intel/pci-skl.c                      |   91 ++
 sound/soc/sof/intel/pci-tgl.c                      |   70 +-
 sound/soc/sof/intel/shim.h                         |    2 +
 sound/soc/sof/intel/skl.c                          |  118 ++
 sound/soc/sof/intel/tgl.c                          |   25 +-
 sound/soc/sof/ipc3-pcm.c                           |    9 +
 sound/soc/sof/ipc3-topology.c                      |   40 +
 sound/soc/sof/ipc3.c                               |   12 +-
 sound/soc/sof/ipc4-loader.c                        |   20 +-
 sound/soc/sof/ipc4-mtrace.c                        |  643 +++++++++++
 sound/soc/sof/ipc4-priv.h                          |   18 +-
 sound/soc/sof/ipc4-topology.c                      |   14 +-
 sound/soc/sof/ipc4.c                               |   23 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |   98 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |   68 +-
 sound/soc/sof/nocodec.c                            |    4 +-
 sound/soc/sof/pcm.c                                |   13 +-
 sound/soc/sof/sof-audio.c                          |   47 +-
 sound/soc/sof/sof-client-probes.c                  |  104 +-
 sound/soc/sof/sof-of-dev.h                         |    7 +
 sound/soc/sof/sof-pci-dev.c                        |    2 +-
 sound/soc/sof/sof-priv.h                           |   11 +
 sound/soc/sof/sof-utils.c                          |    2 -
 sound/soc/sof/topology.c                           |   14 +-
 sound/soc/stm/stm32_adfsdm.c                       |    8 +-
 sound/soc/stm/stm32_i2s.c                          |    4 +-
 sound/soc/stm/stm32_spdifrx.c                      |    4 +-
 sound/soc/sunxi/Kconfig                            |    7 +
 sound/soc/sunxi/Makefile                           |    1 +
 sound/soc/sunxi/sun4i-codec.c                      |    5 +-
 sound/soc/sunxi/sun50i-dmic.c                      |  406 +++++++
 sound/soc/ti/omap-mcbsp-st.c                       |    6 +-
 sound/soc/ti/omap-mcbsp.c                          |   10 +-
 287 files changed, 13387 insertions(+), 2331 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/dai-params.yaml
 create mode 100755 Documentation/devicetree/bindings/sound/everest,es8326.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sai.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,src4xxx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ts3a227e.txt
 delete mode 100644 include/linux/platform_data/ssm2518.h
 create mode 100644 include/sound/acp62_chip_offset_byte.h
 create mode 100644 include/trace/events/sof.h
 create mode 100644 include/trace/events/sof_intel.h
 create mode 100644 sound/soc/amd/ps/Makefile
 create mode 100644 sound/soc/amd/ps/acp62.h
 create mode 100644 sound/soc/amd/ps/pci-ps.c
 create mode 100644 sound/soc/amd/ps/ps-mach.c
 create mode 100644 sound/soc/amd/ps/ps-pdm-dma.c
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/mca.c
 create mode 100644 sound/soc/codecs/cs42l42-i2c.c
 create mode 100644 sound/soc/codecs/cs42l83-i2c.c
 create mode 100755 sound/soc/codecs/es8326.c
 create mode 100755 sound/soc/codecs/es8326.h
 create mode 100644 sound/soc/codecs/src4xxx-i2c.c
 create mode 100644 sound/soc/codecs/src4xxx.c
 create mode 100644 sound/soc/codecs/src4xxx.h
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-rpl-match.c
 create mode 100644 sound/soc/qcom/sc8280xp.c
 create mode 100644 sound/soc/sof/amd/acp-common.c
 create mode 100644 sound/soc/sof/amd/pci-rmb.c
 create mode 100644 sound/soc/sof/amd/rembrandt.c
 create mode 100644 sound/soc/sof/imx/imx8ulp.c
 create mode 100644 sound/soc/sof/intel/hda-loader-skl.c
 create mode 100644 sound/soc/sof/intel/pci-skl.c
 create mode 100644 sound/soc/sof/intel/skl.c
 create mode 100644 sound/soc/sof/ipc4-mtrace.c
 create mode 100644 sound/soc/sunxi/sun50i-dmic.c

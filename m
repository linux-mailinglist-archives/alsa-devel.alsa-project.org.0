Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD57647205
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 15:41:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834EA191F;
	Thu,  8 Dec 2022 15:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834EA191F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670510495;
	bh=iyo+iDhmaUWmB8SDTUCKZbtAaZD3Kau46lUZszOGs74=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cRFAjFN+S1E+LH2R7ad6ksmPdZcSwHxlzEjT+z+bFZ+FE2JvGH0HNmyLdvVjt0dFX
	 knWL7/P1UnJ6AdBQTJS/1K+YQyrm/T6tkP+uZUOztMFYSKA/B6BstSCTcEGX21kXet
	 gB7muHfMujj936YHOibDZkbdRlr6eyBntczgGW3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FABAF8024C;
	Thu,  8 Dec 2022 15:40:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69FADF8020D; Thu,  8 Dec 2022 15:40:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,PRX_BODY_13,PRX_BODY_141,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 062C2F80089
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 15:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 062C2F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JDdFupX7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C93761F72;
 Thu,  8 Dec 2022 14:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E58C433C1;
 Thu,  8 Dec 2022 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670510429;
 bh=iyo+iDhmaUWmB8SDTUCKZbtAaZD3Kau46lUZszOGs74=;
 h=From:To:Cc:Subject:Date:From;
 b=JDdFupX7JIqE/YGgZUNkbPpOyxZeZjtxVQIj4IyzITtxrhXDo/o0JLXBwcdGOTy8O
 be7/PDa+Sj/NPHnueUY4NUYM5rJ5cjTXYMLKwxbeh8ESV+VTqMLinDfxjclQjlnlbc
 2q3vgO0civzPYbuvqZXAaCBfIK0mkEa8b4tuLuoCOlYmz0PXpgvQqpDeMISm+nqgeP
 RCO505D5JrANoj6onL8+2eCOuMBBazBRVjwMFymf77FKwQ+20DQELnWV9V51gBcgd8
 zkmH6lIWqmqOVnUgU/BCX7oZRbHVmc/kgcv5gVHiwHsbobpXvB4brEjiDAJxmx0TBT
 Mevk0lgmgO5yA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v6.2-2
Date: Thu, 08 Dec 2022 14:40:19 +0000
Message-Id: <20221208144028.A6E58C433C1@smtp.kernel.org>
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

The following changes since commit 3d1bb6cc1a654c8693a85b1d262e610196edec8b:

  ASoC: cs42l51: Correct PGA Volume minimum value (2022-11-25 16:29:52 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.2-2

for you to fetch changes up to e85b1f5a9769ac30f4d2f6fb1cdcd9570c38e0c1:

  ASoC: dt-bindings: fsl-sai: Reinstate i.MX93 SAI compatible string (2022-12-08 11:46:36 +0000)

----------------------------------------------------------------
ASoC: Updates for v6.2

A few more updates for v6.2 which can hopefully go into a later pull
request, the bulk of these are fixes, minor cleanups or new board quirks
- the one big bit that isn't is support for getting diagnostic data out
of the Intel AVS firmwares.

----------------------------------------------------------------
Aidan MacDonald (11):
      ASoC: jz4740-i2s: Handle independent FIFO flush bits
      ASoC: jz4740-i2s: Convert to regmap API
      ASoC: jz4740-i2s: Simplify using regmap fields
      ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params callback
      ASoC: jz4740-i2s: Align macro values and sort includes
      ASoC: jz4740-i2s: Support S20_LE and S24_LE sample formats
      ASoC: jz4740-i2s: Support continuous sample rate
      ASoC: jz4740-i2s: Move component functions near the component driver
      ASoC: jz4740-i2s: Refactor DAI probe/remove ops as component ops
      ASoC: jz4740-i2s: Remove .set_sysclk()
      ASoC: ingenic: Remove unnecessary clocks from schema

Ajye Huang (5):
      ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
      ASoC: mediatek: mt8186-rt5682: Modify machine driver for two DMICs case
      ASoC: Intel: sof_rt5682: add support for ALC5682I-VD with amp rt1019p
      ASoC: Intel: sof rt5682: remove the duplicate codes
      ASoC: SOF: amd: Use poll function instead to read ACP_SHA_DSP_FW_QUALIFIER

Alicja Michalska (1):
      ASoC: Intel: avs: Add missing audio amplifier for KBL

Amadeusz Sławiński (21):
      ASoC: Intel: avs: Add max98927 machine board
      ASoC: Intel: avs: Load max98927 on target platform
      ASoC: codecs: rt298: Add quirk for KBL-R RVP platform
      ASoC: Intel: avs: Add quirk for KBL-R RVP platform
      ASoC: Intel: avs: Support da7219 on both KBL and APL
      ASoC: Intel: avs: Add missing include to HDA board
      ASoC: Intel: boards: Fix typo in comments
      ASoC: Intel: avs: boards: Fix typo in comments
      ASoC: Intel: avs: Handle SUSPEND and RESUME triggers
      ASoC: codecs: da7219: Introduce set_jack() callback
      ASoC: codecs: da7219: Do not export internal symbols
      ASoC: Intel: avs: da7219: Refactor jack handling
      ASoC: Intel: avs: nau8825: Refactor jack handling
      ASoC: Intel: avs: rt274: Refer to DAI name through a constant
      ASoC: Intel: avs: rt274: Refactor jack handling
      ASoC: Intel: avs: rt286: Add define for codec DAI name
      ASoC: Intel: avs: rt286: Refactor jack handling
      ASoC: Intel: avs: rt298: Add define for codec DAI name
      ASoC: Intel: avs: rt298: Refactor jack handling
      ASoC: Intel: avs: rt5682: Add define for codec DAI name
      ASoC: Intel: avs: rt5682: Refactor jack handling

Andy Shevchenko (1):
      ASoC: SOF: probes: Check ops before memory allocation

Angel Iglesias (1):
      i2c: core: Introduce i2c_client_get_device_id helper function

Artem Lukyanov (1):
      ASoC: amd: yc: Add Xiaomi Redmi Book Pro 14 2022 into DMI table

Ban Tao (1):
      ASoC: sun50i-dmic: avoid unused variable warning for sun50i_dmic_of_match

Bard Liao (4):
      ASoC: SOF: ipc4-topology: rename sof_ipc4_widget_free_comp
      ASoC: SOF: ipc4-loader: get max pipeline number
      ASoC: SOF: ipc4: get pipeline instance id from pipe_widget->instance_id
      ASoC: Intel: sof_realtek_common: set ret = 0 as initial value

Brent Lu (2):
      ASoC: Intel: sof_nau8825: support rt1015p speaker amplifier
      ASoC: Intel: sof_rt5682: add jsl_rt5682 board config

Cezary Rojewski (50):
      ASoC: Intel: avs: Fix DMA mask assignment
      ASoC: Intel: avs: Fix potential RX buffer overflow
      ASoC: Intel: avs: Support AML with rt286 configuration
      ASoC: Intel: avs: Add missing SKL-based device IDs
      ASoC: Intel: avs: Simplify d0ix disabling routine
      ASoC: Intel: avs: Do not reuse msg between different IPC handlers
      ASoC: Intel: avs: Do not treat unsupported IPCs as invalid
      ASoC: Intel: avs: Do not print IPC error message twice
      ASoC: Intel: avs: Simplify ignore_fw_version description
      ASoC: Intel: avs: Simplify log control for SKL
      ASoC: codecs: hda: Fix spelling error in log message
      ASoC: Intel: avs: Split pcm pages freeing operation from hw_free()
      ASoC: Intel: avs: Introduce PCM power management routines
      ALSA: hda: Introduce snd_hdac_stream_wait_drsm()
      ASoC: Intel: avs: Restart instead of resuming HDA capture streams
      ASoC: Intel: avs: Count low power streams
      ASoC: Intel: avs: Power and clock gating policy overriding
      ASoC: Intel: avs: Enact power gating policy
      ASoC: Intel: Drop da7219_aad_jack_det() usage
      ASoC: mediatek: Drop da7219_aad_jack_det() usage
      ASoC: rockchip: Drop da7219_aad_jack_det() usage
      ASoC: amd: Drop da7219_aad_jack_det() usage
      ASoC: Intel: avs: Drop da7219_aad_jack_det() usage
      ASoC: Intel: avs: Initialize private data for subsequent HDA FEs
      ASoC: core: Exit all links before removing their components
      ASoC: Intel: avs: Lock substream before snd_pcm_stop()
      ASoC: Intel: avs: Disconnect substream if suspend or resume fails
      ASoC: Intel: bdw_rt286: Refactor jack handling
      ALSA: hda: Allow for compress stream to hdac_ext_stream assignment
      ALSA: hda: Prepare for compress stream support
      ALSA: hda: Interrupt servicing and BDL setup for compress streams
      ASoC: Intel: avs: Introduce avs_log_buffer_status_locked()
      ASoC: Intel: avs: Drop fifo_lock
      ASoC: Intel: avs: Introduce debug-context aware helpers
      ASoC: Intel: avs: Make enable_logs() dependent on DEBUG_FS
      ASoC: Intel: avs: Drop usage of debug members in non-debug code
      ASoC: Intel: avs: Add data probing requests
      ASoC: Intel: avs: Probe compress operations
      ASoC: Intel: avs: Data probing soc-component
      ASoC: Intel: avs: Add probe machine board
      ASoC: Intel: avs: Probing and firmware tracing over debugfs
      ASoC: Intel: avs: Gather remaining logs on strace_release()
      ASoC: Intel: avs: Allow for dumping FW_REGS area
      ASoC: Intel: avs: Allow for dumping debug window snapshot
      ASoC: Intel: Skylake: Update pipe_config_idx before filling BE params
      ASoC: Intel: Skylake: Remove skl_tplg_is_multi_fmt()
      ASoC: Intel: Skylake: Drop pipe_config_idx
      ASoC: Intel: Skylake: Introduce single place for pipe-config selection
      ASoC: Intel: Skylake: Fix driver hang during shutdown
      ASoC: Intel: Skylake: Use SG allocation for SKL-based firmware load

Chancel Liu (14):
      ASoC: dt-bindings: fsl_rpmsg: Add a property to assign the rpmsg channel
      ASoC: imx-audio-rpmsg: Create rpmsg channel for MICFIL
      ASoC: imx-pcm-rpmsg: Register different platform drivers
      ASoC: imx-pcm-rpmsg: Multi-channel support for sound card based on rpmsg
      ASoC: fsl_rpmsg: Register different ASoC machine devices
      ASoC: fsl_rpmsg: Multi-channel support in CPU DAI driver
      ASoC: imx-rpmsg: Assign platform driver used by machine driver to link with
      ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
      ASoC: fsl_sai: Add support for i.MX93 platform
      ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform
      ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX93 platform
      ASoC: fsl_micfil: Add support for i.MX93 platform
      ASoC: fsl_micfil: Add support when using eDMA
      ASoC: soc-pcm.c: Clear DAIs parameters after stream_active is updated

Chao Song (3):
      ASoC: SOF: Add support for parsing the number of sink/source pins
      ASoC: SOF: Add support to parse pin binding array from topology
      ASoC: SOF: topology: Add helper to get/put widget queue id

Charles Keepax (9):
      sound: sdw: Add hw_params to SoundWire config helper function
      ASoC: max98373-sdw: Switch to new snd_sdw_params_to_config helper
      ASoC: rt1308-sdw: Switch to new snd_sdw_params_to_config helper
      ASoC: rt1316-sdw: Switch to new snd_sdw_params_to_config helper
      ASoC: rt5682-sdw: Switch to new snd_sdw_params_to_config helper
      ASoC: rt700: Switch to new snd_sdw_params_to_config helper
      ASoC: rt711: Switch to new snd_sdw_params_to_config helper
      ASoC: rt715: Switch to new snd_sdw_params_to_config helper
      ASoC: sdw-mockup: Switch to new snd_sdw_params_to_config helper

Chen Zhongjin (1):
      ASoC: soc-utils: Remove __exit for snd_soc_util_exit()

Christophe JAILLET (1):
      ASoC: codecs: Remove a useless include

Claudiu Beznea (3):
      ASoC: mchp-spdiftx: simplify locking around ctrl->ch_stat
      ASoC: mchp-spdiftx: add runtime pm support
      ASoC: mchp-spdiftx: add support for system suspend/resume

Colin Ian King (6):
      ASoC: twl4030: make read-only array ramp_base static const
      ASoC: Intel: cirrus-common: Make const array uid_strings static
      ASoC: tegra: Fix spelling mistake "fliter" -> "filter"
      ASoC: wcd938x: Make read-only array minCode_param static const
      ASoC: uniphier: aio-core: Make some read-only arrays static const
      ASoC: rt715: Make read-only arrays capture_reg_H and capture_reg_L static const

David Lin (4):
      ASoC: nau8825: Adjust internal clock during jack detection
      ASoC: nau8825: Add a manually mechanism for detection failure
      ASoC: nau8315: add new acpi id and compatible id
      ASoC: dt-bindings: add compatible string for NAU8318

David Rau (1):
      ASoC: da7219: Fix pole orientation detection on OMTP headsets when playing music

Dmitry Torokhov (4):
      ARM: omap2: n8x0: stop instantiating codec platform data
      ASoC: tlv320aic3x: remove support for platform data
      ASoC: tlv320aic3x: switch to using gpiod API
      ASoC: dt-bindings: wcd9335: fix reset line polarity in example

Doug Brown (3):
      ASoC: dt-bindings: add schema for WM8961
      ASoC: wm8961: add support for devicetree
      ASoC: codecs: allow WM8961 to be selected by the user

Gaosheng Cui (1):
      ASoC: amd: acp: Fix possible UAF in acp_dma_open

Gongjun Song (13):
      ASoC: Intel: sof_sdw: Add support for SKU 0C10 product
      ASoC: Intel: soc-acpi: add SKU 0C10 SoundWire configuration
      ASoC: Intel: sof_sdw: Add support for SKU 0C40 product
      ASoC: Intel: soc-acpi: add SKU 0C40 SoundWire configuration
      ASoC: Intel: sof_sdw: Add support for SKU 0C10 product
      ASoC: Intel: soc-acpi: add SKU 0C10 SoundWire configuration
      ASoC: Intel: sof_sdw: Add support for SKU 0C40 product
      ASoC: Intel: soc-acpi: add SKU 0C40 SoundWire configuration
      ASoC: Intel: sof_sdw: Add support for SKU 0C4F product
      ASoC: intel: sof_sdw: add rt1318 codec support.
      ASoC: Intel: sof_sdw: Add support for SKU 0C11 product
      ASoC: Intel: soc-acpi: add SKU 0C11 SoundWire configuration
      ASoC: Intel: sof_sdw: use common helpers for all Realtek amps

Jean Delvare (2):
      ASoC: rsnd: Drop obsolete dependency on COMPILE_TEST
      ASoC: SOF: Drop obsolete dependency on COMPILE_TEST

Jiapeng Chong (1):
      ASoC: codecs: wcd-clsh: Remove the unused function

Jiasheng Jiang (1):
      ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd

Jiaxin Yu (1):
      ASoC: mediatek: mt8186: Correct I2S shared clocks

Jyri Sarha (5):
      ASoC: SOF: probes: Replace [0] union members with DECLARE_FLEX_ARRAY()
      ASoC: SOF: probes: Separate IPC3 operations to a separate file
      ASoC: SOF: client: Add sof_client_ipc_set_get_data()
      ASoC: SOF: client: Add sof_client_ipc4_find_module() function
      ASoC: SOF: IPC4: probes: Implement IPC4 ops for probes client device

Kai Vehmanen (1):
      ASoC: SOF: Intel: hda-loader: use small buffer for iccmax stream

Krzysztof Kozlowski (23):
      ASoC: dt-bindings: qcom,lpass: do not hard-code clock-output-names
      ASoC: codecs: lpass-wsa-macro: parse clock-output-names
      ASoC: qcom: q6prm: Correct module description
      ASoC: dt-bindings: qcom,wsa883x: Use correct SD_N polarity
      ASoC: codecs: wsa883x: Use proper shutdown GPIO polarity
      ASoC: codecs: wsa883x: Shutdown on error path
      ASoC: codecs: wsa883x: Simplify with dev_err_probe
      ASoC: dt-bindings: qcom,apr: Add GLINK channel name for SM8450
      ASoC: dt-bindings: qcom,apr: Split services to shared schema
      ASoC: dt-bindings: qcom,apr: Correct and extend example
      ASoC: dt-bindings: qcom,q6afe: Split to separate schema
      ASoC: dt-bindings: qcom,q6apm: Split to separate schema
      ASoC: dt-bindings: qcom,q6adm: Split to separate schema
      ASoC: dt-bindings: qcom,q6asm: Split to separate schema
      ASoC: dt-bindings: qcom,q6prm: Split to separate schema
      ASoC: dt-bindings: qcom,q6core: Split to separate schema
      ASoC: dt-bindings: qcom,q6apm-lpass-dais: Split to separate schema
      ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais node
      ASoC: dt-bindings: Extend name-prefix.yaml into common DAI properties
      ASoC: dt-bindings: Reference common DAI properties
      ASoC: dt-bindings: maxim,max98357a: Convert to DT schema
      ASoC: dt-bindings: maxim,max98504: Convert to DT schema
      ASoC: dt-bindings: Correct Alexandre Belloni email

Kuninori Morimoto (21):
      ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to snd_soc_dapm_widget
      ASoC: soc-dapm.c: tidyup error handling on snd_soc_dapm_add_route()
      ASoC: soc-dapm.c: remove no meaning variable from snd_soc_dapm_add_path()
      ASoC: soc-dapm.c: ignore parameter NULL at snd_soc_dapm_free_widget()
      ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
      ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to snd_soc_dapm_widget
      ASoC: soc-dapm.c: tidyup error handling on snd_soc_dapm_add_route()
      ASoC: soc-dapm.c: remove no meaning variable from snd_soc_dapm_add_path()
      ASoC: soc-dapm.c: ignore parameter NULL at snd_soc_dapm_free_widget()
      ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
      ASoC: soc-dapm.c: merge dapm_power_one_widget() and dapm_widget_set_power()
      ASoC: soc-dapm.c: cleanup snd_soc_dapm_new_dai()
      ASoC: soc-dapm.c: numerical order for dapm_up_seq
      ASoC: soc-dapm.h: cleanup white space
      ASoC: soc-dapm.h: fixup comment for snd_soc_dapm_widget_for_each_path()
      ASoC: soc-dpcm.h: remove snd_soc_dpcm::hw_param
      ASoC: simple-card-utils: remove asoc_simple_convert_fixup()
      ASoC: audio-graph-card2-custom-sample.dtsi: add convert-rate for DPCM (MIXer)
      ASoC: audio-graph-card2: check also dpcm node for convert-xxx
      ASoC: audio-graph-card2: remove Experimental announce
      ASoC: rsnd: adg: use __clk_get_name() instead of local clk_name[]

Lili Li (1):
      ASoC: Intel: Skylake: Fix Kconfig dependency

Maarten Zanders (4):
      ASoC: simple-mux: add read function
      ASoC: adau1372: fix mclk
      ASoC: adau1372: correct PGA enable & mute bit
      ASoC: adau1372: add support for S24_LE mode

Marcin Wojtas (1):
      ASoC: kirkwood: enable Kirkwood driver for Armada 38x platforms

Marek Vasut (4):
      ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d compatible strings
      ASoC: dt-bindings: fsl-sai: Use minItems 5 for i.MX8MN clock and similar
      ASoC: dt-bindings: fsl-sai: Sort main section properties
      ASoC: dt-bindings: fsl-sai: Reinstate i.MX93 SAI compatible string

Mark Brown (55):
      Merge existing fixes from asoc/for-6.1 into new branch
      ASoC: Intel: avs: Add support for max98927 codec
      ASoC: Use DIV_ROUND_UP() instead of open-coding it
      ASoC: codecs: jz4725b: Various improvements and fixes
      Create a new sound card to access MICFIL based on rpmsg channel
      ASoC: Intel: avs: Fixes and new boards support
      ASoC: add devicetree support for WM8961 codec
      ASoC: Intel/SOF: simplify S3 resume flows
      ASoC: soc-dapm.c random cleanups
      ASoC: SOF: Intel: Harden the IPC4 low level sequencing
      ASoC: soc-dapm.c random cleanups
      ASoC: Merge HDA/ext cleanup
      ASoC: SOF: Intel/IPC4: Support for external firmware libraries
      ASoC: cleanups and improvements for jz4740-i2s
      ASoC: SOF: Intel: HDaudio cleanups
      ASoC: Intel: Fix typo in comments
      Add support for SAI on i.MX93 platform
      ASoC: Intel: avs: PCM power management
      ASoC: SOF: Intel: HDA: refactor codec and multi-link suport
      ASoC: qdsp6: audioreach: add multi-port, SAL and MFC support
      ASoC: SOF: client-probes: Add support for IPC4
      ASoC: jz4740-i2s: Remove .set_sysclk() & friends
      Add support for MICFIL on i.MX93 platform
      Modify documentation and machine driver for mt8186_rt1019_rt5682s sound card
      ASoC: mediatek: Register machine drivers to module device table
      ASoC: SOF: Intel: update D0i3 registers for MTL
      ASoC: SOF: get pipeline instance id from pipe_widget->instance_id
      Adjust usage of rt5682(s) power supply properties
      ASoC: simpe-card/audio-graph fixups
      ASoC: SOF: ipc4-topology: Add widget queue support
      ASoC: codecs: da7219: Do not export da7219_aad_jack_det()
      ASoC: Set BQ parameters for some Dell models
      ASoC: Intel: add more ACPI tables/quirks for RPL/MTL
      ASoC: Intel: add new Dell devices support
      Adds the combination of headset codec ALC5682I-VD + amp rt1019p
      ASoC: mchp-spdiftx: add power saving features
      ASoC: Intel: add Dell SKU 0C11 support
      ASoC: Intel: avs: DSP recovery and resume fixes
      Merge branch 'i2c/client_device_id_helper-immutable' of https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux into HEAD
      ASoC: wm_adsp: Report when a control write changes the value
      ASoC/soundwire: revisit interrupt and lcount handling
      firmware: cs_dsp: Switch to using namespaced exports
      ASoC: adau1372: fixes after debugging custom board
      RK3588 Audio Support
      ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound nodes for SM8450
      ASoC: Merge up fixes
      ASoC: Intel: avs: Refactor jack handling
      ASoC: Intel: avs: rt5682: Refactor jack handling
      ASoC: hdmi-codec: Allow playback and capture to be disabled
      drm: tda99x: Don't advertise non-existent capture support
      ASoC/tda998x: Fix reporting of nonexistent capture streams
      Add SOF panic dump support for AMD platform.
      ASoC: Intel: avs: Data probing and fw logging
      ASoC: Intel: Skylake: Topology and shutdown fixes
      ASoC: Intel: boards: updates for SOF boards

Matthias Kaehlcke (1):
      ASoC: qcom: lpass-sc7180: Delete redundant error log from _resume()

Minghao Chi (1):
      ASoC: sunxi: use devm_platform_get_and_ioremap_resource()

Nicolas Frattaroli (4):
      ASoC: dt-bindings: rockchip: i2s-tdm: Make grf property optional
      ASoC: rockchip: i2s_tdm: Make the grf property optional
      ASoC: dt-bindings: rockchip: i2s-tdm: Add RK3588 compatible
      ASoC: rockchip: i2s_tdm: Add support for RK3588

Nícolas F. R. A. Prado (20):
      ASoC: dt-bindings: mt8192-mt6359: Set maxItems, not type, for sound-dai
      ASoC: dt-bindings: realtek,rt5682s: Add #sound-dai-cells
      ASoC: dt-bindings: rt5682: Set sound-dai-cells to 1
      ASoC: mediatek: mt8183-da7219: Register to module device table
      ASoC: mediatek: mt8183-mt6358: Register to module device table
      ASoC: dt-bindings: realtek,rt5682s: Add AVDD and MICVDD supplies
      ASoC: dt-bindings: realtek,rt5682s: Add DBVDD and LDO1-IN supplies
      ASoC: dt-bindings: rt5682: Add AVDD, MICVDD and VBAT supplies
      ASoC: dt-bindings: rt5682: Add DBVDD and LDO1-IN supplies
      ASoC: rt5682s: Support DBVDD and LDO1-IN supplies
      ASoC: rt5682: Support DBVDD and LDO1-IN supplies
      ASoC: mediatek: mt2701-cs42448: Register to module device table
      ASoC: mediatek: mt2701-wm8960: Register to module device table
      ASoC: mediatek: mt6797-mt6351: Register to module device table
      ASoC: mediatek: mt8183-da7219: Register to module device table
      ASoC: mediatek: mt8183-mt6358: Register to module device table
      ASoC: mediatek: mt8186-da7219: Register to module device table
      ASoC: mediatek: mt8186-rt5682: Register to module device table
      ASoC: mediatek: mt8192-mt6359: Register to module device table
      ASoC: mediatek: mt8195-mt6359: Register to module device table

Oder Chiou (1):
      ASoC: rt5640: Fix Jack work after system suspend

Pavel Dobias (1):
      ASoC: max9867: Implement exact integer mode

Peter Bergin (1):
      ASoC: cs42xx8-i2c.c: add module device table for of

Peter Ujfalusi (25):
      ASoC: SOF: ipc4: Log the tx message before sending it
      ASoC: SOF: Intel: ipc4: Read the interrupt reason registers at the same time
      ASoC: SOF: Intel: ipc4: Wait for channel to be free before sending a message
      ASoC: SOF: Intel: ipc4: Ack a received reply or notification separately
      ASoC: SOF: ipc3: Log the tx message before sending it
      ASoC: SOF: Introduce container struct for SOF firmware
      ASoC: SOF: amd: Use the basefw firmware container directly
      ASoC: SOF: Intel: hda-loader: Use the basefw firmware container directly
      ASoC: SOF: Intel: hda-loader-skl: Use the basefw firmware container directly
      ASoC: SOF: Drop the firmware and fw_offset from snd_sof_pdata
      ASoC: SOF: ipc: ops: Add support for optional init and exit callbacks
      ASoC: SOF: ipc4-loader: Save the maximum number of libraries supported
      ASoC: SOF: ipc4: Convert the firmware handling (loader) to library convention
      ASoC: SOF: IPC4: Add helper for looking up module by UUID
      ASoC: SOF: Add path definition for external firmware libraries
      ASoC: SOF: Intel: Set the default firmware library path for IPC4
      ASoC: SOF: ipc4: Define platform dependent library loading callback
      ASoC: SOF: Intel: hda: Add flag to indicate that the firmware is IMR booted
      ASoC: SOF: Intel: Add ipc4 library loading implementation
      ASoC: SOF: loader: Add support for IPC dependent post firmware boot ops
      ASoC: SOF: ipc4: Stop using the query_fw_configuration fw_loader ops
      ASoC: SOF: loader: Remove the query_fw_configuration ops
      ASoC: SOF: ipc4-loader: Support for loading external libraries
      ASoC: SOF: ipc4-loader: Return ssize_t from sof_ipc4_fw_parse_ext_man()
      ASoC: SOF: ipc4-topology: Implement tear_down_all_pipelines callback

Pierre-Louis Bossart (60):
      ASoC: Intel: Skylake: simplify S3 resume flows
      ASoC: Intel: avs: simplify S3 resume flows
      ASoC: SOF: Intel: hda-dsp: simplify S3 resume flows
      ALSA: hda: ext: hdac_ext_controller: use helpers in loop
      ALSA: hda: ext: hda_ext_controller: use hlink variable/parameter
      ASoC: SOF: Intel: hda-dai: use hlink variable/parameter
      ALSA/ASoC: hda: clarify bus_get_link() and bus_link_get() helpers
      ALSA/ASoC: hda: ext: add 'ext' prefix to snd_hdac_link_free_all
      ALSA/ASoC: hda: ext: remove 'link' prefix for stream-related operations
      ALSA/ASoC: hda: ext: add 'bus' prefix for multi-link stream setting
      ALSA: hda: ext: reduce ambiguity between 'multi-link' and 'link' DMA
      ALSA: hda: hdac_ext_controller: remove useless loop
      ALSA/ASoC: hda: move SPIB/DRMS functionality from ext layer
      ASoC: SOF: ops: fallback to mmio in helpers
      ASoC: SOF: Intel: use mmio fallback for all platforms
      ASoC: SOF: ops: add readb/writeb helpers
      ASoC: SOF: ops: add snd_sof_dsp_updateb() helper
      ASoC: SOF: Intel: hda-dsp: use SOF helpers for consistency
      ASoC: SOF: Intel: hda-dai: start removing the use of runtime->private_data in BE
      ASoC: SOF: Intel: hda-dai: use component_get_drvdata to find hdac_bus
      ASoC: SOF: Intel: hda-dai: remove useless members in hda_pipe_params
      ASoC: SOF: Intel: hda-ctrl: remove useless sleep
      ASoC: SOF: Intel: hda: always do a full reset
      ASoC: SOF: Intel: hda: remove useless check on GCTL
      ASoC: SOF: Intel: hda-stream: use SOF helpers for consistency
      ASoC: SOF: Intel: hda-stream: rename CL_SD_CTL registers as SD_CTL
      ASoC: SOF: Intel: hda: use SOF helper for consistency
      ASoC: SOF: Intel: hda-stream: use snd_sof_dsp_updateb() helper
      ASoC: SOF: Intel: hda-stream: use readb/writeb for stream registers
      ASoC: SOF: Intel: remove option to disable the common_hdmi handling
      ASoC: SOF: Intel: remove all dependencies on SND_SOC_HDAC_HDMI
      ASoC: SOF: Intel: hda-codec: simplify SND_SOC_SOF_HDA_AUDIO_CODEC handling
      ASoC: SOF: Intel: move codec state change to hda-codec.c
      ASoC: SOF: Intel: start moving multi-link handling in dedicated file
      ASoC: SOF: Intel: hda: add multi-link helper for LOSVID
      ASoC: SOF: Intel: move all RIRB/CMD_IO helpers to hda-codec.c
      ASoC: SOF: Intel: hda-ctrl: add codec wakeup helper
      ASoC: SOF: Intel: hda-codec: add hda_codec_device_remove() helper
      ASoC: SOF: Intel: hda-codec: add stop_cmd_io helper
      ASoC: SOF: Intel: hda-stream: always allocate CORB/RIRB buffer
      ASoC: SOF: Intel: hda-codec: add hda_codec_check_rirb_status() helper
      ASoC: SOF: Intel: hda-ctrl: use helper to clear RIRB status
      ASoC: SOF: Intel: hda-dsp: clarify dependencies on SND_SOC_SOF_HDA
      ASoC: SOF: Intel: hda-codec: add helpers to suspend and resume cmd_io
      ASoC: SOF: Intel: clarify bus_init and bus_exit sequences
      ASoC: SOF: Intel: hda-mlink: add helpers to suspend/resume links
      ASoC: SOF: Intel: add hda_bus_ml_free helper
      ASoC: SOF: Intel: hda: clarify Kconfig dependencies
      ASoC: SOF: Intel: hda-codec: use GPL-2.0-only license
      ASoC: SOF: introduce new DEBUG_NOCODEC mode
      ASoC: SOF: fix compilation issue with readb/writeb helpers
      ASoC: Intel: sof_sdw_amp: mark coeff tables with __maybe_unused
      soundwire: intel_init: remove useless interrupt enablement in interrupt thread
      ASoC: SOF: Intel: hda: add per-chip enable_sdw_irq() callback
      ASoC: SOF: Intel: mtl: factor interrupt enable/disable interrupt functions
      ASoC: SOF: Intel: mtl: move SoundWire interrupt enabling to callback
      ASoC: SOF: Intel: hda: add callback to check SoundWire lcount information
      soundwire: intel_init: remove sdw_intel_enable_irq()
      soundwire: intel_init: remove check on number of links
      ASoC: SOF: Intel: hda: read multi-link capabilities earlier

Piotr Maziarz (1):
      ASoC: Intel: avs: Standby power-state support

Rander Wang (3):
      ASoC: SOF: Intel: add d0i3 definition for MTL
      ASoC: SOF: Intel: add d0i3_offset in chip_info
      ASoC: SOF: Intel: set d0i3 register with d0i3_offset

Randy Dunlap (1):
      ASoC: codecs: wsa883x: use correct header file

Ranjani Sridharan (1):
      ASoC: SOF: loader: Set complete state before post_fw_run op

Ricardo Ribalda (2):
      ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
      ASoC: SOF: mediatek: add shutdown callback

Richard Fitzgerald (4):
      ASoC: wm_adsp: Allow client to hook into pre_run callback
      ASoC: soc-dai: Do not call snd_soc_link_be_hw_params_fixup() twice
      firmware: cs_dsp: Rename KConfig symbol CS_DSP -> FW_CS_DSP
      firmware: cs_dsp: Make the exports namespaced

Rob Herring (1):
      ASoC: dt-bindings: Convert dmic-codec to DT schema

Samuel Holland (1):
      ASoC: dt-bindings: sun50i-dmic: Add D1 compatible string

Shang XiaoJing (4):
      ASoC: cs35l36: Use DIV_ROUND_UP() instead of open-coding it
      ASoC: wm8978: Use DIV_ROUND_UP() instead of open-coding it
      ASoC: rsnd: Use DIV_ROUND_UP() instead of open-coding it
      ASoC: ti: davinci-mcasp: Use DIV_ROUND_UP() instead of open-coding it

Shaomin Deng (1):
      ASoC: meson: axg-pdm: Fix double word in comments

Shengjiu Wang (2):
      ASoC: fsl_micfil: Add Hardware Voice Activity Detector support
      ASoC: fsl_xcvr: Add Counter registers

Shuming Fan (5):
      ASoC: rt1308-sdw: get BQ params property and apply them
      ASoC: rt1316-sdw: get BQ params property and apply them
      ASoC: Intel: sof_sdw_rt1308: add BQ params for the Dell models
      ASoC: Intel: sof_sdw_rt1316: add BQ params for the Dell models
      ASoC: rt1318: Add RT1318 SDCA vendor-specific driver

Siarhei Volkau (3):
      ASoC: codecs: jz4725b: use right control for Master Playback
      ASoC: codecs: jz4725b: add missed Mixer inputs
      ASoC: codecs: jz4725b: add missed microphone widgets

Simon Trimmer (2):
      firmware: cs_dsp: cs_dsp_coeff_write_ctrl() should report changed
      ASoC: wm_adsp: Return whether changed when writing controls

Srinivas Kandagatla (11):
      ASoC: qdsp6: audioreach: topology use idr_alloc_u32
      ASoC: qdsp6: audioreach: remove unused connection_list
      ASoC: qdsp6: audioreach: update dapm kcontrol private data
      ASoC: qdsp6: audioreach: Simplify handing FE and BE graph connections
      ASoC: qdsp6: audioreach: simplify module_list sz calculation
      ASoC: qdsp6: audioreach: add support for more port connections
      ASoC: qdsp6: audioreach: add support to enable SAL Module
      ASoC: qdsp6: audioreach: add support for MFC Module
      ASoC: qdsp6: audioreach: add support to enable module command
      ASoC: codecs: tx-macro: add dmic support via tx macro
      ASoC: qcom: cleanup and fix dependency of QCOM_COMMON

Srinivasa Rao Mandadapu (4):
      ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops
      ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops
      ASoC: qcom: lpass-sc7180: Add maybe_unused tag for system PM ops
      ASoC: qcom: lpass-sc7280: Add maybe_unused tag for system PM ops

Syed Saba Kareem (2):
      ASoC: amd: ps: update macros with ps platform naming convention
      ASoC: amd: ps: Move acp63_dev_data strcture from PCI driver

Uwe Kleine-König (4):
      ASoC: codecs: es8326: Convert to i2c's .probe_new()
      ASoC: codecs: tas2780: Convert to i2c's .probe_new()
      ASoC: max98396: Convert to i2c's .probe_new()
      ASoC: codecs: src4xxx-i2c: Convert to i2c's .probe_new()

V sujith kumar Reddy (5):
      ASoC: SOF: amd: Fix for reading position updates from stream box.
      ASoC: SOF: amd: Fix for selecting clock source as external clock.
      ASoC: SOF: amd: ADD HS and SP virtual DAI.
      ASoC: SOF: Add DAI configuration support for AMD platforms.
      ASoC : SOF: amd: Add support for IPC and DSP dumps

Venkata Prasad Potturu (2):
      ASoC: amd: acp: Add TDM slots setting support for ACP I2S controller
      ASoC: amd: acp: Add setbias level for rt5682s codec in machine driver

Vijendar Mukunda (1):
      ASoC: amd: Update Pink Sardine platform ACP register header

Viorel Suman (1):
      ASoC: ak4458: add optional reset control to instead of gpio

Wang Jingjin (1):
      ASoC: rockchip: pdm: Add missing clk_disable_unprepare() in rockchip_pdm_runtime_resume()

Wang Yufen (3):
      ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak in mt8173_rt5650_rt5514_dev_probe()
      ASoC: audio-graph-card: fix refcount leak of cpu_ep in __graph_for_each_link()
      ASoC: mediatek: mt8183: fix refcount leak in mt8183_mt6358_ts3a227_max98357_dev_probe()

Yang Yingliang (4):
      ASoC: cs42l83: change cs42l83_regmap to static
      ASoC: Intel: Skylake: fix possible memory leak in skl_codec_device_init()
      ASoC: SOF: Intel: hda-codec: fix possible memory leak in hda_codec_device_init()
      ASoC: sof_es8336: fix possible use-after-free in sof_es8336_remove()

Yong Zhi (2):
      ASoC: SOF: Intel: MTL: fix comment error
      ASoC: Intel: soc-acpi: add MTL AIC SoundWire configurations

Yuan Can (1):
      ASoC: qcom: Add checks for devm_kcalloc

Zeng Heng (1):
      ASoC: pxa: fix null-pointer dereference in filter()

Zhang Qilong (1):
      ASoC: pcm512x: Fix PM disable depth imbalance in pcm512x_probe

lishqchn (1):
      ASoC: core: fix wrong size kzalloc for rtd's components member

syed saba kareem (1):
      ASoC: amd: fix ACP version typo mistake

ye xingchen (1):
      ASoC: imx-audmux: use sysfs_emit() to instead of scnprintf()

 .mailmap                                           |     4 +-
 CREDITS                                            |     9 +
 .../ABI/testing/sysfs-kernel-mm-memory-tiers       |     4 +-
 Documentation/admin-guide/acpi/index.rst           |     1 -
 Documentation/admin-guide/device-mapper/verity.rst |     4 +
 Documentation/admin-guide/media/vivid.rst          |     2 +-
 Documentation/arm64/booting.rst                    |     8 +
 Documentation/arm64/cpu-feature-registers.rst      |    38 +-
 Documentation/block/ublk.rst                       |    36 +
 Documentation/core-api/kernel-api.rst              |     6 +
 Documentation/dev-tools/kmsan.rst                  |     1 +
 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |     2 +-
 .../bindings/hwlock/qcom-hwspinlock.yaml           |    29 +-
 .../devicetree/bindings/input/goodix,gt7375p.yaml  |     5 +-
 .../bindings/media/i2c/dongwoon,dw9714.txt         |     9 -
 .../bindings/media/i2c/dongwoon,dw9714.yaml        |    47 +
 .../devicetree/bindings/net/engleder,tsnep.yaml    |     2 +-
 .../bindings/net/nfc/samsung,s3fwrn5.yaml          |     1 -
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      |     4 -
 .../devicetree/bindings/power/fsl,imx-gpcv2.yaml   |     3 +
 .../bindings/soc/qcom/qcom,apr-services.yaml       |    54 +
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |   170 +-
 .../devicetree/bindings/sound/adi,adau1372.yaml    |     7 +-
 .../devicetree/bindings/sound/adi,adau1977.yaml    |     1 +
 .../devicetree/bindings/sound/adi,adau7118.yaml    |     5 +-
 .../devicetree/bindings/sound/ak4375.yaml          |     5 +-
 .../devicetree/bindings/sound/ak4613.yaml          |     5 +-
 .../devicetree/bindings/sound/ak4642.yaml          |     5 +-
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml  |     3 +-
 .../bindings/sound/allwinner,sun4i-a10-i2s.yaml    |     3 +-
 .../bindings/sound/allwinner,sun4i-a10-spdif.yaml  |     3 +-
 .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   |    12 +-
 .../bindings/sound/allwinner,sun8i-a33-codec.yaml  |     5 +-
 .../devicetree/bindings/sound/amlogic,aiu.yaml     |     2 +-
 .../bindings/sound/amlogic,g12a-toacodec.yaml      |     2 +-
 .../devicetree/bindings/sound/amlogic,t9015.yaml   |     2 +-
 .../devicetree/bindings/sound/apple,mca.yaml       |     5 +-
 .../devicetree/bindings/sound/awinic,aw8738.yaml   |     2 +-
 .../devicetree/bindings/sound/cirrus,cs35l41.yaml  |     3 +-
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  |     5 +-
 .../devicetree/bindings/sound/cirrus,cs42l51.yaml  |     5 +-
 .../bindings/sound/cirrus,lochnagar.yaml           |     5 +-
 .../devicetree/bindings/sound/cirrus,madera.yaml   |     3 +
 .../sound/{name-prefix.yaml => dai-common.yaml}    |     6 +-
 .../bindings/sound/davinci-mcasp-audio.yaml        |     3 +-
 .../devicetree/bindings/sound/dmic-codec.yaml      |    55 +
 Documentation/devicetree/bindings/sound/dmic.txt   |    22 -
 .../devicetree/bindings/sound/everest,es8316.yaml  |     5 +-
 .../devicetree/bindings/sound/fsl,micfil.yaml      |     1 +
 .../devicetree/bindings/sound/fsl,rpmsg.yaml       |    36 +-
 .../devicetree/bindings/sound/fsl,sai.yaml         |   101 +-
 .../bindings/sound/google,cros-ec-codec.yaml       |     5 +-
 .../devicetree/bindings/sound/ingenic,aic.yaml     |    15 +-
 .../devicetree/bindings/sound/ingenic,codec.yaml   |     5 +-
 .../bindings/sound/intel,keembay-i2s.yaml          |     5 +-
 .../devicetree/bindings/sound/linux,bt-sco.yaml    |     5 +-
 .../devicetree/bindings/sound/linux,spdif-dit.yaml |     2 +-
 .../bindings/sound/marvell,mmp-sspa.yaml           |     5 +-
 .../devicetree/bindings/sound/max98357a.txt        |    28 -
 .../devicetree/bindings/sound/max98504.txt         |    44 -
 .../devicetree/bindings/sound/maxim,max98357a.yaml |    52 +
 .../devicetree/bindings/sound/maxim,max98504.yaml  |    86 +
 .../devicetree/bindings/sound/mchp,i2s-mcc.yaml    |    18 +-
 .../devicetree/bindings/sound/mchp,spdiftx.yaml    |     5 +-
 .../devicetree/bindings/sound/microchip,pdmc.yaml  |     5 +-
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        |    14 +-
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |     3 +-
 .../devicetree/bindings/sound/mvebu-audio.txt      |    14 +-
 .../devicetree/bindings/sound/nau8315.txt          |     6 +
 .../bindings/sound/nvidia,tegra186-asrc.yaml       |     2 +-
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |     2 +-
 .../bindings/sound/nvidia,tegra20-spdif.yaml       |     5 +-
 .../bindings/sound/nvidia,tegra210-adx.yaml        |     2 +-
 .../bindings/sound/nvidia,tegra210-amx.yaml        |     2 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |     2 +-
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |     2 +-
 .../bindings/sound/nvidia,tegra210-mixer.yaml      |     2 +-
 .../bindings/sound/nvidia,tegra210-mvc.yaml        |     2 +-
 .../bindings/sound/nvidia,tegra210-ope.yaml        |     2 +-
 .../bindings/sound/nvidia,tegra210-sfc.yaml        |     2 +-
 .../devicetree/bindings/sound/nxp,tfa989x.yaml     |     2 +-
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |     3 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |     8 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |     8 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |     8 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |     8 +-
 .../bindings/sound/qcom,q6adm-routing.yaml         |    27 +-
 .../devicetree/bindings/sound/qcom,q6adm.yaml      |    51 +
 .../devicetree/bindings/sound/qcom,q6afe.yaml      |    68 +
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |    19 +-
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml      |    35 +
 .../devicetree/bindings/sound/qcom,q6apm.yaml      |    68 +
 .../devicetree/bindings/sound/qcom,q6asm-dais.yaml |    48 +-
 .../devicetree/bindings/sound/qcom,q6asm.yaml      |    68 +
 .../devicetree/bindings/sound/qcom,q6core.yaml     |    39 +
 .../bindings/sound/qcom,q6dsp-lpass-clocks.yaml    |    40 +-
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |    57 +-
 .../devicetree/bindings/sound/qcom,q6prm.yaml      |    50 +
 .../devicetree/bindings/sound/qcom,wcd9335.txt     |     2 +-
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |     5 +-
 .../devicetree/bindings/sound/qcom,wsa883x.yaml    |    15 +-
 .../devicetree/bindings/sound/realtek,rt5682s.yaml |    31 +-
 .../devicetree/bindings/sound/renesas,fsi.yaml     |     5 +-
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |     3 +-
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |     5 +-
 .../devicetree/bindings/sound/richtek,rt9120.yaml  |     5 +-
 .../bindings/sound/rockchip,i2s-tdm.yaml           |     7 +-
 .../devicetree/bindings/sound/rockchip,pdm.yaml    |     5 +-
 .../bindings/sound/rockchip,rk3328-codec.yaml      |     5 +-
 .../devicetree/bindings/sound/rockchip-i2s.yaml    |     5 +-
 .../devicetree/bindings/sound/rockchip-spdif.yaml  |    23 +-
 .../devicetree/bindings/sound/rohm,bd28623.yaml    |     5 +-
 Documentation/devicetree/bindings/sound/rt5659.txt |     2 +-
 Documentation/devicetree/bindings/sound/rt5682.txt |    22 +-
 .../devicetree/bindings/sound/samsung-i2s.yaml     |     5 +-
 .../devicetree/bindings/sound/sgtl5000.yaml        |     5 +-
 .../bindings/sound/simple-audio-amplifier.yaml     |     2 +-
 .../bindings/sound/simple-audio-mux.yaml           |     2 +-
 .../bindings/sound/snps,designware-i2s.yaml        |    30 +-
 .../bindings/sound/socionext,uniphier-aio.yaml     |     5 +-
 .../bindings/sound/socionext,uniphier-evea.yaml    |     5 +-
 .../devicetree/bindings/sound/st,stm32-i2s.yaml    |     5 +-
 .../bindings/sound/st,stm32-spdifrx.yaml           |     5 +-
 .../devicetree/bindings/sound/tas2562.yaml         |     5 +-
 .../devicetree/bindings/sound/tas2770.yaml         |     5 +-
 .../devicetree/bindings/sound/tas27xx.yaml         |     5 +-
 .../devicetree/bindings/sound/ti,src4xxx.yaml      |     2 +-
 .../bindings/sound/ti,tlv320adc3xxx.yaml           |     5 +-
 .../devicetree/bindings/sound/wlf,arizona.yaml     |     3 +
 .../devicetree/bindings/sound/wlf,wm8731.yaml      |     1 +
 .../devicetree/bindings/sound/wlf,wm8940.yaml      |     5 +-
 .../devicetree/bindings/sound/wlf,wm8961.yaml      |    43 +
 .../devicetree/bindings/sound/wlf,wm8962.yaml      |     5 +-
 .../devicetree/bindings/sound/wlf,wm8978.yaml      |     5 +-
 .../devicetree/bindings/sound/zl38060.yaml         |     5 +-
 Documentation/driver-api/basics.rst                |     3 -
 Documentation/driver-api/driver-model/devres.rst   |     1 +
 Documentation/driver-api/media/mc-core.rst         |    19 +-
 Documentation/driver-api/miscellaneous.rst         |     5 +-
 Documentation/hwmon/corsair-psu.rst                |     2 +
 Documentation/kbuild/reproducible-builds.rst       |    10 +
 Documentation/kernel-hacking/hacking.rst           |     2 +-
 Documentation/process/2.Process.rst                |    15 +-
 .../process/code-of-conduct-interpretation.rst     |     2 +-
 Documentation/process/howto.rst                    |     2 +-
 Documentation/process/maintainer-netdev.rst        |    10 +
 Documentation/trace/histogram.rst                  |     2 +-
 Documentation/translations/it_IT/process/howto.rst |     2 +-
 Documentation/translations/ja_JP/howto.rst         |     2 +-
 Documentation/translations/ko_KR/howto.rst         |     2 +-
 Documentation/translations/zh_CN/process/howto.rst |     2 +-
 Documentation/translations/zh_TW/process/howto.rst |     2 +-
 .../userspace-api/media/cec.h.rst.exceptions       |     2 +
 .../media/v4l/libv4l-introduction.rst              |     4 +-
 Documentation/virt/kvm/devices/vm.rst              |     3 +
 MAINTAINERS                                        |   151 +-
 Makefile                                           |     4 +-
 arch/arc/boot/dts/axc003.dtsi                      |     4 +-
 arch/arc/boot/dts/axc003_idu.dtsi                  |     4 +-
 arch/arc/boot/dts/axs10x_mb.dtsi                   |     4 +-
 arch/arc/boot/dts/hsdk.dts                         |     4 +-
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi               |     2 +-
 arch/arc/configs/axs101_defconfig                  |     4 -
 arch/arc/configs/axs103_defconfig                  |     4 -
 arch/arc/configs/axs103_smp_defconfig              |     4 -
 arch/arc/configs/haps_hs_defconfig                 |     1 -
 arch/arc/configs/haps_hs_smp_defconfig             |     1 -
 arch/arc/configs/hsdk_defconfig                    |     1 -
 arch/arc/configs/nsim_700_defconfig                |     1 -
 arch/arc/configs/nsimosci_defconfig                |     1 -
 arch/arc/configs/nsimosci_hs_defconfig             |     1 -
 arch/arc/configs/nsimosci_hs_smp_defconfig         |     6 +-
 arch/arc/configs/tb10x_defconfig                   |     7 +-
 arch/arc/configs/vdk_hs38_defconfig                |     3 -
 arch/arc/configs/vdk_hs38_smp_defconfig            |     1 -
 arch/arc/include/asm/bitops.h                      |     4 +-
 arch/arc/include/asm/entry-compact.h               |     2 +-
 arch/arc/include/asm/io.h                          |     2 +-
 arch/arc/include/asm/pgtable-levels.h              |     2 +-
 arch/arc/kernel/smp.c                              |     2 +-
 arch/arc/mm/cache.c                                |     4 +-
 arch/arc/mm/ioremap.c                              |     2 +-
 arch/arm/boot/dts/imx6q-yapp4-crux.dts             |     4 +
 arch/arm/boot/dts/imx6qdl-gw5910.dtsi              |     2 +-
 arch/arm/boot/dts/imx6qdl-gw5913.dtsi              |     2 +-
 arch/arm/boot/dts/imx6qp-yapp4-crux-plus.dts       |     4 +
 arch/arm/boot/dts/imx7s.dtsi                       |     4 +-
 arch/arm/boot/dts/lan966x-pcb8291.dts              |    20 +
 arch/arm/boot/dts/sama7g5-pinfunc.h                |     2 +-
 arch/arm/boot/dts/ste-href.dtsi                    |     8 +
 arch/arm/boot/dts/ste-snowball.dts                 |     8 +
 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts |     8 +
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |     8 +
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |     8 +
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |     8 +
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |     8 +
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       |     8 +
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |     8 +
 arch/arm/mach-at91/pm_suspend.S                    |     7 +-
 arch/arm/mach-omap2/board-n8x0.c                   |     5 -
 arch/arm/mach-omap2/common-board-devices.h         |     2 -
 arch/arm/mach-omap2/pdata-quirks.c                 |     1 -
 arch/arm64/boot/dts/arm/juno-base.dtsi             |    14 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |     6 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |     6 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |     6 +
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |    18 +-
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts  |    16 +-
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |    32 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    12 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |     6 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |    20 +-
 arch/arm64/boot/dts/freescale/imx93-pinfunc.h      |     0
 arch/arm64/boot/dts/freescale/imx93.dtsi           |    11 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |     2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |     2 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |    13 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |    12 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |     3 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |     6 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |    36 +-
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |     6 +
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |     6 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |     1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    12 +
 arch/arm64/include/asm/cputype.h                   |     2 +-
 arch/arm64/include/asm/efi.h                       |     8 +
 arch/arm64/include/asm/kvm_pgtable.h               |    18 +-
 arch/arm64/include/asm/pgtable.h                   |     4 +-
 arch/arm64/include/asm/stage2_pgtable.h            |    20 -
 arch/arm64/include/asm/syscall_wrapper.h           |     2 +-
 arch/arm64/kernel/cpufeature.c                     |    42 +-
 arch/arm64/kernel/efi-rt-wrapper.S                 |    33 +-
 arch/arm64/kernel/efi.c                            |    78 +-
 arch/arm64/kernel/entry-common.c                   |     3 +-
 arch/arm64/kernel/entry-ftrace.S                   |     7 +-
 arch/arm64/kvm/hyp/Makefile                        |     5 +-
 arch/arm64/kvm/hyp/exception.c                     |     3 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |    20 +
 arch/arm64/kvm/hyp/nvhe/Makefile                   |     7 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c              |     2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c                   |    26 -
 arch/arm64/kvm/hyp/vhe/switch.c                    |     8 -
 arch/arm64/kvm/mmu.c                               |     9 +-
 arch/arm64/kvm/vgic/vgic-its.c                     |     5 +-
 arch/arm64/mm/fault.c                              |     4 +
 arch/arm64/mm/pageattr.c                           |     5 +-
 arch/loongarch/include/asm/processor.h             |     2 +-
 arch/loongarch/include/asm/ptrace.h                |     4 +-
 arch/loongarch/kernel/head.S                       |     3 +-
 arch/loongarch/kernel/process.c                    |     4 +-
 arch/loongarch/kernel/switch.S                     |     2 +-
 arch/loongarch/net/bpf_jit.c                       |    31 +-
 arch/mips/alchemy/common/gpiolib.c                 |     2 +-
 arch/mips/boot/compressed/decompress.c             |     1 +
 arch/mips/include/asm/fw/fw.h                      |     2 +-
 arch/mips/kernel/jump_label.c                      |     2 +-
 arch/mips/kernel/relocate_kernel.S                 |    15 +-
 arch/mips/loongson64/reset.c                       |    10 +
 arch/mips/pic32/pic32mzda/early_console.c          |    13 +-
 arch/mips/pic32/pic32mzda/init.c                   |     2 +-
 arch/parisc/include/asm/hardware.h                 |    12 +-
 arch/parisc/include/uapi/asm/pdc.h                 |    36 +-
 arch/parisc/kernel/drivers.c                       |    14 +-
 arch/powerpc/Kconfig                               |     3 +-
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h |     6 +
 arch/powerpc/include/asm/syscalls.h                |     7 +
 arch/powerpc/kernel/exceptions-64e.S               |     7 +
 arch/powerpc/kernel/exceptions-64s.S               |    14 +-
 arch/powerpc/kernel/interrupt.c                    |    14 +-
 arch/powerpc/kernel/interrupt_64.S                 |    13 +-
 arch/powerpc/kernel/sys_ppc32.c                    |    13 +-
 arch/powerpc/kernel/syscalls/syscall.tbl           |     7 +-
 arch/powerpc/kernel/vmlinux.lds.S                  |     2 +-
 arch/powerpc/kvm/Kconfig                           |     4 +
 arch/powerpc/lib/vmx-helper.c                      |    12 +-
 arch/powerpc/mm/book3s64/hash_native.c             |    67 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c            |     8 +-
 arch/powerpc/mm/book3s64/hash_utils.c              |    12 +-
 arch/powerpc/platforms/pseries/lparcfg.c           |    11 +
 arch/powerpc/platforms/pseries/vas.c               |    83 +-
 arch/powerpc/platforms/pseries/vas.h               |     6 +
 arch/riscv/Kconfig                                 |    17 +-
 arch/riscv/Makefile                                |     6 +-
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |    38 +
 arch/riscv/include/asm/cacheflush.h                |     8 -
 arch/riscv/include/asm/jump_label.h                |     8 +-
 arch/riscv/include/asm/kvm_vcpu_timer.h            |     1 +
 arch/riscv/include/asm/vdso/processor.h            |     2 +-
 arch/riscv/kernel/cpu.c                            |     3 +
 arch/riscv/kernel/process.c                        |     2 +
 arch/riscv/kernel/setup.c                          |     1 +
 arch/riscv/kernel/vdso/Makefile                    |     5 +-
 arch/riscv/kernel/vdso/vdso.lds.S                  |     2 +
 arch/riscv/kvm/vcpu.c                              |     3 +
 arch/riscv/kvm/vcpu_timer.c                        |    17 +-
 arch/riscv/mm/cacheflush.c                         |    38 +
 arch/riscv/mm/dma-noncoherent.c                    |    41 -
 arch/riscv/mm/init.c                               |     1 -
 arch/riscv/mm/kasan_init.c                         |     7 +-
 arch/s390/Kconfig                                  |     6 +-
 arch/s390/Makefile                                 |     2 -
 arch/s390/boot/Makefile                            |     3 +-
 arch/s390/boot/startup.c                           |     3 +-
 arch/s390/boot/vmlinux.lds.S                       |    13 +-
 arch/s390/configs/btf.config                       |     1 +
 arch/s390/configs/debug_defconfig                  |    65 +-
 arch/s390/configs/defconfig                        |    67 +-
 arch/s390/configs/kasan.config                     |     3 +
 arch/s390/configs/zfcpdump_defconfig               |     1 -
 arch/s390/include/asm/futex.h                      |     3 +-
 arch/s390/include/asm/processor.h                  |    11 +-
 arch/s390/kernel/perf_pai_ext.c                    |     1 +
 arch/s390/kvm/kvm-s390.c                           |    26 +-
 arch/s390/kvm/kvm-s390.h                           |     1 -
 arch/s390/kvm/pci.c                                |     2 +-
 arch/s390/lib/uaccess.c                            |     6 +-
 arch/s390/pci/pci_mmio.c                           |     8 +-
 arch/x86/Kconfig                                   |     1 -
 arch/x86/coco/tdx/tdx.c                            |    25 +-
 arch/x86/crypto/polyval-clmulni_glue.c             |    19 +-
 arch/x86/events/amd/core.c                         |     5 +-
 arch/x86/events/amd/ibs.c                          |     2 +-
 arch/x86/events/amd/uncore.c                       |     1 +
 arch/x86/events/intel/core.c                       |     1 +
 arch/x86/events/intel/ds.c                         |    18 +-
 arch/x86/events/intel/lbr.c                        |     2 +-
 arch/x86/events/intel/pt.c                         |     9 +
 arch/x86/events/rapl.c                             |    10 +-
 arch/x86/hyperv/hv_init.c                          |    19 +-
 arch/x86/include/asm/intel-family.h                |    11 +-
 arch/x86/include/asm/iommu.h                       |     4 +-
 arch/x86/include/asm/kvm_host.h                    |     7 +-
 arch/x86/include/asm/msr-index.h                   |     8 +-
 arch/x86/include/asm/qspinlock_paravirt.h          |     2 +-
 arch/x86/include/asm/spec-ctrl.h                   |    10 +-
 arch/x86/include/asm/string_64.h                   |    11 +-
 arch/x86/include/asm/syscall_wrapper.h             |     2 +-
 arch/x86/include/asm/uaccess.h                     |    13 +-
 arch/x86/kernel/asm-offsets.c                      |     6 -
 arch/x86/kernel/cpu/amd.c                          |     6 +-
 arch/x86/kernel/cpu/bugs.c                         |    15 +-
 arch/x86/kernel/cpu/hygon.c                        |     4 +-
 arch/x86/kernel/cpu/microcode/amd.c                |    16 +-
 arch/x86/kernel/cpu/resctrl/core.c                 |     8 +-
 arch/x86/kernel/cpu/sgx/ioctl.c                    |     3 +
 arch/x86/kernel/cpu/topology.c                     |    16 +-
 arch/x86/kernel/fpu/core.c                         |     2 +-
 arch/x86/kernel/fpu/init.c                         |     8 -
 arch/x86/kernel/fpu/xstate.c                       |    42 +-
 arch/x86/kernel/ftrace_64.S                        |    34 +-
 arch/x86/kernel/traps.c                            |     7 +
 arch/x86/kernel/unwind_orc.c                       |     2 +-
 arch/x86/kvm/.gitignore                            |     2 +
 arch/x86/kvm/Makefile                              |    12 +
 arch/x86/kvm/cpuid.c                               |    13 +-
 arch/x86/kvm/debugfs.c                             |     7 +-
 arch/x86/kvm/emulate.c                             |   108 +-
 arch/x86/kvm/kvm-asm-offsets.c                     |    29 +
 arch/x86/kvm/mmu/mmu.c                             |     4 +-
 arch/x86/kvm/pmu.c                                 |     2 +-
 arch/x86/kvm/svm/pmu.c                             |     7 +-
 arch/x86/kvm/svm/sev.c                             |     6 +-
 arch/x86/kvm/svm/svm.c                             |   115 +-
 arch/x86/kvm/svm/svm.h                             |    11 +-
 arch/x86/kvm/svm/svm_ops.h                         |     5 -
 arch/x86/kvm/svm/vmenter.S                         |   260 +-
 arch/x86/kvm/vmx/capabilities.h                    |    19 +-
 arch/x86/kvm/vmx/pmu_intel.c                       |     4 +-
 arch/x86/kvm/vmx/vmenter.S                         |     2 +-
 arch/x86/kvm/vmx/vmx.c                             |    23 +-
 arch/x86/kvm/x86.c                                 |   144 +-
 arch/x86/kvm/xen.c                                 |    64 +-
 arch/x86/lib/usercopy.c                            |     3 +
 arch/x86/mm/hugetlbpage.c                          |     4 +
 arch/x86/mm/pat/set_memory.c                       |     4 +
 arch/x86/power/cpu.c                               |     1 +
 arch/x86/purgatory/Makefile                        |     1 +
 arch/x86/xen/enlighten_pv.c                        |     3 +-
 arch/x86/xen/pmu.c                                 |     2 +-
 arch/x86/xen/setup.c                               |    26 +-
 block/bfq-cgroup.c                                 |     4 +
 block/bfq-iosched.h                                |     4 -
 block/bio.c                                        |     2 +-
 block/blk-cgroup.c                                 |     2 +-
 block/blk-core.c                                   |     1 -
 block/blk-mq.c                                     |    19 +-
 block/blk-settings.c                               |     9 +-
 block/blk.h                                        |     1 +
 block/genhd.c                                      |    13 +-
 block/sed-opal.c                                   |    32 +-
 drivers/accessibility/speakup/main.c               |     2 +-
 drivers/accessibility/speakup/utils.h              |     2 +-
 drivers/acpi/acpi_extlog.c                         |    33 +-
 drivers/acpi/acpi_pcc.c                            |     2 +-
 drivers/acpi/apei/ghes.c                           |     2 +-
 drivers/acpi/arm64/iort.c                          |     3 +-
 drivers/acpi/numa/srat.c                           |     1 +
 drivers/acpi/pci_root.c                            |     1 +
 drivers/acpi/resource.c                            |    56 +-
 drivers/acpi/scan.c                                |     8 +-
 drivers/acpi/video_detect.c                        |    37 +-
 drivers/acpi/x86/utils.c                           |     6 +
 drivers/android/binder_alloc.c                     |     7 +
 drivers/ata/ahci.h                                 |     2 +-
 drivers/ata/ahci_brcm.c                            |     2 +-
 drivers/ata/ahci_imx.c                             |     4 +-
 drivers/ata/ahci_qoriq.c                           |     2 +-
 drivers/ata/ahci_st.c                              |     2 +-
 drivers/ata/ahci_xgene.c                           |     2 +-
 drivers/ata/libata-scsi.c                          |    13 +
 drivers/ata/libata-transport.c                     |    19 +-
 drivers/ata/pata_legacy.c                          |     5 +-
 drivers/ata/pata_palmld.c                          |     4 +-
 drivers/ata/sata_rcar.c                            |     2 +-
 drivers/base/power/domain.c                        |     4 +
 drivers/base/property.c                            |     4 +-
 drivers/block/Kconfig                              |     6 +
 drivers/block/drbd/drbd_main.c                     |     4 +-
 drivers/block/drbd/drbd_req.c                      |    14 +-
 drivers/block/rbd.c                                |     4 +-
 drivers/block/ublk_drv.c                           |   117 +-
 drivers/bluetooth/virtio_bt.c                      |     2 +-
 drivers/char/hw_random/bcm2835-rng.c               |     2 +-
 drivers/char/random.c                              |     4 +-
 drivers/clk/clk-renesas-pcie.c                     |    65 +-
 drivers/clk/clk.c                                  |     6 +-
 drivers/clk/mediatek/clk-mt8195-topckgen.c         |     4 +-
 drivers/clk/qcom/gcc-sc7280.c                      |     1 +
 drivers/clk/qcom/gpucc-sc7280.c                    |     1 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |    13 +-
 drivers/clk/sifive/Kconfig                         |     4 +-
 drivers/clocksource/hyperv_timer.c                 |    29 +-
 drivers/counter/104-quad-8.c                       |    64 +-
 drivers/counter/microchip-tcb-capture.c            |    18 +-
 drivers/counter/ti-ecap-capture.c                  |     7 +-
 drivers/cpufreq/cpufreq-dt.c                       |     6 +-
 drivers/cpufreq/imx6q-cpufreq.c                    |     4 +-
 drivers/cpufreq/intel_pstate.c                     |   133 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c               |    25 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c             |     9 +-
 drivers/cpufreq/tegra194-cpufreq.c                 |     1 +
 drivers/cxl/core/mbox.c                            |     2 +-
 drivers/cxl/core/pmem.c                            |     2 +
 drivers/cxl/core/port.c                            |    11 +-
 drivers/cxl/core/region.c                          |   113 +-
 drivers/cxl/cxl.h                                  |     4 +-
 drivers/cxl/pmem.c                                 |   105 +-
 drivers/dma/apple-admac.c                          |     2 +-
 drivers/dma/at_hdmac.c                             |   153 +-
 drivers/dma/at_hdmac_regs.h                        |    10 +-
 drivers/dma/idxd/cdev.c                            |    18 +
 drivers/dma/idxd/device.c                          |    26 +-
 drivers/dma/idxd/idxd.h                            |    32 +
 drivers/dma/idxd/init.c                            |     4 +-
 drivers/dma/idxd/sysfs.c                           |     2 +-
 drivers/dma/mv_xor_v2.c                            |     1 +
 drivers/dma/pxa_dma.c                              |     4 +-
 drivers/dma/stm32-dma.c                            |    14 +-
 drivers/dma/stm32-mdma.c                           |     1 +
 drivers/dma/ti/k3-udma-glue.c                      |     3 +
 drivers/extcon/extcon-usbc-tusb320.c               |     8 +-
 drivers/firmware/arm_scmi/bus.c                    |    11 +
 drivers/firmware/arm_scmi/common.h                 |     5 +-
 drivers/firmware/arm_scmi/driver.c                 |    41 +-
 drivers/firmware/arm_scmi/mailbox.c                |     2 +-
 drivers/firmware/arm_scmi/optee.c                  |     2 +-
 drivers/firmware/arm_scmi/shmem.c                  |    31 +-
 drivers/firmware/arm_scmi/smc.c                    |     2 +-
 drivers/firmware/arm_scmi/virtio.c                 |    26 +-
 drivers/firmware/cirrus/Kconfig                    |     2 +-
 drivers/firmware/cirrus/Makefile                   |     2 +-
 drivers/firmware/cirrus/cs_dsp.c                   |    79 +-
 drivers/firmware/efi/Kconfig                       |    22 -
 drivers/firmware/efi/arm-runtime.c                 |     2 +-
 drivers/firmware/efi/efi.c                         |     4 +-
 drivers/firmware/efi/libstub/Makefile              |     2 +-
 drivers/firmware/efi/libstub/Makefile.zboot        |    29 +-
 drivers/firmware/efi/libstub/arm64-stub.c          |    17 +-
 drivers/firmware/efi/libstub/efistub.h             |    28 +
 drivers/firmware/efi/libstub/fdt.c                 |     8 +-
 drivers/firmware/efi/libstub/random.c              |     7 +-
 drivers/firmware/efi/libstub/smbios.c              |    48 +
 drivers/firmware/efi/libstub/x86-stub.c            |     6 +-
 drivers/firmware/efi/libstub/zboot.lds             |     3 +-
 drivers/firmware/efi/riscv-runtime.c               |     2 +-
 drivers/firmware/efi/tpm.c                         |     2 +-
 drivers/firmware/efi/vars.c                        |    72 +-
 drivers/firmware/google/coreboot_table.c           |    37 +-
 drivers/gpio/gpio-tegra.c                          |    60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |     2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    89 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    14 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    41 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    18 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    54 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    28 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     5 -
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |    25 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    21 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |     7 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   764 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |     6 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    34 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   106 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    42 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     6 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    10 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    50 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    30 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    32 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    11 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |     2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     4 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    12 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |     1 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    24 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |     2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |    14 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |     1 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |     2 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |     1 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |     1 +
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |     4 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    22 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    17 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |     5 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    20 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |     6 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |     4 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    17 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |     4 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |     2 +-
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |    14 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |     9 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |     5 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    27 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     8 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   111 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |    17 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_ppsmc.h   |    15 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    10 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |     8 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |     8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     9 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    22 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    41 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    42 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |    25 +-
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c  |    51 +-
 drivers/gpu/drm/drm_connector.c                    |     2 +-
 drivers/gpu/drm/drm_drv.c                          |     2 +-
 drivers/gpu/drm/drm_format_helper.c                |    66 +-
 drivers/gpu/drm/drm_internal.h                     |     3 +-
 drivers/gpu/drm/drm_mode_config.c                  |     3 -
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    12 +
 drivers/gpu/drm/i2c/tda998x_drv.c                  |     2 +
 drivers/gpu/drm/i915/Makefile                      |     1 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |    68 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |     8 +
 .../drm/i915/display/intel_display_power_well.c    |     7 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |   109 +
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |    24 +
 drivers/gpu/drm/i915/display/intel_dp.c            |     4 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    59 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |     3 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |     4 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |     2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |     5 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    64 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |     4 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |    19 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |     6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    10 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |     7 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |     4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |     1 +
 drivers/gpu/drm/i915/i915_reg.h                    |     3 +
 drivers/gpu/drm/i915/i915_scatterlist.h            |    34 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    11 +-
 drivers/gpu/drm/imx/Kconfig                        |     1 -
 drivers/gpu/drm/imx/imx-tve.c                      |     5 +-
 drivers/gpu/drm/lima/lima_devfreq.c                |    15 +-
 drivers/gpu/drm/msm/Kconfig                        |     2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    10 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |     7 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |     5 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    13 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    23 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    34 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 |     6 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |     5 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |     6 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |     7 +-
 drivers/gpu/drm/msm/msm_drv.c                      |     1 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |     9 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     2 +
 drivers/gpu/drm/msm/msm_gpu.h                      |     4 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |     3 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |     1 +
 drivers/gpu/drm/panel/panel-simple.c               |     2 +
 drivers/gpu/drm/panfrost/panfrost_dump.c           |    36 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |    11 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |    13 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    26 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |     3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |     5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    10 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |     9 +-
 drivers/gpu/drm/tegra/drm.c                        |     4 +
 drivers/gpu/drm/tests/drm_format_helper_test.c     |     2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |     8 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    72 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |     1 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |     8 +-
 drivers/gpu/host1x/dev.c                           |     4 +
 drivers/hid/hid-asus.c                             |     4 +-
 drivers/hid/hid-hyperv.c                           |     2 +-
 drivers/hid/hid-ids.h                              |     2 +
 drivers/hid/hid-lenovo.c                           |     2 +-
 drivers/hid/hid-magicmouse.c                       |     2 +-
 drivers/hid/hid-playstation.c                      |    83 +-
 drivers/hid/hid-quirks.c                           |     1 +
 drivers/hid/hid-saitek.c                           |     2 +
 drivers/hid/wacom_wac.c                            |    11 +-
 drivers/hv/hv_balloon.c                            |     2 +-
 drivers/hwmon/coretemp.c                           |    56 +-
 drivers/hwmon/corsair-psu.c                        |     3 +-
 drivers/hwmon/pmbus/pmbus.h                        |     1 -
 drivers/hwmon/pwm-fan.c                            |     5 +-
 drivers/hwmon/scmi-hwmon.c                         |   116 +-
 drivers/hwspinlock/qcom_hwspinlock.c               |    42 +-
 drivers/hwtracing/coresight/coresight-core.c       |     7 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |    10 +-
 drivers/i2c/busses/Kconfig                         |     1 +
 drivers/i2c/busses/i2c-i801.c                      |     1 +
 drivers/i2c/busses/i2c-mlxbf.c                     |     9 -
 drivers/i2c/busses/i2c-mlxcpld.c                   |     2 +-
 drivers/i2c/busses/i2c-piix4.c                     |     1 +
 drivers/i2c/busses/i2c-qcom-cci.c                  |    13 +-
 drivers/i2c/busses/i2c-sis630.c                    |     2 +-
 drivers/i2c/busses/i2c-tegra.c                     |    16 +-
 drivers/i2c/busses/i2c-xiic.c                      |     1 +
 drivers/i2c/i2c-core-base.c                        |    14 +
 drivers/iio/accel/adxl367.c                        |    23 +-
 drivers/iio/accel/adxl372.c                        |    23 +-
 drivers/iio/accel/bma400_core.c                    |    24 +-
 drivers/iio/accel/bmc150-accel-core.c              |    23 +-
 drivers/iio/adc/at91-sama5d2_adc.c                 |    29 +-
 drivers/iio/adc/at91_adc.c                         |     4 +-
 drivers/iio/adc/mcp3911.c                          |    13 +-
 drivers/iio/adc/mp2629_adc.c                       |     5 +-
 drivers/iio/adc/stm32-adc.c                        |    11 +-
 drivers/iio/imu/bno055/bno055.c                    |     2 +-
 drivers/iio/light/tsl2583.c                        |     2 +-
 drivers/iio/pressure/ms5611.h                      |    12 +-
 drivers/iio/pressure/ms5611_core.c                 |    51 +-
 drivers/iio/pressure/ms5611_spi.c                  |     2 +-
 drivers/iio/temperature/ltc2983.c                  |    13 +-
 drivers/iio/trigger/iio-trig-sysfs.c               |     6 +-
 drivers/infiniband/core/cma.c                      |     2 +-
 drivers/infiniband/core/device.c                   |    10 +-
 drivers/infiniband/core/nldev.c                    |     2 +-
 drivers/infiniband/hw/efa/efa_main.c               |     4 +-
 drivers/infiniband/hw/hfi1/pio.c                   |     3 +-
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c         |    15 +-
 drivers/infiniband/hw/hns/hns_roce_hw_v2.h         |     2 -
 drivers/infiniband/hw/qedr/main.c                  |     9 +-
 drivers/infiniband/sw/rxe/rxe_resp.c               |     4 +-
 drivers/input/joystick/iforce/iforce-main.c        |     8 +-
 drivers/input/misc/soc_button_array.c              |    14 +-
 drivers/input/mouse/synaptics.c                    |     1 +
 drivers/input/serio/i8042-acpipnpio.h              |     8 +-
 drivers/input/serio/i8042.c                        |     4 -
 drivers/input/touchscreen/goodix.c                 |    11 +
 drivers/iommu/amd/iommu.c                          |     7 +-
 drivers/iommu/apple-dart.c                         |     2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        |     2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c              |     2 +-
 drivers/iommu/intel/iommu.c                        |    25 +-
 drivers/iommu/intel/pasid.c                        |     5 +-
 drivers/iommu/iommu.c                              |     7 +-
 drivers/iommu/mtk_iommu.c                          |     3 +-
 drivers/iommu/virtio-iommu.c                       |     9 +-
 drivers/isdn/hardware/mISDN/netjet.c               |     2 +-
 drivers/isdn/mISDN/core.c                          |     7 +-
 drivers/isdn/mISDN/dsp_pipeline.c                  |     3 +-
 drivers/leds/simple/simatic-ipc-leds-gpio.c        |    12 +-
 drivers/md/dm-bufio.c                              |    15 +-
 drivers/md/dm-cache-policy.h                       |     2 +-
 drivers/md/dm-clone-target.c                       |     2 +-
 drivers/md/dm-crypt.c                              |     1 +
 drivers/md/dm-integrity.c                          |    21 +-
 drivers/md/dm-ioctl.c                              |    82 +-
 drivers/md/dm-log-writes.c                         |     1 +
 drivers/md/dm-raid.c                               |     4 +-
 drivers/md/dm-rq.c                                 |     4 +-
 drivers/md/dm-stats.c                              |     2 +-
 drivers/md/dm-table.c                              |    78 +-
 drivers/md/dm-verity-target.c                      |    18 +-
 drivers/md/dm.c                                    |     9 +-
 drivers/media/Kconfig                              |     2 +-
 drivers/media/cec/core/cec-adap.c                  |     1 +
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c   |     4 +
 drivers/media/cec/platform/s5p/s5p_cec.c           |     2 +
 drivers/media/dvb-frontends/drxk_hard.c            |     2 +-
 drivers/media/i2c/ar0521.c                         |    11 +-
 drivers/media/i2c/ir-kbd-i2c.c                     |    47 +
 drivers/media/i2c/isl7998x.c                       |     2 +-
 drivers/media/i2c/mt9v111.c                        |     2 +-
 drivers/media/i2c/ov5640.c                         |   123 +-
 drivers/media/i2c/ov8865.c                         |    10 +-
 drivers/media/mc/mc-device.c                       |    13 +-
 drivers/media/mc/mc-entity.c                       |   648 +-
 drivers/media/pci/cx18/cx18-av-core.c              |     4 +-
 drivers/media/pci/cx88/cx88-input.c                |     2 +-
 drivers/media/pci/cx88/cx88-video.c                |     1 +
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |     6 +-
 drivers/media/platform/amphion/vpu_v4l2.c          |    11 +-
 drivers/media/platform/chips-media/coda-jpeg.c     |    13 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   |     2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   |     7 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |     3 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |     3 +-
 drivers/media/platform/nxp/dw100/dw100.c           |     4 +-
 drivers/media/platform/qcom/camss/camss-video.c    |     6 +-
 drivers/media/platform/qcom/venus/helpers.c        |    13 +-
 drivers/media/platform/qcom/venus/hfi.c            |     5 +-
 drivers/media/platform/qcom/venus/vdec.c           |     2 +
 drivers/media/platform/qcom/venus/venc.c           |    29 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |    38 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |     5 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |    18 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |     6 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |    21 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |    30 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |   144 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |   531 +-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |    47 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    45 +-
 .../platform/samsung/exynos4-is/fimc-capture.c     |     9 +-
 .../platform/samsung/exynos4-is/fimc-isp-video.c   |     9 +-
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |     9 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |     6 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |     6 +-
 drivers/media/platform/sunxi/sun4i-csi/Kconfig     |     2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |     6 +-
 drivers/media/platform/sunxi/sun6i-csi/Kconfig     |    12 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |   592 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h |    64 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |   592 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.h   |    23 +-
 .../media/platform/sunxi/sun6i-mipi-csi2/Kconfig   |     4 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |    20 +-
 .../platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig    |     2 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |    23 +-
 drivers/media/platform/sunxi/sun8i-di/Kconfig      |     2 +-
 drivers/media/platform/sunxi/sun8i-rotate/Kconfig  |     2 +-
 drivers/media/platform/ti/cal/cal-video.c          |     6 +-
 drivers/media/platform/ti/cal/cal.h                |     1 -
 drivers/media/platform/ti/omap3isp/isp.c           |     4 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |     9 +-
 drivers/media/platform/ti/omap3isp/ispvideo.h      |    11 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |    14 +-
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |     4 +-
 drivers/media/platform/verisilicon/hantro_hevc.c   |     4 +-
 .../media/platform/verisilicon/hantro_postproc.c   |     7 +-
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |    27 +
 drivers/media/platform/xilinx/xilinx-dma.c         |    11 +-
 drivers/media/platform/xilinx/xilinx-dma.h         |     9 +-
 drivers/media/radio/radio-si476x.c                 |     5 +-
 drivers/media/radio/si4713/si4713.c                |     2 +-
 drivers/media/rc/imon.c                            |     4 +-
 drivers/media/rc/mceusb.c                          |     2 +-
 drivers/media/test-drivers/vimc/vimc-capture.c     |     7 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |    38 +-
 drivers/media/test-drivers/vivid/vivid-core.h      |     2 +
 drivers/media/test-drivers/vivid/vivid-osd.c       |     2 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |    35 +-
 drivers/media/tuners/xc4000.c                      |     4 +-
 drivers/media/usb/au0828/au0828-core.c             |     8 +-
 drivers/media/usb/dvb-usb-v2/af9035.c              |     2 +-
 drivers/media/usb/msi2500/msi2500.c                |     2 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |     8 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |    19 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |    72 +
 drivers/media/v4l2-core/v4l2-dv-timings.c          |    14 +
 drivers/mfd/syscon.c                               |     8 +
 drivers/misc/sgi-gru/grumain.c                     |     6 +-
 drivers/misc/sgi-gru/grutables.h                   |    14 +-
 drivers/misc/vmw_vmci/vmci_queue_pair.c            |     2 +
 drivers/mmc/core/block.c                           |    44 +-
 drivers/mmc/core/core.c                            |     8 +-
 drivers/mmc/core/queue.c                           |     8 +
 drivers/mmc/core/sdio_bus.c                        |     3 +-
 drivers/mmc/host/Kconfig                           |     3 +-
 drivers/mmc/host/sdhci-brcmstb.c                   |     3 +-
 drivers/mmc/host/sdhci-cqhci.h                     |    24 +
 drivers/mmc/host/sdhci-esdhc-imx.c                 |    17 +-
 drivers/mmc/host/sdhci-of-arasan.c                 |     3 +-
 drivers/mmc/host/sdhci-pci-core.c                  |    16 +-
 drivers/mmc/host/sdhci-pci-o2micro.c               |     7 +
 drivers/mmc/host/sdhci-tegra.c                     |     3 +-
 drivers/mmc/host/sdhci_am654.c                     |     7 +-
 drivers/mtd/mtdcore.c                              |     2 +-
 drivers/mtd/nand/onenand/Kconfig                   |     1 +
 drivers/mtd/nand/raw/intel-nand-controller.c       |    23 +-
 drivers/mtd/nand/raw/marvell_nand.c                |     2 +-
 drivers/mtd/nand/raw/nand_base.c                   |     4 +-
 drivers/mtd/nand/raw/qcom_nandc.c                  |    12 +-
 drivers/mtd/nand/raw/tegra_nand.c                  |     4 +-
 drivers/mtd/parsers/bcm47xxpart.c                  |     4 +-
 drivers/mtd/spi-nor/core.c                         |     4 +-
 drivers/net/can/at91_can.c                         |     2 +-
 drivers/net/can/c_can/c_can_main.c                 |     2 +-
 drivers/net/can/can327.c                           |     2 +-
 drivers/net/can/cc770/cc770.c                      |     2 +-
 drivers/net/can/ctucanfd/ctucanfd_base.c           |     2 +-
 drivers/net/can/dev/skb.c                          |    10 +-
 drivers/net/can/flexcan/flexcan-core.c             |     2 +-
 drivers/net/can/grcan.c                            |     2 +-
 drivers/net/can/ifi_canfd/ifi_canfd.c              |     2 +-
 drivers/net/can/janz-ican3.c                       |     2 +-
 drivers/net/can/kvaser_pciefd.c                    |     2 +-
 drivers/net/can/m_can/m_can.c                      |     2 +-
 drivers/net/can/mscan/mpc5xxx_can.c                |     8 +-
 drivers/net/can/mscan/mscan.c                      |     2 +-
 drivers/net/can/pch_can.c                          |     2 +-
 drivers/net/can/peak_canfd/peak_canfd.c            |     2 +-
 drivers/net/can/rcar/rcar_can.c                    |     2 +-
 drivers/net/can/rcar/rcar_canfd.c                  |    39 +-
 drivers/net/can/sja1000/sja1000.c                  |     2 +-
 drivers/net/can/slcan/slcan-core.c                 |     2 +-
 drivers/net/can/softing/softing_main.c             |     2 +-
 drivers/net/can/spi/hi311x.c                       |     2 +-
 drivers/net/can/spi/mcp251x.c                      |     7 +-
 drivers/net/can/spi/mcp251xfd/mcp251xfd-tx.c       |     2 +-
 drivers/net/can/sun4i_can.c                        |     2 +-
 drivers/net/can/ti_hecc.c                          |     2 +-
 drivers/net/can/usb/ems_usb.c                      |     2 +-
 drivers/net/can/usb/esd_usb.c                      |     2 +-
 drivers/net/can/usb/etas_es58x/es58x_core.c        |     2 +-
 drivers/net/can/usb/gs_usb.c                       |     2 +-
 drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c   |     2 +-
 drivers/net/can/usb/kvaser_usb/kvaser_usb_hydra.c  |     4 +-
 drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c   |     4 +-
 drivers/net/can/usb/mcba_usb.c                     |     2 +-
 drivers/net/can/usb/peak_usb/pcan_usb_core.c       |     2 +-
 drivers/net/can/usb/ucan.c                         |     2 +-
 drivers/net/can/usb/usb_8dev.c                     |     2 +-
 drivers/net/can/xilinx_can.c                       |     2 +-
 drivers/net/dsa/dsa_loop.c                         |    25 +-
 drivers/net/dsa/qca/qca8k-8xxx.c                   |    83 +-
 drivers/net/ethernet/adi/adin1110.c                |    38 +-
 drivers/net/ethernet/amazon/ena/ena_netdev.c       |     8 +-
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c           |     5 +
 drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c        |    58 +-
 drivers/net/ethernet/amd/xgbe/xgbe.h               |    26 +
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c   |     4 +-
 drivers/net/ethernet/aquantia/atlantic/aq_macsec.c |    98 +-
 drivers/net/ethernet/aquantia/atlantic/aq_nic.h    |     2 +
 .../ethernet/aquantia/atlantic/macsec/macsec_api.c |    18 +-
 drivers/net/ethernet/atheros/ag71xx.c              |     3 +-
 drivers/net/ethernet/broadcom/Kconfig              |     2 +-
 drivers/net/ethernet/broadcom/bcm4908_enet.c       |    12 +-
 drivers/net/ethernet/broadcom/bcmsysport.c         |     3 +
 drivers/net/ethernet/broadcom/bgmac.c              |     1 -
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |    64 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.h          |     1 +
 drivers/net/ethernet/broadcom/bnxt/bnxt_devlink.c  |    11 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c  |     2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c     |     3 +-
 drivers/net/ethernet/cadence/macb_main.c           |     1 +
 drivers/net/ethernet/cavium/liquidio/lio_main.c    |    34 +-
 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c    |     1 +
 .../net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c    |     2 +-
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c     |     4 +-
 .../net/ethernet/freescale/dpaa/dpaa_eth_sysfs.c   |     2 +-
 drivers/net/ethernet/freescale/enetc/enetc.c       |     5 +
 drivers/net/ethernet/freescale/fec_main.c          |    50 +-
 drivers/net/ethernet/freescale/fman/mac.c          |    21 +-
 drivers/net/ethernet/freescale/fman/mac.h          |     2 +-
 drivers/net/ethernet/hisilicon/hns/hnae.c          |     4 +-
 drivers/net/ethernet/hisilicon/hns3/hnae3.h        |     1 -
 .../hisilicon/hns3/hns3_common/hclge_comm_rss.c    |    20 -
 .../hisilicon/hns3/hns3_common/hclge_comm_rss.h    |     2 -
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c    |   167 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.h    |     1 +
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |    19 +-
 drivers/net/ethernet/huawei/hinic/hinic_debugfs.c  |    18 +-
 drivers/net/ethernet/huawei/hinic/hinic_hw_cmdq.c  |     2 +-
 drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c   |     2 +-
 drivers/net/ethernet/huawei/hinic/hinic_main.c     |     9 +-
 drivers/net/ethernet/huawei/hinic/hinic_sriov.c    |     1 -
 drivers/net/ethernet/ibm/ehea/ehea_main.c          |     1 +
 drivers/net/ethernet/ibm/ibmveth.c                 |     3 +-
 drivers/net/ethernet/ibm/ibmveth.h                 |     1 +
 drivers/net/ethernet/ibm/ibmvnic.c                 |    16 +-
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c     |   103 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c        |    16 +-
 drivers/net/ethernet/intel/i40e/i40e_txrx.c        |    13 +-
 drivers/net/ethernet/intel/i40e/i40e_txrx.h        |     1 -
 drivers/net/ethernet/intel/i40e/i40e_type.h        |     4 +
 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c |    43 +-
 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.h |     1 +
 drivers/net/ethernet/intel/i40e/i40e_xsk.c         |    67 +-
 drivers/net/ethernet/intel/i40e/i40e_xsk.h         |     2 +-
 drivers/net/ethernet/intel/iavf/iavf_virtchnl.c    |     2 +
 drivers/net/ethernet/intel/ice/ice_base.c          |     2 +-
 drivers/net/ethernet/intel/ice/ice_lib.c           |    25 +
 drivers/net/ethernet/intel/ice/ice_lib.h           |     1 +
 drivers/net/ethernet/intel/ice/ice_vf_lib.c        |     5 +-
 drivers/net/ethernet/lantiq_etop.c                 |     1 -
 drivers/net/ethernet/marvell/mv643xx_eth.c         |     1 +
 .../net/ethernet/marvell/octeon_ep/octep_main.c    |    16 +-
 drivers/net/ethernet/marvell/octeontx2/Kconfig     |     2 +
 .../ethernet/marvell/octeontx2/nic/cn10k_macsec.c  |     2 +
 .../ethernet/marvell/octeontx2/nic/otx2_common.c   |     1 +
 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |   135 +-
 .../ethernet/marvell/octeontx2/nic/otx2_struct.h   |    57 +
 .../net/ethernet/marvell/octeontx2/nic/otx2_txrx.c |    32 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_txrx.h |     1 +
 .../net/ethernet/marvell/prestera/prestera_rxtx.c  |     7 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c        |    17 +-
 drivers/net/ethernet/mediatek/mtk_ppe.c            |     6 -
 drivers/net/ethernet/mediatek/mtk_star_emac.c      |     2 +
 drivers/net/ethernet/mediatek/mtk_wed.c            |    15 +-
 drivers/net/ethernet/mellanox/mlx5/core/cmd.c      |    21 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/ptp.h   |     9 +
 .../ethernet/mellanox/mlx5/core/en/rep/bridge.c    |    31 +
 .../ethernet/mellanox/mlx5/core/en/tc/act/act.c    |    92 +-
 .../net/ethernet/mellanox/mlx5/core/en/tc_priv.h   |     2 +
 drivers/net/ethernet/mellanox/mlx5/core/en/txrx.h  |    30 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c   |     4 +-
 .../ethernet/mellanox/mlx5/core/en_accel/ipsec.c   |     3 -
 .../ethernet/mellanox/mlx5/core/en_accel/macsec.c  |    27 +-
 .../mellanox/mlx5/core/en_accel/macsec_fs.c        |     2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c  |     7 +
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c    |    27 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |    88 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tx.c    |    11 +
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.c  |    14 +-
 .../ethernet/mellanox/mlx5/core/eswitch_offloads.c |    18 +-
 .../mellanox/mlx5/core/eswitch_offloads_termtbl.c  |    14 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |    20 +-
 drivers/net/ethernet/mellanox/mlx5/core/lib/aso.c  |     7 +
 drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.c |     6 +-
 drivers/net/ethernet/mellanox/mlx5/core/main.c     |     4 +
 .../ethernet/mellanox/mlx5/core/steering/dr_rule.c |     3 +-
 .../ethernet/mellanox/mlxsw/spectrum_switchdev.c   |     2 +
 drivers/net/ethernet/micrel/ksz884x.c              |     2 +-
 .../ethernet/microchip/lan966x/lan966x_ethtool.c   |    13 +-
 .../net/ethernet/microchip/lan966x/lan966x_fdma.c  |    50 +-
 .../net/ethernet/microchip/lan966x/lan966x_main.c  |     4 +-
 .../net/ethernet/microchip/lan966x/lan966x_main.h  |     2 +
 .../net/ethernet/microchip/lan966x/lan966x_regs.h  |    15 +
 .../net/ethernet/microchip/lan966x/lan966x_vlan.c  |     6 +
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |     3 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |     3 +
 drivers/net/ethernet/neterion/s2io.c               |    29 +-
 drivers/net/ethernet/netronome/nfp/nfp_main.c      |    38 +-
 .../net/ethernet/netronome/nfp/nfp_net_ethtool.c   |     6 +-
 drivers/net/ethernet/ni/nixge.c                    |     1 +
 drivers/net/ethernet/pensando/ionic/ionic_lif.c    |    12 +-
 drivers/net/ethernet/pensando/ionic/ionic_main.c   |     8 +-
 drivers/net/ethernet/sfc/ef10.c                    |    58 +-
 drivers/net/ethernet/sfc/efx.c                     |     8 +-
 drivers/net/ethernet/sfc/filter.h                  |     4 +-
 drivers/net/ethernet/sfc/rx_common.c               |    10 +-
 drivers/net/ethernet/socionext/netsec.c            |     2 +
 drivers/net/ethernet/socionext/sni_ave.c           |     6 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |    11 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |    46 +-
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    |     8 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |     6 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |     4 +
 drivers/net/ethernet/sun/sunhme.c                  |     2 +-
 drivers/net/ethernet/sunplus/spl2sw_driver.c       |     1 -
 drivers/net/ethernet/ti/am65-cpsw-nuss.c           |     2 +-
 drivers/net/ethernet/ti/cpsw.c                     |     2 +
 drivers/net/ethernet/tundra/tsi108_eth.c           |     5 +-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c      |     2 +-
 drivers/net/hamradio/bpqether.c                    |     2 +-
 drivers/net/hyperv/rndis_filter.c                  |     6 +-
 drivers/net/ipa/data/ipa_data-v3.5.1.c             |     4 +-
 drivers/net/ipa/ipa_main.c                         |     3 +
 drivers/net/ipa/reg/ipa_reg-v3.1.c                 |    96 +-
 drivers/net/macsec.c                               |    50 +-
 drivers/net/macvlan.c                              |    10 +-
 drivers/net/mctp/mctp-i2c.c                        |    47 +-
 drivers/net/mhi_net.c                              |     2 +
 drivers/net/netdevsim/bus.c                        |     9 +-
 drivers/net/netdevsim/dev.c                        |    32 +-
 drivers/net/phy/dp83822.c                          |     3 +-
 drivers/net/phy/dp83867.c                          |    15 +
 drivers/net/phy/marvell.c                          |    16 +-
 drivers/net/phy/mdio_bus.c                         |     2 +-
 drivers/net/phy/mscc/mscc_macsec.c                 |     1 +
 drivers/net/phy/phylink.c                          |     3 +
 drivers/net/thunderbolt.c                          |    19 +-
 drivers/net/tun.c                                  |    21 +-
 drivers/net/usb/qmi_wwan.c                         |     1 +
 drivers/net/usb/smsc95xx.c                         |    46 +-
 drivers/net/wan/lapbether.c                        |     3 +-
 drivers/net/wireless/ath/ath11k/qmi.h              |     2 +-
 drivers/net/wireless/ath/ath11k/reg.c              |     6 +-
 .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    |     4 +
 drivers/net/wireless/cisco/airo.c                  |    18 +-
 drivers/net/wireless/mac80211_hwsim.c              |     5 +
 drivers/net/wireless/ralink/rt2x00/rt2400pci.c     |     8 +-
 drivers/net/wireless/ralink/rt2x00/rt2400pci.h     |     2 +-
 drivers/net/wireless/ralink/rt2x00/rt2500pci.c     |     8 +-
 drivers/net/wireless/ralink/rt2x00/rt2500pci.h     |     2 +-
 drivers/net/wireless/ralink/rt2x00/rt2500usb.c     |     8 +-
 drivers/net/wireless/ralink/rt2x00/rt2500usb.h     |     2 +-
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c     |    60 +-
 drivers/net/wireless/ralink/rt2x00/rt2800lib.h     |     8 +-
 drivers/net/wireless/ralink/rt2x00/rt2x00usb.c     |     6 +-
 drivers/net/wireless/ralink/rt2x00/rt61pci.c       |     4 +-
 drivers/net/wireless/ralink/rt2x00/rt61pci.h       |     2 +-
 drivers/net/wireless/ralink/rt2x00/rt73usb.c       |     4 +-
 drivers/net/wireless/ralink/rt2x00/rt73usb.h       |     2 +-
 drivers/net/wwan/Kconfig                           |     2 +-
 drivers/net/wwan/iosm/iosm_ipc_coredump.c          |     1 +
 drivers/net/wwan/iosm/iosm_ipc_devlink.c           |     1 +
 drivers/net/wwan/iosm/iosm_ipc_imem_ops.c          |     8 +
 drivers/net/wwan/iosm/iosm_ipc_mux.h               |     1 +
 drivers/net/wwan/iosm/iosm_ipc_pcie.c              |    18 +-
 drivers/net/wwan/iosm/iosm_ipc_wwan.c              |    43 +-
 drivers/net/wwan/mhi_wwan_mbim.c                   |     1 +
 drivers/net/wwan/wwan_hwsim.c                      |     2 +-
 drivers/nfc/fdp/fdp.c                              |    10 +-
 drivers/nfc/nfcmrvl/i2c.c                          |     7 +-
 drivers/nfc/nxp-nci/core.c                         |     7 +-
 drivers/nfc/s3fwrn5/core.c                         |     8 +-
 drivers/nfc/virtual_ncidev.c                       |     3 +
 drivers/nvme/host/apple.c                          |     2 +
 drivers/nvme/host/core.c                           |    11 +-
 drivers/nvme/host/hwmon.c                          |    32 +-
 drivers/nvme/host/multipath.c                      |     1 +
 drivers/nvme/host/pci.c                            |    16 +-
 drivers/nvme/host/tcp.c                            |    13 +-
 drivers/nvme/target/auth.c                         |     2 +
 drivers/nvme/target/configfs.c                     |    12 +-
 drivers/nvme/target/core.c                         |     2 +-
 drivers/nvmem/lan9662-otpc.c                       |     2 +-
 drivers/nvmem/u-boot-env.c                         |     2 +-
 drivers/parisc/iosapic.c                           |     1 +
 drivers/parisc/pdc_stable.c                        |    34 +-
 drivers/parport/parport_pc.c                       |     2 +-
 drivers/pci/controller/pci-hyperv.c                |    22 +-
 drivers/pci/controller/pci-tegra.c                 |    11 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |     2 +-
 drivers/phy/ralink/phy-mt7621-pci.c                |     3 +-
 drivers/phy/st/phy-stm32-usbphyc.c                 |     2 +
 drivers/phy/sunplus/phy-sunplus-usb2.c             |     4 +-
 drivers/phy/tegra/xusb.c                           |    20 +-
 drivers/pinctrl/devicetree.c                       |     2 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    34 +-
 drivers/pinctrl/mediatek/mtk-eint.h                |     6 +
 drivers/pinctrl/mediatek/pinctrl-mt2701.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt2712.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt6765.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt6779.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt6795.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt7622.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt7623.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt7629.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c          |     2 +
 drivers/pinctrl/mediatek/pinctrl-mt8127.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8167.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8183.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8188.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c          |     1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |     3 +
 drivers/pinctrl/pinctrl-ingenic.c                  |     4 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |    17 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    40 +
 drivers/pinctrl/pinctrl-zynqmp.c                   |     9 -
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    21 +
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c            |     4 +-
 drivers/platform/loongarch/loongson-laptop.c       |    24 +-
 .../platform/surface/aggregator/ssh_packet_layer.c |    24 +-
 .../platform/surface/surface_aggregator_registry.c |    37 +
 drivers/platform/x86/acer-wmi.c                    |     9 +
 drivers/platform/x86/amd/pmc.c                     |    10 +-
 drivers/platform/x86/asus-nb-wmi.c                 |     9 +
 drivers/platform/x86/asus-wmi.c                    |     2 +
 drivers/platform/x86/hp-wmi.c                      |    15 +-
 drivers/platform/x86/ideapad-laptop.c              |    62 +-
 drivers/platform/x86/intel/hid.c                   |     3 +
 drivers/platform/x86/intel/pmc/core.c              |     2 +
 drivers/platform/x86/intel/pmc/pltdrv.c            |     9 +
 drivers/platform/x86/intel/pmt/class.c             |    31 +-
 drivers/platform/x86/p2sb.c                        |    15 +-
 drivers/platform/x86/thinkpad_acpi.c               |    12 +-
 drivers/platform/x86/touchscreen_dmi.c             |    25 +
 drivers/rtc/rtc-cmos.c                             |    14 +-
 drivers/s390/block/dcssblk.c                       |     1 +
 drivers/s390/cio/css.c                             |     8 +-
 drivers/s390/crypto/vfio_ap_private.h              |     2 +-
 drivers/s390/crypto/zcrypt_msgtype6.c              |    21 +-
 drivers/s390/scsi/zfcp_fsf.c                       |     2 +-
 drivers/scsi/ibmvscsi/ibmvfc.c                     |    14 +-
 drivers/scsi/lpfc/lpfc_bsg.c                       |     4 +-
 drivers/scsi/lpfc/lpfc_ct.c                        |     2 +-
 drivers/scsi/lpfc/lpfc_init.c                      |     7 +-
 drivers/scsi/megaraid/megaraid_sas_base.c          |    27 +-
 drivers/scsi/mpi3mr/Kconfig                        |     1 +
 drivers/scsi/mpi3mr/mpi3mr_os.c                    |     3 +-
 drivers/scsi/mpt3sas/mpt3sas_base.c                |     2 +-
 drivers/scsi/pm8001/pm8001_init.c                  |     1 +
 drivers/scsi/qla2xxx/qla_attr.c                    |    30 +-
 drivers/scsi/scsi_debug.c                          |    13 +-
 drivers/scsi/scsi_sysfs.c                          |     8 +
 drivers/scsi/scsi_transport_iscsi.c                |    31 +-
 drivers/scsi/scsi_transport_sas.c                  |    13 +-
 drivers/siox/siox-core.c                           |     2 +
 drivers/slimbus/Kconfig                            |     2 +-
 drivers/slimbus/stream.c                           |     8 +-
 drivers/soc/imx/imx93-pd.c                         |    17 +-
 drivers/soc/imx/soc-imx8m.c                        |    11 +
 drivers/soundwire/intel.c                          |     1 +
 drivers/soundwire/intel_init.c                     |    37 -
 drivers/soundwire/qcom.c                           |     9 +
 drivers/spi/spi-amd.c                              |     2 +-
 drivers/spi/spi-aspeed-smc.c                       |     6 +-
 drivers/spi/spi-gxp.c                              |     2 +-
 drivers/spi/spi-intel.c                            |    10 +-
 drivers/spi/spi-meson-spicc.c                      |    24 +-
 drivers/spi/spi-mpc52xx.c                          |     2 +-
 drivers/spi/spi-mt65xx.c                           |    23 +-
 drivers/spi/spi-qup.c                              |     2 +
 drivers/spi/spi-stm32.c                            |     3 +-
 drivers/spi/spi-tegra210-quad.c                    |    11 +
 drivers/staging/media/atomisp/Makefile             |     1 -
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |    19 +-
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |     6 -
 .../staging/media/atomisp/include/linux/atomisp.h  |    14 -
 .../atomisp/include/linux/atomisp_gmin_platform.h  |     2 -
 .../media/atomisp/include/linux/atomisp_platform.h |    18 -
 drivers/staging/media/atomisp/notes.txt            |    19 +
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   715 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |    11 +-
 drivers/staging/media/atomisp/pci/atomisp_compat.h |    10 -
 .../media/atomisp/pci/atomisp_compat_css20.c       |   100 +-
 drivers/staging/media/atomisp/pci/atomisp_file.c   |   229 -
 drivers/staging/media/atomisp/pci/atomisp_file.h   |    44 -
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |   274 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |    94 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |    55 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   776 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |    14 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   133 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |    71 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   164 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.h   |     3 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |   198 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |     4 +-
 drivers/staging/media/imx/imx-media-utils.c        |     8 +-
 drivers/staging/media/imx/imx7-media-csi.c         |     6 +-
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |     7 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    37 +-
 drivers/staging/media/meson/vdec/vdec.c            |     2 +
 drivers/staging/media/omap4iss/iss.c               |     4 +-
 drivers/staging/media/omap4iss/iss_video.c         |     9 +-
 drivers/staging/media/omap4iss/iss_video.h         |    11 +-
 drivers/staging/media/sunxi/cedrus/Kconfig         |     1 +
 drivers/staging/media/tegra-video/tegra210.c       |     6 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c       |     9 +-
 drivers/target/loopback/tcm_loop.c                 |     3 +-
 drivers/target/target_core_device.c                |    19 +
 drivers/target/target_core_iblock.c                |    19 +-
 drivers/target/target_core_internal.h              |     1 +
 drivers/target/target_core_pr.c                    |    33 +-
 drivers/target/target_core_transport.c             |     3 +-
 drivers/thermal/intel/intel_powerclamp.c           |     6 +-
 drivers/tty/n_gsm.c                                |    71 +-
 drivers/tty/serial/8250/8250_lpss.c                |    17 +-
 drivers/tty/serial/8250/8250_omap.c                |    52 +-
 .../tty/serial/8250/{8250_gsc.c => 8250_parisc.c}  |     0
 drivers/tty/serial/8250/8250_port.c                |     7 +-
 drivers/tty/serial/8250/Kconfig                    |     4 +-
 drivers/tty/serial/8250/Makefile                   |     2 +-
 drivers/tty/serial/fsl_lpuart.c                    |    76 +-
 drivers/tty/serial/imx.c                           |     1 +
 drivers/ufs/core/ufshcd.c                          |     4 +-
 drivers/ufs/core/ufshpb.c                          |     6 +-
 drivers/ufs/host/ufs-qcom-ice.c                    |     1 -
 drivers/usb/cdns3/host.c                           |    56 +-
 drivers/usb/chipidea/otg_fsm.c                     |     2 +
 drivers/usb/core/quirks.c                          |     3 +
 drivers/usb/dwc3/core.c                            |    59 +-
 drivers/usb/dwc3/drd.c                             |    50 -
 drivers/usb/dwc3/dwc3-st.c                         |     2 +-
 drivers/usb/dwc3/gadget.c                          |    22 +-
 drivers/usb/dwc3/host.c                            |    10 -
 drivers/usb/gadget/function/uvc_queue.c            |     8 +-
 drivers/usb/gadget/function/uvc_video.c            |    25 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c           |     1 +
 drivers/usb/gadget/udc/bdc/bdc_udc.c               |     1 +
 drivers/usb/host/bcma-hcd.c                        |    10 +-
 drivers/usb/host/xhci-mem.c                        |    20 +-
 drivers/usb/host/xhci-pci.c                        |    44 +-
 drivers/usb/host/xhci.c                            |    10 +-
 drivers/usb/host/xhci.h                            |     1 +
 drivers/usb/misc/sisusbvga/sisusb_struct.h         |     2 +-
 drivers/usb/serial/option.c                        |    19 +-
 drivers/usb/typec/mux/intel_pmc_mux.c              |    15 +-
 drivers/usb/typec/tipd/core.c                      |     6 +-
 drivers/usb/typec/ucsi/ucsi.c                      |    42 +-
 drivers/usb/typec/ucsi/ucsi_acpi.c                 |    10 +
 drivers/vfio/pci/vfio_pci_core.c                   |    10 +-
 drivers/vfio/vfio_main.c                           |    26 +-
 drivers/video/aperture.c                           |     5 +-
 drivers/video/fbdev/cyber2000fb.c                  |     2 +
 drivers/video/fbdev/da8xx-fb.c                     |     3 +-
 drivers/video/fbdev/gbefb.c                        |     4 +-
 drivers/video/fbdev/sis/sis_accel.c                |     2 +-
 drivers/video/fbdev/sis/vstruct.h                  |     2 +-
 drivers/video/fbdev/sm501fb.c                      |     2 +-
 drivers/video/fbdev/smscufx.c                      |    55 +-
 drivers/video/fbdev/stifb.c                        |     3 +-
 drivers/video/fbdev/xilinxfb.c                     |     8 +-
 drivers/watchdog/exar_wdt.c                        |     4 +-
 drivers/watchdog/sp805_wdt.c                       |     2 +-
 drivers/watchdog/watchdog_core.c                   |     4 +
 drivers/watchdog/watchdog_dev.c                    |    12 +-
 drivers/xen/grant-dma-ops.c                        |    27 +-
 drivers/xen/pcpu.c                                 |     2 +-
 drivers/xen/platform-pci.c                         |    10 +-
 drivers/xen/xen-pciback/conf_space_capability.c    |     9 +-
 fs/binfmt_elf.c                                    |     3 +-
 fs/btrfs/backref.c                                 |   138 +-
 fs/btrfs/backref.h                                 |     1 +
 fs/btrfs/block-group.c                             |     2 -
 fs/btrfs/compression.c                             |    14 +-
 fs/btrfs/ctree.c                                   |    16 +
 fs/btrfs/ctree.h                                   |    16 +-
 fs/btrfs/disk-io.c                                 |    14 +-
 fs/btrfs/disk-io.h                                 |     2 +
 fs/btrfs/export.c                                  |     2 +-
 fs/btrfs/export.h                                  |     2 +-
 fs/btrfs/extent-io-tree.c                          |    15 +-
 fs/btrfs/extent-tree.c                             |    25 +-
 fs/btrfs/file.c                                    |    29 +-
 fs/btrfs/inode.c                                   |    16 +-
 fs/btrfs/raid56.c                                  |    18 +-
 fs/btrfs/scrub.c                                   |     9 +-
 fs/btrfs/send.c                                    |    29 +-
 fs/btrfs/send.h                                    |     5 +
 fs/btrfs/super.c                                   |    16 +
 fs/btrfs/tests/btrfs-tests.c                       |     2 +-
 fs/btrfs/tests/qgroup-tests.c                      |    36 +-
 fs/btrfs/volumes.c                                 |    51 +-
 fs/btrfs/volumes.h                                 |     4 +-
 fs/btrfs/zoned.c                                   |    40 +
 fs/btrfs/zoned.h                                   |    11 +
 fs/ceph/caps.c                                     |    48 +-
 fs/ceph/inode.c                                    |     2 +-
 fs/ceph/snap.c                                     |     3 +-
 fs/cifs/cached_dir.c                               |    39 +-
 fs/cifs/cached_dir.h                               |     4 +
 fs/cifs/cifsfs.c                                   |    33 +-
 fs/cifs/cifsfs.h                                   |     4 +-
 fs/cifs/connect.c                                  |    15 +-
 fs/cifs/dir.c                                      |     6 +-
 fs/cifs/file.c                                     |    24 +-
 fs/cifs/inode.c                                    |    11 +-
 fs/cifs/ioctl.c                                    |     4 +-
 fs/cifs/misc.c                                     |     6 +-
 fs/cifs/sess.c                                     |     1 +
 fs/cifs/smb2inode.c                                |     2 +
 fs/cifs/smb2misc.c                                 |    81 +-
 fs/cifs/smb2ops.c                                  |    37 +-
 fs/cifs/smb2pdu.c                                  |    17 +-
 fs/cifs/smb2transport.c                            |    19 +-
 fs/crypto/keyring.c                                |    17 +-
 fs/efivarfs/vars.c                                 |    16 -
 fs/erofs/fscache.c                                 |    38 +-
 fs/erofs/internal.h                                |     6 +-
 fs/erofs/super.c                                   |    39 +-
 fs/erofs/sysfs.c                                   |     8 +-
 fs/erofs/zdata.c                                   |    38 +-
 fs/erofs/zdata.h                                   |     6 +-
 fs/erofs/zmap.c                                    |    22 +-
 fs/exec.c                                          |     6 +-
 fs/ext4/fast_commit.c                              |     5 +-
 fs/ext4/ioctl.c                                    |     3 +-
 fs/ext4/migrate.c                                  |     3 +-
 fs/ext4/namei.c                                    |    10 +-
 fs/ext4/resize.c                                   |     5 +
 fs/ext4/super.c                                    |     6 +-
 fs/fuse/file.c                                     |     4 +
 fs/fuse/readdir.c                                  |    10 +-
 fs/hugetlbfs/inode.c                               |    13 +-
 fs/kernfs/dir.c                                    |    14 +-
 fs/netfs/buffered_read.c                           |    20 +-
 fs/netfs/io.c                                      |     3 +
 fs/nfs/client.c                                    |     4 +-
 fs/nfs/delegation.c                                |    36 +-
 fs/nfs/dir.c                                       |     5 +-
 fs/nfs/dns_resolve.c                               |     7 +-
 fs/nfs/dns_resolve.h                               |     2 +-
 fs/nfs/fs_context.c                                |    14 +-
 fs/nfs/internal.h                                  |    14 +-
 fs/nfs/mount_clnt.c                                |     4 +-
 fs/nfs/namespace.c                                 |     2 +-
 fs/nfs/nfs3client.c                                |     4 +-
 fs/nfs/nfs42proc.c                                 |     3 +
 fs/nfs/nfs4_fs.h                                   |     2 +-
 fs/nfs/nfs4client.c                                |    19 +-
 fs/nfs/nfs4namespace.c                             |    16 +-
 fs/nfs/nfs4proc.c                                  |    10 +-
 fs/nfs/nfs4state.c                                 |     2 +
 fs/nfs/pnfs_nfs.c                                  |     6 +-
 fs/nfs/super.c                                     |     5 +-
 fs/nfsd/filecache.c                                |     6 +-
 fs/nfsd/nfs4state.c                                |     1 +
 fs/nfsd/nfsctl.c                                   |     4 +-
 fs/nfsd/nfsfh.c                                    |     2 +-
 fs/nfsd/trace.h                                    |     5 +-
 fs/nilfs2/segment.c                                |    15 +-
 fs/nilfs2/super.c                                  |     2 -
 fs/nilfs2/the_nilfs.c                              |     2 -
 fs/ocfs2/namei.c                                   |    23 +-
 fs/proc/task_mmu.c                                 |     2 +-
 fs/squashfs/file.c                                 |    23 +-
 fs/squashfs/page_actor.c                           |     3 +
 fs/squashfs/page_actor.h                           |     6 +-
 fs/super.c                                         |     3 +-
 fs/udf/namei.c                                     |     2 +-
 fs/userfaultfd.c                                   |     3 +
 fs/xfs/libxfs/xfs_ag.h                             |    15 +
 fs/xfs/libxfs/xfs_alloc.c                          |     6 +-
 fs/xfs/libxfs/xfs_dir2_leaf.c                      |     9 +-
 fs/xfs/libxfs/xfs_format.h                         |    22 +-
 fs/xfs/libxfs/xfs_log_format.h                     |    60 +-
 fs/xfs/libxfs/xfs_refcount.c                       |   286 +-
 fs/xfs/libxfs/xfs_refcount.h                       |    40 +-
 fs/xfs/libxfs/xfs_refcount_btree.c                 |    15 +-
 fs/xfs/libxfs/xfs_rmap.c                           |     9 +-
 fs/xfs/libxfs/xfs_trans_resv.c                     |     4 +-
 fs/xfs/libxfs/xfs_types.h                          |    30 +
 fs/xfs/scrub/alloc.c                               |     4 +-
 fs/xfs/scrub/ialloc.c                              |     5 +-
 fs/xfs/scrub/refcount.c                            |    72 +-
 fs/xfs/xfs_attr_item.c                             |    67 +-
 fs/xfs/xfs_bmap_item.c                             |    54 +-
 fs/xfs/xfs_error.c                                 |     9 +-
 fs/xfs/xfs_extfree_item.c                          |    94 +-
 fs/xfs/xfs_extfree_item.h                          |    16 +
 fs/xfs/xfs_file.c                                  |     7 +-
 fs/xfs/xfs_inode.c                                 |     2 +-
 fs/xfs/xfs_log_recover.c                           |    10 +-
 fs/xfs/xfs_ondisk.h                                |    23 +-
 fs/xfs/xfs_refcount_item.c                         |    57 +-
 fs/xfs/xfs_rmap_item.c                             |    70 +-
 fs/xfs/xfs_super.c                                 |    12 +-
 fs/xfs/xfs_sysfs.h                                 |     7 +-
 fs/xfs/xfs_trace.h                                 |    48 +-
 fs/xfs/xfs_trans_ail.c                             |     3 +-
 fs/zonefs/super.c                                  |    37 +-
 fs/zonefs/sysfs.c                                  |     5 -
 include/acpi/ghes.h                                |     2 +-
 include/asm-generic/compat.h                       |     2 +-
 include/asm-generic/hyperv-tlfs.h                  |     9 +
 include/asm-generic/vmlinux.lds.h                  |    20 +-
 include/drm/gpu_scheduler.h                        |     9 +
 include/linux/blk-mq.h                             |     3 +-
 include/linux/blkdev.h                             |    16 +-
 include/linux/bpf.h                                |    50 +-
 include/linux/can/dev.h                            |    16 +
 include/linux/cgroup.h                             |     1 +
 include/linux/counter.h                            |     5 +-
 include/linux/dsa/tag_qca.h                        |     8 +-
 include/linux/efi.h                                |     6 +-
 include/linux/fb.h                                 |     2 +-
 include/linux/fortify-string.h                     |    30 +-
 include/linux/fscrypt.h                            |     4 +-
 include/linux/i2c.h                                |     1 +
 include/linux/io_uring.h                           |     3 +
 include/linux/iommu.h                              |     2 +-
 include/linux/kmsan_string.h                       |    21 +
 include/linux/kvm_host.h                           |    26 +-
 include/linux/maple_tree.h                         |     7 +
 include/linux/mlx5/driver.h                        |     2 +-
 include/linux/net.h                                |     1 +
 include/linux/netdevice.h                          |    10 +-
 include/linux/overflow.h                           |    38 +-
 include/linux/perf_event.h                         |    19 +-
 include/linux/phylink.h                            |     2 +
 include/linux/ring_buffer.h                        |     2 +-
 include/linux/skmsg.h                              |     2 +-
 include/linux/slab.h                               |    23 -
 include/linux/soundwire/sdw_intel.h                |     2 -
 include/linux/spi/spi-mem.h                        |     2 +-
 include/linux/trace.h                              |     4 +-
 include/linux/userfaultfd_k.h                      |     6 +-
 include/linux/utsname.h                            |     1 +
 include/linux/vfio.h                               |     1 +
 include/media/i2c/ir-kbd-i2c.h                     |     1 +
 include/media/media-device.h                       |    15 -
 include/media/media-entity.h                       |   169 +-
 include/media/v4l2-common.h                        |     3 +-
 include/media/v4l2-ctrls.h                         |    28 +-
 include/media/v4l2-dev.h                           |   102 +
 include/media/v4l2-fwnode.h                        |     4 -
 include/media/v4l2-subdev.h                        |    12 +-
 include/net/genetlink.h                            |    18 +-
 include/net/ip.h                                   |     2 +-
 include/net/ipv6.h                                 |     2 +-
 include/net/netlink.h                              |    48 +-
 include/net/sock.h                                 |    11 +-
 include/net/sock_reuseport.h                       |    11 +-
 include/soc/at91/sama7-ddr.h                       |     5 +-
 ...chip_offset_byte.h => acp63_chip_offset_byte.h} |   216 +-
 include/sound/control.h                            |     1 +
 include/sound/hdaudio.h                            |    27 +
 include/sound/hdaudio_ext.h                        |    71 +-
 include/sound/hdmi-codec.h                         |     4 +
 include/sound/sdw.h                                |    49 +
 include/sound/simple_card_utils.h                  |     2 -
 include/sound/soc-dapm.h                           |   188 +-
 include/sound/soc-dpcm.h                           |     2 -
 include/sound/sof.h                                |    10 +-
 include/sound/sof/dai-amd.h                        |     1 +
 include/sound/sof/dai.h                            |     2 +
 include/sound/sof/ipc4/header.h                    |     4 +
 include/sound/tlv320aic3x.h                        |    65 -
 include/trace/events/watchdog.h                    |    66 +
 include/uapi/drm/amdgpu_drm.h                      |     2 +
 include/uapi/drm/panfrost_drm.h                    |    38 +-
 include/uapi/linux/audit.h                         |     2 +-
 include/uapi/linux/capability.h                    |     2 +-
 include/uapi/linux/cec-funcs.h                     |    14 +
 include/uapi/linux/cec.h                           |     2 +
 include/uapi/linux/idxd.h                          |     1 +
 include/uapi/linux/in.h                            |     1 +
 include/uapi/linux/io_uring.h                      |     2 +-
 include/uapi/linux/ip.h                            |     6 +-
 include/uapi/linux/ipv6.h                          |     6 +-
 include/uapi/linux/perf_event.h                    |     2 +-
 include/uapi/linux/rkisp1-config.h                 |    77 +-
 include/uapi/linux/videodev2.h                     |     3 +-
 include/uapi/sound/snd_ar_tokens.h                 |    27 +
 include/uapi/sound/sof/tokens.h                    |    14 +
 init/Kconfig                                       |     2 +-
 io_uring/filetable.h                               |    16 +-
 io_uring/io-wq.c                                   |     2 +-
 io_uring/io_uring.c                                |    47 +-
 io_uring/io_uring.h                                |    17 +-
 io_uring/kbuf.c                                    |     2 +
 io_uring/msg_ring.c                                |     3 +
 io_uring/net.c                                     |    27 +-
 io_uring/poll.c                                    |    43 +-
 io_uring/rsrc.c                                    |     7 +-
 io_uring/rsrc.h                                    |     4 -
 io_uring/rw.c                                      |     2 -
 ipc/msg.c                                          |     4 +-
 kernel/bpf/btf.c                                   |     5 +
 kernel/bpf/cgroup_iter.c                           |     2 +-
 kernel/bpf/dispatcher.c                            |    22 +-
 kernel/bpf/memalloc.c                              |    18 +-
 kernel/bpf/percpu_freelist.c                       |    23 +-
 kernel/bpf/verifier.c                              |    32 +-
 kernel/cgroup/cgroup.c                             |    99 +-
 kernel/events/core.c                               |   165 +-
 kernel/events/hw_breakpoint_test.c                 |     4 +-
 kernel/events/ring_buffer.c                        |     2 +-
 kernel/gcov/gcc_4_7.c                              |    18 +-
 kernel/kprobes.c                                   |    13 +-
 kernel/power/hibernate.c                           |     2 +-
 kernel/rcu/tree.c                                  |    10 +-
 kernel/rseq.c                                      |    19 +-
 kernel/sched/core.c                                |    76 +-
 kernel/sched/deadline.c                            |     4 +-
 kernel/sched/rt.c                                  |     4 +-
 kernel/sched/sched.h                               |    32 +-
 kernel/trace/blktrace.c                            |    82 +-
 kernel/trace/bpf_trace.c                           |     2 +
 kernel/trace/fprobe.c                              |     5 +-
 kernel/trace/ftrace.c                              |    21 +-
 kernel/trace/kprobe_event_gen_test.c               |    66 +-
 kernel/trace/rethook.c                             |     4 +-
 kernel/trace/ring_buffer.c                         |    82 +-
 kernel/trace/synth_event_gen_test.c                |    16 +-
 kernel/trace/trace.c                               |    12 +-
 kernel/trace/trace_eprobe.c                        |     8 +-
 kernel/trace/trace_events_synth.c                  |     5 +-
 kernel/trace/trace_syscalls.c                      |     2 -
 kernel/utsname_sysctl.c                            |     1 +
 lib/Kconfig.debug                                  |     7 +-
 lib/Kconfig.kmsan                                  |     1 +
 lib/Makefile                                       |     1 +
 lib/kunit/string-stream.c                          |     4 +-
 lib/kunit/test.c                                   |     2 +-
 lib/maple_tree.c                                   |    62 +-
 lib/nlattr.c                                       |    41 +-
 lib/overflow_kunit.c                               |    47 +-
 lib/test_maple_tree.c                              | 37926 +------------------
 lib/test_rhashtable.c                              |    58 +-
 mm/damon/dbgfs.c                                   |     7 +
 mm/huge_memory.c                                   |    20 +-
 mm/hugetlb.c                                       |    41 +-
 mm/hugetlb_vmemmap.c                               |     1 +
 mm/kmemleak.c                                      |    61 +-
 mm/kmsan/instrumentation.c                         |     1 +
 mm/kmsan/kmsan.h                                   |     2 +
 mm/kmsan/shadow.c                                  |     1 +
 mm/maccess.c                                       |     2 +-
 mm/madvise.c                                       |    12 +-
 mm/memory-failure.c                                |     5 +-
 mm/memory-tiers.c                                  |     8 +-
 mm/mempolicy.c                                     |    17 +-
 mm/memremap.c                                      |     1 +
 mm/migrate.c                                       |     7 +
 mm/mmap.c                                          |    27 +-
 mm/page_alloc.c                                    |    21 +-
 mm/page_isolation.c                                |     2 +-
 mm/shmem.c                                         |    17 +
 mm/slab_common.c                                   |    24 +-
 mm/userfaultfd.c                                   |    27 +-
 mm/zsmalloc.c                                      |     3 +
 net/atm/mpoa_proc.c                                |     3 +-
 net/bluetooth/hci_conn.c                           |    18 +-
 net/bluetooth/iso.c                                |    14 +-
 net/bluetooth/l2cap_core.c                         |    86 +-
 net/bpf/test_run.c                                 |     1 +
 net/bridge/br_netlink.c                            |     2 +-
 net/bridge/br_sysfs_br.c                           |     2 +-
 net/bridge/br_vlan.c                               |    17 +-
 net/caif/chnl_net.c                                |     3 -
 net/can/af_can.c                                   |     3 +-
 net/can/isotp.c                                    |    71 +-
 net/can/j1939/main.c                               |     3 +
 net/can/j1939/transport.c                          |     4 +-
 net/core/dev.c                                     |     4 +
 net/core/neighbour.c                               |     2 +-
 net/core/net_namespace.c                           |     7 +
 net/core/skbuff.c                                  |    38 +-
 net/core/skmsg.c                                   |    15 +-
 net/core/sock_map.c                                |     7 +-
 net/core/sock_reuseport.c                          |    16 +
 net/dsa/dsa2.c                                     |    23 +-
 net/dsa/dsa_priv.h                                 |     1 +
 net/dsa/master.c                                   |     3 +-
 net/dsa/port.c                                     |    16 +
 net/dsa/slave.c                                    |     2 +-
 net/ethtool/eeprom.c                               |     2 +-
 net/ethtool/pse-pd.c                               |     2 +-
 net/hsr/hsr_forward.c                              |    12 +-
 net/ieee802154/socket.c                            |     4 +-
 net/ipv4/Kconfig                                   |    10 +
 net/ipv4/af_inet.c                                 |     2 +
 net/ipv4/datagram.c                                |     2 +-
 net/ipv4/fib_frontend.c                            |     4 +-
 net/ipv4/fib_semantics.c                           |     2 +-
 net/ipv4/inet_hashtables.c                         |    10 +-
 net/ipv4/netfilter/ipt_rpfilter.c                  |     1 +
 net/ipv4/netfilter/nft_fib_ipv4.c                  |     1 +
 net/ipv4/nexthop.c                                 |     2 +-
 net/ipv4/tcp.c                                     |     3 +-
 net/ipv4/tcp_bpf.c                                 |    12 +-
 net/ipv4/tcp_input.c                               |     3 +-
 net/ipv4/tcp_ipv4.c                                |     4 +-
 net/ipv4/tcp_ulp.c                                 |     3 +
 net/ipv4/udp.c                                     |     3 +-
 net/ipv4/udp_bpf.c                                 |     4 +-
 net/ipv6/addrconf.c                                |     2 +
 net/ipv6/addrlabel.c                               |     1 +
 net/ipv6/datagram.c                                |     2 +-
 net/ipv6/ip6_gre.c                                 |    12 +-
 net/ipv6/ip6_tunnel.c                              |    11 +-
 net/ipv6/netfilter/ip6t_rpfilter.c                 |     1 +
 net/ipv6/netfilter/nft_fib_ipv6.c                  |     2 +
 net/ipv6/route.c                                   |    14 +-
 net/ipv6/sit.c                                     |     8 +-
 net/ipv6/udp.c                                     |     3 +-
 net/kcm/kcmsock.c                                  |    83 +-
 net/l2tp/l2tp_core.c                               |    19 +-
 net/mac80211/main.c                                |     8 +-
 net/mac80211/mesh_pathtbl.c                        |     2 +-
 net/mac80211/s1g.c                                 |     3 +
 net/mac80211/tx.c                                  |     5 +
 net/mac802154/rx.c                                 |     5 +-
 net/mctp/af_mctp.c                                 |     4 +-
 net/mctp/route.c                                   |     2 +-
 net/mptcp/protocol.c                               |   182 +-
 net/mptcp/protocol.h                               |     5 +-
 net/mptcp/subflow.c                                |     7 +
 net/netfilter/ipset/ip_set_hash_gen.h              |    30 +-
 net/netfilter/ipvs/ip_vs_app.c                     |    10 +-
 net/netfilter/ipvs/ip_vs_conn.c                    |    30 +-
 net/netfilter/nf_nat_core.c                        |    11 +-
 net/netfilter/nf_tables_api.c                      |    16 +-
 net/netfilter/nfnetlink.c                          |     1 +
 net/netfilter/nft_payload.c                        |     6 +-
 net/netlink/genetlink.c                            |    25 +
 net/openvswitch/datapath.c                         |     4 +-
 net/rose/rose_link.c                               |     3 +
 net/sched/sch_api.c                                |     5 +-
 net/sched/sch_cake.c                               |     4 +
 net/sched/sch_fq_codel.c                           |    25 +-
 net/sched/sch_red.c                                |     4 +-
 net/sched/sch_sfb.c                                |     3 +-
 net/sctp/outqueue.c                                |    13 +-
 net/smc/af_smc.c                                   |     6 +-
 net/smc/smc_core.c                                 |     3 +-
 net/sunrpc/auth_gss/auth_gss.c                     |     2 +-
 net/sunrpc/sysfs.c                                 |    12 +-
 net/tipc/discover.c                                |     2 +-
 net/tipc/netlink_compat.c                          |     2 +-
 net/tipc/topsrv.c                                  |    18 +-
 net/tls/tls_device_fallback.c                      |     5 +-
 net/tls/tls_strp.c                                 |    32 +-
 net/unix/unix_bpf.c                                |     8 +-
 net/vmw_vsock/af_vsock.c                           |     7 +-
 net/wireless/reg.c                                 |    12 +-
 net/wireless/scan.c                                |     4 +-
 net/wireless/util.c                                |     6 +-
 net/x25/x25_dev.c                                  |     2 +-
 scripts/Makefile.modpost                           |     2 +-
 scripts/kconfig/menu.c                             |    23 +-
 scripts/min-tool-version.sh                        |     2 +-
 scripts/package/mkdebian                           |     2 +-
 security/commoncap.c                               |     6 +-
 security/selinux/ss/services.c                     |     5 +-
 security/selinux/ss/sidtab.c                       |     4 +-
 security/selinux/ss/sidtab.h                       |     2 +-
 sound/aoa/soundbus/i2sbus/core.c                   |     7 +-
 sound/arm/pxa2xx-ac97-lib.c                        |     4 +-
 sound/core/control.c                               |    23 +
 sound/core/memalloc.c                              |    15 +-
 sound/hda/ext/hdac_ext_controller.c                |   116 +-
 sound/hda/ext/hdac_ext_stream.c                    |   216 +-
 sound/hda/hdac_controller.c                        |     4 +-
 sound/hda/hdac_stream.c                            |   209 +-
 sound/hda/hdac_sysfs.c                             |     4 +-
 sound/pci/ac97/ac97_codec.c                        |    33 +-
 sound/pci/au88x0/au88x0.h                          |     6 +-
 sound/pci/au88x0/au88x0_core.c                     |     2 +-
 sound/pci/ca0106/ca0106_mixer.c                    |     2 +-
 sound/pci/emu10k1/emumixer.c                       |     2 +-
 sound/pci/hda/Kconfig                              |     2 +-
 sound/pci/hda/cs35l41_hda.c                        |     1 +
 sound/pci/hda/hda_cs_dsp_ctl.c                     |     1 +
 sound/pci/hda/hda_intel.c                          |    11 +-
 sound/pci/hda/patch_ca0132.c                       |     1 +
 sound/pci/hda/patch_realtek.c                      |    16 +-
 sound/pci/rme9652/hdsp.c                           |    26 +-
 sound/pci/rme9652/rme9652.c                        |    22 +-
 sound/soc/amd/Kconfig                              |     4 +-
 sound/soc/amd/acp-da7219-max98357a.c               |     3 +-
 sound/soc/amd/acp/acp-i2s.c                        |    16 +-
 sound/soc/amd/acp/acp-mach-common.c                |    62 +-
 sound/soc/amd/acp/acp-platform.c                   |     8 +-
 sound/soc/amd/ps/{acp62.h => acp63.h}              |    25 +-
 sound/soc/amd/ps/pci-ps.c                          |   141 +-
 sound/soc/amd/ps/ps-mach.c                         |    30 +-
 sound/soc/amd/ps/ps-pdm-dma.c                      |   188 +-
 sound/soc/amd/yc/acp6x-mach.c                      |     7 +
 sound/soc/atmel/mchp-spdiftx.c                     |   165 +-
 sound/soc/codecs/Kconfig                           |    10 +-
 sound/soc/codecs/Makefile                          |     2 +
 sound/soc/codecs/adau1372.c                        |    32 +-
 sound/soc/codecs/adau1373.c                        |     1 -
 sound/soc/codecs/adau17x1.c                        |     1 -
 sound/soc/codecs/ak4458.c                          |    13 +-
 sound/soc/codecs/cs35l36.c                         |     4 +-
 sound/soc/codecs/cs42l83-i2c.c                     |     2 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |    28 +-
 sound/soc/codecs/cs42xx8.c                         |    22 +-
 sound/soc/codecs/cs42xx8.h                         |     3 +-
 sound/soc/codecs/da7219-aad.c                      |    46 +-
 sound/soc/codecs/da7219-aad.h                      |     1 +
 sound/soc/codecs/da7219.c                          |     9 +
 sound/soc/codecs/es8326.c                          |     5 +-
 sound/soc/codecs/hda.c                             |    12 +-
 sound/soc/codecs/hdac_hda.c                        |     6 +-
 sound/soc/codecs/hdac_hdmi.c                       |     8 +-
 sound/soc/codecs/hdmi-codec.c                      |    30 +-
 sound/soc/codecs/jz4725b.c                         |    81 +-
 sound/soc/codecs/lpass-tx-macro.c                  |   149 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |     6 +-
 sound/soc/codecs/max98373-sdw.c                    |    31 +-
 sound/soc/codecs/max98396.c                        |     6 +-
 sound/soc/codecs/max9867.c                         |    33 +-
 sound/soc/codecs/nau8315.c                         |     2 +
 sound/soc/codecs/nau8825.c                         |   135 +-
 sound/soc/codecs/nau8825.h                         |    23 +
 sound/soc/codecs/pcm512x.c                         |     8 +-
 sound/soc/codecs/rt1308-sdw.c                      |    72 +-
 sound/soc/codecs/rt1308-sdw.h                      |     2 +
 sound/soc/codecs/rt1316-sdw.c                      |    71 +-
 sound/soc/codecs/rt1316-sdw.h                      |     2 +
 sound/soc/codecs/rt1318-sdw.c                      |   884 +
 sound/soc/codecs/rt1318-sdw.h                      |   101 +
 sound/soc/codecs/rt298.c                           |     7 +
 sound/soc/codecs/rt5640.c                          |     8 +
 sound/soc/codecs/rt5682-sdw.c                      |    28 +-
 sound/soc/codecs/rt5682.c                          |     2 +
 sound/soc/codecs/rt5682.h                          |     2 +-
 sound/soc/codecs/rt5682s.c                         |    22 +
 sound/soc/codecs/rt5682s.h                         |     2 +
 sound/soc/codecs/rt700.c                           |    32 +-
 sound/soc/codecs/rt711-sdca.c                      |    27 +-
 sound/soc/codecs/rt711.c                           |    27 +-
 sound/soc/codecs/rt715-sdca.c                      |    25 +-
 sound/soc/codecs/rt715.c                           |    73 +-
 sound/soc/codecs/sdw-mockup.c                      |    28 +-
 sound/soc/codecs/simple-mux.c                      |     9 +
 sound/soc/codecs/src4xxx-i2c.c                     |     5 +-
 sound/soc/codecs/tas2780.c                         |     5 +-
 sound/soc/codecs/tlv320aic3x.c                     |   120 +-
 sound/soc/codecs/tlv320aic3x.h                     |    43 +
 sound/soc/codecs/twl4030.c                         |     6 +-
 sound/soc/codecs/wcd-clsh-v2.c                     |     6 -
 sound/soc/codecs/wcd938x.c                         |     4 +-
 sound/soc/codecs/wm8961.c                          |     7 +
 sound/soc/codecs/wm8978.c                          |     2 +-
 sound/soc/codecs/wm_adsp.c                         |    39 +-
 sound/soc/codecs/wm_adsp.h                         |     1 +
 sound/soc/codecs/wsa883x.c                         |    28 +-
 sound/soc/fsl/fsl_micfil.c                         |   447 +
 sound/soc/fsl/fsl_micfil.h                         |     6 +-
 sound/soc/fsl/fsl_rpmsg.c                          |     6 +-
 sound/soc/fsl/fsl_sai.c                            |    23 +-
 sound/soc/fsl/fsl_sai.h                            |     1 +
 sound/soc/fsl/fsl_xcvr.c                           |    40 +
 sound/soc/fsl/fsl_xcvr.h                           |    21 +
 sound/soc/fsl/imx-audio-rpmsg.c                    |     3 +-
 sound/soc/fsl/imx-audmux.c                         |     3 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |    10 +-
 sound/soc/fsl/imx-rpmsg.c                          |     6 +-
 sound/soc/generic/audio-graph-card.c               |     4 +-
 .../generic/audio-graph-card2-custom-sample.dtsi   |    10 +-
 sound/soc/generic/audio-graph-card2.c              |     6 +-
 sound/soc/generic/simple-card-utils.c              |    35 +-
 sound/soc/intel/Kconfig                            |     3 +-
 sound/soc/intel/avs/Makefile                       |     4 +
 sound/soc/intel/avs/apl.c                          |    28 +-
 sound/soc/intel/avs/avs.h                          |    92 +-
 sound/soc/intel/avs/board_selection.c              |    55 +
 sound/soc/intel/avs/boards/Kconfig                 |    18 +
 sound/soc/intel/avs/boards/Makefile                |     4 +
 sound/soc/intel/avs/boards/da7219.c                |    41 +-
 sound/soc/intel/avs/boards/hdaudio.c               |     1 +
 sound/soc/intel/avs/boards/max98373.c              |     2 +-
 sound/soc/intel/avs/boards/max98927.c              |   236 +
 sound/soc/intel/avs/boards/nau8825.c               |    35 +-
 sound/soc/intel/avs/boards/probe.c                 |    64 +
 sound/soc/intel/avs/boards/rt274.c                 |    30 +-
 sound/soc/intel/avs/boards/rt286.c                 |    37 +-
 sound/soc/intel/avs/boards/rt298.c                 |    61 +-
 sound/soc/intel/avs/boards/rt5682.c                |    31 +-
 sound/soc/intel/avs/boards/ssm4567.c               |     2 +-
 sound/soc/intel/avs/core.c                         |   118 +-
 sound/soc/intel/avs/debugfs.c                      |   436 +
 sound/soc/intel/avs/ipc.c                          |    10 +-
 sound/soc/intel/avs/loader.c                       |    28 +-
 sound/soc/intel/avs/messages.c                     |   117 +-
 sound/soc/intel/avs/messages.h                     |    55 +
 sound/soc/intel/avs/pcm.c                          |   422 +-
 sound/soc/intel/avs/probes.c                       |   313 +
 sound/soc/intel/avs/registers.h                    |     3 +-
 sound/soc/intel/avs/skl.c                          |    21 +-
 sound/soc/intel/avs/topology.c                     |    10 +
 sound/soc/intel/avs/utils.c                        |    22 -
 sound/soc/intel/boards/Kconfig                     |     1 +
 sound/soc/intel/boards/Makefile                    |     3 +-
 sound/soc/intel/boards/bdw-rt5650.c                |     2 +-
 sound/soc/intel/boards/bdw-rt5677.c                |     2 +-
 sound/soc/intel/boards/bdw_rt286.c                 |    55 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |     3 +-
 sound/soc/intel/boards/bxt_rt298.c                 |     2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |     2 +-
 sound/soc/intel/boards/bytcht_es8316.c             |     2 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |     2 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |     2 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |     2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |     2 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |     2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |     2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |     2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |     3 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |     3 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |     2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |     2 +-
 sound/soc/intel/boards/sof_cirrus_common.c         |     2 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |     4 +-
 sound/soc/intel/boards/sof_es8336.c                |     2 +-
 sound/soc/intel/boards/sof_nau8825.c               |    16 +
 sound/soc/intel/boards/sof_realtek_common.c        |     3 +-
 sound/soc/intel/boards/sof_rt5682.c                |    13 +-
 sound/soc/intel/boards/sof_sdw.c                   |    54 +-
 sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h  |   300 +
 sound/soc/intel/boards/sof_sdw_common.h            |    12 +-
 sound/soc/intel/boards/sof_sdw_rt1308.c            |   158 -
 sound/soc/intel/boards/sof_sdw_rt1316.c            |   120 -
 sound/soc/intel/boards/sof_sdw_rt_amp.c            |   359 +
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |    16 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |     5 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |    59 +
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |   157 +
 sound/soc/intel/skylake/skl-messages.c             |     6 +-
 sound/soc/intel/skylake/skl-pcm.c                  |    35 +-
 sound/soc/intel/skylake/skl-sst-cldma.c            |    27 +-
 sound/soc/intel/skylake/skl-topology.c             |    73 +-
 sound/soc/intel/skylake/skl-topology.h             |     1 -
 sound/soc/intel/skylake/skl.c                      |    16 +-
 sound/soc/jz4740/Kconfig                           |     1 +
 sound/soc/jz4740/jz4740-i2s.c                      |   485 +-
 sound/soc/jz4740/jz4740-i2s.h                      |    10 -
 sound/soc/kirkwood/kirkwood-i2s.c                  |   135 +-
 sound/soc/kirkwood/kirkwood.h                      |     2 +
 sound/soc/mediatek/common/mtk-btcvsd.c             |     6 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |     1 +
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |     1 +
 sound/soc/mediatek/mt6797/mt6797-mt6351.c          |     1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    20 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |     7 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |     4 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    15 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c         |     7 +-
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |   105 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |     1 +
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |     1 +
 sound/soc/meson/axg-pdm.c                          |     2 +-
 sound/soc/pxa/mmp-pcm.c                            |     2 +-
 sound/soc/qcom/Kconfig                             |    16 +-
 sound/soc/qcom/common.c                            |     2 -
 sound/soc/qcom/common.h                            |    23 -
 sound/soc/qcom/lpass-sc7180.c                      |    23 +
 sound/soc/qcom/lpass-sc7280.c                      |    19 +
 sound/soc/qcom/qdsp6/audioreach.c                  |   310 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |    47 +-
 sound/soc/qcom/qdsp6/q6apm.c                       |    84 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |     6 +-
 sound/soc/qcom/qdsp6/q6prm.c                       |     2 +-
 sound/soc/qcom/qdsp6/topology.c                    |   243 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |     3 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |    19 +-
 sound/soc/rockchip/rockchip_pdm.c                  |     1 +
 sound/soc/sh/Kconfig                               |     2 +-
 sound/soc/sh/rcar/adg.c                            |     4 +-
 sound/soc/sh/rcar/core.c                           |     7 +-
 sound/soc/soc-core.c                               |     8 +-
 sound/soc/soc-dai.c                                |    11 +-
 sound/soc/soc-dapm.c                               |   189 +-
 sound/soc/soc-pcm.c                                |    32 +-
 sound/soc/sof/Kconfig                              |    20 +-
 sound/soc/sof/Makefile                             |     6 +
 sound/soc/sof/amd/Kconfig                          |     1 +
 sound/soc/sof/amd/acp-common.c                     |   109 +
 sound/soc/sof/amd/acp-ipc.c                        |    43 +-
 sound/soc/sof/amd/acp-loader.c                     |     6 +-
 sound/soc/sof/amd/acp.c                            |    12 +-
 sound/soc/sof/amd/acp.h                            |    18 +
 sound/soc/sof/amd/rembrandt.c                      |    16 +
 sound/soc/sof/amd/renoir.c                         |    16 +
 sound/soc/sof/intel/Kconfig                        |     2 +-
 sound/soc/sof/intel/Makefile                       |     2 +-
 sound/soc/sof/intel/apl.c                          |     4 +
 sound/soc/sof/intel/bdw.c                          |     6 +-
 sound/soc/sof/intel/byt.c                          |    12 +-
 sound/soc/sof/intel/cnl.c                          |    35 +-
 sound/soc/sof/intel/hda-bus.c                      |    23 +-
 sound/soc/sof/intel/hda-codec.c                    |   252 +-
 sound/soc/sof/intel/hda-common-ops.c               |     6 +-
 sound/soc/sof/intel/hda-ctrl.c                     |   102 +-
 sound/soc/sof/intel/hda-dai.c                      |    95 +-
 sound/soc/sof/intel/hda-dsp.c                      |    83 +-
 sound/soc/sof/intel/hda-ipc.c                      |    27 +-
 sound/soc/sof/intel/hda-loader-skl.c               |    37 +-
 sound/soc/sof/intel/hda-loader.c                   |    98 +-
 sound/soc/sof/intel/hda-mlink.c                    |    89 +
 sound/soc/sof/intel/hda-pcm.c                      |     3 +-
 sound/soc/sof/intel/hda-stream.c                   |    93 +-
 sound/soc/sof/intel/hda.c                          |   139 +-
 sound/soc/sof/intel/hda.h                          |   113 +-
 sound/soc/sof/intel/icl.c                          |     6 +
 sound/soc/sof/intel/mtl.c                          |   161 +-
 sound/soc/sof/intel/mtl.h                          |     2 +
 sound/soc/sof/intel/pci-apl.c                      |     6 +
 sound/soc/sof/intel/pci-cnl.c                      |     9 +
 sound/soc/sof/intel/pci-icl.c                      |     6 +
 sound/soc/sof/intel/pci-mtl.c                      |     3 +
 sound/soc/sof/intel/pci-tgl.c                      |    24 +
 sound/soc/sof/intel/pci-tng.c                      |     6 +-
 sound/soc/sof/intel/shim.h                         |     3 +
 sound/soc/sof/intel/tgl.c                          |    15 +
 sound/soc/sof/ipc.c                                |    14 +
 sound/soc/sof/ipc3-loader.c                        |    26 +-
 sound/soc/sof/ipc3-pcm.c                           |     2 +
 sound/soc/sof/ipc3-topology.c                      |    36 +-
 sound/soc/sof/ipc3.c                               |     4 +-
 sound/soc/sof/ipc4-loader.c                        |   244 +-
 sound/soc/sof/ipc4-pcm.c                           |     4 +-
 sound/soc/sof/ipc4-priv.h                          |    67 +-
 sound/soc/sof/ipc4-topology.c                      |   214 +-
 sound/soc/sof/ipc4.c                               |    45 +-
 sound/soc/sof/loader.c                             |    25 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |     7 +
 sound/soc/sof/ops.h                                |    51 +-
 sound/soc/sof/sof-audio.c                          |     5 +
 sound/soc/sof/sof-audio.h                          |    43 +
 sound/soc/sof/sof-client-probes-ipc3.c             |   236 +
 sound/soc/sof/sof-client-probes-ipc4.c             |   281 +
 sound/soc/sof/sof-client-probes.c                  |   278 +-
 sound/soc/sof/sof-client-probes.h                  |    34 +
 sound/soc/sof/sof-client.c                         |    34 +
 sound/soc/sof/sof-client.h                         |     6 +
 sound/soc/sof/sof-pci-dev.c                        |    26 +
 sound/soc/sof/sof-priv.h                           |    36 +-
 sound/soc/sof/topology.c                           |   187 +-
 sound/soc/sunxi/sun50i-dmic.c                      |     5 +-
 sound/soc/tegra/tegra210_mbdrc.c                   |     4 +-
 sound/soc/tegra/tegra210_mbdrc.h                   |     2 +-
 sound/soc/ti/davinci-mcasp.c                       |     7 +-
 sound/soc/uniphier/aio-core.c                      |    11 +-
 sound/synth/emux/emux.c                            |     7 +-
 sound/usb/card.c                                   |    29 +-
 sound/usb/endpoint.c                               |     3 +-
 sound/usb/implicit.c                               |     2 +
 sound/usb/midi.c                                   |     4 +-
 sound/usb/mixer.c                                  |     2 +-
 sound/usb/quirks-table.h                           |     4 +
 sound/usb/quirks.c                                 |    47 +-
 sound/usb/usbaudio.h                               |     3 +
 tools/arch/arm64/include/asm/cputype.h             |     4 +
 tools/arch/x86/include/asm/cpufeatures.h           |     2 +-
 tools/arch/x86/include/asm/msr-index.h             |     8 +-
 tools/arch/x86/lib/memcpy_64.S                     |     2 +-
 tools/bpf/bpftool/common.c                         |     3 +
 tools/build/Makefile.feature                       |     1 +
 tools/build/feature/Makefile                       |     4 +
 .../feature/test-libbpf-bpf_program__set_insns.c   |     8 +
 tools/iio/iio_generic_buffer.c                     |     4 +-
 tools/iio/iio_utils.c                              |     4 +
 tools/include/nolibc/string.h                      |    17 +-
 tools/include/uapi/linux/in.h                      |    23 +-
 tools/include/uapi/linux/kvm.h                     |     1 +
 tools/include/uapi/linux/perf_event.h              |    27 +-
 tools/include/uapi/linux/stat.h                    |     4 +-
 tools/include/uapi/linux/stddef.h                  |    47 +
 tools/include/uapi/sound/asound.h                  |    16 -
 tools/kvm/kvm_stat/kvm_stat                        |    98 +-
 tools/perf/.gitignore                              |     1 +
 .../{perf-arm-coresight.txt => arm-coresight.txt}  |     0
 tools/perf/Makefile.config                         |     5 +
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl |    16 +-
 tools/perf/builtin-record.c                        |    41 +-
 tools/perf/check-headers.sh                        |     2 +-
 .../arch/arm64/hisilicon/hip08/metrics.json        |     6 +-
 .../arch/powerpc/power10/nest_metrics.json         |    72 +-
 .../arch/s390/cf_z16/{pai.json => pai_crypto.json} |     0
 tools/perf/tests/shell/test_brstack.sh             |     5 +-
 tools/perf/tests/shell/test_intel_pt.sh            |     6 +
 tools/perf/trace/beauty/statx.c                    |     1 +
 tools/perf/util/auxtrace.c                         |    10 +-
 tools/perf/util/bpf-event.c                        |     5 +
 tools/perf/util/bpf-loader.c                       |    18 +
 tools/perf/util/include/linux/linkage.h            |    13 +
 tools/perf/util/parse-branch-options.c             |     4 +-
 tools/perf/util/stat-display.c                     |     6 +-
 tools/power/pm-graph/README                        |    12 +-
 tools/power/pm-graph/sleepgraph.8                  |     3 +
 tools/power/pm-graph/sleepgraph.py                 |   225 +-
 tools/testing/cxl/test/cxl.c                       |   301 +-
 tools/testing/radix-tree/.gitignore                |     1 +
 tools/testing/radix-tree/Makefile                  |    19 +-
 tools/testing/radix-tree/generated/autoconf.h      |     2 +-
 tools/testing/radix-tree/linux.c                   |     4 +
 tools/testing/radix-tree/maple.c                   | 35770 +++++++++++++++++
 tools/testing/selftests/Makefile                   |     1 +
 tools/testing/selftests/bpf/prog_tests/btf.c       |    13 +
 tools/testing/selftests/bpf/prog_tests/varlen.c    |     7 +
 tools/testing/selftests/bpf/progs/test_varlen.c    |     5 +
 .../selftests/bpf/progs/user_ringbuf_success.c     |     4 +-
 tools/testing/selftests/bpf/test_progs.c           |     2 +-
 tools/testing/selftests/bpf/test_verifier.c        |     2 +-
 .../testing/selftests/bpf/verifier/ref_tracking.c  |    36 +
 .../testing/selftests/drivers/net/bonding/Makefile |     4 +-
 .../drivers/net/bonding/dev_addr_lists.sh          |     2 +-
 .../drivers/net/bonding/net_forwarding_lib.sh      |     1 +
 .../drivers/net/dsa/test_bridge_fdb_stress.sh      |     4 +-
 tools/testing/selftests/drivers/net/team/Makefile  |     4 +
 .../selftests/drivers/net/team/dev_addr_lists.sh   |     6 +-
 .../testing/selftests/drivers/net/team/lag_lib.sh  |     1 +
 .../drivers/net/team/net_forwarding_lib.sh         |     1 +
 .../ftrace/test.d/dynevent/test_duplicates.tc      |     2 +-
 .../inter-event/trigger-synthetic-eprobe.tc        |     2 +-
 tools/testing/selftests/futex/functional/Makefile  |     6 +-
 tools/testing/selftests/intel_pstate/Makefile      |     6 +-
 tools/testing/selftests/kexec/Makefile             |     6 +-
 tools/testing/selftests/kvm/aarch64/vgic_init.c    |     4 +-
 .../kvm/memslot_modification_stress_test.c         |     2 +-
 .../testing/selftests/kvm/x86_64/xen_shinfo_test.c |   142 +-
 tools/testing/selftests/landlock/Makefile          |     7 +-
 tools/testing/selftests/lib.mk                     |     4 +-
 .../selftests/memory-hotplug/mem-on-off-test.sh    |     1 -
 tools/testing/selftests/net/Makefile               |     1 +
 .../testing/selftests/net/io_uring_zerocopy_tx.sh  |     2 +-
 tools/testing/selftests/net/openvswitch/Makefile   |    13 +
 .../selftests/net/openvswitch/openvswitch.sh       |   218 +
 .../testing/selftests/net/openvswitch/ovs-dpctl.py |   351 +
 .../selftests/net/test_ingress_egress_chaining.sh  |    79 +
 tools/testing/selftests/net/udpgro.sh              |     4 +-
 tools/testing/selftests/net/udpgro_bench.sh        |     2 +-
 tools/testing/selftests/net/udpgro_frglist.sh      |     2 +-
 tools/testing/selftests/netfilter/rpath.sh         |    14 +-
 .../selftests/perf_events/sigtrap_threads.c        |    35 +-
 tools/testing/selftests/pidfd/Makefile             |     2 +-
 tools/testing/selftests/pidfd/pidfd_test.c         |     4 +-
 tools/testing/selftests/pidfd/pidfd_wait.c         |    12 +-
 tools/verification/dot2/dot2c.py                   |     2 +-
 virt/kvm/kvm_main.c                                |    27 +-
 virt/kvm/pfncache.c                                |    62 +-
 2062 files changed, 67404 insertions(+), 52353 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
 rename Documentation/devicetree/bindings/sound/{name-prefix.yaml => dai-common.yaml} (81%)
 create mode 100644 Documentation/devicetree/bindings/sound/dmic-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/dmic.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/max98357a.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/max98504.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98357a.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98504.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
 mode change 100755 => 100644 arch/arm64/boot/dts/freescale/imx93-pinfunc.h
 create mode 100644 arch/s390/configs/btf.config
 create mode 100644 arch/s390/configs/kasan.config
 create mode 100644 arch/x86/kvm/.gitignore
 create mode 100644 arch/x86/kvm/kvm-asm-offsets.c
 create mode 100644 drivers/firmware/efi/libstub/smbios.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy.h
 create mode 100644 drivers/mmc/host/sdhci-cqhci.h
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.h
 rename drivers/tty/serial/8250/{8250_gsc.c => 8250_parisc.c} (100%)
 create mode 100644 include/linux/kmsan_string.h
 rename include/sound/{acp62_chip_offset_byte.h => acp63_chip_offset_byte.h} (65%)
 create mode 100644 include/sound/sdw.h
 delete mode 100644 include/sound/tlv320aic3x.h
 create mode 100644 include/trace/events/watchdog.h
 rename sound/soc/amd/ps/{acp62.h => acp63.h} (79%)
 create mode 100644 sound/soc/codecs/rt1318-sdw.c
 create mode 100644 sound/soc/codecs/rt1318-sdw.h
 create mode 100644 sound/soc/intel/avs/boards/max98927.c
 create mode 100644 sound/soc/intel/avs/boards/probe.c
 create mode 100644 sound/soc/intel/avs/debugfs.c
 create mode 100644 sound/soc/intel/avs/probes.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt1308.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt1316.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt_amp.c
 delete mode 100644 sound/soc/jz4740/jz4740-i2s.h
 create mode 100644 sound/soc/sof/intel/hda-mlink.c
 create mode 100644 sound/soc/sof/sof-client-probes-ipc3.c
 create mode 100644 sound/soc/sof/sof-client-probes-ipc4.c
 create mode 100644 tools/build/feature/test-libbpf-bpf_program__set_insns.c
 create mode 100644 tools/include/uapi/linux/stddef.h
 rename tools/perf/Documentation/{perf-arm-coresight.txt => arm-coresight.txt} (100%)
 rename tools/perf/pmu-events/arch/s390/cf_z16/{pai.json => pai_crypto.json} (100%)
 create mode 120000 tools/testing/selftests/drivers/net/bonding/net_forwarding_lib.sh
 create mode 120000 tools/testing/selftests/drivers/net/team/lag_lib.sh
 create mode 120000 tools/testing/selftests/drivers/net/team/net_forwarding_lib.sh
 create mode 100644 tools/testing/selftests/net/openvswitch/Makefile
 create mode 100755 tools/testing/selftests/net/openvswitch/openvswitch.sh
 create mode 100644 tools/testing/selftests/net/openvswitch/ovs-dpctl.py
 create mode 100644 tools/testing/selftests/net/test_ingress_egress_chaining.sh

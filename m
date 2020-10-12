Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6DD28B598
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 15:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CB16168D;
	Mon, 12 Oct 2020 15:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CB16168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602508241;
	bh=G2k5NGtpspDTlu7Y317TcxTUJmNju1ZGXELgHuIvOqY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I5nI5J4Yj9ZG98FUNSCOmdRgVXT6C9AU7hT0bUVqg9LbCt+Cu7hcu05R4NmSEbs6D
	 2Q6U0JWBogKOBdokTZ5QTafCQ+hZf3aoLoOJeNprOJ5bfZ3CBEMSKk8w56tYKJFVPk
	 GUFAuEDDY/h4c/Re/5fQKFao2nQ00rZv2ThnbQsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB16BF80217;
	Mon, 12 Oct 2020 15:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA824F80217; Mon, 12 Oct 2020 15:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,PRX_BODY_94,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F312F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 15:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F312F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c1bzj3Fl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 816462076C;
 Mon, 12 Oct 2020 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602508126;
 bh=G2k5NGtpspDTlu7Y317TcxTUJmNju1ZGXELgHuIvOqY=;
 h=From:To:Cc:Subject:Date:From;
 b=c1bzj3Fl9YehTeC5pWd3aee2TYtnYWPWoiPOvXaHjFvSrLgeUF8LmZgXQZzmJqVe2
 5bNrS2eYQABvUyt6eKKfghSJS29il86WIrsQgN/+ACWRBara70npgWCrILlAcuk1dR
 UkaPECJbKWfc+U7/oF6GPUQHT0FDuqZ0yVU5A368=
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.10
Date: Mon, 12 Oct 2020 14:08:28 +0100
Message-Id: <20201012130845.816462076C@mail.kernel.org>
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

The following changes since commit 549738f15da0e5a00275977623be199fbbf7df50:

  Linux 5.9-rc8 (2020-10-04 16:04:34 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.10

for you to fetch changes up to c890e30b069a2792a5a34e8510a7a437dd6f5b3d:

  Merge remote-tracking branch 'asoc/for-5.10' into asoc-next (2020-10-09 15:42:31 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.10

Not a huge amount going on in the core for ASoC this time but quite a
lot of driver activity, especially for the Intel platforms:

 - Replacement of the DSP driver for some older x86 systems with a new
   one which was written with closer reference to the DSP firmware so
   should hopefully be more robust and maintainable.
 - A big batch of static checker and other fixes for the rest of the x86
   DSP drivers.
 - Cleanup of the error unwinding code from Morimoto-san, hopefully
   making it more robust.
 - Helpers for parsing auxiluary devices from the device tree from
   Stephan Gerhold.
 - New support for AllWinner A64, Cirrus Logic CS4234, Mediatek MT6359
   Microchip S/PDIF TX and RX controllers, Realtek RT1015P, and Texas
   Instruments J721E, TAS2110, TAS2564 and TAS2764

----------------------------------------------------------------
Adam Brickman (1):
      ASoC: wm_adsp: Pass full name to snd_ctl_notify

Adam Thomson (4):
      ASoC: da7219: Move required devm_* allocations to device level code
      ASoC: da7219: Move soft reset handling to codec level probe
      ASoC: da7219: Fix clock handling around codec level probe
      ASoC: da7219: Fix I/O voltage range configuration during probe

Ajit Pandey (4):
      ASoC: qcom: Add common array to initialize soc based core clocks
      ASoC: qcom: lpass-platform: Replace card->dev with component->dev
      ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
      ASoC: Add sc7180-lpass bindings header

Akshu Agrawal (1):
      ASoC: AMD: Clean kernel log from deferred probe error messages

Alex Dewar (1):
      ASoC: omap-mcbsp: Fix use of uninitialised pointer

Alexandre Belloni (2):
      spi: atmel: remove unnecessary include
      ASoC: atmel-pcm: remove unnecessary include

Anson Huang (1):
      ASoC: Convert NXP spdif to json-schema

Arnd Bergmann (4):
      ASoC: samsung: h1940: turn into platform driver
      ASoC: samsung: neo1973: turn into platform driver
      ASoC: samsung: rx1950: turn into platform driver
      ASoC: samsung: s3c2412-i2s: avoid hardcoded S3C2410_PA_IIS

Bard Liao (7):
      ASoC: intel: sof_sdw: add .exit callback function
      ASoC: Intel: modify SoundWire version id in acpi match table
      ASoC: Intel: sof_sdw: check SoundWire version when matching codec
      ASoC: Intel: sof_sdw: rename id as part_id
      ASoC: intel: sof_sdw: add rt711 rt1316 rt714 SDCA codec support.
      ASoC: Intel: sof_sdw: clean-up inclusion of header files
      ASoC: Intel: add support for new SoundWire hardware layout on TGL

Brent Lu (2):
      ASoC: hdac_hdmi: support 'ELD' mixer
      ASoC: hdac_hdmi: remove cancel_work_sync in runtime suspend

Camel Guo (3):
      ASoC: tlv320adcx140: Fix digital gain range
      dt-bindings: tlv320adcx140: Add GPIO config and drive config
      ASoC: tlv320adcx140: Add support for configuring GPIO pin

Cezary Rojewski (34):
      spi: pxa2xx: Add SSC2 and SSPSP2 SSP registers
      ASoC: Intel: Add catpt base members
      ASoC: Intel: catpt: Implement IPC protocol
      ASoC: Intel: catpt: Add IPC message handlers
      ASoC: Intel: catpt: Define DSP operations
      ASoC: Intel: catpt: Firmware loading and context restore
      ASoC: Intel: catpt: PCM operations
      ASoC: Intel: catpt: Device driver lifecycle
      ASoC: Intel: catpt: Event tracing
      ASoC: Intel: catpt: Simple sysfs attributes
      ASoC: Intel: haswell: Remove haswell-solution specific code
      ASoC: Intel: broadwell: Remove haswell-solution specific code
      ASoC: Intel: bdw-5650: Remove haswell-solution specific code
      ASoC: Intel: bdw-5677: Remove haswell-solution specific code
      ASoC: Intel: Select catpt and deprecate haswell
      ASoC: Intel: bdw-rt5650: Mark FE DAIs as nonatomic
      ASoC: Intel: bdw-rt5677: Mark FE DAIs as nonatomic
      ASoC: Intel: broadwell: Mark FE DAIs as nonatomic
      ASoC: Intel: haswell: Mark FE DAIs as nonatomic
      ASoC: Intel: Remove haswell solution
      ASoC: Intel: Remove max98090 support for baytrail solution
      ASoC: Intel: Remove rt5640 support for baytrail solution
      ASoC: Intel: Remove baytrail solution
      ASoC: Intel: Remove SST ACPI component
      ASoC: Intel: Remove SST firmware components
      ASoC: Intel: Skylake: Unassign ram_read and read_write ops
      ASoC: Intel: Remove unused DSP operations
      ASoC: Intel: Remove unused DSP interface fields
      ASoC: Intel: Remove SST-legacy specific constants
      ASoC: Intel: Make atom components independent of sst-dsp
      ASoC: Intel: Remove sst_pdata structure
      ASoC: Intel: Remove sst_dsp_get_thread_context
      ASoC: Intel: catpt: Fix compilation when CONFIG_MODULES is disabled
      ASoC: Intel: catpt: Add explicit DMADEVICES kconfig dependency

Charles Keepax (2):
      ASoC: wm_adsp: Update naming in error handling
      ASoC: cs4234: Add dtschema binding document

Cheng-Yi Chiang (1):
      ASoC: hdmi-codec: Use set_jack ops to set jack

Christophe JAILLET (1):
      ASoC: wm8523: Fix a typo in a comment

Codrin Ciubotariu (6):
      ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller
      ASoC: add DT bindings for Microchip S/PDIF TX Controller
      ASoC: mchp-spdifrx: add driver for SPDIF RX
      ASoC: add DT bindings for Microchip S/PDIF RX Controller
      ASoC: mchp-spdifrx: convert to devm_platform_get_and_ioremap_resource
      ASoC: mchp-spdiftx: remove 'TX' from playback stream name

Colin Ian King (3):
      sound: remove duplicate "the the" phrase in Kconfig text
      ASoC: qcom: add missing out of memory check on drvdata->clks allocation
      ASoC: mchp-spdifrx: fix spelling mistake "overrrun" -> "overrun"

Dan Carpenter (1):
      ASoC: hdac_hdmi: tidy up a memset()

Dan Murphy (29):
      dt-bindings: tas2562: Remove tas2562 text file
      dt-bindings: tas2562: Add device specification links
      ASoC: tlv320adcx140: Add digital mic channel enable routing
      ASoC: tlv320adcx140: Idle the device while writing registers
      ASoC: tlv320adcx140: Fix BCLK inversion for DSP modes
      ASoC: tlv320adcx140: Add the config to configure Tx ASI output
      ASoC: tlv320adcx140: Add ASI Tx drive
      dt-bindings: tas2562: Add TAS2564 to binding
      ASoC: tas2562: Add the TAS2564 compatible
      ASoC: tas2770: Fix calling reset in probe
      ASoC: tas2770: Add missing bias level power states
      ASoC: tas2770: Fix required DT properties in the code
      ASoC: tas2770: Fix error handling with update_bits
      dt-bindings: tas2562: Add the TAS2110 amplifier
      ASoC: tas2562: Add the TAS2110 class-D amplifier
      dt-bindings: tas2770: Fix I2C addresses for the TAS2770
      ASoC: tas2770: Fix unbalanced calls to pm_runtime
      ASoC: tas2770: Convert bit mask to GENMASK in header
      ASoC: tas2770: Fix the spacing and new lines
      ASoC: tas2770: Refactor sample rate function
      ASoC: tas2562: Remove duplicate code for I/V sense
      dt-bindings: tas2770: Add shutdown gpio property
      ASoC: tas2770: Add shutdown capability via a GPIO
      ASoC: tas2770: Set regcache when shutting down and waking device
      ASoC: tas2770: Remove ti,asi-format code
      ASoC: tas2770: Remove unused variables
      dt-bindings: tas2770: Mark ti,asi-format to deprecated
      dt-bindings: tas2764: Add the TAS2764 binding doc
      ASoC: tas2764: Add the driver for the TAS2764

Daniel Baluta (3):
      ASoC: SOF: pm: Fix prepare callback behavior for OF usecase
      ASoC: SOF: Activate runtime PM with SOF OF device
      ASoC: SOF: Add .prepare/.complete callbacks

Dharageswari R (2):
      ASoC: topology: Add support for WO and RO TLV byte kcontrols
      ASoC: SOF: Implement snd_sof_bytes_ext_volatile_get kcontrol IO

Dmitry Baryshkov (1):
      ASoC: core: remove artificial component and DAI name constraint

Douglas Anderson (2):
      ASoC: rt5682: Prefer async probe
      ASoC: qcom: lpass-sc7180: Add MODULE_DEVICE_TABLE

Guennadi Liakhovetski (7):
      ASoC: SOF: topology: (cosmetic) remove redundant variable initialisations
      ASoC: SOF: (cosmetic) use the "bool" type where it makes sense
      ASoC: SOF: add a "core" parameter to widget loading functions
      ASoC: SOF: support topology components on secondary cores
      ASoC: SOF: (cosmetic) remove redundant "ret" variable uses
      ASoC: SOF: remove several superfluous type-casts
      ASoC: SOF: fix range checks

Guillermo Rodríguez (1):
      ASoC: cs42l51: add additional ADC volume controls

Iulian Olaru (4):
      ASoC: SOF: loader: Add debug box region
      ASoC: SOF: imx: Replace sdev->private with sdev->pdata->hw_pdata
      ASoC: SOF: sof-of-dev: Add .arch_ops field
      ASoC: SOF: imx: Add debug support for imx platforms

Jack Yu (1):
      ASoC: rt715: Add power-up delay to fix dmic pop sound issue.

Jaska Uimonen (1):
      ASoC: SOF: intel: hda: support also devices with 1 and 3 dmics

Jiaxin Yu (2):
      ASoC: mediatek: mt6359: add codec driver
      dt-bindings: mediatek: mt6359: add codec document

Johan Jonker (1):
      ASoC: rockchip-spdif: add description for rk3308

Kai Vehmanen (2):
      ASoC: SOF: imx: add missing MODULE_LICENSE() for imx-common
      ASoC: hdac: make SOF HDA codec driver probe deterministic

Karol Trzcinski (3):
      ASoC: SOF: IPC: make sof_ipc_window monosized
      ASoC: SOF: ext_manifest: Parse debug ABI version
      ASoC: SOF: Add `src_hash` to `sof_ipc_fw_version` structure

Keyon Jie (18):
      ASoC: SOF: topology: fix the ipc_size calculation for process component
      ASoC: SOF: tokens: add token for component UUID
      ASoC: SOF: add comp_ext to struct snd_sof_widget
      ASoC: SOF: topology: create component extended tokens
      ASoC: SOF: topology: parse comp_ext_tokens for all widgets
      ASoC: SOF: use the sof_ipc_comp reserved bytes for extended data
      ASoC: SOF: topology: add helper for setting up IPC component
      ASoC: SOF: append extended data to sof_ipc_comp_dai
      ASoC: SOF: append extended data to sof_ipc_comp_mixer
      ASoC: SOF: append extended data to sof_ipc_comp_volume
      ASoC: SOF: append extended data to sof_ipc_comp_host
      ASoC: SOF: append extended data to sof_ipc_comp_src
      ASoC: SOF: append extended data to sof_ipc_comp_asrc
      ASoC: SOF: append extended data to sof_ipc_comp_tone
      ASoC: SOF: append extended data to sof_ipc_comp_process
      ASoC: SOF: append extended data to sof_ipc_comp_mux
      ASoC: SOF: topology: make process type optional
      ASoC: SOF: topology: fix the process being scheduled on core0 always

Krzysztof Kozlowski (8):
      ASoC: samsung-i2s: Use unevaluatedProperties
      ASoC: midas-audio: Correct parsing sound-dai phandles
      ASoC: odroid: Use unevaluatedProperties
      ASoC: odroid: Add missing properties
      ASoC: samsung-i2s: Add missing properties
      ASoC: dt-bindings: aries-wm8994: Match compatibles with enum
      ASoC: dt-bindings: Correct interrupt flags in examples
      ASoC: dt-bindings: sgtl5000: Add common clock properties

Kuninori Morimoto (10):
      ASoC: soc-core: add snd_soc_find_dai_with_mutex()
      ASoC: soc-dai: add mark for snd_soc_dai_startup/shutdown()
      ASoC: soc-link: add mark for snd_soc_link_startup/shutdown()
      ASoC: soc-component: add mark for soc_pcm_components_open/close()
      ASoC: soc-component: add mark for snd_soc_pcm_component_pm_runtime_get/put()
      ASoC: soc-pcm: add soc_pcm_clean() and call it from soc_pcm_open/close()
      ASoC: soc-pcm: remove unneeded dev_err() for snd_soc_dai_startup()
      ASoC: soc-pcm: remove unneeded dev_err() for snd_soc_component_module/open()
      ASoC: soc-pcm: ignore un-needed mutex_unlock() case on soc_pcm_open()
      ASoC: soc-pcm: add missing ret=0 at soc_pcm_open()

Lucas Tanure (1):
      ASoC: cs4234: Add support for Cirrus Logic CS4234 codec

Mark Brown (52):
      Merge existing fixes from asoc/for-5.9
      Merge series "ASoC: SOF/Intel: fix cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: rt5682: Use clk APIs better" from Stephen Boyd <swboyd@chromium.org>:
      Merge series "Allwinner A64 digital audio codec fixes" from Samuel Holland <samuel@sholland.org>:
      Merge series "This patch series is to enable multiple features on the Keembay Platform" from Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>:
      Merge series "ASoC: sun50i-codec-analog: Cleanup and power management" from Samuel Holland <samuel@sholland.org>:
      Merge series "Codec workaround" from Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>:
      Merge series "ASoC: qcom: Add support for SC7180 lpass variant" from Rohit kumar <rohitkr@codeaurora.org>:
      Merge series "refine and clean code for synchronous mode" from Shengjiu Wang <shengjiu.wang@nxp.com>:
      Merge series "ASoC: da7219: Reorganise device/codec level probe/remove" from Adam Thomson <Adam.Thomson.Opensource@diasemi.com>:
      Merge series "ASoC: Intel: fix cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: qdsp6: add gapless compressed audio support" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge tag 'samsung-platdrv-boards' into asoc-5.10
      Merge series "Add mediatek codec mt6359 driver" from Jiaxin Yu <jiaxin.yu@mediatek.com>:
      Merge series "ASoC: Intel: machine driver updates for 5.10" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge tag 'v5.9-rc2' into asoc-5.10
      Merge series "ASoC: SOF: trivial code/log/comment improvements" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "SOF fixes and updates" from Ranjani Sridharan <ranjani.sridharan@linux.intel.com>:
      Merge series "SOF fixes and updates for FW boot" from Ranjani Sridharan <ranjani.sridharan@linux.intel.com>:
      Merge series "ASoC: SOF: multi core support for 5.10" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "ASoC: Add sdw stream operations to dailink ops." from Bard Liao <yung-chuan.liao@linux.intel.com>:
      Merge series "ASoC: SOF: component UUID support for 5.10" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "ASoC: sun8i-codec driver cleanup" from Samuel Holland <samuel@sholland.org>:
      Merge series "ASoC: qcom: common: Parse auxiliary devices from device tree" from Stephan Gerhold <stephan@gerhold.net>:
      Merge branch 'topic/tasklet-convert' of https://git.kernel.org/.../tiwai/sound into asoc-5.10
      Merge series "ASoC: q6dsp: Add support to Codec Ports." from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "ASoC: ti: j721e-evm: Support for j7200 variant" from Peter Ujfalusi <peter.ujfalusi@ti.com>:
      Merge series "ASoC: mediatek: mt8183-da7219: support machine driver for rt1015p" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: SOF: DSP core management fixes for 5.10" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge branch 'asoc-5.9' into asoc-5.10
      Merge series "ASoC: q6afe: add clocks support" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "ASoC: SOF: small fixes for 5.10" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "ASoC: fsl_sai: update the register list" from Shengjiu Wang <shengjiu.wang@nxp.com>:
      Merge branch 'asoc-5.9' into asoc-5.10
      Merge series "ASoC: SOF: fix kcontrol size checks" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "ASoC: Intel: sdw machine driver updates for 5.10" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "ASoC: qdsp6: fix some warnings when build without CONFIG_OF" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "Enable runtime PM for SOF device" from Daniel Baluta <daniel.baluta@oss.nxp.com> Daniel Baluta <daniel.baluta@nxp.com>:
      Merge tag 'regmap-field-bulk-api' of https://git.kernel.org/.../broonie/regmap into asoc-5.10
      Merge series "ASoC: merge soc_pcm_open() rollback and soc_pcm_close()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: Intel: Catpt - Lynx and Wildcat point" from Cezary Rojewski <cezary.rojewski@intel.com>:
      ASoC: fsl_spdif: Remove unused np
      Merge series "Add driver for Microchip S/PDIF RX" from Codrin Ciubotariu <codrin.ciubotariu@microchip.com>:
      Merge series "ASoC: Intel: sof_sdw: minor corrections" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: sun8i-codec: support for AIF2 and AIF3" from Samuel Holland <samuel@sholland.org>:
      Merge series "ASoC: Intel: Remove obsolete solutions and components" from Cezary Rojewski <cezary.rojewski@intel.com>:
      Merge tag 'v5.9-rc5' into asoc-5.10
      Merge series "Qualcomm's lpass-hdmi ASoC driver to support audio over dp port" from Srinivasa Rao Mandadapu <srivasam@codeaurora.org>:
      Merge series "ASoC: stm32: dfsdm: change rate limits" from Olivier Moysan <olivier.moysan@st.com>:
      ASoC: dmaengine: Document support for TX only or RX only streams
      Merge remote-tracking branch 'asoc/for-5.9' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.10' into asoc-next

Matthias Schiffer (4):
      ASoC: bindings: fsl-asoc-card: add compatible string for TLV320AIC32x4 codec
      ASoC: fsl-asoc-card: add support for TLV320AIC32x4 codec
      ASoC: codec: tlv320aic32x4: fix missing aic32x4_disable_regulators() in error path
      ASoC: codec: tlv320aic32x4: do software reset before clock registration

Michael Sit Wei Hong (6):
      ASoC: codec: tlv3204: Enable 24 bit audio support
      ASoC: codec: tlv3204: Increased maximum supported channels
      ASoC: codec: tlv3204: Moving GPIO reset and add ADC reset
      ASoC: Intel: KMB: Enable TDM audio capture
      dt-bindings: sound: intel, keembay-i2s: Add new compatible string
      ASoC: Intel: KeemBay: Fix warning potential ! vs ~ typo

Miquel Raynal (3):
      ASoC: tlv320aic32x4: Ensure a minimum delay before clock stabilization
      ASoC: tlv320aic32x4: Fix bdiv clock rate derivation
      ASoC: tlv320aic32x4: Enable fast charge

Necip Fazil Yildiran (1):
      ASoC: cros_ec_codec: fix kconfig dependency warning for SND_SOC_CROS_EC_CODEC

Oder Chiou (1):
      ASoC: rt5682: Enable the power of "MICBIAS" and "Vref2" for the DMIC clock

Olivier Moysan (3):
      ASoC: stm32: sai: add pm_runtime support
      ASoC: stm32: dfsdm: change rate limits
      ASoC: stm32: dfsdm: add actual resolution trace

Pavel Dobias (1):
      ASoC: max9867: shutdown codec when changing filter type

Peter Ujfalusi (5):
      ASoC: ti: Kconfig: Allow the j721e machine driver to be used on K3 platform
      ASoC: dt-bindings: ti, j721e-cpb-audio: Document support for j7200-cpb
      ASoC: ti: j721e-evm: Add support for j7200-cpb audio
      ASoC: ti: j721e-evm: Fix compiler warning when CONFIG_OF=n
      ASoC: ti: davinci-mcasp: Use &pdev->dev for early dev_warn

Pierre-Louis Bossart (59):
      ASOC: SOF: Intel: hda-codec: move unused label to correct position
      ASoC: SOF: Intel: hda-codec: move variable used conditionally
      ASoC: Intel: rename shadowed variable for all broadwell boards
      ASoC: Intel: bytcht_cx2072x: simplify return handling
      ASoC: Intel: Atom: sst-atom-controls: remove redundant assignments
      ASoC: Intel: Atom: compress: remove redundant assignment
      ASoC: Intel: Atom: platform-pcm: remove redundant assignment
      ASoC: Intel: Atom: sst: remove useless NULL assignment
      ASoC: Intel: Atom: remove redundant initialization
      ASoC: Intel: Atom: sst_pvt: remove redundant initialization
      ASoC: Intel: Atom: platform-pcm: fix redundant return
      ASoC: Intel: Atom: remove useless assignment
      ASoC: Intel: Atom: sst_loader: remove always-true condition
      ASoC: Intel: Atom: sst_pvt: simplify return handling
      ASoC: Intel: Atom: (cosmetic) align parameters
      ASoC: Intel: Baytrail: (cosmetic) align function parameters
      ASoC: Intel: common: (cosmetic) align function parameters
      ASoC: Intel: haswell: (cosmetic) align function parameters
      ASoC: Intel: haswell-ipc: remove redundant assignments
      ASoC: Intel: Skylake: skl-nhlt: remove redundant initialization
      ASoC: Intel: Skylake: cldma: remove redundant initialization
      ASoC: Intel: Skylake: sst-utils: remove redundant assignment
      ASoC: Intel: Skylake: skl-topology: remove redundant assignments
      ASoC: Intel: Skylake: skl-topology: remove redundant assignment
      ASoC: Intel: Skylake: (cosmetic) align function parameters
      ASoC: codecs: wm0010: use DECLARE_COMPLETION_ONSTACK() macro
      ASoC: codecs: rt*-sdw: use SDW_SLAVE_ENTRY_EXT
      ASoC: SOF: Intel: hda: import SOUNDWIRE_INIT namespace
      ASoC: SOF: Intel: add build support for SoundWire
      ASoC: Intel: soc-acpi: cnl: add support for rt5682 on SoundWire link2
      ASoC: Intel: sof-soundwire: add support for rt5682 on link2
      ASoC: Intel: soc-acpi: mirror CML and TGL configurations
      ASoC: Intel: soc-acpi: add support for SDCA boards
      ASoC: codecs: max98373-sdw: add missing test on resume
      ASoC: SOF: IPC: reduce verbosity of IPC pointer updates
      ASoC: SOF: acpi: add dev_dbg() log for probe completion
      ASoC: SOF: Intel: add dev_dbg log when driver is not selected
      ASoC: Intel: use consistent HDAudio spelling in comments/docs
      ASoC: SOF: loader: fix memory leak in get_ext_windows
      ASoC: soc-dai: clarify return value for get_sdw_stream()
      ASoC: Intel: sof_sdw: add dailink .trigger callback
      ASoC: Intel: sof_sdw: add dailink .prepare and .hw_free callback
      ASoC: SOF: Intel: hda-loader: s/master/primary
      ASoC: topology: disable size checks for bytes_ext controls if needed
      ASoC: SOF: debug: update test for pm_runtime_get_sync()
      ASoC: SOF: control: update test for pm_runtime_get_sync()
      ASoC: SOF: Intel: hda: reduce verbosity of boot error logs
      ASoC: SOF: control: fix size checks for ext_bytes control .get()
      ASoC: SOF: control: fix size checks for volatile ext_bytes control .get()
      ASoC: SOF: control: add size checks for ext_bytes control .put()
      ASoC: Intel: sof_sdw: remove ternary operator
      ASoC: Intel: add codec name prefix to ACPI machine description
      ASoC: Intel: sof_sdw: remove hard-coded codec_conf table
      ASoC: Intel: sof_sdw_rt700: add codec prefix
      ASoC: Intel: hda_dsp_common: use static function in conditional block
      ASoC: Intel: sof_sdw_rt1308: add extra check on init
      ASoC: Intel: sof_sdw_rt1316: add missing component string
      ASoC: rt715-sdw: probe with RT714 Device ID
      ASoC: Intel: sof_sdw: add version_id to avoid rt714/rt715 confusion

Qinglang Miao (7):
      ASoC: soc-core: use devm_snd_soc_register_card()
      ASoC: fsl: imx-mc13783: use devm_snd_soc_register_card()
      ASoC: tegra: tegra_max98090: use devm_snd_soc_register_card()
      ASoC: tegra: tegra_wm8753: use devm_snd_soc_register_card()
      ASoC: tegra: tegra_rt5640: use devm_snd_soc_register_card()
      ASoC: fsl: mx27vis-aic32x4: use devm_snd_soc_register_card()
      ASoC: tegra: trimslice.c: use devm_snd_soc_register_card()

Rander Wang (5):
      ASoC: Intel: tgl_max98373: fix a runtime pm issue in multi-thread case
      SoC: Intel: sof_sdw: Add support for product Ripto
      ASoC: SOF: fix a runtime pm issue in SOF when HDMI codec doesn't work
      ASoC: SOF: Intel: Add support for tgl-h
      ASOC: Intel: sof_sdw: restore playback functionality with max98373 amps

Randy Dunlap (4):
      ASoC: various vendors: delete repeated words in comments
      ASoC: codecs: delete repeated words in comments
      ASoC: SOF: delete repeated words in comments
      ASoC: qcom: fix SDM845 & QDSP6 dependencies more

Ranjani Sridharan (15):
      ASoC: SOF: topology: remove unnecessary memory alloc for sdev->private
      ASoC: SOF: topology: reduce the log level for unhandled widgets
      ASoC: SOF: Intel: hda: report error only for the last ROM init iteration
      ASoC: SOF: Intel: hda: add extended rom status dump to error log
      ALSA: hda: fix VS_LTRC register name
      ASoC: SOF: Intel: hda: Add helper function to program ICCMAX stream
      ASoC: SOF: Intel: hda: modify the signature of get_stream_with_tag()
      ASoC: SOF: Intel: hda: define macro for code loader stream format
      ASoC: SOF: Intel: hda: Define FW boot sequence with ICCMAX
      ASoC: SOF: Intel: hda: Add sof_tgl_ops for TGL platforms
      ASoC: SOF: Intel: hda: Simplify error handling during FW boot
      ASoC: SOF: topology: fix core enable sequence
      ASoC: SOF: rename cores_mask to host_managed_cores_mask
      ASoC: SOF: Intel: hda: modify core_power_up/down op
      ASoC: SOF: Intel: remove the HDA_DSP_CORE_MASK() macro

Richard Fitzgerald (3):
      ASoC: cs47l15: Fix EPOUT->HPOUT1 Mono Mux routing
      ASoC: cs47l35: Fix EPOUT->HPOUT1 Mono Mux routing
      MAINTAINERS: Update Cirrus Logic Codecs maintainers

Rob Herring (1):
      ASoC: Remove unused 'linux,hdmi-audio'

Rohit kumar (8):
      ASoC: qcom: lpass-cpu: Move ahbix clk to platform specific function
      ASoC: qcom: lpass-platform: fix memory leak
      ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers
      ASoC: qcom: lpass-cpu: fix concurrency issue
      ASoC: qcom: lpass-cpu: Use platform_get_resource
      ASoC: qcom: lpass-platform: Use platform_get_irq
      ASoC: Add sc7180 lpass cpu node
      ASoC: lpass-cpu: Move to yaml format

Samuel Holland (30):
      ASoC: dt-bindings: Add a new compatible for the A64 codec
      ASoC: sun8i-codec: Fix DAPM to match the hardware topology
      ASoC: sun8i-codec: Add missing mixer routes
      ASoC: sun8i-codec: Add a quirk for LRCK inversion
      ASoC: sun50i-codec-analog: Fix duplicate use of ADC enable bits
      ASoC: sun50i-codec-analog: Gate the amplifier clock during suspend
      ASoC: sun50i-codec-analog: Group and sort mixer routes
      ASoC: sun50i-codec-analog: Make headphone routes stereo
      ASoC: sun50i-codec-analog: Enable DAPM for headphone switch
      ASoC: sun50i-codec-analog: Make line out routes stereo
      ASoC: sun50i-codec-analog: Enable DAPM for line out switch
      ASoC: sun50i-codec-analog: Enable DAPM for earpiece switch
      ASoC: sun8i-codec: Hook up component probe function
      ASoC: sun8i-codec: Remove extraneous widgets
      ASoC: sun8i-codec: Fix AIF1 MODCLK widget name
      ASoC: sun8i-codec: Fix AIF1_ADCDAT_CTRL field names
      ASoC: sun8i-codec: Fix AIF1_MXR_SRC field names
      ASoC: sun8i-codec: Fix ADC_DIG_CTRL field name
      ASoC: sun8i-codec: Fix field bit number indentation
      ASoC: sun8i-codec: Sort masks in a consistent order
      ASoC: sun8i-codec: Attach the bus clock to the regmap
      ASoC: sun8i-codec: Manage module clock via DAPM
      ASoC: sun8i-codec: Set up clock tree at probe time
      ASoC: sun8i-codec: Swap module clock/reset dependencies
      ASoC: sun8i-codec: Sort DAPM controls, widgets, and routes
      ASoC: sun8i-codec: Consistently name DAPM widgets and routes
      ASoC: sun8i-codec: Correct DAPM widget types
      ASoC: sun8i-codec: Fix AIF widget channel references
      ASoC: sun8i-codec: Enable AIF mono/stereo control
      ASoC: sun8i-codec: Use snd_soc_dai_get_drvdata

Sathyanarayana Nujella (3):
      ASoC: Intel: sof_rt5682: override quirk data for tgl_max98373_rt5682
      ASoC: SOF: Add topology filename override based on dmi data match
      ASoC: SOF: Intel: Use DMI oem string search for tgl_max98373_rt5682

Sebastian Krzyszkowiak (1):
      ASoC: wm8962: Export DAC/ADC monomix switches

Shengjiu Wang (17):
      ASoC: fsl_sai: Refine enable/disable TE/RE sequence in trigger()
      ASoC: fsl_sai: Drop TMR/RMR settings for synchronous mode
      ASoC: fsl_sai: Replace synchronous check with fsl_sai_dir_is_synced
      ASoC: dt-bindings: ak4458: Add power supply property
      ASoC: ak4458: Add regulator support
      ASoC: fsl-asoc-card: Get "extal" clock rate by clk_get_rate
      ASoC: dt-bindings: ak5558: Add power supply property
      ASoC: ak5558: Add regulator support
      ASoC: fsl_sai: Add -EPROBE_DEFER check for regmap init
      ASoC: fsl_sai: Support multiple data channel enable bits
      ASoC: fsl_sai: Set SAI Channel Mode to Output Mode
      ASoC: fsl_sai: Add new added registers and new bit definition
      ASoC: fsl_sai: Add fsl_sai_check_version function
      ASoC: fsl_sai: Set MCLK input or output direction
      ASoC: dt-bindings: ak4458: Add dsd-path property
      ASoC: ak4458: Add DSD support for ak4458 and ak4497
      ASoC: fsl_sai: Instantiate snd_soc_dai_driver

Shuming Fan (2):
      ASoC: rt700: wait for the delayed work to finish when the system suspends
      ASoC: rt711: wait for the delayed work to finish when the system suspends

Srinivas Kandagatla (26):
      ASoC: q6asm: rename misleading session id variable
      ASoC: q6asm: make commands specific to streams
      ASoC: q6asm: use flags directly from q6asm-dai
      ASoC: q6asm: add length to write command token
      ASoC: q6asm: add support to remove intial and trailing silence
      ASoC: q6asm: add support to gapless flag in q6asm open
      ASoC: q6asm-dai: add next track metadata support
      ASoC: q6asm-dai: prepare set params to accept profile change
      ASoC: q6asm-dai: add gapless support
      ASoC: q6asm-dai: add support to copy callback
      ASoC: qcom: add a dedicated menuconfig
      ASoC: q6dsp: q6afe: add support to Codec DMA ports
      ASoC: q6dsp: q6routing: add support to Codec DMA ports
      ASoC: q6dsp: q6afe: prepare afe_apr_send_pkt to take response opcode
      ASoC: q6dsp: q6afe: add global q6afe waitqueue
      ASoC: q6dsp: q6afe: add lpass hw voting support
      ASoC: q6dsp: q6afe: update q6afe_set_param to support global clocks
      ASoC: q6dsp: q6afe: add codec lpass clocks
      ASoC: q6dsp: q6afe-dai: add support to Codec DMA ports
      ASoC: q6afe: dt-bindings: add q6afe clock bindings
      ASoC: q6afe-clocks: add q6afe clock controller
      ASoC: qdsp6: add ifdef CONFIG_OF around of_device_id
      ASoC: q6asm: fix kernel doc warnings
      ASoC: q6afe-clocks: Fix typo in SPDX Licence
      regmap: add support to regmap_field_bulk_alloc/free apis
      ASoC: lpass-platform: use devm_regmap_field_bulk_alloc

Stephan Gerhold (5):
      ASoC: core: Add common helper to parse aux devs from device tree
      ASoC: simple-card: Use snd_soc_of_parse_aux_devs()
      ASoC: meson: Use snd_soc_of_parse_aux_devs()
      ASoC: dt-bindings: qcom: Document "aux-devs" property
      ASoC: qcom: common: Parse auxiliary devices from device tree

Stephen Boyd (3):
      ASoC: rt5682: Use dev_dbg() in rt5682_clk_check()
      ASoC: rt5682: Drop usage of __clk_get_name()
      ASoC: rt5682: Use clk_hw based APIs for registration

Takashi Iwai (3):
      ASoC: fsl: Replace tasklet with work
      ASoC: sh: Replace tasklet with work
      ASoC: txx9: Replace tasklet with work

Tang Bin (1):
      ASoC: fsl_spdif: Fix unnecessary check in fsl_spdif_probe()

Tuo Li (1):
      ALSA: rockchip_i2s: fix a possible divide-by-zero bug in rockchip_i2s_hw_params()

Tzung-Bi Shih (7):
      ASoC: mt6359: fix failed to parse DT properties
      ASoC: rt1015p: add codec driver
      ASoC: dt-bindings: rt1015p: add document
      ASoC: dt-bindings: mt8183-da7219: add compatible string for using rt1015p
      ASoC: mediatek: mt8183-da7219: support machine driver with rt1015p
      ASoC: mediatek: mt8183-da7219: support jack detection for LINEOUT
      ASoC: mediatek: mt8183-da7219: fix wrong ops for I2S3

V Sujith Kumar Reddy (8):
      ASoC: qcom: lpass-cpu: Enable MI2S BCLK and LRCLK together
      ASoC: Add sc7180-lpass binding header hdmi define
      ASoC: dt-bindings: Add dt binding for lpass hdmi
      Asoc:qcom:lpass-cpu:Update dts property read API
      Asoc: qcom: lpass:Update lpaif_dmactl members order
      ASoC: qcom: Add support for lpass hdmi driver
      Asoc: qcom: lpass-platform : Increase buffer size
      ASoC: qcom: sc7180: Add support for audio over DP

Viorel Suman (1):
      ASoC: fsl_audmix: make clock and output src write only

Xu Wang (1):
      ASoC: fsl: imx-audmix: Use devm_kcalloc() instead of devm_kzalloc()

Yong Zhi (1):
      ASoC: SOF: Intel: hda: Remove unused parameters in cl_dsp_init()

Youling Tang (1):
      sound/soc/intel: Fix spelling mistake "cant" --> "can't"

Yu Kuai (1):
      ASoC: fsl: imx-es8328: add missing put_device() call in imx_es8328_probe()

Zhang Qilong (1):
      ASoC: ti: omap-mcbsp: use devm_platform_ioremap_resource_byname

derek.fang (2):
      ASoC: rt1015: Fix DC calibration on bypass boost mode
      ASoC: rt1015: Fix the failure to flush DAC data before playback

 .../ABI/testing/sysfs-bus-pci-devices-catpt        |   16 +
 Documentation/devicetree/bindings/sound/ak4458.txt |    5 +
 Documentation/devicetree/bindings/sound/ak5558.txt |    2 +
 .../bindings/sound/allwinner,sun8i-a33-codec.yaml  |    6 +-
 .../devicetree/bindings/sound/cirrus,cs4234.yaml   |   74 +
 .../devicetree/bindings/sound/fsl,spdif.txt        |   68 -
 .../devicetree/bindings/sound/fsl,spdif.yaml       |  110 +
 .../devicetree/bindings/sound/fsl-asoc-card.txt    |    2 +
 Documentation/devicetree/bindings/sound/hdmi.txt   |   16 -
 .../bindings/sound/intel,keembay-i2s.yaml          |    1 +
 .../devicetree/bindings/sound/max98090.txt         |    2 +-
 .../devicetree/bindings/sound/mchp,spdifrx.yaml    |   73 +
 .../devicetree/bindings/sound/mchp,spdiftx.yaml    |   75 +
 .../devicetree/bindings/sound/mt6359.yaml          |   61 +
 .../bindings/sound/mt8183-da7219-max98357.txt      |    1 +
 .../devicetree/bindings/sound/qcom,apq8016-sbc.txt |    7 +
 .../devicetree/bindings/sound/qcom,apq8096.txt     |    8 +
 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |   79 -
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  219 ++
 .../devicetree/bindings/sound/qcom,q6afe.txt       |   23 +
 .../devicetree/bindings/sound/qcom,sdm845.txt      |    8 +
 .../devicetree/bindings/sound/realtek,rt1015p.yaml |   36 +
 .../devicetree/bindings/sound/rockchip-spdif.yaml  |    1 +
 Documentation/devicetree/bindings/sound/rt5640.txt |    2 +-
 Documentation/devicetree/bindings/sound/rt5659.txt |    2 +-
 Documentation/devicetree/bindings/sound/rt5665.txt |    2 +-
 Documentation/devicetree/bindings/sound/rt5668.txt |    2 +-
 Documentation/devicetree/bindings/sound/rt5677.txt |    2 +-
 Documentation/devicetree/bindings/sound/rt5682.txt |    2 +-
 .../bindings/sound/samsung,aries-wm8994.yaml       |   11 +-
 .../bindings/sound/samsung,midas-audio.yaml        |    6 +-
 .../devicetree/bindings/sound/samsung,odroid.yaml  |    5 +
 .../devicetree/bindings/sound/samsung-i2s.yaml     |   15 +
 .../devicetree/bindings/sound/sgtl5000.yaml        |    4 +
 .../devicetree/bindings/sound/tas2562.txt          |   37 -
 .../devicetree/bindings/sound/tas2562.yaml         |    8 +
 .../devicetree/bindings/sound/tas2764.yaml         |   76 +
 .../devicetree/bindings/sound/tas2770.yaml         |   11 +-
 .../bindings/sound/ti,j721e-cpb-audio.yaml         |   92 +-
 .../devicetree/bindings/sound/tlv320adcx140.yaml   |   50 +
 MAINTAINERS                                        |    1 +
 arch/arm/mach-s3c24xx/mach-gta02.c                 |   17 +
 arch/arm/mach-s3c24xx/mach-h1940.c                 |   18 +
 arch/arm/mach-s3c24xx/mach-rx1950.c                |   16 +
 drivers/base/regmap/regmap.c                       |  100 +
 drivers/iio/adc/stm32-dfsdm-adc.c                  |    4 +
 drivers/iio/adc/stm32-dfsdm.h                      |    2 +
 drivers/spi/spi-atmel.c                            |    1 -
 include/dt-bindings/sound/qcom,q6afe.h             |   96 +-
 include/dt-bindings/sound/sc7180-lpass.h           |   11 +
 include/linux/pxa2xx_ssp.h                         |    4 +
 include/linux/regmap.h                             |   11 +
 include/sound/hda_register.h                       |    2 +-
 include/sound/hdaudio_ext.h                        |    2 +-
 include/sound/hdmi-codec.h                         |    3 -
 include/sound/soc-acpi-intel-match.h               |    1 -
 include/sound/soc-acpi.h                           |    4 +-
 include/sound/soc-component.h                      |   28 +-
 include/sound/soc-dai.h                            |    8 +-
 include/sound/soc-link.h                           |    3 +-
 include/sound/soc.h                                |    4 +
 include/sound/sof.h                                |    2 +
 include/sound/sof/ext_manifest.h                   |    7 +
 include/sound/sof/info.h                           |    6 +-
 include/sound/sof/topology.h                       |   12 +-
 include/trace/events/hswadsp.h                     |  385 ---
 include/uapi/sound/sof/abi.h                       |    2 +-
 include/uapi/sound/sof/tokens.h                    |    5 +
 sound/hda/ext/hdac_ext_bus.c                       |    5 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               |   11 +-
 sound/soc/atmel/Kconfig                            |   25 +
 sound/soc/atmel/Makefile                           |    4 +
 sound/soc/atmel/atmel-pcm-dma.c                    |    1 -
 sound/soc/atmel/mchp-spdifrx.c                     |  953 +++++++
 sound/soc/atmel/mchp-spdiftx.c                     |  871 +++++++
 sound/soc/codecs/Kconfig                           |   27 +
 sound/soc/codecs/Makefile                          |    8 +
 sound/soc/codecs/ak4458.c                          |  120 +-
 sound/soc/codecs/ak4458.h                          |    5 +-
 sound/soc/codecs/ak5558.c                          |   30 +
 sound/soc/codecs/cs4234.c                          |  918 +++++++
 sound/soc/codecs/cs4234.h                          |  287 ++
 sound/soc/codecs/cs42l51.c                         |    9 +
 sound/soc/codecs/cs47l15.c                         |    2 +-
 sound/soc/codecs/cs47l35.c                         |    2 +-
 sound/soc/codecs/da7219-aad.c                      |   85 +-
 sound/soc/codecs/da7219-aad.h                      |    3 +
 sound/soc/codecs/da7219.c                          |  494 ++--
 sound/soc/codecs/da7219.h                          |    1 +
 sound/soc/codecs/hdac_hdmi.c                       |  140 +-
 sound/soc/codecs/hdmi-codec.c                      |   12 +-
 sound/soc/codecs/max98373-sdw.c                    |    3 +
 sound/soc/codecs/max9867.c                         |  131 +-
 sound/soc/codecs/max9867.h                         |    4 +-
 sound/soc/codecs/mt6359.c                          | 2758 ++++++++++++++++++++
 sound/soc/codecs/mt6359.h                          | 2640 +++++++++++++++++++
 sound/soc/codecs/nau8825.c                         |    2 +-
 sound/soc/codecs/rt1015.c                          |  111 +-
 sound/soc/codecs/rt1015.h                          |    8 +
 sound/soc/codecs/rt1015p.c                         |  148 ++
 sound/soc/codecs/rt1308-sdw.c                      |    2 +-
 sound/soc/codecs/rt5682-i2c.c                      |    1 +
 sound/soc/codecs/rt5682-sdw.c                      |    2 +-
 sound/soc/codecs/rt5682.c                          |   97 +-
 sound/soc/codecs/rt5682.h                          |    2 -
 sound/soc/codecs/rt700-sdw.c                       |    5 +-
 sound/soc/codecs/rt711-sdw.c                       |    6 +-
 sound/soc/codecs/rt715-sdw.c                       |    3 +-
 sound/soc/codecs/rt715.c                           |    2 +-
 sound/soc/codecs/rt715.h                           |    2 +
 sound/soc/codecs/tas2562.c                         |   63 +-
 sound/soc/codecs/tas2764.c                         |  688 +++++
 sound/soc/codecs/tas2764.h                         |   92 +
 sound/soc/codecs/tas2770.c                         |  399 ++-
 sound/soc/codecs/tas2770.h                         |   47 +-
 sound/soc/codecs/tas5086.c                         |    2 +-
 sound/soc/codecs/tlv320adcx140.c                   |  177 +-
 sound/soc/codecs/tlv320adcx140.h                   |    8 +
 sound/soc/codecs/tlv320aic32x4-clk.c               |    9 +-
 sound/soc/codecs/tlv320aic32x4.c                   |   83 +-
 sound/soc/codecs/tlv320aic32x4.h                   |    7 +
 sound/soc/codecs/wm0010.c                          |    3 +-
 sound/soc/codecs/wm8523.h                          |    2 +-
 sound/soc/codecs/wm8962.c                          |    2 +
 sound/soc/codecs/wm9713.c                          |    2 +-
 sound/soc/codecs/wm_adsp.c                         |   28 +-
 sound/soc/fsl/Kconfig                              |    2 +-
 sound/soc/fsl/fsl-asoc-card.c                      |   15 +
 sound/soc/fsl/fsl_audmix.c                         |   16 +-
 sound/soc/fsl/fsl_dma.c                            |    2 +-
 sound/soc/fsl/fsl_esai.c                           |   14 +-
 sound/soc/fsl/fsl_sai.c                            |  309 ++-
 sound/soc/fsl/fsl_sai.h                            |   92 +-
 sound/soc/fsl/fsl_spdif.c                          |    4 -
 sound/soc/fsl/imx-audmix.c                         |    8 +-
 sound/soc/fsl/imx-es8328.c                         |   12 +-
 sound/soc/fsl/imx-mc13783.c                        |   10 +-
 sound/soc/fsl/mx27vis-aic32x4.c                    |   10 +-
 sound/soc/generic/simple-card.c                    |   33 +-
 sound/soc/intel/Kconfig                            |   50 +-
 sound/soc/intel/Makefile                           |    3 +-
 sound/soc/intel/atom/sst-atom-controls.c           |    4 +-
 sound/soc/intel/atom/sst-mfld-platform-compress.c  |    3 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |    4 +-
 sound/soc/intel/atom/sst-mfld-platform.h           |    4 +-
 sound/soc/intel/atom/sst/sst.c                     |    6 +-
 sound/soc/intel/atom/sst/sst.h                     |   41 +-
 sound/soc/intel/atom/sst/sst_acpi.c                |    1 -
 sound/soc/intel/atom/sst/sst_drv_interface.c       |    3 -
 sound/soc/intel/atom/sst/sst_ipc.c                 |    1 -
 sound/soc/intel/atom/sst/sst_loader.c              |    4 +-
 sound/soc/intel/atom/sst/sst_pvt.c                 |    5 +-
 sound/soc/intel/atom/sst/sst_stream.c              |    1 -
 sound/soc/intel/baytrail/Makefile                  |    5 -
 sound/soc/intel/baytrail/sst-baytrail-dsp.c        |  358 ---
 sound/soc/intel/baytrail/sst-baytrail-ipc.c        |  772 ------
 sound/soc/intel/baytrail/sst-baytrail-ipc.h        |   65 -
 sound/soc/intel/baytrail/sst-baytrail-pcm.c        |  459 ----
 sound/soc/intel/boards/Kconfig                     |   36 +-
 sound/soc/intel/boards/Makefile                    |   11 +-
 sound/soc/intel/boards/bdw-rt5650.c                |   47 +-
 sound/soc/intel/boards/bdw-rt5677.c                |   42 +-
 sound/soc/intel/boards/broadwell.c                 |   45 +-
 sound/soc/intel/boards/byt-max98090.c              |  182 --
 sound/soc/intel/boards/byt-rt5640.c                |  224 --
 sound/soc/intel/boards/bytcht_cx2072x.c            |    2 +-
 sound/soc/intel/boards/bytcht_es8316.c             |    1 -
 sound/soc/intel/boards/bytcr_rt5640.c              |    1 -
 sound/soc/intel/boards/haswell.c                   |   32 +-
 sound/soc/intel/boards/hda_dsp_common.c            |    7 +-
 sound/soc/intel/boards/hda_dsp_common.h            |    3 -
 sound/soc/intel/boards/sof_rt5682.c                |   13 +
 sound/soc/intel/boards/sof_sdw.c                   |  348 ++-
 sound/soc/intel/boards/sof_sdw_common.h            |   26 +-
 sound/soc/intel/boards/sof_sdw_dmic.c              |    1 +
 sound/soc/intel/boards/sof_sdw_max98373.c          |   38 +-
 sound/soc/intel/boards/sof_sdw_rt1308.c            |    6 +
 sound/soc/intel/boards/sof_sdw_rt1316.c            |  119 +
 sound/soc/intel/boards/sof_sdw_rt5682.c            |    2 +
 sound/soc/intel/boards/sof_sdw_rt700.c             |    8 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |    2 +
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c        |  174 ++
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c        |   42 +
 sound/soc/intel/catpt/Makefile                     |    6 +
 sound/soc/intel/catpt/core.h                       |  188 ++
 sound/soc/intel/catpt/device.c                     |  355 +++
 sound/soc/intel/catpt/dsp.c                        |  578 ++++
 sound/soc/intel/catpt/ipc.c                        |  298 +++
 sound/soc/intel/catpt/loader.c                     |  671 +++++
 sound/soc/intel/catpt/messages.c                   |  313 +++
 sound/soc/intel/catpt/messages.h                   |  401 +++
 sound/soc/intel/catpt/pcm.c                        | 1175 +++++++++
 sound/soc/intel/catpt/registers.h                  |  178 ++
 sound/soc/intel/catpt/sysfs.c                      |   55 +
 sound/soc/intel/catpt/trace.h                      |   83 +
 sound/soc/intel/common/Makefile                    |    4 -
 sound/soc/intel/common/soc-acpi-intel-byt-match.c  |   15 -
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |   89 +-
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |   34 +-
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |   16 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |  232 +-
 sound/soc/intel/common/sst-acpi.c                  |  236 --
 sound/soc/intel/common/sst-dsp-priv.h              |  284 +-
 sound/soc/intel/common/sst-dsp.c                   |  162 --
 sound/soc/intel/common/sst-dsp.h                   |  237 +-
 sound/soc/intel/common/sst-firmware.c              | 1273 ---------
 sound/soc/intel/common/sst-ipc.c                   |   27 -
 sound/soc/intel/common/sst-ipc.h                   |    3 -
 sound/soc/intel/haswell/Makefile                   |    5 -
 sound/soc/intel/haswell/sst-haswell-dsp.c          |  705 -----
 sound/soc/intel/haswell/sst-haswell-ipc.c          | 2222 ----------------
 sound/soc/intel/haswell/sst-haswell-ipc.h          |  527 ----
 sound/soc/intel/haswell/sst-haswell-pcm.c          | 1369 ----------
 sound/soc/intel/keembay/kmb_platform.c             |  145 +-
 sound/soc/intel/skylake/bxt-sst.c                  |    2 -
 sound/soc/intel/skylake/cnl-sst-dsp.h              |    4 +-
 sound/soc/intel/skylake/cnl-sst.c                  |    4 +-
 sound/soc/intel/skylake/skl-nhlt.c                 |    2 +-
 sound/soc/intel/skylake/skl-sst-cldma.c            |    2 +-
 sound/soc/intel/skylake/skl-sst-dsp.c              |    2 +-
 sound/soc/intel/skylake/skl-sst-ipc.c              |    2 +-
 sound/soc/intel/skylake/skl-sst-ipc.h              |   16 +-
 sound/soc/intel/skylake/skl-sst-utils.c            |    2 +-
 sound/soc/intel/skylake/skl-sst.c                  |    4 +-
 sound/soc/intel/skylake/skl-topology.c             |    8 +-
 sound/soc/intel/skylake/skl-topology.h             |    8 +-
 sound/soc/intel/skylake/skl.c                      |   10 +-
 sound/soc/intel/skylake/skl.h                      |    2 +-
 sound/soc/mediatek/Kconfig                         |    1 +
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |    5 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |   50 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    5 +-
 sound/soc/meson/axg-tdm-formatter.c                |    2 +-
 sound/soc/meson/meson-card-utils.c                 |   33 +-
 sound/soc/qcom/Kconfig                             |   24 +-
 sound/soc/qcom/Makefile                            |    4 +
 sound/soc/qcom/common.c                            |    4 +
 sound/soc/qcom/lpass-apq8016.c                     |   92 +-
 sound/soc/qcom/lpass-cpu.c                         |  463 +++-
 sound/soc/qcom/lpass-hdmi.c                        |  258 ++
 sound/soc/qcom/lpass-hdmi.h                        |  102 +
 sound/soc/qcom/lpass-ipq806x.c                     |   71 +-
 sound/soc/qcom/lpass-lpaif-reg.h                   |  208 +-
 sound/soc/qcom/lpass-platform.c                    |  493 +++-
 sound/soc/qcom/lpass-sc7180.c                      |  305 +++
 sound/soc/qcom/lpass.h                             |  181 +-
 sound/soc/qcom/qdsp6/Makefile                      |    1 +
 sound/soc/qcom/qdsp6/q6adm.c                       |    2 +
 sound/soc/qcom/qdsp6/q6afe-clocks.c                |  272 ++
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |  231 ++
 sound/soc/qcom/qdsp6/q6afe.c                       |  310 ++-
 sound/soc/qcom/qdsp6/q6afe.h                       |   33 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  416 ++-
 sound/soc/qcom/qdsp6/q6asm.c                       |  175 +-
 sound/soc/qcom/qdsp6/q6asm.h                       |   49 +-
 sound/soc/qcom/qdsp6/q6core.c                      |    2 +
 sound/soc/qcom/qdsp6/q6routing.c                   |  123 +-
 sound/soc/rockchip/rockchip_i2s.c                  |    2 +-
 sound/soc/rockchip/rockchip_max98090.c             |    3 +-
 sound/soc/samsung/h1940_uda1380.c                  |   71 +-
 sound/soc/samsung/neo1973_wm8753.c                 |   85 +-
 sound/soc/samsung/rx1950_uda1380.c                 |   72 +-
 sound/soc/samsung/s3c-i2s-v2.c                     |    3 +-
 sound/soc/samsung/s3c-i2s-v2.h                     |    3 +-
 sound/soc/samsung/s3c2412-i2s.c                    |    2 +-
 sound/soc/sh/siu.h                                 |    2 +-
 sound/soc/sh/siu_pcm.c                             |   21 +-
 sound/soc/soc-component.c                          |   73 +-
 sound/soc/soc-compress.c                           |   30 +-
 sound/soc/soc-core.c                               |   76 +-
 sound/soc/soc-dai.c                                |   21 +-
 sound/soc/soc-dapm.c                               |    4 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |    5 +
 sound/soc/soc-link.c                               |   21 +-
 sound/soc/soc-pcm.c                                |  123 +-
 sound/soc/soc-topology.c                           |   18 +-
 sound/soc/sof/Kconfig                              |    2 +-
 sound/soc/sof/control.c                            |  149 +-
 sound/soc/sof/debug.c                              |    2 +-
 sound/soc/sof/imx/Kconfig                          |   10 +
 sound/soc/sof/imx/Makefile                         |    3 +
 sound/soc/sof/imx/imx-common.c                     |   75 +
 sound/soc/sof/imx/imx-common.h                     |   16 +
 sound/soc/sof/imx/imx8.c                           |   40 +-
 sound/soc/sof/imx/imx8m.c                          |   27 +-
 sound/soc/sof/intel/Kconfig                        |   31 +-
 sound/soc/sof/intel/Makefile                       |    2 +-
 sound/soc/sof/intel/apl.c                          |    2 +-
 sound/soc/sof/intel/bdw.c                          |    2 +-
 sound/soc/sof/intel/byt.c                          |    6 +-
 sound/soc/sof/intel/cnl.c                          |   40 +-
 sound/soc/sof/intel/hda-codec.c                    |   28 +-
 sound/soc/sof/intel/hda-dsp.c                      |   20 +-
 sound/soc/sof/intel/hda-ipc.h                      |    4 +
 sound/soc/sof/intel/hda-loader.c                   |  196 +-
 sound/soc/sof/intel/hda-stream.c                   |   69 +
 sound/soc/sof/intel/hda.c                          |   47 +-
 sound/soc/sof/intel/hda.h                          |   12 +-
 sound/soc/sof/intel/shim.h                         |    2 +-
 sound/soc/sof/intel/tgl.c                          |  153 ++
 sound/soc/sof/ipc.c                                |   16 +-
 sound/soc/sof/loader.c                             |   34 +-
 sound/soc/sof/pcm.c                                |    8 +-
 sound/soc/sof/pm.c                                 |   13 +-
 sound/soc/sof/sof-acpi-dev.c                       |    2 +
 sound/soc/sof/sof-audio.c                          |   56 +-
 sound/soc/sof/sof-audio.h                          |   10 +
 sound/soc/sof/sof-of-dev.c                         |    6 +
 sound/soc/sof/sof-pci-dev.c                        |   59 +-
 sound/soc/sof/sof-priv.h                           |   22 +-
 sound/soc/sof/topology.c                           |  421 +--
 sound/soc/sprd/sprd-pcm-compress.c                 |    2 +-
 sound/soc/stm/stm32_adfsdm.c                       |    8 +-
 sound/soc/stm/stm32_sai_sub.c                      |   10 +-
 sound/soc/sunxi/sun4i-codec.c                      |    2 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |  176 +-
 sound/soc/sunxi/sun8i-codec.c                      |  473 ++--
 sound/soc/tegra/tegra_max98090.c                   |   12 +-
 sound/soc/tegra/tegra_rt5640.c                     |   12 +-
 sound/soc/tegra/tegra_wm8753.c                     |   12 +-
 sound/soc/tegra/trimslice.c                        |   12 +-
 sound/soc/ti/Kconfig                               |    2 +-
 sound/soc/ti/davinci-mcasp.c                       |    4 +-
 sound/soc/ti/j721e-evm.c                           |   13 +-
 sound/soc/txx9/txx9aclc.c                          |   11 +-
 sound/soc/txx9/txx9aclc.h                          |    2 +-
 sound/soc/xilinx/Kconfig                           |    4 +-
 327 files changed, 23460 insertions(+), 12639 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-catpt
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs4234.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,spdif.txt
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,spdif.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tas2764.yaml
 create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
 delete mode 100644 include/trace/events/hswadsp.h
 create mode 100644 sound/soc/atmel/mchp-spdifrx.c
 create mode 100644 sound/soc/atmel/mchp-spdiftx.c
 create mode 100644 sound/soc/codecs/cs4234.c
 create mode 100644 sound/soc/codecs/cs4234.h
 create mode 100644 sound/soc/codecs/mt6359.c
 create mode 100644 sound/soc/codecs/mt6359.h
 create mode 100644 sound/soc/codecs/rt1015p.c
 create mode 100644 sound/soc/codecs/tas2764.c
 create mode 100644 sound/soc/codecs/tas2764.h
 delete mode 100644 sound/soc/intel/baytrail/Makefile
 delete mode 100644 sound/soc/intel/baytrail/sst-baytrail-dsp.c
 delete mode 100644 sound/soc/intel/baytrail/sst-baytrail-ipc.c
 delete mode 100644 sound/soc/intel/baytrail/sst-baytrail-ipc.h
 delete mode 100644 sound/soc/intel/baytrail/sst-baytrail-pcm.c
 delete mode 100644 sound/soc/intel/boards/byt-max98090.c
 delete mode 100644 sound/soc/intel/boards/byt-rt5640.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt1316.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt711_sdca.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt715_sdca.c
 create mode 100644 sound/soc/intel/catpt/Makefile
 create mode 100644 sound/soc/intel/catpt/core.h
 create mode 100644 sound/soc/intel/catpt/device.c
 create mode 100644 sound/soc/intel/catpt/dsp.c
 create mode 100644 sound/soc/intel/catpt/ipc.c
 create mode 100644 sound/soc/intel/catpt/loader.c
 create mode 100644 sound/soc/intel/catpt/messages.c
 create mode 100644 sound/soc/intel/catpt/messages.h
 create mode 100644 sound/soc/intel/catpt/pcm.c
 create mode 100644 sound/soc/intel/catpt/registers.h
 create mode 100644 sound/soc/intel/catpt/sysfs.c
 create mode 100644 sound/soc/intel/catpt/trace.h
 delete mode 100644 sound/soc/intel/common/sst-acpi.c
 delete mode 100644 sound/soc/intel/common/sst-firmware.c
 delete mode 100644 sound/soc/intel/haswell/Makefile
 delete mode 100644 sound/soc/intel/haswell/sst-haswell-dsp.c
 delete mode 100644 sound/soc/intel/haswell/sst-haswell-ipc.c
 delete mode 100644 sound/soc/intel/haswell/sst-haswell-ipc.h
 delete mode 100644 sound/soc/intel/haswell/sst-haswell-pcm.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h
 create mode 100644 sound/soc/qcom/lpass-sc7180.c
 create mode 100644 sound/soc/qcom/qdsp6/q6afe-clocks.c
 create mode 100644 sound/soc/sof/imx/imx-common.c
 create mode 100644 sound/soc/sof/imx/imx-common.h
 create mode 100644 sound/soc/sof/intel/tgl.c

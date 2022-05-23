Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84092530EC9
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 15:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0030016E1;
	Mon, 23 May 2022 15:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0030016E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653311586;
	bh=CkvsEqEWDJBRjF4LbeGFblfaZFpSdfO9qG0wwld6pr8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o4ghhO5vEy7k8P5T85YDg7h8KKVCnHTrAH0jbyea0HE7dq1oAMd/1syCfvSb+4eeh
	 N6oeeY1xHZXXHKGaQz5RVeRsY9zqzrooOmhNYMpaDLK60KCP8GMFoVwMh+9lJO9HdE
	 yQxrtqySP7W4zAUt/WYEivoKbpppIKaPcltKJgBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E42F800E3;
	Mon, 23 May 2022 15:12:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D88CCF80236; Mon, 23 May 2022 15:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3A9DF800E3
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 15:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3A9DF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rUq1FMhn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D9067CE1268;
 Mon, 23 May 2022 13:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4893AC385A9;
 Mon, 23 May 2022 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653311511;
 bh=CkvsEqEWDJBRjF4LbeGFblfaZFpSdfO9qG0wwld6pr8=;
 h=From:To:Cc:Subject:Date:From;
 b=rUq1FMhnocV+9fvFElzQf8N/Yc7/0wa3+xycBg3q68LwLwbmDJ96PF5lQk8hvTCHY
 cJgu9iX+S+opWZ7cSeXlKtx/QUBwm8u+qSZ2K/lD0i5bCBp1/e5EwDp6k6BoG1+iUa
 JSajppFrY/sfpUKNXd3Rb4TkjW0w2BLv1NtpQ9udJV0xwqXF9DW7ff0M6TR3vn6nsA
 ob1EwGZss69HMwOSaFVcSQ2YgS6diXLsHRUj1oFcvygx02HgEyKRJOJB3THiEE4Qww
 sGpOu9Jm9v0PHU2Bg9Zog4xiR71O7QYLZiFj4sQe6Uyob21Y3LmCkH0+HXTR05JeBU
 abmNOUDDvV/RQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.19
Date: Mon, 23 May 2022 14:11:38 +0100
Message-Id: <20220523131150.4893AC385A9@smtp.kernel.org>
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

The following changes since commit c61711c1c95791850be48dd65a1d72eb34ba719f:

  ASoC: SOF: Fix NULL pointer exception in sof_pci_probe callback (2022-04-27 14:15:21 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.19

for you to fetch changes up to e5cd20e0d6713138444cc3f3f982712cf9a36143:

  ASoC: SOF: Introduce generic (in)firmware tracing infrastructure (2022-05-20 14:56:35 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.19

This is quite a big update, partly due to the addition of some larger
drivers (more of which is to follow since at least the AVS driver is
still a work in progress) and partly due to Charles' work sorting out
our handling of endianness.  As has been the case recently it's much
more about drivers than the core.

 - Overhaul of endianness specification for data formats, avoiding
   needless restrictions due to CODECs.
 - Initial stages of Intel AVS driver merge.
 - Introduction of v4 IPC mechanism for SOF.
 - TDM mode support for AK4613.
 - Support for Analog Devices ADAU1361, Cirrus Logic CS35L45, Maxim
   MAX98396, MediaTek MT8186, NXP i.MX8 micfil and SAI interfaces,
   nVidia Tegra186 ASRC, and Texas Instruments TAS2764 and TAS2780

----------------------------------------------------------------
Ajit Kumar Pandey (3):
      ASoC: amd: acp: Add pm ops callback in machine driver
      ASoC: SOF: amd: Add psp_mbox_ready() and psp_send_cmd() callback
      ASoC: SOF: amd: Use dedicated MBOX for ACP and PSP communication

Akihiko Odaki (1):
      ASoC: soc-card: Create jack kcontrol without pins

Alexey Khoroshilov (1):
      ASoC: max98090: Move check for invalid values before casting in max98090_put_enab_tlv()

Allen-KH Cheng (1):
      ASoC: SOF: mediatek: Add ipc support for mt8195

Amadeusz Sławiński (10):
      ASoC: topology: Use for loop instead of while
      ASoC: topology: Remove unnecessary looping
      ASoC: topology: Return bool instead of int
      ASoC: topology: Rename SOC_TPLG_PASS_MIXER to _CONTROL
      ASoC: topology: Correct error message
      ASoC: topology: Rename soc_tplg_init_kcontrol() function
      ASoC: Intel: avs: Enable AVS driver only on x86 platforms
      ASoC: Intel: avs: Depend on SND_INTEL_DSP_CONFIG
      ALSA: hda: intel-nhlt: Move structs out of #define block
      ASoC: Intel: avs: Drop direct ACPI dependency

Andy Shevchenko (1):
      ASoC: cs43130: Re-use generic struct u16_fract

Biju Das (1):
      ASoC: sh: Make SND_SOC_RZ depend on ARCH_RZG2L

Brent Lu (2):
      ASoC: Intel: sof_ssp_amp: fix no DMIC BE Link on Chromebooks
      ASoC: Intel: sof_ssp_amp: enable capture stream from cs35l41

Cezary Rojewski (29):
      ASoC: Intel: catpt: Drop redundant enum constant
      ASoC: Intel: avs: Declare vendor tokens
      ASoC: Intel: avs: Add topology parsing infrastructure
      ASoC: Intel: avs: Parse module-extension tuples
      ASoC: Intel: avs: Parse pplcfg and binding tuples
      ASoC: Intel: avs: Parse pipeline and module tuples
      ASoC: Intel: avs: Parse path and path templates tuples
      ASoC: Intel: avs: Add topology loading operations
      ASoC: Intel: avs: Support link_mask formatted string
      ASoC: Intel: avs: Declare path and its components
      ASoC: Intel: avs: Path creation and freeing
      ASoC: Intel: avs: Path state management
      ASoC: Intel: avs: Arm paths after creating them
      ASoC: Intel: avs: Prepare modules before bindings them
      ASoC: Intel: avs: Configure modules according to their type
      ASoC: Intel: avs: Account for libraries when booting basefw
      ASoC: Intel: avs: Generic soc component driver
      ASoC: Intel: avs: Generic PCM FE operations
      ASoC: Intel: avs: non-HDA PCM BE operations
      ASoC: Intel: avs: HDA PCM BE operations
      ASoC: Intel: avs: Coredump and recovery flow
      ASoC: Intel: avs: Prepare for firmware tracing
      ASoC: Intel: avs: D0ix power state support
      ASoC: Intel: avs: Event tracing
      ASoC: Intel: avs: Machine board registration
      ASoC: Intel: avs: PCI driver implementation
      ASoC: Intel: avs: Power management
      ASoC: Intel: avs: SKL-based platforms support
      ASoC: Intel: avs: APL-based platforms support

Charles Keepax (43):
      ASoC: soc-component: Add comment for the endianness flag
      ASoC: atmel-pdmic: Remove endianness flag on pdmic component
      ASoC: atmel-classd: Remove endianness flag on class d component
      ASoC: cs4270: Remove redundant big endian formats
      ASoC: cs42l51: Remove redundant big endian formats
      ASoC: cs4349: Remove redundant big endian formats
      ASoC: hdmi-codec: Remove redundant big endian formats
      ASoC: sta32x: Remove redundant big endian formats
      ASoC: sta350: Remove redundant big endian formats
      ASoC: hdac_hda: Add endianness flag in snd_soc_component_driver
      ASoC: max98504: Add endianness flag in snd_soc_component_driver
      ASoC: adau1372: Add endianness flag in snd_soc_component_driver
      ASoC: cs4234: Add endianness flag in snd_soc_component_driver
      ASoC: cs35l41: Add endianness flag in snd_soc_component_driver
      ASoC: cx2072x: Add endianness flag in snd_soc_component_driver
      ASoC: lochnagar: Add endianness flag in snd_soc_component_driver
      ASoC: mt6351: Add endianness flag in snd_soc_component_driver
      ASoC: mt6358: Add endianness flag in snd_soc_component_driver
      ASoC: mt6359: Add endianness flag in snd_soc_component_driver
      ASoC: mt6660: Add endianness flag in snd_soc_component_driver
      ASoC: pcm3060: Add endianness flag in snd_soc_component_driver
      ASoC: rt1019: Add endianness flag in snd_soc_component_driver
      ASoC: rt9120: Add endianness flag in snd_soc_component_driver
      ASoC: tlv320adc3xxx: Add endianness flag in snd_soc_component_driver
      ASoC: tscs454: Add endianness flag in snd_soc_component_driver
      ASoC: cros_ec_codec: Add endianness flag in i2s_rx_component_driver
      ASoC: wcd934x: Add endianness flag in snd_soc_component_driver
      ASoC: wcd9335: Add endianness flag in snd_soc_component_driver
      ASoC: rt700: Add endianness flag in snd_soc_component_driver
      ASoC: rt711: Add endianness flag in snd_soc_component_driver
      ASoC: rt711-sdca: Add endianness flag in snd_soc_component_driver
      ASoC: rt715: Add endianness flag in snd_soc_component_driver
      ASoC: rt715-sdca: Add endianness flag in snd_soc_component_driver
      ASoC: rt1308-sdw: Add endianness flag in snd_soc_component_driver
      ASoC: rt1316-sdw: Add endianness flag in snd_soc_component_driver
      ASoC: wcd938x: Add endianness flag in snd_soc_component_driver
      ASoC: wsa881x: Add endianness flag in snd_soc_component_driver
      ASoC: sdw-mockup: Add endianness flag in snd_soc_component_driver
      ASoC: wm2000: Remove redundant endianness flag
      ASoC: wm9090: Remove redundant endianness flag
      ASoC: core: Correct spelling fliped -> flipped
      ASoC: core: Pass legacy_dai_naming flag directly
      ASoC: soc-component: Update handling to component delays

ChiYuan Huang (2):
      ASoC: rt9120: Fix 3byte read, valule offset typo
      ASoC: rt9120: Use pm_runtime and regcache to optimize 'pwdnn' logic

Christophe JAILLET (1):
      ASoC: SOF: topology: Avoid open coded arithmetic in memory allocation

Corentin Labbe (1):
      ASoC: fix invalid yaml

Derek Fang (1):
      ASoC: rt5682s: Separate the regulator consumer controls

Gongjun Song (1):
      ASoC: SOF: Intel: pci-tgl: add RPL-P support

Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Add quirk for the HP Pro Tablet 408

Haowen Bai (1):
      ASoC: imx-hdmi: remove useless null check before call of_node_put()

Hui Tang (1):
      ASoC: max98396: Fix build error for implicit function declaration

Hui Wang (2):
      ASoC: cs35l41: Add one more variable in the debug log
      ASoC: cs35l41: Fix an out-of-bounds access in otp_packed_element_t

James Schulman (1):
      ASoC: cs35l45: Add driver for Cirrus Logic CS35L45 Smart Amp

Janusz Krzysztofik (1):
      ASoC: ti: osk5912: Make it CCF clk API compatible

Jaroslav Kysela (1):
      ASoC: SOF: topology: use new sound control LED layer

Jayesh Choudhary (1):
      ASoC: ti: davinci-mcasp: Add dma-type for bcdma

Jiaxin Yu (4):
      ASoC: dt-bindings: mt8192-mt6359: add new compatible and new properties
      ASoC: mediatek: mt8192: refactor for I2S3 DAI link of speaker
      ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of headset
      ASoC: mediatek: mt8192: support rt1015p_rt5682s

Judy Hsiao (2):
      ASoC: qcom: Add driver support for ALC5682I-VS
      ASoC: qcom: Use MCLK as RT5682I-VS sysclk source

Kuninori Morimoto (10):
      ASoC: rsnd: use inclusive language for DAIFMT mask
      ASoC: ak4613: add missing mutex_lock()
      ASoC: ak4613: tidyup ak4613_interface
      ASoC: ak4613: return error if it was setup as clock provider
      ASoC: ak4613: priv has ctrl1 instead of iface
      ASoC: ak4613: rename constraint to constraint_rates
      ASoC: ak4613: add TDM256 support
      ASoC: rsnd: care default case on rsnd_ssiu_busif_err_status_clear()
      ASoC: audio-graph-card2: indicate "Experimental stage" warning only when successed
      ASoC: rsnd: care return value from rsnd_node_fixed_index()

Lad Prabhakar (3):
      ASoC: sh: rz-ssi: Drop SSIFSR_TDC and SSIFSR_RDC macros
      ASoC: sh: rz-ssi: Propagate error codes returned from platform_get_irq_byname()
      ASoC: sh: rz-ssi: Release the DMA channels in rz_ssi_probe() error path

Libin Yang (2):
      ASoC: SOF: extend the interface to stop DMA trace
      ASoC: SOF: disable dma trace in s0ix

Lin Ma (1):
      ASoC: rt5645: Fix errorenous cleanup order

Lukasz Majewski (2):
      doc: dts: Add device tree information regarding wm8940 codec
      ASoC: wm8940: add devicetree support

Lv Ruyi (1):
      ASoC: mediatek: mt8195: Make sure of_device_id table are NULL terminated

Mario Limonciello (2):
      ASoC: amd: Add driver data to acp6x machine driver
      ASoC: amd: Add support for enabling DMIC on acp6x via _DSD

Mark Brown (57):
      ASoC: wm8731: Update to modern DAI terminology
      ASoC: wm8731: Factor component init out of bus code
      ASoC: wm8731: Move regulator request into wm8731_init()
      ASoC: wm8731: Factor our MCLK and mutex initialisation
      ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules
      ASoC: wm8731: Convert DT bindings to YAML format
      ARM: configs: Update multi_v5_defconfig for WM8731 bus refactoring
      ASoC: atmel: Fix error handling in at91samg20ek probe()
      ASoC: atmel: Don't squash error codes from atmel_ssc_set_audio()
      ASoC: atmel: Fixes for AT91SAM9G20-EK audio driver
      ASoC: mediatek: Add support for MT8195 sound card with max98390 and rt5682
      ASoC: SOF: Miscellaneous fixes for IPC and trace
      ASoC: wm8731: Overhaul of the driver
      ASoC: topology: Cleanup patches
      ASoC: ASRC support on Tegra186 and later
      ASoC: Pull in fixes
      ASoC: Add a driver for the Cirrus Logic CS35L45 Smart Amplifier
      Update dt-bindings for sc7280 platform
      ASoC: ak4613: add TDM256 test support
      ASoC: Merge fixes
      ASoC: mediatek: mt8192: support rt1015p_rt5682s
      Allow detecting ACP6x DMIC via _DSD
      ASoC: SOF: Abstractions for top-level IPC ops
      ASoC: remaining simple i2c probe changes
      ASoC: fsl_micfil: Driver updates
      ASoC: Intel: avs: Topology and path management
      ASoC: SOF: add INTEL_IPC4 plumbing
      ASoC: soc-pcm: improve BE state transitions
      ASoC: SOF: AMD updates
      ASoC: SOF: pci: add quirks and PCI IDS
      Add support of MediaTek mt8186 to SOF
      ASoC: remaining i2c_match_id i2c probe changes
      ASoC: Add macros for signed TLV controls with callbacks
      ASoC: SOF: Rework the firmware ready message handling
      ASoC: SOF: Intel: improve HDaudio DAI support
      ASoC: SOF: use pm_runtime_resume_and_get()
      ASoC: sh: rz-ssi: Trivial fixes
      ASoC: SOF: IPC Abstraction for FW loading
      ASoC: SOF: Miscellaneous preparatory patches for IPC4
      ASoC: max98090: Fix event generation for custom controls
      ASoC: dapm: Don't fold register value changes into notifications
      ASoC: rt5514: Fix event generation for "DSP Voice Wake Up" control
      ASoC: Pull in fixes
      ASoC: SOF: IPC4: Introduce message handling functionality
      Add missing dt-binding properties for audio components on mt8192-asurada
      ASoC: sam9g20_wm8731: Use dev_err_probe() for snd_soc_register_card()
      ASoC: SOF: sof-client: Update for different IPC versions
      Clean up usage of the endianness flag
      ASoC: Intel: boards: Chromebook configuration updates
      ASOC: Fix the error handling code of the probe
      ASoC: SOF: Add IPC4 FW loader support
      firmware: mtk: add adsp ipc protocol for SOF
      ASoC: fsl_sai: Add support for i.MX8MM, MP, ULP
      ASoC: Intel: avs: Driver core and PCM operations
      ASoC: remove two unnecessary gpiolib dependencies
      ASoC: SOF: mediatek: add debug dump
      ASoC: SOF: Introduce generic (in)firmware tracing infrastructure

Martin Povišer (1):
      ASoC: Introduce snd_soc_of_get_dai_link_cpus

Miaoqian Lin (7):
      ASoC: mediatek: Fix error handling in mt8173_max98090_dev_probe
      ASoC: mediatek: Fix missing of_node_put in mt2701_wm8960_machine_probe
      ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
      ASoC: imx-hdmi: Fix refcount leak in imx_hdmi_probe
      ASoC: mxs-saif: Fix refcount leak in mxs_saif_probe
      ASoC: samsung: Fix refcount leak in aries_audio_probe
      ASoC: ti: j721e-evm: Fix refcount leak in j721e_soc_probe_*

Minghao Chi (11):
      ASoC: fsl: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      ASoC: codecs: wm8962: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      ASoC: SOF: using pm_runtime_resume_and_get to simplify the code
      ASoC: fsl_asrc: using pm_runtime_resume_and_get to simplify the code
      ASoC: img-spdif-in: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      ASoC: img-spdif-out: using pm_runtime_resume_and_get to simplify the code
      ASoC: img-parallel-out: using pm_runtime_resume_and_get
      ASoC: img-i2s-in: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      ASoC: uniphier: simplify the return expression of uniphier_aio_compr_set_params()
      ASoC: mediatek: simplify the return expression of mtk_dai_pcm_prepare()
      ASoC: pcm186x: simplify the return expression of pcm186x_power_off()

Muralidhar Reddy (1):
      ASoC: SOF: Intel: pci-tgl: add ADL-PS support

Nicola Lunghi (1):
      ASoC: wm8960: Add ACPI support

Nicolas Frattaroli (2):
      ASoC: rk3328: fix disabling mclk on pclk probe failure
      ASoC: rk3328: fix disabling mclk on pclk probe failure

Nícolas F. R. A. Prado (4):
      ASoC: dt-bindings: mediatek: mt8192: Add i2s-share properties
      ASoC: dt-bindings: rt1015p: Add #sound-dai-cells
      ASoC: dt-bindings: rt5682: Add #sound-dai-cells
      ASoC: dt-bindings: mediatek: mt8192: Drop i2s-share properties

Peter Ujfalusi (66):
      ASoC: SOF: Intel: hda-loader: Use local snd_dma_buffer
      ASoC: SOF: Remove dmab and dmab_bdl from snd_sof_dev struct
      ASoC: SOF: ipc: Add max_payload_size field in struct snd_sof_ipc
      ASoC: SOF: ipc: Use ipc->max_payload_size for message/reply size checking
      ASoC: SOF: Drop support for mapped control data
      ASoC: SOF: ipc: Use msg->reply_data directly in snd_sof_ipc_get_reply()
      ASoC: SOF: Drop 'header' parameter from tx_message() API
      ASoC: SOF: Remove header from struct snd_sof_ipc_msg
      ASoC: SOF: ipc3-topology: Set scontrol->priv to NULL after freeing it
      ASoC: SOF: Add helper function to prepare and send an IPC message
      ASoC: SOF: Add high level IPC IO callback definitions to ipc_ops
      ASoC: SOF: ipc3: Implement the tx_msg IPC ops
      ASoC: SOF: ipc3: Use sof_ipc3_tx_msg() internally for message sending
      ASoC: SOF: ipc3: Implement the set_get_data IPC ops
      ASoC: SOF: ipc3: Implement the get_reply IPC ops
      ASoC: SOF: ipc3: Implement rx_msg IPC ops
      ASoC: SOF: ipc: Separate the ops checks by functions/topics
      ASoC: SOF: ipc: Add check for mandatory IPC message handling ops
      ASoC: SOF: ipc: Use the get_reply ops in snd_sof_ipc_get_reply()
      ASoC: SOF: ipc: Switch over to use the tx_msg and set_get_data ops
      ASoC: SOF: ipc: Switch over to use the rx_msg ops
      ASoC: SOF: Add widget_kcontrol_setup control ops for IPC3
      ASoC: SOF: sof-audio: Use the widget_kcontrol_setup ops for kcontrol set up
      ASoC: SOF: ipc: Move the ipc_set_get_comp_data() local to ipc3-control
      ASoC: SOF: topology: Check w->sname validity once in sof_connect_dai_widget()
      ASoC: SOF: Intel: hda: Revisit IMR boot sequence
      ASoC: SOF: ipc3: Add local implementation for handling fw_ready message
      ASoC: SOF: Do not check for the fw_ready callback
      ASoC: SOF: amd: Do not set fw_ready callback
      ASoC: SOF: imx: Do not set fw_ready callback
      ASoC: SOF: Intel: Do not set fw_ready callback
      ASoC: SOF: loader: Remove the old fw_ready related code
      ASoC: SOF: Intel: Do not (wrongly) assume positive return value in IMR path
      ASoC: SOF: Introduce IPC dependent ops for firmware handling, loading
      ASoC: SOF: ipc3-loader: Implement firmware parsing and loading
      ASoC: SOF: ipc: Add check for fw_loader ops
      ASoC: SOF: loader: Switch to use the fw_loader ops
      ASoC: SOF: amd: renoir: Do not set the load_module ops
      ASoC: SOF: imx: Do not set the load_module ops
      ASoC: SOF: Intel: bdw/byt/pci-tng: Do not set the load_module ops
      ASoC: SOF: mediatek: mt8195: Do not set the load_module ops
      ASoC: SOF: loader: Remove snd_sof_parse_module_memcpy() as it is not used
      ASoC: SOF: loader: Call optional query_fw_configuration on first boot
      ASoC: SOF: ipc3-topology: Correct get_control_data for non bytes payload
      ASoC: SOF: ipc3: Remove the ipc3-ops.h header file
      ASoC: SOF: Add rx_data pointer to snd_sof_ipc_msg struct
      ASoC: SOF: Add initial header file for ipc4
      ASoC: SOF: ipc4: Add support for mandatory message handling functionality
      ASoC: SOF: sof-client: Add API to get the maximum IPC payload size
      ASoC: SOF: ipc-msg-injector: Query the maximum IPC payload size
      ASoC: SOF: sof-client-probes: Query the maximum IPC payload size
      ASoC: SOF: sof-client: Add API to get the ipc_type
      ASoC: SOF: sof-client: Add support IPC4 message sending
      ASoC: SOF: ipc-msg-injector: Separate the message sending
      ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages
      ASoC: SOF: sof-client: IPC flood test can only work with SOF_IPC
      ASoC: SOF: trace: The dtrace is only available with SOF_IPC
      ASoC: SOF: ipc-msg-injector: Cap the rmaining to count in IPC4 mode
      ASoC: SOF: Introduce IPC independent ops for firmware tracing support
      ASoC: SOF: Rename dtrace_is_supported flag to fw_trace_is_supported
      ASoC: SOF: Clone the trace code to ipc3-dtrace as fw_tracing implementation
      ASoC: SOF: Switch to IPC generic firmware tracing
      ASoC: SOF: ipc3-dtrace: Move host ops wrappers from generic header to private
      ASoC: SOF: Modify the host trace_init parameter list to include dmab
      ASoC: SOF: Introduce opaque storage of private data for firmware tracing
      ASoC: SOF: ipc3-dtrace: Move dtrace related variables local from sof_dev

Pierre-Louis Bossart (39):
      ASoC: SOF: add definitions for different IPC types
      ASoC: SOF: add path indirection to each IPC type
      ASoC: SOF: add default IPC capability and file paths
      ASoC: SOF: add IPC-dependent file names
      ASoC: SOF: sof-pci-dev: add parameter to override firmware filename
      ASoC: SOF: sof-pci-dev: add parameter to override topology filename
      ASoC: SOF: sof-audio: preserve topology filename override in nocodec mode
      ASoC: SOF: remove const qualifier for 'struct snd_sof_dsp_ops'
      ASoC: SOF: Intel: hda: use common ops across platforms
      ASoC: SOF: Intel: hda: use BIT() macros for consistency
      ASoC: SOF: Intel: add IP identifier
      ASoC: soc-pcm: improve BE transition for PAUSE_RELEASE
      ASoC: soc-pcm: improve BE transition for TRIGGER_START
      ASoC: Intel: sof_ssp_amp: remove 'set-but-not-used' warning
      ASoC: SOF: sof-pci-dev: don't use the community key on APL Chromebooks
      ASoC: SOF: sof-audio: remove useless assignment
      ASoC: SOF: Intel: hda: simplify NHLT handling
      ASoC: soc-core: remove always-false path
      ASOC: SOF: Intel: hda-dai: consistent naming for HDA DAI and HDA link DMA
      ASoC: SOF: Intel: hda-dai: simplify hda_dai_widget_update() prototype
      ASoC: SOF: Intel: hda-dai: use snd_soc_dai_get_widget() helper
      ASoC: SOF: Intel: hda-dai: split link DMA and dai operations
      ASoC: SOF: Intel: hda-dai: regroup dai and link DMA operations
      ASoC: SOF: sof-audio: flag errors on pipeline teardown
      ASOC: SOF: Intel: hda-dai: add hda_dai_hw_free_ipc() helper
      ASoC: SOF: Intel: hda-dai: move code to deal with hda dai/dailink suspend
      ASoC: SOF: Intel: hda-dai: improve suspend case
      ASoC: SOF: Intel: hda-dai: reset dma_data and release stream
      ASoC: SOF: Intel: add helper for link DMA cleanups
      ASoC: SOF: Intel: hda-dai: protect hw_params against successive calls
      ASoC: SOF: control: use pm_runtime_resume_and_get()
      ASoC: SOF: debug: use pm_runtime_resume_and_get()
      ASoC: SOF: sof-client-ipc-msg-injector: use pm_runtime_resume_and_get()
      ASoC: Intel: atom: use pm_runtime_resume_and_get()
      ASoC: SOF: bump SOF_ABI_MINOR
      ASoC: codecs: rt715-sdca: remove useless assignment of ops
      ASoC: max98357a: remove dependency on GPIOLIB
      ASoC: rt1015p: remove dependency on GPIOLIB
      ASoC: SOF: sof-client-ipc-flood-test: use pm_runtime_resume_and_get()

Piotr Maziarz (1):
      ASoC: Intel: avs: Replace link_mask usage with i2s_link_mask

Rander Wang (1):
      ASOC: SOF: pci: add ipc_type override for Intel IPC4 tests

Ranjani Sridharan (22):
      ASoC: SOF: Intel: move HDA_CL_STREAM_FORMAT definition to header
      ASoC: SOF: Intel: hda: define check_ipc_irq op
      ASoC: SOF: Intel: hda: Define rom_status_reg in sof_intel_dsp_desc
      ASoC: SOF: Intel: hda: expose some codeloader functions
      ASoC: SOF: remove incorrect clearing of prepared flag
      ASoC: SOF: Intel: Add IPC-specific dai ops for IPC3
      ASoC: SOF: Add a new op to set up volume table
      ASoC: SOF: sof-audio: reset route status before freeing widget
      ASoC: SOF: sof-audio: Set up widgets from source to sink
      ASoC: SOF: pcm: Move the call to snd_sof_pcm_platform_hw_params()
      ASoC: SOF: expose a couple of functions
      ASoC: SOF: Add a route_free op in struct sof_ipc_tplg_ops
      ASoC: SOF: Add two new fields to struct snd_sof_widget
      ASoC: SOF: pcm: remove unnecessary function declaration
      ASoC: SOF: topology: Skip parsing DAI link tokens if not needed
      ASoC: SOF: clarify use of widget complete flag
      ASoC: SOF: Add a prepare op to IPC topology widget ops
      ASoC: SOF: Intel: HDA: Set IPC4-specific DSP ops for CaVS platforms
      ASoC: SOF: Add IPC4 private header
      ASoC: SOF: Add header for IPC4 manifest
      ASoC: SOF: IPC4: Add FW loader ops
      ASoC: SOF: Intel: HDA: Set up sof_ipc4_fw_data for IPC4

Raphael-Xu (2):
      ASoC: rename tas2764 to tas27xx
      ASoC: update to support either TAS2764 or TAS2780

Ricard Wanderlof (1):
      ASoC: adau1761: Add ADAU1761-as-ADAU1361 compatibility mode

Richard Fitzgerald (9):
      ASoC: soc.h: Add SOC_SINGLE_S_TLV() macro
      ASoC: soc-utils: Add helper to calculate BCLK from TDM info
      ASoC: soc-utils: Add kunit test for snd_soc_tdm_params_to_bclk()
      ASoC: dt-bindings: cs35l45: Cirrus Logic CS35L45 Smart Amp
      ASoC: cs35l45: Make exports namespaced
      ASoC: SOF: Kconfig: Make SND_SOC_SOF_HDA_PROBES tristate
      ASoC: soc.h: Add SOC_SINGLE_S_EXT_TLV macro
      firmware: cirrus: cs_dsp: Avoid padding bytes in cs_dsp_coeff_ctl
      ASoC: cs35l45: Enable BOOST

Rikard Falkeborn (1):
      ASoC: samsung: Constify snd_soc_dapm_{route,widget} structs

Ryan Lee (2):
      ASoC: max98396: add amplifier driver
      ASoC: dt-bindings: max98396: add amplifier driver

Sameer Pujar (3):
      ASoC: tegra: Add binding doc for ASRC module
      ASoC: tegra: Add Tegra186 based ASRC driver
      ASoC: tegra: AHUB routes for ASRC module

Sascha Hauer (22):
      ASoC: fsl_micfil: Drop unnecessary register read
      ASoC: fsl_micfil: Drop unused register read
      ASoC: fsl_micfil: drop fsl_micfil_set_mclk_rate()
      ASoC: fsl_micfil: do not define SHIFT/MASK for single bits
      ASoC: fsl_micfil: use GENMASK to define register bit fields
      ASoC: fsl_micfil: use clear/set bits
      ASoC: fsl_micfil: drop error messages from failed register accesses
      ASoC: fsl_micfil: drop unused variables
      dmaengine: imx: Move header to include/dma/
      dmaengine: imx-sdma: error out on unsupported transfer types
      dmaengine: imx-sdma: Add multi fifo support
      ASoC: fsl_micfil: add multi fifo support
      ASoC: fsl_micfil: use define for OSR default value
      ASoC: fsl_micfil: Drop get_pdm_clk()
      ASoC: fsl_micfil: simplify clock setting
      ASoC: fsl_micfil: rework quality setting
      ASoC: fsl_micfil: drop unused include
      ASoC: fsl_micfil: drop only once used defines
      ASoC: fsl_micfil: drop support for undocumented property
      ASoC: fsl_micfil: fold fsl_set_clock_params() into its only user
      ASoC: fsl_micfil: Remove debug message
      ASoC: soc-generic-dmaengine-pcm: Use default config when none is given

Shengjiu Wang (8):
      ASoC: dmic: Add support for DSD data format
      ASoC: fsl_micfil: fix the naming style for mask definition
      ASoC: fsl_micfil: Add support for i.MX8MPlus
      ASoC: dt-bindings: fsl,micfil: Add compatible string for imx8mp
      ASoC: fsl_ssi: Add support multi fifo script
      ASoC: fsl_sai: Add support for i.MX8MM
      ASoC: fsl_sai: Add support for i.MX8M Plus
      ASoC: fsl_sai: Add support for i.MX8ULP

Shuming Fan (1):
      ASoC: rt1308-sdw: add the default value of register 0xc320

Simon Trimmer (1):
      ASoC: soc.h: Introduce SOC_DOUBLE_R_S_EXT_TLV() macro

Srinivasa Rao Mandadapu (6):
      ASoC: codecs: Fix error handling in power domain init and exit handlers
      ASoC: qcom: dt-bindings: Update bindings for clocks in lpass digital codes
      ASoC: dt-bindings: wcd938x: Add mic bias supply property
      ASoC: dt-bindings: lpass-cpu: Update clocks and power domain names for sc7280 platform
      ASoC: qcom: lpass-platform: Update memremap flag to MEMREMAP_WC
      ASoC: qcom: SC7280: Update machine driver startup, shutdown callbacks

Stephen Kitt (36):
      ASoC: ad1*, ada*, ssm*: use i2c_match_id and simple i2c probe
      ASoC: da[79]*: use simple i2c probe function
      ASoC: da7218: use i2c_match_id and simple i2c probe
      ASoC: ada*, ssm*: use simple i2c probe function
      ASoC: wm*: use i2c_match_id and simple i2c probe
      ASoC: cs*: use simple i2c probe function
      ASoC: mt6660: use simple i2c probe function
      ASoC: lm49xxx: use simple i2c probe function
      ASoC: wm*: use simple i2c probe function
      ASoC: tscs*: use simple i2c probe function
      ASoC: rt*: use simple i2c probe function
      ASoC: pcm3060: use simple i2c probe function
      ASoC: rt1016: enable building
      ASoC: sgtl5000: use simple i2c probe function
      ASoC: wm8731: use simple i2c probe function
      ASoC: ak4*: use simple i2c probe function
      ASoC: cx2072x: use simple i2c probe function
      ASoC: es83*: use simple i2c probe function
      ASoC: lm4857: use simple i2c probe function
      ASoC: max9*: use simple i2c probe function
      ASoC: ml26124: use simple i2c probe function
      ASoC: nau8*: use simple i2c probe function
      ASoC: pcm*: use simple i2c probe function
      ASoC: sta*: use simple i2c probe function
      ASoC: tas*: use simple i2c probe function
      ASoC: tda7419: use simple i2c probe function
      ASoC: tlv320*: use simple i2c probe function
      ASoC: ts3a227e: use simple i2c probe function
      ASoC: uda1380: use simple i2c probe function
      ASoC: ak*: use i2c_match_id and simple i2c probe
      ASoC: alc56*: use i2c_match_id and simple i2c probe
      ASoC: max980*: use i2c_match_id and simple i2c probe
      ASoC: pcm186x: use i2c_match_id and simple i2c probe
      ASoC: tas*: use i2c_match_id and simple i2c probe
      ASoC: tlv320*: use i2c_match_id and simple i2c probe
      ASoC: tpa6130: use i2c_match_id and simple i2c probe

Steve Lee (2):
      ASoC: max98390: Add reset gpio control
      ASoC: dt-bindings: max98390: add reset gpio bindings

Takashi Iwai (1):
      ASoC: intel: atom: Remove superfluous flush_scheduled_work()

TingHan Shen (1):
      firmware: mediatek: Add adsp ipc protocol interface

Tinghan Shen (6):
      ASoC: SOF: mediatek: Add mt8186 hardware support
      ASoC: SOF: mediatek: Add mt8186 sof fw loader and dsp ops
      ASoC: SOF: mediatek: Add mt8186 dsp clock support
      ASoC: SOF: mediatek: Add DSP system PM callback for mt8186
      ASoC: SOF: mediatek: Fix allyesconfig build error
      ASoC: SOF: mediatek: Add mt8186 ipc support

Trevor Wu (6):
      ASoC: mediatek: mt8195: revise mt8195-mt6359-rt1019-rt5682.c
      ASoC: mediatek: mt8195: merge machine driver
      ASoC: dt-bindings: mediatek: mt8195: merge mt8195 machine yaml
      ASoC: mediatek: mt8195: rename card controls
      ASoC: mediatek: mt8195: add machine support for max98390 and rt5682
      ASoC: dt-bindings: mediatek: mt8195: support mt8195-mt6359-max98390-rt5682

Uwe Kleine-König (2):
      ASoC: tas6424: Return zero in remove callback
      ASoC: pcm1789: Make pcm1789_common_exit() return void

V sujith kumar Reddy (2):
      ASoC: amd: acp: Set Speaker enable/disable pin through rt1019 codec driver
      ASoC: amd: acp: Set Speaker enable/disable pin through rt1019 codec driver.

Vamshi Krishna (1):
      ASoC: Intel: sof_rt5682: Add support for adl_rt1019_rt5682s

Vijendar Mukunda (1):
      ASoC: amd: yc: add new YC platform varaint support

Wan Jiabing (1):
      ASoC: SOF: mediatek: remove duplicate include in mt8195.c

YC Hung (7):
      ASoC: SOF: OF: Add shutdown callback for SOF OF device
      ASoC: SOF: mediatek: mt8195 add shutdown callback
      ASoC: SOF: mediatek: mt8195 change ipc timeout as 1 second
      ASoC: dsp: mediatek: add mt8195 dsp document
      ASoC: SOF: ipc: introduce cont_update_posn in sof_ipc_stream_params struct
      ASoC: SOF: mediatek: Add mediatek common debug dump
      ASoC: SOF: mediatek: Add mt8195 debug dump

Yang Yingliang (3):
      ASoC: SOF: sof-pci-dev: fix missing pci_release_regions() on error in sof_pci_probe()
      ASoC: samsung: spdif: remove unnecessary check of mem_res
      ASoC: wm2000: fix missing clk_disable_unprepare() on error in wm2000_anc_transition()

Yihao Han (1):
      ASoC: ux500: mop500: Check before clk_put() not needed

YueHaibing (4):
      ASoC: tegra186_asrc: mark runtime-pm functions as __maybe_unused
      ASoC: mediatek: mt8195: Fix build warning without CONFIG_OF
      ASoC: amd: vangogh: Remove duplicate include files
      ASoC: codecs: lpass: Fix passing zero to 'PTR_ERR'

Zhen Ni (1):
      ASoC: Intel: boards: Use temporary variable for struct device

Zheng Bin (1):
      ASoC: SOF: amd: add missing platform_device_unregister in acp_pci_rn_probe

Zheyu Ma (9):
      ASoC: SOF: Intel: Check the bar size before remapping
      ASoC: tlv320adcx140: Register a callback to disable the regulator_disable
      ASoC: cs35l36: Fix the error handling of cs35l36_i2c_probe()
      ASoC: rt5645: Fix the error handling of rt5645_i2c_probe()
      ASoC: tas571x: Fix the error handling of tas571x_i2c_probe()
      ASoC: tas6424: Fix the error handling of tas6424_i2c_probe()
      ASoC: wm8903: Fix the error handling of wm8903_i2c_probe()
      ASoC: cs42l46: Fix the error handling of cs42l56_i2c_probe()
      ASoC: cs42l56: Fix the error handling of cs42l56_i2c_probe()

tangmeng (1):
      ASoC: SOF: Remove redundant return statements

 .../bindings/dsp/mediatek,mt8195-dsp.yaml          |  105 ++
 .../devicetree/bindings/sound/adi,max98396.yaml    |   79 +
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  |   75 +
 .../devicetree/bindings/sound/fsl,micfil.txt       |    1 +
 .../devicetree/bindings/sound/maxim,max98390.yaml  |    5 +
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |   32 +
 .../sound/mt8195-mt6359-rt1011-rt5682.yaml         |   51 -
 ...t6359-rt1019-rt5682.yaml => mt8195-mt6359.yaml} |    9 +-
 .../bindings/sound/nvidia,tegra186-asrc.yaml       |   81 +
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    4 +
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |   17 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |   17 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |   17 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   11 +-
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |    3 +
 .../devicetree/bindings/sound/realtek,rt1015p.yaml |    3 +
 Documentation/devicetree/bindings/sound/rt5682.txt |    2 +
 .../bindings/sound/{tas2764.yaml => tas27xx.yaml}  |   17 +-
 .../devicetree/bindings/sound/wlf,wm8731.yaml      |   97 ++
 .../devicetree/bindings/sound/wlf,wm8940.yaml      |   57 +
 Documentation/devicetree/bindings/sound/wm8731.txt |   27 -
 MAINTAINERS                                        |    2 +
 arch/arm/configs/multi_v5_defconfig                |    3 +-
 drivers/dma/imx-dma.c                              |    2 +-
 drivers/dma/imx-sdma.c                             |   76 +-
 drivers/firmware/Kconfig                           |    9 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/mtk-adsp-ipc.c                    |  157 ++
 drivers/mmc/host/mxcmmc.c                          |    2 +-
 drivers/spi/spi-fsl-lpspi.c                        |    2 +-
 drivers/spi/spi-imx.c                              |    2 +-
 drivers/staging/greybus/audio_codec.c              |   12 +-
 drivers/tty/serial/imx.c                           |    2 +-
 drivers/video/fbdev/mx3fb.c                        |    2 +-
 include/dt-bindings/sound/cs35l45.h                |   20 +
 .../{platform_data/dma-imx.h => dma/imx-dma.h}     |   26 +-
 include/linux/firmware/cirrus/cs_dsp.h             |   28 +-
 include/linux/firmware/mediatek/mtk-adsp-ipc.h     |   65 +
 include/sound/cs35l41.h                            |    1 -
 include/sound/intel-dsp-config.h                   |    3 +-
 include/sound/intel-nhlt.h                         |    6 +-
 include/sound/soc-acpi.h                           |    2 +
 include/sound/soc-card.h                           |    7 +-
 include/sound/soc-component.h                      |    9 +
 include/sound/soc-dpcm.h                           |    2 +
 include/sound/soc.h                                |   27 +-
 include/sound/sof.h                                |   23 +-
 include/sound/sof/ext_manifest4.h                  |  119 ++
 include/sound/sof/ipc4/header.h                    |  460 ++++++
 include/sound/sof/stream.h                         |    3 +-
 include/uapi/sound/intel/avs/tokens.h              |  126 ++
 include/uapi/sound/sof/abi.h                       |    4 +-
 sound/soc/Kconfig                                  |    9 +-
 sound/soc/Makefile                                 |    5 +
 sound/soc/amd/acp-da7219-max98357a.c               |    4 +-
 sound/soc/amd/acp-rt5645.c                         |    2 +-
 sound/soc/amd/acp/Kconfig                          |    6 +-
 sound/soc/amd/acp/acp-legacy-mach.c                |   22 +-
 sound/soc/amd/acp/acp-mach-common.c                |   29 +-
 sound/soc/amd/acp/acp-mach.h                       |    9 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   22 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               |    2 +-
 sound/soc/amd/vangogh/acp5x-mach.c                 |   10 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   42 +-
 sound/soc/amd/yc/pci-acp6x.c                       |    9 +-
 sound/soc/atmel/Kconfig                            |    4 +-
 sound/soc/atmel/atmel-classd.c                     |    1 -
 sound/soc/atmel/atmel-pdmic.c                      |    1 -
 sound/soc/atmel/sam9g20_wm8731.c                   |   16 +-
 sound/soc/au1x/Kconfig                             |    2 +-
 sound/soc/codecs/Kconfig                           |   67 +-
 sound/soc/codecs/Makefile                          |   16 +
 sound/soc/codecs/ad193x-i2c.c                      |    6 +-
 sound/soc/codecs/adau1372-i2c.c                    |    4 +-
 sound/soc/codecs/adau1372.c                        |    1 +
 sound/soc/codecs/adau1373.c                        |    5 +-
 sound/soc/codecs/adau1701.c                        |    5 +-
 sound/soc/codecs/adau1761-i2c.c                    |    8 +-
 sound/soc/codecs/adau1761.c                        |   86 +-
 sound/soc/codecs/adau1781-i2c.c                    |    8 +-
 sound/soc/codecs/adau17x1.c                        |   20 +-
 sound/soc/codecs/adau17x1.h                        |    1 +
 sound/soc/codecs/adau1977-i2c.c                    |    8 +-
 sound/soc/codecs/adau7118-i2c.c                    |    5 +-
 sound/soc/codecs/adav803.c                         |    5 +-
 sound/soc/codecs/ak4118.c                          |    5 +-
 sound/soc/codecs/ak4535.c                          |    5 +-
 sound/soc/codecs/ak4613.c                          |  377 ++++-
 sound/soc/codecs/ak4641.c                          |    5 +-
 sound/soc/codecs/ak4642.c                          |    8 +-
 sound/soc/codecs/ak4671.c                          |    5 +-
 sound/soc/codecs/alc5623.c                         |   24 +-
 sound/soc/codecs/alc5632.c                         |   20 +-
 sound/soc/codecs/cros_ec_codec.c                   |    7 +-
 sound/soc/codecs/cs35l32.c                         |    5 +-
 sound/soc/codecs/cs35l33.c                         |    5 +-
 sound/soc/codecs/cs35l34.c                         |    5 +-
 sound/soc/codecs/cs35l35.c                         |    5 +-
 sound/soc/codecs/cs35l36.c                         |    7 +-
 sound/soc/codecs/cs35l41-i2c.c                     |    5 +-
 sound/soc/codecs/cs35l41-lib.c                     |   16 +-
 sound/soc/codecs/cs35l41.c                         |    2 +
 sound/soc/codecs/cs35l45-i2c.c                     |   74 +
 sound/soc/codecs/cs35l45-spi.c                     |   74 +
 sound/soc/codecs/cs35l45-tables.c                  |  202 +++
 sound/soc/codecs/cs35l45.c                         |  690 +++++++++
 sound/soc/codecs/cs35l45.h                         |  217 +++
 sound/soc/codecs/cs4234.c                          |    5 +-
 sound/soc/codecs/cs4265.c                          |    5 +-
 sound/soc/codecs/cs4270.c                          |   20 +-
 sound/soc/codecs/cs4271-i2c.c                      |    5 +-
 sound/soc/codecs/cs42l42.c                         |    5 +-
 sound/soc/codecs/cs42l51-i2c.c                     |    5 +-
 sound/soc/codecs/cs42l51.c                         |    7 +-
 sound/soc/codecs/cs42l52.c                         |    5 +-
 sound/soc/codecs/cs42l56.c                         |    7 +-
 sound/soc/codecs/cs42l73.c                         |    5 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |    5 +-
 sound/soc/codecs/cs43130.c                         |   23 +-
 sound/soc/codecs/cs43130.h                         |  151 +-
 sound/soc/codecs/cs4341.c                          |    5 +-
 sound/soc/codecs/cs4349.c                          |   14 +-
 sound/soc/codecs/cs53l30.c                         |    5 +-
 sound/soc/codecs/cx2072x.c                         |    6 +-
 sound/soc/codecs/da7210.c                          |    5 +-
 sound/soc/codecs/da7213.c                          |    5 +-
 sound/soc/codecs/da7218.c                          |   19 +-
 sound/soc/codecs/da7219.c                          |    5 +-
 sound/soc/codecs/da732x.c                          |    5 +-
 sound/soc/codecs/da9055.c                          |    5 +-
 sound/soc/codecs/dmic.c                            |    5 +-
 sound/soc/codecs/es8316.c                          |    5 +-
 sound/soc/codecs/es8328-i2c.c                      |    5 +-
 sound/soc/codecs/hdac_hda.c                        |   15 +-
 sound/soc/codecs/hdmi-codec.c                      |   15 +-
 sound/soc/codecs/isabelle.c                        |    5 +-
 sound/soc/codecs/lm4857.c                          |    5 +-
 sound/soc/codecs/lm49453.c                         |    5 +-
 sound/soc/codecs/lochnagar-sc.c                    |    5 +-
 sound/soc/codecs/lpass-macro-common.c              |   35 +-
 sound/soc/codecs/max9768.c                         |    5 +-
 sound/soc/codecs/max98088.c                        |   21 +-
 sound/soc/codecs/max98090.c                        |   33 +-
 sound/soc/codecs/max98095.c                        |   19 +-
 sound/soc/codecs/max98371.c                        |    5 +-
 sound/soc/codecs/max98373-i2c.c                    |    5 +-
 sound/soc/codecs/max98390.c                        |   17 +-
 sound/soc/codecs/max98396.c                        | 1637 ++++++++++++++++++++
 sound/soc/codecs/max98396.h                        |  305 ++++
 sound/soc/codecs/max9850.c                         |    5 +-
 sound/soc/codecs/max98504.c                        |    6 +-
 sound/soc/codecs/max98520.c                        |    4 +-
 sound/soc/codecs/max9867.c                         |    5 +-
 sound/soc/codecs/max9877.c                         |    5 +-
 sound/soc/codecs/max98925.c                        |    5 +-
 sound/soc/codecs/max98926.c                        |    5 +-
 sound/soc/codecs/max98927.c                        |    5 +-
 sound/soc/codecs/ml26124.c                         |    5 +-
 sound/soc/codecs/mt6351.c                          |   10 +-
 sound/soc/codecs/mt6358.c                          |   10 +-
 sound/soc/codecs/mt6359.c                          |   10 +-
 sound/soc/codecs/mt6660.c                          |    6 +-
 sound/soc/codecs/nau8540.c                         |    5 +-
 sound/soc/codecs/nau8810.c                         |    5 +-
 sound/soc/codecs/nau8821.c                         |    5 +-
 sound/soc/codecs/nau8822.c                         |    5 +-
 sound/soc/codecs/nau8824.c                         |    5 +-
 sound/soc/codecs/nau8825.c                         |    5 +-
 sound/soc/codecs/pcm1681.c                         |    5 +-
 sound/soc/codecs/pcm1789-i2c.c                     |    9 +-
 sound/soc/codecs/pcm1789.c                         |    4 +-
 sound/soc/codecs/pcm1789.h                         |    2 +-
 sound/soc/codecs/pcm179x-i2c.c                     |    5 +-
 sound/soc/codecs/pcm186x-i2c.c                     |   24 +-
 sound/soc/codecs/pcm186x.c                         |    7 +-
 sound/soc/codecs/pcm3060-i2c.c                     |    5 +-
 sound/soc/codecs/pcm3060.c                         |    1 +
 sound/soc/codecs/pcm3168a-i2c.c                    |    5 +-
 sound/soc/codecs/pcm512x-i2c.c                     |    5 +-
 sound/soc/codecs/rk3328_codec.c                    |    2 +-
 sound/soc/codecs/rt1011.c                          |    5 +-
 sound/soc/codecs/rt1015.c                          |    5 +-
 sound/soc/codecs/rt1016.c                          |    5 +-
 sound/soc/codecs/rt1019.c                          |    8 +-
 sound/soc/codecs/rt1305.c                          |    5 +-
 sound/soc/codecs/rt1308-sdw.c                      |    1 +
 sound/soc/codecs/rt1308-sdw.h                      |    1 +
 sound/soc/codecs/rt1308.c                          |    5 +-
 sound/soc/codecs/rt1316-sdw.c                      |    1 +
 sound/soc/codecs/rt274.c                           |    5 +-
 sound/soc/codecs/rt286.c                           |    5 +-
 sound/soc/codecs/rt298.c                           |    5 +-
 sound/soc/codecs/rt5514.c                          |    7 +-
 sound/soc/codecs/rt5616.c                          |    5 +-
 sound/soc/codecs/rt5631.c                          |    5 +-
 sound/soc/codecs/rt5640.c                          |    5 +-
 sound/soc/codecs/rt5645.c                          |   16 +-
 sound/soc/codecs/rt5651.c                          |    5 +-
 sound/soc/codecs/rt5659.c                          |    5 +-
 sound/soc/codecs/rt5660.c                          |    5 +-
 sound/soc/codecs/rt5663.c                          |    5 +-
 sound/soc/codecs/rt5665.c                          |    5 +-
 sound/soc/codecs/rt5668.c                          |    5 +-
 sound/soc/codecs/rt5670.c                          |    5 +-
 sound/soc/codecs/rt5682-i2c.c                      |    5 +-
 sound/soc/codecs/rt5682s.c                         |   32 +-
 sound/soc/codecs/rt5682s.h                         |    6 +-
 sound/soc/codecs/rt700.c                           |    1 +
 sound/soc/codecs/rt711-sdca.c                      |    1 +
 sound/soc/codecs/rt711.c                           |    1 +
 sound/soc/codecs/rt715-sdca-sdw.c                  |    2 -
 sound/soc/codecs/rt715-sdca.c                      |    1 +
 sound/soc/codecs/rt715.c                           |    1 +
 sound/soc/codecs/rt9120.c                          |  114 +-
 sound/soc/codecs/sdw-mockup.c                      |    1 +
 sound/soc/codecs/sgtl5000.c                        |    5 +-
 sound/soc/codecs/ssm2518.c                         |    5 +-
 sound/soc/codecs/ssm2602-i2c.c                     |    8 +-
 sound/soc/codecs/ssm4567.c                         |    5 +-
 sound/soc/codecs/sta32x.c                          |   14 +-
 sound/soc/codecs/sta350.c                          |   14 +-
 sound/soc/codecs/sta529.c                          |    5 +-
 sound/soc/codecs/tas2552.c                         |    5 +-
 sound/soc/codecs/tas2562.c                         |   25 +-
 sound/soc/codecs/tas2764.c                         |    5 +-
 sound/soc/codecs/tas2770.c                         |    5 +-
 sound/soc/codecs/tas5086.c                         |    5 +-
 sound/soc/codecs/tas571x.c                         |   17 +-
 sound/soc/codecs/tas5720.c                         |   21 +-
 sound/soc/codecs/tas6424.c                         |   17 +-
 sound/soc/codecs/tda7419.c                         |    5 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |   32 +-
 sound/soc/codecs/tlv320adcx140.c                   |   16 +-
 sound/soc/codecs/tlv320aic23-i2c.c                 |    5 +-
 sound/soc/codecs/tlv320aic31xx.c                   |   32 +-
 sound/soc/codecs/tlv320aic32x4-i2c.c               |   11 +-
 sound/soc/codecs/tlv320aic3x-i2c.c                 |   25 +-
 sound/soc/codecs/tlv320dac33.c                     |    5 +-
 sound/soc/codecs/tpa6130a2.c                       |   21 +-
 sound/soc/codecs/ts3a227e.c                        |    5 +-
 sound/soc/codecs/tscs42xx.c                        |    5 +-
 sound/soc/codecs/tscs454.c                         |   17 +-
 sound/soc/codecs/uda1380.c                         |    5 +-
 sound/soc/codecs/wcd9335.c                         |    1 +
 sound/soc/codecs/wcd934x.c                         |    1 +
 sound/soc/codecs/wcd938x.c                         |    1 +
 sound/soc/codecs/wm1250-ev1.c                      |    5 +-
 sound/soc/codecs/wm2000.c                          |   12 +-
 sound/soc/codecs/wm2200.c                          |    5 +-
 sound/soc/codecs/wm5100.c                          |    5 +-
 sound/soc/codecs/wm8510.c                          |    5 +-
 sound/soc/codecs/wm8523.c                          |    5 +-
 sound/soc/codecs/wm8580.c                          |    5 +-
 sound/soc/codecs/wm8711.c                          |    5 +-
 sound/soc/codecs/wm8728.c                          |    5 +-
 sound/soc/codecs/wm8731-i2c.c                      |   68 +
 sound/soc/codecs/wm8731-spi.c                      |   59 +
 sound/soc/codecs/wm8731.c                          |  267 +---
 sound/soc/codecs/wm8731.h                          |   27 +
 sound/soc/codecs/wm8737.c                          |    5 +-
 sound/soc/codecs/wm8741.c                          |    5 +-
 sound/soc/codecs/wm8750.c                          |    5 +-
 sound/soc/codecs/wm8753.c                          |    5 +-
 sound/soc/codecs/wm8776.c                          |    5 +-
 sound/soc/codecs/wm8804-i2c.c                      |    5 +-
 sound/soc/codecs/wm8900.c                          |    5 +-
 sound/soc/codecs/wm8903.c                          |    7 +-
 sound/soc/codecs/wm8904.c                          |    9 +-
 sound/soc/codecs/wm8940.c                          |   12 +-
 sound/soc/codecs/wm8955.c                          |    5 +-
 sound/soc/codecs/wm8960.c                          |   20 +-
 sound/soc/codecs/wm8961.c                          |    5 +-
 sound/soc/codecs/wm8962.c                          |   11 +-
 sound/soc/codecs/wm8971.c                          |    5 +-
 sound/soc/codecs/wm8974.c                          |    5 +-
 sound/soc/codecs/wm8978.c                          |    5 +-
 sound/soc/codecs/wm8983.c                          |    5 +-
 sound/soc/codecs/wm8985.c                          |    8 +-
 sound/soc/codecs/wm8988.c                          |    5 +-
 sound/soc/codecs/wm8990.c                          |    5 +-
 sound/soc/codecs/wm8991.c                          |    5 +-
 sound/soc/codecs/wm8993.c                          |    5 +-
 sound/soc/codecs/wm8995.c                          |    5 +-
 sound/soc/codecs/wm8996.c                          |    5 +-
 sound/soc/codecs/wm9081.c                          |    5 +-
 sound/soc/codecs/wm9090.c                          |    6 +-
 sound/soc/codecs/wsa881x.c                         |    1 +
 sound/soc/fsl/fsl_asrc.c                           |    8 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |    2 +-
 sound/soc/fsl/fsl_easrc.h                          |    2 +-
 sound/soc/fsl/fsl_esai.c                           |    6 +-
 sound/soc/fsl/fsl_micfil.c                         |  382 ++---
 sound/soc/fsl/fsl_micfil.h                         |  269 +---
 sound/soc/fsl/fsl_sai.c                            |   43 +-
 sound/soc/fsl/fsl_sai.h                            |    1 +
 sound/soc/fsl/fsl_ssi.c                            |   34 +-
 sound/soc/fsl/imx-es8328.c                         |    2 +-
 sound/soc/fsl/imx-hdmi.c                           |    9 +-
 sound/soc/fsl/imx-pcm.h                            |    2 +-
 sound/soc/fsl/imx-sgtl5000.c                       |   14 +-
 sound/soc/fsl/imx-ssi.h                            |    2 +-
 sound/soc/generic/audio-graph-card2.c              |    7 +-
 sound/soc/generic/simple-card-utils.c              |    5 +-
 sound/soc/img/img-i2s-in.c                         |    6 +-
 sound/soc/img/img-parallel-out.c                   |    6 +-
 sound/soc/img/img-spdif-in.c                       |    6 +-
 sound/soc/img/img-spdif-out.c                      |    6 +-
 sound/soc/intel/Kconfig                            |    9 +-
 sound/soc/intel/atom/sst/sst.c                     |    1 -
 sound/soc/intel/atom/sst/sst_drv_interface.c       |   15 +-
 sound/soc/intel/avs/Makefile                       |    8 +-
 sound/soc/intel/avs/apl.c                          |  250 +++
 sound/soc/intel/avs/avs.h                          |  102 ++
 sound/soc/intel/avs/board_selection.c              |  501 ++++++
 sound/soc/intel/avs/core.c                         |  631 ++++++++
 sound/soc/intel/avs/dsp.c                          |   27 +-
 sound/soc/intel/avs/ipc.c                          |  253 ++-
 sound/soc/intel/avs/loader.c                       |   84 +
 sound/soc/intel/avs/messages.c                     |   35 +-
 sound/soc/intel/avs/messages.h                     |   51 +
 sound/soc/intel/avs/path.c                         | 1005 ++++++++++++
 sound/soc/intel/avs/path.h                         |   72 +
 sound/soc/intel/avs/pcm.c                          | 1182 ++++++++++++++
 sound/soc/intel/avs/registers.h                    |    8 +
 sound/soc/intel/avs/skl.c                          |  125 ++
 sound/soc/intel/avs/topology.c                     | 1598 +++++++++++++++++++
 sound/soc/intel/avs/topology.h                     |  194 +++
 sound/soc/intel/avs/trace.c                        |   33 +
 sound/soc/intel/avs/trace.h                        |  154 ++
 sound/soc/intel/avs/utils.c                        |   23 +
 sound/soc/intel/boards/bdw-rt5650.c                |    6 +-
 sound/soc/intel/boards/bdw-rt5677.c                |    4 +-
 sound/soc/intel/boards/broadwell.c                 |    2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |    5 +-
 sound/soc/intel/boards/bxt_rt298.c                 |    5 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |   10 +-
 sound/soc/intel/boards/bytcht_es8316.c             |    8 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |   36 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    7 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |    6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |   28 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |    4 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |   12 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |    5 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |    5 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |    5 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |    5 +-
 sound/soc/intel/boards/kbl_rt5660.c                |   15 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |    7 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |    7 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c        |    8 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |    6 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |    6 +-
 sound/soc/intel/boards/skl_rt286.c                 |    5 +-
 sound/soc/intel/boards/sof_cs42l42.c               |    5 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |    2 +-
 sound/soc/intel/boards/sof_es8336.c                |    8 +-
 sound/soc/intel/boards/sof_nau8825.c               |    2 +-
 sound/soc/intel/boards/sof_realtek_common.c        |   39 +
 sound/soc/intel/boards/sof_realtek_common.h        |    5 +
 sound/soc/intel/boards/sof_rt5682.c                |   18 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c            |   14 +-
 sound/soc/intel/boards/sof_sdw_rt700.c             |   14 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |   14 +-
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c        |   14 +-
 sound/soc/intel/boards/sof_ssp_amp.c               |   25 +-
 sound/soc/intel/catpt/messages.h                   |    4 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |    7 +
 sound/soc/mediatek/Kconfig                         |   27 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |    9 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |   13 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |    2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |    2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |    4 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |    5 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    5 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |  203 ++-
 sound/soc/mediatek/mt8195/Makefile                 |    3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c         |    8 +-
 .../mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c  | 1198 --------------
 ...8195-mt6359-rt1019-rt5682.c => mt8195-mt6359.c} |  871 +++++++----
 sound/soc/mxs/mxs-saif.c                           |    1 +
 sound/soc/pxa/Kconfig                              |    4 +-
 sound/soc/pxa/hx4700.c                             |    6 +-
 sound/soc/pxa/palm27x.c                            |    7 +-
 sound/soc/pxa/ttc-dkb.c                            |   14 +-
 sound/soc/pxa/z2.c                                 |    7 +-
 sound/soc/qcom/Kconfig                             |    2 +
 sound/soc/qcom/apq8016_sbc.c                       |    2 +-
 sound/soc/qcom/lpass-platform.c                    |    2 +-
 sound/soc/qcom/sc7180.c                            |    4 +-
 sound/soc/qcom/sc7280.c                            |   99 +-
 sound/soc/qcom/sdm845.c                            |    2 +-
 sound/soc/qcom/sm8250.c                            |    2 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |    8 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |   16 +-
 sound/soc/rockchip/rockchip_max98090.c             |   16 +-
 sound/soc/rockchip/rockchip_rt5645.c               |    2 +-
 sound/soc/samsung/aries_wm8994.c                   |    6 +-
 sound/soc/samsung/bells.c                          |    4 +-
 sound/soc/samsung/h1940_uda1380.c                  |    3 +-
 sound/soc/samsung/littlemill.c                     |    6 +-
 sound/soc/samsung/lowland.c                        |   13 +-
 sound/soc/samsung/midas_wm1811.c                   |    2 +-
 sound/soc/samsung/rx1950_uda1380.c                 |    3 +-
 sound/soc/samsung/smartq_wm8987.c                  |    8 +-
 sound/soc/samsung/spdif.c                          |    3 +-
 sound/soc/samsung/speyside.c                       |   14 +-
 sound/soc/samsung/tobermory.c                      |   12 +-
 sound/soc/sh/Kconfig                               |    2 +-
 sound/soc/sh/rcar/core.c                           |   17 +-
 sound/soc/sh/rcar/dma.c                            |    9 +-
 sound/soc/sh/rcar/rsnd.h                           |    2 +-
 sound/soc/sh/rcar/src.c                            |    7 +-
 sound/soc/sh/rcar/ssi.c                            |   14 +-
 sound/soc/sh/rcar/ssiu.c                           |   11 +-
 sound/soc/sh/rz-ssi.c                              |   24 +-
 sound/soc/soc-card.c                               |   56 +-
 sound/soc/soc-component.c                          |   16 +-
 sound/soc/soc-core.c                               |   98 +-
 sound/soc/soc-dapm.c                               |    2 -
 sound/soc/soc-generic-dmaengine-pcm.c              |   57 +-
 sound/soc/soc-jack.c                               |    2 +-
 sound/soc/soc-pcm.c                                |   38 +-
 sound/soc/soc-topology.c                           |  455 +++---
 sound/soc/soc-utils-test.c                         |  186 +++
 sound/soc/soc-utils.c                              |   45 +
 sound/soc/sof/Makefile                             |    4 +-
 sound/soc/sof/amd/acp-trace.c                      |    4 +-
 sound/soc/sof/amd/acp.c                            |   66 +-
 sound/soc/sof/amd/acp.h                            |   10 +-
 sound/soc/sof/amd/pci-rn.c                         |   15 +-
 sound/soc/sof/amd/renoir.c                         |    6 +-
 sound/soc/sof/compress.c                           |    8 +-
 sound/soc/sof/control.c                            |   36 +-
 sound/soc/sof/core.c                               |   28 +-
 sound/soc/sof/debug.c                              |    9 +-
 sound/soc/sof/imx/imx8.c                           |   40 +-
 sound/soc/sof/imx/imx8m.c                          |   20 +-
 sound/soc/sof/intel/Kconfig                        |    2 +-
 sound/soc/sof/intel/Makefile                       |    2 +-
 sound/soc/sof/intel/apl.c                          |  143 +-
 sound/soc/sof/intel/bdw.c                          |   21 +-
 sound/soc/sof/intel/byt.c                          |   56 +-
 sound/soc/sof/intel/cnl.c                          |  212 ++-
 sound/soc/sof/intel/hda-common-ops.c               |  106 ++
 sound/soc/sof/intel/hda-dai.c                      |  434 ++++--
 sound/soc/sof/intel/hda-dsp.c                      |   52 +-
 sound/soc/sof/intel/hda-ipc.c                      |   82 +
 sound/soc/sof/intel/hda-loader.c                   |  123 +-
 sound/soc/sof/intel/hda-trace.c                    |    4 +-
 sound/soc/sof/intel/hda.c                          |   40 +-
 sound/soc/sof/intel/hda.h                          |   50 +-
 sound/soc/sof/intel/icl.c                          |  121 +-
 sound/soc/sof/intel/pci-apl.c                      |   36 +-
 sound/soc/sof/intel/pci-cnl.c                      |   54 +-
 sound/soc/sof/intel/pci-icl.c                      |   36 +-
 sound/soc/sof/intel/pci-tgl.c                      |   97 +-
 sound/soc/sof/intel/pci-tng.c                      |   27 +-
 sound/soc/sof/intel/shim.h                         |   16 +-
 sound/soc/sof/intel/tgl.c                          |  160 +-
 sound/soc/sof/ipc.c                                |  969 +-----------
 sound/soc/sof/ipc3-control.c                       |  155 +-
 sound/soc/sof/ipc3-dtrace.c                        |  649 ++++++++
 sound/soc/sof/ipc3-loader.c                        |  415 +++++
 sound/soc/sof/ipc3-ops.h                           |   21 -
 sound/soc/sof/ipc3-pcm.c                           |   10 +-
 sound/soc/sof/ipc3-priv.h                          |   65 +
 sound/soc/sof/ipc3-topology.c                      |   79 +-
 sound/soc/sof/ipc3.c                               | 1040 ++++++++++++-
 sound/soc/sof/ipc4-loader.c                        |  210 +++
 sound/soc/sof/ipc4-priv.h                          |   44 +
 sound/soc/sof/ipc4.c                               |  606 ++++++++
 sound/soc/sof/loader.c                             |  698 +--------
 sound/soc/sof/mediatek/Kconfig                     |   11 +
 sound/soc/sof/mediatek/Makefile                    |    2 +
 sound/soc/sof/mediatek/adsp_helper.h               |   20 +-
 sound/soc/sof/mediatek/mt8186/Makefile             |    4 +
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c         |  101 ++
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h         |   24 +
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c      |   58 +
 sound/soc/sof/mediatek/mt8186/mt8186.c             |  554 +++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h             |   80 +
 sound/soc/sof/mediatek/mt8195/mt8195.c             |  192 ++-
 sound/soc/sof/mediatek/mtk-adsp-common.c           |   84 +
 sound/soc/sof/mediatek/mtk-adsp-common.h           |   10 +
 sound/soc/sof/ops.c                                |    2 +-
 sound/soc/sof/ops.h                                |   34 +-
 sound/soc/sof/pcm.c                                |   30 +-
 sound/soc/sof/pm.c                                 |   22 +-
 sound/soc/sof/sof-acpi-dev.c                       |    6 +-
 sound/soc/sof/sof-audio.c                          |  398 +++--
 sound/soc/sof/sof-audio.h                          |   80 +-
 sound/soc/sof/sof-client-ipc-flood-test.c          |    3 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c        |  191 ++-
 sound/soc/sof/sof-client-probes.c                  |   14 +-
 sound/soc/sof/sof-client.c                         |   66 +-
 sound/soc/sof/sof-client.h                         |    2 +
 sound/soc/sof/sof-of-dev.c                         |   12 +-
 sound/soc/sof/sof-of-dev.h                         |    1 +
 sound/soc/sof/sof-pci-dev.c                        |   96 +-
 sound/soc/sof/sof-priv.h                           |  130 +-
 sound/soc/sof/topology.c                           |   79 +-
 sound/soc/sof/trace.c                              |  596 +------
 sound/soc/tegra/Kconfig                            |   12 +
 sound/soc/tegra/Makefile                           |    2 +
 sound/soc/tegra/tegra186_asrc.c                    | 1046 +++++++++++++
 sound/soc/tegra/tegra186_asrc.h                    |  112 ++
 sound/soc/tegra/tegra210_ahub.c                    |   82 +-
 sound/soc/tegra/tegra_asoc_machine.c               |   30 +-
 sound/soc/tegra/tegra_wm8903.c                     |   10 +-
 sound/soc/ti/ams-delta.c                           |    4 +-
 sound/soc/ti/davinci-mcasp.c                       |    2 +
 sound/soc/ti/j721e-evm.c                           |   44 +-
 sound/soc/ti/omap-abe-twl6040.c                    |    8 +-
 sound/soc/ti/omap-twl4030.c                        |    8 +-
 sound/soc/ti/osk5912.c                             |    4 +-
 sound/soc/ti/rx51.c                                |    2 +-
 sound/soc/uniphier/aio-compress.c                  |    7 +-
 sound/soc/ux500/mop500_ab8500.c                    |    9 +-
 521 files changed, 23027 insertions(+), 7603 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98396.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
 rename Documentation/devicetree/bindings/sound/{mt8195-mt6359-rt1019-rt5682.yaml => mt8195-mt6359.yaml} (84%)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
 rename Documentation/devicetree/bindings/sound/{tas2764.yaml => tas27xx.yaml} (73%)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8940.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8731.txt
 create mode 100644 drivers/firmware/mtk-adsp-ipc.c
 create mode 100644 include/dt-bindings/sound/cs35l45.h
 rename include/linux/{platform_data/dma-imx.h => dma/imx-dma.h} (67%)
 create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
 create mode 100644 include/sound/sof/ext_manifest4.h
 create mode 100644 include/sound/sof/ipc4/header.h
 create mode 100644 include/uapi/sound/intel/avs/tokens.h
 create mode 100644 sound/soc/codecs/cs35l45-i2c.c
 create mode 100644 sound/soc/codecs/cs35l45-spi.c
 create mode 100644 sound/soc/codecs/cs35l45-tables.c
 create mode 100644 sound/soc/codecs/cs35l45.c
 create mode 100644 sound/soc/codecs/cs35l45.h
 create mode 100644 sound/soc/codecs/max98396.c
 create mode 100644 sound/soc/codecs/max98396.h
 create mode 100644 sound/soc/codecs/wm8731-i2c.c
 create mode 100644 sound/soc/codecs/wm8731-spi.c
 create mode 100644 sound/soc/intel/avs/apl.c
 create mode 100644 sound/soc/intel/avs/board_selection.c
 create mode 100644 sound/soc/intel/avs/path.c
 create mode 100644 sound/soc/intel/avs/path.h
 create mode 100644 sound/soc/intel/avs/pcm.c
 create mode 100644 sound/soc/intel/avs/skl.c
 create mode 100644 sound/soc/intel/avs/topology.c
 create mode 100644 sound/soc/intel/avs/topology.h
 create mode 100644 sound/soc/intel/avs/trace.c
 create mode 100644 sound/soc/intel/avs/trace.h
 delete mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
 rename sound/soc/mediatek/mt8195/{mt8195-mt6359-rt1019-rt5682.c => mt8195-mt6359.c} (78%)
 create mode 100644 sound/soc/soc-utils-test.c
 create mode 100644 sound/soc/sof/intel/hda-common-ops.c
 create mode 100644 sound/soc/sof/ipc3-dtrace.c
 create mode 100644 sound/soc/sof/ipc3-loader.c
 delete mode 100644 sound/soc/sof/ipc3-ops.h
 create mode 100644 sound/soc/sof/ipc3-priv.h
 create mode 100644 sound/soc/sof/ipc4-loader.c
 create mode 100644 sound/soc/sof/ipc4-priv.h
 create mode 100644 sound/soc/sof/ipc4.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-clk.h
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186.h
 create mode 100644 sound/soc/sof/mediatek/mtk-adsp-common.c
 create mode 100644 sound/soc/sof/mediatek/mtk-adsp-common.h
 create mode 100644 sound/soc/tegra/tegra186_asrc.c
 create mode 100644 sound/soc/tegra/tegra186_asrc.h

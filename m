Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA88826664
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 23:38:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E8B41CF;
	Sun,  7 Jan 2024 23:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E8B41CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704667129;
	bh=dOOPuEPZXs4tPrlXgZyBscLruW2cOJ6PQhpYdvL9U3g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mSflLwclKaI/tXV2Eje0aFnHqGusgya2Fj2+Vcm3Dd59kSV7+p7COXQjOWr0a9NBH
	 m1BGA88MlsYQRUwTEYTMmRBZtE8wNjx0znMkeyQvAm5eXOJ3ZcexJq4uLiLGncnxFY
	 Qpyguq8MFn7XbPEsnC1cmQVkvqrK+T1penjGl7KA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D37AFF8055C; Sun,  7 Jan 2024 23:38:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5330DF8057D;
	Sun,  7 Jan 2024 23:38:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8CC8F80254; Sun,  7 Jan 2024 23:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FF93F800F5
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 23:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF93F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V2Kq9SPY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A8D4CCE0E30;
	Sun,  7 Jan 2024 22:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4C4C433C8;
	Sun,  7 Jan 2024 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704667050;
	bh=dOOPuEPZXs4tPrlXgZyBscLruW2cOJ6PQhpYdvL9U3g=;
	h=From:To:Cc:Subject:Date:From;
	b=V2Kq9SPYnsNpDNGZrdESZ1Am/18gdtFE6diYitoq3DM5rn0pz+roxOFUWch7hlJ6c
	 qeVNEd+XRcalQclVCGpjCg94W/VpC9JkdylAfglUKcEsL8dbw7GxSl8b8Y3zQMGJlW
	 yBQ1x0OW14Szb2iUD2ph7l5Ao1HyfZtWbGx0BqSW3eqLegd9/LKE0zB/UxdmKnk+e5
	 CaYJmYn0ycD0zhInil3GGkQUFfQiH3JUTqNB30YktqitueXRuWJEpO7/L1y3OUZlEH
	 M4Ri3fnKydfH2DXIDtuf/kR11GJgKOJPfe+SMwTWw7Ktam81OJ8Bt/ojaImej4uOgS
	 EfG+WVdoGxvCw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.8
Date: Sun, 07 Jan 2024 22:37:21 +0000
Message-Id: <20240107223730.5D4C4C433C8@smtp.kernel.org>
Message-ID-Hash: G5MQCROFT34WTU3U6WWXSQMA6RXIDTOK
X-Message-ID-Hash: G5MQCROFT34WTU3U6WWXSQMA6RXIDTOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5MQCROFT34WTU3U6WWXSQMA6RXIDTOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.8

for you to fetch changes up to 67508b874844b80ac49f70b78d67036c28b9fe7e:

  ASoC: pxa: sspa: Don't select SND_ARM (2023-12-29 17:41:15 +0000)

----------------------------------------------------------------
ASoC: Updates for v6.8

This is a relatively quiet release, there's a lot of driver specific
changes and the usual high level of activity in the SOF core but the
one big core change was Mormioto-san's work to support more N:M
CPU:CODEC mapping cases.  Highlights include:

 - Enhanced support for N:M CPU:CODEC mappings in the core and in
   audio-graph-card2.
 - Support for falling back to older SOF IPC versions where firmware for
   new versions is not available.
 - Support for notification of control changes generated by SOF firmware
   with IPC4.
 - Device tree support for describing parts of the card which can be
   active over suspend (for very low power playback or wake word use
   cases).
 - ACPI parsing support for the ES83xx driver, reducing the number of
   quirks neede for x86 systems.
 - Support for more AMD and Intel systems, NXP i.MX8m MICFIL, Qualcomm
   SM8250, SM8550, SM8650 and X1E80100.
 - Removal of Freescale MPC8610 support, the SoC is no longer supported
   by Linux.

----------------------------------------------------------------
Amadeusz Sławiński (18):
      ASoC: Intel: avs: da7219: Add proper id_table
      ASoC: Intel: avs: dmic: Add proper id_table
      ASoC: Intel: avs: es8336: Add proper id_table
      ASoC: Intel: avs: hdaudio: Add proper id_table
      ASoC: Intel: avs: i2s_test: Add proper id_table
      ASoC: Intel: avs: max98357a: Add proper id_table
      ASoC: Intel: avs: max98373: Add proper id_table
      ASoC: Intel: avs: max98927: Add proper id_table
      ASoC: Intel: avs: nau8825: Add proper id_table
      ASoC: Intel: avs: probe: Add proper id_table
      ASoC: Intel: avs: rt274: Add proper id_table
      ASoC: Intel: avs: rt286: Add proper id_table
      ASoC: Intel: avs: rt298: Add proper id_table
      ASoC: Intel: avs: rt5514: Add proper id_table
      ASoC: Intel: avs: rt5663: Add proper id_table
      ASoC: Intel: avs: rt5682: Add proper id_table
      ASoC: Intel: avs: ssm4567: Add proper id_table
      ASoC: dapm: Simplify widget clone

Arnd Bergmann (1):
      ASoC: fsl_rpmsg: update Kconfig dependencies

Baofeng Tian (3):
      ASoC: SOF: ipc4-topology: Add module ID print during module set up
      ASoC: SOF: align topology header file with sof topology header
      ASoC: SOF: add alignment for topology header file struct definition

Bard Liao (7):
      ASoC: Intel: sof_maxim_common: add else between 2 if test
      ASoC: Intel: sof_maxim_common: check return value
      ASoC: SOF: ipc4: check return value of snd_sof_ipc_msg_data
      ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and cs35l56 support
      ASoC: Intel: sof_sdw_rt_sdca_jack_common: ctx->headset_codec_dev = NULL
      ASoC: Intel: sof_sdw_rt_sdca_jack_common: check ctx->headset_codec_dev instead of playback
      ASoC: SOF: topology: Use partial match for disconnecting DAI link and DAI widget

Brent Lu (27):
      ASoC: Intel: sof_ssp_amp: remove dead code
      ASoC: Intel: ssp-common: get codec name function
      ASoC: Intel: board_helpers: support codec link initialization
      ASoC: Intel: sof_cs42l42: use common module for codec link
      ASoC: Intel: sof_nau8825: use common module for codec link
      ASoC: Intel: sof_rt5682: use common module for codec link
      ASoC: Intel: board_helpers: support amp link initialization
      ASoC: Intel: sof_cs42l42: use common module for amp link
      ASoC: Intel: sof_nau8825: use common module for amp link
      ASoC: Intel: sof_rt5682: use common module for amp link
      ASoC: Intel: sof_ssp_amp: use common module for amp link
      ASoC: Intel: sof_ssp_amp: rename function parameter
      ASoC: Intel: board_helpers: support BT offload link initialization
      ASoC: Intel: sof_cs42l42: use common module for BT offload link
      ASoC: Intel: sof_nau8825: use common module for BT offload link
      ASoC: Intel: sof_rt5682: use common module for BT offload link
      ASoC: Intel: sof_ssp_amp: use common module for BT offload link
      ASoC: Intel: sof_ssp_amp: simplify HDMI-In quirks
      ASoC: Intel: board_helpers: support HDMI-In link initialization
      ASoC: Intel: sof_rt5682: use common module for HDMI-In link
      ASoC: Intel: sof_ssp_amp: use common module for HDMI-In link
      ASoC: Intel: board_helpers: support DAI link array generation
      ASoC: Intel: sof_nau8825: use common module for DAI link generation
      ASoC: Intel: sof_rt5682: use common module for DAI link generation
      ASoC: Intel: sof_nau8825: board id cleanup for adl boards
      ASoC: Intel: sof_nau8825: board id cleanup for rpl boards
      ASoC: Intel: glk_rt5682_max98357a: fix board id mismatch

Chancel Liu (4):
      ASoC: dt-bindings: sound-card-common: List sound widgets ignoring system suspend
      ASoC: imx-rpmsg: Force codec power on in low power audio mode
      ASoC: dt-bindings: fsl,mqs: Convert format to json-schema
      ASoC: soc-pcm.c: Complete the active count for components without DAIs

Chao Song (6):
      ASoC: Intel: sof_sdw: remove unused function declaration
      ASoC: Intel: sof_sdw: Add rt722 support
      ASoC: Intel: soc-acpi: add Gen4.1 SDCA board support for LNL RVP
      ASoC: Intel: soc-acpi-intel-mtl-match: Add rt722 support
      ASoC: Intel: cht_bsw_rt5672: check return value
      ASoC: rt722-sdca: Set lane_control_support for multilane

Charles Keepax (3):
      ASoC: cs42l43: Add missing static from runtime PM ops
      ASoC: cs42l43: Allow HP amp to cool off after current limit
      ASoC: cs42l43: Add missing statics for hp_ilimit functions

Chen-Yu Tsai (1):
      ASoC: SOF: Move sof_of_machine_select() to core.c from sof-of-dev.c

Christophe JAILLET (3):
      ASoC: tegra: convert not to use dma_request_slave_channel()
      ASoC: sh: convert not to use dma_request_slave_channel()
      ASoC: sprd: Simplify memory allocation in sprd_platform_compr_dma_config()

Colin Ian King (2):
      ASoC: core: Fix a handful of spelling mistakes.
      ASoC: cs4271: Fix spelling mistake "retrieveing" -> "retrieving"

Cristian Ciocaltea (6):
      ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
      ASoC: amd: vangogh: Drop conflicting ACPI-based probing
      ASoC: amd: vangogh: Allow probing ACP PCI when SOF is disabled
      ASoC: amd: vangogh: Switch to {RUNTIME,SYSTEM_SLEEP}_PM_OPS
      ASoC: amd: acp-config: Add missing MODULE_DESCRIPTION
      ASoC: amd: acp: Add missing MODULE_DESCRIPTION in mach-common

Curtis Malainey (1):
      ASoC: SOF: Wire up buffer flags

Dan Carpenter (2):
      ASoC: amd: acp: remove unnecessary NULL check
      ASoC: audio-graph-card2: fix off by one in graph_parse_node_multi_nm()

Daniel Baluta (4):
      ASoC: SOF: imx8m: Add DAI driver entry for MICFIL PDM
      ASoC: SOF: Add support for configuring PDM interface from topology
      ASoC: audio-graph-card2: Introduce playback-only/capture-only DAI link flags
      ASoC: dt-bindings: audio-graph-port: Document new DAI link flags playback-only/capture-only

Daniel Golle (1):
      ASoC: mediatek: mt7986: silence error in case of -EPROBE_DEFER

David Lin (1):
      ASoC: nau8810: Fix incorrect type in assignment and cast to restricted __be16

Duje Mihanović (1):
      ASoC: pxa: sspa: Don't select SND_ARM

Fabio Estevam (1):
      ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts

Gergo Koteles (1):
      ASoC: tas2781: add support for FW version 0x0503

Hans de Goede (9):
      ASoC: Intel: bytcht_es8316: Add is_bytcr helper variable
      ASoC: Intel: bytcht_es8316: Determine quirks/routing with codec-dev ACPI DSM
      ASoC: rt5645: Drop double EF20 entry from dmi_platform_data[]
      ASoC: rt5645: Add platform-data for Acer Switch V 10
      ASoC: rt5645: Refactor rt5645_parse_dt()
      ASoC: rt5645: Add rt5645_get_pdata() helper
      ASoC: rt5645: Add a rt5645_components() helper
      ASoC: rt5645: Add mono speaker information to the components string
      ASoC: Intel: cht_bsw_rt5645: Set card.components string

Himanshu Bhavani (1):
      ASoC: amd: acp: Remove redundant ret variable

Jack Yu (1):
      ASoC: rt5682s: Add LDO output selection for dacref

Kamil Duljas (1):
      ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage

Keguang Zhang (1):
      ASoC: sti-uniperf: Use default pcm_config instead

Krzysztof Kozlowski (21):
      ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
      ASoC: dt-bindings: use "soundwire" as controller's node name in examples
      ASoC: dt-bindings: correct white-spaces in examples
      ASoC: qcom: Add helper for allocating Soundwire stream runtime
      ASoC: qcom: Move Soundwire runtime stream alloc to soundcards
      ASoC: qcom: sc8280xp: set card driver name from match data
      ASoC: qcom: sc8280xp: Add support for SM8450 and SM8550
      ASoC: qcom: audioreach: Commonize setting channel mappings
      ASoC: qcom: audioreach: drop duplicate channel defines
      ASoC: qcom: audioreach: Add 4 channel support
      ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650 LPASS RX
      ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8650 LPASS TX
      ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8650 LPASS VA
      ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8650 LPASS WSA
      ASoC: qcom: Add x1e80100 sound machine driver
      ASoC: dt-bindings: qcom,sm8250: Add X1E80100 sound card
      ASoC: qcom: Fix trivial code style issues
      ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS RX
      ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS TX
      ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS VA
      ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS WSA

Kuninori Morimoto (10):
      ASoC: makes CPU/Codec channel connection map more generic
      ASoC: audio-graph-card2: use better image for Multi connection
      ASoC: audio-graph-card2: add CPU:Codec = N:M support
      ASoC: audio-graph-card2-custom-sample: Add connection image
      ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
      ASoC: fsl: fsl-asoc-card: don't need DUMMY Platform
      ASoC: samsung: odroid: don't need DUMMY Platform
      ASoC: intel: hdaudio.c: use snd_soc_dummy_dlc
      ASoC: sof: use snd_soc_dummy_dlc
      ASoC: soc.h: don't create dummy Component via COMP_DUMMY()

Lad Prabhakar (1):
      ASoC: dt-bindings: renesas,rz-ssi: Document RZ/Five SoC

Linus Walleij (20):
      ASoC: cs35l32: Drop legacy include
      ASoC: cs35l33: Fix GPIO name and drop legacy include
      ASoC: cs35l34: Fix GPIO name and drop legacy include
      ASoC: cs35l35: Drop legacy includes
      ASoC: cs35l36: Drop legacy includes
      ASoC: cs4271: Convert to GPIO descriptors
      ASoC: cirrus: edb93xx: Drop legacy include
      ASoC: cs42l42: Drop legacy include
      ASoC: cs43130: Drop legacy includes
      ASoC: cs4349: Drop legacy include
      ASoC: wm0010: Convert to GPIO descriptors
      ASoC: wm1250-ev1: Convert to GPIO descriptors
      ASoC: wm2200: Convert to GPIO descriptors
      ASoC: wm5100: Convert to GPIO descriptors
      ASoC: wm8996: Convert to GPIO descriptors
      ASoC: wm1250-ev1: Fix uninitialized ret
      ASoC: hisilicon: Drop GPIO include
      ASoC: qcom: sc7180: Drop GPIO include
      ASoC: simple-card-utils: Drop GPIO include
      ASoC: tegra: tegra20_ac97: Convert to use GPIO descriptors

Lucas Tanure (1):
      ASoC: fsl_mqs: Remove duplicate linux/of.h header

Mac Chiang (2):
      ASoC: Intel: sof_rt5682: add mtl_rt5650 support
      ASoC: Intel: soc-acpi: rt713+rt1316, no sdw-dmic config

Maciej Strozek (5):
      ASoC: cs43130: Store device in private struct and use it more consistently
      ASoC: cs43130: Add handling of ACPI
      ASoC: cs43130: Add switch to control normal and alt hp inputs
      ASoC: cs43130: Allow driver to work without IRQ connection
      ASoC: cs43130: Allow configuration of bit clock and frame inversion

Mark Brown (22):
      Add DMIC slew rate controls
      ASoC: SOF: mediatek: remove unused variables
      ASoC: Intel: avs: Properly identify boards
      ASoC: SOF: Add support for MICFIL PDM interface
      ASoC: codecs: ES8326
      ASoC: cs43130: Fixes and improvements
      ASoC: SOF: ipc4: Add support for control change
      ASoC: makes CPU/Codec channel connection map more
      ASoC: Intel: Link handling rework and fixes
      ASoC: Intel: Soundwire related board and match updates
      ASoC: SOF: IPC path handling and fallback support
      ASoC: Convert Cirrus codecs to GPIO descriptors
      ASoC: Intel: bytcht_es8316: Determine
      ASoC: Intel: machine driver updates
      ASoC: SOF: topology cleanups
      GPIO descriptor cleanup for some Wolfson codecs
      ASoC: SOF: query FW config to reload library
      GPIO inclusion fixes to misc sound drivers
      ASoC: don't use original dummy dlc
      Improve AMD ACP Vangogh audio support for Steam Deck
      add es8326 dt-bindings, commonize headset codec
      ASoC: qcom: add sound card support for SM8650

Michael Ellerman (1):
      ASoC: fsl: mpc8610_hpcd: Remove unused driver

Neil Armstrong (4):
      ASoC: codec: wsa884x: make use of new mute_unmute_on_trigger flag
      ASoC: dt-bindings: qcom,sm8250: document SM8650 sound card
      ASoC: qcom: sc8280xp: Add support for SM8650
      ASoC: dt-bindings: qcom,lpass-va-macro: remove spurious contains in if statement

Peter Ujfalusi (21):
      ASoC: SOF: ipc4-topology: Helper to find an swidget by module/instance id
      ASoC: SOF: ipc4: Add data struct for module notification message from firmware
      ASoC: SOF: ipc4-control: Implement control update for switch/enum controls
      ASoC: SOF: ipc4: Handle ALSA kcontrol change notification from firmware
      ASoC: SOF: Intel: Use existing helpers to change GPROCEN and PIE bits
      ASoC: Intel: sof_sdw: Make use of dev_err_probe()
      ASoC: SOF: Move sof_of_machine_select() to sof-of-dev.c from sof-audio.c
      ASoC: SOF: Move sof_machine_* functions from sof-audio.c to core.c
      ASoC: SOF: Add placeholder for platform IPC type and path overrides
      ASoC: SOF: sof-acpi-dev: Save the default IPC type and path overrides
      ASoC: SOF: sof-of-dev: Save the default IPC type and path overrides
      ASoC: SOF: sof-pci-dev: Save the default IPC type and path overrides
      ASoC: SOF: core: Implement firmware, topology path setup in core
      ASoC: SOF: sof-acpi-dev: Rely on core to create the file paths
      ASoC: SOF: sof-of-dev: Rely on core to create the file paths
      ASoC: SOF: sof-pci-dev: Rely on core to create the file paths
      ASoC: SOF: core: Add helper for initialization of paths, ops
      ASoC: SOF: Intel: Do not use resource managed allocation for ipc4_data
      ASoC: SOF: core: Implement IPC version fallback if firmware files are missing
      ASoC: SOF: ipc4: Move window offset configuration earlier
      ASoC: SOF: Intel: hda-codec: Delay the codec device registration

Pierre-Louis Bossart (2):
      ASoC: es83xx: add ACPI DSM helper module
      ASoC: Intel: bytcht_es8316: Dump basic _DSM information

Rander Wang (4):
      ASoC: SOF: Intel: lnl: add core get and set support for dsp core
      ASoC: SOF: IPC4: synchronize fw_config_params with fw definitions
      ASoC: SOF: IPC4: query fw_context_save feature from fw
      ASoC: SOF: Intel: check fw_context_save for library reload

Richard Fitzgerald (1):
      ASoC: Intel: sof_sdw_cs_amp: Connect outputs to a speaker widget

Rob Herring (1):
      ASoC: dt-bindings: Simplify port schema

Rui Zhou (4):
      ASoC: dt-bindings: mt8188-mt6359: add es8326 support
      ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
      ASoC: mediatek: mt8188-mt6359: add es8326 support
      ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

Sebastian Reichel (1):
      dt-bindings: es8328: convert to DT schema format

Seven Lee (2):
      ASoC: dt-bindings: nau8821: Add DMIC slew rate.
      ASoC: nau8821: Add slew rate controls.

Shengjiu Wang (1):
      ASoC: SOF: imx: Add SNDRV_PCM_INFO_BATCH flag

Shuming Fan (1):
      ASoC: rt5663: cancel the work when system suspends

Syed Saba Kareem (5):
      ASoC: amd: acp: Fix for indentation issue
      ASoC: amd: acp: correct the format order
      ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
      ASoC: amd: acp: add missing SND_SOC_AMD_ACP_LEGACY_COMMON flag for ACP70
      ASoC: amd: acp: add pm ops support for renoir platform.

Trevor Wu (3):
      ASoC: SOF: mediatek: mt8195: clean up unused code
      ASoC: SOF: mediatek: mt8186: clean up unused code
      ASoC: SOF: mediatek: remove unused variables

Venkata Prasad Potturu (13):
      ASoC: amd: Add new dmi entries for acp5x platform
      ASoC: amd: vangogh: Add condition check for acp config flag
      ASoC: amd: Remove extra dmi parameter
      ASoC: amd: acp: Add new cpu dai and dailink creation for I2S BT instance
      ASoC: amd: acp: Add i2s bt support for nau8821-max card
      ASoC: amd: acp: Enable dpcm_capture for MAX98388 codec
      ASoC: amd: acp: Set bclk as source to set pll for rt5682s codec
      ASoC: amd: acp: Set bclk as source to set pll for rt5682s codec
      ASoC: SOF: amd: Refactor spinlock_irq(&sdev->ipc_lock) sequence in irq_handler
      ASoC: SOF: Refactor sof_i2s_tokens reading to update acpbt dai
      ASoC: SOF: Add i2s bt dai configuration support for AMD platforms
      ASoC: SOF: Rename amd_bt sof_dai_type
      ASoC: SOF: amd: Add acp-psp mailbox interface for iram-dram fence register modification

Vijendar Mukunda (1):
      ASoC: amd: acp: modify config flag read logic

Wang Jinchao (2):
      ASoC: SOF: amd: remove duplicated including
      ASoC: fsl_mqs: remove duplicated including

Weidong Wang (1):
      ASoC: codecs: Modify the bin file parsing method

Yong Zhi (1):
      ASoC: SOF: Intel: mtl: call dsp dump when boot retry fails

Zhu Ning (3):
      ASoC: codecs: ES8326: Add chip version flag
      ASoC: codecs: ES8326: Changing initialisation and broadcasting
      ASoC: codecs: ES8326: Changing the headset detection time

 .../devicetree/bindings/sound/adi,max98363.yaml    |   2 +-
 .../bindings/sound/audio-graph-port.yaml           |   6 +
 Documentation/devicetree/bindings/sound/es8328.txt |  38 --
 .../devicetree/bindings/sound/everest,es8328.yaml  |  77 ++++
 .../devicetree/bindings/sound/fsl,mqs.txt          |  36 --
 .../devicetree/bindings/sound/fsl,mqs.yaml         | 105 +++++
 .../devicetree/bindings/sound/fsl,xcvr.yaml        |  22 +-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |   1 +
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml |   9 +
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  23 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  25 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  18 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  23 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   6 +
 .../devicetree/bindings/sound/qcom,wcd934x.yaml    |   4 +-
 .../bindings/sound/qcom,wcd938x-sdw.yaml           |   4 +-
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |   4 +-
 .../devicetree/bindings/sound/qcom,wsa883x.yaml    |   2 +-
 .../devicetree/bindings/sound/qcom,wsa8840.yaml    |   2 +-
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |  36 +-
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |   2 +-
 .../bindings/sound/sound-card-common.yaml          |   7 +
 .../bindings/sound/ti,tlv320aic32x4.yaml           |   2 +-
 Documentation/sound/soc/dapm.rst                   |   2 +-
 MAINTAINERS                                        |   1 -
 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi      |   2 +-
 arch/arm/mach-ep93xx/edb93xx.c                     |  32 +-
 arch/arm/mach-ep93xx/vision_ep9307.c               |  12 +-
 arch/arm/mach-s3c/mach-crag6410-module.c           |  60 ++-
 arch/arm/mach-s3c/mach-crag6410.c                  |  24 +-
 drivers/soundwire/qcom.c                           |  33 +-
 include/sound/cs4271.h                             |   1 -
 include/sound/rt5682s.h                            |   8 +
 include/sound/simple_card_utils.h                  |   3 +
 include/sound/soc.h                                |  58 ++-
 include/sound/sof.h                                |  15 +
 include/sound/sof/dai-imx.h                        |   7 +
 include/sound/sof/dai.h                            |   2 +
 include/sound/sof/ipc4/header.h                    |  35 ++
 include/sound/sof/topology.h                       |  61 +--
 include/sound/wm0010.h                             |   6 -
 include/sound/wm1250-ev1.h                         |  24 --
 include/sound/wm2200.h                             |   2 -
 include/sound/wm5100.h                             |   4 -
 include/sound/wm8996.h                             |   3 -
 include/uapi/sound/sof/tokens.h                    |   5 +
 sound/soc/amd/acp-config.c                         |  39 +-
 sound/soc/amd/acp/Kconfig                          |  13 +
 sound/soc/amd/acp/Makefile                         |   2 +
 sound/soc/amd/acp/acp-mach-common.c                |  59 ++-
 sound/soc/amd/acp/acp-mach.h                       |   3 +
 sound/soc/amd/acp/acp-renoir.c                     |  37 ++
 sound/soc/amd/acp/acp-sof-mach.c                   |   4 +-
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      |   3 +-
 sound/soc/amd/acp/acp63.c                          |  22 +-
 sound/soc/amd/acp/acp70.c                          |  28 +-
 sound/soc/amd/vangogh/acp5x-mach.c                 |  35 +-
 sound/soc/amd/vangogh/pci-acp5x.c                  |  22 +-
 sound/soc/cirrus/edb93xx.c                         |   1 -
 sound/soc/codecs/Kconfig                           |   4 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/aw88395/aw88395_device.h          |   1 +
 sound/soc/codecs/aw88395/aw88395_lib.c             | 124 ++----
 sound/soc/codecs/aw88395/aw88395_reg.h             |   3 -
 sound/soc/codecs/aw88399.c                         |   1 -
 sound/soc/codecs/aw88399.h                         |   1 +
 sound/soc/codecs/cs35l32.c                         |   1 -
 sound/soc/codecs/cs35l33.c                         |   4 +-
 sound/soc/codecs/cs35l34.c                         |   4 +-
 sound/soc/codecs/cs35l35.c                         |   2 -
 sound/soc/codecs/cs35l36.c                         |   3 +-
 sound/soc/codecs/cs4271.c                          |  39 +-
 sound/soc/codecs/cs42l42.c                         |   1 -
 sound/soc/codecs/cs42l42.h                         |   2 +-
 sound/soc/codecs/cs42l43-jack.c                    |   4 +-
 sound/soc/codecs/cs42l43.c                         |  92 ++++-
 sound/soc/codecs/cs42l43.h                         |   9 +
 sound/soc/codecs/cs43130.c                         | 326 +++++++++------
 sound/soc/codecs/cs43130.h                         |   3 +
 sound/soc/codecs/cs4349.c                          |   1 -
 sound/soc/codecs/es8326.c                          | 231 ++++++-----
 sound/soc/codecs/es83xx-dsm-common.c               |  89 ++++
 sound/soc/codecs/es83xx-dsm-common.h               | 393 ++++++++++++++++++
 sound/soc/codecs/nau8810.c                         |   9 +-
 sound/soc/codecs/nau8821.c                         |   7 +
 sound/soc/codecs/nau8821.h                         |   3 +
 sound/soc/codecs/rt5645.c                          | 111 +++--
 sound/soc/codecs/rt5645.h                          |   3 +
 sound/soc/codecs/rt5663.c                          |  11 +
 sound/soc/codecs/rt5682s.c                         |  23 ++
 sound/soc/codecs/rt5682s.h                         |   7 +
 sound/soc/codecs/rt722-sdca-sdw.c                  |   3 +
 sound/soc/codecs/tas2781-fmwlib.c                  |   1 +
 sound/soc/codecs/wm0010.c                          |  44 +-
 sound/soc/codecs/wm1250-ev1.c                      | 119 ++----
 sound/soc/codecs/wm2200.c                          |  67 ++-
 sound/soc/codecs/wm5100.c                          | 107 ++---
 sound/soc/codecs/wm8996.c                          |  58 ++-
 sound/soc/codecs/wsa884x.c                         |   7 +-
 sound/soc/fsl/Kconfig                              |  14 +-
 sound/soc/fsl/Makefile                             |   4 -
 sound/soc/fsl/fsl-asoc-card.c                      |   3 +-
 sound/soc/fsl/fsl_mqs.c                            |   2 -
 sound/soc/fsl/imx-rpmsg.c                          |  61 ++-
 sound/soc/fsl/mpc8610_hpcd.c                       | 451 ---------------------
 sound/soc/generic/audio-graph-card.c               |   1 -
 .../generic/audio-graph-card2-custom-sample.dtsi   | 380 +++++++++++++++--
 sound/soc/generic/audio-graph-card2.c              | 284 ++++++++++---
 sound/soc/generic/simple-card-utils.c              |  20 +-
 sound/soc/hisilicon/hi6210-i2s.c                   |   1 -
 sound/soc/intel/avs/boards/da7219.c                |  10 +-
 sound/soc/intel/avs/boards/dmic.c                  |  10 +-
 sound/soc/intel/avs/boards/es8336.c                |  10 +-
 sound/soc/intel/avs/boards/hdaudio.c               |  16 +-
 sound/soc/intel/avs/boards/i2s_test.c              |  10 +-
 sound/soc/intel/avs/boards/max98357a.c             |  10 +-
 sound/soc/intel/avs/boards/max98373.c              |  10 +-
 sound/soc/intel/avs/boards/max98927.c              |  10 +-
 sound/soc/intel/avs/boards/nau8825.c               |  10 +-
 sound/soc/intel/avs/boards/probe.c                 |  10 +-
 sound/soc/intel/avs/boards/rt274.c                 |  10 +-
 sound/soc/intel/avs/boards/rt286.c                 |  10 +-
 sound/soc/intel/avs/boards/rt298.c                 |  10 +-
 sound/soc/intel/avs/boards/rt5514.c                |  10 +-
 sound/soc/intel/avs/boards/rt5663.c                |  10 +-
 sound/soc/intel/avs/boards/rt5682.c                |  10 +-
 sound/soc/intel/avs/boards/ssm4567.c               |  10 +-
 sound/soc/intel/boards/Kconfig                     |   2 +
 sound/soc/intel/boards/Makefile                    |   3 +-
 sound/soc/intel/boards/bytcht_es8316.c             |  71 +++-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |   8 +
 sound/soc/intel/boards/cht_bsw_rt5672.c            |   8 +-
 sound/soc/intel/boards/sof_board_helpers.c         | 330 +++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h         |  31 ++
 sound/soc/intel/boards/sof_cs42l42.c               | 229 +++--------
 sound/soc/intel/boards/sof_maxim_common.c          |  13 +-
 sound/soc/intel/boards/sof_nau8825.c               | 270 +++---------
 sound/soc/intel/boards/sof_rt5682.c                | 337 +++++----------
 sound/soc/intel/boards/sof_sdw.c                   |  60 ++-
 sound/soc/intel/boards/sof_sdw_common.h            |  18 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c            |  30 +-
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c        |  97 +++++
 .../soc/intel/boards/sof_sdw_rt_sdca_jack_common.c |  15 +-
 sound/soc/intel/boards/sof_ssp_amp.c               | 160 +++-----
 sound/soc/intel/boards/sof_ssp_common.c            |  21 +
 sound/soc/intel/boards/sof_ssp_common.h            |   1 +
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   8 +-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c  |  14 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |  71 ++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |  86 ++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |   6 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |  78 ++++
 sound/soc/mediatek/Kconfig                         |   1 +
 sound/soc/mediatek/mt7986/mt7986-wm8960.c          |   2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          | 125 +++---
 sound/soc/pxa/Kconfig                              |   1 -
 sound/soc/qcom/Kconfig                             |  12 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/apq8016_sbc.c                       |   2 +-
 sound/soc/qcom/apq8096.c                           |   2 +-
 sound/soc/qcom/common.c                            |   2 +-
 sound/soc/qcom/lpass-apq8016.c                     |   2 +-
 sound/soc/qcom/lpass-cpu.c                         |   2 +-
 sound/soc/qcom/lpass-hdmi.c                        |   2 +-
 sound/soc/qcom/lpass-ipq806x.c                     |   2 +-
 sound/soc/qcom/lpass-platform.c                    |   2 +-
 sound/soc/qcom/lpass-sc7180.c                      |   2 +-
 sound/soc/qcom/lpass.h                             |   2 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |  55 +--
 sound/soc/qcom/qdsp6/audioreach.h                  |   2 -
 sound/soc/qcom/qdsp6/q6afe.c                       |   8 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   4 +-
 sound/soc/qcom/qdsp6/q6asm.h                       |  20 +-
 sound/soc/qcom/qdsp6/topology.c                    |   3 +-
 sound/soc/qcom/sc7180.c                            |   3 +-
 sound/soc/qcom/sc8280xp.c                          |  24 +-
 sound/soc/qcom/sdm845.c                            |   2 +-
 sound/soc/qcom/sdw.c                               |  47 ++-
 sound/soc/qcom/sdw.h                               |   1 +
 sound/soc/qcom/sm8250.c                            |  17 +-
 sound/soc/qcom/storm.c                             |   2 +-
 sound/soc/qcom/x1e80100.c                          | 168 ++++++++
 sound/soc/samsung/odroid.c                         |   3 +-
 sound/soc/sh/fsi.c                                 |   4 +-
 sound/soc/soc-core.c                               | 127 +++++-
 sound/soc/soc-dapm.c                               |  75 ++--
 sound/soc/soc-pcm.c                                |  52 +--
 sound/soc/sof/Kconfig                              |  11 +
 sound/soc/sof/Makefile                             |   3 +-
 sound/soc/sof/amd/acp-common.c                     |   1 -
 sound/soc/sof/amd/acp-ipc.c                        |   4 +-
 sound/soc/sof/amd/acp.c                            |  14 +
 sound/soc/sof/amd/acp.h                            |   5 +
 sound/soc/sof/core.c                               | 311 ++++++++++++--
 sound/soc/sof/fw-file-profile.c                    | 322 +++++++++++++++
 sound/soc/sof/imx/imx8.c                           |   1 +
 sound/soc/sof/imx/imx8m.c                          |   8 +
 sound/soc/sof/imx/imx8ulp.c                        |   1 +
 sound/soc/sof/intel/apl.c                          |   2 +-
 sound/soc/sof/intel/cnl.c                          |   2 +-
 sound/soc/sof/intel/hda-codec.c                    |  18 +-
 sound/soc/sof/intel/hda-dai.c                      |   3 +
 sound/soc/sof/intel/hda-loader.c                   |  10 +-
 sound/soc/sof/intel/hda.c                          |   6 +-
 sound/soc/sof/intel/icl.c                          |   2 +-
 sound/soc/sof/intel/lnl.c                          |   8 +-
 sound/soc/sof/intel/mtl.c                          |  23 +-
 sound/soc/sof/intel/mtl.h                          |   3 +
 sound/soc/sof/intel/skl.c                          |   2 +-
 sound/soc/sof/intel/tgl.c                          |   4 +-
 sound/soc/sof/ipc3-dtrace.c                        |   3 +-
 sound/soc/sof/ipc3-pcm.c                           |  11 +
 sound/soc/sof/ipc3-topology.c                      |  59 ++-
 sound/soc/sof/ipc4-control.c                       | 179 ++++++++
 sound/soc/sof/ipc4-loader.c                        |   3 +
 sound/soc/sof/ipc4-priv.h                          |   4 +
 sound/soc/sof/ipc4-topology.c                      |  32 +-
 sound/soc/sof/ipc4.c                               | 117 ++++--
 sound/soc/sof/mediatek/adsp_helper.h               |   4 -
 sound/soc/sof/mediatek/mt8186/mt8186.c             |  49 ---
 sound/soc/sof/mediatek/mt8195/mt8195.c             |  49 ---
 sound/soc/sof/sof-acpi-dev.c                       |  16 +-
 sound/soc/sof/sof-audio.c                          | 120 ------
 sound/soc/sof/sof-audio.h                          |   1 +
 sound/soc/sof/sof-client-probes.c                  |   4 +-
 sound/soc/sof/sof-of-dev.c                         |  13 +-
 sound/soc/sof/sof-pci-dev.c                        | 102 +----
 sound/soc/sof/sof-priv.h                           |   9 +-
 sound/soc/sof/topology.c                           |  10 +-
 sound/soc/sprd/sprd-pcm-compress.c                 |   6 +-
 sound/soc/sti/sti_uniperif.c                       |   7 +-
 sound/soc/tegra/tegra20_ac97.c                     |  55 ++-
 sound/soc/tegra/tegra20_ac97.h                     |   4 +-
 sound/soc/tegra/tegra_pcm.c                        |   4 +-
 234 files changed, 5757 insertions(+), 3054 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/es8328.txt
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8328.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.yaml
 delete mode 100644 include/sound/wm1250-ev1.h
 mode change 100644 => 100755 sound/soc/codecs/es8326.c
 create mode 100644 sound/soc/codecs/es83xx-dsm-common.c
 create mode 100644 sound/soc/codecs/es83xx-dsm-common.h
 delete mode 100644 sound/soc/fsl/mpc8610_hpcd.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt722_sdca.c
 create mode 100644 sound/soc/qcom/x1e80100.c
 create mode 100644 sound/soc/sof/fw-file-profile.c

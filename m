Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C94D73E0B3
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 15:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7DA3E72;
	Mon, 26 Jun 2023 15:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7DA3E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687786465;
	bh=cU0tzgk4caJ6Z5/8JWWIR2cRMT45BHGT+E/MzFJQ4ow=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d615UohVYzBtdnLs0FavtNsn78wAhE3qNhiWgL/Jg8cg78Qe7PJ2im8d+XLW6c5d0
	 c5wPWlPQVSVGoVOabiK5nObPwF4ju33EuhZqEebPJe5W/i5crIht9fTcZme85Z/ivI
	 8mA/XBJ4Au9dPLqg45V885XzRZ9D5M9rwUo+pJH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD327F8053B; Mon, 26 Jun 2023 15:33:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 997A3F8053B;
	Mon, 26 Jun 2023 15:33:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0D72F80548; Mon, 26 Jun 2023 15:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75CC1F80246
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 15:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CC1F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tqS2pKex
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4179160DF4;
	Mon, 26 Jun 2023 13:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC126C433C8;
	Mon, 26 Jun 2023 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687786370;
	bh=cU0tzgk4caJ6Z5/8JWWIR2cRMT45BHGT+E/MzFJQ4ow=;
	h=From:To:Cc:Subject:Date:From;
	b=tqS2pKex/jKRWYTKB0T0lfsLk70q7eVAwWYlt/45dmc4TjExokAmNFMAuSGmLm5Na
	 vqPYutlSvgtUpOY7QLNp2i39cAFqTsGHRx6Nh53zi3v2pJ42atnxD/cDFEVyl/KYcq
	 xVi/1YTd0me4wkxFNqjyX2C95YAybnKdSjhJ5sdz4NVOysmFQBzThTxJyssl9qXXF1
	 GIDQxed2m4j1s4xIMmoJwlW0axXUx2EAAG7W/Q+QfyIAHHOby/tfx//qZ4aLdOsK7+
	 p0x/9CSvS3NFpgocnxLx66WQ2cpnZ1rpbCTgPiF/xmJdnh9yyLYCNx5cK67V8SI3Z5
	 AYwZiuoVBQyRA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.5
Date: Mon, 26 Jun 2023 14:32:40 +0100
Message-Id: <20230626133249.DC126C433C8@smtp.kernel.org>
Message-ID-Hash: KH3QESVDLKA6MYZT6TFQGV76IIHBR3I3
X-Message-ID-Hash: KH3QESVDLKA6MYZT6TFQGV76IIHBR3I3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KH3QESVDLKA6MYZT6TFQGV76IIHBR3I3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 1f1ef7e5bbe2de125da413e238915f6047ea4ba2:

  ASoC: intel: sof_sdw: Fixup typo in device link checking (2023-06-19 12:58:22 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.5

for you to fetch changes up to 2d0cad0473bd1ffbc5842be0b9f2546265acb011:

  ASoC: core: Always store of_node when getting DAI link component (2023-06-23 22:09:00 +0100)

----------------------------------------------------------------
ASoC: Updates for v6.5

A fairly quiet release from a core and framework point of view, but a
very big one from the point of view of new drivers:

 - More refectoring from Morimoto-san, this time mainly around DAI
   links and how we control the ordering of trigger() callbacks.
 - Convert a lot of drivers to use maple tree based caches.
 - Lots of work on the x86 driver stack.
 - Compressed audio support for Qualcomm.
 - Support for AMD SoundWire, Analog Devices SSM3515, Google Chameleon,
   Ingenic X1000, Intel systems with various CODECs, Longsoon platforms,
   Maxim MAX98388, Mediatek MT8188, Nuvoton NAU8825C, NXP platforms with
   NAU8822, Qualcomm WSA884x, StarFive JH7110, Texas Instruments TAS2781.

----------------------------------------------------------------
Aidan MacDonald (2):
      ASoC: jz4740-i2s: Add support for X1000 SoC
      ASoC: ingenic: Add compatible string for X1000 SoC

Alexander Stein (1):
      ASoC: dt-bindings: tlv320aic32x4: convert to DT schema format

Amadeusz Sławiński (5):
      ASoC: topology: Log control load errors in soc_tplg_control_load()
      ASoC: topology: Remove redundant logs
      ASoC: topology: Do not split message string on multiple lines
      ASoC: topology: Remove redundant log
      ASoC: topology: Remove redundant log

AngeloGioacchino Del Regno (10):
      ASoC: SOF: mediatek: mt8195: Use snd_sof_ipc_process_reply() helper
      ASoC: SOF: mediatek: mt8186: Use snd_sof_ipc_process_reply() helper
      ASoC: mediatek: mt8195-afe-pcm: Clean up unnecessary functions
      ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM during probe
      ASoC: mediatek: mt8195-afe-pcm: Simplify with dev_err_probe()
      ASoC: mediatek: mt8192-mt6359: Remove " Jack" from Headphone pin name
      ASoC: mediatek: mt8188-mt6359: Compress of_device_id entries
      ASoC: mediatek: mt8188-mt6359: Cleanup return 0 disguised as return ret
      ASoC: mediatek: mt8188-mt6359: Clean up log levels
      ASoC: mediatek: mt8188-mt6359: Use bitfield macros for registers

Anup Sharma (2):
      ASoC: dt-bindings: nau8540: Convert to dtschema
      ASoC: dt-bindings: rt1016: Convert to dtschema

Arnd Bergmann (9):
      ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
      ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
      ASoC: mediatek: mt8188-mt6359: add i2c dependency
      ASoC: max98388: fix unused function warnings
      ASoC: loongson: fix unused PM function warning
      ASoC: loongson: add PCI dependency
      ASoC: loongson: fix compile testing on 32-bit
      ASoC: loongson: fix address space confusion
      ASoC: tas2781: fix Kconfig dependencies

Arun Gopal Kondaveeti (1):
      ASoC: amd: update pm_runtime enable sequence

Balamurugan C (3):
      ASoC: Intel: ADL: Enable HDMI-In capture feature support for non-I2S codec boards.
      ASoC: Intel: ADL: Moving amp only boards into end of the table.
      ASoC: Intel: Sof_ssp_amp: Correcting author name.

Bard Liao (21):
      ASoC: Intel: sof_sdw: remove SOF_SDW_TGL_HDMI for MeteorLake devices
      ASoC: Intel: sof_sdw: add quirk for MTL RVP
      ASoC: Intel: sof_sdw: start set codec init function with an adr index
      ASoC: Intel: sof_sdw: add missing exit callback
      ASoC: Intel: sof_sdw: add dai info
      ASoC: Intel: sof_sdw: use predefine dailink id
      ASoC: Intel: sof_sdw: add codec_info pointer
      ASoC: Intel: sdw_sof: append dai_type and remove codec_type
      ASoC: Intel: sof_sdw: add multi dailink support for a codec
      ASoC: Intel: sof_sdw_rt_sdca_jack_common: test SOF_JACK_JDSRC in _exit
      ASoC: Intel: sof_sdw: rename SOF_RT711_JDSRC to SOF_JACK_JDSRC
      ASoC: Intel: sof_sdw: make rt711_sdca be generic
      ASoC: Intel: sof_sdw: add rt712 support
      ASoC: Intel: soc-acpi-intel-tgl-match: add rt712 ID
      ASoC: Intel: soc-acpi-intel-mtl-match: add rt712 ID
      ASoC: Intel: sof_sdw: add rt713 support
      ASoC: Intel: sof_sdw: increase sdw pin index for each sdw link
      ASoC: add N cpus to M codecs dai link support
      ASoC: Intel: sof_sdw: add dai_link_codec_ch_map
      ASoC: SOF: sof-audio: add is_virtual_widget helper
      ASoC: SOF: sof-audio: test virtual widget in sof_walk_widgets_in_order

Brent Lu (12):
      ASoC: Intel: avs-da7219: remove redundant dapm routes
      ASoC: Intel: avs-dmic: remove redundant dapm routes
      ASoC: Intel: avs-hdaudio: remove redundant dapm routes
      ASoC: Intel: avs-max98357a: remove redundant dapm routes
      ASoC: Intel: avs-max98373: remove redundant dapm routes
      ASoC: Intel: avs-max98927: remove redundant dapm routes
      ASoC: Intel: avs-nau8825: remove redundant dapm routes
      ASoC: Intel: avs-rt274: remove redundant dapm routes
      ASoC: Intel: avs-rt286: remove redundant dapm routes
      ASoC: Intel: avs-rt298: remove redundant dapm routes
      ASoC: Intel: avs-rt5682: remove redundant dapm routes
      ASoC: Intel: avs-ssm4567: remove redundant dapm routes

Carlos Bilbao (1):
      ASoC: amd: ps: Update copyright notice

Chao Song (1):
      ASoC: Intel: soc-acpi: add support for MTL SDCA boards

Charles Keepax (4):
      ASoC: soc-component: Add notify control helper function
      ASoC: ak4118: Update to use new component control notify helper
      ASoC: wm_adsp: Update to use new component control notify helepr
      ASoC: cs35l45: Relicense to GPL only

Christophe JAILLET (8):
      ASoC: adau1761: Use the devm_clk_get_optional() helper
      ASoC: atmel: sam9g20_wm8731: Remove the unneeded include <linux/i2c.h>
      ASoC: cs42l51: Use the devm_clk_get_optional() helper
      ASoC: rt5659: Use the devm_clk_get_optional() helper
      ASoC: stm32: sai: Use the devm_clk_get_optional() helper
      ASoC: cs53l30: Use the devm_clk_get_optional() helper
      ASoC: rt5682s: Use the devm_clk_get_optional() helper
      ASoC: tegra: Simplify code around clk_get_rate() handling

Claudiu Beznea (3):
      ASoC: do not include pm_runtime.h if not used
      ASoC: use pm.h instead of runtime_pm.h
      ASoC: imx-audmix: check return value of devm_kasprintf()

Colin Ian King (1):
      ASoC: tas2781: Fix spelling mistake "calibraiton" -> "calibration"

Cristian Ciocaltea (2):
      ASoC: es8316: Increment max value for ALC Capture Target Volume control
      ASoC: es8316: Do not set rate constraints for unsupported MCLKs

Curtis Malainey (2):
      ASoC: SOF: Refactor rx function for fuzzing
      ASoC: SOF: Add IPC3 Kernel Injector

Dan Carpenter (4):
      ASoC: mediatek: mt8188-mt6359: clean up a return in codec_init
      ASoC: loongson: fix error codes in loongson_card_parse_acpi()
      ASoC: max98388: fix error code in probe()
      ASoC: tas2781: Fix error code in tas2781_load_calibration()

David Lin (9):
      ASoC: dt-bindings: nau8825: Convert to dtschema
      ASoC: dt-bindings: nau8824: Convert to dtschema
      ASoC: dt-bindings: nau8315: Convert to dtschema
      ASoC: dt-bindings: nau8810: Convert to dtschema
      ASoC: nau8825: Add pre-charge actions for input
      ASoC: nau8825: Add the management of headset detection for power saving
      ASoC: nau8825: Add registers patch for NAU8825C
      ASoC: nau8825: Update the calculation of FLL for NAU8825C
      ASoC: nau8825: Update output control for NAU8825C

David Rau (3):
      ASoC: dt-bindings: dialog,da7219: convert to dtschema
      ASoC: dt-bindings: da7219: Add jack-ins-det-pty property
      ASoC: da7219: Add Jack insertion detection polarity

Fabio Estevam (1):
      ASoC: fsl-asoc-card: Allow passing the number of slots in use

Harshit Mogalapalli (1):
      ASoC: SOF: Intel: hda-dai: Fix locking in hda_ipc4_pre_trigger()

Hui Wang (2):
      ASoC: fsl-asoc-card: add nau8822 support
      ASoC: bindings: fsl-asoc-card: add compatible string for nau8822 codec

Jack Yu (1):
      ASoC: rt722-sdca: Add RT722 SDCA driver

Jiapeng Chong (2):
      ASoC: SOF: Simplify the calculation of variables
      ASoC: max98088: clean up some inconsistent indenting

Juerg Haefliger (3):
      ASoC: siu: Add MODULE_FIRMWARE macro
      ASoC: rt5677: Add MODULE_FIRMWARE macro
      ASoC: codecs: wm0010: Add MODULE_FIRMWARE macros

Krzysztof Kozlowski (17):
      ASoC: dt-bindings: google,sc7180-trogdor: allow up to four codec DAIs
      ASoC: codecs: rt1308: do not store status in state container
      ASoC: codecs: rt1316: do not store status in state container
      ASoC: codecs: rt1318: do not store status in state container
      ASoC: codecs: rt5682: do not store status in state container
      ASoC: codecs: rt700: do not store status in state container
      ASoC: codecs: rt711-sdca: do not store status in state container
      ASoC: codecs: rt711: do not store status in state container
      ASoC: codecs: rt712-sdca-dmic: do not store status in state container
      ASoC: codecs: rt712-sdca: do not store status in state container
      ASoC: codecs: rt715-sdca: do not store status in state container
      ASoC: codecs: rt715: do not store status in state container
      ASoC: codecs: rt722-sdca: do not store status in state container
      ASoC: codecs: wsa883x: use existing define instead of raw value
      ASoC: dt-bindings: cirrus,cs35l45: drop unneeded quotes
      ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of speakers
      ASoC: codecs: wsa884x: Add WSA884x family of speakers

Kuninori Morimoto (38):
      ASoC: soc-utils.c: add asoc_dummy_dlc
      ASoC: ti: use asoc_dummy_dlc
      ASoC: sof: use asoc_dummy_dlc
      ASoC: amd: use asoc_dummy_dlc
      ASoC: fsl: use asoc_dummy_dlc
      ASoC: qcom: use asoc_dummy_dlc
      ASoC: atmel: use asoc_dummy_dlc
      ASoC: meson: use asoc_dummy_dlc
      ASoC: intel: avs: use asoc_dummy_dlc
      ASoC: intel: sof: use asoc_dummy_dlc
      ASoC: intel: skylake: use asoc_dummy_dlc
      ASoC: simple_card_utils.c: use asoc_dummy_dlc
      ASoC: soc-topology.c: add comment for Platform/Codec
      ASoC: soc-pcm.c: indicate error if stream has no playback no capture
      ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
      ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
      ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
      ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()
      ASoC: soc.h: remove snd_soc_compr_ops :: trigger
      ASoC: add snd_soc_get_stream_cpu()
      ASoC: audio-graph-card2-custom-sample: add missing CPU:Codec = 1:N sample
      ASoC: audio-graph-card2-custom-sample.dtsi: remove DT warning
      ASoC: add new trigger ordering method
      ASoC: amd: use use new trigger ordering method
      ASoC: atmel: use use new trigger ordering method
      ASoC: starfive: use use new trigger ordering method
      ASoC: remove old trigger ordering method
      ASoC: simple-card-utils.c: share asoc_graph_parse_dai()
      ASoC: simple_card_utils: remove unused cpus/codecs/platforms from props
      ASoC: soc-core.c: add snd_soc_{of_}get_dlc()
      ASoC: soc-core.c: add index on snd_soc_of_get_dai_name()
      ASoC: fsl: use snd_soc_{of_}get_dlc()
      ASoC: qcom: use snd_soc_{of_}get_dlc()
      ASoC: meson: use snd_soc_{of_}get_dlc()
      ASoC: samsung: use snd_soc_{of_}get_dlc()
      ASoC: loongson: use snd_soc_{of_}get_dlc()
      ASoC: soc-core.c: use snd_soc_{of_}get_dlc()
      ASoC: simple-card.c: use snd_soc_{of_}get_dlc()

Mac Chiang (1):
      ASoC: Intel: sof_rt5682: Add mtl support RT1019P speaker

Marek Vasut (2):
      ASoC: dt-bindings: ssm2518: Convert to dtschema
      ASoC: dt-bindings: audio-graph-card: Expand 'widgets' documentation

Mark Brown (89):
      ASoC: rt715: Use maple tree register cache
      ASoC: rt5682: Use a maple tree based register cache
      ASoC: MediaTek MT8195/86 Cleanups
      ASoC: add and use asoc_dummy_dlc
      ASoC: qcom: add display port module support.
      ASoC SSM3515 codec driver
      ASoC: Merge up fixes for CI
      ASoC: Intel: machine driver updates
      ASoC: SOF: Intel: hda-dai: prepare LNL support
      ASoC: SOF: Intel/ipc4: Do not reset BE DAI pipeline
      ASoC: Factor out control notification support
      ASoC: mediatek: mt8188: revise AFE driver
      ASoC: SOF: ipc4-topology: Improve the audio format
      ASoC: codecs: do not store status in state containe
      Add Chameleon v3 ASoC audio
      Merge tag 'v6.4-rc2' into asoc-6.5 to get fixes for CI
      ASoC: cs35l56: Bugfixes and efficiency improvement
      ASoC: SOF: ipc4: Querry CPC value from firmware's
      ASoC: topology: Clean up error messages handling
      ASoC: SOF: Intel: mtl: Enable multicore support
      ASoC: do not include runtime_pm.h if not needed
      ASoC: mt6359: kselftest fix and driver extension
      Improve support for sof_ipc{3|4}_bytes_ext_put
      ASoC: da7219: Add jack insertion detection polarity
      ASoC: SOF: add mt8188 audio support
      ASoC: topology: allow for partial dailink stream_name
      ES8316 audio codec fixes on Rock5B
      ASoC: minor cleanup for soc_get_playback_capture()
      Add TDM audio on StarFive JH7110
      Add NAU8825C support
      ASoC: SOF: Intel: LunarLake preparation patches
      ASoC: mt8188: add new board support
      ASoC: Intel: machine driver updates for 6.5
      ASoC: Intel: HDA: two cleanups
      ASoC: stm32: fix dtbs_check warnings
      ASoC: mt8188-mt6359: Cleanups
      Fix error check and cleanup for JH7110 TDM
      ASoC: mediatek: mt8173: Fix error paths
      ASoC: Intel: avs: remove redundant dapm routes
      ASoC: cs35l32: Use maple tree register cache
      ASoC: cs35l33: Use maple tree register cache
      ASoC: cs35l34: Use maple tree register cache
      ASoC: cs35l35: Use maple tree register cache
      ASoC: cs4234: Use maple tree register cache
      ASoC: cs42l42: Use maple tree register cache
      ASoC: cs42l73: Use maple tree register cache
      ASoC: cs42l83: Use maple tree register cache
      ASoC: cs43130: Use maple tree register cache
      ASoC: cs35l30: Use maple tree register cache
      ASoC: Use maple tree for Cirrus Logic devices
      ASoC: add N cpus to M codecs dai link support
      ASoC: add new trigger ordering method
      ASoC: rt700: Use maple tree register cache
      ASoC: rt711: Use maple tree register cache
      ASoC: rt712: Use maple tree register cache
      ASoC: rt715: Use maple tree register cache
      ASoC: rt722: Use maple tree register cache
      ASoC: rt1308: Use maple tree register cache
      ASoC: rt1316: Use maple tree register cache
      ASoC: rt1318: Use maple tree register cache
      ASoC: Use the maple tree register cache for RealTek
      ASoC: Merge fixes due to dependencies
      ASoC: SOF: misc updates for 6.5
      ASoC: es8316: Use maple tree register cache
      ASoC: es8328: Use maple tree register cache
      ASoC: rt1011: Use maple tree register cache
      ASoC: rt1019: Use maple tree register cache
      ASoC: rt1305: Use maple tree register cache
      ASoC: rt1308: Use maple tree register cache
      ASoC: rt5514: Use maple tree register cache
      ASoC: rt5616: Use maple tree register cache
      ASoC: rt5631: Use maple tree register cache
      ASoC: rt5640: Use maple tree register cache
      ASoC: rt5645: Use maple tree register cache
      ASoC: rt5651: Use maple tree register cache
      ASoC: rt5660: Use maple tree register cache
      ASoC: rt5665: Use maple tree register cache
      ASoC: rt5665: Use maple tree register cache
      ASoC: rt5668: Use maple tree register cache
      ASoC: rt5670: Use maple tree register cache
      ASoC: rt5682: Use maple tree register cache
      ASoC: max98363: Remove cache defaults for volatile registers
      ASoC: Convert Realtek I2C drivers to use maple tree
      ASoC: Use maple tree register cache for Everest Semi
      ASoC: qcom: audioreach: add compress offload
      add snd_soc_{of_}get_dlc()
      ASoC: amd: ps: add SoundWire support
      ASoC: Merge up fixes for CI
      ASoC: core: Always store of_node when getting DAI link component

Martin Povišer (2):
      ASoC: dt-bindings: Add adi,ssm3515 amp schema
      ASoC: ssm3515: Add new amp driver

Maxim Kochetkov (6):
      ASoC: dwc: add optional reset support
      ASoC: dt-bindings: designware-i2s: add optional resets
      ASoC: dwc: extend supported formats
      ASoC: dwc: add DMA handshake control
      ASoC: dwc: don't assign addr_width for dt configs
      ASoC: codecs: max98090: Allow dsp_a mode

Min-Hua Chen (2):
      ASoC: tegra: tegra210_adx: fix snd_pcm_format_t type
      ASoC: ti: davinci-mcasp: Use pcm_for_each_format() macro

Mohammad Rafi Shaik (4):
      ASoC: qcom: SC7280: audioreach: Add sc7280 hardware param fixup callback
      ASoC: q6dsp: q6apm: add end of stream events
      ASoC: q6dsp: audioreach: Add support to set compress format params
      ASoC: q6dsp: audioreach: Add gapless feature support

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: mt8192-mt6359: Go back to old headphone pin name

Olivier Moysan (2):
      ASoC: dt-bindings: stm32: document audio of graph port for i2s
      ASoC: dt-bindings: document audio of graph port for cs42l51

Paul Olaru (2):
      ASoC: sof: Improve sof_ipc3_bytes_ext_put function
      ASoC: sof: Improve sof_ipc4_bytes_ext_put function

Paweł Anikiel (4):
      ASoC: Add Google Chameleon v3 i2s driver
      ASoC: Add Google Chameleon v3 codec driver
      ASoC: dt-bindings: Add Google Chameleon v3 audio codec
      ASoC: dt-bindings: Add Google Chameleon v3 i2s device

Peter Ujfalusi (12):
      ASoC: Intel: sof_sdw: add quirk for LNL RVP
      ASoC: SOF: ipc4-topology: Use set_get_data() to send LARGE_CONFIG message
      ASoC: SOF: ipc4-loader: Drop unused bss_size from struct sof_ipc4_fw_module
      ASoC: SOF: ipc4-loader: Save a pointer to fm_config in sof_ipc4_fw_module
      ASoC: SOF: ipc4-topology: Rename sof_ipc4_update_pipeline_mem_usage() to be generic
      ASoC: SOF: ipc4-topology: Do not use the CPC value from topology
      ASoC: SOF: ipc4-loader/topology: Query the CPC value from manifest
      ASoC: SOF: core: Free the firmware trace before calling snd_sof_shutdown()
      ASoC: SOF: Add new sof_debug flag to request message payload dump
      ASoC: SOF: ipc3: Dump IPC message payload
      ASoC: SOF: ipc4: Switch to use the sof_debug:bit11 to dump message payload
      ASoC: SOF: pm: Remove duplicated code in sof_suspend

Pierre-Louis Bossart (26):
      ASoC: Intel: sof_sdw: add new mapping for HP Spectre x360
      ASoC: Intel: soc-acpi: add tables for LunarLake
      ASoC: SOF: Intel: hda-dai: simplify .prepare callback
      ASoC: SOF: Intel: hda-dai: remove use of cpu_dai->component drvdata
      ASoC: SOF: Intel: fix DAI number mismatch
      ASoC: SOF: Intel: clarify initialization when HDA_AUDIO_CODEC is not used
      ASoC: SOF: Intel: Kconfig: move selection of PROBE_WORK_QUEUE
      ASoC: SOF: Intel: hda-dai: move hda_dai_prepare() code
      ASoC: SOF: Intel: hda-dai: mark functions as __maybe_unused
      ASoC: SOF: Intel: hda-dai: use HDA_LINK instead of HDA_AUDIO_CODEC
      ASoC: SOF: Intel: remove mutual exclusion between NOCODEC and HDA_LINK
      ASoC: Intel: soc-acpi: add table for RPL Dell SKU 0BDA
      ASoC: Intel: sof_sdw: add quick for Dell SKU 0BDA
      ASoC: Intel: soc-acpi: add tables for Dell SKU 0B34
      ASoC: Intel: sof-sdw: add Dell SKU 0B34
      ASoC: SOF: Intel: hda-dai: add error checks to prevent static analysis warnings
      ASoC: SOF: Intel: hda-dai: add codec_dai_set_stream callback
      ASoC: SOF: Intel: hda-dai: add calc_stream_format callback
      ASoC: SOF: Intel: hda-dai: add get_hlink callback
      ASoC: SOF: ipc4-topology: extend ALH-specific data structure
      ASoC: SOF: ipc4-topology: introduce DMA config TLV
      ASoC: SOF: ipc4-topology: add DMA config TLV to IPC data
      ASoC: SOF: Intel: mtl: prepare for code reuse
      ASoC: SOF: Intel: hda: add helper to extract SoundWire link count
      ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclusion
      ASoC: SOF: Intel: hda-pcm: remove kernel parameter init

Rander Wang (3):
      ASoC: SOF: Intel: mtl: add core_get & put support on MeterLake platforms
      ASoC: SOF: Intel: tgl: unify core_put on IPC3 & IPC4 path
      ASoC: SOF: Intel: mtl: setup primary core info on MeteorLake platform

Ranjani Sridharan (14):
      ASoC: SOF: ipc4-topology: Handle input/output audio format special case
      ASoC: SOF: ipc4-topology: Add a helper function for output format selection
      ASoC: SOF: ipc4-topology: Move the call to init output format
      ASoC: SOF: ipc4-topology: Rename sof_ipc4_init_audio_fmt()
      ASoC: SOF: ipc4-topology: Handle output format special case
      ASoC: SOF: ipc4-topology: Add a new helper function to get the valid bits
      ASoC: SOF: ipc4-topology: Modify the output format selection logic
      ASoC: SOF: ipc4-topology: New helper to check if all output formats are the same
      ASoC: SOF: ipc4-topology: Modify input audio format selection logic
      ASoC: SOF: Intel: hda-dai-ops: Split the get_hext_stream() op for IPC4
      ASoC: SOF: ipc4-pcm: reset all pipelines during FE DAI hw_free
      ASoC: topology: Allow partial matching when finding DAI link
      ASoC: SOF: topology: Use partial match for connecting DAI link and DAI widget
      ASoC: SOF: Intel: HDA: Limit the number of dai drivers for nocodec mode

Ricardo Ribalda Delgado (2):
      ASoC: mediatek: mt8173: Fix snd_soc_component_initialize error path
      ASoC: mediatek: mt8173: Fix irq error path

Richard Fitzgerald (1):
      firmware: cs_dsp: Log that a bin file was loaded

Rob Herring (3):
      ASoC: dt-bindings: More dropping unneeded quotes
      ASoC: dt-bindings: ti,tlv320aic3x: Add missing type for "gpio-reset"
      ASoC: dt-bindings: microchip,sama7g5-pdmc: Simplify "microchip,mic-pos" constraints

Rsplwe (1):
      ASoC: amd: yc: Add MECHREVO Jiaolong Series MRID6 into DMI table

Ryan Lee (2):
      ASoC: dt-bindings: max98388: add amplifier driver
      ASoC: max98388: add amplifier driver

Sameer Pujar (2):
      ASoC: tegra: Use normal system sleep for ASRC
      ASoC: tegra: Remove stale comments in AHUB

Shenghao Ding (4):
      ASoC: tas2781: Add Header file for tas2781 driver
      ASoC: tas2781: firmware lib
      ASoC: tas2781: Add tas2781 driver
      ASoC: dt-bindings: Add tas2781 amplifier

Shengjiu Wang (1):
      ASoC: fsl_sai: MCLK bind with TX/RX enable bit

Simon Trimmer (3):
      ASoC: cs35l56: Move DSP part string generation so that it is done only once
      ASoC: cs35l56: sdw_write_no_pm() should be performed under a pm_runtime request
      ASoC: cs35l56: In secure mode skip SHUTDOWN and RESET around fw download

Srinivas Kandagatla (12):
      ASoC: qcom: q6dsp-common: move channel allocation to common
      ASoC: qcom: audioreach: add support for DISPLAY PORT SINK module
      ASoC: qcom: q6dsp: add support to more display ports
      ASoC: qcom: q6apm: add support to display ports in lpass dais
      ASoC: q6dsp: audioreach: add helper function to set u32 param
      ASoC: q6dsp: audioreach: Add placeholder decoder for compress playback
      ASoC: q6dsp: q6apm-dai: Add open/free compress DAI callbacks
      ASoC: q6dsp: q6apm-dai: Add compress DAI and codec caps get callbacks
      ASoC: q6dsp: q6apm-dai: Add trigger/pointer compress DAI callbacks
      ASoC: q6dsp: q6apm-dai: Add compress set params and metadata DAI callbacks
      ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks
      ASoC: qcom: common: add default jack dapm pins

Syed Saba Kareem (4):
      ASoC: amd: ps: remove the register read and write wrappers.
      ASoC: amd: ps: refactor acp power on and reset functions.
      ASoC: amd: acp: clear pdm dma interrupt mask
      ASoC: amd: acp: remove acp poweroff function

Terry Cheong (3):
      ASoC: Intel: Add rpl_max98373_8825 driver
      ASoC: Intel: Add rpl_rt1019_rt5682 driver
      ASoC: Intel: sof_rt5682: reorder quirk table

Tom Rix (1):
      ASoC: max98388: set variable soc_codec_dev_max98388 storage-class-specifier to static

Trevor Wu (22):
      ASoC: mediatek: mt8188: remove supply AUDIO_HIRES
      ASoC: mediatek: mt8188: complete set_tdm_slot function
      ASoC: mediatek: mt8188: revise ETDM control flow
      ASoC: mediatek: mt8188: refine APLL control
      ASoC: mediatek: mt8188: combine afe component registration
      ASoC: mediatek: mt8188: add bus protection
      ASoC: mediatek: mt8188: add required clocks
      ASoC: dt-bindings: mediatek,mt8188-afe: correct clock name
      ASoC: dt-bindings: mediatek,mt8188-afe: add audio properties
      ASoC: mediatek: mt6359: add supply for MTKAIF
      ASoC: mediatek: mt6359: fix kselftest error of playback gain
      ASoC: mediatek: mt6359: add mtkaif gpio setting
      ASoC: mediatek: mt6359: update route for lineout mux
      ASoC: SOF: mediatek: add mt8188 audio support
      ASoC: SOF: mediatek: add adsp debug dump
      ASoC: mediatek: mt8188: separate ADDA playback dai from capture dai
      ASoC: dt-bindings: mediatek,mt8188-mt6359: remove ADDA_BE from link-name
      ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack pins
      ASoC: mediatek: common: soundcard driver add dai_fmt support
      ASoC: soc-dapm.c: clean up debugfs for freed widget
      ASoC: mediatek: mt8188-mt6359: support new board with nau88255
      ASoC: dt-bindings: mediatek,mt8188-mt6359: add NAU8825 support

Uday M Bhat (6):
      ASoC: Intel: sof_sdw: Add helper function for cs42l42 codec
      ASoC: Intel: sof_sdw: Rename sof_sdw_max98373.c file to sof_sdw_maxim.c
      ASoC: Intel: sof_sdw: Modify maxim helper functions and structure names
      ASoC: Intel: sof_sdw: Add support for MAX98363 codec
      ASoC: Intel: sof_sdw: Add support for Rex soundwire
      ASoC: Intel: soc-acpi: add Rex CS42l42 and MAX98363 SoundWire entries

Uwe Kleine-König (2):
      ASoC: Switch i2c drivers back to use .probe()
      ASoC: Switch two more i2c drivers back to use .probe()

Venkata Prasad Potturu (3):
      ASoC: SOF: amd: Add pci revision id check
      ASoC: amd: vangogh: Add check for acp config flags in vangogh platform
      ASoC: SOF: amd: Add support for IPC with a reply_size set to zero

Vijendar Mukunda (9):
      ASoC: amd: ps: create platform devices based on acp config
      ASoC: amd: ps: handle SoundWire interrupts in acp pci driver
      ASoC: amd: ps: add SoundWire dma driver
      ASoC: amd: ps: add SoundWire dma driver dma ops
      ASoC: amd: ps: add support for SoundWire DMA interrupts
      ASoC: amd: ps: add pm ops support for SoundWire dma driver
      ASoC: amd: ps: enable SoundWire dma driver build
      ASoC: amd: update comments in Kconfig file
      ASoC: amd: ps: add acp_reset flag check in acp pci driver pm ops.

Vitaly Rodionov (1):
      ASoC: cs42l42: Add PLL ratio table values

Walker Chen (4):
      ASoC: dt-bindings: Add TDM controller bindings for StarFive JH7110
      ASoC: starfive: Add JH7110 TDM driver
      ASoC: starfive: Fix an error check in jh7110_tdm_clk_reset_get()
      ASoC: starfive: Remove some unused macros

Yang Li (2):
      ASoC: codecs: wcd938x: Remove unneeded semicolon
      ASoC: SOF: ipc4-topology: Fix an unsigned comparison which can never be negative

YingKun Meng (1):
      ASoC: loongson: change the type of variable irq to int

Yingkun Meng (3):
      ASoC: Add support for Loongson I2S controller
      ASoC: loongson: Add Loongson ASoC Sound Card Support
      ASoC: dt-bindings: Add support for Loongson audio card

 .mailmap                                           |    5 +
 CREDITS                                            |    4 +
 .../admin-guide/quickly-build-trimmed-linux.rst    |   49 +-
 Documentation/block/index.rst                      |    1 -
 Documentation/block/request.rst                    |   99 -
 Documentation/cdrom/index.rst                      |    6 +-
 .../devicetree/bindings/ata/ceva,ahci-1v84.yaml    |    2 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |   12 +
 .../devicetree/bindings/media/i2c/ovti,ov2685.yaml |    1 +
 .../bindings/net/can/st,stm32-bxcan.yaml           |   19 +-
 .../bindings/pci/fsl,imx6q-pcie-common.yaml        |   13 +-
 .../devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml |   38 +
 .../devicetree/bindings/pci/fsl,imx6q-pcie.yaml    |   77 +
 .../devicetree/bindings/sound/adi,max98388.yaml    |   79 +
 .../devicetree/bindings/sound/adi,ssm2518.yaml     |   47 +
 .../devicetree/bindings/sound/adi,ssm3515.yaml     |   49 +
 .../devicetree/bindings/sound/audio-graph.yaml     |    6 +-
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  |   10 +-
 .../devicetree/bindings/sound/cirrus,cs42l51.yaml  |   11 +
 Documentation/devicetree/bindings/sound/da7219.txt |  112 -
 .../devicetree/bindings/sound/dialog,da7219.yaml   |  237 ++
 .../devicetree/bindings/sound/fsl-asoc-card.txt    |    2 +
 .../bindings/sound/google,chv3-codec.yaml          |   31 +
 .../devicetree/bindings/sound/google,chv3-i2s.yaml |   44 +
 .../bindings/sound/google,sc7180-trogdor.yaml      |    3 +-
 .../devicetree/bindings/sound/ingenic,aic.yaml     |    1 +
 .../bindings/sound/loongson,ls-audio-card.yaml     |   70 +
 .../bindings/sound/mediatek,mt8188-afe.yaml        |   66 +-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |   27 +-
 .../bindings/sound/microchip,sama7g5-pdmc.yaml     |    8 +-
 .../devicetree/bindings/sound/nau8315.txt          |   24 -
 .../devicetree/bindings/sound/nau8540.txt          |   16 -
 .../devicetree/bindings/sound/nau8810.txt          |   17 -
 .../devicetree/bindings/sound/nau8824.txt          |   88 -
 .../devicetree/bindings/sound/nau8825.txt          |  111 -
 .../devicetree/bindings/sound/nuvoton,nau8315.yaml |   44 +
 .../devicetree/bindings/sound/nuvoton,nau8540.yaml |   40 +
 .../devicetree/bindings/sound/nuvoton,nau8810.yaml |   45 +
 .../devicetree/bindings/sound/nuvoton,nau8824.yaml |  182 ++
 .../devicetree/bindings/sound/nuvoton,nau8825.yaml |  239 ++
 .../bindings/sound/nvidia,tegra-audio-common.yaml  |    4 +-
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |    4 +-
 .../bindings/sound/qcom,q6dsp-lpass-clocks.yaml    |    4 +-
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |    4 +-
 .../devicetree/bindings/sound/qcom,wsa8840.yaml    |   66 +
 .../devicetree/bindings/sound/realtek,rt1016.yaml  |   40 +
 Documentation/devicetree/bindings/sound/rt1016.txt |   17 -
 .../bindings/sound/snps,designware-i2s.yaml        |    3 +-
 .../devicetree/bindings/sound/ssm2518.txt          |   20 -
 .../devicetree/bindings/sound/st,stm32-i2s.yaml    |   11 +
 .../bindings/sound/starfive,jh7110-tdm.yaml        |   98 +
 .../devicetree/bindings/sound/tas2562.yaml         |    4 +-
 .../devicetree/bindings/sound/tas2770.yaml         |    4 +-
 .../devicetree/bindings/sound/tas27xx.yaml         |    4 +-
 .../devicetree/bindings/sound/ti,tas2781.yaml      |   74 +
 .../bindings/sound/ti,tlv320aic32x4.yaml           |  101 +
 .../devicetree/bindings/sound/ti,tlv320aic3x.yaml  |    1 +
 .../devicetree/bindings/sound/tlv320aic32x4.txt    |   42 -
 .../devicetree/bindings/sound/wlf,wm8903.yaml      |    4 +-
 .../filesystems/ramfs-rootfs-initramfs.rst         |    3 +-
 Documentation/filesystems/sharedsubtree.rst        |    4 +
 Documentation/fpga/index.rst                       |    2 +-
 Documentation/locking/index.rst                    |    2 +-
 Documentation/networking/bonding.rst               |    9 +-
 Documentation/networking/index.rst                 |    2 +-
 Documentation/networking/x25-iface.rst             |    3 +-
 Documentation/pcmcia/index.rst                     |    2 +-
 Documentation/s390/vfio-ap.rst                     |    1 -
 Documentation/staging/crc32.rst                    |    2 +-
 Documentation/timers/index.rst                     |    2 +-
 MAINTAINERS                                        | 2327 +++++++++----------
 Makefile                                           |    2 +-
 arch/arm/boot/dts/stm32f429.dtsi                   |    1 +
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi             |   82 +
 arch/arm/include/asm/arm_pmuv3.h                   |    6 +-
 arch/arm/kernel/unwind.c                           |   25 +-
 arch/arm/mach-sa1100/jornada720_ssp.c              |    5 +-
 arch/arm/vfp/entry.S                               |    7 +-
 arch/arm/vfp/vfphw.S                               |    6 +-
 arch/arm64/include/asm/arm_pmuv3.h                 |    6 +-
 arch/arm64/include/asm/cputype.h                   |    8 +
 arch/arm64/include/asm/kvm_pgtable.h               |    1 +
 arch/arm64/kernel/mte.c                            |    7 +-
 arch/arm64/kernel/vdso.c                           |    2 +-
 arch/arm64/kvm/fpsimd.c                            |   26 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |   12 +-
 arch/arm64/kvm/hyp/pgtable.c                       |   41 +-
 arch/arm64/kvm/inject_fault.c                      |    2 +-
 arch/arm64/kvm/vgic/vgic-v3.c                      |    4 +
 arch/arm64/kvm/vmid.c                              |    7 +-
 arch/arm64/mm/copypage.c                           |    5 +-
 arch/arm64/mm/fault.c                              |    4 +-
 arch/parisc/include/asm/pgtable.h                  |    8 +-
 arch/parisc/kernel/kexec.c                         |    2 +
 arch/powerpc/boot/Makefile                         |    6 +-
 arch/powerpc/crypto/Kconfig                        |    2 +-
 arch/powerpc/include/asm/iommu.h                   |    5 -
 arch/powerpc/kernel/dma-iommu.c                    |    4 +-
 arch/powerpc/kernel/iommu.c                        |   28 +-
 arch/powerpc/kernel/isa-bridge.c                   |    5 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c           |    4 +-
 arch/powerpc/net/bpf_jit_comp.c                    |    2 +
 arch/powerpc/platforms/Kconfig                     |    1 +
 arch/powerpc/platforms/powernv/pci.c               |   25 -
 arch/powerpc/platforms/pseries/iommu.c             |   38 +-
 arch/riscv/kernel/pi/Makefile                      |    2 +-
 arch/riscv/kernel/probes/Makefile                  |    2 +
 arch/riscv/kernel/vmlinux.lds.S                    |    7 +-
 arch/s390/Kconfig                                  |   11 +-
 arch/s390/configs/debug_defconfig                  |    3 +-
 arch/s390/configs/defconfig                        |    3 +-
 arch/s390/configs/zfcpdump_defconfig               |    1 +
 arch/s390/crypto/chacha-glue.c                     |    2 +-
 arch/s390/include/asm/compat.h                     |    2 +-
 arch/s390/include/uapi/asm/statfs.h                |    4 +-
 arch/s390/kernel/Makefile                          |    1 +
 arch/s390/kernel/ipl.c                             |    3 +-
 arch/s390/kernel/topology.c                        |   32 +-
 arch/um/drivers/Makefile                           |    4 +-
 arch/um/drivers/harddog.h                          |    9 +
 arch/um/drivers/harddog_kern.c                     |    7 +-
 arch/um/drivers/harddog_user.c                     |    1 +
 arch/um/drivers/harddog_user_exp.c                 |    9 +
 arch/x86/events/core.c                             |    6 +-
 arch/x86/events/intel/ds.c                         |   56 +-
 arch/x86/include/asm/perf_event.h                  |    3 +
 arch/x86/include/asm/vmx.h                         |    2 +
 arch/x86/kernel/Makefile                           |    1 +
 arch/x86/kernel/amd_nb.c                           |    2 +
 arch/x86/kvm/cpuid.c                               |   16 -
 arch/x86/kvm/vmx/sgx.c                             |   11 +-
 arch/x86/kvm/x86.c                                 |    6 +-
 arch/x86/lib/retpoline.S                           |    4 +-
 block/fops.c                                       |   12 +-
 drivers/acpi/resource.c                            |   12 +
 drivers/base/class.c                               |    2 +
 drivers/block/nbd.c                                |    4 +-
 drivers/block/rnbd/rnbd-proto.h                    |    2 +-
 drivers/block/ublk_drv.c                           |   11 +-
 drivers/char/tpm/tpm-chip.c                        |    4 +
 drivers/char/tpm/tpm-interface.c                   |   10 +
 drivers/char/tpm/tpm_tis.c                         |   16 +
 drivers/char/tpm/tpm_tis_core.c                    |   43 +-
 drivers/cpufreq/acpi-cpufreq.c                     |    2 +-
 drivers/cpufreq/pcc-cpufreq.c                      |    2 +-
 drivers/cxl/core/pci.c                             |    1 +
 drivers/firewire/net.c                             |   21 +-
 drivers/firmware/cirrus/cs_dsp.c                   |    8 +-
 drivers/firmware/sysfb_simplefb.c                  |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   65 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   36 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   21 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   22 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |   65 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |    2 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |    2 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    5 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |    1 +
 .../gpu/drm/amd/display/dc/link/link_validation.c  |    3 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   25 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   18 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   20 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    1 +
 drivers/gpu/drm/ast/ast_main.c                     |    9 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   16 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.h            |    4 +-
 drivers/gpu/drm/i915/Kconfig                       |   12 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |    5 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |    7 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    6 +
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   16 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |    4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |    4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |    4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |    4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |    1 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |    1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   12 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |    8 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   24 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   16 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |    5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |    3 -
 drivers/gpu/drm/msm/dp/dp_audio.c                  |   12 +
 drivers/gpu/drm/msm/dp/dp_audio.h                  |    2 +
 drivers/gpu/drm/msm/dp/dp_display.c                |    1 +
 drivers/gpu/drm/msm/msm_atomic.c                   |    2 +
 drivers/gpu/drm/msm/msm_gem.c                      |   22 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |   25 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |    9 +-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h      |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   |    2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |    2 +-
 drivers/hwmon/k10temp.c                            |    1 +
 drivers/iommu/Kconfig                              |   16 -
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   10 +
 drivers/media/dvb-core/dvb_ca_en50221.c            |   49 +-
 drivers/media/dvb-core/dvb_demux.c                 |    4 +-
 drivers/media/dvb-core/dvb_frontend.c              |   69 +-
 drivers/media/dvb-core/dvb_net.c                   |   38 +-
 drivers/media/dvb-core/dvbdev.c                    |   84 +-
 drivers/media/dvb-frontends/mn88443x.c             |    2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |   19 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   |    3 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |    6 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |   41 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   21 +-
 drivers/media/usb/dvb-usb-v2/ce6230.c              |    8 +
 drivers/media/usb/dvb-usb-v2/ec168.c               |   12 +
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |   20 +
 drivers/media/usb/dvb-usb/az6027.c                 |   12 +
 drivers/media/usb/dvb-usb/digitv.c                 |    4 +
 drivers/media/usb/dvb-usb/dw2102.c                 |    2 +-
 drivers/media/usb/pvrusb2/Kconfig                  |    1 +
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |    3 +-
 drivers/net/bonding/bond_netlink.c                 |    7 +-
 drivers/net/bonding/bond_options.c                 |    8 +-
 drivers/net/can/Kconfig                            |    2 +-
 drivers/net/can/bxcan.c                            |   34 +-
 drivers/net/can/dev/skb.c                          |    3 +-
 drivers/net/can/kvaser_pciefd.c                    |   51 +-
 drivers/net/dsa/mv88e6xxx/port.h                   |    2 +-
 drivers/net/dsa/rzn1_a5psw.c                       |   83 +-
 drivers/net/dsa/rzn1_a5psw.h                       |    3 +-
 drivers/net/ethernet/3com/3c515.c                  |    4 +-
 drivers/net/ethernet/8390/ne.c                     |    1 +
 drivers/net/ethernet/8390/smc-ultra.c              |    1 +
 drivers/net/ethernet/8390/wd.c                     |    1 +
 drivers/net/ethernet/amd/lance.c                   |    1 +
 drivers/net/ethernet/broadcom/genet/bcmgenet.c     |    8 +-
 drivers/net/ethernet/cirrus/cs89x0.c               |    2 +
 drivers/net/ethernet/freescale/fec_main.c          |   16 +-
 drivers/net/ethernet/google/gve/gve_main.c         |   13 -
 .../hisilicon/hns3/hns3_common/hclge_comm_cmd.c    |   25 +-
 .../hisilicon/hns3/hns3_common/hclge_comm_cmd.h    |    8 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c |    2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.h |    1 +
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |   15 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c  |    4 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.h  |    5 +
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |    5 +-
 drivers/net/ethernet/intel/iavf/iavf_virtchnl.c    |    5 -
 drivers/net/ethernet/intel/ice/ice_dcb_lib.c       |    5 +-
 drivers/net/ethernet/intel/ice/ice_lib.c           |    5 +
 drivers/net/ethernet/intel/ice/ice_sriov.c         |    8 +-
 drivers/net/ethernet/intel/ice/ice_txrx.c          |    8 +-
 drivers/net/ethernet/intel/ice/ice_txrx.h          |    9 +-
 drivers/net/ethernet/intel/ice/ice_vf_lib.c        |   19 +
 drivers/net/ethernet/intel/ice/ice_vf_lib.h        |    1 +
 drivers/net/ethernet/intel/ice/ice_virtchnl.c      |    1 +
 drivers/net/ethernet/intel/igb/e1000_mac.c         |    4 +-
 drivers/net/ethernet/mediatek/mtk_wed.c            |    2 +-
 drivers/net/ethernet/mscc/vsc7514_regs.c           |   18 +-
 drivers/net/ethernet/netronome/nfp/nic/main.h      |    2 +-
 drivers/net/ethernet/sfc/ef100_netdev.c            |    4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |    1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |    5 +
 drivers/net/ethernet/sun/cassini.c                 |    2 +
 drivers/net/ipvlan/ipvlan_core.c                   |    6 +
 drivers/net/mdio/mdio-i2c.c                        |   15 +-
 drivers/net/mdio/mdio-mvusb.c                      |   11 +-
 drivers/net/pcs/pcs-xpcs.c                         |    4 +-
 drivers/net/phy/bcm-phy-lib.h                      |    5 +
 drivers/net/phy/bcm7xxx.c                          |    2 +-
 drivers/net/phy/dp83867.c                          |   22 +-
 drivers/net/phy/phylink.c                          |    8 +-
 drivers/net/tap.c                                  |    4 +-
 drivers/net/tun.c                                  |   15 +
 drivers/net/virtio_net.c                           |   61 +-
 drivers/net/wireless/broadcom/b43/b43.h            |    2 +-
 .../net/wireless/broadcom/b43legacy/b43legacy.h    |    2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c  |    5 +
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    |   11 +
 .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c |   11 +
 drivers/net/wireless/intel/iwlwifi/fw/acpi.c       |    2 +-
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c        |   19 +-
 .../net/wireless/intel/iwlwifi/mvm/ftm-initiator.c |    5 +
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c        |    5 +-
 drivers/net/wireless/intel/iwlwifi/mvm/link.c      |   12 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c  |   55 +-
 .../net/wireless/intel/iwlwifi/mvm/mld-mac80211.c  |    9 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c   |   14 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h       |    1 +
 drivers/net/wireless/intel/iwlwifi/mvm/nvm.c       |   10 +
 drivers/net/wireless/intel/iwlwifi/mvm/rfi.c       |   16 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rs.c        |    3 +
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c      |    9 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |   13 +-
 drivers/net/wireless/intel/iwlwifi/mvm/tx.c        |    2 +-
 .../net/wireless/mediatek/mt76/mt76_connac2_mac.h  |    2 +-
 .../net/wireless/mediatek/mt76/mt76_connac_mac.c   |    3 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |    2 +-
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h   |    1 +
 .../net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c  |    4 +-
 drivers/net/wireless/realtek/rtw88/mac80211.c      |    2 +-
 drivers/net/wireless/realtek/rtw88/main.c          |   15 +
 drivers/net/wireless/realtek/rtw88/main.h          |    3 +
 drivers/net/wireless/realtek/rtw88/sdio.c          |    8 -
 drivers/net/wireless/realtek/rtw88/usb.h           |    2 +-
 drivers/net/wireless/realtek/rtw89/mac.c           |    4 +
 drivers/net/wireless/realtek/rtw89/mac.h           |    2 +
 drivers/net/wireless/realtek/rtw89/rtw8852b.c      |   28 +-
 drivers/net/wireless/virtual/mac80211_hwsim.c      |    3 +-
 drivers/net/wwan/iosm/iosm_ipc_imem.c              |   27 +-
 drivers/net/wwan/iosm/iosm_ipc_imem_ops.c          |   12 +-
 drivers/net/wwan/iosm/iosm_ipc_imem_ops.h          |    6 +-
 drivers/net/wwan/t7xx/t7xx_pci.c                   |   18 +
 drivers/net/wwan/t7xx/t7xx_pci.h                   |    1 +
 drivers/nvme/host/core.c                           |    6 +-
 drivers/nvme/host/hwmon.c                          |    4 +-
 drivers/nvme/host/multipath.c                      |    1 -
 drivers/nvme/host/nvme.h                           |    5 +
 drivers/nvme/host/pci.c                            |    8 +-
 drivers/platform/mellanox/mlxbf-tmfifo.c           |   11 +-
 drivers/platform/x86/hp/hp-wmi.c                   |    1 +
 .../uncore-frequency/uncore-frequency-common.c     |    6 +-
 drivers/platform/x86/intel_scu_pcidrv.c            |    1 +
 drivers/platform/x86/thinkpad_acpi.c               |   24 +-
 drivers/platform/x86/touchscreen_dmi.c             |   41 +
 drivers/s390/block/dasd_eckd.c                     |   33 +-
 drivers/s390/cio/device.c                          |    2 +
 drivers/s390/cio/qdio.h                            |    2 +-
 drivers/s390/crypto/pkey_api.c                     |    3 +
 drivers/scsi/scsi_lib.c                            |    5 +-
 drivers/scsi/storvsc_drv.c                         |    8 +-
 drivers/thunderbolt/nhi.c                          |   29 +-
 drivers/thunderbolt/nhi_regs.h                     |    2 +
 drivers/tty/serial/8250/8250_bcm7271.c             |    7 +-
 drivers/tty/serial/8250/8250_exar.c                |   17 +
 drivers/tty/serial/8250/8250_pci.c                 |    5 +
 drivers/tty/serial/8250/8250_port.c                |    1 +
 drivers/tty/serial/arc_uart.c                      |    7 +-
 drivers/tty/serial/qcom_geni_serial.c              |    9 +-
 drivers/tty/vt/vc_screen.c                         |   11 +-
 drivers/ufs/core/ufs-mcq.c                         |    5 +-
 drivers/ufs/core/ufshcd.c                          |   20 +-
 drivers/usb/class/usbtmc.c                         |    2 +
 drivers/usb/dwc3/core.c                            |    2 +-
 drivers/usb/dwc3/core.h                            |    2 +
 drivers/usb/dwc3/debugfs.c                         |  109 +
 drivers/usb/dwc3/gadget.c                          |   79 +-
 drivers/usb/gadget/function/u_ether.c              |    3 +
 drivers/usb/gadget/udc/core.c                      |  151 +-
 drivers/usb/host/uhci-pci.c                        |   10 +-
 drivers/usb/host/xhci-pci.c                        |   12 +-
 drivers/usb/host/xhci-ring.c                       |   29 +-
 drivers/usb/host/xhci.h                            |    2 +-
 drivers/usb/storage/scsiglue.c                     |   28 +-
 drivers/usb/typec/altmodes/displayport.c           |    4 +
 drivers/usb/typec/tipd/core.c                      |    3 +
 drivers/video/fbdev/68328fb.c                      |   12 +-
 drivers/video/fbdev/Kconfig                        |    2 +-
 drivers/video/fbdev/arcfb.c                        |   15 +-
 drivers/video/fbdev/atmel_lcdfb.c                  |    2 +-
 drivers/video/fbdev/aty/atyfb_base.c               |    5 -
 drivers/video/fbdev/cg14.c                         |    2 +-
 drivers/video/fbdev/controlfb.c                    |   34 +-
 drivers/video/fbdev/core/fbmem.c                   |    2 +-
 drivers/video/fbdev/core/modedb.c                  |    5 +
 drivers/video/fbdev/g364fb.c                       |    6 +-
 drivers/video/fbdev/hgafb.c                        |   36 +-
 drivers/video/fbdev/hpfb.c                         |    8 +-
 drivers/video/fbdev/i810/i810_dvt.c                |    3 +-
 drivers/video/fbdev/imsttfb.c                      |   15 +-
 drivers/video/fbdev/macfb.c                        |   10 +-
 drivers/video/fbdev/maxinefb.c                     |    2 +-
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   |    3 +-
 drivers/video/fbdev/p9100.c                        |    4 +-
 drivers/video/fbdev/platinumfb.c                   |   30 +-
 drivers/video/fbdev/sa1100fb.c                     |   32 +-
 drivers/video/fbdev/stifb.c                        |  157 +-
 drivers/video/fbdev/udlfb.c                        |   27 +-
 drivers/video/fbdev/valkyriefb.c                   |   14 +-
 drivers/video/fbdev/vfb.c                          |   10 +-
 fs/btrfs/backref.c                                 |   19 +-
 fs/btrfs/backref.h                                 |    6 +
 fs/btrfs/block-rsv.c                               |    3 +-
 fs/btrfs/ctree.c                                   |   38 +-
 fs/btrfs/disk-io.c                                 |   25 +-
 fs/btrfs/file-item.c                               |    5 +-
 fs/btrfs/free-space-cache.c                        |    7 +-
 fs/btrfs/free-space-tree.c                         |   50 +-
 fs/btrfs/free-space-tree.h                         |    3 +-
 fs/btrfs/inode.c                                   |    3 +
 fs/btrfs/ioctl.c                                   |    4 +-
 fs/btrfs/print-tree.c                              |    6 +-
 fs/btrfs/relocation.c                              |    2 +-
 fs/btrfs/super.c                                   |    6 +-
 fs/btrfs/volumes.c                                 |    1 +
 fs/btrfs/zoned.c                                   |   17 +-
 fs/ceph/mds_client.c                               |    3 +-
 fs/ceph/snap.c                                     |   13 +
 fs/cifs/cifsfs.c                                   |   18 +-
 fs/cifs/cifsglob.h                                 |    4 +-
 fs/cifs/connect.c                                  |    7 +
 fs/cifs/file.c                                     |   26 +-
 fs/cifs/smb1ops.c                                  |    9 +-
 fs/cifs/smb2ops.c                                  |    9 +-
 fs/cifs/smb2pdu.c                                  |    3 +
 fs/ext4/balloc.c                                   |   43 +-
 fs/ext4/ext4.h                                     |   39 +-
 fs/ext4/extents_status.c                           |   30 +-
 fs/ext4/hash.c                                     |    6 +-
 fs/ext4/ialloc.c                                   |   12 +-
 fs/ext4/inline.c                                   |   17 +-
 fs/ext4/inode.c                                    |   20 +-
 fs/ext4/mballoc.c                                  |   70 +-
 fs/ext4/migrate.c                                  |   11 +-
 fs/ext4/mmp.c                                      |   30 +-
 fs/ext4/namei.c                                    |   53 +-
 fs/ext4/super.c                                    |   37 +-
 fs/ext4/xattr.c                                    |    5 +-
 fs/gfs2/super.c                                    |    8 +
 fs/ksmbd/connection.c                              |    3 +-
 fs/ksmbd/oplock.c                                  |    5 +-
 fs/ksmbd/oplock.h                                  |    2 +-
 fs/ksmbd/smb2misc.c                                |    5 +-
 fs/ksmbd/smb2pdu.c                                 |   19 +-
 fs/lockd/svc.c                                     |    2 +-
 fs/nfs/dir.c                                       |    2 +-
 fs/nfsd/nfsctl.c                                   |   25 +-
 fs/nfsd/trace.h                                    |    6 +-
 fs/nilfs2/inode.c                                  |   18 +
 fs/notify/inotify/inotify_fsnotify.c               |   11 +-
 fs/pipe.c                                          |    6 +-
 fs/statfs.c                                        |    4 +-
 fs/xfs/libxfs/xfs_ag.c                             |   19 +-
 fs/xfs/libxfs/xfs_bmap.c                           |    5 +-
 fs/xfs/scrub/bmap.c                                |    4 +-
 fs/xfs/scrub/common.c                              |   26 -
 fs/xfs/scrub/common.h                              |    2 -
 fs/xfs/scrub/fscounters.c                          |   13 +-
 fs/xfs/scrub/scrub.c                               |    2 -
 fs/xfs/scrub/scrub.h                               |    1 -
 fs/xfs/scrub/trace.h                               |    1 -
 fs/xfs/xfs_bmap_util.c                             |    4 +-
 fs/xfs/xfs_icache.c                                |   40 +-
 fs/xfs/xfs_iomap.c                                 |    5 +-
 fs/xfs/xfs_mount.h                                 |    3 +
 fs/xfs/xfs_super.c                                 |    3 +
 include/drm/display/drm_dp.h                       |    5 +-
 include/drm/display/drm_dp_helper.h                |    5 +-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |    8 +
 include/linux/blkdev.h                             |    2 -
 include/linux/compiler.h                           |    5 +-
 include/linux/device/class.h                       |    1 +
 include/linux/dim.h                                |    3 +-
 include/linux/if_vlan.h                            |   17 +
 include/linux/io_uring.h                           |   10 +-
 include/linux/pci_ids.h                            |    1 +
 include/linux/phy.h                                |    2 -
 include/linux/shrinker.h                           |   13 +-
 include/linux/sunrpc/svc_rdma.h                    |    2 +-
 include/linux/sunrpc/svc_xprt.h                    |    2 +-
 include/linux/tpm.h                                |    1 +
 include/linux/usb/composite.h                      |    2 +-
 include/media/dvb_frontend.h                       |    6 +-
 include/media/dvb_net.h                            |    4 +
 include/media/dvbdev.h                             |   15 +
 include/net/bonding.h                              |    2 +-
 include/net/nexthop.h                              |   23 -
 include/net/sock.h                                 |    2 +-
 include/sound/cs35l56.h                            |    1 +
 include/sound/da7219-aad.h                         |    6 +
 include/sound/simple_card_utils.h                  |    7 +-
 include/sound/soc-acpi-intel-match.h               |    2 +
 include/sound/soc-component.h                      |   15 +-
 include/sound/soc.h                                |   40 +-
 include/sound/tas2781-dsp.h                        |  183 ++
 include/sound/tas2781-tlv.h                        |   21 +
 include/sound/tas2781.h                            |  164 ++
 include/ufs/ufshcd.h                               |    2 +-
 kernel/events/core.c                               |   14 +-
 kernel/locking/rwsem.c                             |    8 +-
 kernel/sched/core.c                                |    4 +-
 kernel/time/tick-broadcast.c                       |  120 +-
 kernel/trace/fprobe.c                              |   73 +-
 kernel/trace/rethook.c                             |    4 +-
 lib/dim/dim.c                                      |    5 +-
 lib/dim/net_dim.c                                  |    3 +-
 lib/dim/rdma_dim.c                                 |    3 +-
 lib/maple_tree.c                                   |   12 +-
 mm/kfence/kfence.h                                 |    2 +-
 mm/shrinker_debug.c                                |   15 +-
 mm/vmscan.c                                        |    5 +-
 mm/zsmalloc.c                                      |   36 +-
 mm/zswap.c                                         |   16 +
 net/8021q/vlan_dev.c                               |    4 +-
 net/atm/resources.c                                |    2 +
 net/bridge/br_forward.c                            |    2 +-
 net/bridge/br_private_tunnel.h                     |    8 +-
 net/can/isotp.c                                    |    2 +-
 net/can/j1939/socket.c                             |    2 +-
 net/core/datagram.c                                |   15 +-
 net/core/dev.c                                     |    2 +-
 net/core/skbuff.c                                  |    4 +-
 net/core/stream.c                                  |   12 +-
 net/devlink/core.c                                 |   16 +-
 net/devlink/devl_internal.h                        |    1 -
 net/devlink/leftover.c                             |    5 +-
 net/ipv4/af_inet.c                                 |    2 +-
 net/ipv4/tcp.c                                     |   14 +-
 net/ipv4/tcp_bpf.c                                 |    2 +-
 net/ipv4/tcp_input.c                               |    4 +-
 net/ipv4/tcp_ipv4.c                                |    5 +-
 net/ipv6/ip6_fib.c                                 |   16 +-
 net/ipv6/ip6_gre.c                                 |   13 +-
 net/key/af_key.c                                   |   12 +-
 net/llc/af_llc.c                                   |    8 +-
 net/mac80211/cfg.c                                 |    7 +-
 net/mac80211/chan.c                                |   75 +-
 net/mac80211/ieee80211_i.h                         |    3 +-
 net/mac80211/trace.h                               |    2 +-
 net/mac80211/tx.c                                  |    5 +-
 net/mac80211/util.c                                |    2 +-
 net/netfilter/core.c                               |    6 +-
 net/netfilter/nf_conntrack_netlink.c               |    4 +
 net/netfilter/nf_conntrack_standalone.c            |    3 +-
 net/netfilter/nf_tables_api.c                      |    4 +-
 net/netfilter/nft_chain_filter.c                   |    9 +-
 net/netfilter/nft_set_rbtree.c                     |   20 +-
 net/netlink/af_netlink.c                           |    8 +-
 net/nsh/nsh.c                                      |    8 +-
 net/packet/af_packet.c                             |    6 +-
 net/smc/smc_close.c                                |    4 +-
 net/smc/smc_rx.c                                   |    4 +-
 net/smc/smc_tx.c                                   |    4 +-
 net/socket.c                                       |    2 +-
 net/sunrpc/auth_gss/gss_krb5_crypto.c              |   10 +
 net/sunrpc/svc.c                                   |   19 +-
 net/sunrpc/svc_xprt.c                              |   24 +-
 net/sunrpc/svcsock.c                               |   46 +-
 net/sunrpc/xprtrdma/svc_rdma_recvfrom.c            |   11 +-
 net/sunrpc/xprtrdma/svc_rdma_transport.c           |    2 +-
 net/tipc/bearer.c                                  |   17 +-
 net/tipc/bearer.h                                  |    3 +
 net/tipc/link.c                                    |    9 +-
 net/tipc/socket.c                                  |    4 +-
 net/tipc/udp_media.c                               |    5 +-
 net/tls/tls_main.c                                 |    3 +-
 net/unix/af_unix.c                                 |   22 +-
 net/vmw_vsock/af_vsock.c                           |    2 +-
 net/wireless/scan.c                                |    6 +-
 net/xfrm/xfrm_device.c                             |    2 +-
 net/xfrm/xfrm_interface_core.c                     |   54 +-
 net/xfrm/xfrm_policy.c                             |   20 +-
 net/xfrm/xfrm_user.c                               |   15 +-
 sound/core/oss/pcm_plugin.h                        |   16 +-
 sound/firewire/digi00x/digi00x-stream.c            |    4 +-
 sound/hda/hdac_regmap.c                            |    1 -
 sound/pci/cs46xx/cs46xx_lib.c                      |    2 +-
 sound/pci/hda/hda_bind.c                           |    1 -
 sound/pci/hda/hda_generic.c                        |    7 +-
 sound/pci/hda/patch_hdmi.c                         |    5 +
 sound/pci/hda/patch_realtek.c                      |   34 +-
 sound/soc/Kconfig                                  |    3 +
 sound/soc/Makefile                                 |    3 +
 sound/soc/amd/Kconfig                              |    5 +-
 sound/soc/amd/acp-da7219-max98357a.c               |   20 +-
 sound/soc/amd/acp-es8336.c                         |    2 +-
 sound/soc/amd/acp/acp-mach-common.c                |   43 +-
 sound/soc/amd/acp/acp-pci.c                        |    1 -
 sound/soc/amd/acp/acp-pdm.c                        |    2 +-
 sound/soc/amd/acp/acp-platform.c                   |    1 -
 sound/soc/amd/acp/acp-rembrandt.c                  |   25 -
 sound/soc/amd/acp/acp-renoir.c                     |   17 -
 sound/soc/amd/ps/Makefile                          |    2 +
 sound/soc/amd/ps/acp63.h                           |  183 +-
 sound/soc/amd/ps/pci-ps.c                          |  484 +++-
 sound/soc/amd/ps/ps-pdm-dma.c                      |   66 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      |  555 +++++
 sound/soc/amd/raven/acp3x-pcm-dma.c                |    3 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |    3 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c              |    4 +-
 sound/soc/amd/vangogh/acp5x.h                      |    2 +
 sound/soc/amd/vangogh/pci-acp5x.c                  |    7 +-
 sound/soc/amd/yc/acp6x-mach.c                      |    7 +
 sound/soc/amd/yc/acp6x-pdm-dma.c                   |    3 +-
 sound/soc/atmel/atmel-classd.c                     |    8 +-
 sound/soc/atmel/atmel-pdmic.c                      |    8 +-
 sound/soc/atmel/mchp-pdmc.c                        |    2 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |    1 -
 sound/soc/codecs/Kconfig                           |   67 +
 sound/soc/codecs/Makefile                          |   16 +
 sound/soc/codecs/ad193x-i2c.c                      |    2 +-
 sound/soc/codecs/adau1372-i2c.c                    |    2 +-
 sound/soc/codecs/adau1373.c                        |    2 +-
 sound/soc/codecs/adau1701.c                        |    2 +-
 sound/soc/codecs/adau1761-i2c.c                    |    2 +-
 sound/soc/codecs/adau1781-i2c.c                    |    2 +-
 sound/soc/codecs/adau17x1.c                        |   13 +-
 sound/soc/codecs/adau1977-i2c.c                    |    2 +-
 sound/soc/codecs/adau7118-i2c.c                    |    2 +-
 sound/soc/codecs/adav803.c                         |    2 +-
 sound/soc/codecs/ak4118.c                          |   13 +-
 sound/soc/codecs/ak4375.c                          |    2 +-
 sound/soc/codecs/ak4458.c                          |    2 +-
 sound/soc/codecs/ak4535.c                          |    2 +-
 sound/soc/codecs/ak4613.c                          |    2 +-
 sound/soc/codecs/ak4641.c                          |    2 +-
 sound/soc/codecs/ak4642.c                          |    2 +-
 sound/soc/codecs/ak4671.c                          |    2 +-
 sound/soc/codecs/ak5558.c                          |    2 +-
 sound/soc/codecs/alc5623.c                         |    2 +-
 sound/soc/codecs/alc5632.c                         |    2 +-
 sound/soc/codecs/aw88395/aw88395.c                 |    2 +-
 sound/soc/codecs/chv3-codec.c                      |   41 +
 sound/soc/codecs/cs35l32.c                         |    4 +-
 sound/soc/codecs/cs35l33.c                         |    4 +-
 sound/soc/codecs/cs35l34.c                         |    4 +-
 sound/soc/codecs/cs35l35.c                         |    4 +-
 sound/soc/codecs/cs35l36.c                         |    2 +-
 sound/soc/codecs/cs35l41-i2c.c                     |    2 +-
 sound/soc/codecs/cs35l45-i2c.c                     |    6 +-
 sound/soc/codecs/cs35l45-spi.c                     |    4 +-
 sound/soc/codecs/cs35l45-tables.c                  |    2 +-
 sound/soc/codecs/cs35l45.c                         |    4 +-
 sound/soc/codecs/cs35l45.h                         |    2 +-
 sound/soc/codecs/cs35l56-i2c.c                     |    2 +-
 sound/soc/codecs/cs35l56.c                         |   65 +-
 sound/soc/codecs/cs4234.c                          |    4 +-
 sound/soc/codecs/cs4265.c                          |    2 +-
 sound/soc/codecs/cs4270.c                          |    2 +-
 sound/soc/codecs/cs4271-i2c.c                      |    2 +-
 sound/soc/codecs/cs42l42-i2c.c                     |    2 +-
 sound/soc/codecs/cs42l42.c                         |    9 +-
 sound/soc/codecs/cs42l51-i2c.c                     |    2 +-
 sound/soc/codecs/cs42l51.c                         |    9 +-
 sound/soc/codecs/cs42l52.c                         |    2 +-
 sound/soc/codecs/cs42l56.c                         |    2 +-
 sound/soc/codecs/cs42l73.c                         |    4 +-
 sound/soc/codecs/cs42l83-i2c.c                     |    4 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |    2 +-
 sound/soc/codecs/cs43130.c                         |    4 +-
 sound/soc/codecs/cs4341.c                          |    2 +-
 sound/soc/codecs/cs4349.c                          |    2 +-
 sound/soc/codecs/cs53l30.c                         |   14 +-
 sound/soc/codecs/cx2072x.c                         |    2 +-
 sound/soc/codecs/da7210.c                          |    2 +-
 sound/soc/codecs/da7213.c                          |    2 +-
 sound/soc/codecs/da7218.c                          |    2 +-
 sound/soc/codecs/da7219-aad.c                      |   42 +-
 sound/soc/codecs/da7219.c                          |    2 +-
 sound/soc/codecs/da732x.c                          |    2 +-
 sound/soc/codecs/da9055.c                          |    2 +-
 sound/soc/codecs/es8316.c                          |   27 +-
 sound/soc/codecs/es8326.c                          |    2 +-
 sound/soc/codecs/es8328-i2c.c                      |    2 +-
 sound/soc/codecs/es8328.c                          |    2 +-
 sound/soc/codecs/isabelle.c                        |    2 +-
 sound/soc/codecs/lm4857.c                          |    2 +-
 sound/soc/codecs/lm49453.c                         |    2 +-
 sound/soc/codecs/max9768.c                         |    2 +-
 sound/soc/codecs/max98088.c                        |   24 +-
 sound/soc/codecs/max98090.c                        |   56 +-
 sound/soc/codecs/max98090.h                        |    3 +-
 sound/soc/codecs/max98095.c                        |    2 +-
 sound/soc/codecs/max98363.c                        |    6 -
 sound/soc/codecs/max98371.c                        |    2 +-
 sound/soc/codecs/max98373-i2c.c                    |    4 +-
 sound/soc/codecs/max98388.c                        | 1013 ++++++++
 sound/soc/codecs/max98388.h                        |  234 ++
 sound/soc/codecs/max98390.c                        |    2 +-
 sound/soc/codecs/max98396.c                        |    2 +-
 sound/soc/codecs/max9850.c                         |    2 +-
 sound/soc/codecs/max98504.c                        |    2 +-
 sound/soc/codecs/max98520.c                        |    2 +-
 sound/soc/codecs/max9860.c                         |    2 +-
 sound/soc/codecs/max9867.c                         |    2 +-
 sound/soc/codecs/max9877.c                         |    2 +-
 sound/soc/codecs/max98925.c                        |    2 +-
 sound/soc/codecs/max98926.c                        |    2 +-
 sound/soc/codecs/max98927.c                        |    2 +-
 sound/soc/codecs/ml26124.c                         |    2 +-
 sound/soc/codecs/mt6359.c                          |  152 +-
 sound/soc/codecs/mt6660.c                          |    2 +-
 sound/soc/codecs/nau8540.c                         |    2 +-
 sound/soc/codecs/nau8810.c                         |    2 +-
 sound/soc/codecs/nau8821.c                         |    2 +-
 sound/soc/codecs/nau8822.c                         |    2 +-
 sound/soc/codecs/nau8824.c                         |    2 +-
 sound/soc/codecs/nau8825.c                         |  150 +-
 sound/soc/codecs/nau8825.h                         |   11 +
 sound/soc/codecs/pcm1681.c                         |    2 +-
 sound/soc/codecs/pcm1789-i2c.c                     |    2 +-
 sound/soc/codecs/pcm179x-i2c.c                     |    2 +-
 sound/soc/codecs/pcm186x-i2c.c                     |    2 +-
 sound/soc/codecs/pcm186x.c                         |    1 -
 sound/soc/codecs/pcm3060-i2c.c                     |    2 +-
 sound/soc/codecs/pcm3168a-i2c.c                    |    2 +-
 sound/soc/codecs/pcm512x-i2c.c                     |    2 +-
 sound/soc/codecs/rk3328_codec.c                    |    1 -
 sound/soc/codecs/rt1011.c                          |    4 +-
 sound/soc/codecs/rt1015.c                          |    2 +-
 sound/soc/codecs/rt1016.c                          |    2 +-
 sound/soc/codecs/rt1019.c                          |    4 +-
 sound/soc/codecs/rt1305.c                          |    4 +-
 sound/soc/codecs/rt1308-sdw.c                      |    7 +-
 sound/soc/codecs/rt1308-sdw.h                      |    1 -
 sound/soc/codecs/rt1308.c                          |    4 +-
 sound/soc/codecs/rt1316-sdw.c                      |    7 +-
 sound/soc/codecs/rt1316-sdw.h                      |    1 -
 sound/soc/codecs/rt1318-sdw.c                      |    7 +-
 sound/soc/codecs/rt1318-sdw.h                      |    1 -
 sound/soc/codecs/rt274.c                           |    2 +-
 sound/soc/codecs/rt286.c                           |    2 +-
 sound/soc/codecs/rt298.c                           |    2 +-
 sound/soc/codecs/rt5514.c                          |    4 +-
 sound/soc/codecs/rt5616.c                          |    4 +-
 sound/soc/codecs/rt5631.c                          |    4 +-
 sound/soc/codecs/rt5640.c                          |    4 +-
 sound/soc/codecs/rt5645.c                          |    6 +-
 sound/soc/codecs/rt5651.c                          |    4 +-
 sound/soc/codecs/rt5659.c                          |   12 +-
 sound/soc/codecs/rt5660.c                          |    4 +-
 sound/soc/codecs/rt5663.c                          |    6 +-
 sound/soc/codecs/rt5665.c                          |    4 +-
 sound/soc/codecs/rt5668.c                          |    4 +-
 sound/soc/codecs/rt5670.c                          |    4 +-
 sound/soc/codecs/rt5677.c                          |    4 +-
 sound/soc/codecs/rt5682-i2c.c                      |    5 +-
 sound/soc/codecs/rt5682-sdw.c                      |    7 +-
 sound/soc/codecs/rt5682.h                          |    1 -
 sound/soc/codecs/rt5682s.c                         |   16 +-
 sound/soc/codecs/rt700-sdw.c                       |    7 +-
 sound/soc/codecs/rt700.h                           |    1 -
 sound/soc/codecs/rt711-sdca-sdw.c                  |    9 +-
 sound/soc/codecs/rt711-sdca.h                      |    1 -
 sound/soc/codecs/rt711-sdw.c                       |    7 +-
 sound/soc/codecs/rt711.h                           |    1 -
 sound/soc/codecs/rt712-sdca-dmic.c                 |    9 +-
 sound/soc/codecs/rt712-sdca-dmic.h                 |    1 -
 sound/soc/codecs/rt712-sdca-sdw.c                  |    9 +-
 sound/soc/codecs/rt712-sdca.h                      |    1 -
 sound/soc/codecs/rt715-sdca-sdw.c                  |    9 +-
 sound/soc/codecs/rt715-sdca.h                      |    1 -
 sound/soc/codecs/rt715-sdw.c                       |    6 +-
 sound/soc/codecs/rt715.h                           |    1 -
 sound/soc/codecs/rt722-sdca-sdw.c                  |  507 ++++
 sound/soc/codecs/rt722-sdca-sdw.h                  |  124 +
 sound/soc/codecs/rt722-sdca.c                      | 1555 +++++++++++++
 sound/soc/codecs/rt722-sdca.h                      |  237 ++
 sound/soc/codecs/rt9120.c                          |    2 +-
 sound/soc/codecs/sgtl5000.c                        |    2 +-
 sound/soc/codecs/sma1303.c                         |    2 +-
 sound/soc/codecs/src4xxx-i2c.c                     |    2 +-
 sound/soc/codecs/ssm2518.c                         |    2 +-
 sound/soc/codecs/ssm2602-i2c.c                     |    2 +-
 sound/soc/codecs/ssm3515.c                         |  448 ++++
 sound/soc/codecs/ssm4567.c                         |    2 +-
 sound/soc/codecs/sta32x.c                          |    2 +-
 sound/soc/codecs/sta350.c                          |    2 +-
 sound/soc/codecs/sta529.c                          |    2 +-
 sound/soc/codecs/tas2552.c                         |    2 +-
 sound/soc/codecs/tas2562.c                         |    3 +-
 sound/soc/codecs/tas2764.c                         |    2 +-
 sound/soc/codecs/tas2770.c                         |    2 +-
 sound/soc/codecs/tas2780.c                         |    2 +-
 sound/soc/codecs/tas2781-comlib.c                  |  534 +++++
 sound/soc/codecs/tas2781-fmwlib.c                  | 2428 ++++++++++++++++++++
 sound/soc/codecs/tas2781-i2c.c                     |  763 ++++++
 sound/soc/codecs/tas5086.c                         |    2 +-
 sound/soc/codecs/tas571x.c                         |    2 +-
 sound/soc/codecs/tas5720.c                         |    3 +-
 sound/soc/codecs/tas5805m.c                        |    2 +-
 sound/soc/codecs/tas6424.c                         |    3 +-
 sound/soc/codecs/tda7419.c                         |    2 +-
 sound/soc/codecs/tfa9879.c                         |    2 +-
 sound/soc/codecs/tfa989x.c                         |    2 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    2 +-
 sound/soc/codecs/tlv320adcx140.c                   |    2 +-
 sound/soc/codecs/tlv320aic23-i2c.c                 |    2 +-
 sound/soc/codecs/tlv320aic31xx.c                   |    2 +-
 sound/soc/codecs/tlv320aic32x4-i2c.c               |    2 +-
 sound/soc/codecs/tlv320aic3x-i2c.c                 |    2 +-
 sound/soc/codecs/tlv320dac33.c                     |    2 +-
 sound/soc/codecs/tpa6130a2.c                       |    2 +-
 sound/soc/codecs/ts3a227e.c                        |    2 +-
 sound/soc/codecs/tscs42xx.c                        |    2 +-
 sound/soc/codecs/tscs454.c                         |    2 +-
 sound/soc/codecs/uda1380.c                         |    2 +-
 sound/soc/codecs/wcd938x-sdw.c                     |    2 +-
 sound/soc/codecs/wm0010.c                          |    3 +
 sound/soc/codecs/wm1250-ev1.c                      |    2 +-
 sound/soc/codecs/wm2000.c                          |    2 +-
 sound/soc/codecs/wm2200.c                          |    2 +-
 sound/soc/codecs/wm5100.c                          |    2 +-
 sound/soc/codecs/wm8510.c                          |    2 +-
 sound/soc/codecs/wm8523.c                          |    2 +-
 sound/soc/codecs/wm8580.c                          |    2 +-
 sound/soc/codecs/wm8711.c                          |    2 +-
 sound/soc/codecs/wm8728.c                          |    2 +-
 sound/soc/codecs/wm8731-i2c.c                      |    2 +-
 sound/soc/codecs/wm8737.c                          |    2 +-
 sound/soc/codecs/wm8741.c                          |    2 +-
 sound/soc/codecs/wm8750.c                          |    2 +-
 sound/soc/codecs/wm8753.c                          |    2 +-
 sound/soc/codecs/wm8776.c                          |    2 +-
 sound/soc/codecs/wm8804-i2c.c                      |    2 +-
 sound/soc/codecs/wm8900.c                          |    2 +-
 sound/soc/codecs/wm8903.c                          |    2 +-
 sound/soc/codecs/wm8904.c                          |    2 +-
 sound/soc/codecs/wm8940.c                          |    2 +-
 sound/soc/codecs/wm8955.c                          |    2 +-
 sound/soc/codecs/wm8960.c                          |    2 +-
 sound/soc/codecs/wm8961.c                          |    2 +-
 sound/soc/codecs/wm8962.c                          |    2 +-
 sound/soc/codecs/wm8971.c                          |    2 +-
 sound/soc/codecs/wm8974.c                          |    2 +-
 sound/soc/codecs/wm8978.c                          |    2 +-
 sound/soc/codecs/wm8983.c                          |    2 +-
 sound/soc/codecs/wm8985.c                          |    2 +-
 sound/soc/codecs/wm8988.c                          |    2 +-
 sound/soc/codecs/wm8990.c                          |    2 +-
 sound/soc/codecs/wm8991.c                          |    2 +-
 sound/soc/codecs/wm8993.c                          |    2 +-
 sound/soc/codecs/wm8995.c                          |    2 +-
 sound/soc/codecs/wm8996.c                          |    2 +-
 sound/soc/codecs/wm9081.c                          |    2 +-
 sound/soc/codecs/wm9090.c                          |    2 +-
 sound/soc/codecs/wm_adsp.c                         |   21 +-
 sound/soc/codecs/wsa883x.c                         |    3 +-
 sound/soc/codecs/wsa884x.c                         | 1936 ++++++++++++++++
 sound/soc/dwc/dwc-i2s.c                            |   78 +-
 sound/soc/dwc/local.h                              |    7 +
 sound/soc/fsl/fsl-asoc-card.c                      |   22 +-
 sound/soc/fsl/fsl_sai.c                            |   24 +-
 sound/soc/fsl/fsl_sai.h                            |    2 +
 sound/soc/fsl/imx-audmix.c                         |   24 +-
 sound/soc/fsl/imx-card.c                           |   25 +-
 sound/soc/fsl/imx-rpmsg.c                          |    6 +-
 sound/soc/fsl/imx-spdif.c                          |    8 +-
 sound/soc/generic/audio-graph-card.c               |  107 +-
 .../generic/audio-graph-card2-custom-sample.dtsi   |  165 +-
 sound/soc/generic/audio-graph-card2.c              |  107 +-
 sound/soc/generic/simple-card-utils.c              |  118 +-
 sound/soc/generic/simple-card.c                    |    4 +-
 sound/soc/google/Kconfig                           |    6 +
 sound/soc/google/Makefile                          |    2 +
 sound/soc/google/chv3-i2s.c                        |  338 +++
 sound/soc/intel/atom/sst/sst_acpi.c                |    1 -
 sound/soc/intel/atom/sst/sst_ipc.c                 |    1 -
 sound/soc/intel/atom/sst/sst_loader.c              |    1 -
 sound/soc/intel/atom/sst/sst_pci.c                 |    1 -
 sound/soc/intel/atom/sst/sst_stream.c              |    1 -
 sound/soc/intel/avs/boards/da7219.c                |   45 +-
 sound/soc/intel/avs/boards/dmic.c                  |    2 -
 sound/soc/intel/avs/boards/hdaudio.c               |   65 +-
 sound/soc/intel/avs/boards/i2s_test.c              |    6 +-
 sound/soc/intel/avs/boards/max98357a.c             |   39 +-
 sound/soc/intel/avs/boards/max98373.c              |   45 +-
 sound/soc/intel/avs/boards/max98927.c              |   45 +-
 sound/soc/intel/avs/boards/nau8825.c               |   45 +-
 sound/soc/intel/avs/boards/rt274.c                 |   45 +-
 sound/soc/intel/avs/boards/rt286.c                 |   45 +-
 sound/soc/intel/avs/boards/rt298.c                 |   45 +-
 sound/soc/intel/avs/boards/rt5682.c                |   45 +-
 sound/soc/intel/avs/boards/ssm4567.c               |   57 +-
 sound/soc/intel/boards/Kconfig                     |    4 +
 sound/soc/intel/boards/Makefile                    |   10 +-
 sound/soc/intel/boards/ehl_rt5660.c                |    8 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    8 +-
 sound/soc/intel/boards/sof_cs42l42.c               |   11 +-
 sound/soc/intel/boards/sof_es8336.c                |   11 +-
 sound/soc/intel/boards/sof_nau8825.c               |   21 +-
 sound/soc/intel/boards/sof_pcm512x.c               |    3 +-
 sound/soc/intel/boards/sof_rt5682.c                |   94 +-
 sound/soc/intel/boards/sof_sdw.c                   |  669 ++++--
 sound/soc/intel/boards/sof_sdw_common.h            |   86 +-
 sound/soc/intel/boards/sof_sdw_cs42l42.c           |  131 ++
 .../boards/{sof_sdw_max98373.c => sof_sdw_maxim.c} |   59 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |    4 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c        |  102 +
 ..._rt711_sdca.c => sof_sdw_rt_sdca_jack_common.c} |   73 +-
 sound/soc/intel/boards/sof_ssp_amp.c               |   29 +-
 sound/soc/intel/common/Makefile                    |    1 +
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   46 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   72 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |  167 ++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |   54 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   53 +
 sound/soc/jz4740/jz4740-i2s.c                      |    9 +
 sound/soc/loongson/Kconfig                         |   27 +
 sound/soc/loongson/Makefile                        |    8 +
 sound/soc/loongson/loongson_card.c                 |  218 ++
 sound/soc/loongson/loongson_dma.c                  |  350 +++
 sound/soc/loongson/loongson_dma.h                  |   16 +
 sound/soc/loongson/loongson_i2s.c                  |  269 +++
 sound/soc/loongson/loongson_i2s.h                  |   71 +
 sound/soc/loongson/loongson_i2s_pci.c              |  171 ++
 sound/soc/mediatek/Kconfig                         |    5 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c   |   53 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |   13 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |    2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-control.c     |    1 -
 .../mt8186/mt8186-mt6366-da7219-max98357.c         |    1 -
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |    1 -
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c         |  142 +-
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h         |   15 +
 sound/soc/mediatek/mt8188/mt8188-afe-common.h      |    3 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c         |  113 +-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c        |  110 +-
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c        |  922 ++++----
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |  453 +++-
 sound/soc/mediatek/mt8188/mt8188-reg.h             |    2 +
 sound/soc/mediatek/mt8192/mt8192-afe-control.c     |    2 -
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         |   99 +-
 sound/soc/meson/axg-card.c                         |   11 +-
 sound/soc/meson/gx-card.c                          |    3 +-
 sound/soc/meson/meson-card-utils.c                 |   26 +-
 sound/soc/meson/meson-card.h                       |    3 +-
 sound/soc/qcom/common.c                            |   34 +-
 sound/soc/qcom/lpass-sc7180.c                      |    2 +-
 sound/soc/qcom/lpass-sc7280.c                      |    2 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |  325 ++-
 sound/soc/qcom/qdsp6/audioreach.h                  |   63 +
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |   34 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  445 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |   39 +
 sound/soc/qcom/qdsp6/q6apm.c                       |   68 +
 sound/soc/qcom/qdsp6/q6apm.h                       |    6 +
 sound/soc/qcom/qdsp6/q6dsp-common.c                |   35 +
 sound/soc/qcom/qdsp6/q6dsp-common.h                |    1 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           |   43 +-
 sound/soc/qcom/sc7280.c                            |   23 +-
 sound/soc/samsung/odroid.c                         |   16 +-
 sound/soc/sh/siu_dai.c                             |    2 +
 sound/soc/soc-component.c                          |   22 +
 sound/soc/soc-compress.c                           |    1 -
 sound/soc/soc-core.c                               |  112 +-
 sound/soc/soc-dapm.c                               |   75 +-
 sound/soc/soc-pcm.c                                |  209 +-
 sound/soc/soc-topology.c                           |   91 +-
 sound/soc/soc-utils.c                              |    7 +
 sound/soc/sof/Kconfig                              |   11 +
 sound/soc/sof/Makefile                             |    2 +
 sound/soc/sof/amd/acp-ipc.c                        |    7 +
 sound/soc/sof/amd/acp.h                            |    3 +
 sound/soc/sof/amd/pci-rmb.c                        |    3 +
 sound/soc/sof/amd/pci-rn.c                         |    3 +
 sound/soc/sof/core.c                               |    4 +-
 sound/soc/sof/intel/Kconfig                        |    3 +-
 sound/soc/sof/intel/hda-bus.c                      |   11 +-
 sound/soc/sof/intel/hda-dai-ops.c                  |  137 +-
 sound/soc/sof/intel/hda-dai.c                      |  168 +-
 sound/soc/sof/intel/hda-loader-skl.c               |    1 -
 sound/soc/sof/intel/hda-pcm.c                      |    2 +-
 sound/soc/sof/intel/hda-stream.c                   |    1 -
 sound/soc/sof/intel/hda.c                          |   43 +-
 sound/soc/sof/intel/hda.h                          |   25 +-
 sound/soc/sof/intel/mtl.c                          |   64 +-
 sound/soc/sof/intel/mtl.h                          |    7 +
 sound/soc/sof/intel/skl.c                          |    1 -
 sound/soc/sof/intel/tgl.c                          |   10 +-
 sound/soc/sof/ipc3-control.c                       |   54 +-
 sound/soc/sof/ipc3-priv.h                          |    2 +
 sound/soc/sof/ipc3.c                               |  102 +-
 sound/soc/sof/ipc4-control.c                       |   39 +-
 sound/soc/sof/ipc4-loader.c                        |   72 +-
 sound/soc/sof/ipc4-pcm.c                           |    4 +-
 sound/soc/sof/ipc4-priv.h                          |   10 +-
 sound/soc/sof/ipc4-topology.c                      |  459 ++--
 sound/soc/sof/ipc4-topology.h                      |   74 +-
 sound/soc/sof/ipc4.c                               |   44 +-
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c         |    1 -
 sound/soc/sof/mediatek/mt8186/mt8186.c             |  119 +-
 sound/soc/sof/mediatek/mt8186/mt8186.h             |    5 +
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c         |    1 -
 sound/soc/sof/mediatek/mt8195/mt8195.c             |   36 +-
 sound/soc/sof/nocodec.c                            |    8 +-
 sound/soc/sof/pcm.c                                |    2 +-
 sound/soc/sof/pm.c                                 |   12 +-
 sound/soc/sof/sof-audio.c                          |   47 +-
 sound/soc/sof/sof-audio.h                          |    1 +
 sound/soc/sof/sof-client-ipc-kernel-injector.c     |  162 ++
 sound/soc/sof/sof-client.c                         |   52 +
 sound/soc/sof/sof-client.h                         |    1 +
 sound/soc/sof/sof-priv.h                           |    3 +
 sound/soc/sof/topology.c                           |    2 +-
 sound/soc/starfive/Kconfig                         |   15 +
 sound/soc/starfive/Makefile                        |    2 +
 sound/soc/starfive/jh7110_tdm.c                    |  670 ++++++
 sound/soc/stm/stm32_sai_sub.c                      |    9 +-
 sound/soc/tegra/tegra186_asrc.c                    |    4 +-
 sound/soc/tegra/tegra20_ac97.c                     |    1 -
 sound/soc/tegra/tegra20_i2s.c                      |    9 +-
 sound/soc/tegra/tegra20_spdif.c                    |    9 +-
 sound/soc/tegra/tegra210_adx.c                     |    2 +-
 sound/soc/tegra/tegra210_ahub.c                    |   10 -
 sound/soc/ti/davinci-mcasp.c                       |   27 +-
 sound/soc/ti/omap-hdmi.c                           |    8 +-
 sound/soc/ti/omap-mcbsp-st.c                       |    1 -
 sound/usb/format.c                                 |    1 +
 tools/arch/arm64/include/uapi/asm/kvm.h            |   36 +
 tools/arch/x86/include/asm/cpufeatures.h           |   26 +-
 tools/arch/x86/include/asm/disabled-features.h     |    8 +-
 tools/arch/x86/include/asm/msr-index.h             |    2 +
 tools/arch/x86/include/uapi/asm/kvm.h              |    3 +
 tools/arch/x86/include/uapi/asm/prctl.h            |    8 +
 tools/arch/x86/include/uapi/asm/unistd_32.h        |    3 +
 tools/arch/x86/lib/memcpy_64.S                     |   34 +-
 tools/arch/x86/lib/memset_64.S                     |   47 +-
 tools/include/asm/alternative.h                    |    3 +-
 tools/include/uapi/drm/drm.h                       |   57 +-
 tools/include/uapi/drm/i915_drm.h                  |   25 +-
 tools/include/uapi/linux/const.h                   |    2 +-
 tools/include/uapi/linux/in.h                      |    1 +
 tools/include/uapi/linux/kvm.h                     |   12 +-
 tools/include/uapi/linux/prctl.h                   |    2 +
 tools/include/uapi/sound/asound.h                  |   14 +-
 tools/perf/Makefile.config                         |    6 +
 tools/perf/Makefile.perf                           |   22 +-
 tools/perf/arch/arm/util/cs-etm.c                  |    9 +-
 tools/perf/arch/arm64/util/header.c                |    4 +-
 tools/perf/arch/arm64/util/pmu.c                   |    2 +-
 tools/perf/arch/s390/entry/syscalls/syscall.tbl    |    2 +-
 tools/perf/bench/mem-memcpy-x86-64-asm-def.h       |    4 -
 tools/perf/bench/mem-memcpy-x86-64-asm.S           |    2 +-
 tools/perf/bench/mem-memset-x86-64-asm-def.h       |    4 -
 tools/perf/bench/mem-memset-x86-64-asm.S           |    2 +-
 tools/perf/builtin-script.c                        |    7 +
 tools/perf/builtin-stat.c                          |   38 +-
 .../pmu-events/arch/x86/alderlake/adl-metrics.json |   26 +
 .../arch/x86/alderlaken/adln-metrics.json          |   14 +
 .../pmu-events/arch/x86/broadwell/bdw-metrics.json |   12 +
 .../arch/x86/broadwellde/bdwde-metrics.json        |   12 +
 .../arch/x86/broadwellx/bdx-metrics.json           |   12 +
 .../arch/x86/cascadelakex/clx-metrics.json         |   12 +
 .../pmu-events/arch/x86/haswell/hsw-metrics.json   |   12 +
 .../pmu-events/arch/x86/haswellx/hsx-metrics.json  |   12 +
 .../pmu-events/arch/x86/icelake/icl-metrics.json   |   12 +
 .../pmu-events/arch/x86/icelakex/icx-metrics.json  |   12 +
 .../pmu-events/arch/x86/ivybridge/ivb-metrics.json |   12 +
 .../pmu-events/arch/x86/ivytown/ivt-metrics.json   |   12 +
 .../pmu-events/arch/x86/jaketown/jkt-metrics.json  |   12 +
 .../arch/x86/sandybridge/snb-metrics.json          |   12 +
 .../arch/x86/sapphirerapids/spr-metrics.json       |   12 +
 .../pmu-events/arch/x86/skylake/skl-metrics.json   |   12 +
 .../pmu-events/arch/x86/skylakex/skx-metrics.json  |   12 +
 .../pmu-events/arch/x86/tigerlake/tgl-metrics.json |   12 +
 tools/perf/pmu-events/jevents.py                   |    4 +-
 tools/perf/pmu-events/pmu-events.h                 |    1 +
 tools/perf/tests/attr.py                           |    6 +-
 tools/perf/tests/attr/base-stat                    |    2 +-
 tools/perf/tests/attr/test-stat-default            |   80 +-
 tools/perf/tests/attr/test-stat-detailed-1         |   95 +-
 tools/perf/tests/attr/test-stat-detailed-2         |  119 +-
 tools/perf/tests/attr/test-stat-detailed-3         |  127 +-
 tools/perf/tests/expr.c                            |    3 +-
 tools/perf/tests/parse-metric.c                    |    1 +
 tools/perf/tests/shell/stat.sh                     |   13 +
 tools/perf/tests/shell/test_intel_pt.sh            |    7 +
 tools/perf/tests/shell/test_java_symbol.sh         |    2 +-
 tools/perf/trace/beauty/arch_prctl.c               |    2 +
 tools/perf/trace/beauty/x86_arch_prctl.sh          |    1 +
 tools/perf/util/bpf_skel/lock_contention.bpf.c     |    2 +
 tools/perf/util/bpf_skel/vmlinux.h                 |    1 +
 tools/perf/util/evsel.c                            |   37 +-
 tools/perf/util/evsel.h                            |    1 +
 tools/perf/util/expr.y                             |    6 +-
 tools/perf/util/metricgroup.c                      |   10 +-
 tools/perf/util/parse-events.c                     |   23 +-
 tools/perf/util/stat-display.c                     |    2 +-
 tools/perf/util/stat-shadow.c                      |   25 +-
 tools/power/cpupower/lib/powercap.c                |   23 +-
 .../cpupower/utils/idle_monitor/mperf_monitor.c    |   31 +-
 tools/testing/cxl/test/mock.c                      |    2 +-
 .../selftests/drivers/net/bonding/bond_options.sh  |   50 +
 .../drivers/net/bonding/bond_topo_3d1c.sh          |    2 +
 tools/testing/selftests/ftrace/Makefile            |    3 +-
 tools/testing/selftests/ftrace/ftracetest          |   63 +-
 tools/testing/selftests/ftrace/ftracetest-ktap     |    8 +
 tools/testing/selftests/net/fib_nexthops.sh        |    2 +-
 tools/testing/selftests/net/forwarding/lib.sh      |    3 +-
 .../selftests/net/srv6_end_dt4_l3vpn_test.sh       |   17 +-
 tools/testing/selftests/netfilter/nft_flowtable.sh |  145 +-
 tools/testing/selftests/sgx/Makefile               |    1 +
 virt/kvm/kvm_main.c                                |   59 +-
 1093 files changed, 28206 insertions(+), 7728 deletions(-)
 delete mode 100644 Documentation/block/request.rst
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98388.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm2518.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/da7219.txt
 create mode 100644 Documentation/devicetree/bindings/sound/dialog,da7219.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8315.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8540.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8810.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8824.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8315.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8810.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1016.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt1016.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/ssm2518.txt
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
 create mode 100644 arch/um/drivers/harddog.h
 create mode 100644 arch/um/drivers/harddog_user_exp.c
 create mode 100644 include/sound/tas2781-dsp.h
 create mode 100644 include/sound/tas2781-tlv.h
 create mode 100644 include/sound/tas2781.h
 create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c
 create mode 100644 sound/soc/codecs/chv3-codec.c
 create mode 100644 sound/soc/codecs/max98388.c
 create mode 100644 sound/soc/codecs/max98388.h
 create mode 100644 sound/soc/codecs/rt722-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt722-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt722-sdca.c
 create mode 100644 sound/soc/codecs/rt722-sdca.h
 create mode 100644 sound/soc/codecs/ssm3515.c
 create mode 100644 sound/soc/codecs/tas2781-comlib.c
 create mode 100644 sound/soc/codecs/tas2781-fmwlib.c
 create mode 100644 sound/soc/codecs/tas2781-i2c.c
 create mode 100644 sound/soc/codecs/wsa884x.c
 create mode 100644 sound/soc/google/Kconfig
 create mode 100644 sound/soc/google/Makefile
 create mode 100644 sound/soc/google/chv3-i2s.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs42l42.c
 rename sound/soc/intel/boards/{sof_sdw_max98373.c => sof_sdw_maxim.c} (65%)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt712_sdca.c
 rename sound/soc/intel/boards/{sof_sdw_rt711_sdca.c => sof_sdw_rt_sdca_jack_common.c} (61%)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-lnl-match.c
 create mode 100644 sound/soc/loongson/Kconfig
 create mode 100644 sound/soc/loongson/Makefile
 create mode 100644 sound/soc/loongson/loongson_card.c
 create mode 100644 sound/soc/loongson/loongson_dma.c
 create mode 100644 sound/soc/loongson/loongson_dma.h
 create mode 100644 sound/soc/loongson/loongson_i2s.c
 create mode 100644 sound/soc/loongson/loongson_i2s.h
 create mode 100644 sound/soc/loongson/loongson_i2s_pci.c
 create mode 100644 sound/soc/sof/sof-client-ipc-kernel-injector.c
 create mode 100644 sound/soc/starfive/Kconfig
 create mode 100644 sound/soc/starfive/Makefile
 create mode 100644 sound/soc/starfive/jh7110_tdm.c
 create mode 100755 tools/testing/selftests/ftrace/ftracetest-ktap

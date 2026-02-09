Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAVCD0oNimkQGAAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Feb 2026 17:37:30 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49F11290F
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Feb 2026 17:37:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD82601F4;
	Mon,  9 Feb 2026 17:29:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD82601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770654581;
	bh=XuRQhCem9vVQrgOOhe9K4rhlLmSkPdkcOGGXoKMD1+4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UBNt+HZW4oy7xAmIVPqQHwAHga1VOToq04B3EIvBaXV4rt2+ASFiJ0SjvX8bts+px
	 lvnQFdbdlO4XUwFleFhQo1JW4jRsu27rxg3QEucxSXiaomWELsi458tJibikyBbgFb
	 epD9enIxKuxbncGjNgVPtVEnPc69EqL1sPcZcW3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B23F5F805EA; Mon,  9 Feb 2026 17:29:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 418B6F805E5;
	Mon,  9 Feb 2026 17:29:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B5DFF80448; Mon,  9 Feb 2026 17:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,
	SPF_NONE shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2C7AF80093
	for <alsa-devel@alsa-project.org>; Mon,  9 Feb 2026 17:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C7AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aTc+L8i4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF671600CB;
	Mon,  9 Feb 2026 16:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BA2C2BC86;
	Mon,  9 Feb 2026 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770654373;
	bh=XuRQhCem9vVQrgOOhe9K4rhlLmSkPdkcOGGXoKMD1+4=;
	h=From:To:Cc:Subject:Date:From;
	b=aTc+L8i479H7NRQVhDWIwjpMhqNh33V90RyWfSLT5vVCCJhQJgiviRrlOzxNHV0Cq
	 LBzNKWW4TOc90vFiliHzEYSeGNsIqrReZvjTQ0O6qNMT4X0XRU0eEug8Em+BiH30UG
	 3rxKHxxpAE2md9pdiPu6Zq72pEscHcSXAf2bajexraJqn6U50GH9rE872HiQQ12zbl
	 nmPvU8a+91sxDf+SbDovKvZ3QVchsK53a1VzfliKInZVMm1mFSwwAjccjDZ7bnNaHc
	 gqpE1NGFEYQTDk9lwveKH/9uPoxAOsYQCiC9S1Rezyh5MpXTQsaRJeIh7bpmrywrOw
	 cf2mZH2AGjomg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 290911AC57EB; Mon, 09 Feb 2026 16:26:10 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.20
Date: Mon, 09 Feb 2026 16:26:05 +0000
Message-Id: <20260209162610.290911AC57EB@finisterre.sirena.org.uk>
Message-ID-Hash: 7M5JPNL5SA4GVXXNEDM6OCOMPEIAK5TO
X-Message-ID-Hash: 7M5JPNL5SA4GVXXNEDM6OCOMPEIAK5TO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7M5JPNL5SA4GVXXNEDM6OCOMPEIAK5TO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.29 / 15.00];
	R_BAD_CTE_7BIT(3.50)[unknown];
	BROKEN_CONTENT_TYPE(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:alsa-devel@alsa-project.org,m:broonie@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org,kernel.org];
	FORGED_SENDER(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,finisterre.sirena.org.uk:mid,alsa0.perex.cz:helo,alsa0.perex.cz:rdns];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF49F11290F
X-Rspamd-Action: no action

The following changes since commit 18f7fcd5e69a04df57b563360b88be72471d6b62:

  Linux 6.19-rc8 (2026-02-01 14:01:13 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.20

for you to fetch changes up to f8f774913b4b599169381073f6674e20976e5529:

  ASoC: SOF: ipc4-control: Set correct error code in refresh_bytes_control (2026-02-09 12:27:28 +0000)

----------------------------------------------------------------
ASoC: Updates for v7.0

This release is almost all abut driers, there's very little core work
here, although some of that driver work is in more generic areas like
SDCA and SOF:

 - Generic SDCA support for reporting jack events.
 - Continuing platform support, cleanup and feature improements for the
   AMD, Intel, Qualcomm and SOF code.
 - Platform description improvements for the Cirrus drivers.
 - Support for NXP i.MX952, Realtek RT1320 and RT5575, and Sophogo
   CV1800B.

We also pulled in one small SPI API update and some more substantial
regmap work (cache description improvements) for use in drivers.

----------------------------------------------------------------
Andy Shevchenko (2):
      ASoC: Fix acronym for Intel Gemini Lake
      ASoC: codecs: rt1320-sdw: Refactor to reduce stack frames

AngeloGioacchino Del Regno (1):
      ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names

Anton D. Stavinskii (7):
      ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM controller
      ASoC: sophgo: add CV1800B I2S/TDM controller driver
      ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC codec
      ASoC: sophgo: add CV1800B internal ADC codec driver
      ASoC: sophgo: add CV1800B internal DAC codec driver
      ASoC: sophgo: cv1800b: document DAC overwrite handling
      ASoC: sophgo: cv1800b: tidy Kconfig spacing

Arnd Bergmann (6):
      ASoC: rt1320: fix 32-bit link failure
      ASoC: rt1320: fix size_t format string
      ASoC: rt5575: fix SPI dependency
      ASoC: sophgo: fix 64-bit division build failure
      ASoC: fsl_sai: add IMX_SCMI_MISC_DRV dependency
      ASoC: SOF: Intel: select CONFIG_SND_HDA_EXT_CORE from SND_SOC_SOF_HDA_COMMON

Bard Liao (7):
      ASoC: soc-acpi-intel-arl-match: change rt722 amp endpoint to aggregated
      ASoC: soc-acpi-intel-ptl-match: use aggregated endpoint in ptl_rt722_l0_rt1320_l23
      ASoC: sdw_utils: remove dai registered check
      ASoC: SOF: Intel: add hda_dsp_stream_pair_get/put helpers
      ASoC: SOF: Intel: add hda_dma_prepare/cleanup helpers
      ASoC: SOF: Intel: hda-sdw-bpt: support simultaneous audio and BPT streams
      ASoC: SOF: Intel: allow module parameter override BT link to 0

Bartosz Golaszewski (1):
      ASoC: davinci-mcasp: remove unneeded #ifdef

Bharadwaj Raju (2):
      ASoC: dt-bindings: document dvdd-supply property for awinic,aw88261
      ASoC: codecs: aw88261: use dvdd-supply regulator

Biju Das (5):
      ASoC: renesas: rz-ssi: Use dev variable in probe()
      ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
      ASoC: renesas: rz-ssi: Move DMA configuration
      ASoC: renesas: rz-ssi: Add support for 24 bits sample width
      ASoC: renesas: rz-ssi: Add support for 32 bits sample width

Binbin Zhou (4):
      ASoC: codecs: es8323: Replace magic numbers with defined macros
      ASoC: codecs: es8323: remove DAC enablement write from es8323_set_bias_level
      ASoC: codecs: es8323: Enable proper DAPM widgets for capture ADC
      ASoC: codecs: es8323: Enable proper DAPM widgets for chip power

Boris Faure (1):
      ASoC: sdca: Fix missing regmap dependencies in Kconfig

Brahmajit Das (1):
      ASoC: Intel: avs: replace strcmp with sysfs_streq

Cezary Rojewski (5):
      ASoC: Intel: catpt: Move IPC error messages one level down
      ASoC: Intel: catpt: Update CATPT_IPC_ERROR macro
      ASoC: Intel: catpt: Simplify catpt_stream_read_position()
      ASoC: Intel: catpt: Specify image names in the device descriptor
      ASoC: Intel: catpt: Drop superfluous space in PCM code

Chancel Liu (2):
      ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX94
      ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX952

Charles Keepax (16):
      ASoC: SDCA: Factor out jack handling into new c file
      ASoC: SDCA: Add ability to connect SDCA jacks to ASoC jacks
      ASoC: SDCA: Add ASoC jack hookup in class driver
      ASoC: SDCA: Add SDCA IRQ enable/disable helpers
      ASoC: SDCA: Add basic system suspend support
      ASoC: SDCA: Device boot into the system suspend process
      ASoC: SDCA: Add lock to serialise the Function initialisation
      ASoC: SDCA: Tidy up some memory allocations
      ASoC: SDCA: Handle CONFIG_PM_SLEEP not being set
      ASoC: SDCA: Add NO_DIRECT_COMPLETE flag to class driver
      ASoC: SDCA: Remove outdated todo comment
      ASoC: SDCA: Handle volatile controls correctly
      ASoC: SDCA: Still process most of the jack detect if control is missing
      ASoC: SDCA: Rearrange FDL file messages
      ASoC: SDCA: Add regmap defaults for specification defined values
      ASoC: SDCA: Limit values user can write to Selected Mode

Chen Ni (4):
      ASoC: codecs: wm8731: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
      ASoC: sun4i-spdif: Add missing check for devm_regmap_init_mmio
      ASoC: sunxi: sun50i-dmic: Add missing check for devm_regmap_init_mmio
      ASoC: codecs: max98390: Check return value of devm_gpiod_get_optional() in max98390_i2c_probe()

ChiYuan Huang (3):
      ASoC: codecs: rtq9128: Modify the chip initial setting
      ASoC: dt-bindings: rtq9128: Add rtq9154 backward compatible
      ASoC: codecs: rtq9128: Add compatible changes for rtq9154

Chris Morgan (2):
      ASoC: dt-bindings: aw87390: Add Anbernic RG-DS Amplifier
      ASoC: codecs: aw87390: Add Anbernic RG-DS amp driver

Claudiu Beznea (5):
      ASoC: codecs: da7213: Move comma operator at the end of the line
      ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()
      ASoC: renesas: rz-ssi: Drop unnecessary if condition
      ASoC: renesas: rz-ssi: Drop the & operator in front of function name
      ASoC: renesas: rz-ssi: Drop goto label

Cristian Ciocaltea (7):
      ASoC: nau8821: Fixup nau8821_enable_jack_detect()
      ASoC: nau8821: Cancel delayed work on component remove
      ASoC: nau8821: Cancel pending work before suspend
      ASoC: nau8821: Drop superfluous return statement
      ASoC: nau8821: Simplify conditional in nau8821_get_osr()
      ASoC: nau8821: Drop unneeded braces in nau8821_hw_params()
      ASoC: nau8821: Sort #include directives

Cédric Bellegarde (1):
      ASoC: qcom: q6asm: drop DSP responses for closed data streams

Dan Carpenter (1):
      ASoC: rt1320: Fix retry checking in rt1320_rae_load()

David Lin (2):
      ASoC: Intel: ti-common: support tas2563 amplifier
      ASoC: Intel: sof_rt5682: add tas2563 speaker amp support

Emil Svendsen (1):
      ASoC: tlv320adcx140: add channel sum control

Emil-Juhl (4):
      ASoC: tlv320adcx140: power on/off the device on demand
      ASoC: tlv320adcx140: add avdd and iovdd supply
      ASoC: dt-bindings: clarify areg-supply documentation
      ASoC: tlv320adcx140: add kcontrol for num biquads

Ethan Nelson-Moore (1):
      ASoC: wcd-mbhc-v2: remove unnecessary module_init/exit functions

HariKrishna Sagala (5):
      ASoC: fsl: fsl_ssi: Replace deprecated strcpy() with strscpy()
      ASoC: codec: rt274: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
      ASoC: mediatek: mt8195: optimize property formatting error handling by using scnprintf()
      ASoC: codec: rt298: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
      ASoC: codec: rt286: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning

Harshit Mogalapalli (1):
      ASoC: cs4271: Fix resource leak in cs4271_soc_resume()

Hsieh Hung-En (7):
      ASoC: es8328: Remove duplicate DAPM routes
      ASoC: es8328: Propagate error codes from regmap updates
      ASoC: es8328: Fix DAC deemphasis control handling
      ASoC: es8328: Propagate errors in set_bias_level()
      ASoC: es8328: Check errors in set_dai_fmt()
      ASoC: es8328: Use cached regmap on resume
      ASoC: es8328: Add error unwind in resume

Johan Hovold (2):
      ASoc: qcom: q6afe: use guards consistently
      ASoC: codecs: wcd939x-sdw: use devres for regmap allocation

Jyri Sarha (4):
      ASoC: sof: ipc4-topology: Add topology tokens domain_in stack & heap_bytes
      ASoC: sof: Add domain_id, heap_bytes and stack_bytes to snd_sof_widget
      ASoC: SOF: ipc4: sof_ipc4_module_init_ext_init structs and macros
      ASoC: sof ipc4: Add sof_ipc4_widget_setup_msg_payload() and call it

Krzysztof Kozlowski (20):
      ASoC: qcom: q6prm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6asm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6apm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6afe: Fix confusing cleanup.h syntax
      ASoC: qcom: audioreach: Fix confusing cleanup.h syntax
      ASoC: qcom: Minor readability improve with new lines
      ASoC: amd: acp-sdw-legacy: Fix confusing cleanup.h syntax
      ASoC: amd: acp-sdw-sof: Fix confusing cleanup.h syntax
      ASoC: SDCA: functions: Fix confusing cleanup.h syntax
      ASoC: qcom: audioreach: Add support for Speaker Protection module
      ASoC: qcom: audioreach: Add support for VI Sense module
      ASoC: qcom: Constify APR callback response data
      soc: qcom: apr: Use typedef for GPR callback member
      ASoC: qcom: Constify GPR callback response data
      ASoC: qcom: Constify APR/GPR result structs
      ASoC: qcom: topology: Constify pointed topology and vendor structs
      ASoC: qcom: topology: Constify pointed ar control structs
      ASoC: qcom: topology: Constify pointed DAPM widget structs
      ASoC: qcom: topology: Constify pointed snd_soc_tplg_dapm_widget
      ASoC: qcom: audioreach: Constify function arguments

Kuan-Wei Chiu (1):
      dt-bindings: sound: google,goldfish-audio: Convert to DT schema

Kuninori Morimoto (15):
      ASoC: mediatek: mt8189-nau8825: don't use card->dapm directly
      ASoC: codecs: tas2780: tidyup format check in tas2780_set_fmt()
      ASoC: alc5623: tidyup clock inversion in alc5623_set_dai_fmt()
      ASoC: codecs: es8375: remove unnecessary format check
      ASoC: codecs: rt1320-sdw: convert to snd_soc_dapm_xxx()
      ASoC: intel: convert to snd_soc_dapm_xxx()
      ASoC: tlv320adcx140: don't use snd_soc_component_get_bias_level()
      ASoC: soc-component: remove snd_soc_component_xxx() wrapper
      ASoC: soc-component: remove compatibility definition for component
      ASoC: soc-dapm: remove compatibility definition for dapm
      ASoC: soc-dapm: remove dev from snd_soc_dapm_context()
      ASoC: soc-dapm: add snd_soc_dapm_alloc()
      ASoC: soc-dapm: move struct snd_soc_dapm_context
      ASoC: soc-dapm: tidyup function naming
      ASoC: soc-core: add lockdep_assert_held() at snd_soc_unregister_dai()

Laurentiu Mihalcea (1):
      ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs

Luca Weiss (2):
      ASoC: codecs: aw88261: Remove AW88261_I2C_NAME macro
      ASoC: codecs: aw88261: Add devicetree support

Mac Chiang (3):
      ASoC: sdw_utils: Add quirk to ignore RT722 DMIC DAI
      ASoC: Intel: soc-acpi-intel-ptl-match: drop rt721 related match tables
      ASoC: SOF: Intel: hda: add SDCA property check

Marco Crivellari (1):
      ASoC: SDCA: Replace use of system_wq with system_dfl_wq

Mark Brown (41):
      ASoC: qcom: Fix confusing cleanup.h
      Add {24,32}-bit sample width support for RZ/G2L SSI
      ASoC: amd/sdw: Fix confusing cleanup.h
      ASoC: Intel: catpt: IPC log improvements and code
      ASoC: SOF: Support for on-demand DSP boot
      ASoC: SOF: ipoc4: Support for generic bytes
      ASoC: codecs: ES8326 : Add Kcontrol
      ASoC: Intel: add support for TAS2563 amplifier
      ASoC / soc/qcom: Constify APR/GPR callback response
      SDCA Jack Fixups
      ASoC: qcom: Constify few things in audioreach and
      ASoC: nau8821: Fixes and driver cleanup
      firmware: cirrus: cs_dsp: Add long-offset WMDR
      ASoC: rt5575: Add the codec driver for the ALC5575
      ASoC: ES8389: Add some members and update
      ASoC: SOF: ipc4: Send heap/stack bytes via new
      ASoC: SOF: Use guard()/scoped_guard() for locks when
      sound: codecs: wm8962: Assorted fixes
      Add devicetree support for aw88261 amplifier driver &
      ASoC: Update rtq9128 document and source file
      ASoC: codecs: aw88261: add dvdd-supply property
      SDCA System Suspend Support
      sound: codecs: tlv320adcx140: assorted patches
      ASoC: codec: es8323: Enable DAPM for ADC and ChipPower
      ASoC: soc-acpi-intel-arl/ptl-match: use aggregated
      ASoC: renesas: rz-ssi: Cleanups
      ASoC: cs35l56: Add support for new Dell laptops
      ASoC: fsl_audmix: Support the i.MX952 platform
      ASoC: codec: Remove ak4641/pxa2xx-ac97 and convert to
      ASoC: capsuling struct snd_soc_dapm_context
      ASoC: sophgo: add CV1800 I2S controllers support
      regmap: reg_default_cb for flat cache defaults
      Anbernic RG-DS AW87391 Speaker Amps
      ASoC: amd: acp: Add ACP7.0 match entries for Cirrus
      ASoC: es8328: error handling and resume fixes
      ASoC: SOF: Intel: reserve link DMA for sdw bpt stream
      Minor SDCA Fixes
      ASoC: ti: davinci-mcasp: Add asynchronous mode
      ASoC: SOF: Support for echoref (virtual DAI)
      ASoC: cs35l56: More support for new Dell laptops
      ASoC: rockchip: spdif: Cleanups and port features

Nathan Chancellor (1):
      ASoC: rt1320: Change return type of rt1320_t0_load() to void

Niranjan H Y (9):
      ASoC: tas2783A: sdw_utils: support ch 3 & 4
      ASoC: tas2783A: use custom firmware
      ASoC: tas2783A: update default init writes
      ASoC: tas2783A: fix error log for calibration data
      ASoc: tas2783A: fw name based on system details
      ASoc: tas2783A: acpi match for 4 channel for mtl
      ASoC: tas2783A: use acpi initialisation table
      ASoC: tas2783A: read slave properties from acpi table
      ASoC: tas2783A: fw loading for devices without pci bus

Oder Chiou (4):
      spi: export of_find_spi_controller_by_node()
      spi: change of_find_spi_controller_by_node() gating to CONFIG_OF
      ASoC: dt-bindings: realtek,rt5575: add support for ALC5575
      ASoC: rt5575: Add the codec driver for the ALC5575

Peng Fan (4):
      ASoC: codec: Remove ak4641
      ASoC: codec: Remove pxa2xx-ac97.c
      ASoC: pxa2xx-ac97: Remove platform_data
      ASoC: ac97: Convert to GPIO descriptors

Peter Ujfalusi (30):
      ASoC: SOF: ipc4-loader: Remove redundant rpm resume_and_get from load_library
      ASoC: SOF: control: skip rpm calls in ext_volatile_get if not implemented
      ASoC: SOF: Add support for on-demand DSP boot
      ASoC: SOF: sof-client: Add support for on-demand DSP boot
      ASoC: SOF: Intel: hda-sdw-bpt: Add support for on-demand DSP boot
      ASoC: SOF: Intel: pci-lnl: Set on_demand_dsp_boot for LNL
      ASoC: SOF: Intel: pci-ptl: Set on_demand_dsp_boot for PTL and WCL
      ASoC: SOF: Intel: pci-nvl: Set on_demand_dsp_boot for NVL-S
      ASoC: SOF: Intel: hda: Only check SSP MCLK mask in case of IPC3
      ASoC: SOF: ipc4-control: If there is no data do not send bytes update
      ASoC: SOF: ipc4-topology: Correct the allocation size for bytes controls
      ASoC: SOF: ipc4-control: Use the correct size for scontrol->ipc_control_data
      ASoC: SOF: ipc4-control: Keep the payload size up to date
      ASoC: SOF: ipc4-topology: Set initial param_id for bytes control type
      ASoC: SOF: ipc4: Support for sending payload along with LARGE_CONFIG_GET
      ASoC: SOF: ipc4: Add definition for generic bytes control
      ASoC: SOF: ipc4-control: Add support for generic bytes control
      ASoC: SOF: Use guard()/scoped_guard() for mutex locks where it makes sense
      ASoC: SOF: Intel: Use guard()/scoped_guard() for mutex locks where it makes sense
      ASoC: SOF: amd: acp-ipc: Use guard() for spinlock_irq()
      ASoC: SOF: imx: imx-common: Use guard() for spinlock_irqsafe()
      ASoC: SOF: mediatek: mtk-adsp-common: Use guard() for spinlock_irqsave
      ASoC: SOF: Intel: Use guard() for spinlocks where it makes sense
      ASoC: SOF: ipc/ops: Use guard() for spinlocks
      ASoC: SOF: Intel: hda: Remove MODULE_SOFTDEP for snd-hda-codec-hdmi
      PCI: Add Intel Nova Lake audio Device ID
      ASoC: SOF: Intel: add support for Nova Lake NVL
      ALSA: hda: core: intel-dsp-config: Add support for NVL
      ALSA: hda: controllers: intel: add support for Nova Lake
      ASoC: SOF: ipc4-control: Set correct error code in refresh_bytes_control

Rafael J. Wysocki (1):
      ASoC: rockchip: Discard pm_runtime_put() return value

Randy Dunlap (2):
      ASoC: pxa: drop unused Kconfig symbol
      ASoC: amd: drop unused Kconfig symbols

Ranjani Sridharan (10):
      ASoC: SOF: sof-audio: Add a new op in struct sof_ipc_tplg_ops
      ASoC: SOF: pcm: Split up widget prepare and setup
      uapi: sound: sof: tokens: Add missing token for KCPS
      ASoC: Intel: sof_sdw: Add a DAI link for loopback capture
      ASoC: SOF: ipc4-topology: Add new tokens for pipeline direction
      ASoC: SOF: ipc4-topology: Add support for process modules with no input pins
      ASoC: SOF: sof-audio: Traverse paths with aggregated DAI widgets
      ASoC: SOF: sof-audio: Add support for loopback capture
      ASoC: SOF: Intel: hda: Fix NULL pointer dereference
      ASoC: SOF: Intel: hda: Add a virtual CPU DAI

Richard Fitzgerald (20):
      firmware: cs_dsp: Remove __free() from cs_dsp_debugfs_string_read()
      firmware: cs_dsp: Don't use __free() in cs_dsp_load() and cs_dsp_load_coeff()
      ASoC: cs-amp-lib: Replace __free(kfree) with normal kfree() cleanup
      firmware: cs_dsp: Handle long-offset data blocks
      firmware: cs_dsp: test_bin: Run test cases with v3 file format
      firmware: cs_dsp: test_bin: Make patch function a test parameter
      firmware: cs_dsp: mock_bin: Pass offset32 to cs_dsp_mock_bin_add_raw_block()
      firmware: cs_dsp: mock_bin: Add function to create long-offset patches
      firmware: cs_dsp: test: Increase size of XM and YM on Halo Core
      firmware: cs_dsp: test_bin: Run test cases on long-offset blocks
      firmware: cs_dsp: test_bin: Add tests for offsets > 0xffff
      ASoC: cs-amp-lib: Support Dell SSIDExV2 UEFI variable
      ASoC: cs35l56: Use vendor-specific qualifier in firmware file search
      ASoC: cs-amp-lib-test: Tests for reading SSIDExV2
      ASoC: cs-amp-lib: Add a Kconfig symbol for enabling test hooks
      ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()
      ASoC: cs35l56-test: Fix missing module namespace import
      ASoC: cs35l56: Support for reading speaker ID from on-chip GPIOs
      ASoC: cs35l56-shared: KUnit tests for onchip speaker ID gpios
      ASoC: cs35l56: KUnit tests for parsing and using onchip GPIOs

Rob Herring (Arm) (2):
      ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
      ASoC: dt-bindings: Convert ti,tas2552 to DT schema

Runrun Liu (1):
      ASoC: realtek: fix misspelling of "minimum" in comments

Sascha Hauer (1):
      ASoC: dt-bindings: add avdd and iovdd supply

Sebastian Andrzej Siewior (1):
      ASoC: codecs: rt56*: Remove IRQF_ONESHOT

Sebastian Krzyszkowiak (2):
      ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
      ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug

Sebastian Reichel (5):
      ASoC: rockchip: spdif: Use device_get_match_data()
      ASoC: rockchip: spdif: Move DT compatible table
      ASoC: rockchip: spdif: Fully convert to device managed resources
      ASoC: rockchip: spdif: Use dev_err_probe
      ASoC: rockchip: spdif: Convert to FIELD_PREP

Sen Wang (4):
      ASoC: dt-bindings: davinci-mcasp: Add properties for asynchronous mode
      ASoC: ti: davinci-mcasp: Disambiguate mcasp_is_synchronous function
      ASoC: ti: davinci-mcasp: Streamline pdir behavior across rx & tx streams
      ASoC: ti: davinci-mcasp: Add asynchronous mode support

Sheetal (4):
      regmap: Add reg_default_cb callback for flat cache defaults
      regmap: add KUnit coverage for reg_default_cb callback
      ASoC: tegra: Add AHUB writeable_reg for RX holes
      ASoC: tegra: set reg_default_cb callback

Shenghao Ding (1):
      ASoC: tas2781: Put three different calibrated data solution into the same data structure

Shengjiu Wang (9):
      ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
      ASoC: dt-bindings: fsl,sai: Add AUDMIX mode support on i.MX952
      ASoC: fsl_audmix: Add support for i.MX952 platform
      ASoC: fsl_sai: Add AUDMIX mode support on i.MX952
      ASoC: wm8962: add .set_tdm_slot callback function
      ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
      ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
      ASoC: fsl_asrc: Add support for i.MX952 platform
      ASoC: fsl_asrc_dma: allocate memory from dma device

Shuming Fan (4):
      ASoC: rt1320: support calibration and temperature/r0 loading
      ASoC: rt1320: support RAE parameters loading
      ASoC: rt1320: fix the warning the string may be truncated
      ASoC: rt1320: fix the remainder calculation of r0 value

Simon Trimmer (5):
      ASoC: SDCA: Allow sample width wild cards in set_usage()
      ASoC: amd: acp: Sort match table into most specific first
      ASoC: amd: acp: Rename Cirrus Logic component match entries to include link and uid
      ASoC: amd: acp: Sort Cirrus Logic match entries
      ASoC: amd: acp: Add ACP7.0 match entries for Cirrus Logic parts

Sugar Zhang (5):
      ASoC: rockchip: spdif: Improve sample rate support
      ASoC: rockchip: spdif: Swap PCM and DAI component registration order
      ASoC: rockchip: spdif: Add support for set mclk rate
      ASoC: rockchip: spdif: Add support for format S32_LE
      ASoC: rockchip: spdif: Fill IEC958 CS info per params

Syed Saba Kareem (1):
      ASoC: amd: acp: Fix Kconfig dependencies for SND_SOC_ACPI_AMD_SDCA_QUIRKS

Thorsten Blum (1):
      ASoC: codecs: wm0010: Replace cpu_to_be64 + le64_to_cpu with swab64

Uwe Kleine-König (1):
      ASoC: sdw-mockup: Drop dummy remove function

Vijendar Mukunda (2):
      ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
      ASoC: amd: maintainer information

Zhang Yi (7):
      ASoC: codecs: ES8326: Add a kcontrol for PGAGAIN
      ASoC: codecs: ES8326: Add kcontrol for DRE
      ASoC: dt-bindings: ES8389: Add property about power supply
      ASoC: codecs: ES8389: Add members related to power supply
      ASoC: codecs: ES8389: Adjust wakeup configuration
      ASoC: codecs: ES8389: Add members about the version
      ASoC: codecs: ES8389: Update clock configuration

Ziyi Guo (1):
      ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe

 .../devicetree/bindings/goldfish/audio.txt         |   17 -
 .../devicetree/bindings/sound/awinic,aw87390.yaml  |   34 +-
 .../devicetree/bindings/sound/awinic,aw88395.yaml  |   13 +
 .../bindings/sound/davinci-mcasp-audio.yaml        |   71 +-
 .../devicetree/bindings/sound/everest,es8389.yaml  |   12 +
 .../devicetree/bindings/sound/fsl,audmix.yaml      |   16 +-
 .../devicetree/bindings/sound/fsl,imx-asrc.yaml    |    1 +
 .../devicetree/bindings/sound/fsl,mqs.yaml         |   12 +-
 .../devicetree/bindings/sound/fsl,rpmsg.yaml       |   22 +-
 .../devicetree/bindings/sound/fsl,sai.yaml         |   16 +
 .../bindings/sound/google,goldfish-audio.yaml      |   38 +
 .../devicetree/bindings/sound/mt8192-afe-pcm.yaml  |  176 ++-
 .../devicetree/bindings/sound/realtek,rt5575.yaml  |   61 +
 .../devicetree/bindings/sound/realtek,rt5651.yaml  |  100 ++
 .../devicetree/bindings/sound/richtek,rtq9128.yaml |   12 +-
 Documentation/devicetree/bindings/sound/rt5651.txt |   63 -
 .../bindings/sound/sophgo,cv1800b-codecs.yaml      |   46 +
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |   67 ++
 .../devicetree/bindings/sound/tas2552.txt          |   36 -
 .../devicetree/bindings/sound/ti,tas2552.yaml      |   62 +
 .../bindings/sound/ti,tlv320adcx140.yaml           |    7 +-
 MAINTAINERS                                        |    9 +-
 drivers/base/regmap/internal.h                     |    3 +
 drivers/base/regmap/regcache-flat.c                |   19 +
 drivers/base/regmap/regcache.c                     |    3 +-
 drivers/base/regmap/regmap-kunit.c                 |   91 ++
 drivers/base/regmap/regmap.c                       |    2 +
 drivers/firmware/cirrus/cs_dsp.c                   |   50 +-
 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c     |   38 +-
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c    |    8 +-
 drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c  |   16 +-
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     | 1033 ++++++++++------
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   |   14 +-
 drivers/spi/spi.c                                  |   23 +-
 include/linux/firmware/cirrus/cs_dsp_test_utils.h  |    6 +-
 include/linux/firmware/cirrus/wmfw.h               |    7 +-
 include/linux/firmware/imx/sm.h                    |    2 +
 include/linux/pci_ids.h                            |    4 +-
 include/linux/platform_data/davinci_asp.h          |    3 +-
 include/linux/regmap.h                             |   14 +
 include/linux/soc/qcom/apr.h                       |    6 +-
 include/linux/spi/spi.h                            |    9 +
 include/sound/ak4641.h                             |   23 -
 include/sound/cs-amp-lib.h                         |    3 +
 include/sound/cs35l56.h                            |   37 +
 include/sound/sdca_function.h                      |    4 +
 include/sound/sdca_interrupts.h                    |    7 +
 include/sound/sdca_jack.h                          |   32 +
 include/sound/soc-acpi-intel-ssp-common.h          |    4 +
 include/sound/soc-component.h                      |   29 +-
 include/sound/soc-dapm.h                           |   44 +-
 include/sound/soc.h                                |    4 +-
 include/sound/sof.h                                |    3 +
 include/sound/sof/ipc4/header.h                    |   75 ++
 include/sound/tas2781.h                            |    3 +-
 include/uapi/sound/sof/tokens.h                    |    6 +
 sound/arm/Kconfig                                  |   10 -
 sound/arm/Makefile                                 |    3 -
 sound/arm/pxa2xx-ac97-lib.c                        |   50 +-
 sound/arm/pxa2xx-ac97.c                            |  286 -----
 sound/hda/codecs/side-codecs/tas2781_hda.c         |    9 +-
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c     |   13 -
 sound/hda/controllers/intel.c                      |    3 +-
 sound/hda/core/intel-dsp-config.c                  |    8 +-
 sound/soc/Kconfig                                  |    1 +
 sound/soc/Makefile                                 |    1 +
 sound/soc/amd/Kconfig                              |    2 -
 sound/soc/amd/acp/Kconfig                          |    9 +-
 sound/soc/amd/acp/Makefile                         |    2 +
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |    8 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |    8 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c           |  380 +++++-
 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c       |   42 +
 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h       |   25 +
 sound/soc/codecs/Kconfig                           |   50 +-
 sound/soc/codecs/Makefile                          |    9 +-
 sound/soc/codecs/ak4641.c                          |  641 ----------
 sound/soc/codecs/alc5623.c                         |    5 -
 sound/soc/codecs/aw87390.c                         |  175 ++-
 sound/soc/codecs/aw87390.h                         |   86 ++
 sound/soc/codecs/aw88261.c                         |   16 +-
 sound/soc/codecs/aw88261.h                         |    2 -
 sound/soc/codecs/cs-amp-lib-test.c                 |  169 +++
 sound/soc/codecs/cs-amp-lib.c                      |  158 ++-
 sound/soc/codecs/cs35l56-shared-test.c             |  680 +++++++++++
 sound/soc/codecs/cs35l56-shared.c                  |  172 +++
 sound/soc/codecs/cs35l56-test.c                    |  639 ++++++++++
 sound/soc/codecs/cs35l56.c                         |  215 +++-
 sound/soc/codecs/cs35l56.h                         |    6 +
 sound/soc/codecs/cs4271.c                          |   12 +-
 sound/soc/codecs/da7213.c                          |    4 +-
 sound/soc/codecs/es8323.c                          |  294 ++---
 sound/soc/codecs/es8323.h                          |  105 +-
 sound/soc/codecs/es8326.c                          |   18 +-
 sound/soc/codecs/es8326.h                          |    3 +
 sound/soc/codecs/es8328.c                          |  160 ++-
 sound/soc/codecs/es8375.c                          |    2 -
 sound/soc/codecs/es8389.c                          |  246 ++--
 sound/soc/codecs/es8389.h                          |    8 +
 sound/soc/codecs/max98390.c                        |    3 +
 sound/soc/codecs/nau8821.c                         |   48 +-
 sound/soc/codecs/nau8821.h                         |    1 +
 sound/soc/codecs/rt1320-sdw.c                      | 1227 +++++++++++++++++++-
 sound/soc/codecs/rt1320-sdw.h                      |   66 ++
 sound/soc/codecs/rt274.c                           |   12 +-
 sound/soc/codecs/rt286.c                           |   12 +-
 sound/soc/codecs/rt298.c                           |   12 +-
 sound/soc/codecs/rt5575-spi.c                      |  118 ++
 sound/soc/codecs/rt5575-spi.h                      |   27 +
 sound/soc/codecs/rt5575.c                          |  352 ++++++
 sound/soc/codecs/rt5575.h                          |   58 +
 sound/soc/codecs/rt5640.c                          |    4 +-
 sound/soc/codecs/rt5651.c                          |    2 +-
 sound/soc/codecs/rt5659.c                          |    2 +-
 sound/soc/codecs/rt5663.c                          |    4 +-
 sound/soc/codecs/rt5665.c                          |    2 +-
 sound/soc/codecs/rt5668.c                          |    2 +-
 sound/soc/codecs/rt5682-i2c.c                      |    2 +-
 sound/soc/codecs/rtq9128.c                         |  114 +-
 sound/soc/codecs/sdw-mockup.c                      |    6 -
 sound/soc/codecs/tas2780.c                         |   31 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |  138 ++-
 sound/soc/codecs/tas2781-i2c.c                     |   11 +-
 sound/soc/codecs/tas2783-sdw.c                     |  356 +++---
 sound/soc/codecs/tas2783.h                         |    1 +
 sound/soc/codecs/tlv320adcx140.c                   |  136 ++-
 sound/soc/codecs/wcd-mbhc-v2.c                     |   12 -
 sound/soc/codecs/wcd939x-sdw.c                     |   19 +-
 sound/soc/codecs/wm0010.c                          |    2 +-
 sound/soc/codecs/wm8731.c                          |   11 +-
 sound/soc/codecs/wm8962.c                          |   47 +-
 sound/soc/fsl/Kconfig                              |    6 +-
 sound/soc/fsl/fsl_asrc.c                           |   38 +
 sound/soc/fsl/fsl_asrc.h                           |   18 +
 sound/soc/fsl/fsl_asrc_common.h                    |    4 +
 sound/soc/fsl/fsl_asrc_dma.c                       |   48 +-
 sound/soc/fsl/fsl_asrc_m2m.c                       |    8 +-
 sound/soc/fsl/fsl_audmix.c                         |    3 +
 sound/soc/fsl/fsl_sai.c                            |   21 +
 sound/soc/fsl/fsl_sai.h                            |    4 +
 sound/soc/fsl/fsl_ssi.c                            |    2 +-
 sound/soc/fsl/imx-rpmsg.c                          |    2 +-
 sound/soc/intel/avs/board_selection.c              |    2 +-
 sound/soc/intel/avs/core.c                         |    2 +-
 sound/soc/intel/avs/path.c                         |    2 +-
 sound/soc/intel/boards/Kconfig                     |    5 +
 sound/soc/intel/boards/Makefile                    |    3 +
 sound/soc/intel/boards/sof_rt5682.c                |    6 +
 sound/soc/intel/boards/sof_sdw.c                   |   43 +-
 sound/soc/intel/boards/sof_ti_common.c             |   77 ++
 sound/soc/intel/boards/sof_ti_common.h             |   24 +
 sound/soc/intel/catpt/core.h                       |    7 +-
 sound/soc/intel/catpt/device.c                     |    6 +-
 sound/soc/intel/catpt/ipc.c                        |   12 +-
 sound/soc/intel/catpt/loader.c                     |    8 +-
 sound/soc/intel/catpt/messages.c                   |   89 +-
 sound/soc/intel/catpt/pcm.c                        |   46 +-
 sound/soc/intel/catpt/sysfs.c                      |    2 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |   23 +-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   14 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |   55 +-
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c |    3 +
 sound/soc/mediatek/mt8189/mt8189-nau8825.c         |    6 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |   44 +-
 sound/soc/pxa/Kconfig                              |    1 -
 sound/soc/pxa/pxa2xx-ac97.c                        |    5 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |  229 +++-
 sound/soc/qcom/qdsp6/audioreach.h                  |   55 +-
 sound/soc/qcom/qdsp6/q6adm.c                       |    8 +-
 sound/soc/qcom/qdsp6/q6afe.c                       |   26 +-
 sound/soc/qcom/qdsp6/q6apm.c                       |   19 +-
 sound/soc/qcom/qdsp6/q6asm.c                       |   33 +-
 sound/soc/qcom/qdsp6/q6core.c                      |    6 +-
 sound/soc/qcom/qdsp6/q6prm.c                       |   22 +-
 sound/soc/qcom/qdsp6/topology.c                    |  118 +-
 sound/soc/renesas/rz-ssi.c                         |  143 ++-
 sound/soc/rockchip/Kconfig                         |    1 +
 sound/soc/rockchip/rockchip_sai.c                  |    5 +-
 sound/soc/rockchip/rockchip_spdif.c                |  225 ++--
 sound/soc/rockchip/rockchip_spdif.h                |   57 +-
 sound/soc/sdca/Kconfig                             |    2 +
 sound/soc/sdca/Makefile                            |    2 +-
 sound/soc/sdca/sdca_asoc.c                         |   91 +-
 sound/soc/sdca/sdca_class.c                        |   34 +
 sound/soc/sdca/sdca_class.h                        |    2 +
 sound/soc/sdca/sdca_class_function.c               |  141 ++-
 sound/soc/sdca/sdca_fdl.c                          |    8 +-
 sound/soc/sdca/sdca_functions.c                    |   75 +-
 sound/soc/sdca/sdca_interrupts.c                   |  188 +--
 sound/soc/sdca/sdca_jack.c                         |  248 ++++
 sound/soc/sdca/sdca_regmap.c                       |   14 +-
 sound/soc/sdca/sdca_ump.c                          |    2 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c               |    4 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |   39 +-
 sound/soc/soc-component.c                          |   82 --
 sound/soc/soc-core.c                               |   10 +
 sound/soc/soc-dapm.c                               |  352 +++---
 sound/soc/sof/amd/acp-ipc.c                        |    4 +-
 sound/soc/sof/compress.c                           |    8 +
 sound/soc/sof/control.c                            |   13 +-
 sound/soc/sof/core.c                               |    1 +
 sound/soc/sof/debug.c                              |    7 +-
 sound/soc/sof/imx/imx-common.c                     |    8 +-
 sound/soc/sof/intel/Kconfig                        |    1 +
 sound/soc/sof/intel/atom.c                         |    7 +-
 sound/soc/sof/intel/bdw.c                          |    7 +-
 sound/soc/sof/intel/cnl.c                          |   11 +-
 sound/soc/sof/intel/hda-codec.c                    |    1 -
 sound/soc/sof/intel/hda-dai-ops.c                  |   25 +-
 sound/soc/sof/intel/hda-dai.c                      |   22 +-
 sound/soc/sof/intel/hda-ipc.c                      |   11 +-
 sound/soc/sof/intel/hda-loader.c                   |   94 +-
 sound/soc/sof/intel/hda-mlink.c                    |   29 +-
 sound/soc/sof/intel/hda-sdw-bpt.c                  |   16 +-
 sound/soc/sof/intel/hda-stream.c                   |  168 ++-
 sound/soc/sof/intel/hda.c                          |   46 +-
 sound/soc/sof/intel/hda.h                          |   16 +-
 sound/soc/sof/intel/mtl.c                          |    5 +-
 sound/soc/sof/intel/nvl.c                          |   24 +
 sound/soc/sof/intel/pci-apl.c                      |    2 +-
 sound/soc/sof/intel/pci-lnl.c                      |    1 +
 sound/soc/sof/intel/pci-nvl.c                      |   32 +
 sound/soc/sof/intel/pci-ptl.c                      |    2 +
 sound/soc/sof/ipc.c                                |    9 +-
 sound/soc/sof/ipc3-dtrace.c                        |    7 +-
 sound/soc/sof/ipc3-topology.c                      |    6 +-
 sound/soc/sof/ipc3.c                               |    8 +-
 sound/soc/sof/ipc4-control.c                       |  198 +++-
 sound/soc/sof/ipc4-loader.c                        |   19 +-
 sound/soc/sof/ipc4-mtrace.c                        |   24 +-
 sound/soc/sof/ipc4-pcm.c                           |    3 +-
 sound/soc/sof/ipc4-topology.c                      |  214 +++-
 sound/soc/sof/ipc4-topology.h                      |   13 +-
 sound/soc/sof/ipc4.c                               |   64 +-
 sound/soc/sof/mediatek/mtk-adsp-common.c           |    4 +-
 sound/soc/sof/ops.c                                |   34 +-
 sound/soc/sof/ops.h                                |   10 +-
 sound/soc/sof/pcm.c                                |   91 +-
 sound/soc/sof/pm.c                                 |  149 ++-
 sound/soc/sof/sof-audio.c                          |  231 ++--
 sound/soc/sof/sof-audio.h                          |   20 +
 sound/soc/sof/sof-client-ipc-flood-test.c          |    7 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c     |    4 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c        |   14 +-
 sound/soc/sof/sof-client-probes.c                  |   26 +-
 sound/soc/sof/sof-client.c                         |   46 +-
 sound/soc/sof/sof-client.h                         |    3 +
 sound/soc/sof/sof-priv.h                           |    3 +
 sound/soc/sophgo/Kconfig                           |   47 +
 sound/soc/sophgo/Makefile                          |    5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               |  319 +++++
 sound/soc/sophgo/cv1800b-sound-dac.c               |  208 ++++
 sound/soc/sophgo/cv1800b-tdm.c                     |  716 ++++++++++++
 sound/soc/sunxi/sun4i-spdif.c                      |    4 +
 sound/soc/sunxi/sun50i-dmic.c                      |    3 +
 sound/soc/tegra/tegra186_asrc.c                    |    1 +
 sound/soc/tegra/tegra186_dspk.c                    |    1 +
 sound/soc/tegra/tegra210_admaif.c                  |    3 +
 sound/soc/tegra/tegra210_adx.c                     |    2 +
 sound/soc/tegra/tegra210_ahub.c                    |   60 +
 sound/soc/tegra/tegra210_ahub.h                    |   30 +
 sound/soc/tegra/tegra210_amx.c                     |    3 +
 sound/soc/tegra/tegra210_dmic.c                    |    1 +
 sound/soc/tegra/tegra210_i2s.c                     |    2 +
 sound/soc/tegra/tegra210_mbdrc.c                   |    1 +
 sound/soc/tegra/tegra210_mixer.c                   |    1 +
 sound/soc/tegra/tegra210_mvc.c                     |    1 +
 sound/soc/tegra/tegra210_ope.c                     |    1 +
 sound/soc/tegra/tegra210_peq.c                     |    1 +
 sound/soc/tegra/tegra210_sfc.c                     |    1 +
 sound/soc/ti/davinci-mcasp.c                       |  517 +++++++--
 sound/soc/ti/davinci-mcasp.h                       |   10 +
 272 files changed, 12608 insertions(+), 4067 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5651.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5651.txt
 create mode 100644 Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tas2552.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2552.yaml
 delete mode 100644 include/sound/ak4641.h
 create mode 100644 include/sound/sdca_jack.h
 delete mode 100644 sound/arm/pxa2xx-ac97.c
 create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
 create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
 delete mode 100644 sound/soc/codecs/ak4641.c
 create mode 100644 sound/soc/codecs/cs35l56-shared-test.c
 create mode 100644 sound/soc/codecs/cs35l56-test.c
 create mode 100644 sound/soc/codecs/rt5575-spi.c
 create mode 100644 sound/soc/codecs/rt5575-spi.h
 create mode 100644 sound/soc/codecs/rt5575.c
 create mode 100644 sound/soc/codecs/rt5575.h
 create mode 100644 sound/soc/intel/boards/sof_ti_common.c
 create mode 100644 sound/soc/intel/boards/sof_ti_common.h
 create mode 100644 sound/soc/sdca/sdca_jack.c
 create mode 100644 sound/soc/sophgo/Kconfig
 create mode 100644 sound/soc/sophgo/Makefile
 create mode 100644 sound/soc/sophgo/cv1800b-sound-adc.c
 create mode 100644 sound/soc/sophgo/cv1800b-sound-dac.c
 create mode 100644 sound/soc/sophgo/cv1800b-tdm.c

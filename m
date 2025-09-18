Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDEBB82738
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Sep 2025 02:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB9CD601E8;
	Thu, 18 Sep 2025 02:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB9CD601E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758156928;
	bh=OTou4Mm/3uuGdZ5sRisBc/+W2SVZO8tT7hB8idEcGUY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BJ8wRXAAfpyhsFGvMsTDMUlYLJ1pJTEzC26ZT0cx4Ct/9oKoOEJoktwaAu8RqaPd6
	 XReGGCe4hn4YKsP3LLYi8e6nziqUQlt6YJETPd94gz+WrdmEiCm0QOcSxG1kgnSpjI
	 fV6LO4ZI7S3vNUSowQvFgZ2pulKQR0hLQUdVf/YQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E2D1F805CB; Thu, 18 Sep 2025 02:54:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ADFFF805C3;
	Thu, 18 Sep 2025 02:54:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20D96F80212; Thu, 18 Sep 2025 02:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5B4AF80153
	for <alsa-devel@alsa-project.org>; Thu, 18 Sep 2025 02:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B4AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nHK7YiIg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD62144BCC;
	Thu, 18 Sep 2025 00:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C85C4CEE7;
	Thu, 18 Sep 2025 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758156874;
	bh=OTou4Mm/3uuGdZ5sRisBc/+W2SVZO8tT7hB8idEcGUY=;
	h=From:To:Cc:Subject:Date:From;
	b=nHK7YiIgnaNdW1snB07bgl0PA6DvGtHXpvsINk/LVPKJjh62Avoz/LRSH5c39ofbK
	 xBS4guaE7bwdwIFHGOIhg6fSIrCEauxLDUTSYiY8RK3IH8zjbtMloW87ck5hqihZoA
	 pC9rN6U7iBeB/AcDzPnezSuY3c0X91qLqxHb3iKFZin2mEhHHFsPNeO/cPVa63jmDo
	 ofaztFtSJvPdo18Gtyf/2anaQkKGB0HKNxncVft3H+pGXfdVEASOni/FfF7i855ajd
	 A6/J1ANbOPuU0wdwoNkQrGmS5etpE3VO1mKyhufFbMAZk6sNf6jVz2jTaiOCLmm/ax
	 /nvXTWRajH0rQ==
Message-ID: <05d115d1cda935ba007c2835614cb320@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc6
Date: Thu, 18 Sep 2025 01:54:27 +0100
Message-ID-Hash: K6JTYXLN4LFHUM3C57PTMBZBMLS5NIKN
X-Message-ID-Hash: K6JTYXLN4LFHUM3C57PTMBZBMLS5NIKN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6JTYXLN4LFHUM3C57PTMBZBMLS5NIKN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc6

for you to fetch changes up to 1dd28fd86c3fa4e395031dd6f2ba920242107010:

  ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue (2025-09-17 12:38:59 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

A pile of fixes that accumilated over the past few -rcs, this is all
driver specifics including a small pile of quirks for new systems.

----------------------------------------------------------------
Amadeusz Sławiński (1):
      ASoC: Intel: catpt: Expose correct bit depth to userspace

Balamurugan C (1):
      ASoC: Intel: PTL: Add entry for HDMI-In capture support to non-I2S codec boards.

Charles Keepax (6):
      ASoC: wm8940: Correct PLL rate rounding
      ASoC: wm8940: Correct typo in control name
      ASoC: wm8974: Correct PLL rate rounding
      ASoC: SDCA: Fix return value in sdca_regmap_mbq_size()
      ASoC: SDCA: Fix return value in detected_mode_handler()
      ASoC: SDCA: Reorder members of hide struct to remove holes

Colin Ian King (1):
      ASoC: SOF: Intel: hda-stream: Fix incorrect variable used in error message

Dan Carpenter (1):
      ASoC: codec: sma1307: Fix memory corruption in sma1307_setting_loaded()

Daniel Baluta (1):
      ASoC: SOF: imx: Fix devm_ioremap_resource check

Jack Yu (1):
      ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue

Krzysztof Kozlowski (3):
      ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
      ASoC: codecs: lpass-rx-macro: Fix playback quality distortion
      ASoC: codecs: lpass-wsa-macro: Fix speaker quality distortion

Mac Chiang (1):
      ASoC: Intel: sof_sdw: use PRODUCT_FAMILY for Fatcat series

Maciej Strozek (1):
      ASoC: SDCA: Add quirk for incorrect function types for 3 systems

Mark Brown (3):
      Minor bug fixes for some older Wolfson devices
      More minor SDCA bug fixes
      Fix lpaif_type and DAI configuration for I2S

Mohammad Rafi Shaik (4):
      ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
      ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
      ASoC: qcom: sc8280xp: Enable DAI format configuration for MI2S interfaces
      ASoC: qcom: sc8280xp: Fix sound card driver name match data for QCS8275

Shuming Fan (1):
      ASoC: rt712: avoid skipping the blind write

Syed Saba Kareem (1):
      ASoC: amd: amd_sdw: Add quirks for some new Dell laptops

Venkata Prasad Potturu (2):
      ASoC: amd: acp: Adjust pdm gain value
      ASoC: amd: acp: Fix incorrect retrival of acp_chip_info

 include/sound/sdca.h                              |  1 +
 include/sound/sdca_function.h                     | 21 ++++++++++++---------
 sound/soc/amd/acp/acp-i2s.c                       | 11 +++++------
 sound/soc/amd/acp/acp-sdw-legacy-mach.c           | 16 ++++++++++++++++
 sound/soc/amd/acp/amd.h                           |  2 +-
 sound/soc/codecs/lpass-rx-macro.c                 | 22 +++++++++++++++-------
 sound/soc/codecs/lpass-wsa-macro.c                | 22 +++++++++++++++-------
 sound/soc/codecs/rt5682s.c                        | 17 +++++++++--------
 sound/soc/codecs/rt712-sdca.c                     |  6 ++----
 sound/soc/codecs/sma1307.c                        |  7 ++++---
 sound/soc/codecs/wm8940.c                         |  9 +++++++--
 sound/soc/codecs/wm8974.c                         |  8 ++++++--
 sound/soc/intel/boards/sof_sdw.c                  |  2 +-
 sound/soc/intel/boards/sof_ssp_amp.c              |  6 ++++++
 sound/soc/intel/catpt/pcm.c                       | 23 +++++++++++++++++------
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c |  6 ++++++
 sound/soc/qcom/qdsp6/audioreach.c                 |  1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c           |  7 +++++--
 sound/soc/qcom/sc8280xp.c                         |  6 +++++-
 sound/soc/sdca/sdca_device.c                      | 20 ++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c                   | 13 ++++++++-----
 sound/soc/sdca/sdca_interrupts.c                  |  2 +-
 sound/soc/sdca/sdca_regmap.c                      |  2 +-
 sound/soc/sof/imx/imx-common.c                    |  4 ++--
 sound/soc/sof/intel/hda-stream.c                  |  2 +-
 25 files changed, 167 insertions(+), 69 deletions(-)

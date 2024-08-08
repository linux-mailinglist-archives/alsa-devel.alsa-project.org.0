Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DF94C6BC
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 00:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33E6E7D;
	Fri,  9 Aug 2024 00:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33E6E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723154868;
	bh=lMwtVtmFybSekMnySqFfNLNPgs8kbqAJdRJj9agRW78=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ryhZgf8WQU6O9UEuBnAUX3Sh981LWDX5+ZODO2BdmsB2PNbiU4CsjO0G0QrBTzDLR
	 SIfSfKOtfyj/Kgt4gVRkIAdvGA7G1ZNDcIvuha1R5u0tih9gzgxZqgwB7CB6eXmZTK
	 bs+Vuswzc+Ukppz1ZxHOSsgAvOVc0f7bDh44l2wY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1A81F80602; Fri,  9 Aug 2024 00:06:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62010F805F9;
	Fri,  9 Aug 2024 00:06:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6281F802DB; Thu,  8 Aug 2024 23:54:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54004F80448
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 23:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54004F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JkDe7uB+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A734CE0E5F;
	Thu,  8 Aug 2024 21:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A44C32782;
	Thu,  8 Aug 2024 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153804;
	bh=lMwtVtmFybSekMnySqFfNLNPgs8kbqAJdRJj9agRW78=;
	h=From:To:Cc:Subject:Date:From;
	b=JkDe7uB+zXoxZiKn4jadu7ehCWE1WF4gI/n3iw4Nkp3L6qDg/KU0jnKVOHHvIUh7N
	 3N18g8bsKwfEV9xOiyF441sfmPUlqzuM4gLivYle7/Fbe5FFSQk7d9+iaAghF/Ocyo
	 1SzgSaQ3kjNHWy3SA8tRgcaudhqd7/hyEDPix2fqZtsi+8MAWvwVTWDS2EnJ/OZS+q
	 agtB/UCqf1VfvNwV3mWX8Y/zA/v7zq1/c9GklT8E/EJSJZsUVdZOgCQwA/Jd9+S2W5
	 9oDt8HEl6fVbM841PIqhfMzUkZ3NohQzscq3hC0z2Cz5tNN3GCnzvznHRxlZ50hfGj
	 e1re+RIH3xHtw==
Message-ID: <6bdf8d7232943e6210f6560931e6d2ab.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.11-rc2
Date: Thu, 08 Aug 2024 22:49:42 +0100
Message-ID-Hash: DJNZ3XNFWN4QX52Y332GJXRJMBAIVUFS
X-Message-ID-Hash: DJNZ3XNFWN4QX52Y332GJXRJMBAIVUFS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJNZ3XNFWN4QX52Y332GJXRJMBAIVUFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-rc2

for you to fetch changes up to 72776774b55bb59b7b1b09117e915a5030110304:

  ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the default value (2024-08-08 20:34:56 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.11

Quite a lot of fixes have come in since the merge window, there's some
repetitive fixes over the Qualcomm drivers increasing the patch count,
along with a large batch of fixes from Cirrus.  We also have some quirks
and some individual fixes.

----------------------------------------------------------------
Bruno Ancona (1):
      ASoC: amd: yc: Support mic on HP 14-em0002la

Charles Keepax (5):
      ASoC: cs42l43: Remove redundant semi-colon at end of function
      ASoC: soc-component: Add new snd_soc_component_get_kcontrol() helpers
      ASoC: cs35l45: Use new snd_soc_component_get_kcontrol_locked() helper
      ASoC: cs42l43: Cache shutter IRQ control pointers
      MAINTAINERS: Update Cirrus Logic parts to linux-sound mailing list

Curtis Malainey (1):
      ASoC: SOF: Remove libraries from topology lookups

Francesco Dolcini (1):
      ASoC: nau8822: Lower debug print priority

Jerome Audu (1):
      ASoC: sti: add missing probe entry for player and reader

Jerome Brunet (1):
      ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT

Johan Hovold (1):
      ASoC: codecs: lpass-macro: fix missing codec version

Krzysztof Kozlowski (10):
      ASoC: codecs: wcd937x-sdw: Correct Soundwire ports mask
      ASoC: codecs: wcd938x-sdw: Correct Soundwire ports mask
      ASoC: codecs: wcd939x-sdw: Correct Soundwire ports mask
      ASoC: codecs: wsa881x: Correct Soundwire ports mask
      ASoC: codecs: wsa883x: Correct Soundwire ports mask
      ASoC: codecs: wsa884x: Correct Soundwire ports mask
      ASoC: dt-bindings: qcom,wcd937x: Correct reset GPIO polarity in example
      ASoC: dt-bindings: qcom,wcd934x: Correct reset GPIO polarity in example
      ASoC: dt-bindings: qcom,wcd938x: Correct reset GPIO polarity in example
      ASoC: dt-bindings: qcom,wcd939x: Correct reset GPIO polarity in example

Krzysztof Stępniak (1):
      ASoC: amd: yc: Support mic on Lenovo Thinkpad E14 Gen 6

Mark Brown (3):
      ASoC: codecs: wcd93xx/wsa88xx: Correct Soundwire ports
      ASoC: fsl_micfil: Check the difference for i.MX8 and
      ASoC: Extend wm_adsp so cs35l56 can suppress controls

Paul Handrigan (1):
      ASoC: cs530x: Change IN HPF Select kcontrol name

Richard Fitzgerald (2):
      ASoC: cs-amp-lib: Fix NULL pointer crash if efi.get_variable is NULL
      ASoC: cs35l56: Handle OTP read latency over SoundWire

Shengjiu Wang (2):
      ASoC: fsl_micfil: Expand the range of FIFO watermark mask
      ASoC: fsl_micfil: Differentiate register access permission for platforms

Simon Trimmer (3):
      ASoC: wm_adsp: Add control_add callback and export wm_adsp_control_add()
      ASoC: cs35l56: Stop creating ALSA controls for firmware coefficients
      ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the default value

Takashi Iwai (1):
      ASoC: amd: yc: Add quirk entry for OMEN by HP Gaming Laptop 16-n0xxx

Zhang Yi (1):
      ASoC: codecs: ES8326: button detect issue

 .../devicetree/bindings/sound/qcom,wcd934x.yaml    |  3 +-
 .../devicetree/bindings/sound/qcom,wcd937x.yaml    |  2 +-
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |  3 +-
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |  4 +-
 MAINTAINERS                                        |  4 +-
 include/sound/cs35l56.h                            |  5 ++
 include/sound/soc-component.h                      |  5 ++
 sound/soc/amd/yc/acp6x-mach.c                      | 21 ++++++
 sound/soc/codecs/cs-amp-lib.c                      |  2 +-
 sound/soc/codecs/cs35l45.c                         | 11 +---
 sound/soc/codecs/cs35l56-sdw.c                     | 77 ++++++++++++++++++++++
 sound/soc/codecs/cs35l56-shared.c                  |  1 +
 sound/soc/codecs/cs35l56.c                         | 11 ++++
 sound/soc/codecs/cs42l43.c                         | 75 ++++++++++++++++-----
 sound/soc/codecs/cs42l43.h                         |  2 +
 sound/soc/codecs/cs530x.c                          |  8 +--
 sound/soc/codecs/es8326.c                          |  2 +
 sound/soc/codecs/lpass-va-macro.c                  |  2 +
 sound/soc/codecs/nau8822.c                         |  2 +-
 sound/soc/codecs/wcd937x-sdw.c                     |  4 +-
 sound/soc/codecs/wcd938x-sdw.c                     |  4 +-
 sound/soc/codecs/wcd939x-sdw.c                     |  4 +-
 sound/soc/codecs/wm_adsp.c                         | 17 ++++-
 sound/soc/codecs/wm_adsp.h                         |  3 +
 sound/soc/codecs/wsa881x.c                         |  2 +-
 sound/soc/codecs/wsa883x.c                         |  2 +-
 sound/soc/codecs/wsa884x.c                         |  2 +-
 sound/soc/fsl/fsl_micfil.c                         | 20 ++++--
 sound/soc/fsl/fsl_micfil.h                         |  2 +-
 sound/soc/meson/axg-fifo.c                         | 26 +++-----
 sound/soc/soc-component.c                          | 42 +++++++++---
 sound/soc/sof/mediatek/mt8195/mt8195.c             |  2 +-
 sound/soc/sti/sti_uniperif.c                       |  2 +-
 sound/soc/sti/uniperif.h                           |  1 +
 sound/soc/sti/uniperif_player.c                    |  1 +
 sound/soc/sti/uniperif_reader.c                    |  1 +
 36 files changed, 291 insertions(+), 84 deletions(-)

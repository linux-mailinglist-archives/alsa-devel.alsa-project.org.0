Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0F6A7570
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 21:35:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D801D6;
	Wed,  1 Mar 2023 21:34:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D801D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677702943;
	bh=wp7p7eGiyTkjfYRuiFV9su0S4HLnnszN29a1cIUzxgo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WqKTTSepJvwiGW1VWi68zjRkSy2bBBLxZeYW/cxgumfnPgk+n4KfL6mgxvjE+6huk
	 h2/C0Oc+WWVgRcrDfVvJ5TmOcs4SN9c97O9JQiBeLt/K5u93V+MJuRUyB80cB4Jd9p
	 fF28M1qNQgD7G7aP7uKLpqRx+XaNPLMDnjz0bAmk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 243C7F80310;
	Wed,  1 Mar 2023 21:34:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8685BF8049C; Wed,  1 Mar 2023 21:34:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36A5BF800BA
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 21:34:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A5BF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cWxu5GbH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F1B0B8102B;
	Wed,  1 Mar 2023 20:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8A2C433D2;
	Wed,  1 Mar 2023 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677702875;
	bh=wp7p7eGiyTkjfYRuiFV9su0S4HLnnszN29a1cIUzxgo=;
	h=From:To:Cc:Subject:Date:From;
	b=cWxu5GbH3FhtcG8BgU2K8URk/BvD3CmmLmNKBY+WZusEzs8N9c2K92BsrkhzwDy0s
	 KOxkdTfvBllTVz8WkLnWl0fLEpw/ve2l5QebLgxfEFs3B70sPjF3VHnsbcJiSxBRRG
	 9kyh1NfU39YYquI3AWdrMz9ycBwzxRr1+D/cfTR2/f0eTglSYqzQXOIRYkRpgdaujQ
	 Fcy2/hK/55ugWY/EHov9nrl1uODq1CRLPQYkv5GfZYzgJ0d9XrUlJ9jbamsGh6jdFi
	 vjgyLiLvy+slRbsQrap5dLfpTSYs2ZFLiOqoyuwuCf6y/Cy+b6hx+VnT9qBRrj/yMd
	 GEE+//2FmntEg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.3
Date: Wed, 01 Mar 2023 20:34:24 +0000
Message-Id: <20230301203434.DC8A2C433D2@smtp.kernel.org>
Message-ID-Hash: Q2DHOEWPJKASS2ZKEJND6ECDQBKXUIFW
X-Message-ID-Hash: Q2DHOEWPJKASS2ZKEJND6ECDQBKXUIFW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2DHOEWPJKASS2ZKEJND6ECDQBKXUIFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 76f5aaabce492aa6991c28c96bb78b00b05d06c5:

  ASoC: soc-ac97: Return correct error codes (2023-02-15 16:09:07 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.3

for you to fetch changes up to b56ec2992a2e43bc3e60d6db86849d31640e791f:

  ASoC: mediatek: mt8195: add missing initialization (2023-03-01 14:49:17 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.3

Almost all of this is driver specific fixes and new IDs that have come
in during the merge window.  A good chunk of them are simple ones from
me which came about due to a bunch of Mediatek Chromebooks being enabled
in KernelCI, there's more where that came from.

We do have one small feature added to the PCM core by Claudiu Beznea in
order to allow the sequencing required to resolve a noise issue with the
Microchip PDMC driver.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: zl38060 add gpiolib dependency

Claudiu Beznea (3):
      ASoC: soc-pcm: add option to start DMA after DAI
      ASoC: dt-bindings: sama7g5-pdmc: add microchip,startup-delay-us binding
      ASoC: mchp-pdmc: fix poc noise at capture startup

David Rau (1):
      ASoC: da7219: Improve the IRQ process to increase the stability

Dharageswari.R (1):
      ASoC: Intel: sof_rt5682: Add quirk for Rex board with mx98360a amplifier

Duc Anh Le (1):
      ASoC: amd: yc: Add DMI entries to support HP OMEN 16-n0xxx (8A43)

Geert Uytterhoeven (1):
      ASoC: rsnd: adg: Fix BRG typos

Janne Grunau (1):
      ASoC: dt-bindings: apple,mca: Add t8112-mca compatible

Joseph Hunkeler (1):
      ASoC: amd: yp: Add OMEN by HP Gaming Laptop 16z-n000 to quirks

Kiseok Jo (1):
      ASoC: SMA1303: Change the value for right output

Mark Brown (14):
      ASoC: mt6358: Fix event generation for wake on voice stage 2 switch
      ASoC: mt6358: Validate Wake on Voice 2 writes
      ASoC: mt6358: Remove undefined HPx Mux enumeration values
      ASoC: mt8183: Remove spammy logging from I2S DAI driver
      ASoC: mt8183: Fix event generation for I2S DAI operations
      ASoC: mt8192: Remove spammy log messages
      ASoC: mt8192: Fix event generation for controls
      ASoC: mt8192: Report an error if when an invalid sidetone gain is written
      ASoC: mt8192: Fix range for sidetone positive gain
      ASoC: sam9g20ek: Disable capture unless building with microphone input
      ASoC: mt8192: Fixes from initial glance at kselftest
      ASoC: mt6358: Fixes from an initial glance at a
      ASoC: mchp-pdmc: fix poc noises when starting
      ASoC: mt8183: Fixes from an initial glance at a

Martin Povišer (3):
      ASoC: apple: mca: Fix final status read on SERDES reset
      ASoC: apple: mca: Fix SERDES reset sequence
      ASoC: apple: mca: Improve handling of unavailable DMA channels

Nuno Sá (1):
      ASoC: adau7118: don't disable regulators on device unbind

Trevor Wu (3):
      ASoC: mediatek: mt8188: correct etdm control return value
      ASoC: mediatek: mt8188: add missing initialization
      ASoC: mediatek: mt8195: add missing initialization

 .../devicetree/bindings/sound/apple,mca.yaml       |  1 +
 .../bindings/sound/microchip,sama7g5-pdmc.yaml     |  6 ++
 include/sound/soc-component.h                      |  2 +
 sound/soc/amd/yc/acp6x-mach.c                      | 14 +++++
 sound/soc/apple/mca.c                              | 31 ++++++++---
 sound/soc/atmel/mchp-pdmc.c                        | 53 ++++++++++++++++--
 sound/soc/atmel/sam9g20_wm8731.c                   |  3 +
 sound/soc/codecs/Kconfig                           |  1 +
 sound/soc/codecs/adau7118.c                        | 19 +------
 sound/soc/codecs/da7219-aad.c                      | 41 +++++++++++---
 sound/soc/codecs/da7219-aad.h                      |  4 ++
 sound/soc/codecs/mt6358.c                          | 11 ++--
 sound/soc/codecs/sma1303.c                         |  2 +-
 sound/soc/intel/boards/sof_rt5682.c                | 23 ++++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  | 12 ++++
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c         | 21 +------
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c        | 11 +---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c        | 58 +++++++-------------
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |  3 +
 sound/soc/sh/rcar/adg.c                            | 64 +++++++++++-----------
 sound/soc/soc-pcm.c                                | 27 +++++++--
 21 files changed, 260 insertions(+), 147 deletions(-)

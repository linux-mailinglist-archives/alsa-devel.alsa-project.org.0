Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBF76537F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 14:21:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF2B883E;
	Thu, 27 Jul 2023 14:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF2B883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690460467;
	bh=aEPI4qdrTaTdJioOBLORZkYwgd5kOZkSyOD+kYBEa+Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QymWdT0CSguaEVgANiudZULgVP7LEILSE83d2WiHQR/lGGn7Ns7GPpkcy31kfqO6K
	 nr6Xz2CP9E88O+7LaWXEkNRBqf57ux8UMIAC4v+Xvc5csyxCyrY6Pf63S5Vo4j7JzW
	 v9BTH6A7GbE8VDs8X+hEuHMc3EGKilao+C7bjKCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C341F80310; Thu, 27 Jul 2023 14:20:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18121F80163;
	Thu, 27 Jul 2023 14:20:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EDCFF8019B; Thu, 27 Jul 2023 14:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0457EF80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 14:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0457EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kV9CL+ZE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44A9161E2F;
	Thu, 27 Jul 2023 12:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556C6C433C7;
	Thu, 27 Jul 2023 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690460384;
	bh=aEPI4qdrTaTdJioOBLORZkYwgd5kOZkSyOD+kYBEa+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=kV9CL+ZEOShDEGRbvZ6dXm3S5hpXfWmk8rPMAzi1c0cNsUoJPbnEn5UtJYCiF2+x4
	 bsgRI5WtG5hYZBDfysx1Ip+QC8Jf2s9u1sJq8Fiu2Oq75YoNNEcHv0m5PpPPIP17Yv
	 ESacG5KkLGFZGWSJWiAGQJ5BsoQ1D9XkQTJTByK4M4caRBELvOIbztHeIb9bUyogT1
	 AgxowUvdq4/A+fPQ0FTiNHsrXFZak+14s07fBeEcjbhyXXlI5DrtfotPVvuDdMN9gX
	 Xn+ZmJG3C/GQQT+zRLilob0quuErun1j+WW7Y7sF5VPj9pevA+22c7wUn4IiZM1HKV
	 5QriVddHqmQRA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.5-rc3
Date: Thu, 27 Jul 2023 13:19:31 +0100
Message-Id: <20230727121944.556C6C433C7@smtp.kernel.org>
Message-ID-Hash: BBIEWWSQ2CILTHYXMFLGL7VZSRLFYHPB
X-Message-ID-Hash: BBIEWWSQ2CILTHYXMFLGL7VZSRLFYHPB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBIEWWSQ2CILTHYXMFLGL7VZSRLFYHPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 6eaae198076080886b9e7d57f4ae06fa782f90ef:

  Linux 6.5-rc3 (2023-07-23 15:24:10 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.5-rc3

for you to fetch changes up to f85739c0b2b0d98a32f5ca4fcc5501d2b76df4f6:

  ASoC: atmel: Fix the 8K sample parameter in I2SC master (2023-07-25 12:10:00 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.5

A collection of device specific fixes, none particularly remarkable.
There's a set of repetitive fixes for the RealTek drivers fixing an
issue with suspend that was replicated in multiple drivers.

----------------------------------------------------------------
Dmytro Maluka (2):
      ASoC: da7219: Flush pending AAD IRQ when suspending
      ASoC: da7219: Check for failure reading AAD IRQ events

Edgar (1):
      ASoc: codecs: ES8316: Fix DMIC config

Edson Juliano Drosdeck (1):
      ASoC: nau8821: Add DMI quirk mechanism for active-high jack-detect

Guiting Shen (1):
      ASoC: atmel: Fix the 8K sample parameter in I2SC master

Mark Brown (3):
      ASoC: Merge up fixes from mainline
      ASoC: da7219: Patches related to a spurious AAD IRQ
      ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0 register

Matus Gajdos (1):
      ASoC: fsl_spdif: Silence output on stop

Shuming Fan (5):
      ASoC: rt5682-sdw: fix for JD event handling in ClockStop Mode0
      ASoC: rt712-sdca: fix for JD event handling in ClockStop Mode0
      ASoC: rt722-sdca: fix for JD event handling in ClockStop Mode0
      ASoC: rt711: fix for JD event handling in ClockStop Mode0
      ASoC: rt711-sdca: fix for JD event handling in ClockStop Mode0

 sound/soc/atmel/atmel-i2s.c       |  5 ++++-
 sound/soc/codecs/da7219-aad.c     | 12 +++++++++---
 sound/soc/codecs/es8316.c         |  2 +-
 sound/soc/codecs/nau8821.c        | 41 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt5682-sdw.c     |  9 ++++++++-
 sound/soc/codecs/rt711-sdca-sdw.c | 10 +++++++++-
 sound/soc/codecs/rt711-sdw.c      |  9 ++++++++-
 sound/soc/codecs/rt712-sdca-sdw.c | 10 +++++++++-
 sound/soc/codecs/rt722-sdca-sdw.c | 10 +++++++++-
 sound/soc/codecs/wm8904.c         |  3 +++
 sound/soc/fsl/fsl_spdif.c         |  2 ++
 11 files changed, 103 insertions(+), 10 deletions(-)

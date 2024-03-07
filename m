Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F08757FF
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 21:13:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F016E84A;
	Thu,  7 Mar 2024 21:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F016E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709842439;
	bh=biNaWl4RaXKCz3drHUoSp8kHXkZh59m+WayWbE0gJxo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o+U0AhBAfU4YMm7z0gqyH0NGPFoDWM9Uo+Vc00+wUgTx9ecL/8iQ0ZgijZWApDHYo
	 Sf4wziIq5HpjKZO5iasXFUcCyzBZH7QwCb/ZsWpIeSj+WDe+jktJxXFHk6Ke20T0Zg
	 96dYpAInoysPiyAlCspLjPlafVqXuutaXzvBZ8Sg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D1DEF805A0; Thu,  7 Mar 2024 21:13:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03E55F805A0;
	Thu,  7 Mar 2024 21:13:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67A21F8024E; Thu,  7 Mar 2024 21:13:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33167F80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 21:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33167F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uxvr9UUg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE59D61CD6;
	Thu,  7 Mar 2024 20:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B02EC433F1;
	Thu,  7 Mar 2024 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709842393;
	bh=biNaWl4RaXKCz3drHUoSp8kHXkZh59m+WayWbE0gJxo=;
	h=From:To:Cc:Subject:Date:From;
	b=Uxvr9UUgJ76Ip9eAAZ4bErsGNkwZ9XEVeFhwuGV6pA4CLjGB0hKF4igs5nkofpJzg
	 h/rFiQLS2aHzLRs+8c1w4dAlkf9+cz610XpD1MFQeMVKmgkaee0ePRkNehWzHQHPcX
	 YFBUX21nBcIMR1qiTLa3tJjcLFrR1wF/gu/O+DMR8fi7HA3SSXMSHVb9DjxyvbXRUZ
	 xu2Ot9YTjQV+mR+Pko2Wdi4MYS0IhZF9MVsFOp1xHehaAGDL13uAYS6UpbTqxukA7A
	 8nwlyQUKhowXCEESdTMIRNPe/3ErgHPdmK4hIKUrtwFkawU9vprtFNmEkO2nuTMzVN
	 p9eOfqIvmWqew==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.8-rc7
Date: Thu, 07 Mar 2024 20:13:02 +0000
Message-Id: <20240307201313.4B02EC433F1@smtp.kernel.org>
Message-ID-Hash: 6WUWD5UODOGYINK7UWAKROA35CTX3XOU
X-Message-ID-Hash: 6WUWD5UODOGYINK7UWAKROA35CTX3XOU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WUWD5UODOGYINK7UWAKROA35CTX3XOU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit ed00a6945dc32462c2d3744a3518d2316da66fcc:

  ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2 (2024-02-28 12:24:59 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc7

for you to fetch changes up to 96e202f8c52ac49452f83317cf3b34cd1ad81e18:

  ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll (2024-03-06 17:44:22 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.8

Some more driver specific fixes for v6.8, plus one new x86 platform
quirk.  All good fixes to have if you have systems that use the relevant
hardware.

----------------------------------------------------------------
Al Raj Hassain (1):
      ASoC: amd: yc: Add HP Pavilion Aero Laptop 13-be2xxx(8BD6) into DMI quirk table

Alban Boyé (1):
      ASoC: Intel: bytcr_rt5640: Add an extra entry for the Chuwi Vi8 tablet

Andreas Pape (1):
      ASoC: rcar: adg: correct TIMSEL setting for SSI9

Rob Herring (1):
      ASoC: dt-bindings: nvidia: Fix 'lge' vendor prefix

Stuart Henderson (4):
      ASoC: madera: Fix typo in madera_set_fll_clks shift value
      ASoC: wm8962: Enable oscillator if selecting WM8962_FLL_OSC
      ASoC: wm8962: Enable both SPKOUTR_ENA and SPKOUTL_ENA in mono mode
      ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll

 .../sound/nvidia,tegra-audio-max9808x.yaml         |  2 +-
 sound/soc/amd/yc/acp6x-mach.c                      |  7 ++++++
 sound/soc/codecs/madera.c                          |  2 +-
 sound/soc/codecs/wm8962.c                          | 29 ++++++++++++++--------
 sound/soc/intel/boards/bytcr_rt5640.c              | 12 +++++++++
 sound/soc/sh/rcar/adg.c                            |  7 ++++++
 6 files changed, 47 insertions(+), 12 deletions(-)

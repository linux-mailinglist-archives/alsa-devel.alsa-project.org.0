Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E622FA15802
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2025 20:14:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1605960497;
	Fri, 17 Jan 2025 20:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1605960497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737141250;
	bh=wJa3BN0G9VfyHearlu1mOi9kinRExzDKa5SlJibHwJw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R3Apu7YIi2hcBaTPrt6jpKbbcf+gF6WgE+O8l5juSA7onVvl2ENWNHzVc73R4Db9q
	 UlNrx7elGPgdxA0lI4JgX6DfTzC1VGhOuleY2UA2JVvBzr1BC2TNsQgwmbSJuyB7jy
	 jsLvncFAM/Ou85xTnd0BGn46wXqOag2Ib0khj6lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83A3EF805BB; Fri, 17 Jan 2025 20:13:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1286DF805B3;
	Fri, 17 Jan 2025 20:13:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0622CF800B6; Fri, 17 Jan 2025 20:13:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3AE6F800C1
	for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2025 20:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3AE6F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=anQlXCEW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 084AC5C6474;
	Fri, 17 Jan 2025 19:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3649C4CEDD;
	Fri, 17 Jan 2025 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737141172;
	bh=wJa3BN0G9VfyHearlu1mOi9kinRExzDKa5SlJibHwJw=;
	h=From:To:Cc:Subject:Date:From;
	b=anQlXCEWQjsB0HxZiSSjxG5MrpVVR8oF7HczLKB9oSymfMFUiSwuJu0SH7J6MnFyl
	 1oClmgoYWQMlpwz5yQQK6+fyS0FmyAZGoAwRPSofbZmK7oRquo1D3v30fiWr9lFi4B
	 6VZ7dZzz3CX2GYNp4L/qbsBx9T3k3hTPJz+uWUoN5UY0Oxq32INDmG3OgSqNNMzOJt
	 m0eTWLhusWPr3X2WPjLEXBkcmk7cDXF8bmYtwf4M+hHDiNfXCJtYEuOxZ7vMMv8wF5
	 Pa/Mb6aHofL9zRt+hZaKLt11xxuGX/x+XDYuYpXDKMAbIPoHF4Sok9iyjK7M1Q+xFb
	 Aigwg5GaLBt6w==
Message-ID: <5636192d519d94773ff137dc403547ef.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.13-rc7
Date: Fri, 17 Jan 2025 19:12:40 +0000
Message-ID-Hash: JSVDKXVAE77ZFJSORY7SKICLXMXGYJBA
X-Message-ID-Hash: JSVDKXVAE77ZFJSORY7SKICLXMXGYJBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JSVDKXVAE77ZFJSORY7SKICLXMXGYJBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 139fa599cea0fd9d38e00246ea9f79af6c59acbd:

  ASoC: rsnd: check rsnd_adg_clk_enable() return value (2025-01-09 13:17:02 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-rc7

for you to fetch changes up to 75a7f7d6e7e10b9052d287be37f965103e1abae1:

  ASoC: Intel: sof_sdw: Fix DMI match entries for a (2025-01-15 19:50:01 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.13

A few final driver specific fixes - a couple of x86 ID field changes,
plus bug fixes for simple-card-utils and nau8824.

----------------------------------------------------------------
Laurentiu Mihalcea (1):
      ASoC: simple-card-utils: fix priv->dai_props indexing

Mark Brown (1):
      ASoC: Intel: sof_sdw: Fix DMI match entries for a

Maxim Kochetkov (1):
      ASoC: codecs: nau8824: fix max volume for Speaker output

Simon Trimmer (2):
      ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
      ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83JX, 83MC and 83NM

 include/sound/simple_card_utils.h     |  7 +++++++
 sound/soc/codecs/nau8824.c            |  8 ++++----
 sound/soc/generic/simple-card-utils.c | 10 +++++-----
 sound/soc/intel/boards/sof_sdw.c      | 23 +++++++++++++++++++----
 4 files changed, 35 insertions(+), 13 deletions(-)

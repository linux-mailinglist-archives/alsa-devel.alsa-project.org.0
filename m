Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D0C9C8C0E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2024 14:47:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 573CD2356;
	Thu, 14 Nov 2024 14:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 573CD2356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731592067;
	bh=ZfHueek9ogXrdJghA92RjqsHXdiZbACaO6z+WiMYEDY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UfbJDNxIbaVUyo1n7TIuSw8em0sOI01pXOLTjVaPrL+Gjotd4s/PXRtLcqZ+4sbgq
	 SAZpyT6CvXO9gp3sA503/wL1f5sHcIPYipUasH2Lpwuix/6tzVxfwe4q9w7/ifDupA
	 5O8VWTvKEQwllKwKi19gDKCZBGRVmPJeyKp16LJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D067AF805BE; Thu, 14 Nov 2024 14:47:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0015F805BD;
	Thu, 14 Nov 2024 14:47:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26F5AF8058C; Thu, 14 Nov 2024 14:47:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B0ACF80587
	for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2024 14:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B0ACF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lPwNooNX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CB98A40EA9;
	Thu, 14 Nov 2024 13:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCA7C4CED4;
	Thu, 14 Nov 2024 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731592025;
	bh=ZfHueek9ogXrdJghA92RjqsHXdiZbACaO6z+WiMYEDY=;
	h=From:To:Cc:Subject:Date:From;
	b=lPwNooNXoS7PrxUbvBetOSp4iZbrgvx5eZlE1NWVcThMuYrdjInWygu8XfR3UswJo
	 g9wfrpuUGtsTtrXX5dQ6hUhsBPURhRUHilggsDI0PSAsZED5+9yGAkbiT3U79sjzmi
	 pYJwoxDwUX1W4eXP5ZXKfQg0A2gRK6ipTZBxpNacWdOOKt+5xh1iAS4325ZE6ZuSx8
	 xHJ8zfBJQBGwgSi+EeLpywHsrlYgj9TjaN7qQxFDJybnUtQmg+8fwYB0tbxf/Je/La
	 43ArnGrxy+tvmpierTgHopPv6OxzfacJnWG3RfOBLU+2V7mLJdlYNxUuwsxTeRA/dz
	 b1Q4li2FXf3tg==
Message-ID: <1a387ebeffba6289a672a48a50de11e3.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.12-rc7
Date: Thu, 14 Nov 2024 13:46:55 +0000
Message-ID-Hash: ADOOGX7GKGWOJWUUKUM4FMLOYSFGVJKW
X-Message-ID-Hash: ADOOGX7GKGWOJWUUKUM4FMLOYSFGVJKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADOOGX7GKGWOJWUUKUM4FMLOYSFGVJKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 48b86532c10128cf50c854a90c2d5b1410f4012d:

  ASoC: SOF: sof-client-probes-ipc4: Set param_size extension bits (2024-11-07 15:35:52 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc7

for you to fetch changes up to 2ae6da569e34e1d26c5275442d17ffd75fd343b3:

  ASoC: max9768: Fix event generation for playback mute (2024-11-12 13:16:37 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.12

Some last updates for v6.12, one quirk plus a couple of fixes.  One is a
minor fix for a relatively obscure driver and the other is a relatively
important fix for boot hangs with some audio graph based cards.

----------------------------------------------------------------
Deep Harsora (1):
      ASoC: intel: sof_sdw: add quirk for Dell SKU

John Watts (1):
      ASoC: audio-graph-card2: Purge absent supplies for device tree nodes

Mark Brown (1):
      ASoC: max9768: Fix event generation for playback mute

 sound/soc/codecs/max9768.c            | 11 +++++++++--
 sound/soc/generic/audio-graph-card2.c |  3 +++
 sound/soc/intel/boards/sof_sdw.c      |  8 ++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

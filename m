Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC69F9290
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2024 13:51:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AC060231;
	Fri, 20 Dec 2024 13:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AC060231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734699101;
	bh=oypJglP/5vnvpthaRRMyFXHo8CBhKIOE+wTvcXdbZI8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Mthw206mAeYTTBKvqAISDnprJQJuqXi9pCMUfiWLiJxxVqgWITGBu0uT4l1G4xkfK
	 vm8LMTl9Wzew7pOw/ooPgaNsnG0kJgi6PeIWsXlgzcrPb1bwtkoppA7Z8lSni/lfNS
	 XKhWO9ol50u8D5bqCJnzngktqNs0i0tizA0/Dnr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97D78F805BA; Fri, 20 Dec 2024 13:51:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37DBEF805C0;
	Fri, 20 Dec 2024 13:51:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBDD9F80508; Fri, 20 Dec 2024 13:50:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39859F80104
	for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2024 13:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39859F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SWEJ3vLb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4C705C4831;
	Fri, 20 Dec 2024 12:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13338C4CECD;
	Fri, 20 Dec 2024 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734699053;
	bh=oypJglP/5vnvpthaRRMyFXHo8CBhKIOE+wTvcXdbZI8=;
	h=From:To:Cc:Subject:Date:From;
	b=SWEJ3vLbRo/hFPVZU95+ARrhocDZoUY8DxkK2KLbrUKyK613nymDwhbJ6GuB+Nng9
	 kXwUDrXgyFov0bgFm9nVym4zPuGk67bho9whDNWxfBUCtlW/t597KnTMgAUg6hIJmB
	 2uJJtKfQItS7NsXdTG333FDMLupwvXNYJKYwNUnoKYF8kjnnZ61abC3Q4CEySU9vYy
	 vVim0cJmJ7U9dkNsgU5/LuHBycdP722d6yOgFCG6WTW06XQ7V2mShh3LCPhEB6jXNN
	 MX/nvhxmRZAABG9WxBaUi2zU80E8cLeGg6cjsW04GzKKh6vOld38N0qDobca6uI9aE
	 kNI9BB2Yly6Qw==
Message-ID: <67e8fb989f3a3f402356388ebf7db4ab.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.13-rc3
Date: Fri, 20 Dec 2024 12:50:43 +0000
Message-ID-Hash: W6AAYK33VY2R54M6WHV3RZFU5QUIT6LD
X-Message-ID-Hash: W6AAYK33VY2R54M6WHV3RZFU5QUIT6LD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W6AAYK33VY2R54M6WHV3RZFU5QUIT6LD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-rc3

for you to fetch changes up to 32c9c06adb5b157ef259233775a063a43746d699:

  ASoC: mediatek: disable buffer pre-allocation (2024-12-19 11:15:09 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.13

A mix of quirks and small fixes, nothing too major anywhere.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      ASoC: dt-bindings: realtek,rt5645: Fix CPVDD voltage comment
      ASoC: mediatek: disable buffer pre-allocation

Mark Brown (1):
      ASoC: Intel: sof_sdw: Update DMI matches for Lenovo

Peter Ujfalusi (1):
      ASoC: SOF: Intel: hda-dai: Do not release the link DMA on STOP

Richard Fitzgerald (2):
      ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
      ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB

Shuming Fan (1):
      ASoC: rt722: add delay time to wait for the calibration procedure

Venkata Prasad Potturu (1):
      ASoC: amd: ps: Fix for enabling DMIC on acp63 platform via _DSD entry

 .../devicetree/bindings/sound/realtek,rt5645.yaml  |  2 +-
 sound/soc/amd/ps/pci-ps.c                          | 17 ++++++++++++++-
 sound/soc/codecs/rt722-sdca.c                      |  7 +++++-
 sound/soc/intel/boards/sof_sdw.c                   | 23 +++++++++++++++++---
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |  4 ++--
 sound/soc/sof/intel/hda-dai.c                      | 25 ++++++++++++++++------
 sound/soc/sof/intel/hda.h                          |  2 --
 7 files changed, 64 insertions(+), 16 deletions(-)

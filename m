Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15398C2414
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 13:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6211852;
	Fri, 10 May 2024 13:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6211852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715342337;
	bh=xbsNxiMgdA1TWDQLSfikjZA+rHU21AXwzosZE+vjAPI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HU0VTMvMoy+gWD+GAiQ4feR2y6s4uL/4z+21cQ0GkIMKSICZL2tX66TJxVAqcmu37
	 YfM1IDuUydZDuB01tkaftM3f1S3WL64fQ+zjgqiWFPfr0/N5HPNKVRz0OnELDXTkZz
	 gvItSMGGCAzx95IwxFpFqwJ7S1DUx3Kd80gNwf5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78395F804F2; Fri, 10 May 2024 13:58:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 975B6F804F2;
	Fri, 10 May 2024 13:58:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 849F0F8049C; Fri, 10 May 2024 13:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E359F8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 13:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E359F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F62ivHQy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9FD2BCE1D99;
	Fri, 10 May 2024 11:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF0DC113CC;
	Fri, 10 May 2024 11:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715342286;
	bh=xbsNxiMgdA1TWDQLSfikjZA+rHU21AXwzosZE+vjAPI=;
	h=From:To:Cc:Subject:Date:From;
	b=F62ivHQyNjfYbsppyLdrD1uFfejaZc/X1K8pseX7DSJhhDyrVq8goRd13oKfxZJhe
	 xNM1taD5UYxL9Xq8jv0liXvf6H2meTPqbL4fIwEBBt12CGBfIyZ47pvksr0TtYwlXJ
	 Vldt0462iFy8PJ1LgmsD/NveTRnYqjk0OJUfNABlpUuWAa2p0zirQ7EVwC/mHrfOZl
	 xqcCKq1fDxQ6zp7OXP2xB+fIn7gBoFAudyc0WiJ7kviO6xU8/fBu+0SSnwapPlaDSE
	 YwLc3lP3JPnKVNav3sN9yyPci2HjQ0fUSI4HBWyuui7nByDu4VEgW6WZjQvb3DxoOn
	 2/m+ixN6iiKkQ==
Message-ID: <5d7330b5bc59eaa0a0ed5d7be3c9a838.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.9-rc7
Date: Fri, 10 May 2024 12:57:58 +0100
Message-ID-Hash: KPIZPEUI6YRCCLJRWUYSUFLCWP2SM2FT
X-Message-ID-Hash: KPIZPEUI6YRCCLJRWUYSUFLCWP2SM2FT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPIZPEUI6YRCCLJRWUYSUFLCWP2SM2FT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit c5782bb5468acf86d8ca8e161267e8d055fb4161:

  ASoC: meson: tdm fixes (2024-04-30 23:36:23 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.9-rc7

for you to fetch changes up to a85ed162f0efcfdd664954414a05d1d560cc95dc:

  ASoC: mediatek: mt8192: fix register configuration for tdm (2024-05-09 17:43:54 +0200)

----------------------------------------------------------------
ASoC: Fixes for v6.9

A few final fixes for v6.9, none of them super major but all real.

----------------------------------------------------------------
Amadeusz Sławiński (1):
      ASoC: Intel: avs: boards: Properly name input device

Hsin-Te Yuan (1):
      ASoC: mediatek: mt8192: fix register configuration for tdm

Vijendar Mukunda (1):
      ASoC: amd: acp: fix for acp platform device creation failure

 sound/soc/amd/acp/acp-legacy-common.c      | 96 +++++++++++++++++++++++++-----
 sound/soc/amd/acp/acp-pci.c                |  9 ++-
 sound/soc/amd/acp/amd.h                    | 10 +++-
 sound/soc/amd/acp/chip_offset_byte.h       |  1 +
 sound/soc/intel/avs/boards/es8336.c        |  2 +-
 sound/soc/intel/avs/boards/nau8825.c       |  2 +-
 sound/soc/intel/avs/boards/rt274.c         |  3 +-
 sound/soc/intel/avs/boards/rt286.c         |  4 +-
 sound/soc/intel/avs/boards/rt298.c         |  4 +-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c |  4 +-
 10 files changed, 105 insertions(+), 30 deletions(-)

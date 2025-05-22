Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF7AC10A0
	for <lists+alsa-devel@lfdr.de>; Thu, 22 May 2025 18:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 555BB601F3;
	Thu, 22 May 2025 18:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 555BB601F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747929777;
	bh=Y9+/4hA1KOG/0ms2NlscRDUpnyMQ/GiYnDaDtBdsN/4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W6eB3aOdxhBNER5QRcqNV8tOpbU50q++4aVn4uXS8CSX4QBrmlCJkp0JcJ448r8FM
	 UJguad2T0mvgCB+ILNsGbgvdJe2d99s+D/WOWpv4zJtAzyzn/FUB8DA0oKrUqdpM0g
	 txzl2/LZavKdTYSiKa111xor2gUNejjjGUy9sXRQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2600F805B5; Thu, 22 May 2025 18:02:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80965F805A1;
	Thu, 22 May 2025 18:02:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C04CBF8056F; Thu, 22 May 2025 18:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02CDAF80549
	for <alsa-devel@alsa-project.org>; Thu, 22 May 2025 18:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02CDAF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F/GvDF4V
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C0406135E;
	Thu, 22 May 2025 16:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4C7C4CEE4;
	Thu, 22 May 2025 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747929733;
	bh=Y9+/4hA1KOG/0ms2NlscRDUpnyMQ/GiYnDaDtBdsN/4=;
	h=From:To:Cc:Subject:Date:From;
	b=F/GvDF4VapwNQvZkNZ+hOJ9sFPhxZNuHSxj2cEgUY9VRHusUbOF+gFU+FzK1LMede
	 jrDwN29djGrBRRJVlXhsrYmslL83hOlJEFgf/f3CTZq7xSllipL4GvzGj0ChCRy68i
	 xrDXJfRKuspmkVaIPPZJFzN1sKWOsDyq49sce65HlHk0MUW/ZrI4hbo1VoVG9YnVH3
	 0tbvnbKd7y9JDF5cgjOY9V9dwkqOYMkMJJujepzNFNBPg9HoGKMQPOyuv8fxs+xy1V
	 nSe0CdLFz5Kgwh0+mAz+ZIRR4Wwn5+cRfrq+qEzOp44Vki/S8qQh9Gdnpq9xTVGp26
	 U+zfuHR7RlZ6g==
Message-ID: <1d61156353cae98c1cbad10afda827b9.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc6
Date: Thu, 22 May 2025 17:02:09 +0100
Message-ID-Hash: IWWWNU6DW3CCWNZQQ7NCCYPV42I3NKY7
X-Message-ID-Hash: IWWWNU6DW3CCWNZQQ7NCCYPV42I3NKY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWWWNU6DW3CCWNZQQ7NCCYPV42I3NKY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc6

for you to fetch changes up to 7dd7f39fce0022b386ef1ea5ffef92ecc7dfc6af:

  ASoC: SOF: Intel: hda: Fix UAF when reloading module (2025-05-14 16:34:48 +0200)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A collection of driver specific fixes that built up over the past few
weeks, plus one core patch which fixes handling of topology files where
some DAI names are substrings of others.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET

Kai Vehmanen (1):
      ASoc: SOF: topology: connect DAI to a single DAI link

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or disabled

Peter Ujfalusi (3):
      ASoC: SOF: ipc4-control: Use SOF_CTRL_CMD_BINARY as numid for bytes_ext
      ASoC: SOF: ipc4-pcm: Delay reporting is only supported for playback direction
      ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+ platforms

Tavian Barnes (1):
      ASoC: SOF: Intel: hda: Fix UAF when reloading module

 sound/soc/mediatek/Kconfig    |  1 +
 sound/soc/sof/intel/hda-bus.c |  2 +-
 sound/soc/sof/intel/hda.c     | 16 +++++++++++++++-
 sound/soc/sof/ipc4-control.c  | 11 ++++++++++-
 sound/soc/sof/ipc4-pcm.c      |  3 ++-
 sound/soc/sof/topology.c      | 18 ++++++++++++++----
 6 files changed, 43 insertions(+), 8 deletions(-)

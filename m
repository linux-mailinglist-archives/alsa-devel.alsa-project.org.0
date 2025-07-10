Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DEBAFFCD4
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jul 2025 10:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 821BD6019B;
	Thu, 10 Jul 2025 10:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 821BD6019B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752137650;
	bh=DW8ZX5jR8T9jfhyWJl3ToBeKvu6TzfqYWQoW2sx+CB8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WvoUeOI+EvkWqYk/D4BNbAuncMkx71QQIR9/M8rPThvfCp6A3pU9PTG7JpT0EOO85
	 yKwYo+hcuKk9FtABc1PL9XJJdofBs4x10jyv7MOSNa9Aqb8WUYQDiVL0xPotxxiGNp
	 wKyhoTotdd8cu3JcZwsIQDJzqKF2opi0T4iZ9agM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80F01F805C7; Thu, 10 Jul 2025 10:53:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E724F805C1;
	Thu, 10 Jul 2025 10:53:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AD45F80526; Thu, 10 Jul 2025 10:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91D04F800FA
	for <alsa-devel@alsa-project.org>; Thu, 10 Jul 2025 10:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91D04F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q8xVEPup
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DDDEA51284;
	Thu, 10 Jul 2025 08:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EFCC4CEE3;
	Thu, 10 Jul 2025 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752137593;
	bh=DW8ZX5jR8T9jfhyWJl3ToBeKvu6TzfqYWQoW2sx+CB8=;
	h=From:To:Cc:Subject:Date:From;
	b=Q8xVEPupMMnVo84wFHlQX92i+oNXrfLOr0pYQobPI+g1Epx98aCN/FnyoMuI7EAs4
	 Usik2iu1R19Ff7uuVSVxTuQgVmiWGHvrNTfzjCFv9wtgS6LGjpU7p4xNMo1ulEe27Z
	 2XiOBARUIOIKDE3qz48U6tl45sjf3WHys1cem1vEAJD3QvEhZVULfRtydpB8oBcjrr
	 hXhKng1grdTUvcRJbw/ceLrN8CRhEsAi7QaGBRJ/0wHUgH4Jy/cAfPyHUOZDgLG8JD
	 VPDzEX1YBfX3e/Jtb+6GPklU3K5+wzJBFxlFq0dNRQXSkD2t+o9cHp7sb/tQGaIdw4
	 SMkXS8JhvOBMA==
Message-ID: <cb13b10edfb1dac2bb7bee3d2f50f44c.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc5
Date: Thu, 10 Jul 2025 09:53:07 +0100
Message-ID-Hash: U5ROHVKYIHRDXTHUAPHLLHQTX5YWPLSV
X-Message-ID-Hash: U5ROHVKYIHRDXTHUAPHLLHQTX5YWPLSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5ROHVKYIHRDXTHUAPHLLHQTX5YWPLSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 3b3312f28ee2d9c386602f8521e419cfc69f4823:

  ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc5

for you to fetch changes up to a609bd74b8680dba62c44f7e6d00d381ddb2d3c0:

  ASoC: Intel: avs: Fix NULL ptr deref on rmmod (2025-07-08 14:54:40 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

Two patches here, one quirk for an AMD system and a fix for an issue on
remove of the AVS driver.

----------------------------------------------------------------
Alexandru Andries (1):
      ASoC: amd: yc: add DMI quirk for ASUS M6501RM

Amadeusz Sławiński (1):
      ASoC: Intel: avs: Fix NULL ptr deref on rmmod

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 sound/soc/intel/avs/pcm.c     | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

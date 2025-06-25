Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F58AE8D13
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jun 2025 20:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D01601F3;
	Wed, 25 Jun 2025 20:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D01601F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750877625;
	bh=KFrLZUtDQLEnS5G5xbCuFRRThYnBBnc2nrs2fs7NnCI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=owXp8+JgV0uuIEXFwakdQZn1Yze3v9DwDRkE3DhE1r28vDlVFkUIlfVrvRx+ivsPa
	 OCh6ZB8KfaLRAt+tl4V3QZJzlJUOfLMYmjOVM9x9R8GUEWMj6QRPidsPqdQ1BjSMZV
	 8xdxkiIvD82x/TX4fwjGWMGK5l7odty3JB+zeM1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23449F805C8; Wed, 25 Jun 2025 20:53:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E43BF805B4;
	Wed, 25 Jun 2025 20:53:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF43BF804FB; Wed, 25 Jun 2025 20:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2B6DF80236
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 20:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B6DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Wv2NFFRm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E5F261151;
	Wed, 25 Jun 2025 18:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6345C4CEEA;
	Wed, 25 Jun 2025 18:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750877584;
	bh=KFrLZUtDQLEnS5G5xbCuFRRThYnBBnc2nrs2fs7NnCI=;
	h=From:To:Cc:Subject:Date:From;
	b=Wv2NFFRmX6ihNpe6I/reHvMwAOFciBLqPYQHgIqqzmUbCoOe1sp5diY8lKnnPpJV2
	 87tEmJksco1Zy53/MLiZtWgPo+PqXsFl1k7ea1XfQFgpNyLOVk+s1IGLOoooIPNp70
	 ZrbAVqfsun+QML5knTDdw+KJ7nNZh9oRiT9O6Bo8tiaIMb0DpG86ailczAU7d2CFRJ
	 jjgTkScE8aYy5lnKpqhDt7D4vEAwtsJsa9V4Q8qLJICOwqgqtaghNPabc90nQING7H
	 5ah4cE88AgCBvrUL/ISR3D5En+dzMZa8eKbNUa/jFOhtAqHE6924ENS82ojKRrE1Ro
	 m1C97HGH9rP8Q==
Message-ID: <053302a805a2cc9f35f96bcf6e29c640.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc3
Date: Wed, 25 Jun 2025 19:52:55 +0100
Message-ID-Hash: SPCZDWC2J453I52T6BBENUCNVWGTJYIN
X-Message-ID-Hash: SPCZDWC2J453I52T6BBENUCNVWGTJYIN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPCZDWC2J453I52T6BBENUCNVWGTJYIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc3

for you to fetch changes up to 6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e:

  ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak. (2025-06-24 16:39:42 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A small collection of fixes, the main one being a fix for resume from
hibernation on AMD systems, plus a few new quirk entries for AMD
systems.

----------------------------------------------------------------
Jack Yu (1):
      ASoC: rt721-sdca: fix boost gain calculation error

Luca Weiss (1):
      ASoC: qcom: sm8250: Fix possibly undefined reference

Oliver Schramm (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15

Tamura Dai (1):
      ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak.

Vijendar Mukunda (1):
      ASoC: amd: ps: fix for soundwire failures during hibernation exit sequence

Yuzuru10 (1):
      ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic

 sound/soc/amd/ps/acp63.h      |  4 ++++
 sound/soc/amd/ps/ps-common.c  | 18 ++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c | 14 ++++++++++++++
 sound/soc/codecs/rt721-sdca.c | 23 +++++++++++++++++++----
 sound/soc/qcom/Kconfig        |  1 +
 sound/soc/sof/intel/hda.c     |  6 +++---
 6 files changed, 59 insertions(+), 7 deletions(-)

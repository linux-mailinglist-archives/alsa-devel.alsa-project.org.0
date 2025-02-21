Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C638A3F437
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2025 13:28:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A052760596;
	Fri, 21 Feb 2025 13:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A052760596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740140920;
	bh=Yyy18qKjq6WWcNNrHiZjhxMlZg0K62qDA8PvIO8C9tE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ElGvqh/SUfYnb3kALV7aepyncEr27uUX2KDmGNwtk/QA92aT/049m1yWCWti+MZZ6
	 nwT9XsOjbqPJUPOwYYlVbkdwzcIQmhjMO+iFUyKvQebUhnWMDqW4x7XWHNQBQjgcY0
	 WDDhygKKq/xqXawKU4X6xWTXdpBmZxbfTP8WPeDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 498A6F805C2; Fri, 21 Feb 2025 13:28:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E8C7F8052E;
	Fri, 21 Feb 2025 13:28:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C560F80424; Fri, 21 Feb 2025 13:27:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 853C8F8001D
	for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2025 13:27:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 853C8F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YJrBYFpr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D74861276;
	Fri, 21 Feb 2025 12:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E876EC4CED6;
	Fri, 21 Feb 2025 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740140847;
	bh=Yyy18qKjq6WWcNNrHiZjhxMlZg0K62qDA8PvIO8C9tE=;
	h=From:To:Cc:Subject:Date:From;
	b=YJrBYFprBetKXhLiDKxhD78rCb6CfzngorK7v6vzZ40DQBJ4IEY6QfDFfWGR6uCI3
	 BjNNMmu2Q3Dgp3J2usV6IF/rnBhByg0lvF80fAU6+/R5B66tNOk0XnceFMADOBuLUQ
	 3nXmdPBBjRsRiw+H9EcCXkICAXL/e7W+LP+G84I8i1P673fbRuTOyq8ZJSfHTCgaBu
	 IA3jvYlG0rok9MaWfmjHVlzLUyMzbwFk2hjHfmFHmxgHHgKCgJqYQP4xYMwwCL7Mh0
	 pth65aVAfhhNt2yBX6C7n6WgGNWtOvDT3bVXv8VGfsk7LDncX0RD8Bzw/g5gfIs1e3
	 oH5bb7r+SE6pQ==
Message-ID: <dfd2c1bf9276c12f021c6474d60d71ee.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc3
Date: Fri, 21 Feb 2025 12:27:18 +0000
Message-ID-Hash: B4ZHHAKN7LBFCCRRWGPCM3U66HE2NPFE
X-Message-ID-Hash: B4ZHHAKN7LBFCCRRWGPCM3U66HE2NPFE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4ZHHAKN7LBFCCRRWGPCM3U66HE2NPFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:

  ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc3

for you to fetch changes up to f5468beeab1b1adfc63c2717b1f29ef3f49a5fab:

  ASoC: tas2764: Set the SDOUT polarity correctly (2025-02-18 20:08:43 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

A few fixes I and James Calligero picked out of the Asahi tree.

----------------------------------------------------------------
Hector Martin (3):
      ASoC: tas2770: Fix volume scale
      ASoC: tas2764: Fix power control mask
      ASoC: tas2764: Set the SDOUT polarity correctly

 sound/soc/codecs/tas2764.c | 10 +++++++++-
 sound/soc/codecs/tas2764.h |  8 +++++++-
 sound/soc/codecs/tas2770.c |  2 +-
 3 files changed, 17 insertions(+), 3 deletions(-)

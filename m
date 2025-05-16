Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 935A9AB9B16
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 13:32:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A85601C9;
	Fri, 16 May 2025 13:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A85601C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747395127;
	bh=Y9+/4hA1KOG/0ms2NlscRDUpnyMQ/GiYnDaDtBdsN/4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FdF++4Ykaia3+Elw8DdbV5/n6grXRXUwb8mRKW+MT5xOOx4MxNdXJwTb5WDKuejTz
	 /TwrStIBfaGrdBRudQlM38BD+EcIUVD8QRagUv2egSPLQ057K0tqKWWMz+Ro2cX1JK
	 ed0MANbxr3cwXhsYkM1FGJ9BfuyPoRAc+nxmZJXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1C59F80525; Fri, 16 May 2025 13:31:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB087F8047D;
	Fri, 16 May 2025 13:31:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCFA9F80134; Fri, 16 May 2025 13:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2775F8003A
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 13:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2775F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LIUjCRh0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A1DD43785;
	Fri, 16 May 2025 11:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056EFC4CEE4;
	Fri, 16 May 2025 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395081;
	bh=Y9+/4hA1KOG/0ms2NlscRDUpnyMQ/GiYnDaDtBdsN/4=;
	h=From:To:Cc:Subject:Date:From;
	b=LIUjCRh0dKOLdPPK8bRcz62ib1CUJFVAIbaCaA4Msa5lrCVWV1eY11KlJc3rs/kVM
	 Ejka68klevScX+KG5MInI/M9/XJhsfOrCGc1iBw+DR0Zz6kO5sn2yqNkM5D1OMloJ5
	 wE5HATqKqvHYZKAAPYG/oaF9u6if3+qvHDFr5k/vo38CdThQ52pY2g1dvXQSdHKZlC
	 PGpQioT7re5H0TkXEUDeevr5VXol++igZiqQQL1og+Pvp+ZtUSeJ2Jwd+ZYRIFvgR5
	 aO3KouznDjuLl0M7X5w2q73I9IIVY9Zehe01JpwAG6W3/BctHQ7ctp36pYJhmdFFzI
	 l4okN8nigJdEQ==
Message-ID: <cd5ce2c2c94d383d4347692c0366dddd.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc6
Date: Fri, 16 May 2025 13:31:12 +0200
Message-ID-Hash: Z6NY7W4JXLMEPSH4Y4PBAYM33KKSTTIK
X-Message-ID-Hash: Z6NY7W4JXLMEPSH4Y4PBAYM33KKSTTIK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6NY7W4JXLMEPSH4Y4PBAYM33KKSTTIK/>
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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E0AC10A6
	for <lists+alsa-devel@lfdr.de>; Thu, 22 May 2025 18:03:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547BC601E3;
	Thu, 22 May 2025 18:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547BC601E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747929789;
	bh=ObGY+IZswRp+VneDFthrG3+EP4qaLpl1wNQEg6px+Iw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oiWw1jmQl7ryHRWkk/kmyD/5+EDJd+EbljOtO8LfqDLWf72xq5MfID/0+Ptd5wiR7
	 SEoy2r3pt+DqCH7r2VfKS62++dmP3patfbLj0Vc5Z6UxeH79PWSau5lM1jN/wmwenj
	 x8F6d6ysuuLdw7SfbE4eSveVovyQ+pGW26GUgF4w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A4DAF805E0; Thu, 22 May 2025 18:02:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07ACCF805DA;
	Thu, 22 May 2025 18:02:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EF40F805C1; Thu, 22 May 2025 18:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BAA5F805A1
	for <alsa-devel@alsa-project.org>; Thu, 22 May 2025 18:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BAA5F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V5ZNwQwT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4983B5C62C8;
	Thu, 22 May 2025 16:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A40C4CEE4;
	Thu, 22 May 2025 16:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747929743;
	bh=ObGY+IZswRp+VneDFthrG3+EP4qaLpl1wNQEg6px+Iw=;
	h=From:To:Cc:Subject:Date:From;
	b=V5ZNwQwTBQsA/QjNzaFZxnzYwNahLcrgM/Bp2rtAUsY5CC/6jkPAbmasuT+kMb/tO
	 PJrf1kzEPvHZe+mfvfyFFi1CHcnJQYaJ6xm4HSnVvulodAufjjv/kgXJDk56K7+r0r
	 1iugsv4zTNFqMCEGqIp81voRJhVjBr/bQxsefoHz4GmVSXehyaaK4OpgMBroFNyoy9
	 MjJt+Au39zajH/TlEKQGKNa1OxNyUtCrpKbZVgAbYU4MVCspBkCEAOLqR2g6VpOqt6
	 2yIf9ZdxVwWZh0/2cPFg8SjT7WDFFGB8cN8zZcs+v2bgQ581Yv+KiIZaLxbl520zP0
	 fYHDnz3R9dE5g==
Message-ID: <2929fef2a55f1eb5ac9befdebe65c18c.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc7
Date: Thu, 22 May 2025 17:02:15 +0100
Message-ID-Hash: ROZMO7FPSZ3BRNEMTGSDPNBJ62DETB3I
X-Message-ID-Hash: ROZMO7FPSZ3BRNEMTGSDPNBJ62DETB3I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROZMO7FPSZ3BRNEMTGSDPNBJ62DETB3I/>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc7

for you to fetch changes up to 688abe2860fd9c644705b9e11cb9649eb891b879:

  ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params() (2025-05-20 10:24:59 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A couple more small fixes for v6.15, both of which could also easily
wait until the merge window.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET

Kai Vehmanen (1):
      ASoc: SOF: topology: connect DAI to a single DAI link

Martin Povišer (1):
      ASoC: apple: mca: Constrain channels according to TDM mask

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or disabled

Peter Ujfalusi (3):
      ASoC: SOF: ipc4-control: Use SOF_CTRL_CMD_BINARY as numid for bytes_ext
      ASoC: SOF: ipc4-pcm: Delay reporting is only supported for playback direction
      ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+ platforms

Tavian Barnes (1):
      ASoC: SOF: Intel: hda: Fix UAF when reloading module

Wentao Liang (1):
      ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()

 sound/soc/apple/mca.c         | 23 +++++++++++++++++++++++
 sound/soc/mediatek/Kconfig    |  1 +
 sound/soc/qcom/sdm845.c       |  4 ++++
 sound/soc/sof/intel/hda-bus.c |  2 +-
 sound/soc/sof/intel/hda.c     | 16 +++++++++++++++-
 sound/soc/sof/ipc4-control.c  | 11 ++++++++++-
 sound/soc/sof/ipc4-pcm.c      |  3 ++-
 sound/soc/sof/topology.c      | 18 ++++++++++++++----
 8 files changed, 70 insertions(+), 8 deletions(-)

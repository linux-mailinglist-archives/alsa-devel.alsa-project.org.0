Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF4868E499
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:49:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C14620B;
	Wed,  8 Feb 2023 00:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C14620B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675813774;
	bh=MSOBHuptKQh+Vis/NZF17skKNEjY1BhRVlPjpCBLRaE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jQaBJpJFXQXt4Ho4jwz0vs3Zj+D7tTpaPpIa3Ufnw9AybjdgnP5IdEUx962U84pPK
	 w58EULRHjkg4bLShXM0WVe6XQKguRDFmt1dj64YWnoftnbStSPS5aaKgoy25lgtySj
	 sOMFlmwoHdyX3vLgf4fv7ed9YoRV+//EP8B70CE0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D559F8010B;
	Wed,  8 Feb 2023 00:48:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5F3AF8012B; Wed,  8 Feb 2023 00:48:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0F8CF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0F8CF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A4AHhf84
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EEE7DB819AA;
	Tue,  7 Feb 2023 16:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216E3C433EF;
	Tue,  7 Feb 2023 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675788201;
	bh=MSOBHuptKQh+Vis/NZF17skKNEjY1BhRVlPjpCBLRaE=;
	h=From:To:Cc:Subject:Date:From;
	b=A4AHhf84pnIOfOt7NPZN/z/IuRYfeHdLwT5eWEX8DI+wc0xQa6Ha+TKxfkBvXiKqT
	 ptmRJEpJAYwC3Ete8GSmEWIm4rBoUFiu+BUR9SBpu44VZTYy6U6TfnEpznEDgcytjD
	 //D1g6bmPw/HObu1/1Qa4SQDnQSe0ERtXG/AYPYgkkiTc6oZhTNPkHiDjV47PbTc2o
	 xF0fXXPbLSq3Tq9XFL1tnngdu4KIokyHqhwz39hNdq1AiCoq1xJu4Sm+5fzHDnfMYu
	 WBlWmZxP0po0YlkN/kO+hGuPkZ/PVlyLiJUEjRbfQJaKgSvedjuhy2sSPo47DSGuQl
	 PBMsd/Chllp4w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.2-rc7
Date: Tue, 07 Feb 2023 16:43:17 +0000
Message-Id: <20230207164321.216E3C433EF@smtp.kernel.org>
Message-ID-Hash: STAPMXIV5IGAVYVMCPVO6D2NPKWHLX5M
X-Message-ID-Hash: STAPMXIV5IGAVYVMCPVO6D2NPKWHLX5M
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STAPMXIV5IGAVYVMCPVO6D2NPKWHLX5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit e18c6da62edc780e4f4f3c9ce07bdacd69505182:

  ASoC: cs42l56: fix DT probe (2023-01-26 17:42:36 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.2-rc7

for you to fetch changes up to c173ee5b2fa6195066674d66d1d7e191010fb1ff:

  ASoC: topology: Return -ENOMEM on memory allocation failure (2023-02-07 14:06:26 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.2

A few more fixes for v6.2, all driver specific and small.  It's larger
than is ideal but we can't really control when people find problems.

----------------------------------------------------------------
Alexey Firago (1):
      ASoC: codecs: es8326: Fix DTS properties reading

Amadeusz Sławiński (1):
      ASoC: topology: Return -ENOMEM on memory allocation failure

Daniel Beer (2):
      ASoC: tas5805m: rework to avoid scheduling while atomic.
      ASoC: tas5805m: add missing page switch.

Jack Yu (1):
      ASoC: rt715-sdca: fix clock stop prepare timeout issue

Mark Brown (1):
      Two bug fixes for tas5805m codec driver

Shengjiu Wang (1):
      ASoC: fsl_sai: fix getting version from VERID

V sujith kumar Reddy (1):
      ASoC: SOF: amd: Fix for handling spurious interrupts from DSP

 sound/soc/codecs/es8326.c         |   6 +-
 sound/soc/codecs/rt715-sdca-sdw.c |   2 +-
 sound/soc/codecs/tas5805m.c       | 131 ++++++++++++++++++++++++++------------
 sound/soc/fsl/fsl_sai.c           |   1 +
 sound/soc/soc-topology.c          |   8 ++-
 sound/soc/sof/amd/acp.c           |  36 +++++------
 6 files changed, 117 insertions(+), 67 deletions(-)

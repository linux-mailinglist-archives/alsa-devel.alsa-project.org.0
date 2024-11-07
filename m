Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC669C119D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 23:22:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B469714DF;
	Thu,  7 Nov 2024 23:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B469714DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731018127;
	bh=a+Ap5XJK/oSs3jcv6DfbCuxz4bmqjeiAZ1ml2aOMWso=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S3yhmkIO951qKYN/pIUL4ztVIDtSULvsV1QjPm4jEodGFxrP12OwbT5iUyEvDA2f3
	 jyD9zPgE6P+LCMf/pBQ9qqAtzCVLQI4o6j5qCOUDy2vvoVkDHbxWegglpVb7yrijYb
	 3vYUnueHGzMVVAbIvkA4h6Xk3ZPb9POcYZwvPUKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA6CDF805BD; Thu,  7 Nov 2024 23:21:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE0CF805A0;
	Thu,  7 Nov 2024 23:21:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBBA7F8013D; Thu,  7 Nov 2024 23:21:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19070F800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2024 23:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19070F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KMuYVBMR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51762A44B4B;
	Thu,  7 Nov 2024 22:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD32C4CECC;
	Thu,  7 Nov 2024 22:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731018087;
	bh=a+Ap5XJK/oSs3jcv6DfbCuxz4bmqjeiAZ1ml2aOMWso=;
	h=From:To:Cc:Subject:Date:From;
	b=KMuYVBMR09ixIIMQbD5x8kr4Egsjdnc99uY6db03Wp1qGn2Qnf0/JLnZuKAMD1r41
	 J9DIHm8KsPfUkfzNC/YR3h4njyd/18eKLdIFa6Tqa5wVR0DzslR8vRavlMH03Y2xmU
	 hCpqkxG0fmfNTijqmQ5eVfVOzyGLZRiwUksWJPzZ6SzV/yq0SuT7HLVdT71b8lRMeZ
	 vnzRBVhOI9Edw+dEs/saCbfKgg0mMedTdzwV/11GoG1xWdaI5Dr78Ke6Vuo4OTsSM3
	 t4KpR94WMtPIMqR6p5pnWOrKvREjaKHvRoEUnd1M4ygSwgW4N4rAN708CfjKFvnbQO
	 XnUuvemiftvpw==
Message-ID: <c47a108a78297aa0534c252420f39a48.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.12-rc6
Date: Thu, 07 Nov 2024 22:21:19 +0000
Message-ID-Hash: FNNKBJNXTC5XMYG7ATKLZYQ4KTW76GCF
X-Message-ID-Hash: FNNKBJNXTC5XMYG7ATKLZYQ4KTW76GCF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNNKBJNXTC5XMYG7ATKLZYQ4KTW76GCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 2db63e92186d7201ee1cb2f5af11757c5e5a1020:

  wcd937x codec fixes (2024-10-29 19:18:48 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc6

for you to fetch changes up to 48b86532c10128cf50c854a90c2d5b1410f4012d:

  ASoC: SOF: sof-client-probes-ipc4: Set param_size extension bits (2024-11-07 15:35:52 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.12

A moderately large pile of small changes here, split fairly evenly
between fixes and ID additions/quirks and all of it driver specific.

----------------------------------------------------------------
Amelie Delaunay (1):
      ASoC: stm32: spdifrx: fix dma channel release in stm32_spdifrx_remove

Jyri Sarha (1):
      ASoC: SOF: sof-client-probes-ipc4: Set param_size extension bits

Kuninori Morimoto (1):
      MAINTAINERS: Generic Sound Card section

Luo Yifan (2):
      ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
      ASoC: stm: Prevent potential division by zero in stm32_sai_get_clk_div()

Markus Petri (1):
      ASoC: amd: yc: Support dmic on another model of Lenovo Thinkpad E14 Gen 6

Mingcong Bai (1):
      ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14 2022

Shenghao Ding (1):
      ASoC: tas2781: Add new driver version for tas2563 & tas2781 qfn chip

Venkata Prasad Potturu (1):
      ASoC: SOF: amd: Fix for incorrect DMA ch status register offset

 MAINTAINERS                            |  9 +++++++++
 sound/soc/amd/yc/acp6x-mach.c          | 14 ++++++++++++++
 sound/soc/codecs/tas2781-fmwlib.c      |  1 +
 sound/soc/sof/amd/acp.c                | 10 +++++++++-
 sound/soc/sof/sof-client-probes-ipc4.c |  1 +
 sound/soc/stm/stm32_sai_sub.c          |  6 +++---
 sound/soc/stm/stm32_spdifrx.c          |  2 +-
 7 files changed, 38 insertions(+), 5 deletions(-)

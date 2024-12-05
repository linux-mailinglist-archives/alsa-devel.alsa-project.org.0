Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F79E5C7A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2024 18:02:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D46A210F;
	Thu,  5 Dec 2024 18:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D46A210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733418177;
	bh=VXBjyptohqf8revAy0owY56QU9CqKlWBy0tw2vLvUS4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nVwTzts8Y2pUMtfCLOV1dFWlKSTFFHjwi7vuqHuj3x5hxcJ6EoGJWeraT0Rufd6BC
	 sdteS6ulonQn1I3wjOLFsdOsruM681N56V8JTCMBs8Hr0UicmfPgQjwqMqOQOGkeMZ
	 XYYrjX0XBDzFZp9an6fV/b3AbqpdMAxUA59KOREc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6796AF805C2; Thu,  5 Dec 2024 18:02:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84498F805AB;
	Thu,  5 Dec 2024 18:02:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2350F8047C; Thu,  5 Dec 2024 18:02:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE062F800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2024 18:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE062F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eCS7e7Im
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA4ECA43839;
	Thu,  5 Dec 2024 17:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1677CC4CED1;
	Thu,  5 Dec 2024 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733418133;
	bh=VXBjyptohqf8revAy0owY56QU9CqKlWBy0tw2vLvUS4=;
	h=From:To:Cc:Subject:Date:From;
	b=eCS7e7Im9N0ppYbWjrWWbKI4/78UXvUzZbrnv57hzGS/QWASc0bVqlfTxBgNEt8Kl
	 ebGhr6WSX3RwHwGU3RVhFJF13RVfqYmuNiMk8cucjxKZkVAfHfiJkqwrMbWfOBcq1f
	 C6lDHJ7SSWlhlmv6Hql3dZG5AwcBK0XvApPm1woU+wm/KgGHJAbImR+KTEk7kCGDbM
	 lYyjgm/4Lj1afDdxys+fzlqdrMtmE/JFWu44KErQPli6zWGsQ5T9t0VQVCYQOuZdgU
	 CiDRWjPdBajBAXBIln3S1SDI8U3Fbmqu4WIqfNT8/6u2X+HToLE0xTtoZ9VV9MNCd2
	 93BWDX2lmlvgA==
Message-ID: <65b45ae5dd84c05f4907ee42725639cc.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.13-rc1
Date: Thu, 05 Dec 2024 17:02:05 +0000
Message-ID-Hash: K3QBYXRYLDOIAOEB2BVP5F7DPYT45G6H
X-Message-ID-Hash: K3QBYXRYLDOIAOEB2BVP5F7DPYT45G6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3QBYXRYLDOIAOEB2BVP5F7DPYT45G6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-rc1

for you to fetch changes up to ec16a3cdf37e507013062f9c4a2067eacdd12b62:

  ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec (2024-12-05 13:39:58 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.13

A few small fixes for v6.13, all system specific - the biggest thing is
the fix for jack handling over suspend on some Intel laptops.

----------------------------------------------------------------
Dan Carpenter (1):
      ASoC: SOF: ipc3-topology: fix resource leaks in sof_ipc3_widget_setup_comp_dai()

Marek Maslanka (1):
      ASoC: Intel: avs: da7219: Remove suspend_pre() and resume_post()

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec

 sound/soc/intel/avs/boards/da7219.c       | 17 -----------------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  4 +---
 sound/soc/sof/ipc3-topology.c             |  7 ++++---
 3 files changed, 5 insertions(+), 23 deletions(-)

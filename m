Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40A9787EA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 20:30:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48804DEC;
	Fri, 13 Sep 2024 20:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48804DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726252253;
	bh=lvXW5hbgyhMSnGX6djFzWEbDJ1nBkcfknynZAGyM9eY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S7puMexCpA8Dp97QjvCfYfNx4q7G1yg3XetfB30ioyXbW/0BF7CkjTGfbEOT0/QY4
	 r3b64vVJvN5Gp6iKpHnXOR7BUu8UUEKe3/P1TiNis+gsg/owFWZ8L1JFohiI87Mbvc
	 9uRKYR8UCxaE1DxQ+yjG6kP8Ibumwu5bM/os56pI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60FBFF80536; Fri, 13 Sep 2024 20:30:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D62F805B0;
	Fri, 13 Sep 2024 20:30:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC274F801F5; Fri, 13 Sep 2024 20:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8779F800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 20:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8779F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mtiEd364
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B31895C59D8;
	Fri, 13 Sep 2024 18:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC25C4CEC0;
	Fri, 13 Sep 2024 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726252212;
	bh=lvXW5hbgyhMSnGX6djFzWEbDJ1nBkcfknynZAGyM9eY=;
	h=From:To:Cc:Subject:Date:From;
	b=mtiEd364coZkGvN+c7mg4unk1I0U1TWPcveRut30hQ3l9j4A7dIDLia9vJbcwPmMd
	 NStELNo6wfW9tfHU5ay+BXsHcfRiTluD1j/DBuFpY1VpR4QaprofNm2+TKF9bKeyOp
	 5UjvPTEGvDEPW3SK7HzEi/kpWuOx6AZqqxb3muaTSmqgdE7hOK8NgzZtCScRXOncZG
	 mRJsp+JjagEIO8rdFGo6mWUxEpXcVC//bDNt20An02RbBOp5AbDnk6M51i0fr1qocG
	 9f4Ho2RPMYlc730du5BhUyZEULCXd4QVYbxlvm3B5C0BbWhdyI/7aW7+ifPkLYkxub
	 lb+gjrC1u5jEA==
Message-ID: <11c4a6a78809a2fc6e43efb232fd6e7e.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.11-rc7
Date: Fri, 13 Sep 2024 19:30:01 +0100
Message-ID-Hash: AVJMYAZFA5PHV3WW66NAJU2NHDXO53LG
X-Message-ID-Hash: AVJMYAZFA5PHV3WW66NAJU2NHDXO53LG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVJMYAZFA5PHV3WW66NAJU2NHDXO53LG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 77212f300bfd6fb3edaabd1daf863cabb521854a:

  ASoC: codecs: lpass-va-macro: set the default codec version for sm8250 (2024-08-30 13:54:24 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-rc7

for you to fetch changes up to 4f9a71435953f941969a4f017e2357db62d85a86:

  ASoC: meson: axg-card: fix 'use-after-free' (2024-09-11 16:16:34 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.11

A few last minute fixes, plus an update for Pierre's contact details and
status.  It'd be good to get these into v6.11 (especially the
MAINTAINERS update) but it wouldn't be the end of the world if they
waited for the merge window, none of them are super remarkable and it's
just a question of timing that they're last minute.

----------------------------------------------------------------
Arseniy Krasnov (1):
      ASoC: meson: axg-card: fix 'use-after-free'

Bard Liao (2):
      ASoC: Intel: soc-acpi-intel-lnl-match: add missing empty item
      ASoC: Intel: soc-acpi-intel-mtl-match: add missing empty item

Pierre-Louis Bossart (1):
      MAINTAINERS: update Pierre Bossart's email and role

Shenghao Ding (1):
      ASoC: tas2781: fix to save the dsp bin file name into the correct array in case name_prefix is not NULL

Su Hui (1):
      ASoC: codecs: avoid possible garbage value in peb2466_reg_read()

 .mailmap                                          | 1 +
 MAINTAINERS                                       | 6 +++---
 sound/soc/codecs/peb2466.c                        | 3 ++-
 sound/soc/codecs/tas2781-i2c.c                    | 2 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 1 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 1 +
 sound/soc/meson/axg-card.c                        | 3 ++-
 7 files changed, 11 insertions(+), 6 deletions(-)

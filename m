Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 577009EE76B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2024 14:09:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324DF31E;
	Thu, 12 Dec 2024 14:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324DF31E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734008943;
	bh=KfLyTWdubs+Koc3W6OC5MFxNXOQCKOQq35pnYvjhC0A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Qoc4PpFq2a4fkmED3HARwK1JvFSggii/rPcu+bhwCFH5ZEIK2O6VgT3BgpVBTDoXL
	 N1SYKnMrJTT6m46wDZngboFYUnLpUps7/6WgfwR4bI38lqc+yh4lppxRXVAlr2krEn
	 4iQl8PbivV1WL/L8cUS84hH4uB7QVdxfNJNnlhmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55CB4F805BF; Thu, 12 Dec 2024 14:08:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C39AF8025A;
	Thu, 12 Dec 2024 14:08:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B861F802BE; Thu, 12 Dec 2024 14:08:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2740F8012B
	for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2024 14:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2740F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DExoEUW7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 449EB5C5B7A;
	Thu, 12 Dec 2024 13:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01749C4CECE;
	Thu, 12 Dec 2024 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734008890;
	bh=KfLyTWdubs+Koc3W6OC5MFxNXOQCKOQq35pnYvjhC0A=;
	h=From:To:Cc:Subject:Date:From;
	b=DExoEUW7vrYeUH2TAlXYQQmi1bHT43WB019dh+YItiJVTBMFVAjh8zMDJakdPKJGh
	 ysti5T5d4O8fj+RZaLtuGBB8ADYjmoJptO7BSG79KrcE5muocMexyw/qtH0rqs8RXw
	 Dvsw5lhfPMvzp2MZ/MfObnjIFTOzWBg/E4MiBU/4QRbTYHqpGjPvz/Z8fdPbelyk+X
	 OwG1on6YCAu0ajDPOcttksNSmoBOEzcRdPz7I3lRrSmICVq3uU+KAQ5OAJgZEB0egF
	 K8a8fCQAiUwgMY6ize3JbxG30DWPW8Jii/mJBdBfs8dPhEdRYu0xrhFzXGy9WmgmKh
	 L85K4toxrCbsg==
Message-ID: <66e632c08f0370075bb18692c9fb1c17.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.12-rc2
Date: Thu, 12 Dec 2024 13:08:00 +0000
Message-ID-Hash: TBK6UYHRDJ6R7XFEAARUXCCRAF5PZLYU
X-Message-ID-Hash: TBK6UYHRDJ6R7XFEAARUXCCRAF5PZLYU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBK6UYHRDJ6R7XFEAARUXCCRAF5PZLYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc2

for you to fetch changes up to 255cc582e6e16191a20d54bcdbca6c91d3e90c5e:

  ASoC: Intel: sof_sdw: Add space for a terminator into DAIs array (2024-12-12 11:08:49 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.13

A small pile of driver specific fixes, all quite small and not
particularly major.

----------------------------------------------------------------
Charles Keepax (1):
      ASoC: Intel: sof_sdw: Add space for a terminator into DAIs array

Shenghao Ding (1):
      ASoC: tas2781: Fix calibration issue in stress test

Shengjiu Wang (2):
      ASoC: fsl_xcvr: change IFACE_PCM to IFACE_MIXER
      ASoC: fsl_spdif: change IFACE_PCM to IFACE_MIXER

Stephen Gordon (1):
      ASoC: audio-graph-card: Call of_node_put() on correct node

Venkata Prasad Potturu (1):
      ASoC: amd: yc: Fix the wrong return value

 sound/soc/amd/yc/acp6x-mach.c         | 13 +++++++++----
 sound/soc/codecs/tas2781-i2c.c        |  2 +-
 sound/soc/fsl/fsl_spdif.c             |  2 +-
 sound/soc/fsl/fsl_xcvr.c              |  2 +-
 sound/soc/generic/audio-graph-card2.c |  2 +-
 sound/soc/intel/boards/sof_sdw.c      |  8 ++++++--
 6 files changed, 19 insertions(+), 10 deletions(-)

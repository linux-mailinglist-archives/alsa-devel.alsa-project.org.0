Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FF953FE51
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 14:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63A2D18DC;
	Tue,  7 Jun 2022 14:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63A2D18DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654603674;
	bh=dSyPPNCyV0f1vJgl+LO8qJa7ejs07+WoZqP/OYetwx4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bsgfBBEe4nWrX1AKM4YorrdX0bVH4hef1uHwY5oJoI7ymhWLXzjrIf6ivJvw5J5A2
	 V7kk/jYYDzyvDCKrpqW7DDI+kdG+QvYIYxzLxR8D+EfClPdL0LguPgsFd2uA8Tua5x
	 2ozs1JQBFkACb2s0RG3BIWS55MYMAARS+HMEyHpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F24D4F80116;
	Tue,  7 Jun 2022 14:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6434BF80159; Tue,  7 Jun 2022 14:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 128F7F80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 14:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 128F7F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UFb5CxQ8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F0532B81F41;
 Tue,  7 Jun 2022 12:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943D0C341C4;
 Tue,  7 Jun 2022 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654603609;
 bh=dSyPPNCyV0f1vJgl+LO8qJa7ejs07+WoZqP/OYetwx4=;
 h=From:To:Cc:Subject:Date:From;
 b=UFb5CxQ8qwpIP6gPXBUHliNiiFTl59Ab/jFBFUjswH6IK+0v/EGBUX9pKrjj/dpcc
 ehmBFwdWdzeA6C0mL/ZS1OyKGF/i4CmpFRKVKKN4E0UrYpHiFpSqBwCJvj/Yp/+7Y1
 HI/Jnfcyu3WYGNuv3tLcgKA7IXKqSz6pdMwuuxWSyRp/gDa6NWqCmdP1LWcCwjJ8uX
 QOXGRkMq904pP0nXoONghe/2Kt16g3R+sMc2w6MTPweIrX5nNlR25Gt0rZ0xMwe3sc
 HVYJ7K2Y9CYTA3m1CJQxaot9Gc1rHLofPHKILxgtcjMzwUnwzLQpy4xQGwseImVN2P
 g/8VXWliHSlkg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.19-rc1
Date: Tue, 07 Jun 2022 13:06:41 +0100
Message-Id: <20220607120649.943D0C341C4@smtp.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The following changes since commit ab0925ab728163b854ea17da09e299254a86076e:

  ASoC: da7219: Small fixes for jack detection and removal (2022-05-31 10:16:59 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.19-rc1

for you to fetch changes up to 2abdf9f80019e8244d3806ed0e1c9f725e50b452:

  ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put() (2022-06-06 12:31:28 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.19

A few more fixes for v5.19 which came in during the second half of the
merge window, again nothing that's really remarkable outside of the
individual drivers.

----------------------------------------------------------------
Adam Ford (1):
      ASoC: wm8962: Fix suspend while playing music

Amadeusz Sławiński (1):
      ASoC: SOF: Fix potential NULL pointer dereference

Charles Keepax (6):
      ASoC: cs42l52: Fix TLV scales for mixer controls
      ASoC: cs35l36: Update digital volume TLV
      ASoC: cs53l30: Correct number of volume levels on SX controls
      ASoC: cs42l52: Correct TLV for Bypass Volume
      ASoC: cs42l56: Correct typo in minimum level for SX volume controls
      ASoC: cs42l51: Correct minimum value for SX volume control

Dan Carpenter (2):
      ASoC: SOF: ipc-msg-injector: Propagate write errors correctly
      ASoC: SOF: ipc-msg-injector: Fix reversed if statement

Hui Wang (1):
      ASoC: nau8822: Add operation for internal PLL off and on

Mark Brown (3):
      ASoC: Fixup Cirrus SX control usage
      ASoC: es8328: Fix event generation for deemphasis control
      ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()

Shengjiu Wang (1):
      ASoC: fsl_sai: Add support for i.MX8MN

Srinivasa Rao Mandadapu (1):
      ASoC: qcom: lpass-platform: Update VMA access permissions in mmap callback

xliu (1):
      ASoC: Intel: cirrus-common: fix incorrect channel mapping

 sound/soc/codecs/cs35l36.c                  |  3 ++-
 sound/soc/codecs/cs42l51.c                  |  2 +-
 sound/soc/codecs/cs42l52.c                  |  8 +++---
 sound/soc/codecs/cs42l56.c                  |  4 +--
 sound/soc/codecs/cs53l30.c                  | 16 ++++++------
 sound/soc/codecs/es8328.c                   |  5 +++-
 sound/soc/codecs/nau8822.c                  |  4 +++
 sound/soc/codecs/nau8822.h                  |  3 +++
 sound/soc/codecs/wm8962.c                   |  1 +
 sound/soc/codecs/wm_adsp.c                  |  2 +-
 sound/soc/fsl/fsl_sai.c                     |  1 +
 sound/soc/intel/boards/sof_cirrus_common.c  | 40 ++++++++++++++++++++++++++---
 sound/soc/qcom/lpass-platform.c             |  2 +-
 sound/soc/sof/sof-audio.c                   |  2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c | 28 +++++++++++---------
 15 files changed, 86 insertions(+), 35 deletions(-)

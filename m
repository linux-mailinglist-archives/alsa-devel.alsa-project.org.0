Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7EC539F05
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 10:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89DE018B4;
	Wed,  1 Jun 2022 10:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89DE018B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654070909;
	bh=EaZqSF5I1IddM5rsTjkjGynR2TyB99MYtFsWehvJhpY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BqXpEc5A2FO1ku9TH6iCeCJIcutguPd+GCloRY0esgiMJIn3xL1RcWme4DBCnnTG5
	 lehxZuEWMyH4m2jUGAlyi3pVTRL5QhjdxWmNANntUTf2eDSkg7EzvgIhL1+mPpFBKo
	 o5PtKIYCWqyBEiAtub1B3PEVFo4/LyaKpP2vS08g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF915F8025A;
	Wed,  1 Jun 2022 10:07:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85BA8F80238; Wed,  1 Jun 2022 10:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4855F80089
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 10:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4855F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lYORk5be"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F8516142D;
 Wed,  1 Jun 2022 08:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39755C385A5;
 Wed,  1 Jun 2022 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654070840;
 bh=EaZqSF5I1IddM5rsTjkjGynR2TyB99MYtFsWehvJhpY=;
 h=From:To:Cc:Subject:Date:From;
 b=lYORk5bepxaBZtRe/Y8qamTidV1sERWvxCSspvDF5qT2mj0pzjgh7Lbbi42QU3z9l
 0tRBc0fFl/4QsCTGveRTcHR79dz1JFDOTLmwZwngTnpsEOCcGPFFve5FpBBpspLLO2
 pdKMU9ye/A76sI+6vMnpB4FfyQVghFRca996xCWgqRyEc8+PJdXzp2DNmt7l65Tu7X
 5dbuFn3JOPQg3dcI4PxaHe7FjPhc7baFmvVQTVLTw8hNj0Xh5Cw4czAHIr/RzaDqeO
 0PXr2/e3vBAp8n0NurgpV6+eNdvthDaFkmazEX1zoZda9O6Mu6AH9TDNHQsBHmERaJ
 /OIE0W8asiU8Q==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.19-rc0
Date: Wed, 01 Jun 2022 10:07:02 +0200
Message-Id: <20220601080720.39755C385A5@smtp.kernel.org>
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

The following changes since commit e5cd20e0d6713138444cc3f3f982712cf9a36143:

  ASoC: SOF: Introduce generic (in)firmware tracing infrastructure (2022-05-20 14:56:35 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.19-rc0

for you to fetch changes up to ab0925ab728163b854ea17da09e299254a86076e:

  ASoC: da7219: Small fixes for jack detection and removal (2022-05-31 10:16:59 +0200)

----------------------------------------------------------------
ASoC: Fixes for v5.19

A few more fixes that came in during the merge window - nothing
huge here, there is one core fix for DPCM from Pierre but mostly
driver changes.

----------------------------------------------------------------
Adam Thomson (2):
      ASoC: da7219: Fix pole orientation detection on certain headsets
      ASoC: da7219: cancel AAD related work earlier for jack removal

David Lin (1):
      ASoC: Intel: common: fix typo for tplg naming

Mark Brown (1):
      ASoC: da7219: Small fixes for jack detection and removal

Oder Chiou (1):
      ASoC: rt5640: Do not manipulate pin "Platform Clock" if the "Platform Clock" is not in the DAPM

Pierre-Louis Bossart (1):
      ASoC: soc-pcm: fix BE transition for TRIGGER_START

Shengjiu Wang (1):
      ASoC: fsl_sai: Fix FSL_SAI_xDR/xFR definition

Syed Saba kareem (1):
      ASoC: SOF: amd: Fixed Build error

Uwe Kleine-König (1):
      ASoC: Intel: avs: Fix build error on arc, m68k and sparc

 sound/soc/amd/acp/acp-pci.c                       |  1 +
 sound/soc/codecs/da7219-aad.c                     | 18 +++++++++++++++---
 sound/soc/codecs/rt5640.c                         | 11 +++++++++--
 sound/soc/codecs/rt5640.h                         |  2 ++
 sound/soc/fsl/fsl_sai.h                           |  4 ++--
 sound/soc/intel/avs/board_selection.c             |  3 ++-
 sound/soc/intel/boards/bytcr_rt5640.c             |  2 ++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c |  2 +-
 sound/soc/soc-pcm.c                               |  2 --
 9 files changed, 34 insertions(+), 11 deletions(-)
